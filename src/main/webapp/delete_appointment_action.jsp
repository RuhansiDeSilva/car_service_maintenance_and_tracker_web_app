<%@ page import="java.io.*, java.util.*" %>
<%
    // Get index from form
    int index = Integer.parseInt(request.getParameter("index"));
    String filePath = "C:\\Users\\HP\\OneDrive - Sri Lanka Institute of Information Technology\\Desktop\\booking\\appointments.txt";

    // Read all appointments into a list
    List<String> appointments = new ArrayList<>();
    BufferedReader reader = new BufferedReader(new FileReader(filePath));
    String line;
    while ((line = reader.readLine()) != null) {
        appointments.add(line);
    }
    reader.close();

    // Remove the selected appointment
    if (index >= 0 && index < appointments.size()) {
        appointments.remove(index);
    }

    // Rewrite the file without the deleted appointment
    BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, false)); // overwrite
    for (String app : appointments) {
        writer.write(app);
        writer.newLine();
    }
    writer.close();

    // Redirect back to appointments page
    response.sendRedirect("appointments.jsp");
%>

