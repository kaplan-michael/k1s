apiVersion: k0s.k0sproject.io/v1beta1
kind: ClusterConfig
metadata:
  name: ${cluster_name}
spec:
  api:
    externalAddress: ${cluster_external_address}
  controllerManager:
    extraArgs:
      flex-volume-plugin-dir: /var/libexec/k0s/kubelet-plugins/volume/exec
  network:
    provider: calico
    calico:
      flexVolumeDriverPath: /var/libexec/k0s/kubelet-plugins/volume/exec/nodeagent~uds
    kubeProxy:
      mode: ipvs
      ipvs:
        strictARP: true
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