`git init`

- git 저장소 생성하기 (local)

`git clone <repository-URL>`

- 원격의 레포지토리를 복제하여 로컬에 저장.

`git add <파일명>`

- 로컬에서 변경사항이 있는 <파일명>을 stage.

`git add .`

- 로컬에서 변경 사항이 있는 모든 파일을 stage.

`git status`

- 레포지토리의 모든 작업 디렉토리, 파일 변경 사항, stage 사항, commit 내역 등을 보여줌.

`git log`

- 모든 버전 이력(커밋)을 리스트업.

`git log --oneline`

- 모든 버전 이력(커밋)을 한 줄로 리스트업.

`git branch` or `git branch -l`

- 로컬 브랜치 목록

`git branch -r`

- 원격 브랜치 목록

`git branch -a`

- 로컬/원격 브랜치 목록

`git branch -v`

- 로컬 branch의 정보를 마지막 커밋내역과 함께 보여줌.

`git branch <new-branch-name>`

- 로컬에 새로운 branch 생성

`git branch -d <branch-name>`

- branch 삭제

`git branch -m <new-branch-name> <before-branch-name>`

- 브랜치명 변경

`git checkout <branch-name>`

- 로컬에서 현재 작업 중인 branch 변경.

`git checkout -b <branch-name>`

- branch 생성과 동시에 해당 branch로 checkout

`git fetch`

- 원격 저장소에 변경 사항이 있는지 확인
- 실제 변경된 소스 코드로 업데이트하지는 않음.

`git pull <원격저장소명> <branch명>`

- 원격저장소의 변경 사항을 branch에 반영.
- fetch + merge

`git commit -m <커밋메시지>`

- 현재 stage된 파일들의 변경 이력을 파일에 기록.
- 즉, 소스 코드의 변경을 확정짓는 행위.

`git push <원격저장소명> <branch명>`

- 로컬의 커밋사항들을 원격저장소로 전송.

`git reset --hard`

- 모든 로컬 stage를 초기화.
- 가장 최근 커밋으로 되돌린다.

`git reset --hard <commit-code>`

- commit-code에 해당하는 커밋의 상태로 되돌림.
- commit-code 는 git log 했을 때의 제일 앞 7자리 (ex. 4821d0c)