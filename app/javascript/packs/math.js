
//マスの複製
let cloneCounter = 0;
while(cloneCounter < 9){
    let clone = document.getElementsByClassName('hyakumasu_copy');
    let cloneElement = clone[cloneCounter].cloneNode(true);
    clone[cloneCounter].after(cloneElement);

    clone = document.getElementsByClassName('hyakuwari_copy');
    cloneElement = clone[cloneCounter].cloneNode(true);
    clone[cloneCounter].after(cloneElement);

    cloneCounter++;
}

//ボタンの設定
const makeAddButton = document.getElementById("makeAddButton");
makeAddButton.addEventListener("click", () => { changeToPlus() });

const makeSubButton = document.getElementById("makeSubButton");
makeSubButton.addEventListener("click", () => { changeToMinus() });

const makeMultiButton = document.getElementById("makeMultiButton");
makeMultiButton.addEventListener("click", () => { changeToMultiple() });

const hyakumasuAnswerButton = document.getElementById("hyakumasuAnswerButton");
hyakumasuAnswerButton.addEventListener("click", () => { judge() });

const resetButton = document.getElementById("resetButton");
resetButton.addEventListener("click", () => { resetAnswers() });

const hyakuwariRandomButton = document.getElementById("hyakuwariRandomButton");
hyakuwariRandomButton.addEventListener("click", () => { hyakuwariSetNumbers() });

const hyakuwariAnswerButton = document.getElementById("hyakuwariAnswerButton");
hyakuwariAnswerButton.addEventListener("click", () => { hyakuwariCheckAnswers() });

const hyakuwariResetButton = document.getElementById("hyakuwariResetButton");
hyakuwariResetButton.addEventListener("click", () => { hyakuwariResetAnswers() });

//算術記号変更
function changeToPlus(){
	var $symbol = document.getElementById("column-base");
	$symbol.textContent = '＋';
	setNumbers();
}

function changeToMinus(){
	var $symbol = document.getElementById("column-base");
	$symbol.textContent = 'ー';
	setNumbers(columnNumberList = ['10','11','12','13','14','15','16','17','18','19']);
}

function changeToMultiple(){
	var $symbol = document.getElementById("column-base");
	$symbol.textContent = '×';
	setNumbers();
}

//列の数字ランダム設定
function setNumbers(columnNumberList = ['0','1','2','3','4','5','6','7','8','9']){
	var rowNumberList = ['0','1','2','3','4','5','6','7','8','9'];


	var columnNumberShuffleList = [];
	var rowNumberShuffleList = [];
	//配列の中身をシャッフル
	for (var i = 0; i <= 9; i++){
		var shuffledNumber = columnNumberList[Math.floor(Math.random() * columnNumberList.length)];
		columnNumberShuffleList.push(shuffledNumber);
		columnNumberList = columnNumberList.filter(n => n !== shuffledNumber);

		var shuffledNumber = rowNumberList[Math.floor(Math.random() * rowNumberList.length)];
		rowNumberShuffleList.push(shuffledNumber);
		rowNumberList = rowNumberList.filter(n => n !== shuffledNumber);
	}

	for (var i = 0; i <= 9; i++){
		var columnIdName = "column" + String(i);
		var $columnNumber = document.getElementById(columnIdName);
		$columnNumber.textContent = columnNumberShuffleList[i];
		
		var rowIdName = i;
		var $rowNumber = document.getElementsByClassName('rows')[rowIdName];
		$rowNumber.textContent = rowNumberShuffleList[i];
	}
	resetAnswers();
}


//答え合わせ分岐
function judge(){
	var $symbol = document.getElementById("column-base");
	if ($symbol.textContent == '＋'){
		checkAnswers('＋');
	} else if($symbol.textContent == 'ー') {
		checkAnswers('ー');
	} else if($symbol.textContent == '×') {
		checkAnswers('×');
	}
}

