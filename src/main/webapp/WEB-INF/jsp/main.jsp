<%--
  Created by IntelliJ IDEA.
  User: as749
  Date: 2017/8/26
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="renderer" content="webkit">
    <title>首页</title>
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="/css/index.css">
</head>
<body>
<div class="banner_box">
    <div class="main_menu">
        <a href="main"><img src="/images/logo.png" alt="北京中贸国际商旅" width="74" height="74"></a>
        <ul class="clearfix">
            <li><a class="current" href="main">行程集锦</a></li>
            <li><a href="articleList?type=1">惠玩食宿行</a></li>
            <li><a href="articleList?type=2">行摄北非</a></li>
            <li><a href="articleList?type=3">贴心的话</a></li>
            <li><a href="articleDetail?type=4">关于我们</a></li>
        </ul>
    </div>
    <div class="banner_text">
        <p>摩洛哥色彩国度探秘14日之旅</p>
        <span>探索神秘国度</span>
    </div>
</div>
<div class="index_main">
    <ul class="main_tag clearfix">
        <li>
            <a href="articleDetail?type=5">
                <i class="icon_sincerity"></i><strong>诚 心</strong>
                <p>当地旅游服务正规优质<br>不打折扣有诚心</p>
            </a>
        </li>
        <li>
            <a href="articleDetail?type=6">
                <i class="icon_intimate"></i><strong>贴 心</strong>
                <p>尤其注重当地导游服务<br>讲解到位，服务贴心</p>
            </a>
        </li>
        <li>
            <a href="articleDetail?type=7">
                <i class="icon_careful"></i><strong>细 心</strong>
                <p>行程安排周到细心<br>细微之处值得称道</p>
            </a>
        </li>
        <li>
            <a href="articleDetail?type=8">
                <i class="icon_confidence"></i><strong>信 心</strong>
                <p>接待团队实力雄厚，驻华使<br>馆皆有口碑，我们有信心</p>
            </a>
        </li>
        <li>
            <a href="articleDetail?type=9">
                <i class="icon_mindful"></i><strong>走 心</strong>
                <p>当地旅游服务正规优质<br>不打折扣有诚心</p>
            </a>
        </li>
    </ul>
    <dl class="clearfix">
        <dt class="fl" id="line1">
            <%--<a href="detail">
                <img src="/images/article_img1.png" alt="" width="604" height="418">
                <strong>“行之悦旅行” 摩洛哥色彩国度探秘14日之旅</strong>
                <span>预计出行时间：2017年5月10日<em class="color_blue">¥16,800元／人</em></span>
            </a>--%>
        </dt>
        <dd class="fr">
            <div class="content_item" id="line2">
                <%--<a href="articleDetail">
                    <div class="img_box">
                        <img src="/images/article_img2.png" alt='“情迷撒哈拉” 摩洛哥一地深度15日游' width="378" height="214">
                        <div class="mask"><p>“情迷撒哈拉” 摩洛哥一地深度15日游</p></div>
                    </div>
                    <p>预计出行时间：2017年5月10日<em class="color_blue fr">¥16,800元／人</em></p>
                </a>--%>
            </div>
            <div class="content_item" id="line3">
                <%--<a href="#">
                    <div class="img_box">
                        <img src="/images/article_img3.png" alt='“情迷撒哈拉” 摩洛哥一地深度15日游' width="378" height="214">
                        <div class="mask"><p>“情迷撒哈拉” 摩洛哥一地深度15日游</p></div>
                    </div>
                    <p>预计出行时间：2017年5月10日<em class="color_blue fr">¥16,800元／人</em></p>
                </a>--%>
            </div>
        </dd>
    </dl>
    <dl class="clearfix">
        <dt class="fr" id="line4">
            <%--<a href="#">
                <img src="/images/article_img1.png" alt="" width="604" height="418">
                <strong>“行之悦旅行” 摩洛哥色彩国度探秘14日之旅</strong>
                <span>预计出行时间：2017年5月10日<em class="color_blue">¥16,800元／人</em></span>
            </a>--%>
        </dt>
        <dd class="fl" >
            <div class="content_item" id="line5">
                <%--<a href="#">
                    <div class="img_box">
                        <img src="/images/article_img2.png" alt='“情迷撒哈拉” 摩洛哥一地深度15日游' width="378" height="214">
                        <div class="mask"><p>“情迷撒哈拉” 摩洛哥一地深度15日游</p></div>
                    </div>
                    <p>预计出行时间：2017年5月10日<em class="color_blue fr">¥16,800元／人</em></p>
                </a>--%>
            </div>
            <div class="content_item" id="line6">
                <%--<a href="#" >
                    <div class="img_box">
                        <img src="/images/article_img3.png" alt='“情迷撒哈拉” 摩洛哥一地深度15日游' width="378" height="214">
                        <div class="mask"><p>“情迷撒哈拉” 摩洛哥一地深度15日游</p></div>
                    </div>
                    <p>预计出行时间：2017年5月10日<em class="color_blue fr">¥16,800元／人</em></p>
                </a>--%>
            </div>
        </dd>
    </dl>
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
<a href="Article_Detail.html" class="link_detail">
    <p>来自北非的前线报道<img src="images/arrow_play.png" alt="来自北非的前线报道" width="47" height="47"></p>
