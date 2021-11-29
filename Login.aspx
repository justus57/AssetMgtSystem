<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AssetMgtSystem.Login" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><% Response.Write(HttpContext.Current.Session["Company"].ToString());%>  - Login</title>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
  </head>

  <body class="bg-dark"><%-- class="bg-dark"--%>

    <div class="container">
     <%--<img class="center-block" src="images/schneider_logo.png" />--%>
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login</div>
        <div class="card-body" id ="cardspin">
          <form novalidate="" action="#" method="POST" id="myForm" autocomplete="off">
            <div class="form-group">
              <label for="inputEmail">USERNAME</label>
              <input class="form-control" id="inputEmail" name="username" style="text-transform:uppercase"  type="text" aria-describedby="emailHelp" placeholder="Enter UserName" required >
              <div class="valid-feedback">Looks good!</div>
              <div class="invalid-feedback">UserName must be provided</div>
            </div>
            <div class="form-group">
              <label for="inputPassword">Password</label>
              <input class="form-control"
              id="inputPassword"name="password" type="password" placeholder="Password" required>
              <div class="valid-feedback">Looks good!</div>
              <div class="invalid-feedback">Password must be provided</div>
            </div>
            <a  id="btnlogin" class="btn btn-primary btn-block">Login</a>
          </form>
          <div class="text-center">
              <br>
            <%--<a class="d-block small mt-3" href ="#">Register an Account</a>--%>
            <a class="d-block small" href ="ForgotPassword.aspx">Forgot Password?</a>
             <a class="d-block small derroh" href ="http://brightsofttech.co.ke/" target ="_blank">Powered By JKM Solutions</a>
          </div>
        </div>
      </div>
    </div>
    <div class="modal"></div>
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

      <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="js/jquery.backstretch.min.js"></script>
    <script>
      $.backstretch("images/image.jpg", {speed: 500});
   </script>
    <script>        
        $(document).ready(function () {
            $('#btnlogin').click(function (e) {

                var form = $("#myForm")

                if (form[0].checkValidity() === false) {
                    event.preventDefault()
                    event.stopPropagation()
                    form.addClass('was-validated');
                } else if (form[0].checkValidity() === true) {

                    if ($('#inputEmail').val() == "") {
                        bootbox.error({ title: "Application error", message: "Email cannot be blank" });
                        return;
                    }
                    if ($('#inputPassword').val() == "") {
                        bootbox.error({ title: "Application error", message: "Password cannot be blank" });
                        return;
                    }
                    //spinner
                    showToast('Authenticating');

                    jQuery.ajax({
                        url: 'Login.aspx/UserLogin',
                        type: "POST",
                        data: '{param1:"' + $('#inputEmail').val() + '", param2:"' + $('#inputPassword').val() + '"}',
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
                                    bootbox.error({ title: "Authentication error", message: data.Message });
                                } else {
                                   // bootbox.alert("Authentication success. Redirecting you to your dashboard")
                                    //$('#cardspin').pleaseWait('stop');
                                    window.location.href = "Default.aspx";
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
            $('#inputPassword').keydown(function (e) {
                if (e.keyCode === 13) {

                    var form = $("#myForm")

                    if (form[0].checkValidity() === false) {
                        event.preventDefault()
                        event.stopPropagation()
                        form.addClass('was-validated');
                    } else if (form[0].checkValidity() === true) {

                        if ($('#inputEmail').val() == "") {
                            bootbox.error({ title: "Application error", message: "Email cannot be blank" });
                            return;
                        }
                        if ($('#inputPassword').val() == "") {
                            bootbox.error({ title: "Application error", message: "Password cannot be blank" });
                            return;
                        }
                        //spinner
                        showToast('Authenticating');

                        jQuery.ajax({
                            url: 'Login.aspx/UserLogin',
                            type: "POST",
                            data: '{param1:"' + $('#inputEmail').val() + '", param2:"' + $('#inputPassword').val() + '"}',
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
                                        bootbox.error({ title: "Authentication error", message: data.Message });
                                    } else {
                                        // bootbox.alert("Authentication success. Redirecting you to your dashboard")
                                        //$('#cardspin').pleaseWait('stop');
                                        window.location.href = "Default.aspx";
                                    }
                                }
                            },
                            error: function () {
                                bootbox.error({ title: "Application error", message: "Could not process request" });
                            }
                        });
                    }

                    event.preventDefault();

                }
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