# ISMS Ansible Playbook Role
- 정보보호 관리체계(ISMS) 요건에 맞춰 보안 설정을 자동화합니다.
- 다양한 리눅스 배포판에 대한 지원을 포함하며, 주요 보안 설정 파일 및 스크립트를 제공합니다.

## 주요 기능

### 보안 스크립트 (`files`)

- **`list_no_homedir.sh`**: 홈 디렉토리가 없는 계정을 확인하는 스크립트.
- **`motd-secure.sh`**: 보안 메시지(MOTD) 설정을 위한 스크립트.
- **`set-umask-to-all.sh`**: 시스템 전역의 umask를 설정하는 스크립트.
- **`timeout.sh`**: 사용자 세션 타임아웃을 설정하는 스크립트.

### 보안 설정 자동화 (`tasks`)

- 다양한 리눅스 배포판(CentOS, Rocky, Debian, Ubuntu)에 대해 지원.
- 주요 보안 설정을 Ansible Playbook으로 자동화.
- Apache, Nginx, su, tcp_wrapper 등의 서비스별 보안 설정 제공.

### 템플릿 (`templates`)

- 배포판별 PAM 설정 파일 (`common-account`, `common-auth`, `password-auth` 등).
- `hosts.allow`와 `hosts.deny` 설정 템플릿.
- firewalld 로그 설정

## 사용법

### 1. Playbook 실행
`isms.yml` 파일을 실행하여 ISMS 역할(role)을 적용합니다.

```bash
ansible-playbook isms.yml -e"target=hostname"
```

### 2. 특정 배포판에 맞춘 설정

- 해당 배포판에 맞는 tasks 파일과 templates 파일이 자동으로 적용됩니다.
  - 예: Ubuntu 20.04를 사용하는 경우 tasks/Ubuntu_20.yml와 관련 템플릿이 적용됩니다.

## 지원 배포판

- CentOS 6, 7, 8
- Rocky Linux 8, 9
- Debian 11
- Ubuntu 14, 16, 18, 20, 22
