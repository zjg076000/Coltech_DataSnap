program Coltech_Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  UClientMain in 'UClientMain.pas' {FClientMain},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFClientMain, FClientMain);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
