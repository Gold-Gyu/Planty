import React, { useState } from 'react';
import AreaTitle from 'components/atoms/common/AreaTitle/AreaTitle';
import ShopPageLayout from 'components/layout/Page/ShopPageLayout/ShopPageLayout';
import PageTitle from 'components/atoms/common/PageTitle/PageTitle';
import ShopIcon from 'assets/icons/pageTitle/ShoppingBag.svg';
import ProductListItem from 'components/organisms/shop/ProductListItem/ProductListItem';
// import FilterToggle from 'components/atoms/common/FilterToggle/FilterToggle';
import { dummyProduct } from 'dummy';
import FilterToggleBar from 'components/organisms/shop/FilterToggleBar/FilterToggleBar';

function ShopPage() {
	// dummyProduct의 길이를 사용하여 리스트를 생성 즉, 데이터 갯수만큼
	const productList = Array.from(Array(dummyProduct.length), (_, index) => (
		<ProductListItem key={index} product={dummyProduct[index]} />
	));
	const [isActive, setIsActive] = useState(true);

	const toggleActive = () => {
		setIsActive(!isActive);
	};

	return (
		<ShopPageLayout>
			<PageTitle icon={ShopIcon} text="구독샵" />
			<FilterToggleBar clickFunc={toggleActive} />
			<AreaTitle title="구독 상품 목록" url="#" />
			{productList}
		</ShopPageLayout>
	);
}

export default ShopPage;
