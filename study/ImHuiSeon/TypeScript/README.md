### ※ **클래스 사용 이유**

> 인스턴스를 만들어서 필요한 정보를 저장해뒀다가 계속 재활용해서 쓸 수 있다는 장점이 있기 때문이다.
> 
> 또한, 인스턴스를 여러 개 만들 수 있다는 것도 장점이다.

&nbsp;

# 01. 공통 요소 추출

> 인스턴스를 처음 만들 때만 **필요한 코드만 남겨두고, 나머지 코드들은 해당하는 목적의 메소드들로 분류**해 둔다.
> 
> 즉, **같은 목적을 위해서 작동되는 코드를 묶는 작업**을 하는 것이다.

## 1-1. 제일 중요한 UI 함수부터 변경

### function newsFeed → class NewsFeedView

1. `NewsFeedView` 클래스를 만들고, 생성자를 만든다.
2. 생성자에는 `newsFeed` 함수의 내용을 똑같이 가져온다.
3. 인스턴스를 만들기 위한 코드는 생성자에 남기고, 나머지 코드는 추출하여 메소드로 만든다.
    
    인스턴스의 UI가 언제 업데이트 될지 불분명하기 때문에, 페이지 UI를 업데이트하는 부분을 함수로 분리 시킨다.
    
    ※ 라우터를 통해 함수가 불려질 때 UI가 업데이트 된다.
    
    보통 UI를 업데이트 시키는 함수는 render라는 이름을 사용한다. render라는 이름의 함수를 만들고, UI를 업데이트 시키는 부분을 함수로 분리한다.
    
    ```tsx
    class NewsFeedView {
      constructor() {
        let api = new NewsFeedApi(NEWS_URL);
        let newsFeed: NewsFeed[] = store.feeds;
    
        // 템플릿
        let template = `
          <div class="bg-gray-600 min-h-screen">
            <div class="bg-white text-xl">
              <div class="mx-auto px-4">
                <div class="flex justify-between items-center py-6">
                  <div class="flex justify-start">
                    <h1 class="font-extrabold">Hacker News</h1>
                  </div>
                  <div class="items-center justify-end">
                    <a href="#/page/{{__prev_page__}}" class="text-gray-500">
                      Previous
                    </a>
                    <a href="#/page/{{__next_page__}}" class="text-gray-500 ml-4">
                      Next
                    </a>
                  </div>
                </div> 
              </div>
            </div>
            <div class="p-4 text-2xl text-gray-700">
              {{__news_feed__}}        
            </div>
          </div>
        `;
    
        if(newsFeed.length === 0) {
          newsFeed = store.feeds = makeFeeds(api.getData());
        }
      }
    
      // 페이지대로 목록 불러오기 : 함수로 분리
      render(): void {
        const newsList: string[] = [];
    
        for(let i = (store.currentPage - 1) * 10; i < store.currentPage * 10; i++) {
          newsList.push(`
            <div class="p-6 ${newsFeed[i].read ? 'bg-red-500' : 'bg-white'} mt-6 rounded-lg shadow-md transition-colors duration-500 hover:bg-green-100">
              <div class="flex">
                <div class="flex-auto">
                  <a href="#/show/${newsFeed[i].id}">${newsFeed[i].title}</a>  
                </div>
                <div class="text-center text-sm">
                  <div class="w-10 text-white bg-green-300 rounded-lg px-0 py-2">${newsFeed[i].comments_count}</div>
                </div>
              </div>
              <div class="flex mt-3">
                <div class="grid grid-cols-3 text-sm text-gray-500">
                  <div><i class="fas fa-user mr-1"></i>${newsFeed[i].user}</div>
                  <div><i class="fas fa-heart mr-1"></i>${newsFeed[i].points}</div>
                  <div><i class="far fa-clock mr-1"></i>${newsFeed[i].time_ago}</div>
                </div>  
              </div>
            </div>    
          `);
        }
    
        template = template.replace('{{__news_feed__}}', newsList.join(''));
        template = template.replace('{{__prev_page__}}', String(store.currentPage > 1 ? store.currentPage - 1 : 1));
        template = template.replace('{{__next_page__}}', String(store.lastPage <= store.currentPage ? store.currentPage : store.currentPage + 1));
    
        updateView(template);
      }
    }
    ```
    
