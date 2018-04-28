package com.gclfax.common.utils;

import fr.opensagres.xdocreport.itext.extension.font.ITextFontRegistry;
import org.apache.poi.xwpf.converter.pdf.PdfConverter;
import org.apache.poi.xwpf.converter.pdf.PdfOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

import java.io.*;

public class ConvertPdf {

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
			if(!pdfFile.exists()){
				InputStream inStream=new FileInputStream(docxFilePath);

				XWPFDocument document = new XWPFDocument(inStream);

			    //HWPFDocument document = new HWPFDocument(inStream);
			    OutputStream out = new FileOutputStream(pdfFilePath);
			    PdfOptions options = PdfOptions.create();
			    ITextFontRegistry fontProvider=ITextFontRegistry.getRegistry();
			    options.fontProvider(fontProvider);
			    PdfConverter.getInstance().convert(document, out, options);
			}else{
				System.out.println("PDF文件已存在，无需再次转换");
			}
		}else{
			System.out.println("docx不存在！");
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
		File pdfFile=new File(targetPath+targetFileName);

		//转换pdf文件
		if(!pdfFile.exists()){
			OutputStream out = new FileOutputStream(targetPath+targetFileName);
			PdfOptions options = PdfOptions.create();
			ITextFontRegistry fontProvider=ITextFontRegistry.getRegistry();
			options.fontProvider(fontProvider);
			PdfConverter.getInstance().convert(document, out, options);
		}else{
			System.out.println("PDF文件已存在，无需再次转换");
		}
	}

}