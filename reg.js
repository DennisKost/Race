window.onload = function () {
  document.getElementById("regForm").onsubmit = function () {
    if (document.getElementById("id").value == "admin") {      
      document.getElementById("id").focus();
      alert("Can not create an account named \"admin\"");
      return false;
    } 
    if (document.getElementById("id").value == "" || document.getElementById("passwd").value == "" ||
      document.getElementById("country").value == "" || document.getElementById("email").value == "") {
      alert("Fill in all the fields");
      return false;
    }
    if (document.getElementById("reppasswd").value != document.getElementById("passwd").value){    
      document.getElementById("passwd").value = "";
      document.getElementById("reppasswd").value = "";
      document.getElementById("passwd").focus();
      alert("Passwords must match");
      return false;
    }
    if (!(document.getElementById("email")).match(/.+@.+/)) {      
      document.getElementById("email").focus();
      alert("Email address must be user@host");
      return false;
    }
    if (document.getElementById("id").value.length < 6){      
      document.getElementById("id").focus();
      alert("id must contain at least 6 characters");
      return false;
    }
    return true;
  };
}