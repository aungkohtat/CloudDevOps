# Learning-CDN-in-AWS
![](/Learning-CDN-in-AWS/img/Untitled-9.png)

Part I: Deploy S3 static website

Prepare Your S3 Bucket with Static Website

### Step 1: Set Up the S3 Bucket

1. **Create an S3 Bucket**:
- Click on **Create bucket**.
- Enter a unique bucket name
    
    In this lab, my bucketname is static-website-testing123
    
- Choose a region (e.g., `ap-southeast-1`).
- Leave the rest of the settings as default and click **Create bucket**.

![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.04.12 PM.png)

![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.05.10 PM.png)

![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.06.51 PM.png)
![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.09.57 PM.png)

2. **Upload Website Files**:
- Click on your newly created bucket.
- Click on the **Upload** button.
- Add your website files (e.g., `index.html`, `styles.css`, inside-out-movie.jpeg) and click **Upload**.

![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.16.23 PM.png)

3. **Enable Static Website Hosting**:
- Go to the **Properties** tab.
- Scroll down to **Static website hosting**.
- Select **Enable**.
- Choose **Host a static website**.
- Specify the **Index document** (e.g., `index.html`).
- Optionally, specify the **Error document** (e.g., `error.html`).
- Click **Save changes**.

![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.16.23 PM.png)

### Step 2: Configure Bucket Policy for Public Access

- **Block Public Access Settings**:
    - Go to the **Permissions** tab.
    - Click on **Block public access (bucket settings)**.
    - Click **Edit**.
    - Uncheck **Block all public access** and confirm by clicking **Save changes**.
- **Set Bucket Policy**:
    - Still in the **Permissions** tab, scroll down to **Bucket policy** and click **Edit**.
    - Add the following policy to allow public read access to your bucket:

![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.21.38 PM.png)


**BucketPolicy**

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::akhstaticwebsite/*"
        }
    ]
}
```
![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.24.44 PM.png)

- Replace akhstaticwebsite with your actual bucket name.
- Click **Save changes**.

### Step 3: Access Your Static Website

1. **Get the Website URL**:
    - Go to the **Properties** tab of your S3 bucket.
    - Under **Static website hosting**, you will see the **Bucket website endpoint** (e.g., `http://`akhstaticwebsite`.s3-website-ap-southeast-1.amazonaws.com`).
2. **Access the Website**:
    - Open a web browser.
    - Enter the bucket website endpoint URL.
    - You should see your `index.html` page load.


![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.34.41 PM.png)

# Part II - Create CloudFront for Static Website

### After completing S3 bucket, head over to the CloudFront console in AWS and hit the “Create distribution” button.

![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.39.41 PM.png)

![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.41.47 PM.png)

![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.42.39 PM.png)

![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.44.39 PM.png)

Then access it from browser,

For static website ⇒ distribution endpoint can access static website ( without /index.html ( object route ) )

![](/Learning-CDN-in-AWS/img/Screenshot%202024-08-11%20at%205.46.28 PM.png)
