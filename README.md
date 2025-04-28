
# AdvFastAPI-EKS 🚀

## 📌 Project Overview
This project deploys a **production-ready FastAPI app** to **Amazon EKS (Elastic Kubernetes Service)** using:
- **Terraform** for infrastructure as code (IaC)
- **GitHub Actions** for full CI/CD automation:
  - CI: Test the FastAPI app (unit tests, lint, coverage)
  - CD: Deploy the app to EKS cluster (after CI passes)

---

## 🛠️ Project Structure
```
AdvFastAPI-EKS/
├── app/                     # FastAPI app (main.py)
├── terraform/               # Terraform infrastructure (EKS, VPC, IAM, etc.)
├── k8s/                     # Kubernetes manifests (Deployment, Service)
├── .github/
│   └── workflows/
│       ├── terraform.yml    # CI for Terraform (plan/apply)
│       ├── ci.yml           # App tests (pytest, coverage, lint)
│       └── cd.yml           # CD pipeline (deploy app to EKS)
├── .gitignore               # Ignore Terraform state files, Python cache, etc.
├── Makefile                 # Shortcut commands for Terraform
├── README.md                # This file
```

---

## ✅ Requirements

### **🖥️ Local Development (for manual commands):**
- **Git**
- **Python 3.10**
- **Docker** (if testing container builds locally)
- **Terraform 1.5+**
- **AWS CLI v2**
- **kubectl** (matching your EKS Kubernetes version)
- (Optional) **Make** (for easy `make init`, `make plan`, `make apply`)

---

### **☁️ AWS Setup:**
- AWS Account ✅
- IAM User or Role with these permissions:
  - `AmazonEKSFullAccess`
  - `AmazonEC2FullAccess`
  - `AmazonVPCFullAccess`
  - `IAMFullAccess`
  - (Optional for CI/CD: use OIDC Assume Role later)
- **Secrets in GitHub:**
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`

---

## 🚀 How to Deploy Infrastructure Manually (Local)

1. Initialize Terraform:
   ```bash
   make init
   ```
2. Review the plan:
   ```bash
   make plan
   ```
3. Apply the infrastructure:
   ```bash
   make apply
   ```
4. (Optional) Destroy everything:
   ```bash
   make destroy
   ```

---

## 🟢 How to Test the FastAPI App Locally

```bash
cd app
pip install -r requirements.txt
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

Test in your browser:
```
http://localhost:8000/
http://localhost:8000/hello/YourName
```

---

## 📋 How the CI/CD Works

| Workflow        | Purpose                            | Trigger           |
|-----------------|------------------------------------|-------------------|
| `terraform.yml` | Terraform format check, validate, plan (apply optional) | On push/PR to `main` |
| `ci.yml`        | FastAPI unit tests, lint, coverage | On push/PR to `main` |
| `cd.yml`        | Deploy the app to EKS via kubectl  | After push to `main` |

---

## 📂 Kubernetes Deployment

### **Deployment Manifest:**
- `k8s/deployment.yaml`: Defines your FastAPI app Deployment (replicas, container image).
- `k8s/service.yaml`: Exposes the app via **LoadBalancer** (external IP assigned by AWS ELB).

---

## 🌐 How to Access the App (After Deployment)
1. Check external service IP:
   ```bash
   kubectl get svc
   ```
2. Test the endpoint:
   ```
   http://<external-ip>/
   http://<external-ip>/hello/YourName
   ```

---

## ⚡ Next Steps (Optional Enhancements)
- Push Docker image to ECR automatically.
- Switch AWS authentication from Access Key/Secret to **OIDC Assume Role** (recommended).
- Add Helm chart support (instead of plain YAML).
- Add Prometheus/Grafana for monitoring.

---

## 🛡️ License
MIT License — Free to use and modify.

---
