# 📊 Intune Power BI Dashboard

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black)](https://powerbi.microsoft.com/) [![Microsoft Intune](https://img.shields.io/badge/Microsoft%20Intune-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)](https://intune.microsoft.com/) [![Production Ready](https://img.shields.io/badge/Status-Production%20Ready-brightgreen?style=for-the-badge)]() [![Enterprise Grade](https://img.shields.io/badge/Grade-Enterprise-blue?style=for-the-badge)]() [![Security Compliant](https://img.shields.io/badge/Security-Compliant-green?style=for-the-badge)]() [![Microsoft Graph API](https://img.shields.io/badge/API-Microsoft%20Graph-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)]() [![Real-time Analytics](https://img.shields.io/badge/Analytics-Real--time-orange?style=for-the-badge)]() [![GitHub stars](https://img.shields.io/github/stars/a-ariff/intune-powerbi-dashboard?style=social)](https://github.com/a-ariff/intune-powerbi-dashboard/stargazers) [![GitHub forks](https://img.shields.io/github/forks/a-ariff/intune-powerbi-dashboard?style=social)](https://github.com/a-ariff/intune-powerbi-dashboard/network)

Comprehensive Power BI solution for monitoring Microsoft Intune device compliance, software inventory, and endpoint security

## Docker

This repository includes Docker packaging for easy deployment and distribution of the dashboard.

### Pulling and Running the Image

Pull the latest Docker image from GitHub Container Registry:

```bash
docker pull ghcr.io/a-ariff/intune-powerbi-dashboard:latest
```

Run the container:

```bash
docker run -d -p 8000:8000 ghcr.io/a-ariff/intune-powerbi-dashboard:latest
```

Access the dashboard at `http://localhost:8000`

### Building from Source

Alternatively, build the image locally:

```bash
git clone https://github.com/a-ariff/intune-powerbi-dashboard.git
cd intune-powerbi-dashboard
docker build -t intune-powerbi-dashboard .
docker run -d -p 8000:8000 intune-powerbi-dashboard
```

### Customization Note

**Note**: The included `Dockerfile` is a minimal template designed to serve dashboard files via a lightweight HTTP server. This is provided as an example and can be modified as needed to:

- Integrate with specific data sources
- Add authentication mechanisms
- Configure custom ports or SSL
- Include additional dependencies
- Run custom processing scripts

See the `Dockerfile` and `.github/workflows/docker-publish.yml` for implementation details.

## 🚀 Quick Start

1. **Download the Template**
   - Get the .pbit file from releases
   - Open with Power BI Desktop
   - Connect your Microsoft Graph API credentials

2. **Configure Data Sources**
   - Update Microsoft Graph API endpoints
   - Configure refresh credentials

3. **Publish to Power BI Service**
   - File > Publish > Publish to Power BI
   - Configure scheduled refresh (recommended: 4x daily)
   - Set up data gateway if required

### ⚙️ Configuration

```powershell
# PowerShell script for quick setup
.\templates\setup-intune-dashboard.ps1 -TenantId "your-tenant-id" -ClientId "your-client-id"
```

## 🔗 Important Links

### 📚 **Documentation & Resources**
- [📖 User Guide](./docs/user-guide.md) - Comprehensive usage instructions
- [🔧 API Documentation](./docs/api-reference.md) - Technical implementation details
- [🎨 Customization Guide](./docs/customization.md) - Branding and theme modifications
- [🔒 Security Best Practices](./docs/security.md) - Enterprise security guidelines
- [📊 Sample Reports](./docs/sample-reports.md) - Pre-built report templates

### 🌐 **External Resources**
- [Microsoft Intune Documentation](https://docs.microsoft.com/en-us/mem/intune/)
- [Power BI Developer Center](https://powerbi.microsoft.com/developers/)
- [Microsoft Graph API Reference](https://docs.microsoft.com/en-us/graph/)
- [Azure AD App Registration Guide](https://docs.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app)

### 🎯 **Live Demo & Examples**
- [🔗 Interactive Demo](https://a-ariff.github.io/intune-powerbi-dashboard/) - Try the dashboard online
- [📱 Mobile Preview](https://a-ariff.github.io/intune-powerbi-dashboard/mobile) - Mobile-optimized view

---

## 👨‍💻 About the Creator

**Created with ❤️ by [Ariff Mohamed](https://github.com/a-ariff)**

🎯 **Specializing in:** Microsoft 365, Power Platform, Azure Infrastructure, and Enterprise Security

📧 **Get in Touch:**
- 🐙 GitHub: [@a-ariff](https://github.com/a-ariff)
- 💼 LinkedIn: [Connect with Ariff Mohamed](https://www.linkedin.com/in/ariff-mohamed/)
- 🌐 Portfolio: [Professional Projects](https://a-ariff.github.io)
- 📧 Email: [Contact for Consulting](mailto:contact@a-ariff.dev)

---

<div align="center">

**⭐ If this project helped you, please consider giving it a star! ⭐**

[![Made with ❤️](https://img.shields.io/badge/Made%20with-❤️-red.svg)](https://github.com/a-ariff) [![Powered by](https://img.shields.io/badge/Powered%20by-Microsoft%20Power%20BI-yellow.svg)](https://powerbi.microsoft.com/) [![Enterprise Ready](https://img.shields.io/badge/Enterprise-Ready-success.svg)](https://github.com/a-ariff/intune-powerbi-dashboard)

</div>
