<%@LANGUAGE="JavaScript"%>
<!doctype html>

<html lang="en">

<head>
  <link rel="stylesheet" href="assets/css/common.css">
  <script src="handler.js"></script>
  <title>
    Confirm new user
  </title>
</head>

<body>
  <div id="main">
    <header>
      <h1>
        Confirm new user
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
    var id = Request("id");
    var passwd = Request("passwd");
    var country = Request("country");
    var email = Request("email");
    var conn = Server.CreateObject("ADODB.Connection");
    conn.Open("Race");
    try{
      var result = conn.Execute("select id from user where id = \'"+id+"\'");
      if (check(result)){
        Response.Write("<p>" + "Record with login = \'"+id+"\' already exists!" + "</p>");
        Response.write("<a href=\"reg.asp\">try again</a>");
      }
      else{
        var index = conn.Execute("select max(key) as max from user")("max") + 1;
        Response.write("<form id=\"form\" method=\"POST\" action=\"successreg.asp\"><table><caption>Confirm the data</caption>" + 
        "<tr><th>login</th><td>" + id + "</td></tr>" + 
        "<tr><th>country</th><td>" + country + "</td></tr>" + 
        "<tr><th>email</th><td>" + email + "</td></tr>" +
        "</table><input id=\"index\" type=\"hidden\" name=\"index\" value=\"" + index + "\">" +
        "<input id=\"id\" type=\"hidden\" name=\"id\" value=\"" + id + "\">" +
        "<input id=\"passwd\" type=\"hidden\" name=\"passwd\" value=\"" + passwd + "\">" +
        "<input id=\"country\" type=\"hidden\" name=\"country\" value=\"" + country + "\">" + 
        "<input id=\"email\" type=\"hidden\" name=\"email\" value=\"" + email + "\">" +
        "<input class=\"button\" type=\"submit\" name=\"submit\" value=\"confirm\"></form>");
      }
    }
    catch(exception){
      document.getElementsByTagName("body")[0].removeChild(document.getElementById("form"));
      Response.Write("<p>" + exception.description + "</p>");      
    }
    conn.close();   
    function check(table){
      if (!table.eof){
        return true;
      }
      return false;
    } 
  %>
    </section>
    <footer>All rights reserved. Copyright &copy; 2019</footer>
  </div>
</body>

</html>