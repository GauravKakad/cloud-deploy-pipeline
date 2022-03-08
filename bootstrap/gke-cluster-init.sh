# Creates 3 GKE autopilot clusters
# ACTION REQUIRED! Change "gauravk-demo-project" value to the project you'll be using
export PROJECT_ID="gauravk-demo-project"
# Test cluster
echo "creating testcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "testcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/vpc-auto-001" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/vpc-auto-001" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --enable-private-nodes --async
# Staging cluster
echo "creating stagingcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "stagingcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/vpc-auto-001" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/vpc-auto-001" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --enable-private-nodes --async
# Prod cluster
echo "creating prodcluster..."
gcloud beta container --project "$PROJECT_ID" clusters create-auto "prodcluster" \
--region "us-central1" --release-channel "regular" --network "projects/$PROJECT_ID/global/networks/vpc-auto-001" \
--subnetwork "projects/$PROJECT_ID/regions/us-central1/subnetworks/vpc-auto-001" \
--cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22" --enable-private-nodes --async
echo "Creating clusters! Check the UI for progress"
