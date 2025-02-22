# Node.js API - Infrastructure and CI/CD Setup

## Overview
This repository contains the infrastructure and CI/CD pipeline setup for a **Node.js API** that generates dummy data. The API allows users to specify the fields (first name, last name, email, phone number, etc.) and the number of records required. The system is designed with **high availability, security, and automated deployments**.

---

## **Architecture**
### **Key Components**
1. **AWS ECS (Fargate)** - Deploys and manages the containerized Node.js API.
2. **AWS ALB (Application Load Balancer)** - Handles routing and load balancing.
3. **AWS WAF (Web Application Firewall)** - Implements rate limiting and security rules.
4. **AWS Cognito** - Provides user authentication at the infrastructure level.
5. **AWS Route 53** - Manages domain names and DNS resolution.
6. **AWS CloudWatch** - Monitors API logs and performance.
7. **Prometheus & Grafana** - Collects and visualizes API metrics.
8. **Terraform** - Manages infrastructure as code (IaC).
9. **GitHub Actions** - Implements CI/CD pipeline automation.
10. **SonarQube & Trivy** - Ensures code quality and security.

---

## **CI/CD Pipeline** (GitHub Actions)
### **Workflow Steps**
1. **Linting & Code Quality**
   - ESLint for code formatting.
   - SonarQube for static code analysis.
2. **Security Scanning**
   - Trivy for container vulnerability scanning.
   - OWASP dependency check.
3. **Docker Build & Push**
   - Dockerize the Node.js API.
   - Push the image to AWS ECR.
4. **Blue-Green Deployment on AWS ECS**
   - Deploy the new version while keeping the old one active.
   - Switch traffic using AWS ALB when deployment is verified.
5. **Monitoring & Alerts**
   - Integrate Prometheus & Grafana.
   - Set up CloudWatch alerts for API health.

---

## **Infrastructure as Code (Terraform)**
### **Terraform Modules**
- **VPC & Networking**
- **ECS Cluster & Task Definitions**
- **ALB, Target Groups & WAF Rules**
- **AWS Cognito for Authentication**
- **CloudWatch Logging**
- **ECR for Image Storage**

---

## **Architecture Diagram**
_A detailed architecture diagram showcasing the infrastructure components and their interactions will be included._

---

## **Repository Structure**
```plaintext
├── terraform/             # Terraform scripts for AWS infrastructure
│   ├── vpc.tf            # VPC & networking setup
│   ├── ecs.tf            # ECS cluster & task definitions
│   ├── alb.tf            # Load Balancer setup
│   ├── waf.tf            # WAF rate limiting rules
│   ├── cognito.tf        # Authentication setup
│   ├── cloudwatch.tf     # Monitoring setup
│   ├── ecr.tf            # AWS ECR for storing Docker images
│   ├── outputs.tf        # Terraform output values
│   ├── main.tf           # Main Terraform entry point
│
├── .github/workflows/     # GitHub Actions CI/CD Pipeline
│   ├── ci-cd.yml         # CI/CD workflow file
│
├── diagrams/             # Architecture diagrams
│   ├── architecture.png  # System architecture diagram
│
├── README.md             # Project Documentation
```

---

## **Setup & Deployment**
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/your-username/nodejs-api-architecture.git
   cd nodejs-api-architecture
   ```
2. **Deploy Infrastructure using Terraform:**
   ```sh
   terraform init
   terraform apply -auto-approve
   ```
3. **Push Code & Trigger CI/CD Pipeline:**
   - Commit & push your code.
   - GitHub Actions will build, test, scan, and deploy automatically.

---

## **Next Steps**
- Implement the architecture in AWS.
- Test API endpoints and security configurations.
- Optimize infrastructure costs and performance.

---

