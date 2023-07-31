# 문제 상황

## VSCode에서 GitLab 레포지토리를 clone, pull, push 등의 작업을 수행할 때, 매번 아이디와 비밀번호를 확인한다.
→ 매번 수행하기 귀찮기도 하고, 시간도 잡아먹어 비효율적이다.

# 해결

- credential 설정이 되어있지 않아서 발생했던 문제.
    
    → 설정해주자 !
    
- 반영구로 설정하기
    
    `**git config --global credential.helper store**`
    
- 지정된 시간만큼만 설정하기
    
    `git config credential.helper 'cache --timeout=3600'`
    
- 해당 레포 외에도 모든 레포를 대상으로 설정하기
    
    `git config credential.helper store --global`
    

- 만약, 잘못된 정보가 저장되었다면, reset 하자 !
    
    `git config --global --unset credential.helper`