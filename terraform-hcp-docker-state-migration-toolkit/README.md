# terraform-hcp-docker-state-migration-toolkit
![](/terraform-hcp-docker-state-migration-toolkit/images/Screenshot%202024-08-14%20at%2011.08.47 PM.png)

## backend declare state change from remote to cloud
![](/terraform-hcp-docker-state-migration-toolkit/images/Screenshot%202024-08-14%20at%2011.15.50 PM.png)

```
####Terrafrom Login####(Need to Generate Token form HCP account first)
$ terraform login 
$ cd docker-tfc
$ tree
$ terraform init
$ terraform plan
$ terraform apply -auto-approve
$ terraform destroy

$ docker ps
$ terraform show
```

![](/terraform-hcp-docker-state-migration-toolkit/images/Screenshot%202024-08-14%20at%2011.35.38 PM.png)

**output**

```

vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ terraform init
Initializing HCP Terraform...
Initializing provider plugins...
- Finding kreuzwerker/docker versions matching "~> 3.0.1"...
- Installing kreuzwerker/docker v3.0.2...
- Installed kreuzwerker/docker v3.0.2 (self-signed, key ID BD080C4571C6104C)
Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html
Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

HCP Terraform has been successfully initialized!

You may now begin working with HCP Terraform. Try running "terraform plan" to
see any changes that are required for your infrastructure.

If you ever set or change modules or Terraform Settings, run "terraform init"
again to reinitialize your working directory.
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "webserver1"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 8000
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_container.nginx2 will be created
  + resource "docker_container" "nginx2" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "webserver2"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 8001
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_container.nginx3 will be created
  + resource "docker_container" "nginx3" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "webserver3"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 8002
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + name         = "nginx:latest"
      + repo_digest  = (known after apply)
    }

Plan: 4 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
Releasing state lock. This may take a few moments...
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "webserver1"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 8000
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_container.nginx2 will be created
  + resource "docker_container" "nginx2" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "webserver2"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 8001
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_container.nginx3 will be created
  + resource "docker_container" "nginx3" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "webserver3"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 8002
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + name         = "nginx:latest"
      + repo_digest  = (known after apply)
    }

Plan: 4 to add, 0 to change, 0 to destroy.
docker_image.nginx: Creating...
docker_image.nginx: Creation complete after 0s [id=sha256:900dca2a61f5799aabe662339a940cf444dfd39777648ca6a953f82b685997ednginx:latest]
docker_container.nginx: Creating...
docker_container.nginx2: Creating...
docker_container.nginx3: Creating...
╷
│ Error: Unable to create container: Error response from daemon: Conflict. The container name "/webserver1" is already in use by container "e28f6fbdc38fab2b774d943d7db41ade7665c58e67f198a15664087396668587". You have to remove (or rename) that container to be able to reuse that name.
│ 
│   with docker_container.nginx,
│   on main.tf line 6, in resource "docker_container" "nginx":
│    6: resource "docker_container" "nginx" {
│ 
╵
╷
│ Error: Unable to create container: Error response from daemon: Conflict. The container name "/webserver2" is already in use by container "678d49f1e400747f85ff7aa47aa1cefb53af5736f85515cd7aac2efe7d7d4d4c". You have to remove (or rename) that container to be able to reuse that name.
│ 
│   with docker_container.nginx2,
│   on main.tf line 15, in resource "docker_container" "nginx2":
│   15: resource "docker_container" "nginx2" {
│ 
╵
╷
│ Error: Unable to create container: Error response from daemon: Conflict. The container name "/webserver3" is already in use by container "d8e369236da3b6e6ee846f71fa901e7b1677448137e5e4b96a7202c94a1e0918". You have to remove (or rename) that container to be able to reuse that name.
│ 
│   with docker_container.nginx3,
│   on main.tf line 24, in resource "docker_container" "nginx3":
│   24: resource "docker_container" "nginx3" {
│ 
╵
Releasing state lock. This may take a few moments...
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED        STATUS       PORTS                       NAMES
678d49f1e400   900dca2a61f5            "/docker-entrypoint.…"   5 hours ago    Up 5 hours   0.0.0.0:8001->80/tcp        webserver2
e28f6fbdc38f   900dca2a61f5            "/docker-entrypoint.…"   5 hours ago    Up 5 hours   0.0.0.0:8000->80/tcp        webserver1
d8e369236da3   900dca2a61f5            "/docker-entrypoint.…"   5 hours ago    Up 5 hours   0.0.0.0:8002->80/tcp        webserver3
8c96e7ac63a5   kindest/node:v1.23.17   "/usr/local/bin/entr…"   46 hours ago   Up 5 hours                               123-worker2
abfdfe4dac0f   kindest/node:v1.23.17   "/usr/local/bin/entr…"   46 hours ago   Up 5 hours                               123-worker
ac063d75478d   kindest/node:v1.23.17   "/usr/local/bin/entr…"   46 hours ago   Up 5 hours   127.0.0.1:33541->6443/tcp   123-control-plane
a378dadf1351   kindest/node:v1.23.17   "/usr/local/bin/entr…"   46 hours ago   Up 5 hours                               123-worker3
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ docker stop 678d49f1e400
678d49f1e400
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ docker stop e28f6fbdc38f
e28f6fbdc38f
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ docker stop d8e369236da3
d8e369236da3
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ docker rmi d8e369236da3
Error response from daemon: No such image: d8e369236da3:latest
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ docker rm d8e369236da3
d8e369236da3
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ docker rm d8e369236da3 678d49f1e400 e28f6fbdc38f
678d49f1e400
e28f6fbdc38f
Error response from daemon: No such container: d8e369236da3
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ 
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED        STATUS       PORTS                       NAMES
8c96e7ac63a5   kindest/node:v1.23.17   "/usr/local/bin/entr…"   46 hours ago   Up 5 hours                               123-worker2
abfdfe4dac0f   kindest/node:v1.23.17   "/usr/local/bin/entr…"   46 hours ago   Up 5 hours                               123-worker
ac063d75478d   kindest/node:v1.23.17   "/usr/local/bin/entr…"   46 hours ago   Up 5 hours   127.0.0.1:33541->6443/tcp   123-control-plane
a378dadf1351   kindest/node:v1.23.17   "/usr/local/bin/entr…"   46 hours ago   Up 5 hours                               123-worker3
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ terraform apply -auto-approve
docker_image.nginx: Refreshing state... [id=sha256:900dca2a61f5799aabe662339a940cf444dfd39777648ca6a953f82b685997ednginx:latest]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = "sha256:900dca2a61f5799aabe662339a940cf444dfd39777648ca6a953f82b685997ed"
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "webserver1"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 8000
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_container.nginx2 will be created
  + resource "docker_container" "nginx2" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = "sha256:900dca2a61f5799aabe662339a940cf444dfd39777648ca6a953f82b685997ed"
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "webserver2"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 8001
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

  # docker_container.nginx3 will be created
  + resource "docker_container" "nginx3" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = "sha256:900dca2a61f5799aabe662339a940cf444dfd39777648ca6a953f82b685997ed"
      + init                                        = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "webserver3"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck (known after apply)

      + labels (known after apply)

      + ports {
          + external = 8002
          + internal = 80
          + ip       = "0.0.0.0"
          + protocol = "tcp"
        }
    }

Plan: 3 to add, 0 to change, 0 to destroy.
docker_container.nginx3: Creating...
docker_container.nginx: Creating...
docker_container.nginx2: Creating...
docker_container.nginx3: Creation complete after 1s [id=76c1356f6f17a17c39c648f20b6437b2b1bc9d7e9d1e4ff5d424a9464193fda0]
docker_container.nginx2: Creation complete after 1s [id=4d53d1515e88957cfb1071b64c13bd30750d7f4c071d57aeeaee55f8df9e6ac9]
docker_container.nginx: Creation complete after 1s [id=267d3d7467f9f580973e20794be7ab2c867a3de0d825e09fbb4405dd1fe3c8a2]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ terraform destroy
docker_image.nginx: Refreshing state... [id=sha256:900dca2a61f5799aabe662339a940cf444dfd39777648ca6a953f82b685997ednginx:latest]
docker_container.nginx: Refreshing state... [id=267d3d7467f9f580973e20794be7ab2c867a3de0d825e09fbb4405dd1fe3c8a2]
docker_container.nginx2: Refreshing state... [id=4d53d1515e88957cfb1071b64c13bd30750d7f4c071d57aeeaee55f8df9e6ac9]
docker_container.nginx3: Refreshing state... [id=76c1356f6f17a17c39c648f20b6437b2b1bc9d7e9d1e4ff5d424a9464193fda0]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # docker_container.nginx will be destroyed
  - resource "docker_container" "nginx" {
      - attach                                      = false -> null
      - command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> null
      - container_read_refresh_timeout_milliseconds = 15000 -> null
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      - entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> null
      - env                                         = [] -> null
      - group_add                                   = [] -> null
      - hostname                                    = "267d3d7467f9" -> null
      - id                                          = "267d3d7467f9f580973e20794be7ab2c867a3de0d825e09fbb4405dd1fe3c8a2" -> null
      - image                                       = "sha256:900dca2a61f5799aabe662339a940cf444dfd39777648ca6a953f82b685997ed" -> null
      - init                                        = false -> null
      - ipc_mode                                    = "private" -> null
      - log_driver                                  = "json-file" -> null
      - log_opts                                    = {} -> null
      - logs                                        = false -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      - must_run                                    = true -> null
      - name                                        = "webserver1" -> null
      - network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.4"
              - ip_prefix_length          = 16
              - mac_address               = "02:42:ac:11:00:04"
              - network_name              = "bridge"
                # (2 unchanged attributes hidden)
            },
        ] -> null
      - network_mode                                = "bridge" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      - read_only                                   = false -> null
      - remove_volumes                              = true -> null
      - restart                                     = "no" -> null
      - rm                                          = false -> null
      - runtime                                     = "runc" -> null
      - security_opts                               = [] -> null
      - shm_size                                    = 64 -> null
      - start                                       = true -> null
      - stdin_open                                  = false -> null
      - stop_signal                                 = "SIGQUIT" -> null
      - stop_timeout                                = 0 -> null
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - tty                                         = false -> null
      - wait                                        = false -> null
      - wait_timeout                                = 60 -> null
        # (7 unchanged attributes hidden)

      - ports {
          - external = 8000 -> null
          - internal = 80 -> null
          - ip       = "0.0.0.0" -> null
          - protocol = "tcp" -> null
        }
    }

  # docker_container.nginx2 will be destroyed
  - resource "docker_container" "nginx2" {
      - attach                                      = false -> null
      - command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> null
      - container_read_refresh_timeout_milliseconds = 15000 -> null
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      - entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> null
      - env                                         = [] -> null
      - group_add                                   = [] -> null
      - hostname                                    = "4d53d1515e88" -> null
      - id                                          = "4d53d1515e88957cfb1071b64c13bd30750d7f4c071d57aeeaee55f8df9e6ac9" -> null
      - image                                       = "sha256:900dca2a61f5799aabe662339a940cf444dfd39777648ca6a953f82b685997ed" -> null
      - init                                        = false -> null
      - ipc_mode                                    = "private" -> null
      - log_driver                                  = "json-file" -> null
      - log_opts                                    = {} -> null
      - logs                                        = false -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      - must_run                                    = true -> null
      - name                                        = "webserver2" -> null
      - network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.3"
              - ip_prefix_length          = 16
              - mac_address               = "02:42:ac:11:00:03"
              - network_name              = "bridge"
                # (2 unchanged attributes hidden)
            },
        ] -> null
      - network_mode                                = "bridge" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      - read_only                                   = false -> null
      - remove_volumes                              = true -> null
      - restart                                     = "no" -> null
      - rm                                          = false -> null
      - runtime                                     = "runc" -> null
      - security_opts                               = [] -> null
      - shm_size                                    = 64 -> null
      - start                                       = true -> null
      - stdin_open                                  = false -> null
      - stop_signal                                 = "SIGQUIT" -> null
      - stop_timeout                                = 0 -> null
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - tty                                         = false -> null
      - wait                                        = false -> null
      - wait_timeout                                = 60 -> null
        # (7 unchanged attributes hidden)

      - ports {
          - external = 8001 -> null
          - internal = 80 -> null
          - ip       = "0.0.0.0" -> null
          - protocol = "tcp" -> null
        }
    }

  # docker_container.nginx3 will be destroyed
  - resource "docker_container" "nginx3" {
      - attach                                      = false -> null
      - command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> null
      - container_read_refresh_timeout_milliseconds = 15000 -> null
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      - entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> null
      - env                                         = [] -> null
      - group_add                                   = [] -> null
      - hostname                                    = "76c1356f6f17" -> null
      - id                                          = "76c1356f6f17a17c39c648f20b6437b2b1bc9d7e9d1e4ff5d424a9464193fda0" -> null
      - image                                       = "sha256:900dca2a61f5799aabe662339a940cf444dfd39777648ca6a953f82b685997ed" -> null
      - init                                        = false -> null
      - ipc_mode                                    = "private" -> null
      - log_driver                                  = "json-file" -> null
      - log_opts                                    = {} -> null
      - logs                                        = false -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      - must_run                                    = true -> null
      - name                                        = "webserver3" -> null
      - network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.2"
              - ip_prefix_length          = 16
              - mac_address               = "02:42:ac:11:00:02"
              - network_name              = "bridge"
                # (2 unchanged attributes hidden)
            },
        ] -> null
      - network_mode                                = "bridge" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      - read_only                                   = false -> null
      - remove_volumes                              = true -> null
      - restart                                     = "no" -> null
      - rm                                          = false -> null
      - runtime                                     = "runc" -> null
      - security_opts                               = [] -> null
      - shm_size                                    = 64 -> null
      - start                                       = true -> null
      - stdin_open                                  = false -> null
      - stop_signal                                 = "SIGQUIT" -> null
      - stop_timeout                                = 0 -> null
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - tty                                         = false -> null
      - wait                                        = false -> null
      - wait_timeout                                = 60 -> null
        # (7 unchanged attributes hidden)

      - ports {
          - external = 8002 -> null
          - internal = 80 -> null
          - ip       = "0.0.0.0" -> null
          - protocol = "tcp" -> null
        }
    }

  # docker_image.nginx will be destroyed
  - resource "docker_image" "nginx" {
      - id           = "sha256:900dca2a61f5799aabe662339a940cf444dfd39777648ca6a953f82b685997ednginx:latest" -> null
      - image_id     = "sha256:900dca2a61f5799aabe662339a940cf444dfd39777648ca6a953f82b685997ed" -> null
      - keep_locally = false -> null
      - name         = "nginx:latest" -> null
      - repo_digest  = "nginx@sha256:98f8ec75657d21b924fe4f69b6b9bff2f6550ea48838af479d8894a852000e40" -> null
    }

Plan: 0 to add, 0 to change, 4 to destroy.

Do you really want to destroy all resources in workspace "docker-akhlab"?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

docker_container.nginx: Destroying... [id=267d3d7467f9f580973e20794be7ab2c867a3de0d825e09fbb4405dd1fe3c8a2]
docker_container.nginx3: Destroying... [id=76c1356f6f17a17c39c648f20b6437b2b1bc9d7e9d1e4ff5d424a9464193fda0]
docker_container.nginx2: Destroying... [id=4d53d1515e88957cfb1071b64c13bd30750d7f4c071d57aeeaee55f8df9e6ac9]
docker_container.nginx3: Destruction complete after 1s
docker_container.nginx: Destruction complete after 1s
docker_container.nginx2: Destruction complete after 1s
docker_image.nginx: Destroying... [id=sha256:900dca2a61f5799aabe662339a940cf444dfd39777648ca6a953f82b685997ednginx:latest]
docker_image.nginx: Destruction complete after 0s
Releasing state lock. This may take a few moments...

Destroy complete! Resources: 4 destroyed.
vagrant@cloud-native-box:~/CloudDevOps/terraform-hcp-docker-state-migration-toolkit$ 
```

![](/terraform-hcp-docker-state-migration-toolkit/images/Screenshot%202024-08-14%20at%2011.40.17 PM.png)

*Happy_lab...!!!!*