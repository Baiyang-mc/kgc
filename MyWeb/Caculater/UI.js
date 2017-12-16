	

	function add()
	{

		var num1= document.getElementById("num1").value;
		var num2= document.getElementById("num2").value;
		num1 = parseFloat(num1);
		num2 = parseFloat(num2);
		var result = num1+num2;
		document.getElementById("result").value=result;

	}

