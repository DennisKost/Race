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
    var conn = Server.CreateObject("ADODB.Connection");
    conn.Open("Race");
    try{
      if (table == "race"){
        var RaceName = Request("RaceName");
        var Address = Request("Address");
        var Length = Request("Length");
        var key = conn.Execute("select max(key) as max from race")("max") + 1;
        conn.Execute("insert into race values (" + key + 
          ",\'" + RaceName + "\',\'" + Address + "\'," + Length + ")");   
        Response.write("<p>Record successfully added!</p>");   
      }
      else if (table == "team"){
        var TeamName = Request("TeamName");
        var Country = Request("Country");
        var Budget = Request("Budget");
        var FDate = Request("FDate");
        var Address = Request("Address");
        var Sponsor = Request("Sponsor");
        if (!conn.Execute("select 1 from sponsor where key = " + Sponsor).eof){
          var key = conn.Execute("select max(key) as max from team")("max") + 1;
          conn.Execute("insert into team values (" + key + 
          ",\'" + TeamName + "\',\'" + Country + "\',\'" + Budget + "\',\'" + FDate + "\',\'" + Address + "\'," + Sponsor + ")");
          Response.write("<p>Record successfully added!</p>");
        }     
        else{
          Response.write("<p>Missing sponsor!</p>");
        }   
      }
      else if (table == "racer"){
        var RacerName = Request("RacerName");
        var Age = Request("Age");
        var Address = Request("Address");
        var Team = Request("Team");
        if (!conn.Execute("select 1 from team where key = " + Team).eof){
          var key = conn.Execute("select max(key) as max from racer")("max") + 1;
          conn.Execute("insert into racer values (" + key + 
            ",\'" + RacerName + "\'," + Age + ",\'" + Address + "\'," + Team + ")");
          Response.write("<p>Record successfully added!</p>");
        }
        else{
          Response.write("<p>Missing team!</p>");
        }        
      }
      else if (table == "sponsor"){
        var SponsorName = Request("SponsorName");
        var Country = Request("Country");
        var Field = Request("Field");
        var key = conn.Execute("select max(key) as max from sponsor")("max") + 1;
        conn.Execute("insert into sponsor values (" + key + 
          ",\'" + SponsorName + "\',\'" + Country + "\',\'" + Field + "\')");
        Response.write("<p>Record successfully added!</p>");
      }
      else if (table == "participation"){
        var Team = Request("Team");
        var Race = Request("Race");
        var flagTeam = conn.Execute("select 1 from team where key = " + Team).eof;
        var flagRace = conn.Execute("select 1 from race where key = " + Race).eof;
        if (flagTeam && flagRace){
          Response.write("<p>Missing team and race!</p>");
        }
        else if (flagTeam){
          Response.write("<p>Missing team!</p>");
        } 
        else if (flagRace){
          Response.write("<p>Missing race!</p>");          
        }
        else{
          var key = conn.Execute("select max(key) as max from participation")("max") + 1;
          conn.Execute("insert into participation values (" + key + 
            "," + Team + "," + Race + ")");
          Response.write("<p>Record successfully added!</p>");
        }        
      }
      else if (table == "prize"){
        var Race = Request("Race");
        var Racer = Request("Racer");
        var Cash = Request("Cash");
        var Place = Request("Place");
        var flagRace = conn.Execute("select 1 from race where key = " + Race).eof;
        var flagRacer = conn.Execute("select 1 from racer where key = " + Racer).eof;
        if (flagRace && flagRacer){
          Response.write("<p>Missing race and racer!</p>");
        }
        else if(flagRace){
          Response.write("<p>Missing race!</p>");
        }
        else if(flagRacer){
          Response.write("<p>Missing racer!</p>");
        }
        else{
          var key = conn.Execute("select max(key) as max from prize")("max") + 1;
          conn.Execute("insert into prize values (" + key + 
          "," + Race + "," + Racer + ",\'" + Cash + "\'," + Place + ")");
          Response.write("<p>Record successfully added!</p>");
        }        
      }      
    }     
    catch(exception){
      Response.Write("<p>" + exception.description + "</p>");
    }    
    conn.close();
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