# Customization Guide

## Overview

This guide provides instructions for customizing the Intune Power BI Dashboard to match your organization's branding, themes, and specific requirements.

## Table of Contents

- [Branding](#branding)
- [Themes](#themes)
- [Modifications](#modifications)
- [Custom Visuals](#custom-visuals)
- [Layout Customization](#layout-customization)
- [Data Filtering](#data-filtering)
- [Export Settings](#export-settings)

## Branding

### Organizational Branding

Customize the dashboard to reflect your organization's identity:

#### Logo Integration
- **Header Logo**: Replace default logo with your organization's logo
  - Recommended size: 200x60 pixels
  - Supported formats: PNG, SVG
  - Location: Page header, top-left corner

- **Report Cover**: Add organization branding to report covers
  - Cover page template available
  - Custom background images supported

#### Color Scheme
```json
{
  "primary": "#0078d7",
  "secondary": "#106ebe",
  "accent": "#005a9e",
  "text": "#323130",
  "background": "#ffffff"
}
```

#### Typography
- **Primary Font**: Segoe UI (recommended)
- **Alternative Fonts**: Arial, Calibri, or custom corporate fonts
- **Font Sizes**: 
  - Headers: 18-24pt
  - Body text: 10-12pt
  - Captions: 8-10pt

### Brand Guidelines Implementation

1. **Corporate Colors**
   - Apply brand colors to charts and visuals
   - Maintain consistent color palette
   - Use brand-compliant color combinations

2. **Logo Placement**
   - Header positioning
   - Footer watermarks
   - Export templates

## Themes

### Built-in Themes

#### Light Theme (Default)
- Clean, professional appearance
- High contrast for readability
- Suitable for most corporate environments

#### Dark Theme
- Modern, sleek appearance
- Reduced eye strain
- Ideal for dashboard displays

#### High Contrast Theme
- Accessibility compliant
- Enhanced readability
- WCAG 2.1 AA compliant

### Custom Theme Creation

#### Theme Configuration File
```json
{
  "name": "Corporate Theme",
  "dataColors": [
    "#0078d7", "#00bcf2", "#40e0d0", "#008272",
    "#107c10", "#bad80a", "#ffb900", "#ff8c00"
  ],
  "background": "#ffffff",
  "foreground": "#323130",
  "tableAccent": "#f3f2f1"
}
```

#### Applying Custom Themes
1. Create theme JSON file
2. Import into Power BI Desktop
3. Apply to all report pages
4. Publish to Power BI Service

## Modifications

### Dashboard Layout

#### Page Structure
- **Overview Page**: Executive summary and KPIs
- **Device Compliance**: Detailed compliance metrics
- **Software Inventory**: Application deployment status
- **Security Posture**: Security policies and threats
- **User Analytics**: User engagement and activity

#### Custom Pages
Add organization-specific pages:
- **Department Views**: Filtered by organizational units
- **Geographic Reports**: Location-based analytics
- **Custom Metrics**: Organization-specific KPIs

### Visual Customization

#### Chart Types
- **Bar Charts**: Policy compliance rates
- **Pie Charts**: OS distribution
- **Line Charts**: Trends over time
- **Tables**: Detailed device listings
- **Cards**: Key performance indicators

#### Custom Visuals
Recommended Power BI custom visuals:
- **Chiclet Slicer**: Enhanced filtering
- **Hierarchy Slicer**: Organizational structure
- **Calendar**: Date range selection
- **Word Cloud**: Common issues visualization

## Custom Visuals

### Installation
1. Download from Power BI marketplace
2. Import .pbiviz files
3. Configure visual properties
4. Apply to dashboard pages

### Recommended Custom Visuals

#### Advanced Card by MAQ Software
- Enhanced KPI display
- Multiple metrics per card
- Conditional formatting

#### Gantt Chart
- Project timeline visualization
- Deployment schedules
- Maintenance windows

#### Sankey Diagram
- Data flow visualization
- Process mapping
- Relationship analysis

## Layout Customization

### Responsive Design
- **Desktop Layout**: Full-featured dashboard
- **Tablet Layout**: Optimized for touch interaction
- **Mobile Layout**: Essential metrics only

### Grid System
- Use consistent spacing (8px grid)
- Align visuals to grid lines
- Maintain visual hierarchy

### Navigation
- **Bookmarks**: Quick access to filtered views
- **Buttons**: Custom navigation elements
- **Drill-through**: Detailed analysis pages

## Data Filtering

### Default Filters
Pre-configure common filters:
- **Date Range**: Last 30/90 days
- **Device Type**: Windows, iOS, Android
- **Compliance Status**: Compliant/Non-compliant
- **Geographic Location**: By region/country

### Custom Slicers
Organization-specific filtering:
- **Department**: Based on AD groups
- **Cost Center**: Financial reporting
- **Device Owner**: Assigned users
- **Management Group**: Intune groups

### Filter Synchronization
- Sync filters across pages
- Maintain filter state
- Reset filter options

## Export Settings

### Export Templates
- **Executive Summary**: One-page overview
- **Detailed Report**: Multi-page analysis
- **Data Extract**: Raw data export

### Automated Exports
- **Scheduled Reports**: Daily/weekly/monthly
- **Email Distribution**: Stakeholder lists
- **File Formats**: PDF, Excel, PowerPoint

### Custom Export Layouts
- **Logo Placement**: Consistent branding
- **Header/Footer**: Standard information
- **Page Numbering**: Professional formatting

## Implementation Steps

1. **Planning**
   - Define branding requirements
   - Identify stakeholder needs
   - Create customization timeline

2. **Design**
   - Create theme specifications
   - Design page layouts
   - Select appropriate visuals

3. **Development**
   - Implement custom themes
   - Configure visuals and filters
   - Test responsive layouts

4. **Testing**
   - User acceptance testing
   - Performance validation
   - Accessibility compliance

5. **Deployment**
   - Publish to Power BI Service
   - Configure refresh schedules
   - Train end users

## Best Practices

### Design Principles
- **Clarity**: Clear, easy-to-understand visuals
- **Consistency**: Uniform styling throughout
- **Hierarchy**: Important information prominent
- **Accessibility**: Inclusive design practices

### Performance Optimization
- **Data Model**: Optimize relationships
- **Visuals**: Limit complex calculations
- **Filters**: Use efficient filtering
- **Images**: Optimize file sizes

### Maintenance
- **Regular Updates**: Keep themes current
- **User Feedback**: Incorporate improvements
- **Documentation**: Maintain change logs
- **Backup**: Version control for customizations

## Support and Resources

- [Power BI Theme Gallery](https://community.powerbi.com/t5/Themes-Gallery/bd-p/ThemesGallery)
- [Custom Visual Documentation](https://docs.microsoft.com/en-us/power-bi/developer/visuals/)
- [Branding Guidelines Template](../templates/branding-guidelines.md)
- [Theme JSON Schema](../templates/theme-schema.json)