//答え合わせ
function checkAnswers(judgeObject){
	var columnNumberAnswerList = [];
	var rowNumberAnswerList = [];

	for (var i = 0; i <= 9; i++){
		var columnIdName = "column" + String(i);
		var $columnNumber = document.getElementById(columnIdName).textContent;
		$columnNumber = Number($columnNumber);
		columnNumberAnswerList.push($columnNumber);

		var rowIdName = i;
		var $rowNumber = document.getElementsByClassName('rows')[rowIdName].textContent;
		$rowNumber = Number($rowNumber);
		rowNumberAnswerList.push($rowNumber);
	}

	
	var correct = 0;
	var answersCounter = 0;
	var $answers = document.getElementsByTagName('input');
	for (var i = 0; i < 10; i++){
		for (var j = 0; j < 10; j++){
			var answerOfPlus = columnNumberAnswerList[j] + rowNumberAnswerList[i];
			var answerOfMinus = columnNumberAnswerList[j] - rowNumberAnswerList[i];
			var answerOfMultiple = columnNumberAnswerList[j] * rowNumberAnswerList[i];

			var answerNumber = toHalfNumber($answers[answersCounter].value);
			if (answerNumber === '' || null) {
				answersCounter++;
				continue;
			}
			if (judgeObject == '＋'){
				if (answerOfPlus == answerNumber){
					correct++;
				} else {
					document.getElementsByClassName('texts')[answersCounter].style.backgroundColor = 'mediumpurple';
				}
			} else if (judgeObject == 'ー'){
				if (answerOfMinus == answerNumber){
					correct++;
				} else {
					document.getElementsByClassName('texts')[answersCounter].style.backgroundColor = 'mediumpurple';
				}
			} else if (judgeObject == '×'){
				if (answerOfMultiple == answerNumber){
					correct++;
				} else {
					document.getElementsByClassName('texts')[answersCounter].style.backgroundColor = 'mediumpurple';
				}
			}
		answersCounter++;
		}	
	}
	if (correct === 100){
		window.alert('結果は100点満点です！すごいですね！！');
	} else {
		window.alert('結果は' + correct + '点です！（100点中）');
	}
}

// 全角数字⇒半角数字
function toHalfNumber(str) {
    return str.replace(/[０-９]/g, function(s) {
        return String.fromCharCode(s.charCodeAt(0) - 0xFEE0);
    });
}


//回答のリセット
function resetAnswers() {
	var $resetTargets = document.getElementsByClassName('texts');
    for (var i = 0; i < 100; i++){
		$resetTargets[i].value = '';
		$resetTargets[i].style.backgroundColor = 'lightgray';
	}
}





//百わり


const $numberToSet = document.getElementsByClassName('hyakuwari_column');
const $rowNumberToSet = document.getElementsByClassName('hyakuwari_row');

function shuffle(numberList, columnNumberShuffleList){
	for (var i = 0; i <= 9; i++){
		var shuffledNumber = numberList[Math.floor(Math.random() * numberList.length)];
		columnNumberShuffleList.push(shuffledNumber);
		numberList = numberList.filter(n => n !== shuffledNumber);
	}
	hyakuwariResetAnswers();
}

function hyakuwariSetNumbers(){
	var numberList = ['0','1','2','3','4','5','6','7','8','9'];
	var columnNumberShuffleList = [];
	shuffle(numberList, columnNumberShuffleList);

	for (var i = 0; i < 10; i++){
        $rowNumberToSet[i].textContent = i+1;

		shuffle(numberList, columnNumberShuffleList = []);
		for (var j = 0; j < 10; j++){
			$numberToSet[i*10 + j].textContent = columnNumberShuffleList[j] * (1 + i);
		}
	}
}
hyakuwariSetNumbers();



function hyakuwariCheckAnswers(){
	var $answerNumbers = document.getElementsByClassName('hyakuwari_texts')
	var answerList = [];
	
	for (var i = 0; i < 100; i++){
		answerList.push($answerNumbers[i].value);
	}

	var correct = 0;
	var answersCounter = 0;
	$columnNumber = document.getElementsByClassName('hyakuwari_column');
	$rowNumber = document.getElementsByClassName('hyakuwari_row');

	for (var i = 0; i < 10; i++){
		for (var j = 0; j < 10; j++){
			var division1 = $columnNumber[i*10+j].textContent;
			var division2 = $rowNumber[i].textContent;
			var answerOfDivision = Number(division1) / Number(division2);
			var answerNumber = toHalfNumber(answerList[answersCounter]);

			if (answerNumber === '' || null) {
				answersCounter++;
				continue;
			} else if (answerOfDivision == answerNumber){
				correct++;
			} else {
				document.getElementsByClassName('hyakuwari_texts')[answersCounter].style.backgroundColor = 'mediumpurple';
			}	
		answersCounter++;
		}	
	}
	if (correct === 100){
		window.alert('結果は全問正解です！すごいですね！！');
	} else {
		window.alert('結果は' + correct + '点です！（100点中）');
	}
}


