unit UClientMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, System.Rtti, FMX.Grid.Style,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ScrollBox, FMX.Grid,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,FireDACJSONReflect,
  FMX.Edit, System.ImageList, FMX.ImgList, FireDAC.Stan.Async, FireDAC.DApt,
  FMX.Ani, FMX.ListBox, FMX.Objects;

type
  TFClientMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Panel4: TPanel;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    StringGrid1: TStringGrid;
    SpeedButton1: TSpeedButton;
    ImageList1: TImageList;
    Label2: TLabel;
    Edt_symbols: TEdit;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    FloatAnimation1: TFloatAnimation;
    Label3: TLabel;
    edtIP: TEdit;
    Label4: TLabel;
    edtPort: TEdit;
    Label5: TLabel;
    edtAccount: TEdit;
    Label6: TLabel;
    edtPassword: TEdit;
    Label7: TLabel;
    cmbDatabase: TComboBox;
    Image1: TImage;
    btnConn: TSpeedButton;
    FloatAnimation2: TFloatAnimation;
    Panel5: TPanel;
    SpeedButton2: TSpeedButton;
    FloatAnimation3: TFloatAnimation;
    Label8: TLabel;
    Edit5: TEdit;
    StringGrid2: TStringGrid;
    Label9: TLabel;
    Edit6: TEdit;
    Panel6: TPanel;
    SpeedButton3: TSpeedButton;
    FloatAnimation4: TFloatAnimation;
    Label10: TLabel;
    Edit7: TEdit;
    Label11: TLabel;
    Edit8: TEdit;
    StringGrid3: TStringGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnConnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClientMain: TFClientMain;

implementation
     uses ClientModuleUnit1;
{$R *.fmx}

procedure TFClientMain.btnConnClick(Sender: TObject);
begin
     if btnConn.ImageIndex=4 then
     begin
        btnConn.ImageIndex:=5;
         btnConn.Text:='已连接';
     end
     else
      begin
        btnConn.ImageIndex:=4;
         btnConn.Text:='未上线';
     end

end;

procedure TFClientMain.SpeedButton1Click(Sender: TObject);
var  jds:TFDJSONDataSets;
begin
   //FDMemTable1.Open;
  // FDMemTable1.EmptyDataSet;
  //  FDMemTable1.close;
   // FDMemTable1.open;

   jds := ClientModuleUnit1.ClientModule1.Server_DataModuleClient.GetSymbolsList(trim(Edt_symbols.Text));
  // if FDMemTable1 then
   if FDMemTable1.Active=True then      FDMemTable1.Close;

   FDMemTable1.AppendData(TFDJsonDataSetsReader.GetListValue(jds,0));

  // StringGrid1.em
end;

end.
