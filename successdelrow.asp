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
    var key = Request("key");
    var conn = Server.CreateObject("ADODB.Connection");
    conn.Open("Race");
    try{
      if (table == "race"){ 
        var flagPrize = !conn.Execute("select 1 from prize where race = " + key).eof;
        var flagParticipation = !conn.Execute("select 1 from participation where race = " + key).eof;
        if (flagPrize && flagParticipation){
          Response.write("<p>The record is associated with tables prize and participation!</p>");
        }
        else if(flagPrize){
          Response.write("<p>The record is associated with the table prize</p>");
        }
        else if(flagParticipation){
          Response.write("<p>The record is associated with the table participation</p>");
        }
        else{
          conn.Execute("delete from race where key = " + key); 
          Response.write("<p>Record successfully deleted!</p>");
        }        
      }
      else if (table == "team"){
        var flagRacer = !conn.Execute("select 1 from racer where team = " + key).eof;
        var flagParticipation = !conn.Execute("select 1 from participation where team = " + key).eof;
        if (flagRacer && flagParticipation){
          Response.write("<p>The record is associated with tables racer and participation!</p>");
        }
        else if(flagRacer){
          Response.write("<p>The record is associated with the table racer</p>");
        }
        else if(flagParticipation){
          Response.write("<p>The record is associated with the table participation</p>");
        }
        else{
          conn.Execute("delete from team where key = " + key);  
          Response.write("<p>Record successfully deleted!</p>");
        }       
      }
      else if (table == "racer"){
        var flagPrize = !conn.Execute("select 1 from prize where racer = " + key).eof;
        if (flagPrize){
          Response.write("<p>The record is associated with the table prize</p>");
        }
        else{
          conn.Execute("delete from racer where key = " + key);    
          Response.write("<p>Record successfully deleted!</p>");
        }            
      }
      else if (table == "sponsor"){
        var flagTeam = !conn.Execute("select 1 from team where sponsor = " + key).eof;
        if (flagTeam){
          Response.write("<p>The record is associated with the table team</p>");
        }
        else{
          conn.Execute("delete from sponsor where key = " + key); 
          Response.write("<p>Record successfully deleted!</p>");
        }                
      }
      else if (table == "participation"){
        conn.Execute("delete from participation where key = " + key);    
        Response.write("<p>Record successfully deleted!</p>");     
      }
      else if (table == "prize"){
        conn.Execute("delete from prize where key = " + key);    
        Response.write("<p>Record successfully deleted!</p>");   
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