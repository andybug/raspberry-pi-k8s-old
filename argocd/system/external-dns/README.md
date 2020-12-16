# Installation
Create the secret for AWS account access:


    kubectl create namespace external-dns
    # use AWS access key for external-dns account
    kubectl -n external-dns create secret generic external-dns-aws --type kubernetes.io/basic-auth --from-literal=username=XYZ --from-literal=password=XYZ
