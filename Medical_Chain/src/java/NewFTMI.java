
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class NewFTMI extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/GlsJPraYl3", "GlsJPraYl3", "QWoTqG7IK0");
            PreparedStatement ps = con.prepareStatement("insert into ftmi_details(Name, Address, ContactNo, Email, DOB, Gender, BloodGroup, TotalMember, ProfileImage,  allergies, illness, pastsur, immune) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            String filepdf="C:\\Users\\HP\\Documents\\NetBeansProjects\\Medical_Chain\\web\\images\\Report\\1.pdf";
            File file = new File(filepdf);
            FileInputStream input = new FileInputStream(file);
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            int contactNo = Integer.parseInt(request.getParameter("c-number"));
            String email = request.getParameter("c-email");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String bloodGroup = request.getParameter("bg");
            String allergies= request.getParameter("allergies");
            String illness=request.getParameter("illness");
            String ps1=request.getParameter("ps");
            String immune=request.getParameter("immune");
            int totalMember = Integer.parseInt(request.getParameter("total-member"));

            ps.setString(1, name);
            ps.setString(2, address);
            ps.setInt(3, contactNo);
            ps.setString(4, email);
            ps.setString(5, dob);
            ps.setString(6, gender);
            ps.setString(7, bloodGroup);
            ps.setInt(8, totalMember);
            ps.setString(10, allergies);
            ps.setString(11,illness);
            ps.setString(12,ps1);
            ps.setString(13,immune);
            ps.setBinaryStream(9, (InputStream)input, (int)(file.length()));
               
            int i = ps.executeUpdate();

            String qr_text = name;
            ByteArrayOutputStream output = QRCode.from(qr_text).to(ImageType.PNG).stream();
            File f;
            f = new File("C:\\Users\\HP\\Documents\\NetBeansProjects\\Medical_Chain\\web\\images\\Report\\"+ name +".png");
            FileOutputStream fout = new FileOutputStream(f);
            fout.write(output.toByteArray());
            fout.flush();
            final String username = "dhrurawalcodes1997@gmail.com";
            final String password = "Dhruv@608";
            final String to=email;

            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "465");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.socketFactory.port", "465");
            prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            Session ses = Session.getInstance(prop,
                    new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            try {

                Message message = new MimeMessage(ses);
                message.setFrom(new InternetAddress("dhrurawalcodes1997@gmail.com"));
                message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
                message.setSubject("Medical Chain your QR code successfully generated");
                BodyPart messageBodyPart1 = new MimeBodyPart();
                messageBodyPart1.setText("Dear "+name +","
                        + "\n Here in this mail we have attched an QR card ,which you can use as per your convinience ,\n Thank You");

                //4) create new MimeBodyPart object and set DataHandler object to this object      
                MimeBodyPart messageBodyPart2 = new MimeBodyPart();

                String filename = "C:\\Users\\HP\\Documents\\NetBeansProjects\\Medical_Chain\\web\\images\\Report\\" + name + ".png";//change accordingly  
                DataSource source = new FileDataSource(filename);
                messageBodyPart2.setDataHandler(new DataHandler(source));
                messageBodyPart2.setFileName(filename);

                //5) create Multipart object and add MimeBodyPart objects to this object      
                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(messageBodyPart1);
                multipart.addBodyPart(messageBodyPart2);

                //6) set the multiplart object to the message object  
                message.setContent(multipart);

                Transport.send(message);
             
                
            RequestDispatcher RD = request.getRequestDispatcher("/FTMI.html");
            RD.include(request, response);
                
            } catch (MessagingException e) {
                e.printStackTrace();
            }
            
        } catch (Exception ex) {
            System.out.println(ex);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}