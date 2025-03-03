package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DownloadBillServlet")
public class DownloadBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String pdfFilePath = "bill_" + bookingId + ".pdf";  // Assuming the PDF is saved in the current directory

        File billPdfFile = new File(pdfFilePath);

        if (billPdfFile.exists()) {
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + billPdfFile.getName() + "\"");
            response.setContentLength((int) billPdfFile.length());

            try (FileInputStream inputStream = new FileInputStream(billPdfFile);
                 OutputStream outputStream = response.getOutputStream()) {

                byte[] buffer = new byte[1024];
                int bytesRead;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }

            System.out.println("Bill PDF sent to the client.");
        } else {
            response.getWriter().println("The requested bill PDF does not exist.");
        }
    }
}