function hyakuwariResetAnswers() {
	var $resetTargets = document.getElementsByClassName('hyakuwari_texts');
    for (var i = 0; i < 100; i++){
		$resetTargets[i].value = '';
		$resetTargets[i].style.backgroundColor = 'lightgray';
	}
}



//ボタンの設定

const setAddButton = document.getElementById("setAddButton");
setAddButton.addEventListener("click", () => { setPlus() });

const setSubButton = document.getElementById("setSubButton");
setSubButton.addEventListener("click", () => { setMinus() });

const setMultiButton = document.getElementById("setMultiButton");
setMultiButton.addEventListener("click", () => { setMultiple() });

const setDivideButton = document.getElementById("setDivideButton");
setDivideButton.addEventListener("click", () => { setDivide() });

const answerCalcButton = document.getElementById("answerCalcButton");
answerCalcButton.addEventListener("click", () => { calcJudge() });

const resetCalcButton = document.getElementById("resetCalcButton");
resetCalcButton.addEventListener("click", () => { resetCalcAnswers() });

const clearCanvasButton = document.getElementById("clearCanvas");
clearCanvasButton.addEventListener("click", () => { clearCanvas() });

const prevCanvasButton = document.getElementById("prevCanvas");
prevCanvasButton.addEventListener("click", () => { prevCanvas() });

const nextCanvasButton = document.getElementById("nextCanvas");
nextCanvasButton.addEventListener("click", () => { nextCanvas() });

const graphButton = document.getElementById("graphButton");
graphButton.addEventListener("click", () => { graph() });

const proportionalButton = document.getElementById("proportionalButton");
proportionalButton.addEventListener("click", () => { proportional() });

const shapeButton = document.getElementById("shapeButton");
shapeButton.addEventListener("click", () => { shape() });

const triShapeButton = document.getElementById("triShapeButton");
triShapeButton.addEventListener("click", () => { triShape() });

const fractionButton = document.getElementById("fractionButton");
fractionButton.addEventListener("click", () => { fraction() });

//計算練習
const NumList = [
	[],
	[],
	[],
	[],
	[]
];

for(let i = 0; i < NumList.length; i++){
	for(let j = 0; j < 10; j++){
		NumList[i].push(Math.floor(Math.random() * 100));
	}
}


//算術記号変更
function setPlus(){
	resetCalcAnswers();
	let $symbol = document.getElementById("symbol");
	$symbol.textContent = '＋';
	setCalcNumbers();
}

function setMinus(){
	resetCalcAnswers();
	let $symbol = document.getElementById("symbol");
	$symbol.textContent = 'ー';
	setCalcNumbers(NumberList1 = ['10','11','12','13','14','15','16','17','18','19']);
}

function setMultiple(){
	resetCalcAnswers();
	let $symbol = document.getElementById("symbol");
	$symbol.textContent = '×';
	setCalcNumbers();
}

function setDivide(){
	resetCalcAnswers();
	let $symbol = document.getElementById("symbol");
	$symbol.textContent = '÷';
	setCalcNumbers(NumberList1 = ['10','11','12','13','14','15','16','17','18','19'],NumberList2 = ['1','2','3','4','5','6','7','8','9']);
}

//列の数字ランダム設定
function setCalcNumbers(NumberList1 = ['0','1','2','3','4','5','6','7','8','9'],NumberList2 = ['0','1','2','3','4','5','6','7','8','9']){
	document.getElementById('amari_container').style.position = 'none';
	document.getElementById('amari').style.display = 'none';
	document.getElementById('left').style.display = 'none';
	

	//配列の中身をシャッフル
	let shuffledNumber1 = NumberList1[Math.floor(Math.random() * NumberList1.length)];
	
	let $Number1 = document.getElementById("calc_column0");
	$Number1.textContent = shuffledNumber1;

	let shuffledNumber2 = NumberList2[Math.floor(Math.random() * NumberList2.length)];
	
	let $Number2 = document.getElementById("calc_row0");
	$Number2.textContent = shuffledNumber2;

	if(document.getElementById("symbol").textContent == '÷' && shuffledNumber1 % shuffledNumber2 != 0){
		document.getElementById('amari_container').style.display = 'inline';
		document.getElementById('amari').style.display = 'inline';
		document.getElementById('left').style.display = 'inline';
	}
}



