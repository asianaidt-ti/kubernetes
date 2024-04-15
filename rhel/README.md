# 설치 순서

## 1. 싱글 마스터 클러스터

### 1.1 모든 노드

```
sudo -i
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rhel/01-system.sh)
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rhel/02-containerd.sh)
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rhel/03-container-runtimes.sh)
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rhel/04-kubeadm.sh)
```

### 1.2 마스터 노드

```
bash <(curl -s https://raw.githubusercontent.com/asianaidt-ti/kubernetes/main/rhel/05-master-only.sh)
```

### 1.3 워커 노드

1.2 실행 결과를 참조하여 클러스터에 Join.
