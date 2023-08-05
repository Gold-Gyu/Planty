import React from 'react';
import InfoListItem from 'components/atoms/common/InfoListItem/InfoListItem';
import Level from 'components/organisms/shop/Level/Level';

/**
 * 구독, 상품 등의 정보를 나타내는 아이템의 모음
 * @param info 정보들을 담고 있는 객체
 */
function InfoList({ info, labels }: { info: object; labels: string[] }) {
	const keys = Object.keys(info);
	const values = Object.values(info);
	const label = labels;
	console.log(label);

	return (
		<div className="info-list-container">
			{keys.map((title, idx) => {
				let content;
				if (title === '난이도') {
					content = <Level level={values[idx]} />;
				} else {
					const value = parseInt(values[idx], 10).toLocaleString();
					content = <span>{values[idx]}</span>;
					if (title === '구독기간') {
						content = <span>{values[idx]} 개월</span>;
					} else if (title === '가격') {
						content = <span>{value} 원</span>;
					}
				}

				return (
					<InfoListItem key={title}>
						<span>{title}</span>
						{content}
					</InfoListItem>
				);
			})}
		</div>
	);
}

export default InfoList;
