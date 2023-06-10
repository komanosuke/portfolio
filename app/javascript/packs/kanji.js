// JSONデータを格納する変数
let quiz;
let kanji_json;
let which_grade = Number(document.getElementById('which_grade').textContent);
let grade_text = document.getElementById('grade');
let card_image = document.getElementById('card_image1');

function readJson(kanji_json){
	kanji_json = "/json/kanji" + String(which_grade) + ".json"
	grade_text.textContent = "小学校" + String(which_grade) + "年生の漢字";
	card_image.src = "/image/card" + String(which_grade) + ".jpg";
			
	// JSONファイルの読み込み
	fetch(kanji_json)
	.then(response => response.json())
	.then(jsonData => {
	// 読み込んだJSONデータを変数に格納
		quiz = jsonData;
		console.log(quiz);
		setUpQuiz(kanjiNumber, quiz);
		document.getElementById('kanji').textContent = kanjiList[kanjiGrade][0];
		document.getElementById('on_yomi').textContent = '音読み： ' + quiz[kanjiNumber].pronunciation[0];
		document.getElementById('kun_yomi').textContent = '訓読み： ' + quiz[kanjiNumber].pronunciation[1];
	})
	.catch(error => console.log(error));
}
readJson();


const kanjiList = [
    ['一','右','雨','円','王','音','下','火','花','貝','学','気','九','休','玉','金','空','月','犬','見','五','口','校','左','三','山','子','四','糸','字','耳','七','車','手','十','出','女','小','上','森','人','水','正','生','青','夕','石','赤','千','川','先','早','草','足','村','大','男','竹','中','虫','町','天','田','土','二','日','入','年','白','八','百','文','木','本','名','目','立','力','林','六'],
    ['引','羽','雲','園','遠','何','科','夏','家','歌','画','回','会','海','絵','外','角','楽','活','間','丸','岩','顔','汽','記','帰','弓','牛','魚','京','強','教','近','兄','形','計','元','言','原','戸','古','午','後','語','工','公','広','交','光','考','行','高','黄','合','谷','国','黒','今','才','細','作','算','止','市','矢','姉','思','紙','寺','自','時','室','社','弱','首','秋','週','春','書','少','場','色','食','心','新','親','図','数','西','声','星','晴','切','雪','船','線','前','組','走','多','太','体','台','地','池','知','茶','昼','長','鳥','朝','直','通','弟','店','点','電','刀','冬','当','東','答','頭','同','道','読','内','南','肉','馬','売','買','麦','半','番','父','風','分','聞','米','歩','母','方','北','毎','妹','万','明','鳴','毛','門','夜','野','友','用','曜','来','里','理','話'],
    ['悪','安','暗','医','委','意','育','員','院','飲','運','泳','駅','央','横','屋','温','化','荷','界','開','階','寒','感','漢','館','岸','起','期','客','究','急','級','宮','球','去','橋','業','曲','局','銀','区','苦','具','君','係','軽','血','決','研','県','庫','湖','向','幸','港','号','根','祭','皿','仕','死','使','始','指','歯','詩','次','事','持','式','実','写','者','主','守','取','酒','受','州','拾','終','習','集','住','重','宿','所','暑','助','昭','消','商','章','勝','乗','植','申','身','神','真','深','進','世','整','昔','全','相','送','想','息','速','族','他','打','対','待','代','第','題','炭','短','談','着','注','柱','丁','帳','調','追','定','庭','笛','鉄','転','都','度','投','豆','島','湯','登','等','動','童','農','波','配','倍','箱','畑','発','反','坂','板','皮','悲','美','鼻','筆','氷','表','秒','病','品','負','部','服','福','物','平','返','勉','放','味','命','面','問','役','薬','由','油','有','遊','予','羊','洋','葉','陽','様','落','流','旅','両','緑','礼','列','練','路','和'],
    ['愛','案','以','衣','位','茨','印','英','栄','媛','塩','岡','億','加','果','貨','課','芽','賀','改','械','害','街','各','覚','潟','完','官','管','関','観','願','岐','希','季','旗','器','機','議','求','泣','給','挙','漁','共','協','鏡','競','極','熊','訓','軍','郡','群','径','景','芸','欠','結','建','健','験','固','功','好','香','候','康','佐','差','菜','最','埼','材','崎','昨','札','刷','察','参','産','散','残','氏','司','試','児','治','滋','辞','鹿','失','借','種','周','祝','順','初','松','笑','唱','焼','照','城','縄','臣','信','井','成','省','清','静','席','積','折','節','説','浅','戦','選','然','争','倉','巣','束','側','続','卒','孫','帯','隊','達','単','置','仲','沖','兆','低','底','的','典','伝','徒','努','灯','働','特','徳','栃','奈','梨','熱','念','敗','梅','博','阪','飯','飛','必','票','標','不','夫','付','府','阜','富','副','兵','別','辺','変','便','包','法','望','牧','末','満','未','民','無','約','勇','要','養','浴','利','陸','良','料','量','輪','類','令','冷','例','連','老','労','録'],
    ['圧','囲','移','因','永','営','衛','易','益','液','演','応','往','桜','可','仮','価','河','過','快','解','格','確','額','刊','幹','慣','眼','紀','基','寄','規','喜','技','義','逆','久','旧','救','居','許','境','均','禁','句','型','経','潔','件','険','検','限','現','減','故','個','護','効','厚','耕','航','鉱','構','興','講','告','混','査','再','災','妻','採','際','在','財','罪','殺','雑','酸','賛','士','支','史','志','枝','師','資','飼','示','似','識','質','舎','謝','授','修','述','術','準','序','招','証','象','賞','条','状','常','情','織','職','制','性','政','勢','精','製','税','責','績','接','設','絶','祖','素','総','造','像','増','則','測','属','率','損','貸','態','団','断','築','貯','張','停','提','程','適','統','堂','銅','導','得','毒','独','任','燃','能','破','犯','判','版','比','肥','非','費','備','評','貧','布','婦','武','復','複','仏','粉','編','弁','保','墓','報','豊','防','貿','暴','脈','務','夢','迷','綿','輸','余','容','略','留','領','歴'],
    ['胃','異','遺','域','宇','映','延','沿','恩','我','灰','拡','革','閣','割','株','干','巻','看','簡','危','机','揮','貴','疑','吸','供','胸','郷','勤','筋','系','敬','警','劇','激','穴','券','絹','権','憲','源','厳','己','呼','誤','后','孝','皇','紅','降','鋼','刻','穀','骨','困','砂','座','済','裁','策','冊','蚕','至','私','姿','視','詞','誌','磁','射','捨','尺','若','樹','収','宗','就','衆','従','縦','縮','熟','純','処','署','諸','除','承','将','傷','障','蒸','針','仁','垂','推','寸','盛','聖','誠','舌','宣','専','泉','洗','染','銭','善','奏','窓','創','装','層','操','蔵','臓','存','尊','退','宅','担','探','誕','段','暖','値','宙','忠','著','庁','頂','腸','潮','賃','痛','敵','展','討','党','糖','届','難','乳','認','納','脳','派','拝','背','肺','俳','班','晩','否','批','秘','俵','腹','奮','並','陛','閉','片','補','暮','宝','訪','亡','忘','棒','枚','幕','密','盟','模','訳','郵','優','預','幼','欲','翌','乱','卵','覧','裏','律','臨','朗','論']
];

