function Validate()
{
	var name=document.getElementById("name").value;
	var email=document.getElementById("email").value;
	var password=document.getElementById("pass").value;
	var cpassword=document.getElementById("cpass").value;
	var mobile=document.getElementById("mobile").value;
	
        var pas_pattern = /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
        var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	var name_pattern=new RegExp("[a-zA-Z]+");
    var mobile_pattern = /^\d{10}$/;
    var password_pattern=new RegExp(pas_pattern);
    var email_pattern=new RegExp(mailformat);

	if(name_pattern.test(name))
	{
            if(email_pattern.test(email))
            {
		if(mobile.match(mobile_pattern))
		{
			if(password===cpassword)
			{
                            if(password_pattern.test(password))
                            {
				return true;	
                            }
                            else
                            {
                                window.alert("Minimum 8 letter password, with at least a symbol, upper and lower case letters and a number needed!");
                                return false;
                            }
			}
			else
			{
				window.alert("Password and confirm password doesn't match");
			    return false;
			}
		}
		else
		{
			window.alert("Mobile number must contain 10 Numbers only");
			return false;
		}
            }
            else
            {
                window.alert("Invalid Email");
			return false;
            }
	}
	else
	{
		window.alert("Name must contains alphabets only!");
		return false;
	}
}