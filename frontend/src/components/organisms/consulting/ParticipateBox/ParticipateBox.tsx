import React from 'react';
import './ParticipateBox.scss';
import { ISubscribeDetail } from 'types/dummy';

/**
 * 컨설팅 참여하기 - 클래스 정보 box
 */
function ParticipateBox({ product }: { product: ISubscribeDetail }) {
	return (
		<div className="center">
			<div className="ticketremains-container">
				<div>{product.title}</div>
				<div className="ticketset">
					<img src={product.thumbnail} alt="" />
				</div>
				<div>{product.plantName}</div>
				<div>{product.detailInfo.GMNickname}</div>
				<div>{product.info.consultCount}</div>
				<div>{product.info.consultDate}</div>
			</div>
		</div>
	);
}

export default ParticipateBox;
