# Ruční ladění podů a/nebo kontejnerů

## Úvod

Co je to vlastně Kubernetes? Může pomoci
[tento](https://platform9.com/blog/kubernetes-enterprise-chapter-2-kubernetes-architecture-concepts/) nákres.
Je to vlastně nějaký nástroj, který řídí hromadu serverů s nějakým container runtime.

## Ukázkové scénáře

### neexistující obraz

```bash
kubectl apply -f kubernetes/01missing_image.yaml
```

**Prohlédneme si stav podu**

```bash
kubectl get pod
```

```bash
kubectl get pod muj01 -o yaml
```

**Prohlédneme si detail podu**

```bash
kubectl describe pod muj01
```

**Provedeme opravu**

```
diff --git a/02kubernetes_debug_pods/kubernetes/01missing_image.yaml b/02kubernetes_debug_pods/kubernetes/01missing_image.yaml
index caaeb74..d6dfb71 100644
--- a/02kubernetes_debug_pods/kubernetes/01missing_image.yaml
+++ b/02kubernetes_debug_pods/kubernetes/01missing_image.yaml
@@ -8,7 +8,7 @@ spec:
   restartPolicy: OnFailure
   containers:
   - name: muj-container
-    image: alpine:latesttttt
+    image: alpine:latest
```

**Čistka**

```bash
kubectl delete -f kubernetes/01missing_image.yaml
```