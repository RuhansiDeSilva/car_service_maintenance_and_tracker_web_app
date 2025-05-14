package lk.sliit.carservicemanagementgp99.projectname.servlet;

import lk.sliit.carservicemanagementgp99.projectname.model.*;
import lk.sliit.carservicemanagementgp99.projectname.manager.ServiceManager;
import lk.sliit.carservicemanagementgp99.projectname.manager.InvoiceManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/service")
public class ServiceServlet extends HttpServlet {
    private ServiceManager serviceManager;
    private InvoiceManager invoiceManager;
    Service service;
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public void init() throws ServletException{
        String servicePath = getServletContext().getRealPath("/data/services.txt");
        String invoicePath = getServletContext().getRealPath("/data/invoices.txt");

        serviceManager = new ServiceManager(servicePath);
        invoiceManager = new InvoiceManager(invoicePath);
    }

    // Handle form submission
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        String action = request.getParameter("action");

        if ("addService".equals(action)) {
            try {
                String serviceType = request.getParameter("serviceType");
                String serviceId = request.getParameter("serviceId");
                String customerName = request.getParameter("customerName");
                Date date = sdf.parse(request.getParameter("date"));
                double cost = Double.parseDouble(request.getParameter("cost"));

                 serviceId = "SRV-" + System.currentTimeMillis();
                String status = request.getParameter("status");

                if ("Regular".equalsIgnoreCase(serviceType)) {
                    service = new RegularService(serviceId, customerName, date, cost, status);
                } else {
                    service = new MajorRepair(serviceId, customerName, date, cost, status);
                }
                serviceManager.addService(service);
                String invoiceId = "INV-" + System.currentTimeMillis();
                Invoice invoice = new Invoice(invoiceId, customerName,serviceId, cost);
                invoiceManager.addInvoice(invoice);

                request.setAttribute("message", "Service added successfully!");

            } catch (Exception e) {
                request.setAttribute("error", "Failed to add service: " + e.getMessage());
            }
            request.getRequestDispatcher("service.jsp").forward(request, response);
        } else if ("addInvoice".equals(action)) {
            try {
                String invoiceId = request.getParameter("invoiceId");
                String customerName = request.getParameter("customerName");
                String serviceId = request.getParameter("serviceId");
                double amount = Double.parseDouble(request.getParameter("amount"));

                 invoiceId = "INV-" + System.currentTimeMillis();

                Invoice invoice = new Invoice(invoiceId, customerName, serviceId, amount);
                invoiceManager.addInvoice(invoice);
                request.setAttribute("message", "Invoice created successfully!");
            } catch (Exception e) {
                request.setAttribute("error", "Failed to create invoice: " + e.getMessage());
            }
            request.getRequestDispatcher("invoice.jsp").forward(request, response);
        } else if("updateStatus".equals(action)) {
            String serviceId = request.getParameter("serviceId");
            String newStatus = request.getParameter("newStatus");
            serviceManager.updateServiceStatus(serviceId, newStatus);
            response.sendRedirect("service?view=tracker");
        }
    }
    // Handle get request to show service history
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String view = request.getParameter("view");

        if("tracker".equals(view)) {
            List<Service> services = serviceManager.getAllServicesSortedByDate();
            request.setAttribute("services", services);
            request.getRequestDispatcher("service_tracker.jsp").forward(request, response);
        }
        else if("services".equals(view)) {
            List<Service> services = serviceManager.getAllServicesSortedByDate();
            request.setAttribute("services", services);
            request.getRequestDispatcher("service.jsp").forward(request, response);
        }
        else if ("invoices".equals(view)) {
            List<Invoice> invoices = invoiceManager.getAllInvoices();
            request.setAttribute("invoices", invoices);
            request.getRequestDispatcher("invoice.jsp").forward(request, response);
        }
    }
}
