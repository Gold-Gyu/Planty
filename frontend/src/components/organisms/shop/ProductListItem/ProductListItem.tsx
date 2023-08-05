import React from 'react';
import ProductListItemLayout from 'components/layout/shop/ProductListItemLayout/ProductListItemLayout';
import ListItemTitle from 'components/atoms/common/ListItemTitle/ListItemTitle';
import Button from 'components/atoms/common/Button/Button';
import InfoList from 'components/organisms/common/InfoList/InfoList';
import { IProduct } from 'types/dummy';
import { PRODUCT_LIST_ITEM_LABELS } from 'constants/common/Labels';

/**
 * 구독샵 상품 목록 아이템의 모음
 * @param product 상품 정보들을 담고 있는 객체
 */
function ProductListItem({ product }: { product: IProduct }) {
	const testFunc = () => {
		alert('클릭');
	};

	return (
		<ProductListItemLayout>
			<ListItemTitle title={product.title} url={`detail/${product.pid}`} />
			<img src={product.thumbnail} alt="" style={{ width: '100%', height: '120px' }} />
			<InfoList info={product.info} labels={PRODUCT_LIST_ITEM_LABELS} />
			<Button isActive={false} text="구매하기" handleClick={testFunc} />
		</ProductListItemLayout>
	);
}

export default ProductListItem;
