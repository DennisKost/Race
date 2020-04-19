<%@LANGUAGE="JavaScript"%>
<!doctype html>

<html lang="en">

<head>
  <link rel="stylesheet" href="assets/css/common.css">
  <link rel="stylesheet" href="assets/css/extra.css">
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
            <form name="home" method="POST" action="index.asp">
              <%
                    print();
                  %>
              <a class="mailtable" href="javascript: document.home.submit();"><img id="home" src="assets/img/button_home.jpg"
                  alt="home"></a>
            </form>
          </div>
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
      <%
    Response.write("You are logged in as admin<a href=\"index.asp\">(exit)</a>"); 
    %>
    </section>
    <section class="mainsection">
      <%
    var table = Request("table");
    if (table == "race"){
      var RaceName = Request("RaceName");
      var Address = Request("Address");
      var Length = Request("Length");
      Response.write("<table><caption>Confirm adding line</caption><tr><th>Race Name</th><td>" + RaceName + "</td></tr>" + 
        "<tr><th>Adress</th><td>" + Address + "</td></tr>" + 
        "<tr><th>Length</th><td>" + Length + "</td></tr></table>" + 
        "<form action=\"successaddrow.asp\" method=\"POST\"><input type=\"hidden\" name=\"RaceName\" value=\"" + RaceName + "\">" + 
        "<input type=\"hidden\" name=\"Address\" value=\"" + Address + "\">" + 
        "<input type=\"hidden\" name=\"Length\" value=\"" + Length + "\">" + 
        "<input type=\"hidden\" name=\"table\" value=\"race\">" + 
        "<input class=\"button\" type=\"submit\" value=\"confirm\"></form>");
    }
    else if (table == "team"){
      var TeamName = Request("TeamName");
      var Country = Request("Country");
      var Budget = Request("Budget");
      var FDate = Request("FDate");
      var Address = Request("Address");
      var Sponsor = Request("Sponsor");
      Response.write("<table><caption>Confirm adding line</caption><tr><th>Team Name</th><td>" + TeamName + "</td></tr>" + 
        "<tr><th>Country</th><td>" + Country + "</td></tr>" + 
        "<tr><th>Budget</th><td>" + Budget + "</td></tr>" + 
        "<tr><th>FDate</th><td>" + FDate + "</td></tr>" + 
        "<tr><th>Adress</th><td>" + Address + "</td></tr>" + 
        "<tr><th>Sponsor</th><td>" + Sponsor + "</td></tr></table>" + 
        "<form action=\"successaddrow.asp\" method=\"POST\"><input type=\"hidden\" name=\"TeamName\" value=\"" + TeamName + "\">" + 
        "<input type=\"hidden\" name=\"Country\" value=\"" + Country + "\">" + 
        "<input type=\"hidden\" name=\"Budget\" value=\"" + Budget + "\">" + 
        "<input type=\"hidden\" name=\"FDate\" value=\"" + FDate + "\">" + 
        "<input type=\"hidden\" name=\"Address\" value=\"" + Address + "\">" + 
        "<input type=\"hidden\" name=\"Sponsor\" value=\"" + Sponsor + "\">" + 
        "<input type=\"hidden\" name=\"table\" value=\"team\">" + 
        "<input class=\"button\" type=\"submit\" value=\"confirm\"></form>");
    }
    else if (table == "racer"){
      var RacerName = Request("RacerName");
      var Age = Request("Age");
      var Address = Request("Address");
      var Team = Request("Team");
      Response.write("<table><caption>Confirm adding line</caption><tr><th>Racer Name</th><td>" + RacerName + "</td></tr>" + 
        "<tr><th>Age</th><td>" + Age + "</td></tr>" + 
        "<tr><th>Address</th><td>" + Address + "</td></tr>" + 
        "<tr><th>Team</th><td>" + Team + "</td></tr>" + 
        "<form action=\"successaddrow.asp\" method=\"POST\"><input type=\"hidden\" name=\"RacerName\" value=\"" + RacerName + "\">" + 
        "<input type=\"hidden\" name=\"Age\" value=\"" + Age + "\">" + 
        "<input type=\"hidden\" name=\"Address\" value=\"" + Address + "\">" + 
        "<input type=\"hidden\" name=\"Team\" value=\"" + Team + "\">" + 
        "<input type=\"hidden\" name=\"table\" value=\"racer\">" + 
        "<input class=\"button\" type=\"submit\" value=\"confirm\"></form>");
    }
    else if (table == "sponsor"){
      var SponsorName = Request("SponsorName");
      var Country = Request("Country");
      var Field = Request("Field");
      Response.write("<table><caption>Confirm adding line</caption><tr><th>Sponsor Name</th><td>" + SponsorName + "</td></tr>" + 
        "<tr><th>Team</th><td>" + Team + "</td></tr>" + 
        "<tr><th>Country</th><td>" + Country + "</td></tr>" + 
        "<tr><th>Field</th><td>" + Field + "</td></tr>" + 
        "<form action=\"successaddrow.asp\" method=\"POST\"><input type=\"hidden\" name=\"SponsorName\" value=\"" + SponsorName + "\">" + 
        "<input type=\"hidden\" name=\"Country\" value=\"" + Country + "\">" + 
        "<input type=\"hidden\" name=\"Field\" value=\"" + Field + "\">" + 
        "<input type=\"hidden\" name=\"table\" value=\"sponsor\">" + 
        "<input class=\"button\" type=\"submit\" value=\"confirm\"></form>");
    }
    else if (table == "participation"){
      var Team = Request("Team");
      var Race = Request("Race");
      Response.write("<table><caption>Confirm adding line</caption><tr><th>Team</th><td>" + Team + "</td></tr>" + 
        "<tr><th>Race</th><td>" + Race + "</td></tr>" + 
        "<form action=\"successaddrow.asp\" method=\"POST\"><input type=\"hidden\" name=\"Team\" value=\"" + Team + "\">" + 
        "<input type=\"hidden\" name=\"Race\" value=\"" + Race + "\">" +  
        "<input type=\"hidden\" name=\"table\" value=\"participation\">" + 
        "<input class=\"button\" type=\"submit\" value=\"confirm\"></form>");
    }
    else if (table == "prize"){
      var Race = Request("Race");
      var Racer = Request("Racer");
      var Cash = Request("Cash");
      var Place = Request("Place");
      Response.write("<table><caption>Confirm adding line</caption><tr><th>Race</th><td>" + Race + "</td></tr>" + 
        "<tr><th>Racer</th><td>" + Racer + "</td></tr>" + 
        "<tr><th>Cash</th><td>" + Cash + "</td></tr>" + 
        "<tr><th>Place</th><td>" + Place + "</td></tr>" + 
        "<form action=\"successaddrow.asp\" method=\"POST\"><input type=\"hidden\" name=\"Race\" value=\"" + Race + "\">" + 
        "<input type=\"hidden\" name=\"Racer\" value=\"" + Racer + "\">" + 
        "<input type=\"hidden\" name=\"Cash\" value=\"" + Cash + "\">" + 
        "<input type=\"hidden\" name=\"Place\" value=\"" + Place + "\">" + 
        "<input type=\"hidden\" name=\"table\" value=\"prize\">" + 
        "<input class=\"button\" type=\"submit\" value=\"confirm\"></form>");
    }
    function print(){
      Response.write("<input type=\"hidden\" name=\"id\" value=\"admin\">" + 
        "<input type=\"hidden\" name=\"flag\" value=\"2\">" + 
        "<input type=\"hidden\" name=\"transition\" value=\"true\">");
    }
  %>
    </section>
    <footer>All rights reserved. Copyright &copy; 2019</footer>
  </div>
</body>

</html>