# 설치 순서

## 1. 싱글 마스터 클러스터

### 1.1 모든 노드

```
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rockylinux/01-system.sh)
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rockylinux/02-containerd.sh)
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rockylinux/03-container-runtimes.sh)
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rockylinux/04-kubeadm.sh)
```

### 1.2.1 컨트롤 플레인 노드

```
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rockylinux/05-control-plane.sh)
```

### 1.2.2 컨트롤 플레인 노드(HA)구성

주의: control-plane-endpoint.cnct.asianaidt.com 도메인에 대한 설정이 필요함(NLB 주소)
- 각 노드의 hosts파일에 미리 추가 
- NLB DNS 이름 그대로 사용
- DNS등록이 가능한 경우 CNAME레코드로 등록 또는 A레코드로 주소 등록

```
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rockylinux/05-control-plane-ha.sh)
```

### 1.3 노드 추가

### 1.3.1 워커 노드 추가

컨트롤 플레인 노드에서 다음 명령어를 실행한다. 
```
kubeadm token create --print-join-command
```

출력 예시:
```
kubeadm join 172.31.14.230:6443 --token 1jqhol.h4bmkvd1uvkoirt5 --discovery-token-ca-cert-hash sha256:367fed174c2ca71700fd8a56e61034746df7463725e3e912be34b28b68bb82b6
```

출력 된 명령어를 각 워커 노드에서 실행하여 워커노드 초기화 및 클러스터 추가 작업이 진행된다.

### 1.3.2 컨트롤 플레인 노드 추가(HA 구성 시)

컨트롤 플레인 노드에서 다음 명령어를 실행한다. 

명령어1:
```
kubeadm token create --print-join-command
```
명령어2:
```
kubeadm init phase upload-certs --upload-certs
```

출력 예시1:
```
# kubeadm token create --print-join-command
kubeadm join control-plane-endpoint.cnct.asianaidt.com:6443 --token gskkzg.auojewydjmufo5w1 --discovery-token-ca-cert-hash sha256:fd7b5be47bb176f19d769881ec8d93dddd193fb10513768814cc13dd41527019
```
출력 예시2:
```
# kubeadm init phase upload-certs --upload-certs
I0418 03:52:44.628860    9899 version.go:256] remote version is much newer: v1.30.0; falling back to: stable-1.29
[upload-certs] Storing the certificates in Secret "kubeadm-certs" in the "kube-system" Namespace
[upload-certs] Using certificate key:
c6d7601ab1a1bb149201371fc3041a7d42766d93264aa3bb04521824d290fc19
```

(명령어1 결과) --control-plane --certificate-key (명령어2 결과 certificate key)
예시:
```
kubeadm join control-plane-endpoint.cnct.asianaidt.com:6443 --token gskkzg.auojewydjmufo5w1 --discovery-token-ca-cert-hash sha256:fd7b5be47bb176f19d769881ec8d93dddd193fb10513768814cc13dd41527019 --control-plane --certificate-key c6d7601ab1a1bb149201371fc3041a7d42766d93264aa3bb04521824d290fc19
```
