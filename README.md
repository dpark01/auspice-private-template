# auspice_private_template
This contains a template git repo that allows for continuous deploy of
Auspice servers to Google Cloud Run (serverless web via docker)
via Google Cloud Builder (CI) to Google Container Registery (docker registry)
based on data (augur export jsons and narrative markdowns) in a private
github repo. This repo is public, and populated with example data,
simply fork it to a private repo, add your own data, and set up the
build triggers.

This repo can contain any number of paired json & md files which comprise a 
nextstrain dataset with paired narrative.

After properly setting up build triggers, each push to this repo will 
trigger a Google Cloud Build which will build the Dockerfile and push to 
Google Container Registry. Google Cloud Build will then deploy this 
container to Google Cloud Run for auto-scaled serverless hosting of the 
web app.

More instructions on how this is set up on the Google Compute Platform side:

 - https://cloud.google.com/cloud-build/docs/deploying-builds/deploy-cloud-run
 - https://cloud.google.com/run/docs/continuous-deployment-with-cloud-build