//答え合わせ分岐
function calcJudge(){
	let $symbol = document.getElementById("symbol");
	if ($symbol.textContent == '＋'){
		checkCalcAnswers('＋');
	} else if($symbol.textContent == 'ー') {
		checkCalcAnswers('ー');
	} else if($symbol.textContent == '×') {
		checkCalcAnswers('×');
	} else if($symbol.textContent == '÷') {
		checkCalcAnswers('÷');
	}
}

//答え合わせ
function checkCalcAnswers(symbolToJudge){

	let $Number1 = Number(document.getElementById('calc_column0').textContent);
	let $Number2 = Number(document.getElementById('calc_row0').textContent);

	let $answer = document.getElementById('answer').value;
	let $answerLeft = document.getElementById('left').value;
	let answerOfPlus = $Number1 + $Number2;
	let answerOfMinus = $Number1 - $Number2;
	let answerOfMultiple = $Number1 * $Number2;
	let answerOfDivide = Math.floor($Number1 / $Number2);
	let answerOfLeft = $Number1 % $Number2;

	let answerNumber = toHalfNumber($answer);
	let answerLeftNumber = toHalfNumber($answerLeft);
	if (answerNumber === '' || null) {
		window.alert('入力してください');
	} else {
		if (symbolToJudge == '＋'){
			if (answerOfPlus == answerNumber){
				document.getElementById('correct_message').textContent = '正解です！！';
			} else {
				document.getElementById('correct_message').textContent = 'ちがうよ！！';
			}
		} else if (symbolToJudge == 'ー'){
			if (answerOfMinus == answerNumber){
				document.getElementById('correct_message').textContent = '正解です！！';
			} else {
				document.getElementById('correct_message').textContent = 'ちがうよ！！';
			}
		} else if (symbolToJudge == '×'){
			if (answerOfMultiple == answerNumber){
				document.getElementById('correct_message').textContent = '正解です！！';
			} else {
				document.getElementById('correct_message').textContent = 'ちがうよ！！';
			}
		} else if (symbolToJudge == '÷'){
			if (answerOfDivide == answerNumber && answerOfLeft == answerLeftNumber){
				document.getElementById('correct_message').textContent = '正解です！！';
			} else {
				document.getElementById('correct_message').textContent = 'ちがうよ！！';
			}
		}
	}
}



//回答のリセット
function resetCalcAnswers() {
	document.getElementById('correct_message').textContent = '';
	let $resetTargets = document.getElementsByTagName('input');
    for (let i = 0; i < $resetTargets.length; i++){
		$resetTargets[i].value = '';
	}
}





//筆算メモ
let canvas = document.getElementById('canvassample'),
ctx = canvas.getContext('2d'),
moveflg = 0,
Xpoint,
Ypoint,
temp = [];

//初期値（サイズ、色、アルファ値）の決定
let defSize = 1,
defColor = "black";

// キャンバスを白色に塗る
ctx.fillStyle = 'rgb(255,255,255)';

// ストレージの初期化
let myStorage = localStorage;
window.onload = initLocalStorage();

// PC対応
canvas.addEventListener('mousedown', startPoint, false);
canvas.addEventListener('mousemove', movePoint, false);
canvas.addEventListener('mouseup', endPoint, false);
// スマホ対応
canvas.addEventListener('touchstart', startPoint, false);
canvas.addEventListener('touchmove', movePoint, false);
canvas.addEventListener('touchend', endPoint, false);

canvas.width = 500;
canvas.height = 500;
let windowSize = window.innerWidth;
if (windowSize < 500) {
	canvas.width = 300;
	canvas.height = 300;
}

function startPoint(e){
	e.preventDefault();
	ctx.beginPath();
  
	// 矢印の先っぽから始まるように調整
	Xpoint = e.layerX;
	Ypoint = e.layerY;
	
	ctx.moveTo(Xpoint, Ypoint);
}

function movePoint(e){
	if(e.buttons === 1 || e.witch === 1 || e.type == 'touchmove')
	{
		Xpoint = e.layerX;
		Ypoint = e.layerY;
		moveflg = 1;
		
		ctx.lineTo(Xpoint, Ypoint);
		ctx.lineCap = "round";
		ctx.lineWidth = defSize * 2;
		ctx.strokeStyle = defColor;
		ctx.stroke();
		
	}
}

