import React from 'react';
import './ConsultingLoadingPageLayout.scss';
import LoadingSpinner from 'components/atoms/consulting/LoadingSpinner/LoadingSpinner';
import useMovePage from 'hooks/useMovePage';
import { ReactComponent as BackIcon } from 'assets/icons/Back.svg';

function ConsultingLoadingPageLayout() {
	const { goBack } = useMovePage();

	const handleGoBack = () => {
		goBack();
	};

	return (
		<div className="loading-page-layout">
			<div className="text">그린메이트와 연결 중이예요</div>
			<LoadingSpinner />
			<div className="btn-wrap">
				<button type="button" onClick={handleGoBack}>
					<BackIcon />
					<p>돌아가기</p>
				</button>
			</div>
		</div>
	);
}

export default ConsultingLoadingPageLayout;
