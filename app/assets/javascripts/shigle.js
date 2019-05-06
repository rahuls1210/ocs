$(document).ready(function() {
    $('.carousel').carousel({
        interval: false
    }); 
    
    if($('li').hasClass('active')){
    
        $('#shingleName').html(' - '+$(this).find('span#image_name').html())          
    }
    $("a.event-cap").on("click",function() {       
        if($('li').hasClass('active')){
            
                $('#shingleName').html(' - '+$('li.active').find('span#image_name').html())          
            }   
      });
    $("li").on("click",function() {       
      $('#shingleName').html(' - '+$(this).find('span#image_name').html())     
    });
  }); 
   