window.onload = function () {

    if (window.name != "any") {
        location.reload();
        window.name = "any";
    } else {
        window.name = "";
    }

}

let kanjiGrade = which_grade-1;
let kanjiNumber = 0;
let passData = 0;


//漢字の読みクイズのセットアップ
const setUpQuiz = (kanjiNumber, quiz) => {
	
	//指定学年に合わせて漢字ボタンを作成
	let kanjiCloneCounter = 0;
	while(kanjiCloneCounter < kanjiList[kanjiGrade].length-1){
		let kanjiClone = document.getElementsByClassName('kanjis');
		let cloneElement = kanjiClone[kanjiCloneCounter].cloneNode(true);
		kanjiClone[kanjiCloneCounter].after(cloneElement);
		kanjiCloneCounter++;
	}
	setKanji(kanjiGrade);
	
	//漢字の読みクイズをあるだけ作成
	let cloneCounter = 0;
		while(cloneCounter < quiz[kanjiNumber].question.length-1){
		let quizClone = document.getElementsByClassName('quiz_clone');
		let cloneElement = quizClone[cloneCounter].cloneNode(true);
		quizClone[cloneCounter].after(cloneElement);
		cloneCounter++;
	}

	const $question = document.getElementsByClassName('kanji-question');
	const $how_to_read = document.getElementsByClassName('how_to_read');
	
	//クイズ作成
	let inputCounter = 0;
	while(inputCounter < quiz[kanjiNumber].question.length){
		let inputToSplit = quiz[kanjiNumber].question[inputCounter].split(quiz[kanjiNumber].kanji[inputCounter]);
		$question[inputCounter].textContent = String(inputCounter+1) + '、 ' + inputToSplit[0] + ' [ ' + quiz[kanjiNumber].kanji[inputCounter] + ' ] ' + inputToSplit[1];
		$how_to_read[inputCounter].value = '';
		inputCounter++;
	}
	document.getElementById('correct_message').textContent = '';
	goToQuestion(kanjiGrade);
	hiddenRegisterBtn();
	setKanjiColor(kanjiGrade);
	changePassKanjiColor();
}



