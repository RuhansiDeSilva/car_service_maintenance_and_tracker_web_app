<%@ page import="java.io.*, java.util.*" %>
<%
    int index = Integer.parseInt(request.getParameter("index"));
    String name = request.getParameter("name");
    String vehicle = request.getParameter("vehicle");
    String service = request.getParameter("service");
    String date = request.getParameter("date");
    String time = request.getParameter("time");

    String filePath = "D:\\car_service_maintenance_and_tracker_web_app\\appointment.txt";
    List<String> appointments = new ArrayList<>();
    BufferedReader reader = new BufferedReader(new FileReader(filePath));
    String line;
    while ((line = reader.readLine()) != null) {
        appointments.add(line);
    }
    reader.close();

    appointments.set(index, name + "," + vehicle + "," + service + "," + date + "," + time);

    BufferedWriter writer = new BufferedWriter(new FileWriter(filePath));
    for (String appointment : appointments) {
        writer.write(appointment);
        writer.newLine();
    }
    writer.close();

    response.sendRedirect("appointments.jsp");
%>
