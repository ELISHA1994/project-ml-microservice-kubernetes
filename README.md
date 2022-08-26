[![ELISHA1994](https://circleci.com/gh/ELISHA1994/project-ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/ELISHA1994/project-ml-microservice-kubernetes)


## Project Overview

Project-ml-microservice-kubernetes is a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, 
such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. 
You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). 
This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. 
This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
    ```bash
    python3 -m pip install --user virtualenv
    # You should have Python 3.7 available in your host. 
    # Check the Python path using `which python3`
    # Use a command similar to this one:
    python3 -m virtualenv --python=<path-to-Python3.7> .devops
    source .devops/bin/activate
    ```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py` 
   - By running this standalone command you would be able able to start the app and run predictions in another terminal by running the script `./make_prediction.sh` in another terminal window.
2. Run in Docker:  `./run_docker.sh`  
   - Run the script  `./run_docker.sh` to build the docker image for this project.3. Ensure you run this command `docker login` and in order to authenticate with your docker hub account.
3. Run in Kubernetes:  `./run_kubernetes.sh` 
   - In order to deploy the docker image in kubernetes, you would first need to ensure that you have your cluster up and running by running the command `kubectl config view` where you should see at least one cluster with a `certificate-authority` and `server` after which you should run the script `./run_kubernetes`

### Kubernetes Steps

* Setup and Configure Docker locally
    - Run the command `docker build -t <dockerhub ID>/<image-tag-name> . ` to build the app locally
    - After building the  app locally, run the command `docker run -p <host port>:<container port> <dockerhub ID>/<image-tag-name> ` in order to test that your docker.
    - Run the script `./make_prediction.sh` to confirm that you can make predictions
    - Run the script `./upload_docker.sh` to push the image to your dockerhub account* 
* Setup and Configure Kubernetes locally
    - To set up your kubernetes cluster locally, install `minikube` on your machine and then run the command `minikube start`
    - After the cluster has been started you are ready to deploy your docker image in that cluster.* 
* Create Flask app in Container
    - To deploy the app to kubernetes cluster, run the script `./run_kubernetes.sh`
    - This script would deploy your app into the container as well as list the pods and lastly port forward the port of the container to the host.
      At first run of the script the container is still being created and the port forwarding would fail because the container is still pending, wait for a couple of minutes before running the script again, and you would see the port correctly port forwarded.* 
* Run via kubectl
    - Run the command `kubectl get pods` and `kubectl logs <container name>` to get the running pods and also see the log of the running pod
    - Keeping the pod running you can run the script `.make_prediction.sh` to be sure that your app is running in the cluster and still accessible.* 
