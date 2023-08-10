import React from 'react';
import SubscribeItemLayout from 'components/layout/subscirbe/SubscribeListItemLayout/SubscribeListItemLayout';
import ListItemTitle from 'components/atoms/common/ListItemTitle/ListItemTitle';
import SubscribeStateBadge from 'components/atoms/subscribe/SubscribeStateBadge/SubscribeStateBadge';
import Button from 'components/atoms/common/Button/Button';
import InfoList from 'components/organisms/common/InfoList/InfoList';
import { SUBSCRIBE_LIST_ITEM_LABELS } from 'constants/common/Labels';
import { ISubscribe } from 'types/subscribe';

/**
 * 구독 목록 아이템
 * @param subscribe 구독 정보 1건
 */
function SubscribeListItem({ subscribe }: { subscribe: ISubscribe }) {
	const testFunc = () => {
		alert('클릭');
	};
	// console.log('zz', subscribe);
	// console.log(MySubscribeList);
	const MySubscribeList = [
		subscribe.startDate,
		`총 ${subscribe.info.consultingCnt}회 / 잔여 ${subscribe.info.consultingRemainCnt} 회`,
		subscribe.info.consultingDate,
	];
	return (
		<SubscribeItemLayout>
			<ListItemTitle title={subscribe.title} url={`/subscribe/${subscribe.sid}`} />
			<SubscribeStateBadge stateKey={subscribe.state} />
			<img src={subscribe.thumbnail} alt="" />
			<InfoList subscribe={MySubscribeList} labels={SUBSCRIBE_LIST_ITEM_LABELS} />
			<Button isActive={false} text="컨설팅 이용하기" handleClick={testFunc} />
		</SubscribeItemLayout>
	);
}

export default SubscribeListItem;
