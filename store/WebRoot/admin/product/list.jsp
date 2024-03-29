<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${pageContext.request.contextPath}/css/Style1.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			function addProduct(){
				window.location.href = "${pageContext.request.contextPath}/adminProduct?method=addUI";
			}
		</script>
	</HEAD>
	<body>
		<br>
		<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/user/list.jsp" method="post">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
				<TBODY>
					<tr>
						<td class="ta_01" align="center" bgColor="#afd1f3">
							<strong>商品列表</strong>
						</TD>
					</tr>
					<tr>
						<td class="ta_01" align="right">
							<button type="button" id="add" name="add" value="添加" class="button_add" onclick="addProduct()">
添加商品
</button>

						</td>
					</tr>
					<tr>
						<td class="ta_01" align="center" bgColor="#f5fafe">
							<table cellspacing="0" cellpadding="1" rules="all"
								bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr
									style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

									<td align="center" width="18%">
										序号
									</td>
									<td align="center" width="17%">
										商品图片
									</td>
									<td align="center" width="17%">
										商品名称
									</td>
									<td align="center" width="17%">
										商品价格
									</td>
									<td align="center" width="17%">
										是否热门
									</td>
									<td width="7%" align="center">
										编辑
									</td>
									<td width="7%" align="center">
										下架
									</td>
								</tr>
								<c:forEach items="${pageBean.list}" var="p" varStatus="vs">
										<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE'">
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="18%">
												${vs.count }
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												<img width="40" height="45" src="${pageContext.request.contextPath }/${p.pimage}">
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												${p.pname}
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												${p.shop_price }
											</td>
											<td style="CURSOR: hand; HEIGHT: 22px" align="center"
												width="17%">
												<c:if test="${p.is_hot==1 }">是</c:if>
												<c:if test="${p.is_hot!=1 }">否</c:if>
											</td>
											<td align="center" style="HEIGHT: 22px">
												<a href="${ pageContext.request.contextPath }/adminProduct?method=editUI&pid=${p.pid}&flag=0">
													<img src="${pageContext.request.contextPath}/images/i_edit.gif" border="0" style="CURSOR: hand">
												</a>
											</td>
									
											<td align="center" style="HEIGHT: 22px">
												<a href="${ pageContext.request.contextPath }/adminProduct?method=lf&pid=${p.pid}&currPage=${pageBean.currPage}&flag=0">
													<img src="${pageContext.request.contextPath}/images/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
												</a>
											</td>
										</tr>
									</c:forEach>
									<tr>
										<td colspan="9">
											<center>
											<c:if test="${pageBean.currPage ==1 }">
												<a class="btn btn-default">[首页]</a> <a class="btn btn-default">[上一页]</a>
											</c:if>
											<c:if test="${pageBean.currPage !=1 }">
												<a class="btn btn-default" href="${pageContext.request.contextPath }/adminProduct?method=findAll&flag=0&currPage=1">[首页]</a>  
												<a class="btn btn-default" href="${pageContext.request.contextPath }/adminProduct?method=findAll&flag=0&currPage=${pageBean.currPage-1}">[上一页]</a> 
											</c:if>
											<c:if test="${pageBean.currPage==(pageBean.totalPage-1)&& pageBean.totalPage>=5}">
													<a style="font-size: 25px" href="${pageContext.request.contextPath }/adminProduct?method=findAll&flag=0&currPage=${pageBean.totalPage-4}">${pageBean.totalPage-4 }</a>
											</c:if>
											
											
											<c:if test="${pageBean.currPage==pageBean.totalPage && pageBean.totalPage==4}">
												<a style="font-size: 25px" href="${pageContext.request.contextPath }/adminProduct?method=findAll&flag=0&currPage=1">1</a>
											</c:if>
											<c:if test="${pageBean.currPage==pageBean.totalPage && pageBean.totalPage>=5}">
												<a style="font-size: 25px" href="${pageContext.request.contextPath }/adminProduct?method=findAll&flag=0&currPage=${pageBean.totalPage-4}">${pageBean.totalPage-4 }</a>
												<a style="font-size: 25px" href="${pageContext.request.contextPath }/adminProduct?method=findAll&flag=0&currPage=${pageBean.totalPage-3}">${pageBean.totalPage-3 }</a>
											</c:if>
											<c:forEach begin="${(pageBean.currPage-2)>0 ? pageBean.currPage-2:1 }" 
														end="${(pageBean.currPage+2)<pageBean.totalPage?pageBean.currPage+2:pageBean.totalPage }"
														 var="i">
													<c:if test="${pageBean.currPage==i }">
														<font size="5">${i }</font>
													</c:if>
													<c:if test="${pageBean.currPage!=i }">
														<a style="font-size: 25px" href="${pageContext.request.contextPath }/adminProduct?method=findAll&flag=0&currPage=${i}">${i }</a>
													</c:if>
											</c:forEach>
											<c:if test="${pageBean.currPage==1 && pageBean.totalPage==4}">
													<a style="font-size: 25px" href="${pageContext.request.contextPath }/adminProduct?method=findAll&flag=0&currPage=4">4</a>
											</c:if>
											<c:if test="${pageBean.currPage==1 && pageBean.totalPage>=5}">
													<a style="font-size: 25px" href="${pageContext.request.contextPath }/adminProduct?method=findAll&flag=0&currPage=4">4</a>
													<a style="font-size: 25px" href="${pageContext.request.contextPath }/adminProduct?method=findAll&flag=0&currPage=5">5</a>
											</c:if>
											<c:if test="${pageBean.currPage==2 && pageBean.totalPage>=5}">
													<a style="font-size: 25px" href="${pageContext.request.contextPath }/adminProduct?method=findAll&flag=0&currPage=5">5</a>
											</c:if>
											
											
											<c:if test="${pageBean.currPage==pageBean.totalPage }">
												<a class="btn btn-default">[下一页]</a> <a class="btn btn-default">[尾页]</a>
											</c:if>
											<c:if test="${pageBean.currPage!=pageBean.totalPage }">
												<a class="btn btn-default" href="${pageContext.request.contextPath }/adminProduct?method=findAll&flag=0&currPage=${pageBean.currPage+1}">[下一页]</a> 
												<a class="btn btn-default" href="${pageContext.request.contextPath }/adminProduct?method=findAll&flag=0&currPage=${pageBean.totalPage}">[尾页]</a>
											</c:if>
											<font size="5">	${pageBean.currPage }/${pageBean.totalPage }页</font>
										</center>
									</td>
									</tr>									
							</table>
						</td>
					</tr>
				</TBODY>
			</table>
		</form>
	</body>
</HTML>

