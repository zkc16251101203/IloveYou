$(function () {
	$.ajax({
		url : "LeaveWord/" + $("#leaveWord_leaveWordId_edit").val() + "/update",
		type : "get",
		data : {
			//leaveWordId : $("#leaveWord_leaveWordId_edit").val(),
		},
		beforeSend : function () {
			$.messager.progress({
				text : "正在获取中...",
			});
		},
		success : function (leaveWord, response, status) {
			$.messager.progress("close");
			if (leaveWord) { 
				$("#leaveWord_leaveWordId_edit").val(leaveWord.leaveWordId);
				$("#leaveWord_leaveWordId_edit").validatebox({
					required : true,
					missingMessage : "请输入留言id",
					editable: false
				});
				$("#leaveWord_title_edit").val(leaveWord.title);
				$("#leaveWord_title_edit").validatebox({
					required : true,
					missingMessage : "请输入标题",
				});
				$("#leaveWord_leaveContent_edit").val(leaveWord.leaveContent);
				$("#leaveWord_leaveContent_edit").validatebox({
					required : true,
					missingMessage : "请输入留言内容",
				});
				$("#leaveWord_addTime_edit").val(leaveWord.addTime);
				$("#leaveWord_userObj_user_name_edit").combobox({
					url:"UserInfo/listAll",
					valueField:"user_name",
					textField:"name",
					panelHeight: "auto",
					editable: false, //不允许手动输入 
					onLoadSuccess: function () { //数据加载完毕事件
						$("#leaveWord_userObj_user_name_edit").combobox("select", leaveWord.userObjPri);
						//var data = $("#leaveWord_userObj_user_name_edit").combobox("getData"); 
						//if (data.length > 0) {
							//$("#leaveWord_userObj_user_name_edit").combobox("select", data[0].user_name);
						//}
					}
				});
				$("#leaveWord_replyContent_edit").val(leaveWord.replyContent);
				$("#leaveWord_replyTime_edit").val(leaveWord.replyTime);
			} else {
				$.messager.alert("获取失败！", "未知错误导致失败，请重试！", "warning");
				$(".messager-window").css("z-index",10000);
			}
		}
	});

	$("#leaveWordModifyButton").click(function(){ 
		if ($("#leaveWordEditForm").form("validate")) {
			$("#leaveWordEditForm").form({
			    url:"LeaveWord/" +  $("#leaveWord_leaveWordId_edit").val() + "/update",
			    onSubmit: function(){
					if($("#leaveWordEditForm").form("validate"))  {
	                	$.messager.progress({
							text : "正在提交数据中...",
						});
	                	return true;
	                } else {
	                    return false;
	                }
			    },
			    success:function(data){
			    	$.messager.progress("close");
                	var obj = jQuery.parseJSON(data);
                    if(obj.success){
                        $.messager.alert("消息","信息修改成功！");
                        $(".messager-window").css("z-index",10000);
                        //location.href="frontlist";
                    }else{
                        $.messager.alert("消息",obj.message);
                        $(".messager-window").css("z-index",10000);
                    } 
			    }
			});
			//提交表单
			$("#leaveWordEditForm").submit();
		} else {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		}
	});
});
