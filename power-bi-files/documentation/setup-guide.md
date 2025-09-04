# Intune Power BI Dashboard Setup Guide

## Prerequisites
- Power BI Desktop (latest version)
- Microsoft Graph API access
- Azure App Registration with appropriate permissions

## Installation Steps

1. **Download Package**: Extract all files from the release package
2. **Open Power BI**: Launch Power BI Desktop
3. **Import Queries**: Copy Power Query code from `/power-query/` folder
4. **Apply DAX Measures**: Import DAX measures from `/dax-measures/` folder
5. **Configure Data Source**: Update API endpoints and authentication

## Authentication Setup

### Required Permissions
- Device.Read.All
- DeviceManagementManagedDevices.Read.All
- DeviceManagementApps.Read.All
- DeviceManagementConfiguration.Read.All

### Steps
1. Register app in Azure Portal
2. Configure API permissions
3. Update connection strings in Power Query
4. Test data refresh

## Customization

### Adding Custom Measures
- Open `/dax-measures/` files
- Copy desired measures to your Power BI model
- Modify as needed for your environment

### Modifying Queries
- Update API endpoints in Power Query files
- Adjust column mappings as required
- Test with sample data first

## Troubleshooting

### Common Issues
- **Authentication Errors**: Check app permissions and secrets
- **Data Refresh Failures**: Verify API endpoints and connectivity
- **Performance Issues**: Consider implementing incremental refresh

### Support
- GitHub Issues: Report bugs and feature requests
- Documentation: Check `/documentation/` folder for detailed guides
