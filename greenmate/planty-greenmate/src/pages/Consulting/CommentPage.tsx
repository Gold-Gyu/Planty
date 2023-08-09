import React from 'react';
// import Header from 'components/organisms/common/Header/Header';
// import LoadingImg from 'components/atoms/consulting/LoadingImg/LoadingImg';
import CommentPageLayout from 'components/layout/page/Consulting/CommentPageLayout/CommentPageLayout';
import GreenButton from 'components/atoms/button/GreenButton';
import DatePick from 'components/atoms/datePick/datePick';

function CommentPage() {
	return (
		<CommentPageLayout>
			{/* 로고 */}
			<div>화상 컨설팅이 종료되었습니다.</div>
			{/* 상단텍스트1 */}
			<div>잠깐! 사용자에게 조언을 남겨 주세요</div>
			{/* 상단텍스트2 */}
			<div>To.영국남자</div>
			{/* 인풋 폼 */}
			<div>인풋 폼</div>
			{/* 하단 텍스트 */}
			{/* <div>다음 컨설팅은 부터</div> */}
			<div>
				<DatePick />
				부터 <DatePick /> 캘린더 사이에 예약하세요 !
			</div>
			{/* 하단 버튼 */}
			<GreenButton text="대시보드로 이동" />
		</CommentPageLayout>
	);
}

export default CommentPage;
