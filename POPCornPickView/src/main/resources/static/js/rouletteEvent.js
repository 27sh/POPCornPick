/**
 * 
 */
const spinButton = document.getElementById("spinButton");
		
function roulette(){
	const $c = document.querySelector("canvas");
	const ctx = $c.getContext('2d');
	const product = ["1000원 할인쿠폰", "500포인트", "꽝", "10포인트", "5포인트"];
	const colors = ["#FFA500", "#F08080", "#ADD8E6", "#808080", "#9370DB"];
	const arc = 2 * Math.PI / product.length;
	let startAngle = 0;
		
	for(let i = 0 ; i < product.length ; i++){
		const angle = startAngle + i * arc;
		ctx.beginPath();
		ctx.arc(250, 250, 250, angle, angle + arc, false);
		ctx.lineTo(250, 250);
		ctx.fillStyle = colors[i % colors.length];
		ctx.fill();
		ctx.stroke();
		
		ctx.save();
		ctx.translate(250 + Math.cos(angle + arc / 2) * 200, 250 + Math.sin(angle + arc / 2) * 200);
		ctx.rotate(angle + arc / 2 + Math.PI / 2);
		ctx.fillStyle = "#000"; //글자색
		ctx.font = "bold 16px Arial";
		ctx.fillText(product[i], -ctx.measureText(product[i]).width / 2, 0);			
		ctx.restore();
	}
}
			
			
function rotate(){
	const spinAngle = Math.random() * 360 + 3600;
	const finalAngle = spinAngle % 360;
	const seletedIndex = Math.floor((360 - finalAngle) / (360 / product.length)) % product.length;
	
	const $c = document.querySelector("canvas");
	const product = ["1000원 할인쿠폰", "500포인트", "꽝", "10포인트", "5포인트"];
	
	$c.style.transform = "transform 3s ease-out";
	$c.style.transition = 'rotate(' + spinAngle + 'deg)';
	
	setTimeout(() => {
		alert("당첨된 항목: ", product[seletedIndex]);
		$c.style.transition = "none";
		$c.style.transform = 'rotate(' + finalAngle + 'deg)';
	}, 3000);
}
spinButton.addEventListener("click", rotate());
roulette();
	