function endPoint(e)
{
    if(moveflg === 0)
    {
		ctx.lineTo(Xpoint-1, Ypoint-1);
		ctx.lineCap = "round";
		ctx.lineWidth = defSize * 2;
		ctx.strokeStyle = defColor;
		ctx.stroke();
       
    }
    moveflg = 0;
    setLocalStoreage();
}

function clearCanvas(){
    if(confirm('メモを消してもいいですか？'))
    {
        initLocalStorage();
        temp = [];
        resetCanvas();
    }
}

function resetCanvas() {
    ctx.clearRect(0, 0, ctx.canvas.clientWidth, ctx.canvas.clientHeight);
    ctx.fillStyle = 'rgb(255,255,255)';
}

function chgImg()
{
  let png = canvas.toDataURL();

  document.getElementById("newImg").src = png;
}

function initLocalStorage(){
    myStorage.setItem("__log", JSON.stringify([]));
}
function setLocalStoreage(){
    let png = canvas.toDataURL();
    let logs = JSON.parse(myStorage.getItem("__log"));

    setTimeout(function(){
        logs.unshift({png:png});

        myStorage.setItem("__log", JSON.stringify(logs));

        temp = [];
    }, 0);
}

function prevCanvas(){
    let logs = JSON.parse(myStorage.getItem("__log"));

    if(logs.length > 0)
    {
        temp.unshift(logs.shift());

        setTimeout(function(){
            myStorage.setItem("__log", JSON.stringify(logs));
            resetCanvas();

            draw(logs[0]['png']);

        }, 0);
    }
}

function nextCanvas(){
    let logs = JSON.parse(myStorage.getItem("__log"));

    if(temp.length > 0)
    {
        logs.unshift(temp.shift());

        setTimeout(function(){
            myStorage.setItem("__log", JSON.stringify(logs));
            resetCanvas();

            draw(logs[0]['png']);

        }, 0);
    }
}

function draw(src) {
    let img = new Image();
    img.src = src;

    img.onload = function() {
        ctx.drawImage(img, 0, 0);
    }
}



function graph(){
	let labels = [];
	let scores = [];
	let $label = document.getElementsByClassName('label');
	let $score = document.getElementsByClassName('numbers');

	for(let i = 0; i < $label.length; i++){
		labels.push($label[i].textContent);
		scores.push(Number(toHalfNumber($score[i].value)));
	}
	
	let data = [
		{ label: labels[0], y: scores[0] },
		{ label: labels[1], y: scores[1] },
		{ label: labels[2], y: scores[2] },
		{ label: labels[3], y: scores[3] },
		{ label: labels[4], y: scores[4] }
	];
	let avg = 0;
	for(let i = 0; i < scores.length; i++){
		avg += scores[i];
	}
	avg = avg/5;
	
	let stage = document.getElementById('stage');
	let chart = new CanvasJS.Chart(stage, {
		title: {
			text: "テストの点数 平均点は" + avg + "点"  //グラフタイトル
		},
		theme: "theme4",  //テーマ設定
		data: [{
			type: 'column',  //グラフの種類
			dataPoints: data  //表示するデータ
		}]
	});
	chart.render();
}




function proportional(){
	let ctx = document.getElementById("chart1");
	let propNum = document.getElementById("prop_num").value;
	propNum = toHalfNumber(propNum);
	
	let x_points = document.getElementsByClassName('x_points');
	let y_points = document.getElementsByClassName('y_points');
	let x_list = [];
	let y_list = [];

	for(let i = 0; i < x_points.length; i++){
		x_points[i].textContent = i;
		x_list.push(i);
		y_points[i].textContent = i * propNum;
		y_list.push(i * propNum);
	}

	for(let i = 0; i < (y_list[y_list.length-1]) - (y_list.length-1); i++){
		x_list.push(String(i + y_list.length));
	}

	let myLineChart = new Chart(ctx, {
		// グラフの種類：折れ線グラフを指定
		type: 'line',
		data: {
		// x軸の各メモリ
			labels: x_list,
			datasets: [
				{
					label: '比例グラフ',
					data: y_list,
					borderColor: "teal",
					backgroundColor: "#00000000",
					lineTension:0
				},
			],
		},
		options: {
			responsive: true,
			maintainAspectRatio: false,
			scales: {
				yAxes: [
					{
						ticks: {
							stepSize: 1,
						}
					}
				]
			}
		},
	});
	myLineChart.canvas.parentNode.style.height = '400px';
	myLineChart.canvas.parentNode.style.width = '400px';

	let windowSize = window.innerWidth;
	if (windowSize < 500) {
		myLineChart.canvas.parentNode.style.height = '300px';
		myLineChart.canvas.parentNode.style.width = '300px';
	}
}




