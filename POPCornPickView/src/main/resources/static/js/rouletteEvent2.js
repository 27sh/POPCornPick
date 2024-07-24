/**
 * 
 */

		
function roulette(){
		
		const $c = document.querySelector("canvas");
		const ctx = $c.getContext('2d');
		const product = ["1000원 할인쿠폰", "500포인트", "꽝", "10포인트", "5포인트"];
		const colors = ["#FFA500", "#F08080", "#ADD8E6", "#808080", "#9370DB"];
		
		const newMake = () => {
			const [cw, ch] = [$c.width / 2, $c.height / 2];
			const arc = Math.PI / (product.length / 2);
			
			for(let i = 0 ; i < product.length ; i++){
				ctx.beginPath();
				ctx.fillStyle = colors[i % colors.length];
				ctx.moveTo(cw, ch);
				ctx.arc(cw, ch, cw, arc * (i - 1), arc * i);
				ctx.fill();
				ctx.closePath();
			}
			
			ctx.fillStyle = "#fff"; //글자색
			ctx.font = "25px Pretendard";
			ctx.textAlign = "center";
			for(let i = 0 ; i < product.length ; i++){
				const angle = (arc * i) + (arc / 2);
				ctx.save();
				ctx.translate(
					cw + Math.cos(angle) * (cw - 50),
					ch + Math.sin(angle) * (ch - 50)
				);
				ctx.rotate(angle + Math.PI / 2);
				product[i].split(" ").forEach((text, j) => {
					ctx.fillText(text, 0, 30 * j);
				});
				ctx.restore();
			}
		}
		newMake();
	}
	
	function rotate(){
		roulette();
		console.log("rotate 함수 실행");
		const $c = document.querySelector("canvas");
		const product = ["1000원 할인쿠폰", "500포인트", "꽝", "10포인트", "5포인트"];
		
		$c.style.transform = 'initial';
		$c.style.transition = 'initial';
		const alpha = Math.floor(Math.random() * 100);
		
		setTimeout(() => {
			const ran = Math.floor(Math.random() * product.length);
			const arc = 360 / product.length;
			const rotate = (ran * arc) + 3600 + (arc / 2) - (alpha % arc);
			
			
			$c.style.transform = 'rotate('+rotate + 'deg)';
			$c.style.transition = '2s';
			
			setTimeout(() => {
				const finalRotate = rotate % 360;
				console.log("finalRotate: ", finalRotate);
				const correctedAngle = 360 - finalRotate + arc / 2;
				const selectedIdx = Math.floor((360 - finalRotate + arc / 2) / arc) % product.length;
				console.log("selectedIdx: ", selectedIdx);
				const selectedItem = product[selectedIdx];
				console.log(selectedItem);
				alert("선택된 항목: "+selectedItem);
				
				$c.style.transition = 'initial'; // 즉각적으로 초기화하기 위해 transition을 초기화
	            $c.style.transform = 'rotate(0deg)';
			}, 2000);
		}, 1);
		
		
	}
	