//漢字の読みクイズの合否判定
function judge() {
	let score = 0;
	let quizLength = quiz[kanjiNumber].question.length;

	let answerToShow = document.getElementsByClassName('kanji-answer');

	for(let i = 0; i < quizLength; i++){
		let $answer = document.getElementsByClassName('how_to_read')[i].value;
		answerToShow[i].textContent = quiz[kanjiNumber].answer[i];
		if ($answer == quiz[kanjiNumber].answer[i]){
			score++;
		}
	}
	setTimeout(removeAnswer,3000);

	if (score == quizLength){
		document.getElementById('correct_message').textContent = '全問正解です！！（' + score + '点/' + quizLength + '点中）';
		$targetPassKanji = document.getElementById('kanji');
		passNumber = kanjiList[kanjiGrade].indexOf($targetPassKanji.textContent);
		passData = passNumber;

		$('#congratulations').css('visibility','visible');
		$('#registerButton').css('visibility','visible');
		openPopup(kanjiGrade, kanjiNumber);
	} else {
		document.getElementById('correct_message').textContent = '残念！もう一度やってみよう！！';
	}

}


//答えを消す
function removeAnswer(){
	let quizLength = quiz[kanjiNumber].question.length;
	let answerToShow = document.getElementsByClassName('kanji-answer');
	for(let i = 0; i < quizLength; i++){
		answerToShow[i].textContent = '';
	}
}


//各学年の漢字に色をつける
function setKanjiColor(kanjiGrade){
	let colorList = ['#ffdbdb','#ffdbed','#eddbff','#dbdbff','#dbedff','#ffeddb'];
	if(kanjiGrade == 0){
		changeColor(colorList[0]);
	}else if(kanjiGrade == 1){
		changeColor(colorList[1]);
	}else if(kanjiGrade == 2){
		changeColor(colorList[2]);
	}else if(kanjiGrade == 3){
		changeColor(colorList[3]);
	}else if(kanjiGrade == 4){
		changeColor(colorList[4]);
	}else if(kanjiGrade == 5){
		changeColor(colorList[5]);
	}
}

//色変え
function changeColor(color){
	const $kanjiList = document.getElementsByClassName('kanjis');
	for(let i = 0; i < $kanjiList.length; i++){
		$kanjiList[i].style.backgroundColor = color;
	}
	setHover(color);
}

function setHover(color){
	let $mouseover = document.getElementsByClassName('kanjis');
	for(let i = 0; i < $mouseover.length; i++){
		$mouseover[i].addEventListener('mouseover', function() {
			$mouseover[i].style.backgroundColor = 'white';
		});
		$mouseover[i].addEventListener('mouseleave', function() {
			$mouseover[i].style.backgroundColor = color;
		});
	}
}





//指定された学年の漢字をボタンに書き込む
function setKanji(kanjiGrade){
	const $kanjiList = document.getElementsByClassName('kanjis');
	for(let i = 0; i < $kanjiList.length; i++){
		$kanjiList[i].textContent = kanjiList[kanjiGrade][i];
	}
	//漢字ボタンのクリック機能(漢字大きく表示)をオンにする
	for(let i = 0; i < $kanjiList.length; i++){
		$kanjiList[i].addEventListener('click', showKanji, false);
	}

}





//前回のクイズ削除
function removeQuiz(){
	removeAnswer();
	let cloneRemoveCounter = quiz[kanjiNumber].question.length-1;
		while(cloneRemoveCounter > 0 ){
			let quizCloneToRemove = document.getElementsByClassName('quiz_clone');
			quizCloneToRemove[cloneRemoveCounter].remove();
			cloneRemoveCounter--;
		}
}





//前回の学年の漢字削除
function removeKanji(){
	let cloneRemoveCounter = kanjiList[kanjiGrade].length-1;
		while(cloneRemoveCounter > 0 ){
			let quizCloneToRemove = document.getElementsByClassName('kanjis');
			quizCloneToRemove[cloneRemoveCounter].remove();
			cloneRemoveCounter--;
		}
	document.getElementsByClassName('kanjis')[0].textContent = kanjiList[kanjiGrade][0];
}




//漢字ボタンを押すと、その漢字を大きく表示
function showKanji(e){
	removeQuiz();
	removeKanji();

	$targetKanji = document.getElementById('kanji');
	$targetKanji.textContent = e.target.textContent;
	kanjiNumber = kanjiList[kanjiGrade].indexOf($targetKanji.textContent);

	document.getElementById('on_yomi').textContent = '音読み： ' + quiz[kanjiNumber].pronunciation[0];
	document.getElementById('kun_yomi').textContent = '訓読み： ' + quiz[kanjiNumber].pronunciation[1];

	
	document.getElementsByClassName('how_to_read')[0].value = '';
	
	setUpQuiz(kanjiNumber, quiz);
}




