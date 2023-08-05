import ListItemTitle from 'components/atoms/common/ListItemTitle/ListItemTitle';
import SubscribeStateBadge from 'components/atoms/subscribe/SubscribeStateBadge/SubscribeStateBadge';
import SubscribeDetailItemLayout from 'components/layout/subscirbe/SubscribeDetailItemLayout/SubscribeDetailItemLayout';
import InfoList from 'components/organisms/common/InfoList/InfoList';
import { SUBSCRIBE_DETAIL_ITEM_LABELS } from 'constants/common/Labels';
import React from 'react';
import { ISubscribeDetail } from 'types/dummy';

function SubscribeDetailItem({ subscribe }: { subscribe: ISubscribeDetail }) {
	return (
		<SubscribeDetailItemLayout>
			{/* 제목 & 구독상태뱃지 */}
			<ListItemTitle title={subscribe.title} url="#" />
			<SubscribeStateBadge stateKey={subscribe.state} />

			{/* 구독 상세 정보 */}
			{/* 이미지 */}
			<img src={subscribe.thumbnail} alt="thumbnail" />
			{/* 작물명 */}
			<h3>{subscribe.plantName}</h3>
			{/* 구독 정보(구독 시작일/종료일, 담당 GM, 영양제수) */}
			<InfoList info={subscribe.detailInfo} labels={SUBSCRIBE_DETAIL_ITEM_LABELS} />
		</SubscribeDetailItemLayout>
	);
}

export default SubscribeDetailItem;