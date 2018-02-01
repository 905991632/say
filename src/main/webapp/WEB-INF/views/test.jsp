<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <meta charset="UTF-8">
    <title>分类筛选</title>
    <link rel="stylesheet" href="css/common.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    

  </head>
  
<body>
    <div class="filter">
        <div class="container">
            <div class="box">
            <div class="title-h">按条件筛选</div>
            <dl>
                <dt>融资方式</dt>
                <dd>
                    <a href="javascript:void(0);" rel="" name="mode" class="all on">全部</a>
                    <a href="javascript:void(0);" rel="股权融资" name="mode" class="sx_child">股权融资</a>
                    <a href="javascript:void(0);" rel="债权融资" name="mode" class="sx_child">债权融资</a>
                </dd>
            </dl>
            <dl>
                <dt>项目阶段</dt>
                <dd>
                    <a href="javascript:void(0);" rel="" name="stage" class="all on">全部</a>
                    <a href="javascript:void(0);" rel="种子及天使轮" name="stage" class="sx_child">种子及天使轮</a>
                    <a href="javascript:void(0);" rel="A轮" name="stage" class="sx_child">A轮</a>
                    <a href="javascript:void(0);" rel="B轮" name="stage" class="sx_child">B轮</a>
                    <a href="javascript:void(0);" rel="C轮" name="stage" class="sx_child">C轮</a>
                    <a href="javascript:void(0);" rel="D轮" name="stage" class="sx_child">D轮</a>
                    <a href="javascript:void(0);" rel="E轮" name="stage" class="sx_child">E轮</a>
                    <a href="javascript:void(0);" rel="Pre-IPO" name="stage" class="sx_child">Pre-IPO</a>
                    <a href="javascript:void(0);" rel="Pre-新三板" name="stage" class="sx_child">Pre-新三板</a>
                    <a href="javascript:void(0);" rel="老股股权转让" name="stage" class="sx_child">老股股权转让</a>
                    <a href="javascript:void(0);" rel="新三板" name="stage" class="sx_child">新三板</a>
                </dd>
            </dl>
            <dl>
                <dt>所属行业</dt>
                <dd>
                    <a href="javascript:void(0);" rel="" name="sector" class="all on">全部</a>
                    <a href="javascript:void(0);" rel="汽车" name="sector" class="sx_child">汽车</a>
                    <a href="javascript:void(0);" rel="大健康" name="sector" class="sx_child">大健康</a>
                    <a href="javascript:void(0);" rel="节能环保" name="sector" class="sx_child">节能环保</a>
                    <a href="javascript:void(0);" rel="智能信息" name="sector" class="sx_child">智能信息</a>
                    <a href="javascript:void(0);" rel="文化旅游" name="sector" class="sx_child">文化旅游</a>
                    <a href="javascript:void(0);" rel="新材料" name="sector" class="sx_child">新材料</a>
                    <a href="javascript:void(0);" rel="高端装备" name="sector" class="sx_child">高端装备</a>
                    <a href="javascript:void(0);" rel="其他行业" name="sector" class="sx_child">其他行业</a>
                </dd>
            </dl>
            <dl>
                <dt>概念板块</dt>
                <dd>
                    <a href="javascript:void(0);" rel="" name="board" class="all on">全部</a>
                    <a href="javascript:void(0);" rel="汽车智能电子" name="board" class="sx_child">汽车智能电子</a>
                    <a href="javascript:void(0);" rel="汽车制造" name="board" class="sx_child">汽车制造</a>
                    <a href="javascript:void(0);" rel="新能源汽车" name="board" class="sx_child">新能源汽车</a>
                    <a href="javascript:void(0);" rel="特斯拉" name="board" class="sx_child">特斯拉</a>
                    <a href="javascript:void(0);" rel="汽车后市场" name="board" class="sx_child">汽车后市场</a>
                    <a href="javascript:void(0);" rel="汽车金融" name="board" class="sx_child">汽车金融</a>
                    <a href="javascript:void(0);" rel="生物医药" name="board" class="sx_child">生物医药</a>
    
                </dd>
            </dl>
            <dl>
                <dt>所属区域</dt>
                <dd>
                    <a href="javascript:void(0);"  rel="" name="area" class="all on">全部</a>
                    <a href="javascript:void(0);"  rel="华东" name="area" class="sx_child">华东</a>
                    <a href="javascript:void(0);"  rel="华北" name="area" class="sx_child">华北</a>
                    <a href="javascript:void(0);"  rel="华南" name="area" class="sx_child">华南</a>
                    <a href="javascript:void(0);"  rel="华中" name="area" class="sx_child">华中</a>
                    <a href="javascript:void(0);"  rel="华西南" name="area" class="sx_child">华西南</a>
                    <a href="javascript:void(0);"  rel="东北" name="area" class="sx_child">东北</a>
                </dd>
            </dl>
            <dl>
                <dt>发布时间</dt>
                <dd>
                    <a href="javascript:void(0);" rel="" name="date" class="all on">全部</a>
                    <a href="javascript:void(0);" rel="最近一天" name="date" class="sx_child">最近一天</a>
                    <a href="javascript:void(0);" rel="最近三天" name="date" class="sx_child">最近三天</a>
                    <a href="javascript:void(0);" rel="最近一周" name="date" class="sx_child">最近一周</a>
                    <a href="javascript:void(0);" rel="最近两周" name="date" class="sx_child">最近两周</a>
                </dd>
            </dl>
            </div>
        </div>
    </div>





</body>
<script src="js/tagSelect2.js"></script>
<!--<script>  
    $(function(){
        new SelectTag({
            child : ".sx_child", //所有筛选范围内的子类
            over : 'on', //选中状态样式名称
            all : ".all"
        });
    })
</script>-->
</html>
