<?php
if (session_status() === PHP_SESSION_NONE){
    session_start();
}
// in your terminal: crontab -e
// 0 0 1 * * php /path/to/mailer.php

include "db.php";

//Import PHPMailer classes into the global namespace
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;

require '../vendor/autoload.php';

// Check if today is the first day of the month
if (date('j') === '14') {
    // Execute the monthly task here
    $allEmails = callEmails($dbConnection);
    print_r($allEmails);
    foreach($allEmails as $key => $row){
        if ($row['email']){
            $name = $row['user_name'];
            $email = $row['email'];
            $message = "TEST";
            sendEmail($name, $email, $message);
        } else {
        }
    }
} else {
    echo "Today is not the first day of the month.";

}

function sendEmail($name, $email, $message){
    //Create a new PHPMailer instance
    $mail = new PHPMailer();

    //Tell PHPMailer to use SMTP
    $mail->isSMTP();

    //Enable SMTP debugging
    $mail->SMTPDebug = 0; // SMTP::DEBUG_SERVER;

    //Set the hostname of the mail server
    $mail->Host = 'smtp.gmail.com';
    //Use `$mail->Host = gethostbyname('smtp.gmail.com');`
    //if your network does not support SMTP over IPv6,
    //though this may cause issues with TLS

    //Set the SMTP port number:
    // - 465 for SMTP with implicit TLS, a.k.a. RFC8314 SMTPS or
    // - 587 for SMTP+STARTTLS
    $mail->Port = 587;

    //Set the encryption mechanism to use:
    // - SMTPS (implicit TLS on port 465) or
    // - STARTTLS (explicit TLS on port 587)
    //$mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;

    $mail->SMTPSecure = 'tls';

    //Whether to use SMTP authentication
    $mail->SMTPAuth = true;

    //Username to use for SMTP authentication - use full email address for gmail
    $mail->Username = 'xusrew.z@gmail.com';

    //Password to use for SMTP authentication
    $pass = getenv('PASSWORD', true) ?: getenv('PASSWORD');
    $mail->Password = '';

    //Set who the message is to be sent from
    //Note that with gmail you can only use your account address (same as `Username`)
    //or predefined aliases that you have configured within your account.
    //Do not use user-submitted addresses in here
    $mail->setFrom('xusrew.z@gmail.com', 'ARAM');

    //Set an alternative reply-to address
    //This is a good place to put user-submitted addresses
    //$mail->addReplyTo('replyto@example.com', 'First Last');

    //Set who the message is to be sent to
    $mail->addAddress($email);
    $mail->addReplyTo("$email", 'Information');


    //Read an HTML message body from an external file, convert referenced images to embedded,
    //convert HTML into a basic plain-text alternative body
    //$mail->msgHTML(file_get_contents('contents.html'), __DIR__);
    $mail->isHTML(false);
    //Set the subject line
    $mail->Subject = 'Newsletter From ARAM';
    $mail->Body = "
        Email: $email
        Dear $name 
        Message: $message
    ";

    //Replace the plain text body with one created manually
    //$mail->AltBody = 'This is a plain-text message body';

    //Attach an image file
    //$mail->addAttachment('images/phpmailer_mini.png');

    //send the message, check for errors
    if ($mail->send()) {
        $response = "Submited. Thanks! I will be in contact with you shortly.";
    } else {
        // Handle the case where the script is accessed directly without a POST request
        $response = "Error: Oops! Something went wrong while sending email.";
        //Section 2: IMAP
        //Uncomment these to save your message in the 'Sent Mail' folder.
        #if (save_mail($mail)) {
        #    echo "Message saved!";
        #}
    }
    echo $response;
}

//Section 2: IMAP
//IMAP commands requires the PHP IMAP Extension, found at: https://php.net/manual/en/imap.setup.php
//Function to call which uses the PHP imap_*() functions to save messages: https://php.net/manual/en/book.imap.php
//You can use imap_getmailboxes($imapStream, '/imap/ssl', '*' ) to get a list of available folders or labels, this can
//be useful if you are trying to get this working on a non-Gmail IMAP server.
function save_mail($mail)
{
    //You can change 'Sent Mail' to any other folder or tag
    $path = '{imap.gmail.com:993/imap/ssl}[Gmail]/Sent Mail';

    //Tell your server to open an IMAP connection using the same username and password as you used for SMTP
    $imapStream = imap_open($path, $mail->Username, $mail->Password);

    $result = imap_append($imapStream, $path, $mail->getSentMIMEMessage());
    imap_close($imapStream);

    return $result;
}
?>