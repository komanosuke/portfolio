
let costs = document.getElementsByClassName('cost');
let total = document.getElementById('total');
let my_costs = document.getElementsByClassName('my_cost');
let my_total = document.getElementById('my_total');

//税金を定義
let income = document.getElementsByClassName('income_ex');
costs[7].textContent = Number(income[0].textContent) * 0.25;
my_costs[7].textContent = Number(income[1].textContent) * 0.25;

let total_num = 0;
for(let i = 0; i < costs.length; i++){
	total_num += Number(costs[i].textContent);
}
total.textContent = total_num;


let my_total_num = 0;
for(let i = 0; i < my_costs.length; i++){
	my_total_num += Number(my_costs[i].textContent);
}
my_total.textContent = my_total_num;

const gene_cost = document.getElementsByClassName('gene_cost_input');
const gene_cost_yaer = document.getElementsByClassName('gene_cost_year');
let my_lifecost_total = document.getElementById('my_lifecost_total');
let my_year_total = document.getElementById('my_year_total');
let gene_costs = [0,0,0,0,0];
for(let i = 0; i < gene_cost.length; i++){
	gene_cost[i].addEventListener('change', function(e) {
		gene_costs[i] = Number(e.target.value);
		my_lifecost_total.textContent = gene_costs.reduce((sum, element) => sum + element, 0);
		gene_cost_yaer[i].textContent = gene_costs[i] * 10;
		sumup();
	});
}

let lifeincome = document.getElementsByClassName('lifeincome');
let cost = document.getElementById('cost');
let difference = document.getElementById('difference');



let basic_month = document.getElementsByClassName('basic_month');
let basic_cost = document.getElementsByClassName('basic_cost');
for(let i = 0; i < basic_month.length; i++){
	basic_month[i].addEventListener('change', function(e) {
		basic_cost[i].textContent = e.target.value * 12;
		sumup();
	});
}

let basic_total = document.getElementById('basic_total');
let basic_total_month = document.getElementById('basic_total_month');

function sumup(){
	let month_sum = 0;
	let year_sum = 0;
	for(let i = 0; i < gene_cost_yaer.length; i++){
		gene_cost_yaer[i].textContent = gene_cost[i].value * 10;
		month_sum += Number(gene_cost[i].value);
		year_sum += Number(gene_cost_yaer[i].textContent);
	}
	my_lifecost_total.textContent = month_sum;
	my_year_total.textContent = year_sum;
	income[1].textContent = year_sum;
	for(let i = 0; i < lifeincome.length; i++){
		lifeincome[i].textContent = year_sum;
	}
	my_costs[7].textContent = Number(income[1].textContent) * 0.25;

	let basic_year_total = 0;
	for(let i = 0; i < basic_cost.length; i++){
		basic_cost[i].textContent = basic_month[i].value * 12;
		basic_year_total += Number(basic_cost[i].textContent);
	}
	basic_total.textContent = basic_year_total;
	basic_total_month.textContent = basic_year_total/12;
	my_costs[0].textContent = basic_year_total * 42;
	//老後
	my_costs[6].textContent = basic_year_total * 30;

	let my_total_num = 0;
	for(let i = 0; i < my_costs.length; i++){
		// console.log(my_costs[i].textContent);
		my_total_num += Number(my_costs[i].textContent);
	}
	my_total.textContent = my_total_num;

	// 最後
	cost.textContent = my_total.textContent;
	diff = Number(year_sum) - Number(cost.textContent)
	if(diff < 0){
		difference.textContent = -diff;
	} else {
		difference.textContent = diff + '円、足りています';
	}
	
}
sumup();

let option = document.getElementsByClassName('option');
let default_mode = document.getElementById('default_mode');
default_mode.addEventListener('click', function(e) {
	for(let i = 0; i < option.length; i++){
		option[i].style.background = '#fff';
	}
	for(let i = 1; i < 5; i++){
		my_costs[i].textContent = 0;
	}
	sumup();
	marry_check = false;
	child_count = 0;
	option[1].textContent = '子ども';
});

let marriage = document.getElementById('marriage');
let marry_mode = document.getElementById('marry_mode');
let marry_check = false;
marry_mode.addEventListener('click', function(e) {
	if(marry_check == false){
		option[0].style.background = 'red';
		my_costs[1].textContent = marriage.textContent;
		sumup();
		marry_check = true;
	} else {
		option[0].style.background = '#fff';
		my_costs[1].textContent = 0;
		sumup();
		marry_check = false;
		house_check = false;
		car_check = false;
		care_check = false;
	}
});

let child = document.getElementById('child');
let child_mode = document.getElementById('child_mode');
let child_count = 0;
child_mode.addEventListener('click', function(e) {
	option[1].style.background = 'red';
	child_count++;
	option[1].textContent = '子ども' + child_count;
	my_costs[2].textContent = Number(my_costs[2].textContent) + Number(child.textContent);
	sumup();
});


let house = document.getElementById('house');
let house_mode = document.getElementById('house_mode');
let house_check = false;
house_mode.addEventListener('click', function(e) {
	if(house_check == false){
		option[2].style.background = 'red';
		my_costs[3].textContent = house.textContent;
		sumup();
		house_check = true;
	} else {
		option[2].style.background = '#fff';
		my_costs[3].textContent = 0;
		sumup();
		house_check = false;
	}
});

let car = document.getElementById('car');
let car_mode = document.getElementById('car_mode');
let car_check = false;
car_mode.addEventListener('click', function(e) {
	if(car_check == false){
		option[3].style.background = 'red';
		my_costs[4].textContent = car.textContent;
		sumup();
		car_check = true;
	} else {
		option[3].style.background = '#fff';
		my_costs[4].textContent = 0;
		sumup();
		car_check = false;
	}
});


let care_mode = document.getElementById('care_mode');
let care_check = false;
care_mode.addEventListener('click', function(e) {
	if(care_check == false){
		option[4].style.background = 'red';
		sumup();
		care_check = true;
	} else {
		option[4].style.background = '#fff';
		sumup();
		care_check = false;
	}
});
