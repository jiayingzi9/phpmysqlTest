
$('.header').load('header.html');
$('.footer').load('footer.html');

$('#login-form [type="button"]').click(function(){
  var result = $('#login-form').serialize(); //serialize()序列化表单值
  $.post('data/login.php',result,function(data){
    if(data.status<0){
      $('.modal .alert p').html(data.msg);
      $('[name="uname"]').val('');
      $('[name="upwd"]').val('');
    }else {
      $('#login-msg').html(data.msg+", 欢迎回来！");
      console.log(data)
      $('.modal').fadeOut();
      getMyOrder(data.msg, 1); //加载我的订单
    }
  });
});


$('[data-toggle="affix-item"]').click(function(event){
  event.preventDefault();
  $(this).parent().addClass('active')
    .siblings('.active').removeClass('active');

  var id = $(this).attr('href');
  $(id).addClass('active')
    .siblings('.active').removeClass('active');
});

function getMyOrder(uname, pno){
  $.get('data/order.php', {'uname':uname, 'pno':pno}, function(pagerObj){
    var str = '';  
    $.each(pagerObj.data, function(i, order){
      str += '<tr>'
					+'<td colspan="6" style="text-align: left">'
					+'		从数据库获取数据：'+order.order_num
	  			+'		<a href="'+order.shop_url+'">'+order.shop_name+'</a>'
					+'</td>'
					+'</tr>'
          +'<tr>'
					+'	<td style="text-align: left">';
          $.each(order.products, function(j,product){
            str += '<a href="'+product.product_url+'"><img src="'+product.product_img+'" alt="" title="'+product.product_name+'"></a>'; 
          })
			str +='</td>'
					+'	<td>'+order.user_name+'</td>'
					+'	<td>'+order.payment_mode+'</td>'
					+'	<td>'+order.submit_time.replace('T','<br>')+'</td>'
					+'	<td>'+order.order_state+'</td>'
					+'	<td>'
					+'		<a href="#">ajaxphpmysql</a><br>'
					+'		<a href="#">ajaxphpmysql</a><br>'
					+'		<a href="#">ajaxphpmysql</a>'
					+'	</td>'
					+'</tr>';
    });
    $('#order-table tbody').html(str);

    //根据分页对象编写分页条
    var str = ''; 
    str += '<li><a href="#">'+(pagerObj.cur_page-2)+'</a></li>'
    str += '<li><a href="#">'+(pagerObj.cur_page-1)+'</a></li>'
    str += '<li class="active"><a href="#">'+pagerObj.cur_page+'</a></li>'
    str += '<li><a href="#">'+(pagerObj.cur_page+1)+'</a></li>'
    str += '<li><a href="#">'+(pagerObj.cur_page+2)+'</a></li>'
    $('.pager').html(str);
  });
}