function shape(){
	const shape_canvas = document.getElementById('chart2');
	const shape_ctx = shape_canvas.getContext('2d');
	shape_ctx.clearRect(0, 0, shape_canvas.width, shape_canvas.height);
	shape_ctx.strokeStyle = 'gray';
	for(let i = 0; i < 20; i++){
		shape_ctx.strokeRect(0, 0, (i+1) * 20, 400);
		shape_ctx.strokeRect(0, 0, 400, (i+1) * 20);
	}
	let shape_num1 = document.getElementById('shape_num1').value;
	let shape_num2 = document.getElementById('shape_num2').value;
	shape_num1 = toHalfNumber(shape_num1);
	shape_num2 = toHalfNumber(shape_num2);
	document.getElementById('area').textContent = shape_num1 * shape_num2;

	shape_ctx.fillStyle = "rgba(" + [0, 0, 255, 0.8] + ")";
	shape_ctx.fillRect(20, 20, shape_num2*20, shape_num1*20);	
}

shape();
document.getElementById('area').textContent = '';




function triShape(){
	const shape_canvas = document.getElementById('chart2');
	const shape_ctx = shape_canvas.getContext('2d');
	shape_ctx.clearRect(0, 0, shape_canvas.width, shape_canvas.height);
	shape_ctx.strokeStyle = 'gray';
	for(let i = 0; i < 20; i++){
		shape_ctx.strokeRect(0, 0, (i+1) * 20, 400);
		shape_ctx.strokeRect(0, 0, 400, (i+1) * 20);
	}
	let shape_num1 = document.getElementById('shape_num1').value;
	let shape_num2 = document.getElementById('shape_num2').value;
	document.getElementById('takasa').textContent = shape_num1;
	document.getElementById('teihen').textContent = shape_num2;
	shape_num1 = toHalfNumber(shape_num1);
	shape_num2 = toHalfNumber(shape_num2);
	document.getElementById('area2').textContent = shape_num1 * shape_num2 / 2;

	shape_ctx.beginPath();
	shape_ctx.moveTo(20,20); //最初の点の場所
	shape_ctx.lineTo(20, shape_num1 * 20 + 20); //2番目の点の場所
	shape_ctx.lineTo(shape_num2 * 20 + 20, shape_num1 * 20 + 20);
	shape_ctx.lineTo(20,20);
	shape_ctx.closePath();
	shape_ctx.fillStyle = "rgba(" + [0, 0, 255, 0.8] + ")";//塗りつぶしの色
	shape_ctx.fill();
	
}





function fraction(){
	let canvas = document.getElementById('chart3');
	let fraction_num = document.getElementById('fraction_num').value;
	fraction_num = toHalfNumber(fraction_num);
	
	//Object.values(dummy)[i][j].answer
	let data = [];
	for(let i = 0; i < fraction_num; i++){
		data.push({label: '', y: 0});
		data[i].label = String(fraction_num) + '分の１';
		data[i].y = 1/fraction_num;
	}
	if(fraction_num > 30){
		for(let i = 0; i < fraction_num; i++){
			data[i].label = '';
		}
	}

	let decimal = document.getElementById('decimal');
	let percent = document.getElementById('percent');
	
	if(String(1/fraction_num).length > 17){
		newFrac = Math.round(1/fraction_num * 100) / 100;
		console.log(Number(newFrac) * 100);
		decimal.textContent = '約' + newFrac;
		percent.textContent = '約' + Math.floor(newFrac * 100) + '％';
	} else {
		decimal.textContent = 1/fraction_num;
		percent.textContent = 1/fraction_num * 100 + '％';
	}

	if(fraction_num == 0){
		alert('0分の1はありません。1から99までで入力してください。');
		decimal.textContent = '';
		percent.textContent = '';
	}
	
	let chart = new CanvasJS.Chart(canvas, {
		title: {
			text: "分数"  //グラフタイトル
		},
		theme: "theme4",  //テーマ設定
		data: [{
			type: 'pie',  //グラフの種類
			startAngle:  -90,
			dataPoints: data  //表示するデータ
		}]
	});
	chart.render();
}