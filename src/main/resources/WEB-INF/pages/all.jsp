<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Prog.kiev.ua</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <h1>Photo List</h1>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul id="photosList" class="nav navbar-nav">
                    <li><button type="button" id="add_photo" class="btn btn-default navbar-btn">Add Photo</button></li>
                    <li><button type="button" id="delete_photo" class="btn btn-default navbar-btn">Delete Photo</button></li>
                </ul>
            </div>
        </div>
    </nav>

    <table class="table table-striped">
        <thead>
        <tr>
            <td></td>
            <td><b>id</b></td>
            <td><b>Image</b></td>
        </tr>
        </thead>
        <c:forEach items="${photo}" var="entry">
            <tr>
                <td><input type="checkbox" name="toDelete[]" value="${entry.key}" id="checkbox_${entry.key}"/></td>
                <td>${entry.key}</td>
                <td><br/><br/><img src="/photo/${entry.key}" /></td>

            </tr>
        </c:forEach>
    </table>

    <nav aria-label="Page navigation">
        <ul class="pagination">
            <c:forEach var="i" begin="1" end="${pages}">
                <li><a href="/all/<c:out value="${i - 1}"/>"><c:out value="${i}"/></a></li>
            </c:forEach>
        </ul>
    </nav>
</div>

<script>
    $('.dropdown-toggle').dropdown();

    $('#add_photo').click(function(){
        window.location.href='/';
    });

    $('#delete_photo').click(function(){
        var data = { 'toDelete[]' : []};
        $(":checked").each(function() {
            data['toDelete[]'].push($(this).val());
        });
        $.post("/photos/delete", data, function(data, status) {
            window.location.reload();
        });
    });
</script>
</body>
</html>
