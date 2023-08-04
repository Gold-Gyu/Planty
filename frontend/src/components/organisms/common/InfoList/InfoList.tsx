import React from 'react';
import InfoListItem from 'components/atoms/common/InfoListItem/InfoListItem';
import Level from 'components/organisms/shop/Level/Level';
/**
 * 구독, 상품 등의 정보를 나타내는 아이템의 모음
 * @param info 정보들을 담고 있는 객체
 */
function InfoList({ info }: { info: object }) {
	const keys = Object.keys(info);
	const values = Object.values(info);
	const period = info;
	console.log(period);
	console.log(keys);
	console.log(values);

	return (
		<div className="info-list-container">
			{keys.map((title, idx) => (
				<InfoListItem key={title}>
					<span>{title}</span>
					{title === 'level' ? <Level level={values[idx]} /> : <span>{values[idx]}</span>}
				</InfoListItem>
			))}
		</div>
	);
}

export default InfoList;
