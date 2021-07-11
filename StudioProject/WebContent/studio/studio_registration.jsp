<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {
	width: 100%;
	background-color: #EADFF2;
	margin: 10px auto 10px auto;
	border: 1px solid #5f4b8b;;
}

th {
	width: 100px;
	height: 30px;
	text-align: left;
	font-size: 16px;
}

td {
	padding: 10px;
	width: 400px;
}

#studio_reg_body {
	margin-top: 150px;
	position: absolute;
	width: 1000px;
	margin-left: -500px;
	left: 50%;
}

input {
	font-size: 16px;
}

#submit_btn {
	
}
</style>
<meta charset="UTF-8">
<title>사진관 등록</title>
</head>
<body>
	<%@ include file="/header/header.jsp"%>
	<div id="studio_reg_body">
		<div id="studio_reg_title">
			<h1>사진관 등록</h1>
		</div>
		<form action="./studio_registration_act_confull.jsp" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>사진관 이름</th>
					<td><input type="text" name="studio_name"></td>
				</tr>

				<tr>
					<th>사업자 번호</th>
					<td><input style="width: 48px;" type="text" name="ent_num"
						value="123"> - <input style="width: 32px;" type="text"
						name="ent_num" value="12"> - <input style="width: 96px;"
						type="text" name="ent_num" value="12345"></td>
				</tr>

				<tr>
					<th>전화번호</th>
					<td><input type="text" style="width: 48px;"
						name="studio_number" maxlength="3"> - <input type="text"
						style="width: 64px;" name="studio_number" maxlength="4"> -
						<input type="text" style="width: 64px;" name="studio_number"
						maxlength="4"></td>
				</tr>

				<tr>
					<th>주소</th>
					<td><input type="text" style="width: 100%;"
						name="studio_address"></td>
				</tr>

				<tr>
					<th>상세주소</th>
					<td colspan="3"><input type="text" style="width: 100%;"
						name="studio_address_detail"></td>
				</tr>

				<tr>
					<th>상품1 이름</th>
					<td><input type="text" style="width: 100%;"
						name="product1_name"></td>
					<th>가격</th>
					<td><input type="text" style="width: 100%;"
						name="product1_price"></td>
				</tr>

				<tr>
					<th>상품2 이름</th>
					<td><input type="text" style="width: 100%;"
						name="product2_name"></td>
					<th>가격</th>
					<td><input type="text" style="width: 100%;"
						name="product2_price"></td>
				</tr>


				<tr>
					<th>상품3 이름</th>
					<td><input type="text" style="width: 100%;"
						name="product3_name"></td>
					<th>가격</th>
					<td><input type="text" style="width: 100%;"
						name="product3_price"></td>
				</tr>

				<tr>
					<th>상품4 이름</th>
					<td><input type="text" style="width: 100%;"
						name="product4_name"></td>
					<th>가격</th>
					<td><input type="text" style="width: 100%;"
						name="product4_price"></td>
				</tr>

				<tr>
					<th>상품5 이름</th>
					<td><input type="text" style="width: 100%;"
						name="product5_name"></td>
					<th>가격</th>
					<td><input type="text" style="width: 100%;"
						name="product5_price"></td>
				</tr>

				<tr>
					<th>이미지 :</th>
					<td><input type="file" name="img" accept="image/*"></td>
				</tr>

				<tr>
					<td colspan="4"><textarea name="studio_content"
							maxlength="2048" style="width: 100%; height: 1000px;"></textarea></td>
				</tr>

				<tr>
					<td colspan="4" align="center">
						<input type="submit" id="submit_btn" value="등록하기">
						<input type="submit" id="submit_btn" value="취소하기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>