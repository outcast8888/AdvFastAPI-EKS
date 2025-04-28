
# AdvFastAPI-EKS Project

## 🚀 Overview
This project deploys a production-ready FastAPI app using:
- **AWS EKS** (Elastic Kubernetes Service)
- **Terraform** for infrastructure as code
- **GitHub Actions** for CI/CD automation

## 📂 Project Structure
AdvFastAPI-EKS/ 
├── app/ # FastAPI app 
├── terraform/ # Terraform infrastructure 
├── .github/ # CI/CD workflows 
├── .gitignore # Ignore sensitive and generated files 
├── Makefile # Helper commands for local usage 
├── README.md # This file!

## 📡 Live Demo & Source

- 🌐 App: 
- 🗂️ GitHub: [AdvFastAPI](https://github.com/outcast8888/AdvFastAPI)

---



## 🟢 Deployment Environments
- Development environment via Terraform and GitHub Actions.

## ⚡ Quick Commands
```bash
make init
make plan
make apply
make destroy