function hiddenRegisterBtn() {
    $('#congratulations').css('visibility','hidden');
	$('#registerButton').css('visibility','hidden');
}


//答え合わせボタンでjudge()発動
const answerButton = document.getElementById("answerButton");
answerButton.addEventListener("click", () => { judge() });


//railsに正解した漢字のデータをpost
function postData(){

	$.ajax({
		url: '/kanji_quiz/update',
		type: 'GET',
		dataType: 'text',
		async: true,
		data: {
			grade: String(kanjiGrade),
			passData: String(passData),
		},
	});
}


//図鑑に登録ボタンでpostData()発動
let login_checker = document.getElementById('login_checker');
if(login_checker.textContent == 'true'){
	const registerButton = document.getElementById("registerButton");
	registerButton.addEventListener("click", () => { postData() });
}

//合格時のアニメーション
function openPopup(grade, num){
	let img = document.getElementById('image_file');
	let imgName = '/image' + grade + '_' + num + '.jpg';
	
	if(grade > 0){
		imgName = '/dummy.jpg';
	}
	img.src = imgName;
	document.querySelector('#image_file').animate(
		[
			{ transform: 'scale(0)' },
			{ transform: 'scale(2)' },
			{ transform: 'translate(0, 0)'},
			{ transform: 'translate(-5px, -0)'},
			{ transform: 'translate(5px, 0)'},
			{ transform: 'translate(-5px, -0)'},
			{ transform: 'translate(5px, 0)'},
			{ transform: 'translate(-5px, -0)'},
			{ transform: 'translate(0, 0)'},
			{ transform: 'translate(0, 0)'}
		],
		{
		  duration: 3000,
		  iterations: 1,
		  direction: 'normal'
		}
	);
	let popup = document.getElementById('js-popup');
	popup.classList.add('is-show');
	let passMessage = document.getElementById('pass_message');
	passMessage.style.visibility = 'visible';
	let charName = document.getElementById('char_name');
	charName.textContent = quiz[num].char_name;
	charName.style.visibility = 'visible';
}

function closePopUp() {
	let popup = document.getElementById('js-popup');
	let blackBg = document.getElementById('js-black-bg');
	let closeBtn = document.getElementById('js-close-btn');
	let img = document.getElementById('image_file');
	blackBg.addEventListener('click', function() {
		popup.classList.remove('is-show');
		document.getElementById('pass_message').style.visibility = 'hidden';
		document.getElementById('char_name').style.visibility = 'hidden';
		img.src = '/white.jpg';
	});
	closeBtn.addEventListener('click', function() {
		popup.classList.remove('is-show');
		document.getElementById('pass_message').style.visibility = 'hidden';
		document.getElementById('char_name').style.visibility = 'hidden';
		img.src = '/white.jpg';
	});
}
closePopUp();


let pageTop = document.getElementById('page_top');
pageTop.addEventListener('click', function() {
	$('html, body').animate({scrollTop:0},400);
});

function goToQuestion(kanjiGrade){
	let $goToQues = document.getElementsByClassName('kanjis');
	let $target = document.getElementById('hidden_block');
	for(let i = 0; i < kanjiList[kanjiGrade].length; i++){
		$goToQues[i].addEventListener('click', function() {
			$target.scrollIntoView({
				behavior: "smooth",
				block: "start",
				inline: "nearest"
			  });
		});
	}
}


//合格漢字の色を変える
function changePassKanjiColor(){
	//forで正解配列作る処理
	let login_checker = document.getElementById('login_checker');
	if(login_checker.textContent == 'true'){
		let $dummy = document.getElementsByClassName('dummy_data');
		let correctList = [];
		for(let i = 1; i < $dummy.length; i++){
			let splitData = $dummy[i].textContent.trim();
			splitData = splitData.slice(0,-1);
			let splitList = splitData.split(',');
			correctList.push(splitList);
		}
		

		let newColorList = ['#ff7f7f', '#ff7fbf', '#bf7fff', '#7f7fff', '#7fbfff', '#ffbf7f'];
		const $kanjiList = document.getElementsByClassName('kanjis');
		for(let i = 0; i < correctList[kanjiGrade].length; i++){
			let num = correctList[kanjiGrade][i];
			if(num != ''){
				$kanjiList[num].style.backgroundColor = newColorList[kanjiGrade];
				$kanjiList[num].addEventListener('mouseleave', function() {
					$kanjiList[num].style.backgroundColor = newColorList[kanjiGrade];	
				});
			}
		}
	}
	
}