<%@LANGUAGE="JavaScript"%>
<%
  var id = Request("id");
  var flag = Request("flag");
%>
<!doctype html>

<html lang="en">

<head>
  <link rel="stylesheet" href="assets/css/common.css">
  <script src="handler.js"></script>
  <title>
    SQL query
  </title>
</head>

<body>
  <div id="main">
    <header>
      <h1>
        SQL query
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
    <section class="mainsection">
      <%    
    var conn = Server.CreateObject("ADODB.Connection");
    conn.Open("Race");
    var sql = Request("sql");
    Response.Write("<p>Query: " + sql + "</p>");
    try{    
      var result = conn.Execute(sql);
      if (result){
        Response.write("<p>Query completed</p>");
        printTable(result);
      };
    }
    catch(exception){
      Response.Write("<p>" + exception.description + "</p>");
    }  
    conn.close();
    function printTable(results) 
    {
      Response.Write("<p>The result of the query:</p>");
      var numCols = results.fields.count;
      Response.write("<table><tr>");
      for (var col = 0; col < numCols; col++) {
        Response.write("<th>" + results.fields(col).name + "</th>");
      }
      Response.write("</tr>");
      while (!results.eof) {
        Response.write("<tr>");
        for (col = 0; col < numCols; col++) {
          Response.write("<td>" + results.fields(col) + "</td>");
        }
        results.movenext();
        Response.write("</tr>");
      }
      Response.write("</table>");
    }
    function print(){
      Response.write("<input type=\"hidden\" name=\"id\" value=" + id + ">" + 
        "<input type=\"hidden\" name=\"flag\" value=" + flag + ">" + 
        "<input type=\"hidden\" name=\"transition\" value=\"true\">");
    }
  %>
    </section>
    <footer>All rights reserved. Copyright &copy; 2019</footer>
  </div>
</body>

</html>