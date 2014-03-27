<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main" />
</head>

<body>
    <div style="width: 50%; margin: 0 auto;">
        <div>
            %{--<p>&NonBreakingSpace;</p>--}%
            <p>&NonBreakingSpace;</p>
        </div>
        <div>
            <p>The winner is ${winner.selectionName}</p>
        </div>
        <g:form name="winner" action="awardWinner" class="form-horizontal">
            <g:hiddenField name="winner" value="${winner.selectionName}" />
            <div>
                <input type="submit" value="Submit">
            </div>
        </g:form>
    </div>
</body>
</html>