import React, { useState } from 'react';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import './datePick.scss';
import DateImg from './assets/icons/DatePick.svg'; // Adjust the path based on your project structure

function DatePick() {
	const [startDate, setStartDate] = useState<Date | null>(new Date());

	return (
		<div>
			<DatePicker dateFormat="yyyy-MM-dd" selected={startDate} onChange={(date) => setStartDate(date)} />
			<img src={DateImg} alt="Date Picker" /> {/* Use the imported image */}
		</div>
	);
}

export default DatePick;
