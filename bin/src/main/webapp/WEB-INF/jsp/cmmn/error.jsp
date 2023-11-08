<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>error</title>
</head>
<body>
<!-- container -->
<div id="layout-container">
        <div id="layout-content">
            <div class="area_error">
                <h3>홈페이지 이용에 불편을 드려 죄송합니다.</h3>
                <p><c:out value='${msg}'/><br/>일시적인 현상이거나 네트워크 문제일 수 있으니, 잠시 후 다시 이용 부탁드립니다.</p>
                <div class="area_btn mt30">
                    <button class="btn_confirm" type="button" onclick="history.back(-1)">확인</button>
                </div>
            </div>
        </div>
        <!-- //layout-content -->
</div>
<!-- //container -->
</body>
</html>
