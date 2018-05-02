package com.gclfax.common.utils;

import org.apache.poi.xwpf.converter.core.FileImageExtractor;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
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
        Iterator<XWPFParagraph> iterator = doc.getParagraphsIterator();
        XWPFParagraph para;
        while (iterator.hasNext()) {
            para = iterator.next();
            replaceInPara(para, params);
        }
    }

    /**
     * 替换段落里面的变量
     * @param para 要替换的段落
     * @param params 参数
     */
    private static void replaceInPara(XWPFParagraph para, Map<String, Object> params) {
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
                        runText = matcher.replaceFirst(String.valueOf(params.get(matcher.group(1))));
                    }
                    //直接调用XWPFRun的setText()方法设置文本时，在底层会重新创建一个XWPFRun，把文本附加在当前文本后面，
                    //所以我们不能直接设值，需要先删除当前run,然后再自己手动插入一个新的run。
                    para.removeRun(i);
                    para.insertNewRun(i).setText(runText);
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
