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
        <div>
            <g:each var="voter" in="${distinctVoters}">
                <p>${voter.username}${voter.weight}</p>
            </g:each>
        </div>
    </div>
</div>
</body>
</html>