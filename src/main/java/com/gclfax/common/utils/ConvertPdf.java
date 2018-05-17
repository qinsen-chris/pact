package com.gclfax.common.utils;

import fr.opensagres.xdocreport.itext.extension.font.ITextFontRegistry;
import org.apache.poi.xwpf.converter.pdf.PdfConverter;
import org.apache.poi.xwpf.converter.pdf.PdfOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

import java.io.*;


public class ConvertPdf {

	private static Logger LOGGER = LoggerFactory.getLogger(ConvertPdf.class);

	@Value("${gclfax.pactPath}")
	private String pactPath;

	/**
     * 把docx文件转换成pdf文件
	 * @param docxFilePath
	 * @param pdfFilePath
	 * @throws Exception
	 */
	public static void convertPdf(String docxFilePath,String pdfFilePath) throws Exception{
		File docxFile=new File(docxFilePath);
		File pdfFile=new File(pdfFilePath);
		
		//转换pdf文件
		if(docxFile.exists()){
			if(pdfFile.exists()){
				pdfFile.delete();
			}
			InputStream inStream=new FileInputStream(docxFilePath);

			XWPFDocument document = new XWPFDocument(inStream);

			//HWPFDocument document = new HWPFDocument(inStream);
			OutputStream out = new FileOutputStream(pdfFilePath);
			PdfOptions options = PdfOptions.create();
			ITextFontRegistry fontProvider=ITextFontRegistry.getRegistry();
			options.fontProvider(fontProvider);
			PdfConverter.getInstance().convert(document, out, options);
		}else{
			throw new RuntimeException("docx不存在");
		}

	}

	/**
	 * 把XWPFDocument数据转换成pdf文件
	 * @param document
	 * @param targetPath
	 * @param targetFileName
	 * @throws Exception
	 */
	public static void convertPdfByXWPF(XWPFDocument document,String targetPath,String targetFileName) throws Exception{
		LOGGER.info("XWPFDocument数据转换成pdf文件开始--------------------------------------FileName："+targetFileName);
		File pdfFile=new File(targetPath+targetFileName);
		// 检测是否存在目录
		if (!pdfFile.getParentFile().exists()) {
			pdfFile.getParentFile().mkdirs();
		}

		//转换pdf文件
		if(pdfFile.exists()) {
			pdfFile.delete();
		}

		OutputStream out = new FileOutputStream(targetPath+targetFileName);
		PdfOptions options = PdfOptions.create();
/*			ITextFontRegistry fontProvider=ITextFontRegistry.getRegistry();
		options.fontProvider(fontProvider);*/
		//options.fontEncoding("iso-8859-1");

/*			//BaseFont font = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);
		BaseFont font = BaseFont.createFont("/SIMYOU.TTF", BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);
		BaseFont bf=BaseFont.createFont("字体",BaseFont.CP1250, BaseFont.EMBEDDED);
		options.fontEncoding(bf.getEncoding());*/

		/*String pactFontpath="/alidata1/runtime/data_cg/data_pact"+ "/fonts";
		LOGGER.info("footer 字体目录:{} ",pactFontpath);
		BaseFont bf= BaseFont.createFont(pactFontpath+"/simsun.ttc,1", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);*/

		LOGGER.info("PdfOptions设置的字体为默认 ");

		PdfConverter.getInstance().convert(document, out, options);

	}

}