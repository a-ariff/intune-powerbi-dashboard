// Intune Device Data Query
// This Power Query connects to Microsoft Graph API to retrieve device information

let
    // API Configuration
    BaseUrl = "https://graph.microsoft.com/v1.0/deviceManagement/",
    
    // Function to get device data with pagination
    GetDeviceData = (url as text) =>
        let
            Source = Json.Document(Web.Contents(url)),
            Data = Source[value],
            NextLink = try Source[#"@odata.nextLink"] otherwise null,
            Result = if NextLink <> null then 
                Data & @GetDeviceData(NextLink) 
                else Data
        in
            Result,
    
    // Main query
    DevicesUrl = BaseUrl & "managedDevices",
    DeviceData = GetDeviceData(DevicesUrl),
    
    // Convert to table and expand columns
    ToTable = Table.FromList(DeviceData, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    ExpandColumns = Table.ExpandRecordColumn(ToTable, "Column1", 
        {"id", "deviceName", "managedDeviceOwnerType", "operatingSystem", 
         "osVersion", "complianceState", "lastSyncDateTime"})
in
    ExpandColumns
