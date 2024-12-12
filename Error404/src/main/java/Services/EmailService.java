package Services;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailService {
    private final String senderEmail = "tu-correo@gmail.com";
    private final String senderPassword = "tu-contraseña";

    public void sendEmail(String recipientEmail, String subject, String messageBody) throws MessagingException {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com"); // Servidor SMTP (Gmail en este caso)
        props.put("mail.smtp.port", "587"); // Puerto TLS

        // Autenticación para el envío
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        // Construcción del mensaje
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(senderEmail)); // Remitente
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail)); // Destinatario
        message.setSubject(subject); // Asunto
        message.setText(messageBody); // Cuerpo del mensaje

        // Envío del mensaje
        Transport.send(message);
    }
}

