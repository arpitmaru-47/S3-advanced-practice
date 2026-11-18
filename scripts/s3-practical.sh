

#!/bin/bash

set -euo pipefail

# Set your bucket name before running this script.
: "${BUCKET_NAME:?Please set BUCKET_NAME first}"

KEY="backups/database-backup.txt"
TEMP_DIR="$(mktemp -d)"

trap 'rm -rf "$TEMP_DIR"' EXIT

echo "Checking S3 bucket versioning..."

STATUS=$(aws s3api get-bucket-versioning \
  --bucket "$BUCKET_NAME" \
  --query Status \
  --output text 2>/dev/null || true)

if [ "$STATUS" != "Enabled" ]; then
  echo "Versioning is not enabled."
  echo "Enable versioning in the S3 Console first."
  exit 1
fi

echo "Versioning is enabled."

# Create Version 1
echo "Production backup - Version 1" \
  > "$TEMP_DIR/database-backup.txt"

aws s3 cp "$TEMP_DIR/database-backup.txt" \
  "s3://$BUCKET_NAME/$KEY"

# Create Version 2
echo "Production backup - Version 2" \
  > "$TEMP_DIR/database-backup.txt"

aws s3 cp "$TEMP_DIR/database-backup.txt" \
  "s3://$BUCKET_NAME/$KEY"

echo "Checking object encryption..."

aws s3api head-object \
  --bucket "$BUCKET_NAME" \
  --key "$KEY" \
  --query '{Encryption:ServerSideEncryption,VersionId:VersionId}'

echo "Listing object versions..."

aws s3api list-object-versions \
  --bucket "$BUCKET_NAME" \
  --prefix "$KEY" \
  --query 'Versions[*].[VersionId,IsLatest,LastModified]' \
  --output table

echo "S3 practical completed."
