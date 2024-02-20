apiVersion: k0s.k0sproject.io/v1beta1
kind: ClusterConfig
metadata:
  name: ${cluster_name}
spec:
  api:
%{ if cluster_sans != "" ~}
    sans:
%{ for address in split(",", cluster_sans) ~}
      - ${address}
%{ endfor ~}
%{endif ~}
%{ if external_address != "" ~}
    externalAddress: ${external_address}
%{ endif ~}
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