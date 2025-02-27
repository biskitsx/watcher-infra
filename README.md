# Watcher-Infra

## Overview
Watcher-Infra is the GitOps infrastructure repository for managing the deployment and lifecycle of the **Watcher Application** using Kubernetes and Terraform. It leverages **ArgoCD** for continuous deployment and **Terraform** for provisioning infrastructure on Google Cloud Platform (GCP).

## Repository Structure
```
.
├── gitops
│   ├── apps
│   │   ├── argocd-ingress
│   │   ├── ingress
│   │   ├── sealed-secrets
│   │   ├── watcher
│   │   ├── kustomization.yaml
│   └── root
├── infrastructure
│   ├── gcp
│   │   ├── environments
│   │   ├── modules
│   ├── k8s
│   │   └── bootstrap
│   │       └── argocd
```

### 1. GitOps
![GitOps](https://img5.pic.in.th/file/secure-sv1/Screenshot-2568-02-27-at-14.26.43.png)
The `gitops` directory contains all the application deployment configurations using **ArgoCD**:
- **apps/**: Houses individual application configurations.
  - **argocd-ingress/**: Manages ingress for ArgoCD.
  - **sealed-secrets/**: Securely stores sensitive information using Sealed Secrets.
  - **watcher/**: Manages the deployment of the Watcher Application with kustomization overlays.
- **root/**: Contains the ArgoCD root application to manage all sub-applications.

### 2. Infrastructure
![Infrastructure](https://img5.pic.in.th/file/secure-sv1/Blank-Diagram-2.png)
The `infrastructure` directory contains Terraform code to provision infrastructure on **Google Cloud Platform (GCP)**:
- **gcp/**: Contains Terraform configurations for GCP infrastructure.
  - **environments/**: Defines environment-specific configurations (e.g., `dev`).
  - **modules/**: Reusable Terraform modules for managing APIs, GKE, IAM, networking, etc.
- **k8s/**: Kubernetes bootstrapping configurations.
  - **bootstrap/argocd/**: ArgoCD bootstrapping manifests.

## Deployment Pipeline
### Infrastructure Provisioning
1. **Terraform** is used to provision GCP resources:
   ```bash
   cd infrastructure/gcp/environments/dev
   terraform init
   terraform apply
   ```
2. This sets up:
   - **Google Kubernetes Engine (GKE) Cluster**
   - **VPC, Subnets, Firewall Rules, NAT Gateway**
   - **IAM Roles & Service Accounts**

### GitOps Deployment
1. **Bootstrap ArgoCD**:
   ```bash
   kubectl apply -k infrastructure/k8s/bootstrap/argocd/
   ```
2. **Deploy Applications via ArgoCD**:
   - ArgoCD syncs applications from the `gitops/apps/` directory.
   - The `watcher` application gets deployed based on `kustomization.yaml` overlays.

## Architecture
The following architecture represents the infrastructure deployed by `watcher-infra`:
![Infrastructur](https://img5.pic.in.th/file/secure-sv1/Blank-Diagram-2.png)

### Key Components
- **Load Balancer**: Routes external traffic to Nginx Ingress.
- **GKE Cluster**: Hosts the Watcher Application.
- **Cloud NAT**: Allows private GKE nodes to access external services securely.
- **ArgoCD**: Manages application deployment in a declarative manner.

## GitOps Workflow
This repository follows a **GitOps** approach:
1. Developers update manifests in `gitops/`
2. Changes are pushed to the repository.
3. ArgoCD automatically syncs the changes with the cluster.

## Getting Started
### Prerequisites
- **Google Cloud SDK**
- **Terraform**
- **kubectl**
- **ArgoCD CLI**

### Setting Up
1. Clone the repository:
   ```bash
   git clone https://github.com/your-org/watcher-infra.git
   cd watcher-infra
   ```
2. Initialize and apply Terraform to set up the infrastructure.
3. Bootstrap ArgoCD and sync applications.

## Contributing
Contributions are welcome! Please follow the standard Git flow for submitting changes.

## License
This project is licensed under the MIT License.