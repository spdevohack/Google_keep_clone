// console.log(1)

var openButton = document.querySelector('.openbtn')
var mySideBar = document.querySelector('#mySidebar')
var main = document.querySelector('#main-div')
  var count = 1
openButton.addEventListener('click', function(){
  if (count%2 != 0){
    mySideBar.style.width = "250px";
    main.style.marginLeft = "250px";
    count = count+1
  // console.log(count)
  }else if (count%2 == 0){
    mySideBar.style.width = "0";
    main.style.marginLeft= "0";
    count +=1
  }
	  console.log(count)

})



// var divNote = document.querySelector(".div-note");
var divNote = $('.keep-note').children();

for(i=0; i < mySideBar.childElementCount; i++){
  mySideBar.children[i].addEventListener('click', view)
}

function view(e){
  var name = e.target.id
  var name1 = `#${name}-view`
  console.log(name1)
  $('#main-div').children('.keep-note').children().css("display","none")
  $('#main-div').children('.keep-note').children(`${name1}`).css("display", "block")
}

