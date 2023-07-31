export function Square({ onSquareClick, children }) {
  return (
    <button 
		type="button"
		className="Square"
		onClick={onSquareClick}
		>
      {children}
    </button>
  );
}
