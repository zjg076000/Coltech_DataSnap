unit ClientModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit1, Datasnap.DSClientRest;

type
  TClientModule1 = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FServer_DataModuleClient: TServer_DataModuleClient;
    function GetServer_DataModuleClient: TServer_DataModuleClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property Server_DataModuleClient: TServer_DataModuleClient read GetServer_DataModuleClient write FServer_DataModuleClient;

end;

var
  ClientModule1: TClientModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

constructor TClientModule1.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule1.Destroy;
begin
  FServer_DataModuleClient.Free;
  inherited;
end;

function TClientModule1.GetServer_DataModuleClient: TServer_DataModuleClient;
begin
  if FServer_DataModuleClient = nil then
    FServer_DataModuleClient:= TServer_DataModuleClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FServer_DataModuleClient;
end;

end.
