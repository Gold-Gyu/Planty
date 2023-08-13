import React from 'react';
import './SubscribesList.scss';
import useAllSubscribe from 'hooks/api/useAllSubscribe';
import SubscribesListItem from 'components/atoms/subscribes/SubscribesListItem/SubscribesListItem';
import useMovePage from 'hooks/useMovePage';
import { useLocation } from 'react-router-dom';

function SubscribesList() {
	const subscribes = useAllSubscribe();
	const { movePage } = useMovePage();
	const pathname = useLocation().pathname.split('/')[1];

	const handleClick = (sid: number) => {
		if (pathname === 'history') {
			return movePage(`/admin/history/consulting/${sid}`);
		}
		return movePage(`/admin/subscribes/list/${sid}`);
	};

	if (subscribes.length) {
		console.log('subscribes', subscribes);
		return (
			<div className="subscribes-list-container">
				{subscribes.map((s) => (
					<SubscribesListItem key={s.sid} subscribe={s} handleClick={() => handleClick(s.sid)} />
				))}
			</div>
		);
	}

	return (
		<div className="subscribes-list-container no-content">
			<div>현재 관리중인 구독상품이 없습니다.</div>
		</div>
	);
}

/*
			<SubscribesListItem
				subscribe={{
					title: '토마토 클래스',
					sid: 1,
					thumbnail: '',
					startDate: '2023-05-03',
					endDate: '2023-06-03',
					subscriberCnt: 7,
				}}
				handleClick={() => movePage('1')}
			/>
			<SubscribesListItem
				subscribe={{
					title: '토마토 클래스',
					sid: 3,
					thumbnail: '',
					startDate: '2023-05-03',
					endDate: '2023-06-03',
					subscriberCnt: 7,
				}}
				handleClick={() => movePage('3')}
			/>
*/
export default SubscribesList;
