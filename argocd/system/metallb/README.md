# Installation
Before deploying the app:
    
    kubect create namespace metallb-system
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
