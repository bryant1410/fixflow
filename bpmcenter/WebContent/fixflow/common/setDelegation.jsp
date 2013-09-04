<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../center/formHead.jsp" flush="true" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/fixflow/css/form.css"></link>
<title>设置代理人</title>
<script type="text/javascript">
	$(function(){
	
	})
</script>
</head>
<body>
	<div class="tpl-form-border">
		<div class="formbox">
			<table class="table-form">
				<tr>
					<td class="title-r">操作人:</td>
					<td>${sessionScope.LOGIN_USER_NAME}<input type="hidden"
						value="${sessionScope.LOGIN_USER_ID}" name="operator" /></td>
					<td class="title-r">委托人:</td>
					<td><input type="text" value="${result.agentInfo.agentName}"
						name="agentName" /><input type="hidden" id="agent" name="agent"
						value="${result.agentInfo.agentId}%>" /></td>
				</tr>
				<tr>
					<td class="title-r">开始时间:</td>
					<td><input type="text" id="sdate" name="sdate" readOnly
						value='<fmt:formatDate value="${result.agentInfo.sDate}" type="date"/>'
						onClick="WdatePicker()" /></td>
					<td class="title-r">结束时间:</td>
					<td><input type="text" id="edate" name="edate" readOnly
						value='<fmt:formatDate value="${result.agentInfo.eDate}" type="date"/>'
						onClick="WdatePicker()" /></td>
				</tr>
				<tr>
					<td class="title-r">状态：</td>
					<td><select>
							<option value="1">启用</option>
							<option value="0">停用</option>
					</select></td>
					<td></td>
					<td><input type="hidden" name="viewType" /></td>
				</tr>
			</table>
		</div>
		<div class="listbox">
			<table class="table-list" id="detailTable">
				<thead>
					<tr>
					<!-- 
						<th><input type="checkbox" id="checkall" name="checkall"></th>
						 -->
						<th>流程</th>
						<th>代理人</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${result.agentInfo.detailInfoList}"
						var="dataList" varStatus="index">
						<tr id="row${index.index+1}">
						<!-- 
							<td style="text-align:center"><input type="checkbox" name="check"
								rowindex="${index.index+1}"></td>
								-->
							<td>${dataList.processName}<input
								id="processId" value="${dataList.processId}" name="processId"
								type="hidden"></td>
							<td><label id="auserName">${dataList.auserName}</label><input
								id="auser" name="auser" value="${dataList.auser}" type="hidden">
								<div class="btn-normal">
										<a href="#" onclick="$('#subForm').submit();">选择<em class="arrow-small"></em></a>
									</div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="btn-normal">
				<a href="#" id="saveBtn">保存</a>
			</div>
		</div>
	</div>
</body>
</html>