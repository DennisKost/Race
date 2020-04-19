<%@LANGUAGE="JavaScript"%>
<%
  var id = Request("id");
  var flag = Request("flag");
  var passwd = Request("password");       
  var trans = Request("transition");
  var conn = Server.CreateObject("ADODB.Connection");
  conn.Open("Race");
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
%>
<!doctype html>

<html lang="en">

<head>
  <link rel="stylesheet" href="assets/css/common.css">
  <script src="handler.js"></script>
  <script src="table.js"></script>
  <title>
    Participations
  </title>
</head>

<body>
  <div id="main">
    <header>
      <h1>
        Participations
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
            <a class="mailtable" href="javascript:void(0);">Participations</a>
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
      <form id="formID" method="POST" action="participations.asp">
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
        Response.write(str + id + "<a href=\"participations.asp\">(exit)</a><input type=\"hidden\" name=\"flag\" value=\"1\">");
      }
      else if (flag == "2"){
        Response.write(str + id + "<a href=\"participations.asp\">(exit)</a><input type=\"hidden\" name=\"flag\" value=\"2\">"); 
      }
    %>
      </form>
    </section>
    <section class="mainsection">
      <% 
      if (flag == "1" || flag == "2"){
        try{
          printTable(conn.Execute("select * from participation"));
        }
        catch(exception){
          Response.Write("<p>" + exception.description + "</p>");
        }  
        function printTable(results) 
        {
          var numCols = results.fields.count;
          Response.write("<table class=\"datatable\"><caption>Participation table</caption><tr>");
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
        if (flag == "2"){
          Response.write("<div><form id=\"addform\" action=\"addrow.asp\" method=\"POST\"><table><caption>Add new participation</caption>" + 
          "<tr><th>Team</th><td><input type=\"text\" name=\"Team\" value=\"\" required></td></tr>" +
          "<tr><th>Race</th><td><input type=\"text\" name=\"Race\" value=\"\" required></td></tr>" +
          "</table><input type=\"hidden\" name=\"table\" value=\"participation\"><input class=\"button\" type=\"reset\" value=\"reset\"><input class=\"button\" type=\"submit\" value=\"confirm\"></form></div>" + 
          "<div><h2>Select the line to be deleted or update</h2><select id=\"Select\">");
          try{
            result = conn.Execute("select key from participation");
            while(!result.eof){
              Response.write("<option>" + result.fields(0) + "</option>");
              result.movenext();
            }
          }
          catch(exception){
            Response.Write("<p>" + exception.description + "</p>");
          }        
          Response.write("</select><form  id=\"delrow\" action=\"delrow.asp\" method=\"POST\">" + 
          "<input id=\"del\" type=\"hidden\" name=\"del\" value=\"\"><input type=\"hidden\" name=\"table\" value=\"participation\">" +
          "<input id=\"delButton\" class=\"button\" type=\"submit\" value=\"delete\"></form>" + 
          "<form  id=\"altrow\" action=\"altrow.asp\" method=\"POST\">" + 
          "<input id=\"alt\" type=\"hidden\" name=\"alt\" value=\"\"><input type=\"hidden\" name=\"table\" value=\"participation\">" + 
          "<input id=\"altButton\" class=\"button\" type=\"submit\" value=\"alter\"></form></div>" + 
          "<div><h2>Enter dynamic SQL query</h2><textarea id=\"textarea\"></textarea>" +
          "<form id=\"formSQL\" method=\"POST\" action=\"dynamicSQL.asp\"><input id=\"sql\" name=\"sql\" type=\"hidden\" value=\"\">" + 
          "<input type=\"hidden\" name=\"id\" value=" + id + ">" + 
          "<input type=\"hidden\" name=\"flag\" value=" + flag + ">" + 
          "<input id=\"confirmSQL\" class=\"button\" type=\"submit\" value=\"confirm\"></form></div>");
        }
        conn.close();
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