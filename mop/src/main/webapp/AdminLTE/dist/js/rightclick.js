/*
===============================================================

Hi! Welcome to my little playground!

My name is Tobias Bogliolo. 'Open source' by default and always 'responsive',
I'm a publicist, visual designer and frontend developer based in Barcelona. 

Here you will find some of my personal experiments. Sometimes usefull,
sometimes simply for fun. You are free to use them for whatever you want 
but I would appreciate an attribution from my work. I hope you enjoy it.

===============================================================
*/

$(document).ready(function(){
  //Show contextmenu:
  $(".rightMenuTree").contextmenu(function(e){
    //Get window size:
	rcelement=e.target;//index中定义，用于菜单的操作
	var levelcode = e.target.getAttribute('nodelevelcode'); //设置大范围，根据这个确定那个元素
	var menuName;
	if (levelcode == 1){
		menuName=".contextmenuCity";
	}else{
		menuName=".contextmenuBox";
	}
    var winWidth = $(document).width();
    var winHeight = $(document).height();
    //Get pointer position:
    var posX = e.pageX;
    var posY = e.pageY;
    //Get contextmenu size:
    var menuWidth = $(menuName).width();
    var menuHeight = $(menuName).height();
    //Security margin:
    var secMargin = 0;//10;
    var secMarginy = -20;//10;
    //Prevent page overflow:
    if(posX + menuWidth + secMargin >= winWidth
    && posY + menuHeight + secMarginy >= winHeight){
      //Case 1: right-bottom overflow:
      posLeft = posX - menuWidth - secMargin + "px";
      posTop = posY - menuHeight - secMarginy + "px";
    }
    else if(posX + menuWidth + secMargin >= winWidth){
      //Case 2: right overflow:
      posLeft = posX - menuWidth - secMargin + "px";
      posTop = posY + secMarginy + "px";
    }
    else if(posY + menuHeight + secMarginy >= winHeight){
      //Case 3: bottom overflow:
      posLeft = posX + secMargin + "px";
      posTop = posY - menuHeight - secMarginy + "px";
    }
    else {
      //Case 4: default values:
      posLeft = posX + secMargin + "px";
      posTop = posY + secMarginy + "px";
    };
    
    //Display contextmenu:
    $(menuName).css({
      "left": posLeft,
      "top": posTop
    }).show();
    //Prevent browser default contextmenu.
    return false;
  });
  //Hide contextmenu:
  $(document).click(function(){
    $(".contextmenuCity").hide();
  });
  
  $(".menuBox").contextmenu(function(e){
	    //Get window size:
		//alert(e.target.className);
	    var winWidth = $(document).width();
	    var winHeight = $(document).height();
	    //Get pointer position:
	    var posX = e.pageX;
	    var posY = e.pageY;
	    //Get contextmenu size:
	    var menuWidth = $(".contextmenuBox").width();
	    var menuHeight = $(".contextmenuBox").height();
	    //Security margin:
	    var secMargin = 0;//10;
	    var secMarginy = -20;//10;
	    //Prevent page overflow:
	    if(posX + menuWidth + secMargin >= winWidth
	    && posY + menuHeight + secMarginy >= winHeight){
	      //Case 1: right-bottom overflow:
	      posLeft = posX - menuWidth - secMargin + "px";
	      posTop = posY - menuHeight - secMarginy + "px";
	    }
	    else if(posX + menuWidth + secMargin >= winWidth){
	      //Case 2: right overflow:
	      posLeft = posX - menuWidth - secMargin + "px";
	      posTop = posY + secMarginy + "px";
	    }
	    else if(posY + menuHeight + secMarginy >= winHeight){
	      //Case 3: bottom overflow:
	      posLeft = posX + secMargin + "px";
	      posTop = posY - menuHeight - secMarginy + "px";
	    }
	    else {
	      //Case 4: default values:
	      posLeft = posX + secMargin + "px";
	      posTop = posY + secMarginy + "px";
	    };
	    
	    //Display contextmenu:
	    $(".contextmenuBox").css({
	      "left": posLeft,
	      "top": posTop
	    }).show();
	    //Prevent browser default contextmenu.
	    return false;
	  });
	  //Hide contextmenu:
	  $(document).click(function(){
	    $(".contextmenuBox").hide();
	  });
});