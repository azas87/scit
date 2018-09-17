<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"
language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <style media="screen">
    * {
      margin: 0;
      padding: 0;
    }

    div {
      border: 1px solid #cccccc;
      padding: 5px;
      margin: 5px;
    }

    .tooltip {
      display: none;
      position: absolute;
      border: 1px solid #333;
      background-color: #161616;
      border-radius: 5px;
      padding: 10px;
      color: #fff;
      font-size: 3.5em Arial;
    }



    .item {
    line-height: 80px;
    list-style: none;
    margin: 0px;
      flex-grow: 1;
      text-align: left;
      font-size:1.5em;
    }

    .slide {
      width: 1000px;
      height: 600px;
      overflow: hidden;
      position: relative;
      margin: 0 auto;
    }

    .slide ul {
      width: 5000px;
      position: absolute;
      top: 0;
      left: 0;
    }

    .slide ul li {
      display: inline-block;
      width: 1000px;
      height:300px;
      margin-top:150px;

    }

    #back {
      position: absolute;
      top: 250px;
      left: 0;
      cursor: pointer;
      z-index: 1;
    }

    #next {
      position: absolute;
      top: 250px;
      right: 0;
      cursor: pointer;
      z-index: 1;
    }
  </style>
</head>

<body>
  <div class="slide" style="border:0">
    <img id="back" src="img/back.png" alt="" width="100">
    <ul>
      <li>
        <div style="width:500px; margin:0 auto;">
          <fieldset>
            <legend><span class="number">1</span>ログイン情報</legend>

              <div class="item " title="Click button">
                <label for="name"><strong class="star">*</strong>ログインID</label>
                <input type="text" id="userid" name="id">
                <button id="btn" type="button">ID CHECK</button>
              </div>
              <div class="item " title="Click button">
                <label for="password"><strong class="star">*</strong>パスワード </label>
                <input type="password" id="userpwd" name="password" 　placeholder="半角数字11桁">
              </div>
              <div class="item " title="Click button">
                <label for="password2"><strong class="star">*</strong>パスワードを再入力してください</label>
                <input type="password" id="userpwd2" name="userpwd2">
              </div>

          </fieldset>
          </div>
      </li>
      <li>
        <div style="width:500px; margin:0 auto;">
          <fieldset>
            <legend><span class="number">1</span>ログイン情報</legend>
            <div class="item " title="Click button">
              <label for="email"><strong class="star">*</strong>email</label>
              <input type="email" id="email" name="email">
            </div>
            <div class="item " title="Click button">
              <label for="email2"><strong class="star">*</strong>emailを再入力してください</label>
              <input type="text" name="nameKana">
            </div>
            <div class="item " title="Click button">
              주소 <input type="text" name="address">
              <input type="hidden" name="grade" />
            </div>
          </fieldset>
        </div>
      </li>
      <li>
        <div style="width:500px; margin:0 auto;">
          <fieldset>
            <legend><span class="number">1</span>ログイン情報</legend>
            <div class="item " title="Click button">
	            <label><strong class="star">*</strong>学生・職業 :</label>
	            <select id="work" name="work">
                    <option value="高校１年生">高校１年生</option>
                    <option value="高校２年生">高校２年生</option>
                    <option value="高校３年生">高校３年生</option>
                    <option value="高校４年生">高校４年生</option>
                    <option value="高校生以外の学生">高校生以外の学生</option>
                    <option value="社会人">社会人</option>
                    <option value="先生">先生</option>
                    <option value="保護者">保護者</option>
                    <option value="日本への留学生">日本への留学生</option>
                    <option value="その他">その他</option>
                </select>
	          </div>
	          <div class="item " title="Click button">
	            <label>性別 :</label>
	            <input type="radio" id="male" value="male" name="gender">男性
	            <input type="radio" id="female" value="female" name="gender">女性
	          </div>
	          <div class="item " title="Click button">
	            <label for="phone">電話番号:</label>
	            <input type="text" id="phone" name="phone" placeholder="ハイフンなしの半角数字11桁">
	          </div>
          </fieldset>
        </div>
      </li>
      <li>
        <div style="width:500px; margin:0 auto;">
          <fieldset>
            <div class="item " title="Click button">
              <label><strong class="star">*</strong>学生・職業 :</label>
              <select id="work" name="work">
                        <option value="高校１年生">高校１年生</option>
                        <option value="高校２年生">高校２年生</option>
                        <option value="高校３年生">高校３年生</option>
                        <option value="高校４年生">高校４年生</option>
                        <option value="高校生以外の学生">高校生以外の学生</option>
                        <option value="社会人">社会人</option>
                        <option value="先生">先生</option>
                        <option value="保護者">保護者</option>
                        <option value="日本への留学生">日本への留学生</option>
                        <option value="その他">その他</option>
                       </select>
            </div>
            <div class="item " title="Click button">
              <label>性別 :</label>
              <input type="radio" id="male" value="male" name="gender">男性
              <input type="radio" id="female" value="female" name="gender">女性
            </div>
            <div class="item " title="Click button">
              <label for="phone">電話番号:</label>
              <input type="text" id="phone" name="phone" placeholder="ハイフンなしの半角数字11桁">
            </div>
          </fieldset>
        </div>
      </li>
    </ul>
    <img id="next" src="img/next.png" alt="" width="100">
    </div>
</body>

<script type="text/javascript">
  $(document).ready(function() {
    var imgs;
    var img_count;
    var img_position = 1;

    imgs = $(".slide ul");
    img_count = imgs.children().length;

    //버튼을 클릭했을 때 함수 실행
    $('#back').click(function() {
      back();
    });
    $('#next').click(function() {
      next();
    });

    function back() {
      if (1 < img_position) {
        imgs.animate({
          left: '+=1000px'
        });
        img_position--;
      }
    }

    function next() {
      if (img_count > img_position) {
        imgs.animate({
          left: '-=1000px'
        });
        img_position++;
      }
    }

  });
</script>


</body>

</html>
