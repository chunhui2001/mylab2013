mylab2013
=========

git remote set-url origin git@github.com:chunhui2001/mylab2013.git


# eclipse 插件
gae - http://dl.google.com/eclipse/plugin/4.4

$ cd ~/mylab2013/war
$ /usr/local/google-cloud-sdk/bin/gcloud app deploy


/usr/local/bin/ngrok http localhost:10011
/usr/local/bin/ngrok tcp localhost:9188
/usr/local/bin/ngrok http -subdomain=inconshreveable 80
/usr/local/bin/ngrok start -config ~/ngrok.yml -config ~/projects/example/ngrok.yml website ttcp


### ngrok.yml
====================
authtoken: 1T750atJi3xccndeUqJ4ewiS62o_2s6f8GUccL1qDUXTGSftN
region: us
console_ui: true
http_proxy: false
inspect_db_size: 50000000
log_level: info
log_format: json
#log: /var/log/ngrok.log
metadata: '{"serial": "00012xa-33rUtz9", "comment": "For customer alan@example.com"}'
root_cas: trusted
#socks5_proxy: "socks5://localhost:9150"
update: false
update_channel: stable
web_addr: localhost:4040
tunnels:
  mylab2013:
    addr: 9000
    auth: keesh:Cc
    bind_tls: true
    host_header: "myapp.dev"
    inspect: false
    proto: http
  #  subdomain: myapp

  # e2etls:
  #   addr: 9000
  #   proto: tls
  #   hostname: myapp.example.com
  #   crt: example.crt
  #   key: example.key

  # ttcp:
  #   addr: 9188
  #   proto: tcp
  #   remote_addr: 1.tcp.ngrok.io:12345

## WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8)
https://dev.to/docker/run-x86-containers-on-apple-mac-m1-with-rosetta-2-417a


