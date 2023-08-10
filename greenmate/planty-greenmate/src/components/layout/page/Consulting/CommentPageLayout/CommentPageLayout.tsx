import React, { ReactNode } from 'react';
import './CommentPageLayout.scss';
import PageLayout from 'components/layout/common/PageLayout/PageLayout';

function CommentPageLayout({ children }: { children: ReactNode[] }) {
	return (
		<PageLayout>
			{/* 페이지 헤더 */}
			<div id="comment-container">
				<div id="comment-title">{children[0]}</div>
				<div id="comment-subtitle">{children[1]}</div>
				<div id="comment-content">
					<div id="comment-name">{children[2]}</div>
					<div id="comment-text">{children[3]}</div>
					<div id="comment-footer">{children[4]}</div>
					<div id="comment-subfooter">{children[5]}</div>
					<div id="comment-btn">{children[6]}</div>
				</div>
			</div>
		</PageLayout>
	);
}
export default CommentPageLayout;
