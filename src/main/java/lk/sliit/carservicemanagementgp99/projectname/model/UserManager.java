package lk.sliit.carservicemanagementgp99.projectname.model;

import java.io.*;
import java.util.LinkedList;

public class UserManager {
    private final LinkedList<User> users = new LinkedList<>();
    private final String filePath = "C:\\Users\\ASUS\\Desktop\\ProjectFile\\users.txt";

    public UserManager() {
        loadUsers();
    }

  
    private void loadUsers() {
        users.clear();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 6) {
                   
                    String username = parts[0].trim();
                    String password = parts[1].trim();
                    String fullName = parts[2].trim();
                    String email = parts[3].trim();
                    String phone = parts[4].trim();
                    String role = parts[5].trim();

                    User user;
                    if ("Customer".equalsIgnoreCase(role)) {
                        user = new Customer(username, password, fullName, email, phone);
                    } else if ("Admin".equalsIgnoreCase(role)) {
                        user = new Admin(username, password, fullName, email, phone);
                    } else {
                        continue; 
                    }
                    users.add(user);
                } else if (parts.length == 7) {
                    
                    String username = parts[0].trim();
                    String password = parts[1].trim();
                    String fullName = parts[2].trim();
                    String email = parts[3].trim();
                    String phone = parts[4].trim();
                    String role = parts[5].trim();
                    String subrole = parts[6].trim();

                    if ("Staff".equalsIgnoreCase(role)) {
                        User staff = new Staff(username, password, fullName, email, phone, subrole);
                        users.add(staff);
                    }
                } else {
                   
                    System.out.println("Skipping invalid user entry: " + line);
                }
            }
        } catch (IOException e) {
            System.out.println("Error loading users: " + e.getMessage());
        }
    }

    private void saveUsers() {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) {
            for (User user : users) {
                String line = user.getUsername() + "," + user.getPassword() + "," + user.getFullName() + ","
                        + user.getEmail() + "," + user.getPhone() + "," + user.getRole();

                if ("Staff".equalsIgnoreCase(user.getRole())) {
                    line += "," + user.getSubrole();
                }

                bw.write(line);
                bw.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error saving users: " + e.getMessage());
        }
    }

  
    public void addUser(User user) {
        users.add(user);
        selectionSort();
        saveUsers();
    }

    public User getUser(String username) {
        for (User user : users) {
            if (user.getUsername().equalsIgnoreCase(username)) {
                return user;
            }
        }
        return null;
    }

 
    public void updateUser(User updatedUser) {
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getUsername().equalsIgnoreCase(updatedUser.getUsername())) {
                users.set(i, updatedUser);
                selectionSort();
                saveUsers();
                return;
            }
        }
    }

    public boolean deleteUser(String username) {
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getUsername().equalsIgnoreCase(username)) {
                users.remove(i);
                saveUsers();
                return true;
            }
        }
        return false;
    }

    
    public User validateLogin(String username, String password) {
        for (User user : users) {
            if (user.getUsername().equalsIgnoreCase(username) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }

    private void selectionSort() {
        int n = users.size();
        for (int i = 0; i < n - 1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (users.get(j).getUsername().compareToIgnoreCase(users.get(minIndex).getUsername()) < 0) {
                    minIndex = j;
                }
            }
            if (minIndex != i) {
                User temp = users.get(i);
                users.set(i, users.get(minIndex));
                users.set(minIndex, temp);
            }
        }
    }

    public LinkedList<User> getAllUsers() {
        return users;
    }
}
