package lk.sliit.carservicemanagementgp99.projectname.manager;

import lk.sliit.carservicemanagementgp99.projectname.model.Invoice;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class InvoiceManager {
    private List<Invoice> invoiceList;
    private final String filePath;

    public InvoiceManager(String filePath) {
        this.filePath = filePath;
        this.invoiceList = new ArrayList<>();
        loadInvoices();
    }
    public void addInvoice(Invoice invoice) {
        invoiceList.add(invoice);
        saveInvoiceToFile(invoice);
    }
    public List<Invoice> getAllInvoices() {
        return new ArrayList<>(invoiceList);
    }
    private void loadInvoices() {
        invoiceList.clear();
        File file = new File(filePath);
        if(!file.exists()) { return; }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if(parts.length != 4) continue;
                Invoice invoice = new Invoice(parts[0], parts[1], parts[2], Double.parseDouble(parts[3]));
                invoiceList.add(invoice);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void saveInvoiceToFile(Invoice invoice) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, true))) {
            bw.write(invoice.getInvoiceId() + "," + invoice.getCustomerName() + "," +
                    invoice.getServiceId() + "," + invoice.getAmount());
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
