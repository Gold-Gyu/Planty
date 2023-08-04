import React from 'react';
import './price.scss';
import PurchaseButton from 'components/atoms/common/PurchaseButton/PurchaseButton';

// interface

function Price() {
	return (
		<div className="price-final-box">
			<div className="price">20,000원</div>
			<PurchaseButton />
		</div>
	);
}

export default Price;
