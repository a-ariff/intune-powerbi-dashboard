# README Backup - Intune PowerBI Dashboard

> **⚠️ Notice**: This is a backup copy of the main README file. For the most up-to-date documentation, please refer to the [main README.md](README.md).

## 🏷️ Status Badges

<!-- Badge placeholders - update these with actual project badges -->
![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![PowerBI](https://img.shields.io/badge/PowerBI-compatible-yellow)
![Intune](https://img.shields.io/badge/Intune-supported-orange)

## 📋 Project Overview

This backup document provides essential information about the Intune PowerBI Dashboard project. The dashboard is designed to visualize and analyze Microsoft Intune device management data through Power BI reports.

**Key Features:**
- Real-time device compliance monitoring
- Security posture visualization
- Software inventory tracking
- Policy compliance reporting
- User and device management insights

## 🚀 Quick Setup

### Prerequisites
- Microsoft Power BI Desktop
- Microsoft Intune subscription
- Appropriate Azure AD permissions
- PowerBI Pro license (for sharing)

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/a-ariff/intune-powerbi-dashboard.git
   cd intune-powerbi-dashboard
   ```

2. **Open Power BI Template**
   - Launch Power BI Desktop
   - Open `templates/intune-dashboard-template.pbit`

3. **Configure Data Source**
   - Enter your Intune Data Warehouse endpoint
   - Authenticate with organizational account
   - Refresh data connections

## 💡 Usage Guide

### Basic Operations

1. **Data Refresh**: Use the refresh button in Power BI to update dashboard data
2. **Filtering**: Apply date ranges and device filters as needed
3. **Export**: Export reports to PDF or PowerPoint for sharing
4. **Drill-down**: Click on charts to explore detailed device information

### Dashboard Navigation

- **Overview Tab**: High-level compliance and security metrics
- **Devices Tab**: Detailed device inventory and status
- **Compliance Tab**: Policy compliance tracking
- **Software Tab**: Application inventory and version management

## 🔧 Troubleshooting

### Common Issues

#### Authentication Problems
- **Issue**: "Access Denied" when connecting to Intune
- **Solution**: Verify Azure AD permissions and organizational account access
- **Required Permissions**: 
  - DeviceManagementConfiguration.Read.All
  - DeviceManagementManagedDevices.Read.All
  - DeviceManagementApps.Read.All

#### Data Loading Issues
- **Issue**: Dashboard shows no data or outdated information
- **Solution**: Check data refresh settings and Intune Data Warehouse availability
- **Tip**: Verify the endpoint URL is correct for your tenant

#### Performance Problems
- **Issue**: Slow dashboard loading or timeouts
- **Solution**: Optimize date ranges and implement incremental refresh
- **Best Practice**: Use scheduled refresh instead of real-time updates

#### Query Errors
- **Issue**: Power Query errors during data import
- **Solution**: Check the `src/power-query/` files for syntax errors
- **Debug**: Use Power BI Query Editor to test individual queries

### Getting Help

1. Check the [main README.md](README.md) for detailed documentation
2. Review the `docs/` folder for specific guides:
   - [Authentication Guide](docs/authentication-guide.md)
   - [Deployment Guide](docs/deployment-guide.md)
   - [Troubleshooting Guide](docs/troubleshooting.md)
3. Open an issue in this repository for bug reports
4. Consult Microsoft's Intune and Power BI documentation

## 📚 Additional Resources

### Documentation Links
- **Main Documentation**: [README.md](README.md) ← **Primary reference**
- **Project Structure**: See main README for complete file organization
- **API References**: Microsoft Graph API and Intune Data Warehouse docs
- **Power BI Resources**: Official Microsoft Power BI learning materials

### Support Channels
- **Repository Issues**: For bug reports and feature requests
- **Microsoft Community**: For platform-specific questions
- **Power BI Community**: For dashboard design and optimization tips

---

**⚠️ Important Reminder**: This backup file may not contain the latest updates. Always refer to the [main README.md](README.md) for the most current information, installation instructions, and project updates.

**Last Backup Date**: September 5, 2025
**Backup Version**: 1.0.0
