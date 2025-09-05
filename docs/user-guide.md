# User Guide

## Overview

This user guide provides comprehensive instructions for setting up, configuring, and using the Intune Power BI Dashboard.

## Table of Contents

- [Installation](#installation)
- [Setup](#setup)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)
- [Support](#support)

## Installation

### Prerequisites

- Microsoft Power BI Desktop
- Microsoft Graph API access
- Intune administrator permissions

### Installation Steps

1. Download the Power BI template (.pbit file) from the releases page
2. Open the template in Power BI Desktop
3. Configure data source connections
4. Publish to Power BI Service

## Setup

### Initial Configuration

1. **Authentication Setup**
   - Configure Microsoft Graph API credentials
   - Set up service principal authentication
   - Verify Intune permissions

2. **Data Source Configuration**
   - Connect to Microsoft Graph endpoints
   - Configure refresh schedules
   - Set up data gateway (if required)

3. **Dashboard Customization**
   - Apply organizational branding
   - Configure report permissions
   - Set up automated refresh

## Usage

### Dashboard Navigation

- **Device Compliance Overview**: Monitor device compliance status across your organization
- **Software Inventory**: Track installed applications and their versions
- **Security Policies**: Review policy compliance and deployment status
- **User Activity**: Analyze user engagement and device usage patterns

### Key Features

- Real-time data refresh
- Interactive filtering and drill-down capabilities
- Export capabilities for reporting
- Mobile-responsive design

## Troubleshooting

### Common Issues

- Authentication failures
- Data refresh errors
- Performance optimization
- Connectivity problems

### Getting Help

For additional support, please refer to:
- [API Reference](api-reference.md)
- [Security Best Practices](security.md)
- [Customization Guide](customization.md)

## Support

For technical support and questions:
- Create an issue in the GitHub repository
- Review existing documentation
- Contact the development team
