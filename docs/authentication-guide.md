# Microsoft Intune Power BI Dashboard Authentication Guide

## Overview

This guide provides detailed instructions for setting up authentication and permissions required for the Microsoft Intune Power BI Dashboard to access Microsoft Graph API endpoints.

## Prerequisites

- Microsoft 365 Global Administrator or Intune Administrator role
- Azure Active Directory Premium license
- Power BI Pro or Premium license
- Microsoft Graph PowerShell SDK (optional for automation)

## Authentication Methods

### Method 1: Service Principal (Recommended for Production)

#### Step 1: Create App Registration

1. Navigate to [Azure Portal](https://portal.azure.com)
2. Go to **Azure Active Directory** > **App registrations**
3. Click **New registration**
4. Provide the following details:
   - **Name**: `Intune-PowerBI-Dashboard`
   - **Supported account types**: Accounts in this organizational directory only
   - **Redirect URI**: Leave blank for now
5. Click **Register**

#### Step 2: Configure API Permissions

Add the following Microsoft Graph permissions:

**Application Permissions (Recommended):**
- `DeviceManagementApps.Read.All`
- `DeviceManagementConfiguration.Read.All`
- `DeviceManagementManagedDevices.Read.All`
- `DeviceManagementServiceConfig.Read.All`
- `Directory.Read.All`
- `User.Read.All`
- `Group.Read.All`

**Steps to add permissions:**
1. In your app registration, go to **API permissions**
2. Click **Add a permission**
3. Select **Microsoft Graph**
4. Choose **Application permissions**
5. Add each permission listed above
6. Click **Grant admin consent** (requires admin privileges)

#### Step 3: Create Client Secret

1. Go to **Certificates & secrets**
2. Click **New client secret**
3. Provide description: `PowerBI-Dashboard-Secret`
4. Set expiration: 24 months (recommended)
5. Click **Add**
6. **Important**: Copy the secret value immediately (it won't be shown again)

#### Step 4: Note Required Information

Record the following information for Power BI configuration:
- **Application (client) ID**
- **Directory (tenant) ID**
- **Client secret value**

### Method 2: Delegated Access (Interactive)

#### Step 1: Create App Registration

Follow Step 1 from Method 1 above, but add a redirect URI:
- **Redirect URI**: `https://login.microsoftonline.com/common/oauth2/nativeclient`

#### Step 2: Configure API Permissions

Add the following Microsoft Graph **Delegated permissions**:
- `DeviceManagementApps.Read.All`
- `DeviceManagementConfiguration.Read.All`
- `DeviceManagementManagedDevices.Read.All`
- `DeviceManagementServiceConfig.Read.All`
- `Directory.Read.All`
- `User.Read.All`
- `Group.Read.All`

## Power BI Configuration

### For Service Principal Authentication

1. Open Power BI Desktop
2. In the Power Query Editor, use the following parameters:
   ```
   ClientId = "your-application-client-id"
   TenantId = "your-tenant-id"
   ClientSecret = "your-client-secret"
   ```

3. Use the base connection template provided in `src/power-query/base-connection.m`

### For Delegated Authentication

1. When prompted during data refresh, sign in with an account that has:
   - Intune Administrator role
   - Global Administrator role (if accessing directory information)

## Security Best Practices

### 1. Principle of Least Privilege
- Only grant the minimum required permissions
- Regularly review and audit permissions
- Use service principal authentication for production environments

### 2. Secret Management
- Store client secrets in Azure Key Vault
- Set appropriate expiration dates
- Rotate secrets regularly
- Never commit secrets to source control

### 3. Monitoring and Auditing
- Enable Azure AD sign-in logs
- Monitor API usage through Azure portal
- Set up alerts for unusual access patterns

### 4. Access Control
- Limit service principal access to specific IP ranges if possible
- Use Conditional Access policies
- Implement regular access reviews

## Troubleshooting Common Issues

### Error: "Insufficient privileges to complete the operation"

**Solution:**
1. Verify all required permissions are granted
2. Ensure admin consent has been provided
3. Check that the user/service principal has appropriate Intune roles

### Error: "Invalid client secret"

**Solution:**
1. Verify the client secret hasn't expired
2. Check for any extra spaces in the secret value
3. Generate a new client secret if necessary

### Error: "The tenant does not have a subscription to Microsoft Intune"

**Solution:**
1. Verify Intune licensing is properly assigned
2. Check that the tenant has an active Intune subscription
3. Ensure the authenticating account has access to Intune

### Power BI Refresh Failures

**Solution:**
1. Check if the service principal credentials are correctly configured
2. Verify that the refresh time doesn't conflict with any maintenance windows
3. Ensure the service principal hasn't been disabled or deleted

## Permission Requirements by Data Source

### Device Information
- `DeviceManagementManagedDevices.Read.All`
- `Directory.Read.All` (for device details)

### Compliance Policies
- `DeviceManagementConfiguration.Read.All`
- `DeviceManagementManagedDevices.Read.All`

### Application Information
- `DeviceManagementApps.Read.All`
- `DeviceManagementManagedDevices.Read.All`

### User and Group Information
- `User.Read.All`
- `Group.Read.All`
- `Directory.Read.All`

## Automated Permission Setup Script

```powershell
# Install required modules
Install-Module Microsoft.Graph -Scope CurrentUser

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "Application.ReadWrite.All", "RoleManagement.ReadWrite.Directory"

# Create the application
$app = New-MgApplication -DisplayName "Intune-PowerBI-Dashboard" -SignInAudience "AzureADMyOrg"

# Create service principal
$sp = New-MgServicePrincipal -AppId $app.AppId

# Define required permissions
$permissions = @(
    "DeviceManagementApps.Read.All",
    "DeviceManagementConfiguration.Read.All",
    "DeviceManagementManagedDevices.Read.All",
    "DeviceManagementServiceConfig.Read.All",
    "Directory.Read.All",
    "User.Read.All",
    "Group.Read.All"
)

# Get Microsoft Graph service principal
$graphSp = Get-MgServicePrincipal -Filter "AppId eq '00000003-0000-0000-c000-000000000000'"

# Add permissions
foreach ($permission in $permissions) {
    $role = $graphSp.AppRoles | Where-Object { $_.Value -eq $permission }
    if ($role) {
        New-MgServicePrincipalAppRoleAssignment -ServicePrincipalId $sp.Id -PrincipalId $sp.Id -ResourceId $graphSp.Id -AppRoleId $role.Id
    }
}

# Output application details
Write-Host "Application ID: $($app.AppId)"
Write-Host "Tenant ID: $((Get-MgContext).TenantId)"
Write-Host "Please create a client secret in the Azure portal."
```

## Support and Resources

- [Microsoft Graph API Documentation](https://docs.microsoft.com/graph/)
- [Intune Graph API Reference](https://docs.microsoft.com/graph/api/resources/intune-graph-overview)
- [Power BI REST API](https://docs.microsoft.com/rest/api/power-bi/)
- [Azure AD App Registration Guide](https://docs.microsoft.com/azure/active-directory/develop/quickstart-register-app)

## Version History

- **v1.0** - Initial authentication guide
- **v1.1** - Added troubleshooting section
- **v1.2** - Added automated setup script

---

*Last updated: September 2024*
*For questions or support, please create an issue in the GitHub repository.*
