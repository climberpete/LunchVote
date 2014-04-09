<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main" />
</head>

<body>
    <div style="width: 50%; margin: 0 auto;">
    <div>
        <p>&NonBreakingSpace;</p>
    </div>
    <div>
        <div>
            <a href="#" class="addRestaurant">Click here to add a restaurant</a>
        </div>
        <div>
            <p>&NonBreakingSpace;</p>
        </div>
        <hr>
        <div>
            <p>Or vote for <b>many</b> of these:</p>
            <g:form name="restaurants" action="submit" class="form-horizontal">
                <g:each var="restaurant" in="${restaurantList}">
                    <p><label class="checkbox"><g:checkBox name="restaurants" value="${restaurant.selectionName}" checked="false"/>${restaurant.selectionName}</label></p>
                </g:each>
                <div>
                    <p>&NonBreakingSpace;</p>
                </div>
                <div>
                    <input type="submit" value="Submit">
                </div>
            </g:form>
        </div>
        <div id="addModal" class="modal hide fade" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3>Add New Restaurant</h3>
            </div>
            <div class="modal-body">
                <g:form name="addRestaurant" action="create" class="form-horizontal">
                    <div id="restaurant" class="control-group">
                        <g:textField name="restaurant" value="Enter restaurant name" />
                    </div>
                    <div>
                        <input type="submit" value="Submit">
                    </div>
                </g:form>
            </div>
        </div>
    </div>
    </div>

    <script type="text/javascript">
        $(function(){
            $(".addRestaurant").click(function() {
                $("#addModal").modal();
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