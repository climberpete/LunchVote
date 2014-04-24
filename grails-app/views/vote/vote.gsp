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
        <!--  Carousel - consult the Twitter Bootstrap docs at
      http://twitter.github.com/bootstrap/javascript.html#carousel -->
        <div id="this-carousel-id" class="carousel slide"><!-- class of slide for animation -->
            <div class="carousel-inner">
            <g:set var="first" value="true" />
                <g:each var="restaurant" in="${restaurantList}">
                    <g:if test="${restaurant.imageUrl}">
                        <g:if test="${first == "true"}">
                            <div class="item active">
                            <g:set var="first" value="false" />
                        </g:if>
                        <g:else><div class="item"></g:else>
                            <img width="600" height="400" src="${restaurant.imageUrl}" alt="" />
                            <div class="carousel-caption">
                                <g:if test="${restaurant.description}">
                                    <p>${restaurant.name} - ${restaurant.description}</p>
                                </g:if>
                                <g:else>
                                    <p>${restaurant.name}</p>
                                </g:else>
                            </div>
                        </div>
                    </g:if>
                </g:each>
            </div><!-- /.carousel-inner -->
        <!--  Next and Previous controls below
        href values must reference the id for this carousel -->
            <a class="carousel-control left" href="#this-carousel-id" data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#this-carousel-id" data-slide="next">&rsaquo;</a>
        </div><!-- /.carousel -->
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
                    <p><label class="checkbox"><g:checkBox name="restaurants" value="${restaurant.id}" checked="false"/>
                    <g:if test="${restaurant.website}">
                        <a href="${restaurant.website}" title="${restaurant.description}">${restaurant.name}</a>
                    </g:if>
                    <g:else>
                        <span title="${restaurant.description}">${restaurant.name}</span>
                    </g:else>
                        <a href="#" class="editRestaurant${restaurant.id}"><i class="icon-edit" ></i></a>
                    </label></p>
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
                <g:form name="addRestaurant" action="addRestaurant" class="well form-horizontal">
                    <div id="restaurant" class="control-group">
                        <label class="control-label" for="addName">Restaurant Name *</label>
                        <div class="controls">
                            <g:textField name="addName"/>
                        </div>
                        <label class="control-label" for="addDescription">Description</label>
                        <div class="controls">
                            <g:textField name="addDescription"/>
                        </div>
                        <label class="control-label" for="addWebsite">Website</label>
                        <div class="controls">
                            <g:textField name="addWebsite"/>
                        </div>
                        <label class="control-label" for="addImageUrl">Image Url</label>
                        <div class="controls">
                            <g:textField name="addImageUrl"/>
                        </div>
                    </div>
                    <div class="right">
                        <input type="submit" value="Submit">
                    </div>
                </g:form>
            </div>
        </div>
        <g:each var="restaurant" in="${restaurantList}">
            <div id="modifyModal${restaurant.id}" class="modal hide fade" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3>Modify Restaurant</h3>
                </div>
                <div class="modal-body">
                    <g:form name="editRestaurant" action="editRestaurant" class="well form-horizontal">
                        <div id="restaurant" class="control-group">
                            <g:hiddenField name="editRestaurantId" value="${restaurant.id}" />
                            <label class="control-label" for="editDescription">Description</label>
                            <div class="controls">
                                <g:textField name="editDescription" value="${restaurant.description}"/>
                            </div>
                            <label class="control-label" for="editWebsite">Website</label>
                            <div class="controls">
                                <g:textField name="editWebsite" value="${restaurant.website}"/>
                            </div>
                            <label class="control-label" for="editImageUrl">Image Url</label>
                            <div class="controls">
                                <g:textField name="editImageUrl" value="${restaurant.imageUrl}"/>
                            </div>
                        </div>
                        <div class="right">
                            <input type="submit" value="Submit">
                        </div>
                    </g:form>
                </div>
            </div>
            <script type="text/javascript">
                $(function(){
                    $(".editRestaurant${restaurant.id}").click(function() {
                        $("#modifyModal${restaurant.id}").modal();
                    })
                });
            </script>
        </g:each>
    </div>
    </div>

    <script type="text/javascript">
        $(function(){
            $(".addRestaurant").click(function() {
                $("#addModal").modal();
            })
        });
//        $(function() {
//            $('input[type=text]').focus(function() {
//                $(this).val('')
//            });
//        });
    </script>
    <script>
        $(document).ready(function(){
            $('.carousel').carousel();
        });
    </script>
</body>
</html>