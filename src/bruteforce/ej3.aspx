<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <script>
        var maxAttempts = 3;
        var attemptCount = 0;

        function validateLogin() {
            var username = document.getElementById('<%= txtUsername.ClientID %>').value;
            var password = document.getElementById('<%= txtPassword.ClientID %>').value;

            // Validate username and password
            if (username === "" || password === "") {
                alert("Please enter username and password");
                return false;
            }

            attemptCount++;
            if (attemptCount >= maxAttempts) {
                alert("Maximum login attempts exceeded. Please try again later.");
                document.getElementById('<%= btnLogin.ClientID %>').disabled = true; // Disable login button after maximum attempts
            }
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateLogin()">
        <div>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label><br />
            Username: <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox><br />
            Password: <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
