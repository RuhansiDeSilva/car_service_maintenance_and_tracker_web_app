package lk.sliit.carservicemanagementgp99.projectname;

import java.io.*;
import java.util.LinkedList;
import java.util.List;

public class UserService {
    private static final String FILE_PATH = "C:\\Users\\ASUS\\Desktop\\Project File\\User.txt";

    private final LinkedList<User> users;

    public UserService() {
        users = new LinkedList<>();
        loadUsersFromFile();
    }

    // Create User
    public void addUser(User user) {
        users.add(user);
        saveUsersToFile();
    }

    // Read Users
    public List<User> getAllUsers() {
        return users;
    }

    // Update User
    public void updateUser(String username, String name, String email, String phone, String password, String address, String status) {
        for (User user : users) {
            if (user.getUsername().equals(username)) {
                user.setName(name);
                user.setEmail(email);
                user.setPhone_number(phone);
                user.setPassword(password);
                user.setAddress(address);
                user.setStatus(status);
                saveUsersToFile();
                return;
            }
        }
    }

    // Delete User
    public void deleteUser(String username) {
        boolean removed = users.removeIf(user -> user.getUsername().equals(username));
        if (removed) saveUsersToFile();
    }

    // File Handling Methods
    private void loadUsersFromFile() {
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 7) {
                    users.add(new User(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6]));
                }
            }
        } catch (IOException e) {
            System.out.println("Error loading users: " + e.getMessage());
        }
    }

    private void saveUsersToFile() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User user : users) {
                writer.write(user.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error saving users: " + e.getMessage());
        }
    }
}
