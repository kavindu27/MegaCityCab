package generator;


import dao.BillingDAO;
import model.Bill;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class BillGenerator {

    private BillingDAO billingDAO;

    public BillGenerator() {
        this.billingDAO = new BillingDAO();
    }

    // Method to generate and insert a bill for a booking
    public Bill generateBill(int bookingId, double totalAmount) {
        Timestamp billTime = new Timestamp(System.currentTimeMillis());

        boolean isBillCreated = billingDAO.createBill(bookingId, totalAmount);

        if (isBillCreated) {
            Bill bill = billingDAO.getBillByBookingId(bookingId);
            if (bill != null) {
                generateBillPDF(bill);
            }
            return bill;
        } else {
            return null;
        }
    }

    // Method to generate PDF for the bill
    private void generateBillPDF(Bill bill) {
        Document document = new Document();

        try {
            String pdfFileName = "bill_" + bill.getBillId() + ".pdf";
            PdfWriter.getInstance(document, new FileOutputStream(pdfFileName));

            document.open();
            document.add(new Paragraph("MegaCity Cab - Bill"));
            document.add(new Paragraph("Booking ID: " + bill.getBookingId()));
            document.add(new Paragraph("Total Amount: Rs " + bill.getTotalAmount()));
            document.add(new Paragraph("Bill Time: " + bill.getBillTime()));

            document.close();

            System.out.println("Bill PDF generated successfully: " + pdfFileName);
        } catch (DocumentException | IOException e) {
            e.printStackTrace();
        }
    }
}
