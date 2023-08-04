import React from 'react';
import './price.scss';
import PurchaseButton from 'components/atoms/common/PurchaseButton/PurchaseButton';
import { IProductDetail } from 'types/dummy';
// interface

function Price({ product }: { product: IProductDetail }) {
	return (
		<div className="price-final-box">
			<div className="price">{product.info.price}원</div>
			<PurchaseButton />
		</div>
	);
}

export default Price;
