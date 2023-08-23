import React from 'react';
import { CredentialResponse, GoogleLogin } from '@react-oauth/google';
import { socialLoginApi } from 'utils/api/auth';
import LocalStorage from 'constants/storage/LocalStorage';

function GoogleLoginButton() {
	const onSuccess = async (res: CredentialResponse) => {
		try {
			const response = await socialLoginApi(res);
			if (response.status === 200) {
				LocalStorage.setItem('AccessToken', response.data.jwtToken);
				window.location.href = '/';
			}
		} catch (error) {
			console.error(error);
		}
	};

	const onError = () => {
		console.log('error');
	};
	return <GoogleLogin width="400px" logo_alignment="center" onSuccess={onSuccess} onError={onError} />;
}

export default GoogleLoginButton;
