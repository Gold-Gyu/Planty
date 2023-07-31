## 함수형 프로그래밍의 핵심 원칙

함수형 프로그래밍에서는 **각 함수가 한 가지 작업을 제대로 수행하는지 확인하는 데 중점을 두고 작성합니다***!*

### 함수는 하나 이상의 기능을 제공할 수 있습니다.

일반적으로 함수를 작성할 때, 여러 일을 처리하도록 함수를 구성합니다.

```tsx
function getCourseInformation() {
  // 1. API를 호출해 과정 정보를 가져옵니다.
	// 2. 공개된 날짜를 기준으로 최신순으로 과정을 정렬합니다.
	// 3. UI에 과정 목록을 그립니다.
}
```

### 함수는 단 하나의 기능에 집중합니다.

함수형 프로그래밍에서는 함수가 단 하나의 일 처리에 집중합니다.

```tsx
function getCourseInfoQuery() {
  // API를 호출해 과정 정보를 가져옵니다.
}

function sortCourses() {
  // 공개된 날짜를 기준으로 최신순으로 과정을 정렬합니다.
}

function renderCourses() {
  // UI에 과정 목록을 그립니다.
}
```

### 변하지 않는 변수에 대한 함수를 작성합니다.

함수형 프로그래밍은 **변하지 않는 변수(immutable variables)에 대한 함수를 작성하는 것입니다**. 불변 데이터(immutable data)는 생성 이후 변경할 수 없는 데이터를 말합니다.

```jsx
const initialArray = ['c', 'd', 'a', 'e', 'b'];

const sortedArray = sortFunction(initialArray);

// sortedArray = ['a', 'b', 'c', 'd', 'e']
// initialArray = ['c', 'd', 'a', 'e', 'b']
```

- sortFunction은 인수로 전달받은 배열(initialArray)을 변경하지 않습니다.
- 함수는 전달받은 배열의 복사본인 새로운 배열(sortedArray)을 반환합니다.
- 즉, sortFunction은 전달받은 배열 데이터를 변경하지 않습니다.

