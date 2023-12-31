import { SetterOrUpdater, useRecoilState } from 'recoil';
import userState from 'recoil/user';
import { IUser } from 'types/domain/user';

const useUser = (): [IUser | null, SetterOrUpdater<IUser | null>] => {
	const [user, setUser] = useRecoilState(userState);

	return [user, setUser];
};

export default useUser;
