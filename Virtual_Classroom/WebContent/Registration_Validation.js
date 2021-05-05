function Validate()
{
	var name=document.getElementById("name").value;
	var email=document.getElementById("email").value;
	var password=document.getElementById("pass").value;
	var cpassword=document.getElementById("cpass").value;
	var mobile=document.getElementById("mobile").value;
	
	var name_pattern=new RegExp("[a-zA-Z]+");
    var mobile_pattern=new RegExp("[0-9]+");

	if(name_pattern.test(name))
	{
		if(mobile_pattern.test(mobile))
		{
			if(password==cpassword)
			{
				return true;	
			}
			else
			{
				window.alert("Password and confirm password doesn't match");
			    return false;
			}
		}
		else
		{
			window.alert("Mobile number doesn't match the pattern");
			return false;
		}
	}
	else
	{
		window.alert("name doesn't match the pattern");
		return false;
	}
}