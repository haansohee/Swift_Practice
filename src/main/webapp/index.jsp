<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title> ESB_index </title>


<!--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->

<!--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="./vendor/bootstrap/js/bootstrap.js"></script>

<link rel="stylesheet" href="./vendor/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="./vendor/bootstrap/css/bootstrap.min.css">
<link href = "./css/style.css" rel = "stylesheet">
<link href = "./css/landing-page.css" rel = "stylesheet"> 
<link href = "./css/landing-page.min.css" rel = "stylesheet">





<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous">
      
</head>
<style>
h1{
   text-align: left;
}
</style>

<body>

<%@ include file="./include/header.jsp" %>

 <!-- Masthead -->
  <header class="masthead text-white text-center">
    <div class="overlay"></div>
       
        <div class="mainLine">
          <span style="width: 100%; height: 200px;"></span>
          <h1 style="color:#484848; font-size: 48px; line-height: 1.5em;">생생한 원어민 화상영어,<br/> 지금바로 시작하세요!</h1>
        </div>
       
          <form>
            <div class="form-row" style="width: 30%;">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <input type="email" class="form-control form-control-lg" placeholder="이메일 주소">
              </div>
              <div class="col-12 col-md-3">
                <input type="button" value="회원가입" class="btn btn-block btn-lg btn-primary" onclick="location.href='../member/insert'">
              </div>
            </div>
          </form>
  </header>

  <!-- Icons Grid -->
  <section class="features-icons bg-light text-center">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-screen-desktop m-auto text-primary"></i>
            </div>
            <h3>수업</h3>
            <p class="lead mb-0">튜터와 만들어 나가는 유연한 학습 스케쥴</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-layers m-auto text-primary"></i>
            </div>
            <h3>커리큘럼</h3>
            <p class="lead mb-0">내 레벨에 맞춰 선택해 더욱 체계적인 수업 진행</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-check m-auto text-primary"></i>
            </div>
            <h3>수료증</h3>
            <p class="lead mb-0">10시간 이상 수업 시, 캠블리 수료증 발급</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Testimonials -->
  <section class="testimonials text-center bg-light">
    <div class="container">
      <h2 class="mb-5">유학 없이도 유창하게 영어로 말할 수 있어요!</h2>
      <div class="row">
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="img/testimonials-1.jpg" alt="">
            <h5>Margaret E.</h5>
            <p class="font-weight-light mb-0">"I have been teaching English for 3 years. I am very patient, kind and I love to learn about new cultures and your thoughts about life."</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="img/testimonials-2.jpg" alt="">
            <h5>Fred S.</h5>
            <p class="font-weight-light mb-0">"A conversationalist, I have worked internationally in business (operations, sales, training and HR) and am also licensed to teach scuba!"</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="img/testimonials-3.jpg" alt="">
            <h5>Sarah W.</h5>
            <p class="font-weight-light mb-0">"I own and run a small business, am easy to speak to and hold a TEFL qualification. I look forward to meeting you!"</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Call to Action -->
  <section class="call-to-action text-white text-center">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h2 class="mb-4">내게 꼭 맞는 튜터를 찾아보세요</h2>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form>
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <input type="email" class="form-control form-control-lg" placeholder="  이메일 주소">
              </div>
              <div class="col-12 col-md-3">
                 <input type="button" value="회원가입" class="btn btn-block btn-lg btn-primary" onclick="location.href='../member/insert'">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
<%@ include file="./include/footer.jsp" %>

</body>

</html>