<%@LANGUAGE="JavaScript"%>
<!doctype html>

<html lang="en">

<head>
  <link rel="stylesheet" href="assets/css/common.css">
  <script src="handler.js"></script>
  <title>
    New user
  </title>
</head>

<body>
  <div id="main">
    <header>
      <h1>
        New user
      </h1>
    </header>
    <nav>
      <div class="table">
        <div class="row">
          <div class="cell">
            <a class="mailtable" href="index.asp"><img id="home" src="assets/img/button_home.jpg" alt="home"></a>
          </div>
          <div class="cell">
            <a class="mailtable" href="racers.asp">Racers</a>
          </div>
          <div class="cell">
            <a class="mailtable" href="teams.asp">Teams</a>
          </div>
          <div class="cell">
            <a class="mailtable" href="races.asp">Races</a>
          </div>
          <div class="cell">
            <a class="mailtable" href="sponsors.asp">Sponsors</a>
          </div>
          <div class="cell">
            <a class="mailtable" href="participations.asp">Participations</a>
          </div>
          <div class="cell">
            <a class="mailtable" href="prizes.asp">Prizes</a>
          </div>
        </div>
      </div>
    </nav>
    <section class="mainsection">
      <%  
    var index = Request("index");
    var id = Request("id");
    var passwd = Request("passwd");
    var country = Request("country");
    var email = Request("email");
    var conn = Server.CreateObject("ADODB.Connection");
    conn.Open("Race");
    try{
      conn.Execute("insert into user values (" + index + ", \'" + id + "\', \'" + passwd + "\', \'" + country + "\', \'" + email + "\')");
      Response.Write("<p>Record successfully added!</p>");
    }
    catch(exception){
      Response.Write("<p>" + exception.description + "</p>");
    }
    conn.close();
  %>
    </section>
    <footer>All rights reserved. Copyright &copy; 2019</footer>
  </div>
</body>

</html>