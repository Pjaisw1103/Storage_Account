<h1>📦 Azure Storage Account – Terraform Generic Module</h1>

<p>
A fully customizable, production-ready, and scalable Terraform module to deploy Azure Storage Accounts with 
<strong>dynamic network rules</strong>, <strong>optional parameters</strong>, and clean reusable code.
</p>

<hr>

<h2>📁 Folder Structure</h2>

<pre>
Storage_Account/
│
├── provider.tf        # Provider configurations
├── resource.tf        # Root resource linking to module (optional)
├── storage.tf         # Main storage account resource + dynamic blocks
├── variables.tf       # Input variable definitions
├── terraform.tfvars   # User-provided variable values
└── README.md          # Documentation
</pre>

<hr>

<h2>✨ Features</h2>

<ul>
  <li>✔ <strong>Generic Module</strong> — easily reusable for any storage account</li>
  <li>✔ <strong>Dynamic Network Rules</strong> — add multiple firewall rules dynamically</li>
  <li>✔ <strong>Optional Parameters</strong> — only set what you need</li>
  <li>✔ <strong>Production Standards</strong> — versioned provider + clean structure</li>
  <li>✔ <strong>Multiple Storage Accounts</strong> — uses <code>for_each</code> for scalability</li>
</ul>

<hr>

<h2>🚀 How It Works</h2>

<p>This module uses:</p>

<ul>
  <li><code>for_each</code> for creating multiple storage accounts</li>
  <li><code>dynamic "network_rules"</code> for flexible inbound rules</li>
  <li><code>optional()</code> in variables for clean & minimal tfvars</li>
  <li>Strong typing using <code>object()</code> + <code>map()</code></li>
</ul>

<hr>

<h2>🛠️ Usage Example (terraform.tfvars)</h2>

<p><em>Note:</em> Terraform configuration examples have been removed from this document. Please check the <strong><code>terraform.tfvars</code></strong> file in the repository for full example values and usage.</p>

<hr>

<h2>🧩 Variables Overview</h2>

<p><em>Note:</em> Detailed variable type definitions have been removed from this document. See <strong><code>variables.tf</code></strong> in the repository for the full schema and optional defaults.</p>

<hr>

<h2>🧱 Main Resource (storage.tf)</h2>

<p><em>Note:</em> The resource implementation was removed from this README. Please open <strong><code>storage.tf</code></strong> in the repo to view the storage account resource and dynamic blocks.</p>

<hr>

<h2>▶️ Run the Module</h2>

<p>1️⃣ <strong>Initialize Terraform</strong><br><code>terraform init</code></p>

<p>2️⃣ <strong>Validate Configuration</strong><br><code>terraform validate</code></p>

<p>3️⃣ <strong>Plan Resources</strong><br><code>terraform plan</code></p>

<p>4️⃣ <strong>Apply Changes</strong><br><code>terraform apply -auto-approve</code></p>

<hr>

<h2>🎯 Final Notes</h2>

<p>
This module is built to scale for <strong>any environment</strong> (Dev/QA/Prod).<br>
Easy to integrate with <strong>Azure DevOps</strong>, <strong>GitHub Actions</strong>, and CI/CD pipelines.<br>
Clean & reusable — perfect for teams and enterprise usage.
</p>

<hr>

<h2>💡 Author</h2>

<p>
👩‍💻 <strong>Priya Jaiswal</strong><br>
🌐 Terraform | Azure | DevOps
</p>
