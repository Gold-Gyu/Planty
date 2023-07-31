# Sass?

- css로 컴파일되는 스타일 시트 확장 언어이자 CSS 전처리기.
- Sass 기반으로 개발 후, css로 익스포트 하는 과정을 거침.

# Scss?

- sass 작성방식 중 하나로 css와 더 유사한 방식.
- .sass와 다르게 중괄호를 사용하는 것이 특징.

# 환경 세팅

- VSCode extension
    - LIve Sass Compiler
- node-sass
    - `npm i node-sass`
- npm scripts 수정 (package.json)
    - 뜻 → scss 파일 안에 있는 style.scss에서 src/style.css로 컴파일 할 수 있도록 설정.(변경 가능)
    
    ```php
    {
    	...
    	"scripts": {
    	    "test": "echo \"Error: no test specified\" && exit 1",
    	    "sass": "node-sass -w -r scss/style.scss src/output.css "
    	}
    }
    ```
    
    - `**npm run sass**` 하면 컴파일 진행됨.
    - **node-sass 옵션 소개**
    
    ```php
    -w
    옵션이 없을 때는 sass파일을 수정할 때마다 sass를 실행합니다. 하지만 -w를 옵션으로 추가하게 되면 **sass가 꺼지지 않고 계속적으로 sass 파일의 변경사항을 감시하면서 저장할 때마다 자동으로 컴파일**을 해줍니다.
    
    -r
    -r은 -w와 같이 감시를 하는데 차이점은 **-w만 추가했을 경우에 메인 파일만 감시하고 그 외에 파일들은 감시하지 않아서 변경을 하지 않습니다. 하지만 -r을 추가할 경우 메인파일에 import한 다른 파일도 함께 감시**합니다.
    ```
    

# 파일분리와 네스팅

## **styles.scss 파일에는 @import와 주석 외에는 다른 코드 작성하지 않기.**


## 파일명 앞에 언더바(_) 붙이는 이유

- Sass에게 해당 파일이 main 파일의 일부분이라고 알려주기 위해서.
    - 언더바를 안붙이면 분할된 파일들 모두가 컴파일되어 여러개의 .css 파일이 나눠서 저장됨.
    - main 파일의 일부분이란 것을 알려주면, 해당 파일은 css파일로 컴파일 하지 않고, 내부에서 @import 형태로 작동.

## Sass에서의 import

- css에서는 import 시 파일 URL을 적어줘야 함.
- Sass에서는 import 시 확장명을 제외하고 파일명만 사용 가능.

## 중첩(Nesting)

### **중첩을 쓰는 이유는, 최상위 선택자 반복선언을 막기 위해서. + 가독성**

```scss
//Scss
//Scss에서도 HTML처럼 계층구조로 스타일을 적용할 수 있다.
nav{
	background : #C39BD3;
	padding : 10px;
	height: 50px;
	ul{
		display: flex;
		list-style : none;
		justify-content: flex-end;
		li{
			color: white;
			margin-right: 10px;
		} 
	}
}

//Scss

info-list {
  div {
    display: flex;
    font-size: 14px;
    color: #4f4f4f;
    dt {
      font-weight: 700;
      margin-right: 7px;
    }
  }
}
// 중첩을 사용하여 부모선택자를 한번만 사용한다.
// 그리고 코드를 봤을 때 info-list div tag안에 dt가 들어있음을 한눈에 알아볼 수 있다
```

### **속성 Nesting도 가능.**

```scss
//Scss
.add-icon {
  background : {
    image: url("./assets/arrow-right-solid.svg");
    position: center center;
    repeat: no-repeat;
    size: 14px 14px;
  }
}
```

### 부모선택자 (&)

```scss
//Scss
.box {
	&:focus{} // 가상선택자
	&:hover{}
  &:active{}
	&:first-child{} 
  &:nth-child(2){}
	&::after{} // 가상요소
	&::before{} 
}

/*CSS*/
.box:focus{} /* 가상선택자 */
.box:hover{}
.box:active{}
.box:frist-child{}
.box:nth-child(2){}
.box::after{} /* 가상요소 */
.box::before{}

//Scss example
ul {
  li {
    &:hover {
      background: white;
      cursor: pointer;
			// 가상요소 
    }
    &:last-child {
      border-bottom: 2px solid black;
			// 가상클래스 
    }
  }
}
//li 태그의 가상요소와 가상클래스에게 스타일을 적용한 예시 
//&을 사용하여 li와 :hover, :last-child를 연결

//Scss example2
.box {
  &-yellow {
    background: #ff6347;
  }
  &-red {
    background: #ffd700;
  }
  &-green {
    background: #9acd32;
  }
}
//.box라는 이름이 같기 때문에 &를 사용해 중첩구조로 만들 수 있다
```

### @at-root

- 굳이?
- 사용 예(scss vs css)
    
    ```scss
    //Scss
    .article {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 10px;
      .article-content {
        font-size: 14px;
        opacity: 0.7;
        @at-root i {
          opacity: 0.5;
        }
      }
    }
    ```
    
    ```scss
    /*CSS*/
    .article {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 10px;
    }
    .article .article-content {
      font-size: 14px;
      opacity: 0.7;
    }
    /*중첩을 빠져나온 것을 확인할 수 있다.*/
    i { 
      opacity: 0.5;
    }
    ```