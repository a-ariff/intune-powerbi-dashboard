# API Reference

## Overview
This document provides technical implementation details for the Microsoft Graph API endpoints used in the Intune Power BI Dashboard.

## Table of Contents
- [Authentication](#authentication)
- [Endpoints](#endpoints)
- [Response Formats](#response-formats)
- [Error Handling](#error-handling)
- [Rate Limits](#rate-limits)
- [Examples](#examples)

## Authentication

### Service Principal Configuration
The dashboard uses Microsoft Graph API with service principal authentication:

```
Application Type: Web Application
Permissions Required:
- Device.Read.All
- DeviceManagementConfiguration.Read.All
- DeviceManagementApps.Read.All
- DeviceManagementManagedDevices.Read.All
- Directory.Read.All
```

### Token Acquisition
```
Endpoint: https://login.microsoftonline.com/{tenant-id}/oauth2/v2.0/token
Method: POST
Content-Type: application/x-www-form-urlencoded

Parameters:
- grant_type: client_credentials
- client_id: {your-client-id}
- client_secret: {your-client-secret}
- scope: https://graph.microsoft.com/.default
```

## Endpoints

### Managed Devices
```
GET https://graph.microsoft.com/v1.0/deviceManagement/managedDevices
```

Returns information about all managed devices including:
- Device name and model
- Operating system version
- Compliance status
- Last sync time
- User assignments

### Device Compliance Policies
```
GET https://graph.microsoft.com/v1.0/deviceManagement/deviceCompliancePolicies
```

### Device Configuration Profiles
```
GET https://graph.microsoft.com/v1.0/deviceManagement/deviceConfigurations
```

### Mobile Applications
```
GET https://graph.microsoft.com/v1.0/deviceAppManagement/mobileApps
```

## Response Formats

### Standard Response Structure
```json
{
  "@odata.context": "https://graph.microsoft.com/v1.0/$metadata#deviceManagement/managedDevices",
  "@odata.count": 150,
  "value": [
    {
      "id": "device-id-here",
      "userId": "user-id-here",
      "deviceName": "Device Name",
      "managedDeviceOwnerType": "company",
      "enrolledDateTime": "2023-01-01T00:00:00Z",
      "lastSyncDateTime": "2023-12-01T00:00:00Z",
      "operatingSystem": "Windows",
      "osVersion": "10.0.19045",
      "deviceType": "desktop",
      "complianceState": "compliant"
    }
  ]
}
```

## Error Handling

### Common HTTP Status Codes
- `200 OK`: Request successful
- `401 Unauthorized`: Invalid or expired token
- `403 Forbidden`: Insufficient permissions
- `404 Not Found`: Resource not found
- `429 Too Many Requests`: Rate limit exceeded
- `500 Internal Server Error`: Server error

### Error Response Format
```json
{
  "error": {
    "code": "Forbidden",
    "message": "Insufficient privileges to complete the operation.",
    "innerError": {
      "date": "2023-12-01T00:00:00",
      "request-id": "request-id-here"
    }
  }
}
```

## Rate Limits

### Microsoft Graph Service Limits
- **Per application per tenant**: 10,000 requests per 10 minutes
- **Per application across all tenants**: 100,000 requests per 10 minutes
- **Per tenant for all applications**: 1,000,000 requests per 10 minutes

### Best Practices
- Implement exponential backoff for 429 responses
- Use delta queries for incremental updates
- Batch requests when possible
- Cache responses appropriately

## Examples

### Power Query (M) Example
```m
let
    AccessToken = "your-access-token-here",
    Headers = [#"Authorization" = "Bearer " & AccessToken],
    ApiUrl = "https://graph.microsoft.com/v1.0/deviceManagement/managedDevices",
    Response = Json.Document(Web.Contents(ApiUrl, [Headers = Headers]))
in
    Response
```

### PowerShell Example
```powershell
# Get Access Token
$tokenUrl = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token"
$body = @{
    grant_type = "client_credentials"
    client_id = $clientId
    client_secret = $clientSecret
    scope = "https://graph.microsoft.com/.default"
}
$tokenResponse = Invoke-RestMethod -Uri $tokenUrl -Method Post -Body $body

# Make API Request
$headers = @{
    Authorization = "Bearer $($tokenResponse.access_token)"
}
$devices = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/deviceManagement/managedDevices" -Headers $headers
```

## Additional Resources
- [Microsoft Graph API Documentation](https://learn.microsoft.com/en-us/graph/)
- [Microsoft Graph Explorer](https://developer.microsoft.com/en-us/graph/graph-explorer)
- [Power BI REST API](https://learn.microsoft.com/en-us/rest/api/power-bi/)
