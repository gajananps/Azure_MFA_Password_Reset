<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>SMTP Input Form</title>
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
            

            <form action="smtp-action.php" method="post">
                <h3>SMTP Input Form</h3>
               
               <div class="row">
                    
                    <div class="col-md-6">
                        
                        <div class="form-group">
                            <input type="text" name="sender_id" class="form-control" placeholder="SMTP Email ID" required autocomplete="off">
                        </div>
                        
                        <div class="form-group">
                            <input type="text" name="sender_password" class="form-control" placeholder="SMTP Email Password" required autocomplete="off">
                        </div>
                        
                        <div class="form-group">
                            <input type="text" name="cc_id" class="form-control" placeholder="CC Group Email ID" required autocomplete="off">
                        </div>
                        
                        <div class="form-group">
                            <input type="submit" name="submit" class="btnContact" value="Submit">
                        </div>
                        
                    </div>
                    
                    <div class="col-md-6">
                        
                        <div class="form-group">
                            <textarea type="text" name="mail_subject"  class="form-control" placeholder="EMail Subject" style="width: 100%; height: 132px;" required autocomplete="off"></textarea>
                        </div>
                        
                    </div>
                </div>
                
            </form>
            
            <p><a href="../index.html" class="cta-btn"><i class="fa fa-arrow-circle-left"></i> Back to Home</a></p>
            
</div>	

</body>
</html>