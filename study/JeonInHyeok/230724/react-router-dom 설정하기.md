# react-router-dom v6 설정하기

- 설치 → 명령어 실행
    
    `npm i react-router-dom @types/react-router-dom`
    
    - react-router-dom : v6.14.2
    - @types/react-router-dom : v5.3.3

# AppRouter.tsx 생성 및 코드 작성

- 프로젝트 src 폴더 내에 AppRouter.tsx 생성

```jsx
import Navigation from 'components/layout/Navigation'; // 원하는 경로에 네비게이션 컴포넌트 만들어서 import 
import HomePage from 'pages/Home/HomePage'; // 원하는 경로에 페이지 컴포넌트 만들어서 import 
import React from 'react';
import { BrowserRouter, Route, Routes, Navigate } from 'react-router-dom';

function AppRouter() {
	return (
		<BrowserRouter>
			<Navigation />
			<Routes>
				<Route path="/" element={<Navigate replace to="/home" />} />
				<Route path="/home" element={<HomePage />} />
			</Routes>
		</BrowserRouter>
	);
}

export default AppRouter;
```

# App.tsx 수정

- AppRouter의 코드를 직접 return 문에 작성해줘도 되지만, 관심사에 따라 분리하기도 함.

```jsx
import AppRouter from 'AppRouter'; // import문 추가
import React from 'react';

function App() {
	return <AppRouter />; // 추가
}

export default App;
```