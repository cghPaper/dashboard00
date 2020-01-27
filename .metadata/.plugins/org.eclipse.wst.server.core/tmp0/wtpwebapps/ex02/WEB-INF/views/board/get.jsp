<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
<!-- <form role="form" action="/board/modify" method="post"> -->
	<%-- <div class="form-group">
		<label>Bno</label>
		<input class="form-control" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>Title</label>
		<input class="form-control" name='title' value='<c:out value="${board.title }"/>' readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>Text area</label>
		<textarea class="form-control" rows="3" name='content' readonly="readonly">
			<c:out value="${board.content }"/>
		</textarea>
	</div> --%>
	
	<div class="form-group">
		<label>Writer</label>
		<input class="form-control" name='writer' value='<c:out value="${board.writer }"/>' readonly="readonly">
	</div>
	
	<%-- <div class="form-group">
		<label>RegDate</label>
		<input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate }" />' readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>Update Date</label>
		<input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updatedate }" />' readonly="readonly">
	</div>	 --%>
	<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
	<button type="submit" data-oper='list' class="btn btn-info">List</button>
<!-- </form> -->
<form id='operForm' method="get">
	<input type="hidden" id='bno' name='bno' value='<c:out value="${board.bno }"/>'>
</form>
<%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	var operForm = $("#operForm");
	$("button[data-oper='modify']").on("click", function(e) {
		operForm.attr("action", "/board/modify").submit();
	});
	$("button[data-oper='list']").on("click", function(e) {
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/list").submit();
		operForm.submit();
	});
});
</script>