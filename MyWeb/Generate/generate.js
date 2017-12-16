function generate(){
	var Location=$("Location");
	var CompanyType=$("CompanyType");
	var CompanyName=$("CompanyName");
	var Boss=$("Boss");
	var Money=$("Money");
	var Product=$("Product");
	var Price=$("Price");

	var result=Location+"最大"+CompanyType+CompanyName+"倒闭了，王八蛋老板"+Boss+"吃喝嫖赌，欠下了"
	+Money+"个亿，带着他的小姨子跑了!我们没有办法，拿着"+Product+"抵工资!原价都是一"+Price+"多、两"+Price+"多、三"+Price+"多的"
	+Product+"，现在全部只卖二十块，统统只要二十块!"+Boss+"王八蛋，"
	+"你不是人!我们辛辛苦苦给你干了大半年，你不发工资，你还我血汗钱，还我血汗钱!"

	document.getElementById("result").value=result;
}

function $(id){
	var value=document.getElementById(id).value;
	return value;
}