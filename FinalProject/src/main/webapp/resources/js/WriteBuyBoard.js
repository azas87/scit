

$(function(){
	
	var setFishName =$('#setFishName').val();
	var setFishNum =$('#setFishNum').val();
	var setLoction =$('#setLoction').val();
	var setSellerId =$('#setSellerId').val();

	var currentDate = today();
	var tomorrow = getTomorrow();
	var setDate = '<option value="'+currentDate+'">'+currentDate+'</option>';
		setDate += '<option value="'+tomorrow+'">'+tomorrow+'</option>';
	$('#loadDate').html(setDate);
	
	if(fishName.length!=0){
		$('#fishName').val(setFishName);
		$('#fishNum').val(setFishNum);
		var temp = '<option value="'+setLoction+'">'+setLoction+'</option>';
		$('#location').html(temp);
		$('#buyLocation').val(setLoction).prop("selected", true);
		$('#priority1').val(setSellerId).prop("selected", true);
	}
	
	$("#fishName").keyup(function (){
		
		var fishName =$('#fishName').val();
			// 공백인 경우 return
			if(fishName.length==0){
				return;
			}
			//히라가나인 경우 가타카나로 변경
			if(isHiragana(fishName)){
				fishName = hiraToKana(fishName);
			}
		
		$.ajax({
			url:"getFishName",
			type:"get",
			data:{"fishName":fishName},
			
			success:function(data){
				var temp='';
				
				if(data.length==0){
					temp='該当する魚は販売しておりません。'
				}
				if(data.length==1){
					$('#fishNum').val(data[0].fishNum);
					getLocation(data[0].location);
				}
				for(i in data){
					
					temp +='<a class="fishName" data-name="'+data[i].fishName+'" data-loca="'+data[i].locations+'">'+data[i].fishName+'</a>';
				}
				
				$('#myDropdown').html(temp);
				$("a.fishName").click(getFishName);
			},
			
			error:function(){
				alert("통신실패")
			}
		});//ajax
	});//keyup
	
	
	
	});//onload


//텍스트박스에 클릭한 생선이름 입력
function getFishName() {
	
	var locationList = $(this).attr("data-loca");
	var fishName = $(this).attr("data-name");
	var fishNum = $(this).attr("data-no");
	$('#fishName').val(fishName);
	
	getLocation(locationList);
}

//히라가나를 카타카나로
function hiraToKana(str) {
    return str.replace(/[\u3041-\u3096]/g, function(match) {
        var chr = match.charCodeAt(0) + 0x60;
        return String.fromCharCode(chr);
    });
}

//히라가나 인지 여부
function isHiragana(str){
	  str = (str==null)?"":str;
	  if(str.match(/^[ぁ-んー　]*$/)){ 
	    return true;
	  }else{
	    return false;
	  }
	}

//유효성검사
function check() {

	var fishName = $('#fishName').val();
	var location = $('#location').val();
	var weight = $('#weight').val();
	var price = $('#price').val();
	var deadline = $('#deadline').val();
	var fishNum = $('#fishNum').val();
	
	if(fishName.length==0){
		alert('魚種を入力してください。');
		$('#fishName').focus();
		return false;
	}
	if(location.length==0){
		alert('産地を入力してください。');
		$('#location').focus();
		return false;
	}
	if(weight.length==0){
		alert('重量を入力してください。');
		$('#weight').focus();
		return false;
	}
	if(price.length==0){
		alert('価格を入力してください。');
		$('#price').focus();
		return false;
	}


	var loadDate = $('#loadDate').val();
	var hour = $('#hour').val();
	var minute = $('#minute').val();
	var temp = loadDate+" "+hour+":"+minute+":00";
	$('#uploadDate').val(temp);
	var finishHour = $('#finishHour').val();
	hour += finishHour;
	temp = loadDate+" "+hour+":"+minute+":00";
	$('#deadline').val(temp);
	return true;
}
//선택한 생선이름에 대한 원산지 정보 select 박스에 주입
function getLocation(list) {

	var location = list.split(',');
	var temp = '';
	for(i in location){
		
		temp += '<option value="'+location[i]+'">'+location[i]+'</option>'
	}
	$('#location').html(temp);
}

//오늘날짜 구하기
function today(){
	   
    var date = new Date();

    var year  = date.getFullYear();
    var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
    var day   = date.getDate();

    if (("" + month).length == 1) { month = "0" + month; }
    return year +"/" + month +"/"+ day; 
       
}


// 내일 날짜 가져오기 
function getTomorrow(){
	
	var today = new Date();
	var tomorrow = new Date(today.valueOf() + (24*60*60*1000));
	
	var year = tomorrow.getFullYear();
	var month = tomorrow.getMonth() + 1;
	var day = tomorrow.getDate();
	
	if (("" + month).length == 1) { month = "0" + month; }
	return year +"/" + month +"/"+ day; 
}