4. `NewsFeedView` 클래스에서만 사용하는 `class` 외부 함수를 `class` 내부 함수로 만들어 준다.
    
    ```tsx
    class NewsFeedView {
      constructor() {
        ...
      }
    
      // 페이지대로 목록 불러오기 : 함수로 분리
      render(): void {
        ...
      }
    
      // 읽었는지 안 읽었는지 체크 : 해당 newsFeedView에서만 사용되는 코드이므로 class에 넣어준다(같은 목적을 가짐).
      makeFeeds(feeds: NewsFeed[]): NewsFeed[] {
        store.lastPage = Math.ceil(feeds.length / 10);
    
        for(let i = 0; i < feeds.length; i++) {
          feeds[i].read = false;
        }
    
        return feeds;
      }
    }
    ```


### function newsDetail → class NewsDetailView

1. `NewsDetailView` 클래스를 만들고, 생성자를 선언한다.
2. 생성자에는 `template`만 남는다.
    
    라우터가 호출할 때가 `newsDeatil` 인스턴스의 생성 시점이다. 라우터가 호출을 해야 `id`가 결정 되고 UI를 그릴 수 있기 때문이다.
    
    ```tsx
    class NewsDetailView extends View {
      constructor() {
        // 템플릿
        let template = `
          <div class="bg-gray-600 min-h-screen pb-8">
            <div class="bg-white text-xl">
              <div class="mx-auto px-4">
                <div class="flex justify-between items-center py-6">
                  <div class="flex justify-start">
                    <h1 class="font-extrabold">Hacker News</h1>
                  </div>
                  <div class="items-center justify-end">
                    <a href="#/page/${store.currentPage}" class="text-gray-500">
                      <i class="fa fa-times"></i>
                    </a>
                  </div>
                </div>
              </div>
            </div>
    
            <div class="h-full border rounded-xl bg-white m-6 p-4 ">
              <h2>${newsDetail.title}</h2>
              <div class="text-gray-400 h-20">
                ${newsDetail.content}
                <a href="${newsDetail.url}" target="_blank">URL</a>
              </div>
    
              {{__comments__}}
    
            </div>
          </div>
        `;
      }
    }
    ```
    
3. 나머지 코드는 함수로 추출한다.
    
    ```tsx
    class NewsDetailView extends View {
      constructor() {
        ...
      }
    
      render(): void {
        const id = location.hash.substr(7);
        const api = new NewsDetailApi(CONTENT_URL.replace('@id', id));
        const newsDetail: NewsDetail = api.getData();
    
        for(let i = 0; i < store.feeds.length; i++) {
          if(store.feeds[i].id === Number(id)) {
            store.feeds[i].read = true;
            break;
          }
        }
        
        updateView(template.replace('{{__comments__}}', makeComment(newsDetail.comments)));
      }
    
      makeComment(comments: NewsComment[]): string {
        const commentString = [];
      
        for(let i = 0; i < comments.length; i++) {
          const comment: NewsComment = comments[i];
      
          commentString.push(`
            <div style="padding-left: ${comment.level * 40}px;" class="mt-4">
              <div class="text-gray-400">
                <i class="fa fa-sort-up mr-2"></i>
                <strong>${comment.user}</strong> ${comment.time_ago}
              </div>
              <p class="text-gray-700">${comment.content}</p>
            </div>      
          `);
      
          // 댓글의 댓글이 0개가 아니라면 함수 재귀 호출.
          if(comment.comments.length > 0) {
            commentString.push(makeComment(comment.comments));
          }
        }
      
        return commentString.join('');
      }
    }
    ```

&nbsp;

## 1-2. 부모 클래스 View 생성 및 extends

1. 비슷한 구조를 가진 `NewsFeedView`와 `NewsDetailView`의 공통 부분을 추출하여 부모 클래스 `View`를 만든다.
    
    두 클래스에 모두 쓰이는 변수(`template`)와 함수(`function updateView`)를 상위 클래스에 넣어준다.
    
    `updateView` 함수에서 container 정보를 가지고 있어야 하므로 container 속성을 추가한다.
    
    ```tsx
    **// NewsFeedView와 NewsDetailView의 공통 부분을 추출하여 만든 클래스
    class View {
      template: string;
      container: HTMLElement;
    
      constructor(containerId: string, template: string) {
        const containerElement = document.getElementById(containerId);
        
        if(!containerElement) {
          // root가 없다는 뜻, UI가 만들어지지 못하므로 종료.
          throw '최상위 컨테이너가 없어 UI를 진행하지 못합니다.';
        }
    
        this.container = containerElement;
        this.template = template;
      }
    
      updateView(html: string): void {
        this.container.innerHTML = html;
      }
    }**
    ```
    
