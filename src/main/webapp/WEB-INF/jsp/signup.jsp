<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
   <head>
       <title>Signup</title>
   </head>
    <body>
        <h3>Welcome, Enter The details to sign up</h3>
        <form:form method="POST" action="signup" modelAttribute="credentials">
             <table>
                <tr>
                    <td><form:label path="username">Email ID</form:label></td>
                    <td><form:input path="username"/></td>
                </tr>
                <tr>
                    <td><form:label path="password">Password</form:label></td>
                    <td><form:password path="password"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="SignUp"/></td>
                </tr>
            </table>
        </form:form>
    </body>
</html>