// 
// Created by the DataSnap proxy generator.
// 2021/7/22 16:30:46
// 

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServer_DataModuleClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetSymbolsListCommand: TDSRestCommand;
    FGetSymbolsListCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetSymbolsList(StrSymblos: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetSymbolsList_Cache(StrSymblos: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
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

implementation

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
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetSymbolsListCommand.DisposeOf;
  FGetSymbolsListCommand_Cache.DisposeOf;
  inherited;
end;

end.
