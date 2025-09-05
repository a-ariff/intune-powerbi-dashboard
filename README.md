1
# 📊 Intune Power BI Dashboard
2
​
3
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black)](https://powerbi.microsoft.com/) [![Microsoft Intune](https://img.shields.io/badge/Microsoft%20Intune-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)](https://docs.microsoft.com/en-us/mem/intune/) [![Production Ready](https://img.shields.io/badge/Status-Production%20Ready-brightgreen?style=for-the-badge)]() [![Enterprise Grade](https://img.shields.io/badge/Grade-Enterprise-blue?style=for-the-badge)]() [![Security Compliant](https://img.shields.io/badge/Security-Compliant-green?style=for-the-badge)]() [![Microsoft Graph API](https://img.shields.io/badge/API-Microsoft%20Graph-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)]() [![Real-time Analytics](https://img.shields.io/badge/Analytics-Real--time-orange?style=for-the-badge)]() [![GitHub stars](https://img.shields.io/github/stars/a-ariff/intune-powerbi-dashboard?style=social)](https://github.com/a-ariff/intune-powerbi-dashboard/stargazers) [![GitHub forks](https://img.shields.io/github/forks/a-ariff/intune-powerbi-dashboard?style=social)](https://github.com/a-ariff/intune-powerbi-dashboard/network)
4
​
5
Comprehensive Power BI solution for monitoring Microsoft Intune device compliance, software inventory, and endpoint security
6
​
7
## Docker
8
​
9
This repository includes Docker packaging for easy deployment and distribution of the dashboard.
10
​
11
### Pulling and Running the Image
12
​
13
Pull the latest Docker image from GitHub Container Registry:
14
​
15
```bash
16
docker pull ghcr.io/a-ariff/intune-powerbi-dashboard:latest
17
```
18
​
19
Run the container:
20
​
21
```bash
22
docker run -d -p 8000:8000 ghcr.io/a-ariff/intune-powerbi-dashboard:latest
23
```
24
​
25
Access the dashboard at `http://localhost:8000`
26
​
27
### Building from Source
28
​
29
Alternatively, build the image locally:
30
​
31
```bash
32
git clone https://github.com/a-ariff/intune-powerbi-dashboard.git
33
cd intune-powerbi-dashboard
34
docker build -t intune-powerbi-dashboard .
35
docker run -d -p 8000:8000 intune-powerbi-dashboard
36
```
37
​
38
### Customization Note
39
​
40
**Note**: The included `Dockerfile` is a minimal template designed to serve dashboard files via a lightweight HTTP server. This is provided as an example and can be modified as needed to:
41
​
42
- Integrate with specific data sources
43
- Add authentication mechanisms
44
- Configure custom ports or SSL
45
- Include additional dependencies
46
- Run custom processing scripts
47
​
48
See the `Dockerfile` and `.github/workflows/docker-publish.yml` for implementation details.
49
​
50
## 🚀 Quick Start
51
​
52
1. **Download the Template**
53
 - Get the .pbit file from releases
54
 - Open with Power BI Desktop
55
 - Connect your Microsoft Graph API credentials
56
​
57
2. **Configure Data Sources**
58
 - Update Microsoft Graph API endpoints
59
 - Configure refresh credentials
60
​
61
3. **Publish to Power BI Service**
62
 - File > Publish > Publish to Power BI
63
 - Configure scheduled refresh (recommended: 4x daily)
64
 - Set up data gateway if required
65
​
66
### ⚙️ Configuration
67
​
68
```powershell
69
# PowerShell script for quick setup
70
.\templates\setup-intune-dashboard.ps1 -TenantId "your-tenant-id" -ClientId "your-client-id"
71
```
72
​
73
## 🔗 Important Links
74
​
75
### 📚 **Documentation & Resources**
76
​
77
- [📖 User Guide](./docs/user-guide.md) - Comprehensive usage instructions
78
- [🔧 API Documentation](./docs/api-reference.md) - Technical implementation details
79
- [🎨 Customization Guide](./docs/customization.md) - Branding and theme modifications
80
- [🔒 Security Best Practices](./docs/security.md) - Enterprise security guidelines
81
- [📊 Sample Reports](./docs/sample-reports.md) - Pre-built report templates
82
​
83
### 🌐 **External Resources**
84
- [Microsoft Intune Documentation](https://docs.microsoft.com/en-us/mem/intune/)
85
- [Power BI Developer Center](https://powerbi.microsoft.com/developers/)
86
- [Microsoft Graph API Reference](https://docs.microsoft.com/en-us/graph/)
87
- [Azure AD App Registration Guide](https://docs.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app)
88
​
89
### 🎯 **Live Demo & Examples**
90
- [🔗 Interactive Demo](https://a-ariff.github.io/intune-powerbi-dashboard/) - Try the dashboard online
91
- [📱 Mobile Preview](https://a-ariff.github.io/intune-powerbi-dashboard/mobile) - Mobile-optimized view
92
​
93
---
94
​
95
## 👨‍💻 About the Creator
96
​
97
**Created with ❤️ by [Ariff Mohamed](https://github.com/a-ariff)**
98
​
99
🎯 **Specializing in:** Microsoft 365, Power Platform, Azure Infrastructure, and Enterprise Security
100
​
101
📧 **Get in Touch:**
102
- 🐙 GitHub: [@a-ariff](https://github.com/a-ariff)
103
- 💼 LinkedIn: [Connect with Ariff Mohamed](https://www.linkedin.com/in/ariff-mohamed/)
104
- 🌐 Portfolio: [Professional Projects](https://a-ariff.github.io/intune-powerbi-dashboard/)
105
- 📧 Email: [Contact for Consulting](mailto:contact@a-ariff.dev)
106
​
107
---
108
​
109
<div align="center">
110
​
111
**⭐ If this project helped you, please consider giving it a star! ⭐**
112
​
113
[![Made with ❤️](https://img.shields.io/badge/Made%20with-❤️-red.svg)](https://github.com/a-ariff) [![Powered by](https://img.shields.io/badge/Powered%20by-Microsoft%20Power%20BI-yellow.svg)](https://powerbi.microsoft.com/) [![Enterprise Ready](https://img.shields.io/badge/Enterprise-Ready-success.svg)](https://github.com/a-ariff/intune-powerbi-dashboard)
114
​
115
</div>
116
​