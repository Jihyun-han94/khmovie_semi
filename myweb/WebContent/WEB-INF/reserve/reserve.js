// selectSeat.jsp 가 산만해서 selectSeat.jsp 에서만 사용되는 스크립트지만 우선 따로 js파일로 빼둠.
function reserve() {	
	let seats = document.seat.seatNum;
	let check = false;
	for(let i = 0; i < seats.length; i++) {
		if(seats[i].checked) {
			check = true;
			break;
		}
	}
	if(check == false) {
		alert('좌석을 선택해 주세요!');
	}
}