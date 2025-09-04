// Base Connection Module for Microsoft Graph API
// This module provides authentication and base connection functionality
// for accessing Microsoft Intune data through Graph API

let
    // ===== Configuration Parameters =====
    // These parameters should be customized for your environment
    
    // Azure AD Application Registration Details
    ClientId = "your-application-client-id-here",
    TenantId = "your-tenant-id-here", 
    ClientSecret = "your-client-secret-here",
    
    // Microsoft Graph API Base URL
    BaseUrl = "https://graph.microsoft.com",
    ApiVersion = "v1.0",
    BetaApiVersion = "beta",
    
    // ===== Authentication Functions =====
    
    // Function to get OAuth 2.0 access token using client credentials flow
    GetAccessToken = () =>
        let
            TokenUrl = "https://login.microsoftonline.com/" & TenantId & "/oauth2/v2.0/token",
            TokenBody = "grant_type=client_credentials"
                     & "&client_id=" & ClientId 
                     & "&client_secret=" & ClientSecret
                     & "&scope=https://graph.microsoft.com/.default",
            
            TokenHeaders = [
                #"Content-Type" = "application/x-www-form-urlencoded"
            ],
            
            TokenResponse = Web.Contents(
                TokenUrl,
                [
                    Headers = TokenHeaders,
                    Content = Text.ToBinary(TokenBody)
                ]
            ),
            
            TokenJson = Json.Document(TokenResponse),
            AccessToken = TokenJson[access_token]
        in
            AccessToken,
    
    // Function to create authenticated headers for Graph API calls
    GetAuthHeaders = () =>
        let
            Token = GetAccessToken(),
            Headers = [
                Authorization = "Bearer " & Token,
                #"Content-Type" = "application/json"
            ]
        in
            Headers,
    
    // ===== Base Query Functions =====
    
    // Function to make authenticated GET requests to Graph API
    GraphApiCall = (endpoint as text, optional useBetagetBetagetBeta as logical) =>
        let
            UseBeta = if useBetagetBetagetBeta = null then false else useBetagetBetagetBeta,
            Version = if UseBeta then BetaApiVersion else ApiVersion,
            Url = BaseUrl & "/" & Version & "/" & endpoint,
            Headers = GetAuthHeaders(),
            
            Response = Web.Contents(
                Url,
                [
                    Headers = Headers
                ]
            ),
            
            JsonResponse = Json.Document(Response)
        in
            JsonResponse,
    
    // Function to handle paginated results from Graph API
    GetAllPages = (initialUrl as text, optional useBetagetBetagetBeta as logical) =>
        let
            UseBeta = if useBetagetBetagetBeta = null then false else useBetagetBetagetBeta,
            
            GetPage = (url as text) =>
                let
                    Headers = GetAuthHeaders(),
                    Response = Web.Contents(url, [Headers = Headers]),
                    Json = Json.Document(Response),
                    Data = if Record.HasFields(Json, "value") then Json[value] else {},
                    NextLink = if Record.HasFields(Json, "@odata.nextLink") 
                              then Json[#"@odata.nextLink"] 
                              else null
                in
                    {Data, NextLink},
            
            GenerateList = List.Generate(
                () => GetPage(initialUrl),
                each _{1} <> null,
                each GetPage(_{1}),
                each _{0}
            ),
            
            AllData = List.Combine(GenerateList)
        in
            AllData,
    
    // ===== Common Intune Endpoints =====
    
    // Device Management Endpoints
    DeviceManagementEndpoints = [
        ManagedDevices = "deviceManagement/managedDevices",
        CompliancePolicies = "deviceManagement/deviceCompliancePolicies",
        ConfigurationPolicies = "deviceManagement/deviceConfigurations",
        DetectedApps = "deviceManagement/detectedApps",
        MobileApps = "deviceManagement/mobileApps",
        DeviceCategories = "deviceManagement/deviceCategories",
        DeviceEnrollmentConfigurations = "deviceManagement/deviceEnrollmentConfigurations"
    ],
    
    // Directory Endpoints
    DirectoryEndpoints = [
        Users = "users",
        Groups = "groups",
        Devices = "devices",
        DirectoryRoles = "directoryRoles"
    ],
    
    // ===== Helper Functions =====
    
    // Function to expand table columns from nested records
    ExpandTableColumns = (table as table, columnName as text) =>
        let
            ExpandedTable = Table.ExpandRecordColumn(
                table, 
                columnName, 
                Record.FieldNames(Table.Column(table, columnName){0}), 
                List.Transform(
                    Record.FieldNames(Table.Column(table, columnName){0}), 
                    each columnName & "." & _
                )
            )
        in
            ExpandedTable,
    
    // Function to convert Graph API data to Power BI table
    ConvertToTable = (data as list, optional expandColumns as logical) =>
        let
            Table = Table.FromList(data, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
            ExpandedTable = Table.ExpandRecordColumn(
                Table,
                "Column1",
                Record.FieldNames(Table.Column(Table, "Column1"){0})
            ),
            
            // Optionally expand nested record columns
            FinalTable = if expandColumns = true then
                let
                    RecordColumns = List.Select(
                        Table.ColumnNames(ExpandedTable),
                        each Type.Is(Table.ColumnType(ExpandedTable, _), type record)
                    ),
                    ExpandedResult = List.Accumulate(
                        RecordColumns,
                        ExpandedTable,
                        (state, current) => ExpandTableColumns(state, current)
                    )
                in
                    ExpandedResult
            else
                ExpandedTable
        in
            FinalTable,
    
    // Function to handle common date/time conversions
    ConvertDateTimeColumns = (table as table, dateColumns as list) =>
        let
            ConvertedTable = List.Accumulate(
                dateColumns,
                table,
                (state, columnName) => 
                    if List.Contains(Table.ColumnNames(state), columnName) then
                        Table.TransformColumns(
                            state,
                            {{columnName, each if _ <> null and _ <> "" then 
                                DateTime.From(DateTimeZone.From(_)) else null, type nullable datetime}}
                        )
                    else
                        state
            )
        in
            ConvertedTable,
    
    // ===== Error Handling =====
    
    // Function to handle Graph API errors gracefully
    SafeGraphCall = (endpoint as text, optional useBetagetBetagetBeta as logical) =>
        try
            GraphApiCall(endpoint, useBetagetBetagetBeta)
        otherwise
            [
                error = "Failed to retrieve data from: " & endpoint,
                details = "Check authentication credentials and endpoint availability"
            ],
    
    // Function to validate configuration
    ValidateConfiguration = () =>
        let
            ValidationResults = [
                ClientIdValid = ClientId <> "your-application-client-id-here" and Text.Length(ClientId) > 0,
                TenantIdValid = TenantId <> "your-tenant-id-here" and Text.Length(TenantId) > 0,
                ClientSecretValid = ClientSecret <> "your-client-secret-here" and Text.Length(ClientSecret) > 0
            ],
            AllValid = ValidationResults[ClientIdValid] and ValidationResults[TenantIdValid] and ValidationResults[ClientSecretValid]
        in
            if AllValid then
                "Configuration validated successfully"
            else
                "Configuration incomplete - please update ClientId, TenantId, and ClientSecret",
    
    // ===== Export Functions =====
    
    // Main module record with all functions and configurations
    BaseConnection = [
        // Configuration
        Config = [
            ClientId = ClientId,
            TenantId = TenantId,
            BaseUrl = BaseUrl,
            ApiVersion = ApiVersion,
            BetaApiVersion = BetaApiVersion
        ],
        
        // Authentication Functions
        Auth = [
            GetAccessToken = GetAccessToken,
            GetAuthHeaders = GetAuthHeaders,
            ValidateConfiguration = ValidateConfiguration
        ],
        
        // API Call Functions
        Api = [
            GraphApiCall = GraphApiCall,
            SafeGraphCall = SafeGraphCall,
            GetAllPages = GetAllPages
        ],
        
        // Endpoints
        Endpoints = [
            DeviceManagement = DeviceManagementEndpoints,
            Directory = DirectoryEndpoints
        ],
        
        // Utility Functions
        Utils = [
            ConvertToTable = ConvertToTable,
            ExpandTableColumns = ExpandTableColumns,
            ConvertDateTimeColumns = ConvertDateTimeColumns
        ]
    ]
    
in
    BaseConnection
