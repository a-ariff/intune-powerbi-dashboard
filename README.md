# intune-powerbi-dashboard
 🚀 Intune Power BI Dashboard

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black)](https://powerbi.microsoft.com/)
[![Microsoft Intune](https://img.shields.io/badge/Microsoft%20Intune-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)](https://intune.microsoft.com/)

> **A comprehensive Power BI solution for monitoring Microsoft Intune device compliance, software inventory, and endpoint security using the Intune Data Warehouse API.**

**🌐 Live Demo**: [https://intune-dashboard.aglobaltec.com](https://intune-dashboard.aglobaltec.com)

## 🎯 **Project Overview**

This project provides a **production-ready Power BI dashboard** that connects directly to Microsoft Intune Data Warehouse to deliver real-time insights on:

- 📊 **Device Compliance**: Track compliance states across policies and platforms
- 💾 **Software Inventory**: Monitor installed applications and versions  
- 🔒 **Security Posture**: Identify encryption and antivirus gaps
- 👥 **User & Device Management**: Comprehensive device and user tracking
- 📈 **Trend Analysis**: Historical compliance and security metrics

## 📊 **Dashboard Features**

### **Key Metrics Tracked**
- Device compliance rates by policy and platform (78% compliant rate)
- Devices missing encryption or antivirus protection
- Software inventory with version tracking (6,960 total apps monitored)
- Recent device contact and sync status
- Policy violation details and trends

### **Report Pages**
1. **📈 Overview**: High-level KPIs and compliance trends
2. **🎯 Compliance Deep Dive**: Policy-specific compliance states
3. **💾 Software Inventory**: Application deployment and version tracking  
4. **🔍 Device Details**: Drillthrough page for individual device analysis
5. **🔒 Security Dashboard**: Encryption and threat protection status
6. **👥 User Management**: User assignments and device ownership

## 🔧 **Prerequisites**

### **Microsoft Intune Requirements**
- Microsoft Intune subscription with **Data Warehouse enabled**
- Entra ID account with appropriate permissions:
  - **Intune Administrator** or **Intune Reader** role
  - **Data Warehouse access** permissions

### **Power BI Requirements**
- Power BI Desktop (latest version)
- Power BI Pro license (for sharing/collaboration)
- Organizational account authentication

## 🚀 **Quick Start Guide**

## 🔐 **Authentication Setup**

**📍 Endpoint**: `https://graph.microsoft.com/v1.0/`

**🔑 Required Permissions**:
- `DeviceManagementConfiguration.Read.All`
- `DeviceManagementManagedDevices.Read.All`  
- `DeviceManagementApps.Read.All`

**📖 Complete Setup**: [Authentication Guide](docs/authentication-guide.md)

## 📈 **Key Performance Indicators**

| 📊 Metric | 📋 Description | 💼 Business Value |
|-----------|----------------|-------------------|
| **Compliance Rate** | % of compliant devices | Security posture overview |
| **Encryption Coverage** | % of encrypted devices | Data protection compliance |
| **AV Protection** | % devices with active antivirus | Threat protection status |
| **Recent Contact** | % devices contacted in 7 days | Device management health |

## 🛠️ **Customization**

### **Custom Policies**


## 📄 **License**

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## 🆘 **Support**

- **🐛 Issues**: [Report bugs](https://github.com/a-ariff/intune-powerbi-dashboard/issues)
- **💬 Discussions**: [Community support](https://github.com/a-ariff/intune-powerbi-dashboard/discussions)

## 🏷️ **Version Information**

| 📋 **Attribute** | 📄 **Value** |
|-----------------|-------------|
| **Version** | 2.1.0 |
| **Created By** | [@a-ariff](https://github.com/a-ariff) |
| **Maintained By** | [Ariff Mohamed](https://linkedin.com/in/ariff-mohamed) |
| **Status** | ✅ Production Ready |

---

<div align="center">

**⭐ Star this repository if it helps your organization!**

[![GitHub stars](https://img.shields.io/github/stars/a-ariff/intune-powerbi-dashboard.svg?style=social&label=Star)](https://github.com/a-ariff/intune-powerbi-dashboard)

</div>
EOF

