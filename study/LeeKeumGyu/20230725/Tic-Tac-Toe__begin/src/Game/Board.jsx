import { Square } from "./Square";
import { useState } from "react"

const initialSquares = Array(9).fill(null);

export function Board() {
	// const squares = [...initialSquares];
	const [squares, setSquares] = useState(initialSquares)
	const [isCircleNext, setIsCircleNext] = useState(true)
	const nextPlayer = isCircleNext ? '⚫️' : '🟨';
	
	const squareClick = (squareIndex) => () => {
		console.log(squareIndex)
	}
	
	return (
		<div className="Board">
			<h2 className="Status">플레이어 : {nextPlayer}</h2>
				<div className="Squares">
				{squares.map((square, index) => (
					<Square key={index} onSquareClick={squareClick(index)}>{square}</Square>
				))}
				</div>
		</div>
	);
  }