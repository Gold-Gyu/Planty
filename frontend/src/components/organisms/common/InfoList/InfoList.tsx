import React from 'react';
import InfoListItem from 'components/atoms/common/InfoListItem/InfoListItem';
// import { ISubscribe } from 'types/subscribe';
// import { IConsulting, IProduct } from 'types/dummy';
// import Level from 'components/organisms/shop/Level/Level';
/**
 * 구독, 상품 등의 정보를 나타내는 아이템의 모음
 * @param info 정보들을 담고 있는 객체
 */
function InfoList({ subscribe, labels }: { subscribe: string[]; labels: string[] }) {
	// const keys = Object.keys(subscribe);
	// const values = Object.values(subscribe);
	// console.log(labels);
	// console.log(values);
	return (
		<div className="info-list-container">
			{labels.map((title, idx) => (
				<InfoListItem key={title}>
					<div>{title}</div>
					<div>{subscribe[idx]}</div>
				</InfoListItem>
			))}

			{/* {labels.map((title, idx) => {
				let content;
				if (title === '난이도') {
					content = <Level level={values[idx]} />;
				} else {
					const value = parseInt(values[idx], 10);
					if (title === '구독기간') {
						content = <span>{value} 개월</span>;
					} else if (title === '가격') {
						content = <span>{value.toLocaleString()} 원</span>;
					} else {
						content = <span>{values[idx]}</span>;
					}
				}

				return (
					<InfoListItem key={title}>
						<span>{title}</span>
						{content}
					</InfoListItem>
				);
			})} */}
		</div>
	);
}

export default InfoList;
