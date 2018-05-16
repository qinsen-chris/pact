package com.gclfax.common.utils;

import org.apache.poi.xwpf.converter.core.FileImageExtractor;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 替换word模板中的内容，并输出word和html格式的文件
 */
public class ReplaceAndToHtmlUtils {

    private static Logger LOGGER = LoggerFactory.getLogger(ReplaceAndToHtmlUtils.class);
    /**
     * 替换word模板中的内容，并输出到目标文件中
     * @param sourceFile  源文件
     * @param targetPath  目标文件路径已/结尾
     * @param targetFileName 目标文件名称
     * @param params 替换参数
     */
    public static void replaceWordByParam(String sourceFile,String targetPath,String targetFileName,Map<String, Object> params){
        InputStream is = null;
        try {
            is = new FileInputStream(sourceFile);

            XWPFDocument doc = new XWPFDocument(is);
            //替换段落里面的变量
            replaceInPara(doc, params);
            //替换表格里面的变量
            replaceInTable(doc, params);
            OutputStream os = new FileOutputStream(targetPath+targetFileName);
            doc.write(os);
            close(os);
            close(is);
        } catch (IOException e) {
            LOGGER.error("替换参数生成word异常",e);
        }
    }

    /**
     * 替换word模板中的内容，并转为html格式
     * @param sourcePath  模板文件
     * @param targetPath  目标路径
     * @param targetFileName 目标文件名
     * @param params 替换参数
     */
    public static void replaceAndToHtml(String sourcePath,String targetPath,String targetFileName,Map<String, Object> params){
        InputStream is = null;
        try {
            is = new FileInputStream(sourcePath);

            XWPFDocument doc = new XWPFDocument(is);
            //替换段落里面的变量
            replaceInPara(doc, params);
            //替换表格里面的变量
            replaceInTable(doc, params);

            wordToHtml(doc,targetPath,targetFileName);

            close(is);
        } catch (IOException e) {
            LOGGER.error("替换参数生成Html异常",e);
        }
    }

    /**
     * 替换word模板中的内容，并转为pdf格式
     * @param sourcePath  模板文件
     * @param targetPath  目标路径
     * @param targetFileName 目标文件名
     * @param params 替换参数
     */
    public static void replaceAndToPdf(String sourcePath,String targetPath,String targetFileName,Map<String, Object> params) throws Exception {
        InputStream is = null;
        try {
            is = new FileInputStream(sourcePath);

            XWPFDocument doc = new XWPFDocument(is);
            //替换段落里面的变量
            replaceInPara(doc, params);
            //替换表格里面的变量
            replaceInTable(doc, params);

            ConvertPdf.convertPdfByXWPF(doc,targetPath,targetFileName);

            close(is);
        }  catch (Exception e) {
            LOGGER.error("替换参数生成pdf异常",e);
            throw new Exception("替换参数生成pdf异常!");
        }
    }

    /**
     *  只处理.docx版本的文件
     * word2007和word2003的构建方式不同，
     * 前者的构建方式是xml，后者的构建方式是dom树。文件的后缀也不同，前者后缀为.docx，后者后缀为.doc。相应的，apache.poi提供了不同的实现类。
     * @param document
     * @param targetPath
     * @param targetFileName
     * @throws IOException
     */
    public static void wordToHtml(XWPFDocument document,String targetPath,String targetFileName) throws IOException{
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        final String imageUrl = "";

        XHTMLOptions options = XHTMLOptions.create();
        options.setExtractor(new FileImageExtractor(new File(targetPath + imageUrl)));
        options.setIgnoreStylesIfUnused(false);
        options.setFragment(true);

        XHTMLConverter.getInstance().convert(document, out, options);

        out.close();
        writeFile(new String(out.toByteArray()), targetPath+targetFileName);
    }

    public static void writeFile(String content, String path) {
        FileOutputStream fos = null;
        BufferedWriter bw = null;
        try {
            File file = new File(path);
            if(!file.exists()){

            }
            fos = new FileOutputStream(file);
            bw = new BufferedWriter(new OutputStreamWriter(fos));
            bw.write(content);
        } catch (FileNotFoundException fnfe) {
            fnfe.printStackTrace();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        } finally {
            try {
                if (bw != null)
                    bw.close();
                if (fos != null)
                    fos.close();
            } catch (IOException ie) {
            }
        }
    }

    /**
     * 替换段落里面的变量
     * @param doc 要替换的文档
     * @param params 参数
     */
    private static void replaceInPara(XWPFDocument doc, Map<String, Object> params) {
        LOGGER.info("开始替换段落里面的内容！params：" + params.toString());
        Iterator<XWPFParagraph> iterator = doc.getParagraphsIterator();
        XWPFParagraph para;
        while (iterator.hasNext()) {
            para = iterator.next();
            replaceInPara(para, params);
        }
    }


