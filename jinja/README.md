# Edge Microgateway jinja
This project allows you to install Edge Microgateway in Google Cloud Platform using GCP's deployment manager.

## Prerequisite

### gcloud
- Install gcloud sdk from https://cloud.google.com/sdk/downloads
- Initialize your account
- [Install Edgemicro](http://docs.apigee.com/microgateway/content/edge-microgateway-home#installingedgemicrogateway) locally
- Execute `edgemicro configure -o apigee_org -e apigee_env -u apigee_org_admin`
- copy the key and secret from the above command and store it for the section below.

## Before you start
- Edit the /jinja/microgateway-config.txt and update the properties

    ```sh
    ORG=Apigee_org
    ENV=Apigee_env
    KEY=Key
    SECRET=secret
    PORT=8000
    ```
- Also update the edgemicro.yaml file.  Replace org and env with your Apigee org name and environment.  s
  ```
  imports:
  - path: ./org-env-config.yaml
    name: org-env-config.yaml
  properties:
    yaml-file: org-env-config.yaml
  ```

## Deploy Edge Microgateway profile
```sh
./deploy.sh "RESOURCE_NAME" "zone"
```
e.g :
```sh
./deploy.sh edgemicro us-east1-b
```

## Undeploy and Clean the deployment
```sh
./clean.sh "RESOURCE_NAME"
```
e.g :
```sh
./clean.sh edgemicro
```

## troubleshooting
Sometimes the startup script does not install Edgemicro and you have to rerun the start up script.

SSH into the VM and execute the following command.

```
sudo google_metadata_script_runner --script-type startup
```
## License

Apache 2.0 - See [LICENSE](LICENSE) for more information.
