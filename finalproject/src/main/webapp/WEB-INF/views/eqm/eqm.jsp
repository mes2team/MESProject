<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>eqm</title>

</head>
<body>
	<div style="width: 100%; height: 200px; overflow: auto;">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">설비코드</th>
					<th scope="col">설비명</th>
					<th scope="col">사용여부</th>
					<th scope="col">점검주기</th>
					<th scope="col">담당자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${eqmList }" var="eqm" varStatus="loop">
					<tr>
						<th scope="row">${loop.count}</th>
						<td>${eqm.eqmCd }</td>
						<td>${eqm.eqmNm }</td>
						<td>${eqm.useYn }</td>
						<td>${eqm.chckPerd }</td>
						<td>${eqm.eqmMng }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<pr>
	<hr>
	<form action="${pageContext.request.contextPath }/eqm" method="post">
		<input type="file" name="profile_pt" id="profile_pt"
			onchange="previewImage(this,'View_area')">
		<div id='View_area'
			style='position: relative; width: 200px; height: 200px; color: black; border: 0px solid black; dispaly: inline;'>
			<img id="preview_img"
				src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAMAAABt9SM9AAAB0VBMVEX////y8vLx8/Te4eb8/PwAAADW1tb19PT29/iIABUIDhUIDxcIDxYIDBHf4uf39/mQAAB/AAf4goXzU1cAAAsIAACCABTSAACz2rUAAAXt7e3e3t6fAAD6oaMhJCjW2d4yqFLs8f76swCrwv4AABJyc3TKzdPAwMAPcvOXt/gfd/NzofZNi/T97u3nCgD0p6Lyl5GsxfnsYFb+6sHk7P3s6OVsY0K5pwkYGx+cnZ5GSEpXWVxlZ2k6XHclUXqztrv72deRlZq1vMmhp7C2sbH+8t7N1/mEh4q2w9Ohn5lwnsFHcJYzKijPzsq5w8G80PqHqbqAqsbxa277trf4jpD+4eGZrsbwOD1BfKkqMDb9zMyyAADD1uPqGCGTu9IzQk5QYGyrAADwQkedABSKAABmmfbG4suCw5DudWz7wCQzf/TpMBzzhnz80G/+453pOSnrU0f8zmT8x0r95LDl8+PmuaXfm6sPJy4GLE0DYq8EVJY+NhanllG0SD9/Nj8Hcqwgk8nAX19jLDXq0An/7ABOSBEAd9b/9pnK7LIkaEqyhokkrPNZSGFulEY3ViqllAxtVRmbgxWS09w0sYGPg1KQrlUWKRldRBuNjzVkVTk+NwA/EgPWAAAJOElEQVR4nO2di2PTxhnAT7alU5xIGeA4tS7YS4Ilx0kMgRhs2eAATswoHrQpBYWxrCthkEKh3YOOdmMb21j3Kuve+2v33UlOnOCksWMjo3y/xHrcSfLdL9+dT7EtkXA4rOvehP/qYm07eoR8M2pYHCJYeDrEjMA8VYE6psxwOAW/AM/RU2AttbG9QchChES4sl20id38q1d3cS3pZlGEUspMubIunq/olmma1gVLsSqVC5WqdbFiVisVc2N7gywuLBGm1BXFMlqbKqoE9NbMgNjSTVET3fJkXQy7sioXU2AurIA9DkxNd8nbDRZA0Fs6oZIkmdIOoSWpPLKC4mpr+9tshuGWvdRWQnvosngzDDZEHd5AVd3fFuzJFXTxAaAhQBgRQiINQVvqGuE9eCSkhg48amizsxm+1NRLS2JZV0nErFQICamWHjIMnRmKrjKd6X4X/PWiVIxQiMEEnLDvQGMhl9++wpddWQaDVkaZRCIWUyIgq6yo9Wq9YlaqimnWLx2oQFPNIoNwqYRAFv3u1FWQde0dGSwpjda30eVwbSpvhrCDyvgCNF6/y/96UQ1vDrLGM9NgJX8+xd2IFsm7MXci+rZhlQ8QKHUfu6CGds1+YxHVlyj3oS7Nb3TwXBLv1DuCvNvpnm8Q2+zscUzwKsuj73W870GD5uKj1/0uxGsi9P77O5zi7ZF3x+KHbnSpMH2DN+qEBjcc4R26xPgrXujmTUem+zjsymh8IH7raDdK2D8wpZ5SYKTJLFbPm5CQtyyJkO9dvnz+yqV9HPf2ABDPzXarnH0BZXmmwOCTGjBO5w2PCVmpa9+/JludH/a9D7isgTtHulbQviTinhTXzq7+oPODXIdGKELr1nKXitXfKGwfO984NOASz3U+9jggHL0Vb8gaO+x3Yfqc2VzDFdgaXfG7OP3NkW8NNHHb7+L0Ncu34k2u4h/gWc/ORG43u+IN8aCc9XTA4bGtsgbu/NDvIvUtK6NjY2Mfbpj6ENZGA3bW0z1WjgJHGrbiN/jqwRiZdsrhxuvhoYCf73QDlNUGKKsNUFYboKw2QFltgLLaAGW1AcpqA5TVBiirDVBWG6CsNjh8J+7SNVkBfpPo8GiDrvzjb2ktk1mf2tHX3R9140n8Y/+fWGpiMrN2dWkyO71T/lvf7sazBIOlzCSfje8oHmVtMrPWtDK74DpbXBSz8Xky7Mq6HqzPoHTIeGaOTzmE3MvlcscJOTUxMXEfdE1nMjPrkyBr4aNc7p7fJe0DxjNXYTqTyWQz8w8+Wogcz60sTjyMLN6/T6ayS5HJLJeVe0Bmcyf8LmofkJ0ivL3NX83O86giJ+99PAGzxYnFLO/MZkDWSm72+KNH+L4ItLWs++nEqfVIjn9w4sFJT9YpEXNrIGv5Ue7ego9F7B+G12fmYTYHfdfjk/xjJ0dPTZwi5OEEWZuBkOPNcJaH3DJ28cD4TGZ9JpuB1ng99+he7jEhn0x8en/ix2Q+uz6dFR38idzJk6KNImRpampunC/MHj8heqZTDz/mY4fI5NT8zORP7hKycOLEgp8l7H+uQrANZ5b8LsabwVJmbWp9xu9SvCnMT03P+V0GBEEOMD35TmAgifTq4gIB9LXni0O0f+Tg2aLel7K7y/ySe+hgwb/tuJ/vC23HKhb54eb4v3ECF1rdllWtClk//RmIokGTRaSevDvofj23+8f1GbVnVZJ69tLhH6rRm6tWGAF0RXozJg3qqBRBkD5FpVvP9GDQtD2pkY6o1FMDc0mVYLqZ5CaLNZ6OUIkqjKUUJSWZimKBMBiSqbDKFIUpJuQZjJmMBnE01TZcllU3LcukViqvUCGLMpBFrbpiWiZTLGbWURZHXAOOUkap5F4KThUXj5W8dMOgPMeQUBYRfdYWpMgrSW46ykIQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEEQBEHaojfXaA8mpDdX/w8mrizvkrOU+lqWvkfIoimzbjKT1U20tRtuZIGolGTqLIWydmOjGRrwg6p2Bzv4NkBZbdD0argDdOs8oE2VSrSppq9U0k1wXw0Vg4nbLRlGXpcM6i7rKqWGaii8NwMY5DEDNmQ9ujOTnxgsz/KKEeLVy6d4nQGm55mXqYT4ghtZVkrnybRqsrCiMLGsKJZVr5p5i1XErnXFMuupfNU0dV/q01OMusLv/lBhVv0Cq8ASpNG6qYixFLPy1SZZjXBRDcaowTyfjNXDjDbymK7mGWgPSQGMLGhTSgiiC1qSyqNLxAP15nnTYK4sccsDlba4E4J3J5dGnuo+Wt4yIQg011TdSNuSQBRkzxC5ExJO8smTJ8lCRzu/IcRszZaTyUJ0M4VommanZZhqiVKST52CHYO5/NnPn45o2rHPvzh9WqzXxFayY8E8aTu/ePzLVUfTRkae/Yqnj/z6N7DVsTPPz/z2d8e07UQFmzOtsbyFwcHo0NBQFH4GOycK+/PH4CuH15pKIAqgyXYS1mKxaEyWowl4RGUtBtUoFApazC6Wq3KpdL4E2XatBkdNEk0uKiqvbsLWSgmwUU4XRe2fPv39Z7Dv6RcvXsC6HFn+gy7DRvVSsSgnnS//OP2p42gjz5599ifIHpz+81/+GtOOffXy5d92lOUVtrUpcCUqyHVF9yNriKsaesXT1uflS+Cjxk2UbLlUTMtVqyYn045ds4eccjmhQSgVYppTKMSioMhwYq4sg4iYKYvIktO1mifr6aAGsr7++i6XRec+AVlyCV4+LS7r7+/c57LOPXvGZck3//HPf4GsMy///byFLKHLLarm/lFb+xryQmvfsrbZ0jaetzlJTpcSsOQ4clqx5HIlLZdrtpN2otC4EnbJtm2nZDu2HZPT9Vo5yWWBwiRvZ1pBNEZuVMzBFjRDeWT181UZPBcvVHnEJdPpNDRlx/nyP/8FWbDxuXNC9RdX4CDyV8+fP/9frKWrjb/sprhtkeVWdJ+yhlzhLWh6Xq88cszLkt1mqCXkmCbzzFiinC6V0+Va2k5D9MkQbK4saIEtQoF3R1D7s4JVEZWy5zKRWH1bcLbgZg/yY3BXZ88BfOtdO62dZLmhxXVtVr39yPIO0jJyv6EEzbkJOeH26sJoLAm9W/L/MGGKx2Y0BQIAAAAASUVORK5CYII=">
		</div>
		<div>
		<div class="row g-3 align-items-center">
				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">설비구분</label>
				</div>
				<div class="col-auto">
					<select name="eqmFg" class="form-select">
						<option>분쇄기</option>
						<option>계량기</option>
						<option>배합기</option>
						<option>건조기</option>
						<option>포장기</option>
					</select>
				</div>

				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">설비코드</label>
				</div>
				<div class="col-auto">
					<input type="text" name="eqmCd" attr="disabled"
						class="form-control" readonly>
				</div>
				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">설비명</label>
				</div>
				<div class="col-auto">
					<input type="text" name="eqmNm" class="form-control">
				</div>
				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">입고일자</label>
				</div>
				<div class="col-auto">
					<input type="date" name="eqmIstDt" class="form-control">
				</div>
			</div>
			<hr>
			<div class="row g-3 align-items-center">
				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">점검주기</label>
				</div>
				<div class="col-auto">
					<input type="number" name="chckPerd" class="form-control">
				</div>
				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">온도</label>
				</div>
				<div class="col-auto">
					<input type="number" style="width: 100px; display:inline-block;" name="eqmMinTemp" class="form-control"> ~
					<input type="number" style="width: 100px; display:inline-block;" name="eqmMaxTemp" class="form-control">
				</div>
				<div class="col-auto">
					<label for="inputPassword6" class="col-form-label">설비담당자</label>
				</div>
				<div class="col-auto">
					<input type="text" name="eqmMng" class="form-control">
				</div>
				<div class="col-auto">
					<label for="inputPassword6"  class="col-form-label">사용여부</label>
				</div>
				<div class="col-auto">
					<input type="radio" name="useYn" checked value="Y"> 사용 
					<input type="radio" name="useYn" value="N"> 미사용
					<button type="submit" class="btn btn-outline-info">등록</button>
					<button type="button" class="btn btn-outline-danger">삭제</button>
				</div>
			</div>
		</div>
	</form>

	<script>
		const selects = document.getElementsByTagName('select');
		const disabled = document.querySelectorAll('[attr="disabled"]');
		//설비명 선택시 자동으로 설비코드
		if (selects[0].value == '분쇄기') {
			disabled[0].value = 'EQM1000'
		};
		selects[0].addEventListener('change', function() {
			if (selects[0].value == '분쇄기') {
				disabled[0].value = 'EQM11000';
			} else if (selects[0].value == '계량기') {
				disabled[0].value = 'EQM1001';
			} else if (selects[0].value == '배합기') {
				disabled[0].value = 'EQM1002';
			} else if (selects[0].value == '건조기') {
				disabled[0].value = 'EQM1003';
			} else
				disabled[0].value = 'EQM1004';
		})

		function previewImage(targetObj, View_area) {
			var img = document.querySelector("#preview_img")
			if (img) {
				img.parentNode.removeChild(img);
			}
			var preview = document.getElementById(View_area); //div id
			var ua = window.navigator.userAgent;

			//ie일때(IE8 이하에서만 작동)
			if (ua.indexOf("MSIE") > -1) {
				targetObj.select();
				try {
					var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
					var ie_preview_error = document
							.getElementById("ie_preview_error_" + View_area);

					if (ie_preview_error) {
						preview.removeChild(ie_preview_error); //error가 있으면 delete
					}

					var img = document.getElementById(View_area); //이미지가 뿌려질 곳

					//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
					img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
							+ src + "', sizingMethod='scale')";
				} catch (e) {
					if (!document.getElementById("ie_preview_error_"
							+ View_area)) {
						var info = document.createElement("<p>");
						info.id = "ie_preview_error_" + View_area;
						info.innerHTML = e.name;
						preview.insertBefore(info, null);
					}
				}
				//ie가 아닐때(크롬, 사파리, FF)
			} else {
				var files = targetObj.files;
				for (var i = 0; i < files.length; i++) {
					var file = files[i];
					var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
					if (!file.type.match(imageType))
						continue;
					var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
					if (prevImg) {
						preview.removeChild(prevImg);
					}
					var img = document.createElement("img");
					img.id = "prev_" + View_area;
					img.classList.add("obj");
					img.file = file;
					img.style.width = '220px';
					img.style.height = '200px';
					
					preview.appendChild(img);
					if (window.FileReader) { // FireFox, Chrome, Opera 확인.
						var reader = new FileReader();
						reader.onloadend = (function(aImg) {
							return function(e) {
								aImg.src = e.target.result;
							};
						})(img);
						reader.readAsDataURL(file);
					} else { // safari is not supported FileReader
						//alert('not supported FileReader');
						if (!document.getElementById("sfr_preview_error_"
								+ View_area)) {
							var info = document.createElement("p");
							info.id = "sfr_preview_error_" + View_area;
							info.innerHTML = "not supported FileReader";
							preview.insertBefore(info, null);
						}
					}
				}
			}
		}
	</script>
</body>
</html>