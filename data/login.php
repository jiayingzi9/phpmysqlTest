<?php
header('Content-Type: application/json');
$output = ['status'=>0, 'msg'=>''];

$uname = $_REQUEST['uname'];
$upwd = $_REQUEST['upwd'];

$conn = mysqli_connect('127.0.0.1','root','123456','test', 3306);
mysqli_query($conn, 'SET NAMES UTF8');
$sql = "SELECT user_id FROM test_users WHERE user_name='$uname' AND user_pwd='$upwd'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
if($row){
	$output['status'] = intval($row['user_id']);
	$output['msg'] = $uname;
}else {
	$output['status'] = -404;
	$output['msg'] = '用户名或密码错误';
}

echo json_encode($output);//输出
?>