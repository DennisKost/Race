<%@LANGUAGE="JavaScript"%>
<!doctype html>

<html lang="en">

<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="assets/css/common.css">
  <script src="handler.js"></script>
  <script src="reg.js"></script>
  <title>
    Registration
  </title>
</head>

<body>
  <div id="main">
    <header>
      <h1>
        Registration
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
      <form id="regForm" method="POST" action="confirmreg.asp">
        <table>
          <tr>
            <th>
              Login
            </th>
            <td>
              <input id="id" type="text" name="id" value="" required>
            </td>
          </tr>
          <tr>
            <th>
              Password
            </th>
            <td>
              <input id="passwd" type="password" name="passwd" value="" required>
            </td>
          </tr>
          <tr>
            <th>
              Repeat password
            </th>
            <td>
              <input id="reppasswd" type="password" name="reppasswd" value="" required>
            </td>
          </tr>
          <tr>
            <th>
              Country
            </th>
            <td>
              <input id="country" type="text" name="country" value="" required>
            </td>
          </tr>
          <tr>
            <th>
              E-mail
            </th>
            <td>
              <input id="email" type="text" name="email" value="" required><br>
            </td>
          </tr>
        </table>
        <input class="button" type="reset" value="reset">
        <input class="button" type="submit" value="confirm">
      </form>
    </section>
    <footer>All rights reserved. Copyright &copy; 2019</footer>
  </div>
</body>

</html>