<%@LANGUAGE="JavaScript"%>
<%
  var id = Request("id");
  var flag = Request("flag");
  var passwd = Request("password");       
  var trans = Request("transition");
  var conn = Server.CreateObject("ADODB.Connection");
  conn.Open("Race");
  try{
    if (flag == "-1" || flag == "0" || flag == "1" || flag == "2"){
    if ((flag == "0" || flag == "-1") && trans != "true"){
      var myQuery = "SELECT * FROM User Where id=\'" + id + "\' and password=\'" + passwd + "\'";
      var result = conn.Execute(myQuery);
      if (!result.eof){     
        if (id == "admin"){             
          flag = "2";
        }
        else{            
          flag = "1";
        }
      }
      else{          
        flag = "-1";
      }
    }
  }
  else{
    flag = "0";        
  }
}
catch(exception){
  Response.Write("<p>" + exception.description + "</p>");
}
%>
<!doctype html>

<html lang="en">

<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="assets/css/common.css">
  <script src="handler.js"></script>
  <title>
    Formula 1
  </title>
</head>

<body>
  <div id="main">
    <header>
      <h1>
        Formula 1
      </h1>
    </header>
    <nav>
      <div class="table">
        <div class="row">
          <div class="cell">
            <form name="racers" method="POST" action="racers.asp">
              <%
              print();
            %>
              <a class="mailtable" href="javascript: document.racers.submit();">Racers</a>
            </form>
          </div>
          <div class="cell">
            <form name="teams" method="POST" action="teams.asp">
              <%
              print();
            %>
              <a class="mailtable" href="javascript: document.teams.submit();">Teams</a>
            </form>
          </div>
          <div class="cell">
            <form name="races" method="POST" action="races.asp">
              <%
              print();
            %>
              <a class="mailtable" href="javascript: document.races.submit();">Races</a>
            </form>
          </div>
          <div class="cell">
            <form name="sponsors" method="POST" action="sponsors.asp">
              <%
              print();
            %>
              <a class="mailtable" href="javascript: document.sponsors.submit();">Sponsors</a>
            </form>
          </div>
          <div class="cell">
            <form name="participations" method="POST" action="participations.asp">
              <%
              print();
              %>
              <a class="mailtable" href="javascript: document.participations.submit();">Participations</a>
            </form>
          </div>
          <div class="cell">
            <form name="prizes" method="POST" action="prizes.asp">
              <%
              print();
              %>
              <a class="mailtable" href="javascript: document.prizes.submit();">Prizes</a>
            </form>
          </div>
        </div>
      </div>
    </nav>
    <section id="sectionID">
      <form id="formID" method="POST" action="index.asp">
        <%
      var str = "You are logged in as ";
      var str1 = "<label for=\"login\">login: </label>" +
      "<input id=\"login\" type=\"text\" name=\"id\" value=\"\" required>" +
      "<label for=\"password\">password: </label>" +
      "<input id=\"password\" type=\"password\" name=\"password\" value=\"\" required>" +
      "<input id=\"confirmID\" class=\"button\" type=\"submit\" value=\"confirm\">";
      if (flag == "-1"){
        Response.write(str1 + "Incorrect username or password. " + str + " guest. <a href=\"reg.asp\">Register new user</a><input type=\"hidden\" name=\"flag\" value=\"-1\">");
      }
      else if (flag == "0"){
        Response.write(str1 + str + " guest. " + "<input type=\"hidden\" name=\"flag\" value=\"0\"><a href=\"reg.asp\">Register new user</a>"); 
      }
      else if (flag == "1"){
        Response.write(str + id + "<a href=\"index.asp\">(exit)</a><input type=\"hidden\" name=\"flag\" value=\"1\">");
      }
      else if (flag == "2"){
        Response.write(str + id + "<a href=\"index.asp\">(exit)</a><input type=\"hidden\" name=\"flag\" value=\"2\">"); 
      }
    %>
      </form>
    </section>
    <section class="mainsection">
      <%
  if (flag == "2" || flag =="1"){
    Response.write("<div><h2>Execute any of the queries</h2><form class=\"query\" action=\"SQLQuery.asp\" method=\"post\"><input type=\"submit\" value=\"top 10 races\"><input type=\"hidden\" name=\"sql\" value=\"select top 10 * from race order by key\">" + 
      "<input type=\"hidden\" name=\"id\" value=" + id + ">" + 
      "<input type=\"hidden\" name=\"flag\" value=" + flag + "></form>" + 
      "<form class=\"query\" action=\"SQLQuery.asp\" method=\"post\"><input type=\"submit\" value=\"USA sponsors\"><input type=\"hidden\" name=\"sql\" value=\"select * from sponsor where country='USA'\">" + 
      "<input type=\"hidden\" name=\"id\" value=" + id + ">" + 
      "<input type=\"hidden\" name=\"flag\" value=" + flag + "></form>" + 
      "<form class=\"query\" action=\"SQLQuery.asp\" method=\"post\"><input type=\"submit\" value=\"racers age<30\"><input type=\"hidden\" name=\"sql\" value=\"select * from racer where age<30\">" + 
      "<input type=\"hidden\" name=\"id\" value=" + id + ">" + 
      "<input type=\"hidden\" name=\"flag\" value=" + flag + "></form>" + 
      "<form class=\"query\" action=\"SQLQuery.asp\" method=\"post\"><input type=\"submit\" value=\"prizes with 1 place\"><input type=\"hidden\" name=\"sql\" value=\"select * from prize where place=1\">" + 
      "<input type=\"hidden\" name=\"id\" value=" + id + ">" + 
      "<input type=\"hidden\" name=\"flag\" value=" + flag + "></form>" + 
      "<form class=\"query\" action=\"SQLQuery.asp\" method=\"post\"><input type=\"submit\" value=\"all participations with all data\"><input type=\"hidden\" name=\"sql\" value=\"select * from race r, team t, participation p where p.team = t.key and p.race = r.key\">" + 
      "<input type=\"hidden\" name=\"id\" value=" + id + ">" + 
      "<input type=\"hidden\" name=\"flag\" value=" + flag + "></form></div>");
    if (flag == "2"){
      Response.write("<div><h2>Enter dynamic SQL query</h2>" +
        "<textarea id=\"textarea\"></textarea>" +
        "<form id=\"formSQL\" method=\"POST\" action=\"dynamicSQL.asp\"><input id=\"sql\" name=\"sql\" type=\"hidden\" value=\"\">" + 
          "<input type=\"hidden\" name=\"id\" value=" + id + ">" + 
          "<input type=\"hidden\" name=\"flag\" value=" + flag + ">" + 
          "<input id=\"confirmSQL\" class=\"button\" type=\"submit\" value=\"confirm\"></form></div>");
      }
    }
    function print(){
      Response.write("<input type=\"hidden\" name=\"id\" value=" + id + ">" + 
        "<input type=\"hidden\" name=\"flag\" value=" + flag + ">" + 
        "<input type=\"hidden\" name=\"transition\" value=\"true\">");
    }
  %>
      <video controls src="assets/video/F1 Rewind- The Funniest Moments of 2018.mp4">     
        <p>Your browser does not support the item &#8249;video&#8250;</p>
      </video>
      <blockquote>
        &emsp;Корни «Формулы-1» лежат в чемпионате Европы по автогонкам Гран-при, который проводился в 1920-е и 1930-е
        годы. Организации, участвующие в Гран-при,
        сформулировали первый регламент проведения чемпионата мира перед Второй мировой войной и запланировали его
        введение в действие на 1941 год, но вплоть
        до 1946 года эти правила не были формализованы окончательно. В 1946 году недавно образованная ФИА представила
        правила так называемой «Формулы-А»,
        переименованную затем в «Формулу-1», которые вступали в действие с 1947 года. Технический регламент основывался
        на нескольких идеях: немецкие гонщики
        были на 10 лет исключены из гонок ввиду поражения и оккупации Германии, но это не касалось итальянцев, так как
        капитуляция в 1943 году и участие итальянцев
        в борьбе с Третьим Рейхом сняло многие обвинения со страны. Перед войной, в попытке хоть как-то взять верх в
        борьбе с немецкими машинами, автоклуб Италии
        провёл Гран-при Триполи по правилам «младшей формулы» или voiturette, ограничивающим рабочий объём двигателя
        цифрой 1,5 л. И хотя это не спасло итальянцев
        от разгрома, после войны именно эти машины были взяты за образец при подготовке регламента «Формулы-1». Кроме
        того, были допущены старые французские машины
        Гран-При с безнаддувными двигателями 4,5 л, неспособные конкурировать с современными им немецкими машинами.
        Вместе с тем, ещё в том же году организаторы
        трёх Гран-при провели гонки по регламенту «Формулы-1». В 1948 году к «Формуле-1» добавился класс «Формулы-2».
        Ещё более младший класс «Формула-3» был
        введён в 1950 году. По первоначальной схеме предполагалось, что класс «Формула-1» предназначался исключительно
        для проведения мирового первенства, класс
        «Формула-2» — для проведения первенства континента, «Формула-3» — для национальных чемпионатов и так далее.<br><br>

        &emsp;В 1950 году ФИА было решено занести результаты отдельных гонок в классе «Формула-1» в общий протокол
        чемпионата мира. Первый такой Гран-при прошёл на
        английской земле на автодроме Сильверстоун. До 1958 года чемпионат мира был исключительно личным, затем очки
        стали начисляться и конструкторам болидов
        (так называемый Кубок конструкторов).<br><br>

        &emsp;Не следует однако полностью отождествлять класс «Формула-1» и чемпионат мира ФИА. Зачастую в мире
        проводилось на порядок больше крупных гонок (в том
        числе и в наивысшем гоночном классе), нежели входило в чемпионат мира. Немногие гонщики выбирали для участия
        исключительно этапы чемпионата мира: они
        принимали участие в самых разных гонках, в том числе и необязательно на машинах с открытыми колёсами.
        Автомобили «Формулы-1» выступали не только в
        чемпионате мира, но и в других, внезачётных гонках, как правило, имевших самостоятельный статус. Так, из 22
        гонок, проведённых в 1950 году с участием
        автомобилей «Формулы-1», только 5 шли в зачёт чемпионата мира. Кроме чемпионата мира автомобили «Формулы-1»
        применялись также в южноафриканском чемпионате
        «Формулы-1» (1960—1975) и британском чемпионате Формулы-1 (1977—1980, 1982).<br><br>

        &emsp;В то же время и сам чемпионат мира не всегда проводился по правилам «Формулы-1». Так, входившая в зачёт
        чемпионата американская гонка Инди-500 проходила
        по собственному регламенту, на машинах, именуемых «индикарами». Когда в 1951 году ФИСА объявила новые правила
        «Формулы-1», вступающие с 1954 года, никто
        не хотел готовить автомобиль на сезоны 1952—1953 годов по старым правилам, и, из-за отсутствия достаточного
        числа участников, чемпионат мира был проведён
        по правилам «Формулы-2».<br><br>

        &emsp;Ситуация полностью изменилась в начале 1980-х годов, когда после «войны FISA и FOCA» был принят Договор
        согласия. С этого момента гонки в классе
        «Формула-1» проходят только в рамках чемпионата мира. Фактически исчезло само понятие класса «Формула-1» и
        появилась гоночная серия Формула-1,
        коммерческие права на которую отделены от спортивных, относящихся к ведению ФИА.
      </blockquote>
    </section>
    <footer>All rights reserved. Copyright &copy; 2019</footer>
  </div>
</body>

</html>