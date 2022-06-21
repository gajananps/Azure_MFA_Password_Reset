<?php
if(isset($_POST['submit'])){
$sender_id = "sender_id=".$_POST['sender_id']."
";
$sender_password = "sender_password=".$_POST['sender_password']."
";
$cc_id = "cc_id=".$_POST['cc_id']."
";
$mail_subject = "mail_subject=".$_POST['mail_subject']."
";

$file=fopen("send_mail.properties", "a");
fwrite($file, $sender_id);
fwrite($file, $sender_password);
fwrite($file, $cc_id);
fwrite($file, $mail_subject);
fclose($file);
header("Location:smtp_success.php");

}
?>