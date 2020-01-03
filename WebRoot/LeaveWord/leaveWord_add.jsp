<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/leaveWord.css" />
<div id="leaveWordAddDiv">
	<form id="leaveWordAddForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">标题:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="leaveWord_title" name="leaveWord.title" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">留言内容:</span>
			<span class="inputControl">
				<textarea id="leaveWord_leaveContent" name="leaveWord.leaveContent" rows="6" cols="80"></textarea>

			</span>

		</div>
		<div>
			<span class="label">留言时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="leaveWord_addTime" name="leaveWord.addTime" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">留言人:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="leaveWord_userObj_user_name" name="leaveWord.userObj.user_name" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">回复内容:</span>
			<span class="inputControl">
				<textarea id="leaveWord_replyContent" name="leaveWord.replyContent" rows="6" cols="80"></textarea>

			</span>

		</div>
		<div>
			<span class="label">回复时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="leaveWord_replyTime" name="leaveWord.replyTime" style="width:200px" />

			</span>

		</div>
		<div class="operation">
			<a id="leaveWordAddButton" class="easyui-linkbutton">添加</a>
			<a id="leaveWordClearButton" class="easyui-linkbutton">重填</a>
		</div> 
	</form>
</div>
<script src="${pageContext.request.contextPath}/LeaveWord/js/leaveWord_add.js"></script> 
