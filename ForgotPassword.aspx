<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="AssetMgtSystem.ForgotPassword" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

  <%--  <title><% Response.Write(HttpContext.Current.Session["Company"].ToString());%>  - Forgot Password</title>--%>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />

  </head>

  <body class="bg-dark">

    <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">Reset Password</div>
        <div class="card-body">
          <div class="text-center mb-4">


              

            <h4>Forgot your password?</h4>
            <p>Enter your username and we will send you instructions in your email on how to reset your password.</p>
          </div>
          <form novalidate="" action="#" method="POST" id="myForm" autocomplete="off">
            <div class="form-group">
              <div class="form-group">
              <label for="Username">Username</label>
              <input class="form-control" id="Username" name="Username" type="text" aria-describedby="emailHelp" placeholder="Enter Username" required >
              <div class="valid-feedback">Looks good!</div>
              <div class="invalid-feedback">Username must be provided</div>
            </div>
            </div>
            <a id ="btn_reset" class="btn btn-primary btn-block" href="ForgotPassword.aspx">Reset Password</a>
          </form>
          <div class="text-center">
              <br>
            <%--<a class="d-block small mt-3" href="register.aspx">Register an Account</a>--%>
            <a   class="d-block small" href="Login.aspx">Login Page</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>      
    <script src="js/bootbox.all.min.js"></script>
    <script src="js/bootboxError.js"></script>
    <script src="js/jquery.pleaseWait.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT" crossorigin="anonymous"></script>
    <script src="js/jquery.toast.js"></script>
    <script type="text/javascript" src="js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("images/Bg.jpg", { speed: 500 });
   </script>
       <script>        
           $(document).ready(function () {
               $('#btn_reset').click(function (e) {
                   var form = $("#myForm")

                if (form[0].checkValidity() === false) {
                    event.preventDefault()
                    event.stopPropagation()
                    form.addClass('was-validated');
                } else if (form[0].checkValidity() === true) {

                    showToast('Submitting');

                    jQuery.ajax({
                        url: 'ForgotPassword.aspx/RecoverPassword',
                        type: "POST",
                        data: '{param1:"' + $('#EmployeeNumber').val() + '"}',
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (response) {

                            if (response != null && response.d != null) {
                                var data = response.d;
                                // alert(typeof (data)); //it comes out to be string 
                                //we need to parse it to JSON 
                                data = $.parseJSON(data);                               

                                if (data.Status != "000") {
                                    hideLoading();
                                    //var div = document.getElementById('divID');

                                    //div.innerHTML += data.Message;
                                    bootbox.error({ title: "An error occured", message: data.Message });
                                } else {
                                    
                                   // var div = document.getElementById('divID');

                                   // div.innerHTML += data.Message;
                                    hideLoading();
                                    bootbox.alert(data.Message);
                                    //$('#cardspin').pleaseWait('stop');
                                   // window.location.href = "Default.aspx";
                                }
                            }
                        },
                        error: function () {
                            bootbox.error({ title: "Application error", message: "Could not process request" });
                        }
                    });
                }

                event.preventDefault();               
            });          
        });
        function showToast(modaltittle) {
            var title = modaltittle;
            var icon = 'loading';
            var duration = 50000 * 1;
            $.Toast.showToast({ title: title, duration: duration, icon: icon, image: '' });
        }
        function hideLoading() {
            $.Toast.hideToast();
        }
       </script>
  </body>

</html>