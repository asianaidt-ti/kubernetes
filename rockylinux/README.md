# 설치 순서

## 1. 싱글 마스터 클러스터

### 1.1 모든 노드

```
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rockylinux/01-system.sh)
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rockylinux/02-containerd.sh)
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rockylinux/03-container-runtimes.sh)
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rockylinux/04-kubeadm.sh)
```

### 1.2 마스터 노드

```
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rockylinux/05-master-only.sh)
```

### 1.3 워커 노드

마스터 노드에서 다음 명령어를 실행한다. 
```
kubeadm token create --print-join-command
```

출력 예시:
```
kubeadm join 172.31.14.230:6443 --token 1jqhol.h4bmkvd1uvkoirt5 --discovery-token-ca-cert-hash sha256:367fed174c2ca71700fd8a56e61034746df7463725e3e912be34b28b68bb82b6
```

출력 된 명령어를 각 워커 노드에서 실행하여 워커노드 초기화 및 클러스터 추가 작업이 진행된다.
