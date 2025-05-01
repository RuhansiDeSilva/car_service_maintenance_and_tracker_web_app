package lk.sliit.carservicemanagementgp99.projectname.model;

import java.util.Date;

public class ServiceHistory {
    private Node head;

    // Inner Node class
    public class Node {
        Service service;
        Node next;

        Node(Service service) {
            this.service = service;
            this.next = null;
        }
    }
    // Add a service to linked list
    public void addService(Service service) {
        Node newNode = new Node(service);
        if (head == null) {
            head = newNode;
        }
        else {
            Node current = head;
            while (current.next != null) {
                current = current.next;
            }
            current.next = newNode;
        }
    }

    // Search service by ID
    public Service searchServicebyID(String serviceID) {
        Node current = head;
        while (current != null) {
            if (current.service.getServiceID().equals(serviceID)) {
                return current.service;
            }
            current = current.next;
        }
        return null;
    }
    // Delete a service by ID
    public void deleteService(String serviceID) {
        if(head == null) {
            return;
        }
        if(head.service.getServiceID().equals(serviceID)) {
            head = head.next;
            return;
        }
        Node current = head;
        while (current.next != null) {
            if (current.next.service.getServiceID().equals(serviceID)) {
                current.next = current.next.next;
                return;
            }
            current = current.next;
        }
    }
    // Sort the services by date
    public void sortByDate() {
        for(Node i = head; i != null; i = i.next) {
            Node min = i;
            for (Node j = i; j != null; j = j.next) {
                if(j.service.getServiceDate().before(min.service.getServiceDate())) {
                    min = j;
                }
            }
            // Swap service objects
            Service temp = i.service;
            i.service = min.service;
            min.service = temp;
        }
    }
    // Getter for head node
    public Node getHead() {
        return head;
    }
}
