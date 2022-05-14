var quill = new Quill('#editor-container', {
	  modules: {
	    toolbar: '#toolbar-container',
	   	imageResize: { displaySize : true }
	  },
	  placeholder: '게시물을 작성해주세요.',
	  theme: 'snow'
});

// 이미지 핸들러를 추가해서 이미지 업로드에 관한 건 Quill이 아닌 직접 처리한다.
quill.getModule('toolbar').addHandler('image', function(){
	selectLocalImage();
}); 

// quill img value testing function
function showDelta(){
	let html = quill.root.innerHTML;
	console.log(html);
}

function selectLocalImage(){
	const input = document.createElement("input");
	input.setAttribute('type', 'file');	// type이 file인 input을 생성
	input.click(); // 사용자 컴퓨터에서 파일 탐색기가 열리고 파일을 선택하라고 한다.

	// 사용자가 파일 탐색기에서 특정 이미지를 클릭해서 input의 값이 변했다면
	// 사용자가 클릭한 이미지를 서버에 저장한다(ajax 이용)
	input.onchange = function(){
		const form= new FormData();
		const file = $(this)[0].files[0];
		form.append('image', file); // input에서 받은 값을 formdata에 넣어서 controller로 보낸다. 
		
		// controller에서 서버에 이미지 저장 후 이미지 url을 리턴한다. 
		$.ajax({
			type:"post",
			enctype:'multipart/form-data',
			url: '/foodlab/upload/img/quilleditor',
			data: form,
			processData: false,	//필수  x-www-form-urlencoded로 파싱됨.
			contentType: false,	//필수 : contentType을 false로 줬을 때 쿼리 스트링으로 자동 설정됨. 그거 해제 하는 법
		/* 	beforeSend: function(xhr){
				xhr.setRequestHeader($('#_csrf_header').val(), $('#_csrf').val());
			}, */
			success: function(data){
				console.log('imgUrlInServer: '+data);
				const range = quill.getSelection();
				// 원래는 base64의 긴 텍스트로 나타내던 img src를 서버 위의 파일이 저장된 경로로 대체한다.
				quill.insertEmbed(range.index, 'image', 'http://localhost:8085/foodlab/resources/upload/quilleditor/'+data);
			},
			error: function(err){
				console.log("Error ::: "+err);
			}
		});
	}
	
	
}