var slides = document.getElementsByClassName("slide__link");
var prev = document.getElementById("prev");
var next = document.getElementById("next");


var current = 0;
var delay = 2000; // delay time
//showSlides(current);

prev.onclick = prevSlides;
next.onclick = nextSlides;


window.onload = function(){
	showSlides(); // 자동으로 넘어가는 슬라이드 function
}


/* Function 영역 */

function showSlides(){
  for(i=0; i<slides.length; i++){
    slides[i].style.display = "none";
  }
  current++;
  
  if(current > slides.length)
  	current = 1;
  slides[current-1].style.display = "block";
  setTimeout(showSlides, delay);   // 2초마다 showSlides 함수 반복 실행 
}

function prevSlides(){
  if(current > 0){
    current--;
  }
  else{
    current = slides.length - 1;
  }
  showSlides();
}

function nextSlides(){
  if(current < slides.length - 1){
    current++;
  }
  else{
    current = 0;
  }
  showSlides();
}