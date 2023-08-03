import 'react-calendar/dist/Calendar.css';
import React from 'react';
import ChatMessage from 'components/atoms/common/ChatMessage/ChatMessage';

function Develop() {
	return (
		<div>
			<ChatMessage text="안녕하세요. 무엇을 도와드릴까요?" time="16:32" person="you" />
			<ChatMessage text="안녕하세요" time="16:32" person="me" />
		</div>
	);
}

export default Develop;
