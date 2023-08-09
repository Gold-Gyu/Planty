import React from 'react';
import './GreenButton.scss';
import { useNavigate } from 'react-router-dom'; // useNavigate 가져오기

function GreenButton({ text }: { text: string }) {
	const navigate = useNavigate(); // useNavigate 훅 사용
	const handleClick = () => {
		navigate('/dashboard');
		alert('GreenButton submit 해야 됨 !');
	};

	return (
		<button className="green-button" type="submit" onClick={handleClick}>
			{text}
		</button>
	);
}

export default GreenButton;
