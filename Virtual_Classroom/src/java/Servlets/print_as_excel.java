/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import Database_Objects.Database_Connection;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 *
 * @author N.MEIYAPPAN
 */
@WebServlet(name = "print_as_excel", urlPatterns = {"/print_as_excel"})
public class print_as_excel extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String qcode=request.getParameter("code");
        System.out.println("---------"+qcode);
        try {
                               
				Connection connection =Database_Connection.getConnection();
				PreparedStatement psmnt = null;
				Statement st = connection.createStatement();
                                psmnt=connection.prepareStatement("select * from results where qcode=?");
                                psmnt.setString(1, qcode);
				ResultSet rs = psmnt.executeQuery();

				HSSFWorkbook wb = new HSSFWorkbook();
				HSSFSheet sheet = wb.createSheet("Excel Sheet");
				HSSFRow rowhead = sheet.createRow((short) 0);
				rowhead.createCell((short) 0).setCellValue("sno");
				rowhead.createCell((short) 1).setCellValue("name");
				rowhead.createCell((short) 2).setCellValue("email");
				rowhead.createCell((short) 3).setCellValue("mark");
                                rowhead.createCell((short)4).setCellValue("total");

				int index = 1;
				while (rs.next()) {

					HSSFRow row = sheet.createRow((short) index);
					row.createCell((short) 0).setCellValue(index);
					row.createCell((short) 1).setCellValue(rs.getString("name"));
					row.createCell((short) 2).setCellValue(rs.getString("email"));
					row.createCell((short) 3).setCellValue(rs.getString("mark"));
                                        row.createCell((short) 4).setCellValue(rs.getString("total"));
					index++;
				}
				FileOutputStream fileOut = new FileOutputStream("F:\\Virtual Classroom results\\"+qcode+".xls");
				wb.write(fileOut);
				fileOut.close();
				System.out.println("Data is saved in excel file.");
				rs.close();
				connection.close();
                                out.println("<script>alert('Successfully results have been downloaded');</script>");
				out.println("<script>location.replace('DashBoard.jsp')</script>");
			} catch (Exception e) 
                        {
				System.out.println(e);
			}
    }

    

}
