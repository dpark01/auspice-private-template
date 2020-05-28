# auspice-private-template
This contains a template git repo that allows for continuous deploy of
Auspice servers to Google Cloud Run (serverless web via docker)
via Google Cloud Builder (CI) to Google Container Registery (docker registry)
based on data (augur export jsons and narrative markdowns) in a private
github repo. This repo is public, and populated with example data,
simply fork it to a private repo, add your own data, and set up the
build triggers.

This repo can contain any number of json and/or json.gz files (nextstrain
datasets output from `augur export v2`) and md files (nextstrain narratives
that reference any of these datasets).

After properly setting up build triggers, each push to this repo will 
trigger a Google Cloud Build which will build the Dockerfile and push to 
Google Container Registry. Google Cloud Build will then deploy this 
container to Google Cloud Run for auto-scaled serverless hosting of the 
web app. The GCR docker images are private, by default. The Cloud Run
services default to unauthenticated on a public, but obscure, URL
(modify the cloudbuild.yaml to change that).

More instructions on how this is set up on the Google Compute Platform side:

 - https://cloud.google.com/cloud-build/docs/deploying-builds/deploy-cloud-run
 - https://cloud.google.com/run/docs/continuous-deployment-with-cloud-build

This particular template github repo (dpark01/auspice-private-template)
currently deploys to this publicly accessible Cloud Run URL:
https://auspice-private-template-master-cp3chkcdyq-uc.a.run.app/