</a>
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
<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript">
    $.ajax({
        type: "GET",
        url: "/line/querySixLine",
        dataType: "json",
        success: function(data) {
            if(data.status == "success"){
                console.log(data.data);
                appendLineList(data.data);
            }
        }
    });
    function appendLineList(lines){
        var line1Content1 = '<a href="detail?id='+lines[0].id+'">'+
        '<img src="'+getAppendImgSrc(lines[0],1)+'" alt="" width="604" height="418">'+
        '<strong>'+lines[0].lineName+'</strong>'+
        '<span>预计出行时间：'+getAppendTime(lines[0].goTimeStamp)+'<em class="color_blue">¥'+lines[0].price+'元／人</em></span>'+
        '</a>';
        $("#line1").append(line1Content1);

        var line1Content2 = '<a href="detail?id='+lines[1].id+'">'+
            '<div class="img_box">'+
            '<img src="'+getAppendImgSrc(lines[1],2)+'" alt="'+lines[1].lineName+'" width="378" height="214">'+
            '<div class="mask"><p>'+lines[1].lineName+'</p></div>'+
        '</div>'+
        '<p>预计出行时间：'+getAppendTime(lines[1].goTimeStamp)+'<em class="color_blue fr">¥'+lines[1].price+'元／人</em></p>'+
        '</a>';
        $("#line2").append(line1Content2);

        var line1Content3 = '<a href="detail?id='+lines[2].id+'">'+
            '<div class="img_box">'+
            '<img src="'+getAppendImgSrc(lines[2],2)+'" alt="'+lines[2].lineName+'" width="378" height="214">'+
            '<div class="mask"><p>'+lines[2].lineName+'</p></div>'+
            '</div>'+
            '<p>预计出行时间：'+getAppendTime(lines[2].goTimeStamp)+'<em class="color_blue fr">¥'+lines[2].price+'元／人</em></p>'+
            '</a>';
        $("#line3").append(line1Content3);

        var line1Content4 = '<a href="detail?id='+lines[3].id+'">'+
            '<img src="'+getAppendImgSrc(lines[3],1)+'" alt="'+lines[3].lineName+'" width="604" height="418">'+
            '<strong>'+lines[3].lineName+'</strong>'+
            '<span>预计出行时间：'+getAppendTime(lines[3].goTimeStamp)+'<em class="color_blue">¥'+lines[3].price+'元／人</em></span>'+
            '</a>';
        $("#line4").append(line1Content4);

        var line1Content5 = '<a href="detail?id='+lines[4].id+'">'+
            '<div class="img_box">'+
            '<img src="'+getAppendImgSrc(lines[4],2)+'" alt="'+lines[4].lineName+'" width="378" height="214">'+
            '<div class="mask"><p>'+lines[4].lineName+'</p></div>'+
        '</div>'+
        '<p>预计出行时间：'+getAppendTime(lines[4].goTimeStamp)+'<em class="color_blue fr">¥'+lines[4].price+'元／人</em></p>'+
        '</a>';
        $("#line5").append(line1Content5);

        var line1Content6 = '<a href="detail?id='+lines[5].id+'">'+
            '<div class="img_box">'+
            '<img src="'+getAppendImgSrc(lines[5],2)+'" alt="'+lines[5].lineName+'" width="378" height="214">'+
            '<div class="mask"><p>'+lines[5].lineName+'</p></div>'+
        '</div>'+
        '<p>预计出行时间：'+getAppendTime(lines[5].goTimeStamp)+'<em class="color_blue fr">¥'+lines[5].price+'元／人</em></p>'+
        '</a>';
        $("#line6").append(line1Content6);
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
