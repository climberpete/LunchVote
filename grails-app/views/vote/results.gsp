<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Results</title>
    <meta name="layout" content="main" />
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load("visualization", "1", {packages:["corechart"]});
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable(
                ${results}
            );

            var options = {
                title: 'Team Lunch Leaderboard',
                vAxis: {titleTextStyle: {color: 'red'}}
            };

            var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</head>

<body>
    <div id="chart_div" style="width: 900px; height: 500px;"></div>
    <sec:ifLoggedIn>
        <div><g:link action="votes">Back to voting</g:link></div>
        <div><a href="#" class="clear">Clear my votes</a></div>
    </sec:ifLoggedIn>
    <sec:ifAllGranted roles="ROLE_ADMIN">
        <div><g:link action="lotteryWinner">Generate Lottery Winner</g:link></div>
        <div><g:link action="majorityWinner">Generate Majority Winner</g:link></div>
        <div><g:link action="showVoters">Show those who have voted</g:link></div>
        <div><a href="#" class="addUser">Add User</a></div>
    </sec:ifAllGranted>

    <div id="clearModal" class="modal hide fade" >
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>Clear my votes</h3>
        </div>
        <div class="modal-body">
            <g:form name="clear" action="clear" class="form-horizontal">
                <div id="username" class="control-group">
                    Are you sure you want to clear your votes for this week?
                </div>
                <div>
                    <input type="submit" value="Yes">
                </div>
            </g:form>
        </div>
    </div>
    <div id="addUser" class="modal hide fade" >
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>Add user</h3>
        </div>
        <div class="modal-body">
            <g:form name="addUser" action="addUser" class="form-horizontal">
                <div id="username" class="control-group">
                    <g:textField name="username" value="Enter username" />
                </div>
                <div id="password" class="control-group">
                    <g:passwordField name="password" value="" />
                </div>
                <div>
                    <input type="submit" value="Submit">
                </div>
            </g:form>
        </div>
    </div>
    <script type="text/javascript">
        $(function(){
            $(".addUser").click(function() {
                $("#addUser").modal();
            })
        });
        $(function(){
            $(".clear").click(function() {
                $("#clearModal").modal();
            })
        });
        $(function() {
            $('input[type=text]').focus(function() {
                $(this).val('')
            });
        });
    </script>
</body>
</html>