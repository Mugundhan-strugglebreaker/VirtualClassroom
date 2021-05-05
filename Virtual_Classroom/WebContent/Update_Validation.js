function Validate()
{
	var name=document.getElementById("name").value;
	var mobile=document.getElementById("mobile").value;
	
	var name_pattern=new RegExp("[a-zA-Z]+");
    var mobile_pattern=new RegExp("[0-9]+");

	if(name_pattern.test(name))
	{
		if(mobile_pattern.test(mobile))
		{
			return true;
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
}/**
 * 
 */