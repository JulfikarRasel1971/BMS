<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scaled=1.0">
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <title>Login or Sign Up Form</title>
    <link rel="stylesheet" href="signup.css">
</head>

<body>
    <div class="container">
        <div class="forms-container">
            <div class="login-signup">
                <form action="" class="login-form">
                    <h2 class="title">Login</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" placeholder="Username or Email">
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="Password" placeholder="Password">
                    </div>
                    <input type="submit" value="Login" class="btn solid">
                    <p class="social-text">Or Login with Social Platform</p>
                    <div class="social-me"></div>
                    <a href="#" class="social-icon">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-instagram"></i>
                    </a>
                </form>
                <form action="SignUp.php" method="post" enctype="multipart/form-data" class="signup-form">
                    <h2 class="title">Sign up</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" placeholder="FirstName" id="FirstName" name="FirstName" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" placeholder="LastName" id="LastName" name="LastName" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-mobile"></i>
                        <input type="tel" placeholder="Phone_No" id="Phone_No" name="Phone_No" >
                    </div>
                    <div class="input-field">
                        <i class="fas fa-calendar"></i>
                        <input type="date" placeholder="dateofbirth" id="dateofbirth" name="dateofbirth" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-envelope"></i>
                        <input type="text" placeholder="email" id="email" name="email" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="Password" placeholder="password" id="password" name="password" />
                    </div>
                    <input type="submit" value="Sign-Up" class="btn solid" id="submit" name="submit">
                    <p class="social-text">Or Sign-Up with Social Platform</p>
                    <div class="social-me"></div>
                    <a href="https://www.facebook.com/login/" class="social-icon">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="https://accounts.google.com/v3/signin/identifier?dsh=S1007010555%3A1662614585865118&service=accountsettings&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=AQN2RmWM6L-jouoOrfYO1eOfxxkcXJ2Szi3K6p4chf5ltWy1HbcMbJS3Nh6AUsllxt4AlGOK_GK30g"
                        class="social-icon">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-instagram"></i>
                    </a>
                </form>
            </div>
        </div>
        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>New Here ?</h3>
                    <p>Sign Up Or Login To Book Your Ticket</p>
                    <button class="btn transparent" id="signup-btn">Sign Up</button>
                </div>

                <img src="bus2.svg" class="image" alt="">
            </div>

            <div class="panel right-panel">
                <div class="content">
                    <h3>Already a Member ?</h3>
                    <p>Just Login and Book your Ticket!</p>
                    <button class="btn transparent" id="login-btn">Login</button>
                </div>

                <img src="bus3.svg" class="image" alt="">
            </div>
        </div>
    </div>
    <script src="app.js"></script>
</body>

</html>

<?php
include("connect.php");
if (isset($_POST['submit'])) 
{      
        $FirstName = $_POST['FirstName'];
        $LastName = $_POST['LastName'];
        $Phone_No = $_POST['Phone_No'];
        $dateofbirth = $_POST['dateofbirth'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $num=rand(10,1000);
        $id = "FMT-".$num;

        $query="insert into signup values('$id','$FirstName','$LastName','$Phone_No','$dateofbirth','$email','$password')";
        if(mysqli_query($con,$query))
        {
            echo "successfully inserted";
        }
        else
        {
            echo "error".mysqli_error($con);
        }
}        
?>