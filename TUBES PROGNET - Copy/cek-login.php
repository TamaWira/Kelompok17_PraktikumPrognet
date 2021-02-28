<?php
    include("koneksi.php");

    function notification($title, $text, $type){
        return "<script language=\"javascript\">
                    swal({
                        title: \"{$title}\",
                        text: \"{$text}\",
                        type: \"{$type}\"

                    });
                </script>";
    }
    function notification2($position, $type, $title, $location){
        return "<script language=\"javascript\">
                    const Toast = Swal.mixin({
                        toast: true,
                        position: \"{$position}\",
                        showConfirmButton: false,
                        timer: 2000
                    });

                    Toast.fire({
                        type: \"{$type}\",
                        title: \"{$title}\",
                    }).then(function(){
                        window.location = \"{$location}\";
                    });
        </script>";
    }
?>

<html>
<head>
    <!-- sweet alert -->
    <link rel="stylesheet" type="text/css" href="css/sweetalert2.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.33.1/sweetalert2.min.js"></script>
    <!-- end sweet alert -->
<?php
    if(!isset($_SESSION))
    {
        session_start();
    }

    include 'koneksi.php';

    if(isset($_POST['login-button'])){
        $user_name = $_POST['iduser'];
        $password = SHA1($_POST['password']);

        $select_user= "SELECT * FROM admin where username='$user_name' and password='$password' and status=1";
        $result = $conn->query($select_user);

        if ($result->num_rows == 1) {
            while ($row = $result->fetch_assoc()){
                if ($row['role'] == 'PEGAWAI') {
                    $_SESSION['username'] = true;
                    echo notification2('center','success','Signed in successfully','index.php');
                } else if ($row['role'] == 'ADMIN' || $row['role'] == 'MANAGER'){
                    echo notification('Warning!','Pastikan anda login sebagai Pegawai!','error','login.php');
                }
            }
        } else {
            echo "<script>event.preventDefault()</script>";
            echo notification('Warning!','Username atau Password salah!','error','login.php');

        }
        $_SESSION['nama_pegawai'] = $_POST['iduser'];
    }
?>
</head>
</html>
