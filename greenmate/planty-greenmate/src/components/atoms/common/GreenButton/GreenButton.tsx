import React from 'react';
import './GreenButton.scss';

/** 기본 버튼
 * @param text 버튼에 들어갈 텍스트
 * @param handleClick 버튼을 클릭했을 때의 동작
 */
function GreenButton({ text, handleClick }: { text: string; handleClick: () => void }) {
	return (
		<button type="button" className="greenbutton" onClick={handleClick}>
			{text}
		</button>
	);
}

export default GreenButton;
