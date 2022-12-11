<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Halaman Login</title>
        <style type="text/css">
            html, body {
                width: 100%;
            }
            table{
                margin: 0 auto;
            }
            h1{
                text-align: center;
            }
        </style>
    </head>
    <script type="text/javascript">
        function validasi_input(form) {
            if (form.username.value == "") {
                alert("Username masih kosong!");
                form.username.focus();
                return (false);
            } else if (form.password.value == "") {
                alert("Password masih kosong!");
                form.password.focus();
                return (false);
            }
            return (true);
        }
    </script>
    <body bgcolor="#AACCEE">
        <h1>Login</h1>
        <form method="post" action="Login?proses=login" onsubmit="return validasi_input(this)">
            <table border="1" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2">Login Aplikasi</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                        <input type="submit" value="Login"/> <input type="reset" value="Reset"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>