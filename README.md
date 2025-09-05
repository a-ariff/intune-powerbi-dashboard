# intune-powerbi-dashboard

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

## 🏆 Professional Badges & Status

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black)](https://powerbi.microsoft.com/)
[![Microsoft Intune](https://img.shields.io/badge/Microsoft%20Intune-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)](https://intune.microsoft.com/)
[![Production Ready](https://img.shields.io/badge/Status-Production%20Ready-brightgreen?style=for-the-badge)]()
[![Enterprise Grade](https://img.shields.io/badge/Grade-Enterprise-blue?style=for-the-badge)]()
[![Security Compliant](https://img.shields.io/badge/Security-Compliant-green?style=for-the-badge)]()
[![Microsoft Graph API](https://img.shields.io/badge/API-Microsoft%20Graph-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)]()
[![Real-time Analytics](https://img.shields.io/badge/Analytics-Real--time-orange?style=for-the-badge)]()
[![GitHub stars](https://img.shields.io/github/stars/a-ariff/intune-powerbi-dashboard?style=social)](https://github.com/a-ariff/intune-powerbi-dashboard/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/a-ariff/intune-powerbi-dashboard?style=social)](https://github.com/a-ariff/intune-powerbi-dashboard/network)