2. 하위 클래스에 상위 클래스가 상속되면, 하위 클래스에서는 super 키워드를 사용하여 반드시 상위 class의 생성자를 명시적으로 호출해 주어야 한다.
    - 생성자에 필요한 매개변수(`containerId`, `template`)를 제공한다.
    - 또한 `NewsFeedView` 인스턴스에 기본적으로 저장되어 있어야 할 데이터인 `api`와 `newsFeed` 속성을 만든다.
    - 내부 함수인 `makeFeeds`는 인자를 받을 필요 없이 바로 데이터를 참조할 수 있으므로 함수 구조를 변경한다.
    - `NewsDetailView` 클래스도 동일하게 작업해준다.
    
    ```tsx
    class NewsFeedView extends View {
      api: NewsFeedApi;
      feeds: NewsFeed[];
    
      constructor(containerId: string) {
        // 템플릿
        let template = `
          ...
        `;
    
        super(containerId, template);
    
        this.api = new NewsFeedApi(NEWS_URL);
        this.feeds = store.feeds;
    
        if(this.feeds.length === 0) {
          this.feeds = store.feeds = this.api.getData();
          this.makeFeeds();
        }
      }
    
      // 페이지대로 목록 불러오기 : 함수로 분리
      render(): void {
        ...
      }
    
      // 읽었는지 안 읽었는지 체크 : 해당 newsFeedView에서만 사용되는 코드이므로 class에 넣어준다(같은 목적을 가짐).
      **makeFeeds(): void {
        store.lastPage = Math.ceil(this.feeds.length / 10);
    
        for(let i = 0; i < this.feeds.length; i++) {
          this.feeds[i].read = false;
        }
      }**
    }
    ```
    
    ```tsx
    class NewsDetailView extends View {
      **constructor(containerId: string) {
        // 템플릿
        let template = `
          ...
        `;
    
        super(containerId, template);
      }**
    
      render(): void {
        ...
      }
    
      makeComment(comments: NewsComment[]): string {
        ...
      }
    }
    ```
    
3. `NewsFeedView`와 `NewsDetailView` 클래스에 공통적으로 있는, `render`() 함수의 일부를 `View` 클래스에서 구현한다.
    
    `render` 함수의 패턴을 보면, 빈 문자열 배열이 등장하고 반복문을 이용해 html을 추가하고 join을 이용하여 하나로 합친다. 이와 동일하게 `View` 클래스에 속성을 만들어주면 된다.
    
    ```tsx
    class View {
      template: string;
      container: HTMLElement;
      htmlList: string[];
    
      constructor(containerId: string, template: string) {
        ...
        this.htmlList = [];
      }
    
      ...
    
      addHtml(htmlString: string): void {
        this.htmlList.push(htmlString);
      }
    
    	getHtml(): string {
        return this.htmlList.join('');
      }**
    }
    ```
    
