window.onload = function () {
  document.getElementById("formID").onsubmit = function() {
    var id = document.getElementById("login").value;
    var pass = document.getElementById("password").value;
    if (id == "" || pass == "") {
      alert("Fill in all the fields");
      return false;
    }
    return true;
  };
  document.getElementById("formSQL").onsubmit = function(){    
    if (document.getElementById("textarea").value != ""){
      document.getElementById("sql").value = document.getElementById("textarea").value;
      return true;
    }
    return false;
  }
};
