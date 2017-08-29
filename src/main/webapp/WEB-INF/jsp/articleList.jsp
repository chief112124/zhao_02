<%--
  Created by IntelliJ IDEA.
  User: as749
  Date: 2017/8/26
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="renderer" content="webkit">
    <title>文章列表页</title>
    <link rel="stylesheet" href="/css/global.css">
    <script src="/js/jquery-1.12.3.min.js"></script>
    <script src="/js/main.js"></script>
</head>
<body>
    <div class="main_menu">
        <a href="main"><img src="/images/logo.png" alt="北京中贸国际商旅" width="74" height="74"></a>
        <ul class="clearfix">
            <li><a href="main">行程集锦</a></li>
            <li><a class="current" href="articleList?type=1">惠玩食宿行</a></li>
            <li><a class="current" href="articleList?type=2">行摄北非</a></li>
            <li><a class="current" href="articleList?type=3">贴心的话</a></li>
            <li><a href="articleDetail?type=4">关于我们</a></li>
        </ul>
    </div>

    <div class="list_cont_box clearfix">
        <ul class="cont_main" id="cont_main_line">
            <li>
                <a href="articleDetail">
                    <img src="/images/article_img4.png" alt="" width="635" height="386">
                    <p><strong class="color_blue">“行之悦旅行” 尽在北非</strong><em>2017-08-10   15:26</em></p>
                </a>
            </li>
            <li>
                <a href="articleDetail">
                    <img src="/images/article_img4.png" alt="" width="635" height="386">
                    <p><strong class="color_blue">“行之悦旅行” 尽在北非</strong><em>2017-08-10   15:26</em></p>
                </a>
            </li>
            <li>
                <a href="articleDetail">
                    <img src="/images/article_img4.png" alt="" width="635" height="386">
                    <p><strong class="color_blue">“行之悦旅行” 尽在北非</strong><em>2017-08-10   15:26</em></p>
                </a>
            </li>
            <li>
                <a href="articleDetail">
                    <img src="/images/article_img4.png" alt="" width="635" height="386">
                    <p><strong class="color_blue">“行之悦旅行” 尽在北非</strong><em>2017-08-10   15:26</em></p>
                </a>
            </li>
        </ul>
        <div class="sidebar_box">
            <div class="sidebar_main" id="sidebar_fix">
                <div class="sidebar_consult">
                    <p class="side_title">心有所属<br>梦幻北非</p>
                    <input type="tel" id="tel" maxlength="11" placeholder="联系电话">
                    <button onclick="addOrderByWebArticleList()">立即预订</button>
                    <p class="tips_tel">请留下您的手机号码，我们的客服人员会及时与您联系，谢谢。</p>
                    <p class="tel_number">预订电话：010-85632746</p>
                </div>
            </div>
        </div>
    </div>

    <div class="more_line">
        <fieldset>
            <legend>更多北非线路</legend>
        </fieldset>
        <ul class="clearfix">
            <li class="content_item fl" id="otherLine0">
                <%--<a href="articleDetail">
                    <div class="img_box">
                        <img src="/images/article_img2.png" alt='“情迷撒哈拉” 摩洛哥一地深度15日游' width="378" height="214">
                        <div class="mask"><p>“情迷撒哈拉” 摩洛哥一地深度15日游</p></div>
                    </div>
                    <p>预计出行时间：2017年5月10日<em class="color_blue fr">¥16,800元／人</em></p>
                </a>--%>
            </li>
            <li class="content_item fl" id="otherLine1">
                <%--<a href="articleDetail">
                    <div class="img_box">
                        <img src="/images/article_img2.png" alt='“情迷撒哈拉” 摩洛哥一地深度15日游' width="378" height="214">
                        <div class="mask"><p>“情迷撒哈拉” 摩洛哥一地深度15日游</p></div>
                    </div>
                    <p>预计出行时间：2017年5月10日<em class="color_blue fr">¥16,800元／人</em></p>
                </a>--%>
            </li>
            <li class="content_item fl" id="otherLine2">
                <%--<a href="articleDetail">
                    <div class="img_box">
                        <img src="/images/article_img2.png" alt='“情迷撒哈拉” 摩洛哥一地深度15日游' width="378" height="214">
                        <div class="mask"><p>“情迷撒哈拉” 摩洛哥一地深度15日游</p></div>
                    </div>
                    <p>预计出行时间：2017年5月10日<em class="color_blue fr">¥16,800元／人</em></p>
                </a>--%>
            </li>
        </ul>
    </div>


    <%--<div class="footer_box">
        <div class="footer_wrapper clearfix">
            <div class="footer_main">
                <p class="slogan">slogan写在这里</p>
                <ul>
                    <li class="icon_tel">4008－517-517</li>
                    <li class="icon_email">support@beifei.com</li>
                    <li class="icon_address">北京市朝阳区西大望路XX大厦3层</li>
                </ul>
                <p class="copyright">2017 北京XXXX有限公司 保留一切权利</p>
            </div>
            <ul class="QR_code">
                <li><img src="/images/wechat.png" width="128" height="128" alt="官方微信，扫描二维码" /><p>官方微信</p></li>
                <li><img src="/images/weibo.png" width="128" height="128" alt="官方微博，扫描二维码" /><p>官方微博</p></li>
            </ul>
        </div>
    </div>--%>
    <div class="footer_box">
        <div class="footer_wrapper clearfix">
            <div class="footer_main">
                <p class="slogan">slogan写在这里</p>
                <ul>
                    <li class="icon_tel">010-85632746  85632745</li>
                    <li class="icon_email">2621385788@qq.com</li>
                    <li class="icon_address">北京市广渠门内领航国际3号楼1单元1806室</li>
                </ul>
                <p class="copyright">2017 北京市国际商务旅行社有限责任公司 保留一切权利</p>
            </div>
            <ul class="QR_code">
                <li><img src="/images/wechatbeifei.jpg" width="128" height="128" alt="官方微信，扫描二维码" /><p>官方微信</p></li>
                <li><img src="/images/weibobeifei.jpg" width="128" height="128" alt="官方微博，扫描二维码" /><p>官方微博</p></li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">

        var href = window.document.location.href;
        var articleType = href.split("=")[1];

        $.ajax({
            type: "GET",
            url: "/article/queryArticleByType?articleType="+articleType+"&page=1&rows=999",
            dataType: "json",
            success: function(data) {
                if(data.status == "success"){
                    appendArticleList(data.data);
                }else if(data.status == "norecord"){
                    alert("暂无该类文章！")
                }else{

                }
            }
        });

        function appendArticleList(){

        }

        function addOrderByWebArticleList(){
            var phone = $("#tel").val();
            if(phone == null || phone == ""){
                alert("请填写联系电话！")
                return;
            }
            var data = {phone :phone};
            $.ajax({
                type: "post",
                url: "/order/add",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify(data),
                dataType: "json",
                success: function(data) {
                    if(data.status == "success"){
                        alert("预定成功，请您留心电话，稍后会给你联系！")
                    }
                }
            });
        }

        $.ajax({
            type: "GET",
            url: "/line/queryOtherThreeById?id="+0,
            dataType: "json",
            success: function(data) {
                if(data.status == "success"){
                    appendOtherLineList(data.data);
                }
            }
        });

        function appendOtherLineList(lines){
            for(var i=0;i<lines.length;i++){
                var content = '<a href="detail?id='+lines[i].id+'">'+
                    '<div class="img_box">'+
                    '<img src="'+getAppendImgSrc(lines[i],2)+'" alt="'+lines[i].lineName+'" width="378" height="214">'+
                    '<div class="mask"><p>'+lines[i].lineName+'</p></div>'+
                    '</div>'+
                    '<p>预计出行时间：'+getAppendTime(lines[i].goTimeStamp)+'<em class="color_blue fr">¥'+lines[i].price+'元／人</em></p>'+
                    '</a>';
                var idStr = "otherLine"+i.toString();
                console.log($("#"+idStr));
                $("#"+idStr).append(content);
            }
        }

        function getAppendImgSrc(line,type){
            for(var i=0;i<line.lineImgs.length;i++){
                if(type == line.lineImgs[i].imgType){
                    return line.lineImgs[i].url;
                    break;
                }
            }
        }

        function getAppendTime(timeStamp){
            var now = new Date(timeStamp),
                y = now.getFullYear(),
                m = now.getMonth() + 1,
                d = now.getDate();
            return ( y + "年" + (m < 10 ? "0" + m : m) + "月" + (d < 10 ? "0" + d : d) + "日");
        }
    </script>
</body>
</html>
