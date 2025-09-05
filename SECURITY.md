# Security Policy

## Reporting a Vulnerability

The Intune Power BI Dashboard project takes security seriously. We appreciate your efforts to responsibly disclose your findings and will make every effort to acknowledge your contributions.

### Where to Report

To report a security vulnerability, please use one of the following methods:

1. **Email**: Send details to [contact@a-ariff.dev](mailto:contact@a-ariff.dev) with "SECURITY" in the subject line
2. **GitHub Security Advisory**: Use GitHub's private vulnerability reporting feature
3. **GitHub Issues**: For non-sensitive security concerns, you may open a public issue using the bug report template

### What to Include

When reporting a vulnerability, please include the following information:

- Type of issue (e.g., data exposure, injection, authentication bypass)
- Full paths of source file(s) related to the manifestation of the issue
- Location of the affected source code (tag/branch/commit or direct URL)
- Step-by-step instructions to reproduce the issue
- Proof-of-concept or exploit code (if possible)
- Impact assessment and any potential workarounds

### Response Timeline

- **Initial Response**: Within 48 hours of receiving your report
- **Status Updates**: Regular updates every 5 business days
- **Resolution**: Security fixes will be prioritized and released as soon as possible

## Security Considerations for Power BI Dashboards

### Data Protection

- **Authentication**: Always use Azure AD authentication for Power BI access
- **Data Sources**: Ensure Microsoft Graph API permissions follow the principle of least privilege
- **Row-Level Security**: Implement appropriate RLS in Power BI for multi-tenant scenarios
- **Data Refresh**: Use secure credentials and avoid storing credentials in plain text

### Intune Data Handling

- **Sensitive Information**: Device and user data should be handled according to your organization's privacy policies
- **Data Retention**: Configure appropriate data retention policies
- **Compliance**: Ensure dashboard usage complies with GDPR, HIPAA, and other applicable regulations

### Best Practices

1. **Regular Updates**: Keep Power BI Desktop and service up to date
2. **Access Control**: Limit dashboard access to authorized personnel only
3. **Network Security**: Use VPN or secure networks when accessing sensitive dashboards
4. **Logging**: Enable audit logging for Power BI workspace activities
5. **Backup**: Regularly backup your Power BI reports and data sources

## Supported Versions

We release patches for security vulnerabilities for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| Latest  | ✅ Yes             |
| < 1.0   | ❌ No              |

## Security Updates

Security updates will be:

- Released as patches to the main branch
- Documented in the CHANGELOG.md
- Announced via GitHub releases
- Tagged with appropriate severity levels

## Acknowledgments

We thank the security research community for helping to keep our project safe. Security researchers who responsibly disclose vulnerabilities will be acknowledged in our security advisories (with their permission).

---

**Note**: This security policy applies to the open-source Power BI dashboard templates and documentation. For Microsoft Intune or Power BI service security issues, please contact Microsoft directly through their official security channels.
