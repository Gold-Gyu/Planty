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
