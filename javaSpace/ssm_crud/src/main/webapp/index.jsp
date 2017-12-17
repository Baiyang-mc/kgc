<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- JQuery -->
<script src="${APP_PATH}/static/Jquery/js/jquery-3.2.1.min.js"></script>
<!-- Bootstrap -->
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>员工列表</title>
</head>
<body>
	<!-- 搭建显示页面 -->
	<div class="container-fluid">
		<!-- 显示标题 -->
		<div class="row">
			<div class="col-md-3 col-md-offset-3">
				<p class="lead text-center">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 显示按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="checked_all">
							</th>
							<th>empId</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 显示页面导航 -->
		<div class="row">
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条 -->
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
	</div>
	<div class="modal fade" id="emp_update_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empName_update_input"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control" id="email_update_input" placeholder="Email@guigu.com">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">
									男
								</label>
								<label class="radio-inline">
									<input type="radio" name="gender" id="gender2_update_input" value="F">
									女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<!-- 提交部门Id即可 -->
								<select class="form-control" name="dId" id="dept_select_input">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="emp_add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control" id="email_add_input" placeholder="Email@guigu.com">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked">
									男
								</label>
								<label class="radio-inline">
									<input type="radio" name="gender" id="gender2_add_input" value="F">
									女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<!-- 提交部门Id即可 -->
								<select class="form-control" name="dId" id="dept_select_input">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="empName_save_btn">Save</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var thisPage;
	var totalRecod;

	$(function()
	{
		to_page(1);

	});

	function to_page(pn)
	{
		$.ajax(
		{
			url : "${APP_PATH}/emps",
			data : "pn=" + pn,
			type : "GET",
			success : function(result)
			{
				console.log(result);
				//1.解析Json并显示分页信息
				builder_emps_table(result);
				//2.解析并显示分页信息
				builder_page_info(result);
				builder_page_nav(result);
			}
		});
	}

	function builder_emps_table(result)
	{
		$("#emps_table tbody").empty();
		var emps = result.extend.pageInfo.list;
		$
				.each(
						emps,
						function(index, item)
						{
							var empCheckbox = $("<td><input type='checkbox' class='check_item'/></td>")
							var empIDTd = $("<td></td>").append(item.empId);
							var empNameTd = $("<td></td>").append(item.empName);
							var genderTd = $("<td></td>").append(
									item.gender == "M" ? "男" : "女");
							var emailTd = $("<td></td>").append(item.email);
							var deptName = $("<td></td>").append(
									item.department.deptName);
							var editBtn = $("<button></button>")
									.addClass("btn btn-primary edit_btn")
									.append(
											$("<span></span>")
													.addClass(
															"glyphicon glyphicon-pencil btn-xs"))
									.append("编辑");
							editBtn.attr("edit-id", item.empId);
							var deletBtn = $("<button></button>")
									.addClass("btn btn-danger delete_btn")
									.append(
											$("<span></span>")
													.addClass(
															"glyphicon glyphicon-trash btn-xs"))
									.append("删除");
							deletBtn.attr("delete-id", item.empId);
							var btnTd = $("<td></td>").append(editBtn).append(
									" ").append(deletBtn);

							$("<tr></tr>").append(empCheckbox).append(empIDTd)
									.append(empNameTd).append(genderTd).append(
											emailTd).append(deptName).append(
											btnTd)
									.appendTo("#emps_table tbody");
						})
	}

	function builder_page_info(result)
	{
		$("#page_info_area").empty();
		$("#page_info_area").append(
				"当前第" + result.extend.pageInfo.pageNum + "页，总共"
						+ result.extend.pageInfo.pages + "页，总共有"
						+ result.extend.pageInfo.total + "条记录");
		totalRecod = result.extend.pageInfo.total;
		thisPage = result.extend.pageInfo.pageNum;
	}
	function builder_page_nav(result)
	{
		$("#page_nav_area").empty();
		var ul = $("<ul></ul>").addClass("pagination");
		var fristPageLi = $("<li></li>").append(
				$("<a></a>").append("首页").attr("href", "#"));
		var prePageLi = $("<li></li>").append(
				$("<a></a>").attr("href", "#").append(
						$("<span></span>").append("&laquo;")));
		if (result.extend.pageInfo.hasPreviousPage == false)
		{
			fristPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		} else
		{
			fristPageLi.click(function()
			{
				to_page(1);
			});
			prePageLi.click(function()
			{
				to_page(result.extend.pageInfo.pageNum - 1);
			});
		}
		var nextPageLi = $("<li></li>").append(
				$("<a></a>").attr("href", "#").append(
						$("<span></span>").append("&raquo;")));
		var lastPageLi = $("<li></li>").append(
				$("<a></a>").append("末页").attr("href", "#"));
		if (result.extend.pageInfo.hasNextPage == false)
		{
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		} else
		{
			nextPageLi.click(function()
			{
				to_page(result.extend.pageInfo.pageNum + 1);
			});
			lastPageLi.click(function()
			{
				to_page(result.extend.pageInfo.pages);
			});
		}
		ul.append(fristPageLi).append(prePageLi);
		$.each(result.extend.pageInfo.navigatepageNums, function(index, item)
		{
			var numLi = $("<li></li>").append(
					$("<a></a>").append(item).attr("href", "#"));
			if (result.extend.pageInfo.pageNum == item)
			{
				numLi.addClass("active");
			}
			numLi.click(function()
			{
				to_page(item);
			});

			ul.append(numLi);
		})
		ul.append(nextPageLi).append(lastPageLi);

		var navEle = $("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area");
	}

	//点击新增并弹出模态框
	$("#emp_add_modal_btn").click(function()
	{
		getDepts("#emp_add_modal select");
		//弹出模态框
		$("#emp_add_modal").modal(
		{
			backdrop : 'static'
		});
		//查出部门信息屏显示在下拉列表中
	});

	function getDepts(ele)
	{
		$(ele).empty();
		$.ajax(
		{
			url : "${APP_PATH}/depts",
			type : "GET",
			success : function(result)
			{
				$.each(result.extend.depts, function()
				{
					$("<option></option>").append(this.deptName).attr("value",
							this.deptId).appendTo(ele);
				});
			}

		});
	}

	//点击保存，添加员工信息
	$("#empName_save_btn").click(function()
	{
		//1.发送ajax请求，将模态框中填写的表单数据提交给服务器

		$.ajax(
		{
			url : "${APP_PATH}/emps",
			data : $("#emp_add_modal form").serialize(),
			type : "POST",
			success : function(result)
			{
				$("#emp_add_modal").modal('hide');
				to_page(totalRecod + 1);
			}

		});

	});

	//1.我们在按钮创建之前就绑定了事件，所以绑定不上
	//1>在创建按钮的时候绑定；2>绑定 live--->on
	$(document).on("click", ".edit_btn", function()
	{
		//1.弹出模态框
		$("#emp_update_modal").modal(
		{
			backdrop : 'static'
		});
		getDepts("#emp_update_modal select");
		//2.查询员工信息
		get_Emp($(this).attr("edit-id"));
		//3.查询员工信息
		$("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
	});

	//根据员工ID查询员工信息
	function get_Emp(id)
	{
		$.ajax(
		{
			url : "${APP_PATH}/emps/" + id,
			type : "GET",
			success : function(result)
			{
				/* console.log(result); */
				var emp = result.extend.emp;
				console.log(emp);
				$("#empName_update_input").text(emp.empName);
				$("#email_update_input").val(emp.email);
				$("#emp_update_modal input[name=gender]").val([ emp.gender ]);
				$("#emp_update_modal select").val([ emp.dId ]);
			}
		});
	}

	//更新用户信息
	$("#emp_update_btn").click(
	//方式1
	/* 			function() {
	 $.ajax({
	 url : "${APP_PATH}/emps/" + $(this).attr("edit-id"),
	 type : "POST",
	 data : $("#emp_update_modal form").serialize()
	 + "&_method=PUT",
	 success : function(result) {
	 alert(result.msg);
	 $("#emp_update_modal").modal('hide');
	 }
	 });

	 } */
	/* 	
	 问题:请求中有数据，但是Employee对象封装不上
	 update tbl_emp where emp_id=1014;
	 原因：tomcat
	 **/

	//方式2
	function()
	{
		$.ajax(
		{
			url : "${APP_PATH}/emps/" + $(this).attr("edit-id"),
			type : "PUT",
			data : $("#emp_update_modal form").serialize(),
			success : function(result)
			{
				$("#emp_update_modal").modal('hide');
				to_page(thisPage);
			}
		});
	});

	//删除员工
	$(document)
			.on(
					"click",
					".delete_btn",
					function()
					{
						if (confirm("确认删除【"
								+ $(this).parents("tr").find("td:eq(2)").text()
								+ "】吗?"))
						{
							$.ajax(
							{
								url : "${APP_PATH}/emps/"
										+ $(this).attr("delete-id"),
								type : "DELETE",
								success : function(result)
								{
									to_page(thisPage);
								}
							});
						}
					});
	$("#checked_all").click(function()
	{
		/* alert($("#checked_all").prop("checked")); */
		$(".check_item").prop("checked", $("#checked_all").prop("checked"));
	});

	$(document).on("click", ".check_item", function()
	{
		$("#checked_all").prop("checked", $(".check_item:checked").length==$(".check_item").length);
	});
	
	$("#emp_delete_all_btn").click(function()
		{	
			var empName="";
			var empId="";
			$.each($(".check_item:checked"),function()
				{
					empName+=$(this).parents("tr").find("td:eq(2)").text()+",";
					empId+=$(this).parents("tr").find("td:eq(1)").text()+"-"; 
				}
			);
			if(empName!=null&&empName.length>=1)
			{
				empName=empName.substring(0,empName.length-1);
				empId=empId.substring(0,empId.length-1);
				if(confirm("确认删除【"+empName+"】吗?")){
					$.ajax(
							{
								url : "${APP_PATH}/emps/"
										+ empId,
								type : "DELETE",
								success : function(result)
								{
									alert(result.msg);
									to_page(thisPage);
								}
							}
						); 
				}
			}else{
				alert("请选择需要删除的员工！");
			}
			
		}
	);
	
</script>
</html>