4. 변경 사항에 맞게 하위 클래스를 수정한다.
    
    ```tsx
    class NewsFeedView extends View {
      api: NewsFeedApi;
      feeds: NewsFeed[];
    
      constructor(containerId: string) {
        ...
      }
    
      // 페이지대로 목록 불러오기 : 함수로 분리
      render(): void {
        for(let i = (store.currentPage - 1) * 10; i < store.currentPage * 10; i++) {
          this.addHtml(`
            <div class="p-6 ${this.feeds[i].read ? 'bg-red-500' : 'bg-white'} mt-6 rounded-lg shadow-md transition-colors duration-500 hover:bg-green-100">
              <div class="flex">
                <div class="flex-auto">
                  <a href="#/show/${this.feeds[i].id}">${this.feeds[i].title}</a>  
                </div>
                <div class="text-center text-sm">
                  <div class="w-10 text-white bg-green-300 rounded-lg px-0 py-2">${this.feeds[i].comments_count}</div>
                </div>
              </div>
              <div class="flex mt-3">
                <div class="grid grid-cols-3 text-sm text-gray-500">
                  <div><i class="fas fa-user mr-1"></i>${this.feeds[i].user}</div>
                  <div><i class="fas fa-heart mr-1"></i>${this.feeds[i].points}</div>
                  <div><i class="far fa-clock mr-1"></i>${this.feeds[i].time_ago}</div>
                </div>  
              </div>
            </div>    
          `);
        }
    
        template = template.replace('{{__news_feed__}}', this.getHtml());
        template = template.replace('{{__prev_page__}}', String(store.currentPage > 1 ? store.currentPage - 1 : 1));
        template = template.replace('{{__next_page__}}', String(store.lastPage <= store.currentPage ? store.currentPage : store.currentPage + 1));
    
        this.updateView(template);
      }
    
      // 읽었는지 안 읽었는지 체크 : 해당 newsFeedView에서만 사용되는 코드이므로 class에 넣어준다(같은 목적을 가짐).
      makeFeeds(): void {
        store.lastPage = Math.ceil(this.feeds.length / 10);
    
        for(let i = 0; i < this.feeds.length; i++) {
          this.feeds[i].read = false;
        }
      }
    }
    ```
    
5. 다음으로 `render` 함수에서 반복되고 있는 `template` 속성을 수정해준다.
    
    두 가지 하위 클래스 모두 아래와 같은 형식으로 `template`을 바꾸는 부분이 사용된다.
    
    ```tsx
    template.replace('{{__key__}}', value);
    ```
    
    상위 클래스인 View 클래스에 함수로 구현한다.
    
    ```tsx
    class View {
      ...
    
      **setTemplateData(key: string, value: string): void {
        this.template = this.template.replace(`{{__${key}__}}`, value);
      }**
    }
    ```
    
6. `NewsFeedView` 클래스의 `render` 함수를 수정한다.
    
    ```tsx
    class NewsFeedView extends View {
      ...
    
      render(): void {
        for(let i = (store.currentPage - 1) * 10; i < store.currentPage * 10; i++) {
          ...
        }
    
        **this.setTemplateData('news_feed', this.getHtml());
        this.setTemplateData('prev_page', String(store.currentPage > 1 ? store.currentPage - 1 : 1));
        this.setTemplateData('next_page', String(store.lastPage <= store.currentPage ? store.currentPage : store.currentPage + 1));**
    
        this.updateView(this.template);
      }
    
      ...
    }
    ```
    
7. `NewsDetailView` 클래스의 `render` 함수를 수정한다.
    
    생성자의 `template` 변수에 직접 들어가 있는 `${value}` 변수 코드도 `{{__key__}}` 형식으로 변경해준다.
    
    ```tsx
    class NewsDetailView extends View {
      constructor(containerId: string) {
        // 템플릿
        let template = `
          <div class="bg-gray-600 min-h-screen pb-8">
            <div class="bg-white text-xl">
              <div class="mx-auto px-4">
                <div class="flex justify-between items-center py-6">
                  <div class="flex justify-start">
                    <h1 class="font-extrabold">Hacker News</h1>
                  </div>
                  <div class="items-center justify-end">
                    <a href="#/page/**{{__currentPage__}}**" class="text-gray-500">
                      <i class="fa fa-times"></i>
                    </a>
                  </div>
                </div>
              </div>
            </div>
    
            <div class="h-full border rounded-xl bg-white m-6 p-4 ">
              <h2>**{{__title__}}**</h2>
              <div class="text-gray-400 h-20">
              **{{__content__}}**
                <a href="**{{__url__}}**" target="_blank">URL</a>
              </div>
    
              {{__comments__}}
    
            </div>
          </div>
        `;
    
        super(containerId, template);
      }
    
      render(): void {
        ...
        
        **this.setTemplateData('comments', this.makeComment(newsDetail.comments));
        this.setTemplateData('currentPage', String(store.currentPage));
        this.setTemplateData('title', newsDetail.title);
        this.setTemplateData('content', newsDetail.content);
        this.setTemplateData('url', newsDetail.url);**
        
        this.updateView(this.template);
      }
    
      ...
    }
    ```
    
