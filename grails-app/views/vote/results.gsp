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
    <div><g:link action="votes">Back to voting</g:link></div>
    <div><a href="#" class="clear">Clear my votes</a></div>
    <div><g:link action="lotteryWinner">Generate Lottery Winner</g:link></div>
    <div><g:link action="majorityWinner">Generate Majority Winner</g:link></div>
    <div><g:link action="showVoters">Show those who have voted</g:link></div>
    <div id="clearModal" class="modal hide fade" >
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>Clear my votes</h3>
        </div>
        <div class="modal-body">
            <g:form name="clear" action="clear" class="form-horizontal">
                <div id="username" class="control-group">
                    <g:textField name="username" value="Enter your name" />
                </div>
                <div>
                    <input type="submit" value="Submit">
                </div>
            </g:form>
        </div>
    </div>
    <script type="text/javascript">
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