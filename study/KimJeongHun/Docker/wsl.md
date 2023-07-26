
**Windows WSL2 설치하고 리눅스 사용 - WSL2 활성화**

- Docker는 리눅스를 기반으로 합니다. 따라서 리눅스 운영체제 위에서 Docker를 실행시켜야 합니다. 윈도우 환경에서 리눅스를 사용할 수 있도록 도와주는 WSL2를 활성화해서 Docker를 실행시키고자 합니다.

```
$ wsl --install
$ wsl --set-default-version 2

재부팅 후 check
$ wsl
```

```
[참고]
Windows 10/11 Professional / Education / Enterprise 에디션
WSL2 기반 Docker Engine 사용 가능
Hyper-V 기반 Docker Engine 사용 가능
Windows 10/11 Home 에디션
WSL2 기반 Docker Engine 사용 가능
```

