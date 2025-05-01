package lk.sliit.carservicemanagementgp99.projectname.servlet;

import jakarta.servlet.ServletContext;
import lk.sliit.carservicemanagementgp99.projectname.model.Service;
import lk.sliit.carservicemanagementgp99.projectname.model.ServiceHistory;
import lk.sliit.carservicemanagementgp99.projectname.model.Invoice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class ServiceServlet extends HttpServlet {
    private ServiceHistory serviceHistory;
    private List<Invoice> invoiceList;

    //file path for project folder
    private static final String SERVICE_FILE = "data/services.txt";
    private static final String INVOICE_FILE = "data/invoices.txt";

    public void init() throws ServletException {
        serviceHistory = new ServiceHistory();
        invoiceList = new ArrayList<>();
        loadServices();
    }
    // Handle form submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // Get form inputs
        String customerName = request.getParameter("customerName");
        String vehicleNumber = request.getParameter("vehicleNumber");
        String serviceDateStr = request.getParameter("serviceDate");
        String serviceType = request.getParameter("serviceType");
        double cost = Double.parseDouble(request.getParameter("cost"));

        // Auto generate service ID
        String serviceID = generateServiceID();

        Date serviceDate;
        try {
            serviceDate = new SimpleDateFormat("yyyy-MM-dd").parse(serviceDateStr);
        }catch (Exception e){
            throw new ServletException("Invalid date format");
        }
        // Generate and save service
        Service newService = new Service(serviceID, customerName, vehicleNumber, serviceDate, serviceType, cost);
        serviceHistory.addService(newService);
        saveService(newService);

        // auto generate and save invoice
        String invoiceID = generateInvoiceID();
        Invoice invoice = new Invoice(invoiceID, newService);
        invoiceList.add(invoice);
        saveInvoice(invoice);

        // Forward to invoice page
        request.setAttribute("invoice", invoice);
        RequestDispatcher dispatcher = request.getRequestDispatcher("generate_invoice.jsp");
        dispatcher.forward(request, response);
    }
    // Handle get request to show service history
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        serviceHistory.sortByDate();
        request.setAttribute("serviceHistory", serviceHistory);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view_service_history.jsp");
        dispatcher.forward(request, response);
    }
    // Save service to file
    private void saveService(Service service) throws IOException {
        FileWriter fWriter = new FileWriter(SERVICE_FILE, true);
        fWriter.write(service.toString() + "\n");
        fWriter.close();
    }
    // Save invoice to file
    private void saveInvoice(Invoice invoice) throws IOException {
        FileWriter fWriter = new FileWriter(INVOICE_FILE, true);
        fWriter.write(invoice.toString() + "\n");
        fWriter.close();
    }
    // Load services from file on startup
    private void loadServices() {
        File file = new File(SERVICE_FILE);
        if(!file.exists()) {
            return;
        }
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                String id = data[0];
                String customerName = data[1];
                String vehicleNumber = data[2];
                Date date = Service.parseDate(data[3]);
                String type = data[4];
                double cost = Double.parseDouble(data[5]);

                Service service = new Service(id, customerName, vehicleNumber, date, type, cost);
                serviceHistory.addService(service);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    // Generate random service ID
    private String generateServiceID() {
        int id  = (int) (Math.random() * 10000);
        return "S" + String.format("%04d", id);
    }
    // Generate random invoice ID
    private String generateInvoiceID() {
        int id  = (int) (Math.random() * 10000);
        return "I" + String.format("%04d", id);
    }
}
