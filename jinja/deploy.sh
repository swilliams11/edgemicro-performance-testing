gcloud deployment-manager deployments create $1 --config edgemicro.yaml
natIP=$(gcloud compute instances describe $1 --zone $2 --format yaml | grep natIP)
IP=$(echo $natIP | grep -oE "[^:]+$")
IP="${IP#"${IP%%[![:space:]]*}"}"   # remove leading whitespace characters
IP="${IP%"${IP##*[![:space:]]}"}"
echo "Please allow 15 minutes for edge to be installed";
echo "The edgemicro running at http://$IP:8000";