8. `updateView` 함수에서는 인자로 들어오는 값을 `innerHtml`에 넣어주는데, 해당 함수가 쓰인 곳을 보면 인자로 들어오는 값이 모두 `this.template`이다. 그래서 인자를 없애고 `this.template`을 값으로 직접 넣어준다.
    
    (이해는 되지만 말로 못 하겠네...)
    
    원본(보여지고 있는) `template`과 `replace`한 `template`(보여질)이 항상 동일하다. 즉, key를 바꿀 수 없어서 `template`이 업데이트 되지 않는다.
    
    `template`이 변경되려면 원본 `template`과 변경될 `template` 두 가지가 필요하다.
    
    `View` 클래스에 `replace`되는(업데이트 되는) `template` 속성을 추가한다.
    
    뷰가 업데이트 되면, `renderTemplate`는 다시 원본(업데이트된 `template`)을 가지고 있어야 한다.
    
    ```tsx
    class View {
    	...
      renderTemplate: string;
    
      constructor(containerId: string, template: string) {
        ...
    
        this.renderTemplate = template;
      }
    
      updateView(): void {
        this.container.innerHTML = this.renderTemplate;
    		this.renderTemplate = this.template;
      }
    
    	...
    
      setTemplateData(key: string, value: string): void {
        this.renderTemplate = this.renderTemplate.replace(`{{__${key}__}}`, value);
      }
    }
    ```
    
9. View 클래스의 getHtml에서 htmlList 배열을 초기화한 적이 없어서 이전 데이터가 누적된다.
    
    return 전에 초기화 한다.
    
    ```tsx
    getHtml(): string {
        const snapshot = this.htmlList.join('');
        this.htmlList = [];
        return snapshot;
      }
    ```
    
    하지만 초기화하는 코드가 자주 사용될 가능성이 높으므로 리스트를 직접 초기화 해주는 것은 좋지 않다. 따로 함수를 생성한다.
    
    ```tsx
    getHtml(): string {
      const snapshot = this.htmlList.join('');
      **this.clearHtmlList();**
      return snapshot;
    }
    
    **clearHtmlList(): void {
      this.htmlList = [];
    }**
    ```

# 02. 구조 분해 할당

`NewsFeedView` 클래스의 `render` 함수에서 `newsFeed[i]`가 반복되고 있다.

`newsFeed[i]`는 `this.feeds[i]`와 같으므로 변경해준다. 이때, `this.feeds[i].id` 이런식으로 사용하게 되면 `this.feeds[i]`가 반복되므로, 구조 분해 할당을 이용하여 각 속성명만 사용하도록 정의한다.

`this.feeds[i]` 각각의 속성명과 동일한 변수명을 사용하면 자동적으로 동일한 이름에 해당 값이 저장되어 분해할 수 있다. ES5 이후 생겨난 문법이다.

```tsx
class NewsFeedView extends View {
  ...

  // 페이지대로 목록 불러오기 : 함수로 분리
  render(): void {
    for(let i = (store.currentPage - 1) * 10; i < store.currentPage * 10; i++) {
      **const { id, title, comments_count, user, points, time_ago, read } = this.feeds[i];**
      
      this.addHtml(`
        <div class="p-6 ${**read** ? 'bg-red-500' : 'bg-white'} mt-6 rounded-lg shadow-md transition-colors duration-500 hover:bg-green-100">
          <div class="flex">
            <div class="flex-auto">
              <a href="#/show/${**id**}">${**title**}</a>  
            </div>
            <div class="text-center text-sm">
              <div class="w-10 text-white bg-green-300 rounded-lg px-0 py-2">${**comments_count**}</div>
            </div>
          </div>
          <div class="flex mt-3">
            <div class="grid grid-cols-3 text-sm text-gray-500">
              <div><i class="fas fa-user mr-1"></i>${**user**}</div>
              <div><i class="fas fa-heart mr-1"></i>${**points**}</div>
              <div><i class="far fa-clock mr-1"></i>${**time_ago**}</div>
            </div>  
          </div>
        </div>    
      `);
    }

		...
  }

  ...
}
```

# 03. 라우터 구현

