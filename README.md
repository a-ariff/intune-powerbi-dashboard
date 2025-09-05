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
