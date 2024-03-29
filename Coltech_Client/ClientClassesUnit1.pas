//
// Created by the DataSnap proxy generator.
// 2021/7/26 16:03:20
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServer_DataModuleClient = class(TDSAdminRestClient)
  private
    FDataModuleCreateCommand: TDSRestCommand;
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetSymbolsListCommand: TDSRestCommand;
    FGetSymbolsListCommand_Cache: TDSRestCommand;
    FGetDataBaseAllTablesCommand: TDSRestCommand;
    FGetDataBaseAllTablesCommand_Cache: TDSRestCommand;
    FGetTableNameByFieldsCommand: TDSRestCommand;
    FGetTableNameByFieldsCommand_Cache: TDSRestCommand;
    FGetSqLByRecordsCommand: TDSRestCommand;
    FGetSqLByRecordsCommand_Cache: TDSRestCommand;
    FGetUpdateUserTelListCommand: TDSRestCommand;
    FGetUpdateUserTelListCommand_Cache: TDSRestCommand;
    FGetUpdateTradeProductConfigCommand: TDSRestCommand;
    FGetUpdateTradeProductConfigCommand_Cache: TDSRestCommand;
    FGetWeekReportCommand: TDSRestCommand;
    FGetWeekReportCommand_Cache: TDSRestCommand;
    FSetConnDabaseConfigCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DataModuleCreate(Sender: TObject);
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetSymbolsList(StrSymblos: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetSymbolsList_Cache(StrSymblos: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetDataBaseAllTables(StrDatabase: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetDataBaseAllTables_Cache(StrDatabase: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetTableNameByFields(StrDatabase: string; StrTable: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetTableNameByFields_Cache(StrDatabase: string; StrTable: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetSqLByRecords(strsql: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetSqLByRecords_Cache(strsql: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetUpdateUserTelList(strUser: string; strTel: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetUpdateUserTelList_Cache(strUser: string; strTel: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetUpdateTradeProductConfig(RowId: string; WorkState: string; RealFlag: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetUpdateTradeProductConfig_Cache(RowId: string; WorkState: string; RealFlag: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetWeekReport(BeginTime: string; EndTime: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetWeekReport_Cache(BeginTime: string; EndTime: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure SetConnDabaseConfig(dbServer: string; dbName: string; dbPort: string; dbUser: string; dbPass: string);
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServer_DataModule_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TServer_DataModule_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServer_DataModule_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServer_DataModule_GetSymbolsList: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'StrSymblos'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServer_DataModule_GetSymbolsList_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'StrSymblos'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServer_DataModule_GetDataBaseAllTables: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'StrDatabase'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServer_DataModule_GetDataBaseAllTables_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'StrDatabase'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServer_DataModule_GetTableNameByFields: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'StrDatabase'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'StrTable'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServer_DataModule_GetTableNameByFields_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'StrDatabase'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'StrTable'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServer_DataModule_GetSqLByRecords: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'strsql'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServer_DataModule_GetSqLByRecords_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'strsql'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServer_DataModule_GetUpdateUserTelList: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'strUser'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'strTel'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServer_DataModule_GetUpdateUserTelList_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'strUser'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'strTel'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServer_DataModule_GetUpdateTradeProductConfig: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'RowId'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'WorkState'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'RealFlag'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServer_DataModule_GetUpdateTradeProductConfig_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'RowId'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'WorkState'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'RealFlag'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServer_DataModule_GetWeekReport: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'BeginTime'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'EndTime'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServer_DataModule_GetWeekReport_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'BeginTime'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'EndTime'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServer_DataModule_SetConnDabaseConfig: array [0..4] of TDSRestParameterMetaData =
  (
    (Name: 'dbServer'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'dbName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'dbPort'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'dbUser'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'dbPass'; Direction: 1; DBXType: 26; TypeName: 'string')
  );

implementation

procedure TServer_DataModuleClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TServer_DataModule."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TServer_DataModule_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

function TServer_DataModuleClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServer_DataModule.EchoString';
    FEchoStringCommand.Prepare(TServer_DataModule_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServer_DataModuleClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServer_DataModule.ReverseString';
    FReverseStringCommand.Prepare(TServer_DataModule_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServer_DataModuleClient.GetSymbolsList(StrSymblos: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetSymbolsListCommand = nil then
  begin
    FGetSymbolsListCommand := FConnection.CreateCommand;
    FGetSymbolsListCommand.RequestType := 'GET';
    FGetSymbolsListCommand.Text := 'TServer_DataModule.GetSymbolsList';
    FGetSymbolsListCommand.Prepare(TServer_DataModule_GetSymbolsList);
  end;
  FGetSymbolsListCommand.Parameters[0].Value.SetWideString(StrSymblos);
  FGetSymbolsListCommand.Execute(ARequestFilter);
  if not FGetSymbolsListCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetSymbolsListCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetSymbolsListCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetSymbolsListCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServer_DataModuleClient.GetSymbolsList_Cache(StrSymblos: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetSymbolsListCommand_Cache = nil then
  begin
    FGetSymbolsListCommand_Cache := FConnection.CreateCommand;
    FGetSymbolsListCommand_Cache.RequestType := 'GET';
    FGetSymbolsListCommand_Cache.Text := 'TServer_DataModule.GetSymbolsList';
    FGetSymbolsListCommand_Cache.Prepare(TServer_DataModule_GetSymbolsList_Cache);
  end;
  FGetSymbolsListCommand_Cache.Parameters[0].Value.SetWideString(StrSymblos);
  FGetSymbolsListCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetSymbolsListCommand_Cache.Parameters[1].Value.GetString);
end;

function TServer_DataModuleClient.GetDataBaseAllTables(StrDatabase: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetDataBaseAllTablesCommand = nil then
  begin
    FGetDataBaseAllTablesCommand := FConnection.CreateCommand;
    FGetDataBaseAllTablesCommand.RequestType := 'GET';
    FGetDataBaseAllTablesCommand.Text := 'TServer_DataModule.GetDataBaseAllTables';
    FGetDataBaseAllTablesCommand.Prepare(TServer_DataModule_GetDataBaseAllTables);
  end;
  FGetDataBaseAllTablesCommand.Parameters[0].Value.SetWideString(StrDatabase);
  FGetDataBaseAllTablesCommand.Execute(ARequestFilter);
  if not FGetDataBaseAllTablesCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetDataBaseAllTablesCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetDataBaseAllTablesCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetDataBaseAllTablesCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServer_DataModuleClient.GetDataBaseAllTables_Cache(StrDatabase: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetDataBaseAllTablesCommand_Cache = nil then
  begin
    FGetDataBaseAllTablesCommand_Cache := FConnection.CreateCommand;
    FGetDataBaseAllTablesCommand_Cache.RequestType := 'GET';
    FGetDataBaseAllTablesCommand_Cache.Text := 'TServer_DataModule.GetDataBaseAllTables';
    FGetDataBaseAllTablesCommand_Cache.Prepare(TServer_DataModule_GetDataBaseAllTables_Cache);
  end;
  FGetDataBaseAllTablesCommand_Cache.Parameters[0].Value.SetWideString(StrDatabase);
  FGetDataBaseAllTablesCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetDataBaseAllTablesCommand_Cache.Parameters[1].Value.GetString);
end;

function TServer_DataModuleClient.GetTableNameByFields(StrDatabase: string; StrTable: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetTableNameByFieldsCommand = nil then
  begin
    FGetTableNameByFieldsCommand := FConnection.CreateCommand;
    FGetTableNameByFieldsCommand.RequestType := 'GET';
    FGetTableNameByFieldsCommand.Text := 'TServer_DataModule.GetTableNameByFields';
    FGetTableNameByFieldsCommand.Prepare(TServer_DataModule_GetTableNameByFields);
  end;
  FGetTableNameByFieldsCommand.Parameters[0].Value.SetWideString(StrDatabase);
  FGetTableNameByFieldsCommand.Parameters[1].Value.SetWideString(StrTable);
  FGetTableNameByFieldsCommand.Execute(ARequestFilter);
  if not FGetTableNameByFieldsCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetTableNameByFieldsCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetTableNameByFieldsCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetTableNameByFieldsCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServer_DataModuleClient.GetTableNameByFields_Cache(StrDatabase: string; StrTable: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetTableNameByFieldsCommand_Cache = nil then
  begin
    FGetTableNameByFieldsCommand_Cache := FConnection.CreateCommand;
    FGetTableNameByFieldsCommand_Cache.RequestType := 'GET';
    FGetTableNameByFieldsCommand_Cache.Text := 'TServer_DataModule.GetTableNameByFields';
    FGetTableNameByFieldsCommand_Cache.Prepare(TServer_DataModule_GetTableNameByFields_Cache);
  end;
  FGetTableNameByFieldsCommand_Cache.Parameters[0].Value.SetWideString(StrDatabase);
  FGetTableNameByFieldsCommand_Cache.Parameters[1].Value.SetWideString(StrTable);
  FGetTableNameByFieldsCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetTableNameByFieldsCommand_Cache.Parameters[2].Value.GetString);
end;

function TServer_DataModuleClient.GetSqLByRecords(strsql: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetSqLByRecordsCommand = nil then
  begin
    FGetSqLByRecordsCommand := FConnection.CreateCommand;
    FGetSqLByRecordsCommand.RequestType := 'GET';
    FGetSqLByRecordsCommand.Text := 'TServer_DataModule.GetSqLByRecords';
    FGetSqLByRecordsCommand.Prepare(TServer_DataModule_GetSqLByRecords);
  end;
  FGetSqLByRecordsCommand.Parameters[0].Value.SetWideString(strsql);
  FGetSqLByRecordsCommand.Execute(ARequestFilter);
  if not FGetSqLByRecordsCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetSqLByRecordsCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetSqLByRecordsCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetSqLByRecordsCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServer_DataModuleClient.GetSqLByRecords_Cache(strsql: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetSqLByRecordsCommand_Cache = nil then
  begin
    FGetSqLByRecordsCommand_Cache := FConnection.CreateCommand;
    FGetSqLByRecordsCommand_Cache.RequestType := 'GET';
    FGetSqLByRecordsCommand_Cache.Text := 'TServer_DataModule.GetSqLByRecords';
    FGetSqLByRecordsCommand_Cache.Prepare(TServer_DataModule_GetSqLByRecords_Cache);
  end;
  FGetSqLByRecordsCommand_Cache.Parameters[0].Value.SetWideString(strsql);
  FGetSqLByRecordsCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetSqLByRecordsCommand_Cache.Parameters[1].Value.GetString);
end;

function TServer_DataModuleClient.GetUpdateUserTelList(strUser: string; strTel: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetUpdateUserTelListCommand = nil then
  begin
    FGetUpdateUserTelListCommand := FConnection.CreateCommand;
    FGetUpdateUserTelListCommand.RequestType := 'GET';
    FGetUpdateUserTelListCommand.Text := 'TServer_DataModule.GetUpdateUserTelList';
    FGetUpdateUserTelListCommand.Prepare(TServer_DataModule_GetUpdateUserTelList);
  end;
  FGetUpdateUserTelListCommand.Parameters[0].Value.SetWideString(strUser);
  FGetUpdateUserTelListCommand.Parameters[1].Value.SetWideString(strTel);
  FGetUpdateUserTelListCommand.Execute(ARequestFilter);
  if not FGetUpdateUserTelListCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetUpdateUserTelListCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetUpdateUserTelListCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetUpdateUserTelListCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServer_DataModuleClient.GetUpdateUserTelList_Cache(strUser: string; strTel: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetUpdateUserTelListCommand_Cache = nil then
  begin
    FGetUpdateUserTelListCommand_Cache := FConnection.CreateCommand;
    FGetUpdateUserTelListCommand_Cache.RequestType := 'GET';
    FGetUpdateUserTelListCommand_Cache.Text := 'TServer_DataModule.GetUpdateUserTelList';
    FGetUpdateUserTelListCommand_Cache.Prepare(TServer_DataModule_GetUpdateUserTelList_Cache);
  end;
  FGetUpdateUserTelListCommand_Cache.Parameters[0].Value.SetWideString(strUser);
  FGetUpdateUserTelListCommand_Cache.Parameters[1].Value.SetWideString(strTel);
  FGetUpdateUserTelListCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetUpdateUserTelListCommand_Cache.Parameters[2].Value.GetString);
end;

function TServer_DataModuleClient.GetUpdateTradeProductConfig(RowId: string; WorkState: string; RealFlag: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetUpdateTradeProductConfigCommand = nil then
  begin
    FGetUpdateTradeProductConfigCommand := FConnection.CreateCommand;
    FGetUpdateTradeProductConfigCommand.RequestType := 'GET';
    FGetUpdateTradeProductConfigCommand.Text := 'TServer_DataModule.GetUpdateTradeProductConfig';
    FGetUpdateTradeProductConfigCommand.Prepare(TServer_DataModule_GetUpdateTradeProductConfig);
  end;
  FGetUpdateTradeProductConfigCommand.Parameters[0].Value.SetWideString(RowId);
  FGetUpdateTradeProductConfigCommand.Parameters[1].Value.SetWideString(WorkState);
  FGetUpdateTradeProductConfigCommand.Parameters[2].Value.SetWideString(RealFlag);
  FGetUpdateTradeProductConfigCommand.Execute(ARequestFilter);
  if not FGetUpdateTradeProductConfigCommand.Parameters[3].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetUpdateTradeProductConfigCommand.Parameters[3].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetUpdateTradeProductConfigCommand.Parameters[3].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetUpdateTradeProductConfigCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServer_DataModuleClient.GetUpdateTradeProductConfig_Cache(RowId: string; WorkState: string; RealFlag: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetUpdateTradeProductConfigCommand_Cache = nil then
  begin
    FGetUpdateTradeProductConfigCommand_Cache := FConnection.CreateCommand;
    FGetUpdateTradeProductConfigCommand_Cache.RequestType := 'GET';
    FGetUpdateTradeProductConfigCommand_Cache.Text := 'TServer_DataModule.GetUpdateTradeProductConfig';
    FGetUpdateTradeProductConfigCommand_Cache.Prepare(TServer_DataModule_GetUpdateTradeProductConfig_Cache);
  end;
  FGetUpdateTradeProductConfigCommand_Cache.Parameters[0].Value.SetWideString(RowId);
  FGetUpdateTradeProductConfigCommand_Cache.Parameters[1].Value.SetWideString(WorkState);
  FGetUpdateTradeProductConfigCommand_Cache.Parameters[2].Value.SetWideString(RealFlag);
  FGetUpdateTradeProductConfigCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetUpdateTradeProductConfigCommand_Cache.Parameters[3].Value.GetString);
end;

function TServer_DataModuleClient.GetWeekReport(BeginTime: string; EndTime: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetWeekReportCommand = nil then
  begin
    FGetWeekReportCommand := FConnection.CreateCommand;
    FGetWeekReportCommand.RequestType := 'GET';
    FGetWeekReportCommand.Text := 'TServer_DataModule.GetWeekReport';
    FGetWeekReportCommand.Prepare(TServer_DataModule_GetWeekReport);
  end;
  FGetWeekReportCommand.Parameters[0].Value.SetWideString(BeginTime);
  FGetWeekReportCommand.Parameters[1].Value.SetWideString(EndTime);
  FGetWeekReportCommand.Execute(ARequestFilter);
  if not FGetWeekReportCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetWeekReportCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetWeekReportCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetWeekReportCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServer_DataModuleClient.GetWeekReport_Cache(BeginTime: string; EndTime: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetWeekReportCommand_Cache = nil then
  begin
    FGetWeekReportCommand_Cache := FConnection.CreateCommand;
    FGetWeekReportCommand_Cache.RequestType := 'GET';
    FGetWeekReportCommand_Cache.Text := 'TServer_DataModule.GetWeekReport';
    FGetWeekReportCommand_Cache.Prepare(TServer_DataModule_GetWeekReport_Cache);
  end;
  FGetWeekReportCommand_Cache.Parameters[0].Value.SetWideString(BeginTime);
  FGetWeekReportCommand_Cache.Parameters[1].Value.SetWideString(EndTime);
  FGetWeekReportCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetWeekReportCommand_Cache.Parameters[2].Value.GetString);
end;

procedure TServer_DataModuleClient.SetConnDabaseConfig(dbServer: string; dbName: string; dbPort: string; dbUser: string; dbPass: string);
begin
  if FSetConnDabaseConfigCommand = nil then
  begin
    FSetConnDabaseConfigCommand := FConnection.CreateCommand;
    FSetConnDabaseConfigCommand.RequestType := 'GET';
    FSetConnDabaseConfigCommand.Text := 'TServer_DataModule.SetConnDabaseConfig';
    FSetConnDabaseConfigCommand.Prepare(TServer_DataModule_SetConnDabaseConfig);
  end;
  FSetConnDabaseConfigCommand.Parameters[0].Value.SetWideString(dbServer);
  FSetConnDabaseConfigCommand.Parameters[1].Value.SetWideString(dbName);
  FSetConnDabaseConfigCommand.Parameters[2].Value.SetWideString(dbPort);
  FSetConnDabaseConfigCommand.Parameters[3].Value.SetWideString(dbUser);
  FSetConnDabaseConfigCommand.Parameters[4].Value.SetWideString(dbPass);
  FSetConnDabaseConfigCommand.Execute;
end;

constructor TServer_DataModuleClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServer_DataModuleClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServer_DataModuleClient.Destroy;
begin
  FDataModuleCreateCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetSymbolsListCommand.DisposeOf;
  FGetSymbolsListCommand_Cache.DisposeOf;
  FGetDataBaseAllTablesCommand.DisposeOf;
  FGetDataBaseAllTablesCommand_Cache.DisposeOf;
  FGetTableNameByFieldsCommand.DisposeOf;
  FGetTableNameByFieldsCommand_Cache.DisposeOf;
  FGetSqLByRecordsCommand.DisposeOf;
  FGetSqLByRecordsCommand_Cache.DisposeOf;
  FGetUpdateUserTelListCommand.DisposeOf;
  FGetUpdateUserTelListCommand_Cache.DisposeOf;
  FGetUpdateTradeProductConfigCommand.DisposeOf;
  FGetUpdateTradeProductConfigCommand_Cache.DisposeOf;
  FGetWeekReportCommand.DisposeOf;
  FGetWeekReportCommand_Cache.DisposeOf;
  FSetConnDabaseConfigCommand.DisposeOf;
  inherited;
end;

end.