1. `Router` 클래스를 구현한다.
    
    라우터는 반대의 방법(사용하는 쪽 구현 → class쪽 구현)으로 구현하였다. 각각의 방법마다 특성이 있으므로 취향에 맞는 쪽을 정해서 구현하면 된다.
    
    일단 `router` 함수의 내용을 그대로 가져온 class는 만들어 둠.
    
    ```tsx
    class Router {
      constructor() {
          const routePath = location.hash;
          
          if(routePath === '') {
            newsFeed(); // #(해시)도 빈 문자로 취급한다.
          } else if(routePath.indexOf('#/page/') >= 0) {
            // indexOf() : 입력으로 주어지는 문자열을 찾아서
            // 있다면 위치 인덱스를 리턴하고, 없다면 -1을 리턴한다.
            store.currentPage = Number(routePath.substr(7));
            newsFeed();
          } else {
            newsDetail();
          }
        }
    
        window.addEventListener('hashchange', router);
      }
    }
    ```
    
2. router로 사용할 기능들을 생각해 본다.
    
    우선 router에 페이지를 추가(`addRouterPath`)할 수 있어야 하고, 기본 페이지를 세팅(`setDefaultPage`)할 수 있어야 한다.
    
    ```tsx
    ...
    
    const router: Router = new Router();
    const newsFeedView = new NewsFeedView('root');
    const newsDetailView = new NewsDetailView('root');
    
    router.setDefaultPage(newsFeedView); // 페이지 세팅
    router.addRouterPath('/page/', newsFeedView); // 페이지 추가
    router.addRouterPath('/show/', newsDetailView);
    ```
    
3. `Router` 클래스의 `addRoutePath` 함수를 구현한다.
    
    route가 추가되어야 하기 때문에, 값을 저장할 `routeTable` 배열을 생성한다.
    
    배열에는 여러가지 복합적인 정보가 들어가야 하므로 객체가 저장되어야 하고, 객체가 저장될 경우 타입이 필요해지므로 타입을 위한 `interface`를 정의한다.
    
    ```tsx
    class Router {
      **routeTable: []; // route된 page가 추가되는 배열**
    
      constructor() {
        ...
      }
    
      **addRoutePath(path: string, page: View): void {
    
      }**
    }
    ```
    
4. `Router` 클래스 `routeTable` 속성의 인터페이스를 구현한다.
    
    ```tsx
    interface RouteInfo {
      path: string;
      page: View;
    }
    ```
    
5. 인터페이스를 사용하여 `Router` 클래스의 속성을 구현하고, 나머지 필요한 메소드를 구현한다.
    
    ```tsx
    **class Router {
      defaultRoute: RouteInfo | null;
      routeTable: RouteInfo[]; // route된 page가 추가되는 배열
    
      constructor() {
        const routePath = location.hash;
        
        window.addEventListener('hashchange', router);
        
        this.defaultRoute = null;
        this.routeTable = [];
      }
    
      setDefaultPage(page: View): void {
        this.defaultRoute = { path: '', page };
      }
    
      addRoutePath(path: string, page: View): void {
        this.routeTable.push({ path, page });
      }
    
      route() {
        const routePath = location.hash;
    
        if (routePath === '' && this.defaultRoute) {
          this.defaultRoute.page.render();
        }
    
        for (const routeInfo of this.routeTable) {
          if(routePath.indexOf(routeInfo.path) >= 0) {
            routeInfo.page.render();
            break;
          }
        }
      }
    }**
    ```
    
6. 그런데 render 함수는 View 클래스에 정의되어 있지 않다. 각각의 하위 클래스에 정의된 속성이다. `Router` 클래스도 어떤 것을 `render`할지 모르기 때문에 하위 클래스(`Router`) 내부에 정의해 주어야 한다. `View` 클래스에 추상 메소드를 정의하고 `Router` 클래스에 `render` 메소드를 구현한다.
    
    **※ 추상 메소드 : 부모에서 구현하진 않지만, 자식 클래스에서 반드시 구현하도록 명시해두는 메소드. `abstract` 키워드를 붙여 만들 수 있다. 추상 클래스에서 추상 메소드를 만들 수 있다.**
    
    ```tsx
    **abstract class View {**
      ...
    
      **abstract render(): void;
    }**
    ```
    
