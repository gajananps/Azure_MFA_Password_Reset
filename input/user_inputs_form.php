<?php

$error = '';
$date = '';
$team = '';
$manager_email = '';
$sender_name = '';
$sender_email = '';
$iam_user_email = '';
$iam_user_password = '';


function clean_text($string)
{
 $string = trim($string);
 $string = stripslashes($string);
 $string = htmlspecialchars($string);
 return $string;
}


if(isset($_POST["submit"]))
{

	 if(empty($_POST["team"]))
	 {
	  $error .= '<p id="alert-team"><label class="input-danger"><strong>Input Required</strong> - Please Enter your Team</label></p>';
	 }
	 else
	 {
	  $team = clean_text($_POST["team"]);
	  if(!preg_match("/^[a-zA-Z ]*$/",$team))
	  {
	   $error .= '<p id="alert-team-warning"><label class="input-warning">Team Name - Only letters and white space allowed</label></p>';
	  }
	 }
 
	 if(empty($_POST["manager_email"]))
	 {
	  $error .= '<p id="alert-manager"><label class="input-danger"><strong>Input Required</strong> - Please Enter Manager Email</label></p>';
	 }
	 else
	 {
	  $manager_email = clean_text($_POST["manager_email"]);
	  if(!filter_var($manager_email, FILTER_VALIDATE_EMAIL))
	  {
	   $error .= '<p id="alert-email-warning"><label class="input-warning">Manager Email - Invalid email format</label></p>';
	  }
	 }
	 
	 if(empty($_POST["sender_name"]))
	 {
	  $error .= '<p id="alert-sname"><label class="input-danger"><strong>Input Required</strong> - Please Enter Sender Name</label></p>';
	 }
	 else
	 {
	  $sender_name = clean_text($_POST["sender_name"]);
	  if(!preg_match("/^[a-zA-Z]*$/",$sender_name))
	  {
	   $error .= '<p id="alert-team-warning"><label class="input-warning">Sender Name - Only letters allowed. White space not allowed</label></p>';
	  }
	 }
	 
 
	 if(empty($_POST["sender_email"]))
	 {
	  $error .= '<p id="alert-semail"><label class="input-danger"><strong>Input Required</strong> - Please Enter Sender Email</label></p>';
	 }
	 else
	 {
	  $sender_email = clean_text($_POST["sender_email"]);
	  if(!filter_var($sender_email, FILTER_VALIDATE_EMAIL))
	  {
	   $error .= '<p id="alert-email-warning"><label class="input-warning">Sender Email - Invalid email format</label></p>';
	  }
	 }
     

	 if(empty($_POST["iam_user_email"]))
	 {
	  $error .= '<p id="alert-iam-user"><label class="input-danger"><strong>Input Required</strong> - Please Enter IAM User Email</label></p>';
	 }
	 else
	 {
	  $iam_user_email = clean_text($_POST["iam_user_email"]);
	  if(!filter_var($iam_user_email, FILTER_VALIDATE_EMAIL))
	  {
	   $error .= '<p id="alert-email-warning"><label class="input-warning">IAM User Email - Invalid email format</label></p>';
	  }
	 }
	
	
 if($error == '')
 {
  $file_open = fopen("IAM_User_Password.csv", "a");
  $no_rows = count(file("IAM_User_Password.csv"));

  if($no_rows > 1)
  {
   $no_rows = ($no_rows - 1) + 1;
  }
  
  $form_data = array(
   'id'  => $no_rows,
   'date'  => date("Y-m-d"),
   'team'  => $team,
   'manager_email'  => $manager_email,
   'sender_name' => $sender_name,
   'sender_email' => $sender_email,
   'iam_user_email' => $iam_user_email,
   'iam_user_password' => $iam_user_password
  );
  
  

  
  fputcsv($file_open, $form_data );
  $error = '<p id="alert-success"><label class="input-success"><strong>Success!</strong> Azure IAM User Input[s] Added Successfully</label></p>';
  //$date = 'date("m/d/Y h:i:s a", time())';
  //$date = 'date("Y-m-d H:i:s")';
  $team = '';
  $manager_email = '';
  $sender_name = '';
  $sender_email = '';
  $iam_user_email = '';
  $iam_user_password = '';
 }
}



?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>Azure IAM User Input[s] Form</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../src/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="../src/css/custom.css">
    <script src="../src/js/jquery.min.js"></script>
    <script src="../src/js/bootstrap.min.js"></script>
    
    <!-- Font Awesome Icon -->
  <link rel="stylesheet" href="../src/css/font-awesome.min.css">
</head>
<body>
    <div class="container azure-form">
            <div class="azure-image">
                <img src="../src/img/azure_logo.png" alt=""/>
            </div>
            

            <form method="post">
                <h3>Azure IAM User Input[s] Form</h3>
				
				
				
               <?php echo $error; ?>
               <div class="row">
                         
                    <div class="col-md-6">
                        
                        <div class="form-group">
                            <input type="text" name="team" class="form-control" placeholder="Enter Team" value="<?php echo $team; ?>" />
                        </div>
                        
                        <div class="form-group">
                            <input type="text" name="manager_email" class="form-control" placeholder="Enter Manager Email" value="<?php echo $manager_email; ?>" />
                        </div>
                        
                        <div class="form-group">
                            <input type="text" name="sender_name" class="form-control" placeholder="Enter Sender Name" value="<?php echo $sender_name; ?>" />
                        </div>
                        
                        <div class="form-group">
                            <input type="submit" name="submit" class="btnContact" value="Submit" />
                        </div>
                        
                    </div>
                    
                    <div class="col-md-6">
                        
                        <div class="form-group">
                            <input type="text" name="sender_email" class="form-control" placeholder="Enter Sender Email" value="<?php echo $sender_email; ?>" />
                        </div>
                        
                        <div class="form-group">
                            <input type="text" name="iam_user_email" class="form-control" placeholder="Enter IAM User Email" value="<?php echo $iam_user_email; ?>" />
                        </div>
                        
                        <div class="form-group">
                            <input type="text" name="iam_user_password" class="form-control" disabled placeholder="Enter IAM User Password" value="<?php echo $iam_user_password; ?>" />
                        </div>
                        
                    </div>
                </div>
                
            </form>
            
            <p><a href="../index.html" class="cta-btn"><i class="fa fa-arrow-circle-left"></i> Back to Home</a></p>
            
</div>	

</body>


<script type="text/javascript">//<![CDATA[

setTimeout(function(){
    document.getElementById('alert-team').className = 'alert-hide';
}, 2500);

setTimeout(function(){
    document.getElementById('alert-manager').className = 'alert-hide';
}, 2500);

setTimeout(function(){
    document.getElementById('alert-sname').className = 'alert-hide';
}, 2500);

setTimeout(function(){
    document.getElementById('alert-semail').className = 'alert-hide';
}, 2500);

setTimeout(function(){
    document.getElementById('alert-iam-user').className = 'alert-hide';
}, 2500);

setTimeout(function(){
    document.getElementById('alert-success').className = 'alert-hide';
}, 2500);

setTimeout(function(){
    document.getElementById('alert-email-warning').className = 'alert-hide';
}, 2500);

setTimeout(function(){
    document.getElementById('alert-team-warning').className = 'alert-hide';
}, 2500);

  //]]></script>
  
</html>