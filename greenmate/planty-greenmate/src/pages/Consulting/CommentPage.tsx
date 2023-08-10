import React, { useState } from 'react';
import CommentPageLayout from 'components/layout/page/Consulting/CommentPageLayout/CommentPageLayout';
import DatePick from 'components/atoms/datepick/DatePick';
import GreenButton from 'components/atoms/common/GreenButton/GreenButton';

function CommentPage() {
	const [toName] = useState('영국남자');
	// const [startDate, setStartDate] = useState<Date | null>(new Date());
	// const [endDate, setEndDate] = useState<Date | null>(new Date());
	const [commentText, setCommentText] = useState('');
	const [startDate] = useState<Date | null>(new Date());
	const [endDate] = useState<Date | null>(new Date());

	const CommentSubmit = () => {
		console.log('Comment Text:', commentText);
		console.log('Start Date:', startDate);
		console.log('End Date:', endDate);
	};
	return (
		<CommentPageLayout>
			{/* 상단텍스트1 */}
			<div>화상 컨설팅이 종료되었습니다.</div>
			{/* 상단텍스트2 */}
			<div>잠깐! 사용자에게 조언을 남겨 주세요</div>
			{/* To.Name */}
			<div>To.{toName}</div>
			{/* 인풋 폼 */}
			<textarea
				name="commentText"
				placeholder="사용자에게 전달할 메시지를 입력하세요."
				value={commentText}
				onChange={(e) => setCommentText(e.target.value)}
			/>
			{/* 하단 텍스트1 */}
			<div>다음 컨설팅은</div>
			{/* 달력 */}
			<div>
				<DatePick /> 부터
				<span style={{ marginLeft: '20px' }}>
					<DatePick /> 사이에 예약하세요 !
				</span>
			</div>
			{/* 버튼 */}
			<GreenButton text="대시보드로 이동" handleClick={CommentSubmit} />
		</CommentPageLayout>
	);
}

export default CommentPage;
