<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
</head>
<body>
	<div class="content-wrap">
		<form action="/noticeWrite.do" method="post" enctype="multipart/form-data" id="writeFrm">
			<table>
				<tr>
					<th colspan="3">
						<label for="title">제목</label>
						<select size="1" name="noticeStatus" class="input-form-short">
							<option value="1">공지</option>
							<option value="0">일반</option>
						</select>
						<input type="text" name="noticeTitle" >
					</th>
				</tr>
				<tr>
					<th colspan="3">
						<label for="file">파일첨부</label>
						<input type="file" name="noticeFile" multiple>
						<c:forEach items="${n.fileList }" var="f">
							<p>
								<a href="/noticeFileDown.do?fileNo=${f.fileNo}">${f.fileName }</a>
								<button type="button" onclick="deleteFile(this,${f.fileNo}, '${f.filepath}');">삭제</button>
							</p>
						</c:forEach>
					</th>
				</tr>
				<tr>
					<th>
						<label for="noticeWriter">작성자</label>
					</th>
					<td>
						${sessionScope.m.memberId }
						<input type="hidden" name="noticeWriter" value="${sessionScope.m.memberId }" readonly>
					<td>
				</tr>
				<tr>
					<th colspan="3">내용</th>
				</tr>
				<tr>
					<td colspan="3">
						<textarea id="noticeContent" rows="20" name="noticeContent" class="form"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="submit" value="저장">
						<button type="button">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		$("#noticeContent").summernote({
			height : 550,
			lang : "ko-KR",
			callbacks : {
				onImageUpload : function(files) {
					uploadImage(files[0], this)
				}
				
			}
		});
		function uploadImage(file, editor) {
		    const form = new FormData();
		    form.append("imageFile", file);
		    console.log(file);
		    $.ajax({
		        url: "/uploadImage.do",
		        type: "post",
		        data: form,
		        processData: false,
		        contentType: false,
		        success: function(data) {
		        	console.log(data);
		            $(editor).summernote("insertImage", data);
		        }
		    });
		}
		function deleteFile(obj, fileNo, filepath){
			const fileNoInput = $("<input>");
			fileNoInput.attr("name","fileNo");
			fileNoInput.val(fileNo);
			fileNoInput.hide();
			
			const filepathInput = $("<input>");
			filepathInput.attr("name","filepath");
			filepathInput.val(filepath);
			filepathInput.hide();
			
			$("#writeFrm").append(fileNoInput).append(filepathInput);
			$(obj).parent().remove();
		}
	</script>
</body>
</html>