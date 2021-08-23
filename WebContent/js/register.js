function validation()
{
    var form = document.getElementById("register-form");
    var email = document.getElementById("email").value;
    var text = document.getElementById("subtext1");
    var pattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if(email.match(pattern))
    {
        form.classList.add("valid");
        form.classList.remove("invalid");
        document.getElementById("email").style.border = "2px solid green";
        text.innerHTML = "valid Email Address";
        text.style.color = "green";
    }
    else
    {
        form.classList.remove("valid");
        form.classList.add("invalid");
        document.getElementById("email").style.border = "2px solid red";
        text.innerHTML = "Invalid Email Address";
        text.style.color = "#ff0000";
    }
    if(email == "")
    {
        form.classList.remove("valid");
        form.classList.remove("invalid");
        text.innerHTML = "";
        text.style.color = "#00ff00";
    }
}

var result = $("#strength");
    $('#password').keyup(function(){
        $(".subtext2").html(checkStrength($('#password').val()))
    }) 
 
    function checkStrength(password)
    {
    var text = document.getElementById("subtext2");
    var strength = 0
    if (password.length == 0) 
    {
        result.removeClass()
        return ''
    }
    if(password.length>20)
    {
        text.innerHTML = "password is too long !!!";
        document.getElementById("password").style.border = "3px solid red";
        text.style.color = "red";
        return 'too long'
    }
    if (password.length < 8)
     {
        result.removeClass()
        result.addClass('short')
        text.innerHTML = "too short password";
        text.style.color = "red";
        return 'too short'
    }

    if (password.length > 7) 
    strength += 1
   
    if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) 
    strength += 1

    if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/))  
    strength += 1 

    if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) 
    strength += 1

    if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,",%,&,@,#,$,^,*,?,_,~])/)) 
        strength += 1

    if (strength < 2) 
    {
        result.removeClass()
        result.addClass('weak')
        text.innerHTML = "weak password";
        document.getElementById("password").style.border = "1px solid #f5ba1a";
        text.style.color = "orange";
        return 'weak'
    } 
    else if (strength == 2 )
    {
        result.removeClass()
        result.addClass('good')
        text.innerHTML = "good password";
        document.getElementById("password").style.border = "1px solid #f5ba1a";
        text.style.color = "yellow";
        return 'good'
    } 
    else 
    {
        result.removeClass()
        result.addClass('strong')
        text.innerHTML = "strong password";
        text.style.color = "green";
        document.getElementById("password").style.border = "3px solid green";
        return 'strong'
    }
}

function checkPasswordMatch()
{
    var password = $("#password").val();
    var confirmPassword = $("#confirmPassword").val();
    var text = document.getElementById("checkPassword");
    if (password != confirmPassword)
    {
        text.innerHTML = "password does not match !!!";
        document.getElementById("confirmPassword").style.border = "3px solid red";
        document.getElementById("password").style.border = "3px solid red";
        text.style.color = "red";
    }
    else
    {
        text.innerHTML = "password matched successfully";
        document.getElementById("confirmPassword").style.border = "3px solid green";
        document.getElementById("password").style.border = "3px solid green";
        text.style.color = "green";
    }
}

function checkMobileNumber()
{
    var phone = document.forms["register-form"]["mobile"].value;
    var phoneNum = phone.replace(/[^\d]/g, '');
    var text = document.getElementById("checkMobile");
    if(phoneNum.length == 10)
    {
        text.innerHTML = "valid mobile number";
        document.getElementById("mobile").style.border = "2px solid green";
        text.style.color = "green";
    }
    else
    {
        text.innerHTML = "invalid mobile number";
        document.getElementById("mobile").style.border = "2px solid red";
        text.style.color = "red";
    }
}