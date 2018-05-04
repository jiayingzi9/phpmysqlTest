<?php
header('Content-Type: application/json');

$uname = $_REQUEST['uname'];
$pno = $_REQUEST['pno'];


//保存分页数据        
$output = [
	'record_count' => 0,
	'page_size' => 5,
	'page_count' => 0,
	'cur_page' => intval($pno),
	'data' => []
];   


$conn = mysqli_connect('127.0.0.1','root','123456','test',3306);
mysqli_query($conn, "SET NAMES UTF8");

$sql = "SELECT COUNT(order_id) FROM test_orders WHERE user_name='$uname'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
$output['record_count'] = intval($row['COUNT(order_id)']); //总记录数
$output['page_count'] = ceil($output['record_count']/$output['page_size']); //总页数



$start = ($output['cur_page']-1)*$output['page_size'];
$count = $output['page_size'];
$sql = "SELECT * FROM test_orders WHERE user_name='$uname' LIMIT $start,$count";
$order_result = mysqli_query($conn,$sql);
while( ($order=mysqli_fetch_assoc($order_result))!==NULL ){
	$order['products'] = [];
	$oid = $order['order_id'];
	$sql = "SELECT * FROM test_products WHERE product_id IN ( SELECT product_id FROM test_order_product_detail WHERE order_id='$oid' )";
	$product_result = mysqli_query($conn, $sql);
	while( ( $p = mysqli_fetch_assoc($product_result)) !== NULL ){
		$order['products'][] = $p;
	}

	$output['data'][] = $order;
}

echo json_encode($output);
?>