version: '2'
volumes:
  filebeat-config:
    external: true
    driver: rancher-nfs
services:
  filebeat:
    privileged: true
    image: prima/filebeat:6.2.3
    environment:
      TZ: Asia/Shanghai
    volumes:
    - filebeat-config:/var
    - /var/lib/docker/volumes:/var/lib/docker/volumes:ro
    tty: true
    command:
    - -e
    - -c
    - /var/filebeat.yml
    labels:
      servicename: filebeat
{{- if eq .Values.run_in_every_host "yes"}}
      io.rancher.container.pull_image: always
	  io.rancher.scheduler.global: 'true'
{{- end}}