    /**
     * 把XWPFParagraph中存在问题的XWPFRun，合并成正确的XWPFRun，然后在进行替换操作
     * @param para 要替换的段落
     * @param params 参数
     */
    private static void replaceInPara(XWPFParagraph para, Map<String, Object> params) {
        List<XWPFRun> runs;
        Matcher matcher;

        if (matcher(para.getParagraphText()).find()) {
            runs = para.getRuns();

            List<Integer> startCursorList = new ArrayList<Integer>();
            List<StringBuffer> sbList = new ArrayList<StringBuffer>();
            for (int i=0; i<runs.size(); i++) {
                XWPFRun run = runs.get(i);
                String runText = run.toString();
                //如果检测到"${" ，说明被分割，把之后相邻的3个拼接起来
                if(runText.equals("${")){
                    StringBuffer sb = new StringBuffer();
                    sb.append(runs.get(i).toString())
                            .append(runs.get(i+1).toString())
                            .append(runs.get(i+2).toString());
                    startCursorList.add(i);
                    sbList.add(sb);
                    i = i+2;
                }
            }

            //循环删除当前下标,并插入一个新的XWPFRun
            if(startCursorList.size() >0 ){
                for (int i=0;i<startCursorList.size();i++){
                    //删除当前段落第二个变量的时候，数组下标要-2.（上一个变量删除了3个，插入了一个）
                    if(i>0){
                        for (int j=0;j<3;j++){
                            para.removeRun(startCursorList.get(i)-2);
                        }
                        para.insertNewRun(startCursorList.get(i)-2).setText(sbList.get(i).toString());
                        continue;
                    }
                    //第一次的时候，
                    //循环删除3次，同一个位置的XWPFRun
                    for (int j=0;j<3;j++){
                        para.removeRun(startCursorList.get(i));
                    }
                    para.insertNewRun(startCursorList.get(i)).setText(sbList.get(i).toString());
                }
            }

            //重新开始循环para.getRuns()
            runs = para.getRuns();
            for (int i=0; i<runs.size(); i++) {
                XWPFRun run = runs.get(i);
                String runText = run.toString();
                matcher = matcher(runText);
                if (matcher.find()) {
                    while ((matcher = matcher(runText)).find()) {
                        LOGGER.info("匹配到一段文本XWPFRun。 runText："+runText);
                        runText = matcher.replaceFirst(String.valueOf(params.get(matcher.group(1))));
                    }
                    para.removeRun(i);
                    XWPFRun newRun = para.insertNewRun(i);
                    newRun.setFontFamily("宋体");
                    newRun.setText(runText);
                    /*runs.get(i).setText(runText, 0);*/
                }
            }

        }
    }

    private static void replaceInPara_bak(XWPFParagraph para, Map<String, Object> params) {
        List<XWPFRun> runs;
        Matcher matcher;
        if (matcher(para.getParagraphText()).find()) {
            runs = para.getRuns();
            for (int i=0; i<runs.size(); i++) {
                XWPFRun run = runs.get(i);
                String runText = run.toString();
                matcher = matcher(runText);
                if (matcher.find()) {
                    while ((matcher = matcher(runText)).find()) {
                        LOGGER.info("匹配到一段文本XWPFRun。 runText："+runText);
                        runText = matcher.replaceFirst(String.valueOf(params.get(matcher.group(1))));
                    }
                    para.removeRun(i);
                    para.insertNewRun(i).setText(runText);
                    /*runs.get(i).setText(runText, 0);*/
                }
            }
        }
    }

    /**
     * 替换表格里面的变量
     * @param doc 要替换的文档
     * @param params 参数
     */
    private static void replaceInTable(XWPFDocument doc, Map<String, Object> params) {
        LOGGER.info("开始替换表格里面的内容！params：" + params.toString());
        Iterator<XWPFTable> iterator = doc.getTablesIterator();
        XWPFTable table;
        List<XWPFTableRow> rows;
        List<XWPFTableCell> cells;
        List<XWPFParagraph> paras;
        while (iterator.hasNext()) {
            table = iterator.next();
            rows = table.getRows();
            for (XWPFTableRow row : rows) {
                cells = row.getTableCells();
                for (XWPFTableCell cell : cells) {
                    paras = cell.getParagraphs();
                    for (XWPFParagraph para : paras) {
                        replaceInPara(para, params);
                    }
                }
            }
        }
    }

    /**
     * 正则匹配字符串
     * @param str
     * @return
     */
    private static Matcher matcher(String str) {
        Pattern pattern = Pattern.compile("\\$\\{(.+?)\\}", Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(str);
        return matcher;
    }

    /**
     * 关闭输入流
     * @param is
     */
    private static void close(InputStream is) {
        if (is != null) {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 关闭输出流
     * @param os
     */
    private static void close(OutputStream os) {
        if (os != null) {
            try {
                os.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
