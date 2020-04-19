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
                    print1();
                  %>
              <a class="mailtable" href="javascript: document.home.submit();"><img id="home" src="assets/img/button_home.jpg"
                  alt="home"></a>
            </form>
          </div>
          <div class="cell">
            <form name="racers" method="POST" action="racers.asp">
              <%
              print1();
            %>
              <a class="mailtable" href="javascript: document.racers.submit();">Racers</a>
            </form>
          </div>
          <div class="cell">
            <form name="teams" method="POST" action="teams.asp">
              <%
              print1();
            %>
              <a class="mailtable" href="javascript: document.teams.submit();">Teams</a>
            </form>
          </div>
          <div class="cell">
            <form name="races" method="POST" action="races.asp">
              <%
              print1();
            %>
              <a class="mailtable" href="javascript: document.races.submit();">Races</a>
            </form>
          </div>
          <div class="cell">
            <form name="sponsors" method="POST" action="sponsors.asp">
              <%
              print1();
            %>
              <a class="mailtable" href="javascript: document.sponsors.submit();">Sponsors</a>
            </form>
          </div>
          <div class="cell">
            <form name="participations" method="POST" action="participations.asp">
              <%
              print1();
            %>
              <a class="mailtable" href="javascript: document.participations.submit();">Participations</a>
            </form>
          </div>
          <div class="cell">
            <form name="prizes" method="POST" action="prizes.asp">
              <%
              print1();
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
    var key = Request("del");
    var conn = Server.CreateObject("ADODB.Connection");
    conn.Open("Race");
    try{
      if (table == "race"){   
        print(conn.Execute("select * from race where key = " + key)); 
      }
      else if (table == "team"){  
        print(conn.Execute("select * from team where key = " + key));        
      }
      else if (table == "racer"){  
        print(conn.Execute("select * from racer where key = " + key));        
      }
      else if (table == "sponsor"){ 
        print(conn.Execute("select * from sponsor where key = " + key)); 
      }
      else if (table == "participation"){
        print(conn.Execute("select * from participation where key = " + key));     
      }
      else if (table == "prize"){
        print(conn.Execute("select * from prize where key = " + key));               
      }
    }
    catch(exception){
      Response.Write("<p>" + exception.description + "</p>");
    }
    conn.close(); 
    function print(result) 
    {
      Response.write("<table><caption>Confirm the line to be deleted</caption>");
      var numCols = result.fields.count;
      for (var col = 0; col < numCols; col++) {
        Response.write("<tr><th>" + result.fields(col).name + "</th><td>" + result.fields(col) + "</td></tr>");
      }
      Response.write("</table><form action=\"successdelrow.asp\" method=\"POST\">" +
          "<input type=\"hidden\" name=\"key\" value=\"" + key + "\">" + 
          "<input type=\"hidden\" name=\"table\" value=\"" + table + "\">" + 
          "<input class=\"button\" type=\"submit\" value=\"confirm\"></form>"); 
    } 
    function print1(){
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