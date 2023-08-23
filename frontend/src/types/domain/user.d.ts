export type AccessToken = {
	uid: number;
};

export type SetUserBody = {
	auth: string;
	nickname: string;
	profilePhoto: string;
	shippingAddress: string;
};

export type LoginBody = {
	auth: string;
};

export type IUser = {
	email: string;
	emergencyCount: number;
	joinDate: string;
	photo: null | string;
	shipping_address: null | string;
	userId: string;
	userType: null | string;
	username: string;
};
