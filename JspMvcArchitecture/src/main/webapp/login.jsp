<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <title>GoVeg Store</title>

</head>
<body>
	<h1>GoVeg Store</h1>
    <form method ="get" action="ValidateUser.jsp">
        <div class="box">
            <div class="container">

                <div class="top">
                    
                    <header>Login</header>
                </div>

                <div class="input-field">
                    <input type="text" class="input" placeholder="Username" name="userName" required>
                    <i class='bx bx-user' ></i>
                </div>

                <div class="input-field">
                    <input type="Password" class="input" placeholder="Password" name="password" required>
                    <i class='bx bx-lock-alt'></i>
                </div>

                <div class="input-field">
                    <input type="submit" class="submit" value="Login" id="">
                </div>

            
            </div>
        </div>  
    </form>
</body>
</html>