apiVersion: k0s.k0sproject.io/v1beta1
kind: ClusterConfig
metadata:
  name: ${cluster_name}
spec:
  api:
    sans:
%{ for address in split(",", cluster_sans) ~}
      - ${address}
%{ endfor ~}
  controllerManager:
    extraArgs:
      flex-volume-plugin-dir: /var/libexec/k0s/kubelet-plugins/volume/exec
  network:
    provider: custom
    kubeProxy:
      disabled: true
  workerProfiles:
    - name: coreos
      values:
        volumePluginDir: /var/libexec/k0s/kubelet-plugins/volume/exec
        cgroupDriver: systemd
  telemetry:
    enabled: false
  extensions:
    storage:
      type: openebs_local_storage
      create_default_storage_class: true