7. `hashchange`에 `route` 메소드를 연결 시켜 주어야 한다.
    
    그런데 `this.route`만 넣어서 연결 시켜줄 경우, 브라우저의 이벤트 시스템이 이 함수를 호출하게 된다. 그러면 호출이 되었을 때 이 this `context`가`Router`의 인스턴스가 아니게 된다.
    
    그렇게 되면 `defaultRoute`나 `rotueTable` 등 `Router` 인스턴스의 정보에는 접근을 할 수 없게 된다.
    
    그래서 넘겨줄 때, `bind` 메소드를 사용하여 꼭 `this`를 고정시켜 주어야 한다.
    
    ```tsx
    class Router {
      ...
    
    	constructor() {
        **window.addEventListener('hashchange', this.route.bind(this));**
        
        ...
      }
    }
    ```
    
8. 실행을 해보면 화면이 안 뜨는데, 최초 실행 시 `hashchange` 함수가 발생하지 않으므로 직접 한 번 실행해주어야 한다.
    
    ```tsx
    router.route(); // 최초 실행 시, hashchange 함수가 발생하지 않으므로 직접 실행
    ```
    
9. 글 목록을 불러오고 글 상세 보기까지 잘 작동하는 것을 볼 수 있다.
    
    하지만 페이지 변경이 되지 않는다(URL의 해쉬는 잘 바뀜, 동작은 X).
    
    `NewsDetailView` 클래스를 보면 `render`시, `store`에서 `currentPage` 데이터를 가져와서 사용하였다.
    
    `NewsFeedView` 클래스에서도 `render`시, `store`의 `currentPage` 데이터를 처리해주면 된다.
    
    ```tsx
    class NewsFeedView extends View {
      ...
    
      render(): void {
        **store.currentPage = Number(location.hash.substr(7) || 1); // 디폴트 페이지는 숫자가 없기 때문에 1로 설정**
        
    		...
      }
    
    	...
    }
    ```
    

# 04. 접근 제어

> 외부에서 속성에 접근할 수 없도록 접근 제어자를 붙인다. 디폴트 접근 제어자는 `public`이므로 어디서든 접근이 가능하다.
> 
1. `View` 클래스의 속성을 먼저 살펴본다.
    
    `View` 클래스의 속성은 외부(2)로부터 접근할 필요가 없는 속성이다. `private` 접근 제어자를 붙인다.
    
    **※ 참고로 외부라는 범주는 2가지로 나뉘어 진다.**
    
    외부는 `View` 클래스의 바깥쪽 즉, 인스턴스 객체로 접근하는 경우를 외부라고 한다.
    
    1. `protected` : 상속 받은 자식 class 안에서 접근하는 경우.
    2. `private` : 상속 관계가 전혀 없는 완전 바깥쪽에서 접근하는 경우.
    
    ```tsx
    abstract class View {
      **private** template: string;
      **private** renderTemplate: string;
      **private** container: HTMLElement;
      **private** htmlList: string[];
    
    	...
    }
    ```
    
2. 다음으로 `View` 클래스의 메소드는 하위 자식들에서 사용 가능해야 하므로 `protected`를 붙인다. `clearHtmlList` 메소드는 `View` 클래스 내부에서만 사용되므로 `private`를 붙인다.
    
    ```tsx
    abstract class View {
      ...
    
      **protected** updateView(): void { ... }
    
      **protected** addHtml(htmlString: string): void { ... }
    
      **protected** getHtml(): string { ... }
    
      **protected** setTemplateData(key: string, value: string): void { ... }
    
      **private** clearHtmlList(): void { ... }
    
      abstract render(): void;
    }
    ```
    
3. 다음으로 `NewsFeedView` 클래스의 속성도 외부(2)에서 접근할 필요가 없는 속성이다. `private` 접근 제어자를 붙인다.
    
    `render` 메소드는 외부에서 사용하는 메소드이므로 `public`(default)을 사용한다.
    
    `makeFeeds` 메소드는 내부에서만 사용하므로 `private`을 사용한다.
    
    ```tsx
    class NewsFeedView extends View {
      **private** api: NewsFeedApi;
      **private** feeds: NewsFeed[];
    
    	...
    
    	**private** makeFeeds(): void {
    		...
    	}
    }
    ```
    
4. `NewsDetailView` 클래스는 속성이 없다. `makeComment` 메소드는 내부에서만 사용하므로 `private`을 붙인다.
    
    ```tsx
    class NewsDetailView extends View {
      ...
    
      **private** makeComment(comments: NewsComment[]): string {
        ...
      }
    }
    ```