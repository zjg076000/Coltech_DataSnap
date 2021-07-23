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
  FMX.Ani, FMX.ListBox, FMX.Objects, FMX.Menus, FMX.EditBox, FMX.NumberBox,
  FMX.Layouts,inifiles;

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
    edtServer: TEdit;
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
    Label11: TLabel;
    PopupMenu1: TPopupMenu;
    Label12: TLabel;
    Panel7: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    ComboBox1: TComboBox;
    NumberBox1: TNumberBox;
    GridPanelLayout2: TGridPanelLayout;
    Panel8: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    Label13: TLabel;
    Label14: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnConnClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    dbUser,dbPass,dbName,dbPort,dbServer:string;
    //读取数据库到到主界面连接信息
    procedure proc_readini(ServerId:string);
  public
     ConnRemoteIP:string;
  end;

var
  FClientMain: TFClientMain;

implementation
     uses ClientModuleUnit1;
{$R *.fmx}


procedure TFClientMain.proc_readini(ServerId:string);
begin
 var strIniFile:=GetCurrentDir +'\Config.ini';
 //dbSection 从1 开始对应相应的应用 ：1061-9.0  是Database1, 依次类推（按顺序增加）

 var DbSection:='DataBase'+ServerId;
  if FileExists(strIniFile) then
  begin
  with TIniFile.Create(strIniFile) do
    try
        dbUser := ReadString(DbSection, 'User_Name', '');
        dbPass := ReadString(DbSection, 'Password', '');
       // cmbDatabase.:=ReadString(DbSection, 'Database', '');
        edtServer.text := ReadString(DbSection, 'Server', '');
        edtPort.Text  := ReadString(DbSection, 'port', '');
    finally
     Free;
    end;

   end;

end;

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

procedure TFClientMain.RadioButton1Click(Sender: TObject);
begin
    ClientModule1.DSRestConnection1.Host:='10.0.2.9';
    ClientModule1.DSRestConnection1.Reset;


  {  var str:=trim(TRadioButton(Sender).Text);

    //远程服务器 端口号 211

    if str='1061-9.0' then   ConnRemoteIP:='47.93.11.161'
    else if str='1069' then   ConnRemoteIP:='39.97.190.62'
    else if str='1111' then   ConnRemoteIP:='39.106.14.245'
    else  ConnRemoteIP:='39.105.131.112';

    with   ClientModule1.DSRestConnection1 do
    begin

      Host:=ConnRemoteIP;
      Port:=211;
      ClientModule1.DSRestConnection1.Reset;

    end;      }


    //


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
