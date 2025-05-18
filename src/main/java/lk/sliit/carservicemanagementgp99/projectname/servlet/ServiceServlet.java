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
                //String serviceId = request.getParameter("serviceId");
                String customerName = request.getParameter("customerName");
                Date date = sdf.parse(request.getParameter("date"));
                double cost = Double.parseDouble(request.getParameter("cost"));

                String serviceId = "SRV-" + System.currentTimeMillis();
                String status = request.getParameter("status");
                String specificServiceType = request.getParameter("specificServiceType");
                String numberPlate = request.getParameter("numberPlate");

                if ("Regular".equalsIgnoreCase(serviceType)) {
                    service = new RegularService(serviceId, customerName, date, cost, status, specificServiceType, numberPlate);
                } else {
                    service = new MajorRepair(serviceId, customerName, date, cost, status, specificServiceType, numberPlate);
                }
                serviceManager.addService(service);
                String invoiceId = "INV-" + System.currentTimeMillis();
                Invoice invoice = new Invoice(invoiceId, customerName,serviceId, cost, specificServiceType);
                invoice.setSpecificServiceType(service.getSpecificServiceType());

                invoiceManager.addInvoice(invoice);
                request.setAttribute("message", "Service added successfully!");

            } catch (Exception e) {
                request.setAttribute("error", "Failed to add service: " + e.getMessage());
            }
            request.getRequestDispatcher("service.jsp").forward(request, response);
        } else if ("addInvoice".equals(action)) {
            try {
                //String invoiceId = request.getParameter("invoiceId");
                String customerName = request.getParameter("customerName");
                String serviceId = request.getParameter("serviceId");
                double baseAmount = Double.parseDouble(request.getParameter("baseAmount"));
                double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));


                //Invoice invoice = new Invoice(invoiceId, customerName, serviceId, amount, service.getSpecificServiceType());
                Service selectedService = serviceManager.getServicebyId(serviceId);
                if(selectedService == null) {
                    request.setAttribute("error", "Service not found!");
                    request.getRequestDispatcher("invoice.jsp").forward(request, response);
                }
                String specificServiceType = selectedService.getSpecificServiceType();
                String invoiceId = "INV-" + System.currentTimeMillis();
                Invoice invoice = new Invoice(invoiceId, customerName,serviceId, totalAmount, specificServiceType);

                invoiceManager.addInvoice(invoice);
                request.setAttribute("message", "Invoice created successfully!");
            } catch (Exception e) {
                request.setAttribute("error", "Failed to create invoice: " + e.getMessage());
            }
            request.getRequestDispatcher("invoice.jsp").forward(request, response);
        }
        else if("updateInvoice".equals(action)) {
            try {
                String invoiceId = request.getParameter("invoiceId");
                List<Invoice> allInvoices = invoiceManager.getAllInvoices();

                for(Invoice inv : allInvoices) {
                    if(inv.getInvoiceId().equals(invoiceId)) {
                        int index = 0;
                        while (true) {
                            String name = request.getParameter("costName" + index);
                            String amountStr = request.getParameter("costAmount" + index);
                            if(name == null || amountStr == null) break;

                            double amount = Double.parseDouble(amountStr);
                            inv.addAdditionalCost(name, amount);
                            index++;
                        }
                        break;
                    }
                }

                invoiceManager.rewriteAllInvoices();
                request.setAttribute("message", "Invoice updated successfully!");
            } catch (Exception e) {
                request.setAttribute("error", "Failed to update invoice: " + e.getMessage());
            }
            request.setAttribute("invoices", invoiceManager.getAllInvoices());
            request.getRequestDispatcher("invoice.jsp").forward(request, response);
        }
        else if("updateStatus".equals(action)) {
            String serviceId = request.getParameter("serviceId");
            String newStatus = request.getParameter("newStatus");
            serviceManager.updateServiceStatus(serviceId, newStatus);
            response.sendRedirect("service?view=tracker");
        }
    }

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
            //List<Invoice> invoices = invoiceManager.getAllInvoices();
            //List<Service> services = serviceManager.getAllServices();
            //request.setAttribute("invoices", invoices);
            //request.setAttribute("services", services);
            //request.getRequestDispatcher("invoice.jsp").forward(request, response);
            String search = request.getParameter("search");
            List<Invoice> invoices;

            if (search != null && !search.trim().isEmpty()) {
                invoices = invoiceManager.searchInvoices(search.trim());
            } else {
                invoices = invoiceManager.getAllInvoices();
            }

            List<Service> services = serviceManager.getAllServices();
            request.setAttribute("invoices", invoices);
            request.setAttribute("services", services);
            request.getRequestDispatcher("invoice.jsp").forward(request, response);
        }
        else if ("editInvoice".equals(view)) {
            String invoiceId = request.getParameter("invoiceId");
            Invoice invoice = invoiceManager.getInvoiceById(invoiceId);
            if(invoice != null) {
                request.setAttribute("invoice", invoice);
                request.getRequestDispatcher("edit_invoice.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Invoice not found!");
                request.getRequestDispatcher("invoice.jsp").forward(request, response);
            }
        }
        else if("details".equals(view)) {
            String invoiceId = request.getParameter("invoiceId");
            Invoice invoice = invoiceManager.getInvoiceById(invoiceId);

            if(invoice != null) {
                request.setAttribute("invoice", invoice);
                request.getRequestDispatcher("invoice_details.jsp").forward(request, response);
            }else {
                request.setAttribute("error", "Invoice not found!");
                request.getRequestDispatcher("invoice.jsp").forward(request, response);
            }
        }
    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String path)
            throws ServletException, IOException {
        request.getRequestDispatcher(path).forward(request, response);
    }
}
