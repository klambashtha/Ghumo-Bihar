<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <% 
       String fname = request.getParameter("fname");
       String lname = request.getParameter("lname");
       String id = request.getParameter("email");
       String m_num = request.getParameter("phone");
       String pass =request.getParameter("pass");
       try{
       Class.forName("oracle.jdbc.driver.OracleDriver");
       Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Sandeep");
       con.setAutoCommit(false);
       PreparedStatement ps=con.prepareStatement("insert into regi50 values(?,?,?,?,?)");
       ps.setString(1,fname);
       ps.setString(2,lname);
       ps.setString(3,id);
       ps.setString(4,m_num);
       ps.setString(5,pass);
       int row=ps.executeUpdate();
       con.commit();
       con.close();
           
           %>
       <%@include file="index.html" %>
       <%
           }
           catch(Exception e)
           {
           out.print(e);
           }
           %>