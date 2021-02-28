<?php
    session_start();
    include("koneksi.php");
    if (isset($_SESSION['username'])){
        header("Location: index.php");
        die();
    }

?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login Sistem Pasar</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Link Bootstrap, CSS, JS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="asset\CSS\login.css" type="text/css">
        <link href="css/sweetalert2.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> 
    </head>
    <body class="form-login-body"> 
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 mx-auto login-desk">
                       <div class="row">
                            <div class="col-md-7 detail-box">
                                    <span class="sistem-txt">Sistem</span>
                                    <span class="pasar-txt">Pasar</span>
                                <div class="detailsh">
                                     <img class="help" src="asset\Images\help.png" alt="">
                                    <h3>TUGAS BESAR PEMROGRAMAN INTERNET E</h3>
                                    <p>Modul Pembayaran Kontrak Tahunan Lapak</p>
                                </div>
                            </div>
                            <div class="col-md-5 loginform">
                                 <h4>Selamat Datang</h4>                   
                                 <p>Masuk ke akun Anda</p>
                                 <div class="login-det">
                                 <form autocomplete="off" method="POST" action="" class="form-login" action="check-login.php" method="post">
                                    <div class="form-row">
                                         <label for="">Username</label>
                                             <div class="input-group mb-3">
                                              <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                              </div>
                                              <input type="text" id="inputId" class="form-control" placeholder="Enter Username" aria-label="Username" aria-describedby="basic-addon1" name="iduser">
                                         </div>
                                    </div>
                                    <div class="form-row">
                                         <label for="">Password</label>
                                             <div class="input-group mb-3">
                                              <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1">
                                                    <i class="fa fa-lock"></i>
                                                </span>
                                              </div>
                                              <input type="password" id="inputPass" class="form-control" placeholder="Enter Password" aria-label="Username" aria-describedby="basic-addon1" name="password">
                                         </div>
                                    </div>
                                    
                                    <p class="forget"><a href="">Forget Password?</a></p>
                                    
                                    <button id="login-button" class="btn btn-sm btn-danger" type="submit" name="login-button">Login
                                        <?php
                                            include("cek-login.php");
                                        ?>
                                    </button>
                                    </form>  
                                 </div>
                            </div>
                       </div>
                      
                    </div>
                </div>
            </div>
    </body>
<html>