
# AWS Advanced – Chapter 3: S3 Advanced

## Project Overview

This project covers Amazon S3 advanced concepts and practical exercises as part of my Cloud & DevOps learning roadmap.

The objective is to understand secure object storage, access management, encryption, versioning, lifecycle automation, replication, and temporary file access using AWS S3.

## AWS Services & Tools

- Amazon S3
- AWS IAM
- AWS CLI
- AWS KMS (concepts)
- AWS Lambda (event notification concepts)
- Amazon CloudTrail (auditing concepts)

## Topics Covered

| Lesson | Topic |
|---|---|
| 01 | S3 Architecture & Fundamentals |
| 02 | Bucket Policies & Access Control |
| 03 | Versioning & Object Recovery |
| 04 | Storage Classes & Lifecycle Rules |
| 05 | Encryption & Security |
| 06 | Replication & Backup |
| 07 | Static Website, Presigned URLs & Event Notifications |
| 08 | Secure S3 Production Project |

## Repository Structure

```text
Chapter-3-S3-Advanced/
├── README.md
├── scripts/
│   └── s3-practical.sh
├── policies/
│   └── bucket-readonly-policy.json
└── lifecycle/
    └── lifecycle-rule.json
```

## Key Features Practiced

- Creating and managing S3 buckets
- Uploading and downloading objects
- Configuring bucket policies
- Enabling object versioning
- Recovering previous object versions
- Understanding S3 storage classes
- Creating lifecycle rules
- Configuring server-side encryption
- Understanding Cross-Region Replication
- Generating presigned URLs
- Understanding S3 event notifications

## AWS CLI Commands

List buckets:

```bash
aws s3 ls
```

Upload an object:

```bash
aws s3 cp test.txt s3://YOUR-BUCKET-NAME/
```

Download an object:

```bash
aws s3 cp s3://YOUR-BUCKET-NAME/test.txt downloaded.txt
```

Check encryption:

```bash
aws s3api head-object \
  --bucket YOUR-BUCKET-NAME \
  --key test.txt
```

Check versioning:

```bash
aws s3api get-bucket-versioning \
  --bucket YOUR-BUCKET-NAME
```

List object versions:

```bash
aws s3api list-object-versions \
  --bucket YOUR-BUCKET-NAME
```

## Security Best Practices

- Keep S3 Block Public Access enabled unless public access is explicitly required.
- Use IAM least-privilege permissions.
- Enable default bucket encryption.
- Enable versioning for important data.
- Avoid storing AWS credentials in source code.
- Use HTTPS for data transfers.
- Review bucket policies regularly.
- Protect presigned URLs because they grant temporary access.

## Cost Management

- Review S3 storage and request charges.
- Understand minimum storage duration charges.
- Avoid unnecessary cross-region replication.
- Review lifecycle transitions before enabling them.
- Remove unused test resources after verification.

## Project Status

**Learning and implementation in progress.**

Practical configurations and project verification will be updated as they are completed.

## Disclaimer

This repository is for educational purposes. Replace placeholder bucket names and account IDs with your own values before running commands. Never commit AWS credentials, private keys, sensitive account information, or active presigned URLs.
