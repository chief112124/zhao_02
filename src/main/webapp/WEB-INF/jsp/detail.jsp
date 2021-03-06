<%--
  Created by IntelliJ IDEA.
  User: as749
  Date: 2017/8/26
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="renderer" content="webkit">
    <title>产品详情页</title>
    <link rel="stylesheet" href="/css/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="/css/global.css">
    <link rel="stylesheet" href="/css/detail.css">
</head>
<body>
    <div class="main_menu">
        <a href="main"><img src="/images/logo.png" alt="北京中贸国际商旅" width="74" height="74"></a>
        <ul class="clearfix">
            <li><a class="current" href="main">行程集锦</a></li>
            <li><a class="current" href="articleList?type=1">惠玩食宿行</a></li>
            <li><a class="current" href="articleList?type=2">行摄北非</a></li>
            <li><a class="current" href="articleList?type=3">贴心的话</a></li>
            <li><a href="articleDetail?type=4">关于我们</a></li>
        </ul>
    </div>

    <div class="list_cont_box">
        <p class="detail_title" id="detail_title"></p>
        <div class="photo_show">
            <span class="photo_num"><i class="detail_icon"></i><em id="photo_num">26</em></span>
            <dl class="clearfix">
                <dt class="fr"><img id="detailBigBanner" src="" alt="摄影图片" width="666" height="334"></dt>
                <dd class="fl little_pic">
                    <img id="detailSmallBanner1" src="" alt="摄影图片" width="329" height="165">
                    <img id="detailSmallBanner2" src="" alt="摄影图片" width="329" height="165">
                </dd>
            </dl>
        </div>
        <div class="tour_itinerary clearfix">
            <div class="itinerary_main">
                <h2>行程介绍</h2>
                <h3>行程特色</h3>
                <%--<ul class="itinerary_list">
                    <li>	◇	乘阿联酋航空航空往返卡萨布兰卡；</li>
                    <li>	◇	极致深度体验摩洛哥的经典、神秘与温存；</li>
                    <li>	◇	马拉喀什：感受雕梁画栋千姿百态和令人迷恋不止的人文风情；</li>
                    <li>	◇	艾本哈度村：世界文化遗产之一，无数好莱坞电影取景地。一览有“摩洛哥最美Kasbah ”之称的南部古村落；</li>
                    <li>	◇	撒哈拉沙漠：感受漫漫黄沙的灵动之美；</li>
                    <li>	◇	瓦尔扎扎特：电影城，世界影业的拍摄基地；</li>
                    <li>	◇	菲斯古城：一睹有着天方夜谭的神话之地；</li>
                    <li>	◇	舍夫沙万：摩洛哥的“蓝白小镇”，感受梦幻蓝彩和艺术小清新的迷人魅力；</li>
                    <li>	◇	拉巴特：老城的乌达雅堡（电影《碟中谍5》取景地）；</li>
                    <li>	◇	卡萨布兰卡：哈桑二世清真寺和麦地那老城（电影《碟中谍5》取景地），感受经典老歌《卡萨布兰卡》中透出的地中海式的浪漫和淡淡地忧伤。</li>
                </ul>--%>
                <ul  class="itinerary_list">
                    <li id="detailLineContent">

                    </li>
                </ul>
            </div>
            <div class="reserve_form">
                <p class="price" id="detailOnePrice"></p>
                <p class="time" id="detailGoTime"></p>
                <form action="">
                    <div class="citket_num  clearfix">
                        <div class="left">
                            <span class="text">成人</span>
                            <div class="text_right">
                                <input id="detailAudltNum" class="num_adult" type="text" value="1"/>
                                <span class="btn minus_btn"></span>
                                <span class="btn add_btn"></span>
                                <span class="line"></span>
                            </div>
                        </div>
                        <div class="left">
                            <span class="text">儿童</span>
                            <div class="text_right">
                                <input id="detailChildNum" class="num_child" type="text" value="0"/>
                                <span class="btn minus_btn"></span>
                                <span class="btn add_btn"></span>
                                <span class="line"></span>
                            </div>
                        </div>
                    </div>
                    <div class="contact_way clearfix">
                        <label>联系电话</label><input id="tel" type="tel" maxlength="11">
                    </div>
                    <div class="reserve_button clearfix">
                        <span id="allPrice" class="all_price"></span>
                        <a href="#" class="pop_reserve" onclick="addOrderByWeb()">立即预订</a>
                    </div>
                </form>
                <div class="tel_bottom">预订电话010-85632746<br></div>
            </div>
        </div>
        <div class="schedule_list" id="schedule_list">
            <%--<div class="item">
                <p class="destination"><i class="detail_icon"><em>1</em></i>北京／成都－多哈－卡萨布兰卡</p>
                <ul class="itinerary_list list_icon clearfix">
                    <li><i class="detail_icon"></i><span>飞机早餐－午餐 当地晚餐</span></li>
                    <li><i class="detail_icon"></i><span>卡萨布兰卡五星级酒店</span></li>
                </ul>
                <h4>行程</h4>
                <ul class="itinerary_list">
                    <li>＊抵达迪拜机场后，转机飞往卡萨布兰卡；</li>
                    <li>＊中午抵达卡萨布兰卡，导游接机；</li>
                    <li>＊拍摄世界上现代化程度最高的哈桑二世清真寺外观（伊斯兰世界第三大清真寺,建筑面积2公顷，长200米，宽100米，屋顶可启闭，25扇自动门全部由钛合金铸成，可抗海水腐蚀，寺内大理石地面常年供暖，是世界上现代化程度最高的清真寺）；</li>
                    <li>＊然后继续拍摄穆罕默德五世广场、哈桑二世广场（鸽子广场）；</li>
                    <li>＊晚餐后，入住酒店休息。</li>
                </ul>
                <h4>亮点</h4>
                <ul class="itinerary_list">
                    <li>＊卡萨布兰卡：卡萨布兰卡是摩洛哥的第一大城市，濒临大西洋，树木常青，气候宜人。从海上眺望这座城市，上下是碧蓝无垠的天空和海水，中间夹着一条高高低低的白色轮廓线。有时候大西洋上海浪滔天，港内却水波不兴。那部著名的同名电影和歌曲，给这座城市烙上了永恒爱情的标签。</li>
                    <li>＊	哈桑二世清真寺：哈桑二世清真寺(Hassan II Mosque)是伊斯兰世界第三大清真寺，也是世界上现代化程度最高的清真寺，为纪念前国王六十大寿而兴建，是唯一对外国人开放的清真寺。建筑面积2公 顷，长200米，宽100米，屋顶可以开启关闭，25扇子东门全部由钛合金铸成，可以抵抗海水腐蚀。</li>
                </ul>
            </div>
            <div class="item">
                <p class="destination"><i class="detail_icon"><em>2</em></i>北京／成都－多哈－卡萨布兰卡</p>
                <ul class="itinerary_list list_icon clearfix">
                    <li><i class="detail_icon"></i><span>飞机早餐－午餐 当地晚餐</span></li>
                    <li><i class="detail_icon"></i><span>卡萨布兰卡五星级酒店</span></li>
                </ul>
                <h4>行程</h4>
                <ul class="itinerary_list">
                    <li>＊抵达迪拜机场后，转机飞往卡萨布兰卡；</li>
                    <li>＊中午抵达卡萨布兰卡，导游接机；</li>
                    <li>＊拍摄世界上现代化程度最高的哈桑二世清真寺外观（伊斯兰世界第三大清真寺,建筑面积2公顷，长200米，宽100米，屋顶可启闭，25扇自动门全部由钛合金铸成，可抗海水腐蚀，寺内大理石地面常年供暖，是世界上现代化程度最高的清真寺）；</li>
                    <li>＊然后继续拍摄穆罕默德五世广场、哈桑二世广场（鸽子广场）；</li>
                    <li>＊晚餐后，入住酒店休息。</li>
                </ul>
                <h4>亮点</h4>
                <ul class="itinerary_list">
                    <li>＊卡萨布兰卡：卡萨布兰卡是摩洛哥的第一大城市，濒临大西洋，树木常青，气候宜人。从海上眺望这座城市，上下是碧蓝无垠的天空和海水，中间夹着一条高高低低的白色轮廓线。有时候大西洋上海浪滔天，港内却水波不兴。那部著名的同名电影和歌曲，给这座城市烙上了永恒爱情的标签。</li>
                    <li>＊	哈桑二世清真寺：哈桑二世清真寺(Hassan II Mosque)是伊斯兰世界第三大清真寺，也是世界上现代化程度最高的清真寺，为纪念前国王六十大寿而兴建，是唯一对外国人开放的清真寺。建筑面积2公 顷，长200米，宽100米，屋顶可以开启关闭，25扇子东门全部由钛合金铸成，可以抵抗海水腐蚀。</li>
                </ul>
            </div>--%>
        </div>
    </div>

    <div class="more_line">
        <fieldset>
            <legend>更多北非线路</legend>
        </fieldset>
        <ul class="clearfix">
            <li class="content_item fl" id="otherLine0">
                <%--<a href="#">
                    <div class="img_box">
                        <img src="/images/article_img2.png" alt='“情迷撒哈拉” 摩洛哥一地深度15日游' width="378" height="214">
                        <div class="mask"><p>“情迷撒哈拉” 摩洛哥一地深度15日游</p></div>
                    </div>
                    <p>预计出行时间：2017年5月10日<em class="color_blue fr">¥16,800元／人</em></p>
                </a>--%>
            </li>
            <li class="content_item fl" id="otherLine1">
                <%--<a href="#">
                    <div class="img_box">
                        <img src="/images/article_img2.png" alt='“情迷撒哈拉” 摩洛哥一地深度15日游' width="378" height="214">
                        <div class="mask"><p>“情迷撒哈拉” 摩洛哥一地深度15日游</p></div>
                    </div>
                    <p>预计出行时间：2017年5月10日<em class="color_blue fr">¥16,800元／人</em></p>
                </a>--%>
            </li>
            <li class="content_item fl" id="otherLine2">
                <%--<a href="#">
                    <div class="img_box">
                        <img src="/images/article_img2.png" alt='“情迷撒哈拉” 摩洛哥一地深度15日游' width="378" height="214">
                        <div class="mask"><p>“情迷撒哈拉” 摩洛哥一地深度15日游</p></div>
                    </div>
                    <p>预计出行时间：2017年5月10日<em class="color_blue fr">¥16,800元／人</em></p>
                </a>--%>
            </li>
        </ul>
    </div>


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

    <div class="pop_up pop_swiper none">
        <div class="swiper_box">
            <img src="images/swiper-close.png" width="35" height="35" alt="关闭" class="close_swiper">
            <div class="swiper-container swiper-container-flip pop_photo">
                <div class="swiper-wrapper" id="swiper">
                    <%--<div class="swiper-slide"><img src="images/detail_img3.png" width="1000" alt=""></div>
                    <div class="swiper-slide"><img src="images/detail_img3.png" width="1000" alt=""></div>
                    <div class="swiper-slide"><img src="images/detail_img3.png" width="1000" alt=""></div>--%>
                </div>
            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </div>

    <div id="pop_up" class="pop_up none">
        <div class="pop_cont">
            <p>您的信息已经提交<br>我们将尽快给您回电</p>
            <button id="closePop" class="close_pop">好的</button>
        </div>
    </div>


    <script type="text/javascript" charset="utf-8" src="/js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/swiper-3.4.2.jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/js/main.js"></script>

    <script type="text/javascript">
        var href = window.document.location.href;
        var lineId = href.split("=")[1];
        $.ajax({
            type: "GET",
            url: "/line/queryOneById?id="+lineId,
            dataType: "json",
            success: function(data) {
                if(data.status == "success"){
                    console.log(data.data);
                    $("#detailOnePrice").append('¥<span id="detailPrice">'+data.data.price+'</span>/人 <em>起</em>')
                    $("#allPrice").text("¥"+data.data.price);
                    $("#detailGoTime").append("预计出行时间:"+getAppendTime(data.data.goTimeStamp))
                    $("#detailLineContent").append(data.data.lineContent);
                    $("#photo_num").text(data.data.lineImgs.length);
                    $("#detail_title").text(data.data.lineName);
                    $("#detailBigBanner").attr("src",data.data.lineImgs[0].url);
                    $("#detailSmallBanner1").attr("src",data.data.lineImgs[1].url);
                    $("#detailSmallBanner2").attr("src",data.data.lineImgs[2].url);
                    appendSwiper(data.data.lineImgs);
                    appendSchedule(data.data.days);
                }
            }
        });
        $.ajax({
            type: "GET",
            url: "/line/queryOtherThreeById?id="+lineId,
            dataType: "json",
            success: function(data) {
                if(data.status == "success"){
                    appendOtherLineList(data.data);
                }
            }
        });


        function addOrderByWeb(){
            var adultNum = $('.num_adult').val()
            var childNum = $('.num_child').val()
            var phone = $("#tel").val();
            var price = $('.reserve_form .price span').text();
            var totalPrice = parseInt($('.all_price').text().split("¥")[1]);
            if(phone == null || phone == ""){
                alert("请填写联系电话！")
                return;
            }
            var data = {lineId:parseInt(lineId),adultNum :adultNum,childNum :childNum,phone :phone,price :price,totalPrice:totalPrice};
            $.ajax({
                type: "post",
                url: "/order/add",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify(data),
                dataType: "json",
                success: function(data) {
                    if(data.status == "success"){
                        showpop();
                    }
                }
            });
        }

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
                $("#"+idStr).append(content);
            }
        }

        function appendSwiper(imgs){
            for(var i=0;i<imgs.length;i++){
                $("#swiper").append('<div class="swiper-slide"><img src="'+imgs[i].url+'" height="500" width="1000" alt=""></div>')
            }
        }



        function appendSchedule(days) {
            console.log(days);
            for(var i=0;i<days.length;i++){
                var dayStr = '<div class="item">'+
                '<p class="destination"><i class="detail_icon"><em>'+days[i].dayNum+'</em></i>'+days[i].title+'</p>'+
                '<ul class="itinerary_list list_icon clearfix">';
                if(days[i].meal != null && days[i].meal != ""){
                    dayStr = dayStr + '<li><i class="detail_icon"></i><span>'+days[i].meal+'</span></li>';
                }
                if(days[i].hotel != null && days[i].hotel != ""){
                    dayStr = dayStr +  '<li><i class="detail_icon"></i><span>'+days[i].hotel+'</span></li>';
                }

                dayStr = dayStr + '</ul>';
                if(days[i].travel != null && days[i].travel != "" && days[i].travel != "<br />"){
                    dayStr = dayStr + '<h4>行程</h4>'+
                        '<ul class="itinerary_list"><li>'+days[i].travel+'</li>'+
                        '</ul>';
                }
                if(days[i].linghtPoint != null && days[i].linghtPoint != "" && days[i].linghtPoint != "<br />"){
                    dayStr = dayStr + '<h4>亮点</h4>'+
                        '<ul class="itinerary_list"><li>'+days[i].linghtPoint+'</li>'+
                        '</ul>';
                }

                dayStr = dayStr +  '</div>';
                $("#schedule_list").append(dayStr);
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

        function showpop(){
            $("#pop_up").removeClass('none');
        }

        $("#closePop").click(function () {
            $("#pop_up").addClass('none');
        });
    </script>
</body>
</html>
