<%@page import="domain.Product"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="工具.cookUtils"%>
<%@page import="service_impl.ProductServiceImpl"%>
<%@page import="service.ProductService"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>商品列表</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />

		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
				width: 100%;
			}
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			}
		</style>
	</head>

	<body>
		
		<jsp:include page="/jsp/head.jsp"></jsp:include>
		<div class="container-fluid">
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath }/index.jsp">首页</a></li>
				</ol>
		</div>
		<div class="container-fluid">
		<div class="row" style="width:1210px;margin:0 auto;">
			<c:forEach items="${pageBean.list}" var="p">
				<div class="col-md-2  col-sm-4 col-xs-6">
					<a href="${pageContext.request.contextPath}/product?method=getById&pid=${p.pid}">
						<img src="${pageContext.request.contextPath}/${p.pimage}" width="170" height="170" style="display: inline-block;">
					</a>
					<p><a href="${pageContext.request.contextPath}/product?method=getById&pid=${p.pid}" style='color:green'>${fn:substring(p.pname,0,10)}...</a></p>
					<p><font color="#FF0000">商城价：&yen;${p.shop_price }</font></p>
				</div>
			</c:forEach>
			</div>
		</div>
		
		<div class="container-fluid">
		<!--分页 -->
		<div style="width:380px;margin:0 auto;margin-top:50px;">
			<ul class="pagination" style="text-align:center; margin-top:10px;">
				<c:if test="${pageBean.currPage==1 }">
					<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
				</c:if>
				<c:if test="${pageBean.currPage!=1 }">
					<li><a href="${pageContext.request.contextPath }/product?method=findByPage&cid=${param.cid}&currPage=${pageBean.currPage-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
				</c:if>
				
					<c:if test="${pageBean.currPage==(pageBean.totalPage-1)&& pageBean.totalPage>=5}">
							<li><a href="${pageContext.request.contextPath }/product?method=findByPage&cid=${param.cid}&currPage=${pageBean.totalPage-4}">${pageBean.totalPage-4 }</a></li>
					</c:if>
					
					
					<c:if test="${pageBean.currPage==pageBean.totalPage && pageBean.totalPage==4}">
						<li><a href="${pageContext.request.contextPath }/product?method=findByPage&cid=${param.cid}&currPage=1">1</a></li>
					</c:if>
					<c:if test="${pageBean.currPage==pageBean.totalPage && pageBean.totalPage>=5}">
						<li><a href="${pageContext.request.contextPath }/product?method=findByPage&cid=${param.cid}&currPage=${pageBean.totalPage-4}">${pageBean.totalPage-4 }</a></li>
						<li><a href="${pageContext.request.contextPath }/product?method=findByPage&cid=${param.cid}&currPage=${pageBean.totalPage-3}">${pageBean.totalPage-3 }</a></li>
					</c:if>
					<c:forEach begin="${(pageBean.currPage-2)>0 ? pageBean.currPage-2:1 }" end="${(pageBean.currPage+2)<pageBean.totalPage?pageBean.currPage+2:pageBean.totalPage }"  var="n">
						<c:if test="${pageBean.currPage==n }">
							<li class="active"><a href="javascript:void(0)">${n}</a></li>
						</c:if>
						<c:if test="${pageBean.currPage!=n }">
							<li><a href="${pageContext.request.contextPath }/product?method=findByPage&cid=${param.cid}&currPage=${n}">${n}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageBean.currPage==1 && pageBean.totalPage==4}">
							<li><a href="${pageContext.request.contextPath }/product?method=findByPage&cid=${param.cid}&currPage=4">4</a></li>
					</c:if>
					<c:if test="${pageBean.currPage==1 && pageBean.totalPage>=5}">
							<li><a href="${pageContext.request.contextPath }/product?method=findByPage&cid=${param.cid}&currPage=4">4</a></li>
							<li><a href="${pageContext.request.contextPath }/product?method=findByPage&cid=${param.cid}&currPage=5">5</a></li>
					</c:if>
					<c:if test="${pageBean.currPage==2 && pageBean.totalPage>=5}">
							<li><a href="${pageContext.request.contextPath }/product?method=findByPage&cid=${param.cid}&currPage=5">5</a></li>
					</c:if>
				<c:if test="${pageBean.currPage==pageBean.totalPage }">
					<li class="disabled">
						<a href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				<c:if test="${pageBean.currPage!=pageBean.totalPage }">
					<li>
						<a href="${pageContext.request.contextPath }/product?method=findByPage&cid=${param.cid}&currPage=${pageBean.currPage+1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
			</ul>
		</div>
		</div>
		<!-- 分页结束=======================        -->

		<!--
       		商品浏览记录:
        -->
        
		<div style="width:1210px;margin:0 auto; padding: 0 9px;border: 1px solid #ddd;border-top: 2px solid #999;height: 246px;">

			<h4 style="width: 50%;float: left;font: 14px/30px " 微软雅黑 ";">浏览记录</h4>
			<div style="width: 50%;float: right;text-align: right;"><a href="">more</a></div>
			<div style="clear: both;"></div>

			<div style="overflow: hidden;">

				<ul style="list-style: none;">
					<%
						Cookie c=cookUtils.getCookieByName("ids", request.getCookies());
						if(c==null){
					%>
							<h2>暂无浏览记录~</h2>
					<%
						}else{
							String[] value=c.getValue().split("-");
							ProductService ps=new ProductServiceImpl();
							Product bean;
							for(String i:value){
								bean=ps.getById(i);
								request.setAttribute("bean2",bean);
					%>
								<li style="width: 150px;height: 216;float: left;margin: 0 8px 0 0;padding: 0 18px 15px;text-align: center;">
									<a href="${pageContext.request.contextPath}/product?method=getById&pid=${bean2.pid}">
										<img src="${pageContext.request.contextPath}/${bean2.pimage}" width="170" height="170" style="display: inline-block;">
									</a>
									<p><a href="${pageContext.request.contextPath}/product?method=getById&pid=${bean2.pid}" style='color:green'>
									&nbsp;&nbsp;&nbsp;
									${fn:substring(bean2.pname,0,10)}...</a></p>

								</li>
								
					<%
							}
						}
					%>
				</ul>

			</div>
		</div>
		<div class="container-fluid">
			<div style="margin-top:50px;">
				<img src="${pageContext.request.contextPath}/image/footer.jpg" width="100%" height="78" alt="我们的优势" title="我们的优势" />
			</div>
	
			<div style="text-align: center;margin-top: 5px;">
				<ul class="list-inline">
					<li><a>关于我们</a></li>
					<li><a>联系我们</a></li>
					<li><a>招贤纳士</a></li>
					<li><a>法律声明</a></li>
					<li><a>友情链接</a></li>
					<li><a target="_blank">支付方式</a></li>
					<li><a target="_blank">配送方式</a></li>
					<li><a>服务声明</a></li>
					<li><a>广告声明</a></li>
				</ul>
			</div>
			<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
				Copyright &copy; 2005-2016 传智商城 版权所有
			</div>
		</div>
	</body>

</html>