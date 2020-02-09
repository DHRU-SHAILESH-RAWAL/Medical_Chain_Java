<%-- 
    Document   : upload_report
    Created on : 6 Aug, 2019, 10:40:19 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Report</title>
    </head>
    <body>
        <form action='Upload_Report' method='post'>
            <input type='text' name='type'>Type<br>
        <input type="file" required="" name="file"><br>
        <input type="submit" value='Upload Report'>
        
        </form>
    </body>
</html>
