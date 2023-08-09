import React, { ReactNode } from 'react';
import './CommentPageLayout.scss';
import PageLayout from 'components/layout/common/PageLayout/PageLayout';

function CommentPageLayout({ children }: { children: ReactNode[] }) {
	return (
		<PageLayout>
			{/* 페이지 헤더 */}
			<div>{children[0]}</div>
			{/* 응급실 서비스 box */}
			<div>
				<div>{children[1]}</div>
				{/* 장비확인 text */}
				<div>{children[4]}</div>
				{/* 참여하기버튼 */}
				{/* <div id="loading-img">{children[3]}</div> */}
				<div>{children[6]}</div>
				<div>{children[7]}</div>
			</div>
		</PageLayout>
	);
}
export default CommentPageLayout;
