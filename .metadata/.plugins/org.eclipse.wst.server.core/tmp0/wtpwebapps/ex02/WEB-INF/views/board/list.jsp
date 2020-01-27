<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board List Page
                            <button id="regBtn" type="button" class="btn btn-secondary" data-dismiss="modal" style="float:right">Register New Board</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>#번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${list}" var="board">
                                    <tr>
                                    	<td><c:out value="${board.bno}"/></td>
                                    	<td><c:out value="${board.title}"/></td>
                                    	<td><c:out value="${board.writer}"/></td>
                                    	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                                    	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}"/></td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div id="myModal" class="modal" tabindex="-1" role="dialog">
            	<div class="modal-dialog" role="document">
            		<div class="modal-content">
            			<div class="modal-header">
            				<h5 class="modal-title">Modal title</h5>
            				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
            					<span aria-hidden="true">&times;</span>
			        		</button>
			      		</div>
			      		<div class="modal-body"></div>
			        	<div class="modal-footer"></div>
			    	</div>
			    </div>
			</div>         
<%@include file="../includes/footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		history.replaceState({},null,null);
		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}
			if (parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 처리되었습니다.");
			}
			$("#myModal").modal("show");
		}
		$("#regBtn").on("click", function() {
			self.location = "/board/register";
		});
	});
</script>