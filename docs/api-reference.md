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

### Authentication Flow

1. **Client Credentials Flow**
   - Tenant ID
   - Client ID
   - Client Secret
   - Scope: `https://graph.microsoft.com/.default` (OAuth scope string for Microsoft Graph permissions - see [Microsoft Graph permissions reference](https://docs.microsoft.com/en-us/graph/permissions-reference))

2. **Token Acquisition**
   - POST to: `https://login.microsoftonline.com/{tenant-id}/oauth2/v2.0/token`
   - Content-Type: application/x-www-form-urlencoded

## Endpoints

### Device Management

#### Get All Managed Devices

```
GET https://graph.microsoft.com/v1.0/deviceManagement/managedDevices
```

**Response Fields:**
- id: Device identifier
- deviceName: Display name
- operatingSystem: OS type
- complianceState: Compliance status
- lastSyncDateTime: Last sync timestamp

#### Get Device Compliance Policies

```
GET https://graph.microsoft.com/v1.0/deviceManagement/deviceCompliancePolicies
```

#### Get Device Configurations

```
GET https://graph.microsoft.com/v1.0/deviceManagement/deviceConfigurations
```

### Application Management

#### Get Mobile Apps

```
GET https://graph.microsoft.com/v1.0/deviceAppManagement/mobileApps
```

#### Get App Installation Status

```
GET https://graph.microsoft.com/v1.0/deviceAppManagement/mobileApps/{app-id}/deviceStatuses
```

### User and Group Management

#### Get Users

```
GET https://graph.microsoft.com/v1.0/users
```

#### Get Groups

```
GET https://graph.microsoft.com/v1.0/groups
```

## Response Formats

### Standard Response Structure

```json
{
  "@odata.context": "https://graph.microsoft.com/v1.0/$metadata#...",
  "@odata.count": 100,
  "value": [
    {
      "id": "string",
      "property1": "value1",
      "property2": "value2"
    }
  ],
  "@odata.nextLink": "https://graph.microsoft.com/v1.0/..."
}
```

### Error Response

```json
{
  "error": {
    "code": "string",
    "message": "string",
    "details": []
  }
}
```

## Error Handling

### Common Error Codes

• 400 Bad Request: Invalid request syntax  
• 401 Unauthorized: Authentication failed  
• 403 Forbidden: Insufficient permissions  
• 404 Not Found: Resource not found  
• 429 Too Many Requests: Rate limit exceeded  
• 500 Internal Server Error: Server error

### Retry Logic

- Implement exponential backoff
- Maximum retry attempts: 3
- Retry on: 429, 502, 503, 504 status codes

## Rate Limits

• Per Application: 10,000 requests per 10 minutes  
• Per User: 1,000 requests per 10 minutes  
• Batch Requests: Up to 20 individual requests

## Examples

### PowerBI M Query Example

```m
let
    // Authentication
    TokenUrl = "https://login.microsoftonline.com/" & TenantId & "/oauth2/v2.0/token",
    TokenResponse = Json.Document(Web.Contents(TokenUrl, [
        Content = Text.ToBinary("grant_type=client_credentials&client_id=" & ClientId & "&client_secret=" & ClientSecret & "&scope=https://graph.microsoft.com/.default")
    ])),
    AccessToken = TokenResponse[access_token],
    
    // API Request
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

- [Microsoft Graph API Documentation](https://docs.microsoft.com/en-us/graph/)
- [Microsoft Graph Explorer](https://developer.microsoft.com/en-us/graph/graph-explorer)
- [Intune Data Warehouse API](https://learn.microsoft.com/mem/intune/developer/reports-ref-intune-data-warehouse)
- [Power BI REST API](https://docs.microsoft.com/en-us/rest/api/power-bi/)
