import React, { useState } from 'react';
import DatePicker, { registerLocale } from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import './DatePick.scss';
import ko from 'date-fns/locale/ko'; // 한국어 지역 설정을 가져옵니다

// 한국어 지역 설정을 등록합니다
registerLocale('ko', ko);

function DatePick() {
	const [startDate, setStartDate] = useState<Date | null>(new Date());

	return (
		<DatePicker
			dateFormat="yyyy-MM-dd"
			locale="ko" // 한국어로 지역 설정을 적용합니다
			selected={startDate}
			onChange={(date) => setStartDate(date)}
		/>
	);
}

export default DatePick;
