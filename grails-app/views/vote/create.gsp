<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Lunch Vote</title>

</head>
<body>
    <g:form name="add" action="create">

        <div>
            <p><label class="checkbox"><g:checkBox name="sample1" value="true"/> sample1</label></p>
            <p><label class="checkbox"><g:checkBox name="sample2" value="true"/> sample2</label></p>
            <p><label class="checkbox"><g:checkBox name="sample3" value="true"/> sample3</label></p>
            <p><g:textField name="username" value="Enter your name" /></p>
        </div>
        <g:actionSubmit value="Vote!"/>
    </g:form>


</body>
</html>