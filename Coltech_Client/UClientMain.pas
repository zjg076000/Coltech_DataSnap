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
  FMX.Layouts,inifiles, FMX.WebBrowser, FMX.DateTimeCtrls, FMX.Memo.Types,
  FMX.Memo;

type
  TFClientMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    pnl_datainit: TPanel;
    Panel3: TPanel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Panel4: TPanel;
    StringGrid1: TStringGrid;
    btnSymbols: TSpeedButton;
    ImageList1: TImageList;
    Label2: TLabel;
    Edt_symbols: TEdit;
    Fmtbl_Symbols: TFDMemTable;
    bdso_Symbols: TBindSourceDB;
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
    btnTel: TSpeedButton;
    FloatAnimation3: TFloatAnimation;
    Label8: TLabel;
    edt_LoginName: TEdit;
    StringGrid2: TStringGrid;
    Label9: TLabel;
    edt_Tel: TEdit;
    Panel6: TPanel;
    btnAutoHand: TSpeedButton;
    FloatAnimation4: TFloatAnimation;
    Label10: TLabel;
    Label11: TLabel;
    PopupMenu1: TPopupMenu;
    cmb_antohand: TComboBox;
    NumBox: TNumberBox;
    FMtbl_UserTel: TFDMemTable;
    bdso_UserTel: TBindSourceDB;
    FDStanStorageBinLink2: TFDStanStorageBinLink;
    FDStanStorageJSONLink2: TFDStanStorageJSONLink;
    LinkGridToDataSourcebdso_UserTel: TLinkGridToDataSource;
    FMtbl_UserTelUserID: TIntegerField;
    FMtbl_UserTelUserName: TWideStringField;
    FMtbl_UserTelLoginName: TWideStringField;
    FMtbl_UserTelMobile: TWideStringField;
    FMtbl_UserTelStatus: TBooleanField;
    FMtbl_UserTelIsDelete: TBooleanField;
    FMtbl_UserTelLastLoginTime: TDateTimeField;
    FMtbl_UserTelLastLoginIP: TWideStringField;
    GridPanelLayout1: TGridPanelLayout;
    Panel8: TPanel;
    Panel15: TPanel;
    Label13: TLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    Label14: TLabel;
    Grd_bdso_trade_product_config_real: TStringGrid;
    StrGrd_trade_product_config: TStringGrid;
    FMtbl_trade_product_config: TFDMemTable;
    FMtbl_trade_product_configConfigType: TIntegerField;
    FMtbl_trade_product_configTextValue: TWideStringField;
    FMtbl_trade_product_configRemark: TWideStringField;
    bdso_trade_product_config: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB12: TLinkGridToDataSource;
    Fmtbl_trade_product_config_real: TFDMemTable;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    bdso_trade_product_config_real: TBindSourceDB;
    LinkGridToDataSourcebdso_trade_product_config_real: TLinkGridToDataSource;
    StyleBook1: TStyleBook;
    系统周统计: TTabItem;
    浏览器: TTabItem;
    数据查询工具: TTabItem;
    Panel11: TPanel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Label15: TLabel;
    Panel12: TPanel;
    Panel13: TPanel;
    edtWeb: TEdit;
    SpeedButton5: TSpeedButton;
    FloatAnimation10: TFloatAnimation;
    btn_newsymbols: TSpeedButton;
    FloatAnimation11: TFloatAnimation;
    btn_web: TSpeedButton;
    FloatAnimation6: TFloatAnimation;
    web: TWebBrowser;
    Panel14: TPanel;
    Panel7: TPanel;
    Label12: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Panel17: TPanel;
    chkDatabase: TCheckBox;
    Panel2: TPanel;
    Panel16: TPanel;
    SpeedButton1: TSpeedButton;
    FloatAnimation5: TFloatAnimation;
    btn_addsql: TSpeedButton;
    FloatAnimation7: TFloatAnimation;
    btn_execsql: TSpeedButton;
    FloatAnimation8: TFloatAnimation;
    Panel18: TPanel;
    pnl_tableBar: TPanel;
    Panel19: TPanel;
    GrdRecords: TStringGrid;
    Panel20: TPanel;
    SpeedButton2: TSpeedButton;
    FloatAnimation9: TFloatAnimation;
    Label16: TLabel;
    DateEdit1: TDateEdit;
    Label17: TLabel;
    DateEdit2: TDateEdit;
    pnl_sql: TPanel;
    memo_Sql: TMemo;
    RadioButton5: TRadioButton;
    fmtbl_tables: TFDMemTable;
    bdso_tables: TBindSourceDB;
    Panel21: TPanel;
    GrdTables: TStringGrid;
    edt_tables_Filter: TEdit;
    LinkGridToDataSourcebdso_tables: TLinkGridToDataSource;
    Fmtbl_Records: TFDMemTable;
    Panel22: TPanel;
    edt_RecordsFilter: TEdit;
    bdso_Records: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB13: TLinkGridToDataSource;
    procedure btnSymbolsClick(Sender: TObject);
    procedure btnConnClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton4Change(Sender: TObject);
    procedure btnTelClick(Sender: TObject);
    procedure btnAutoHandClick(Sender: TObject);
    procedure CornerButton2Click(Sender: TObject);
    procedure btn_webClick(Sender: TObject);
    procedure chkDatabaseClick(Sender: TObject);
    procedure btn_addsqlClick(Sender: TObject);
    procedure btn_execsqlClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_newsymbolsClick(Sender: TObject);
    procedure edt_tables_FilterChange(Sender: TObject);
    procedure GrdTablesCellDblClick(const Column: TColumn; const Row: Integer);
    procedure edt_RecordsFilterChange(Sender: TObject);
  private
    dbUser,dbPass,dbName,dbPort,dbServer:string;
    ConnRemoteIP,AppStr:string;
   // ConnRemoteIP:string;
    //读取数据库到到主界面连接信息
    procedure proc_readini(ServerId:string);

    procedure  pro_ObjectEnable(EnableState:boolean);

    function fun_check(StrValue,str_message:string):boolean;

    procedure proc_checkconndatabase(str:string);
  public

  end;

var
  FClientMain: TFClientMain;

implementation
     uses ClientModuleUnit1,vcl.Dialogs;
{$R *.fmx}


procedure TFClientMain.FormCreate(Sender: TObject);
begin
   proc_readini('0');
//   ClientModule1.DSRestConnection1.Host:=ConnRemoteIP;
   AppStr:='测试系统';

   pnl_sql.Visible:=false;

 //  pro_ObjectEnable(false);

end;

function TFClientMain.fun_check(StrValue, str_message: string): boolean;
begin
     result:=true;
  if StrValue='' then
  begin
     showmessage(str_message);
     result:=false;
  end;
end;

procedure TFClientMain.GrdTablesCellDblClick(const Column: TColumn;
  const Row: Integer);
begin
    //取得所有的表 显示到 table 中
   var strsql:='select * from '+fmtbl_tables.FieldByName('table_name').asstring;
        //   +' top 0, 50';
   var jds:= ClientModuleUnit1.ClientModule1.Server_DataModuleClient.GetSqLByRecords(strsql);
   if Fmtbl_Records.Active=True then      Fmtbl_Records.Close;

   Fmtbl_Records.AppendData(TFDJsonDataSetsReader.GetListValue(jds,0));

end;

procedure TFClientMain.proc_checkconndatabase(str: string);
begin
    if str='未连接' then
    begin
     //result:=false;
     showmessage('数据库没连接，请连接后再测试！');
     exit;
   end
   // else  result:=true;

end;

procedure TFClientMain.proc_readini(ServerId:string);
begin
 var strIniFile:=GetCurrentDir +'\Config.ini';
 //dbSection 从1 开始对应相应的应用 ：1061-9.0  是Database1, 依次类推（按顺序增加）

 var DbSection:='APP'+ServerId;
  if FileExists(strIniFile) then
  begin
  with TIniFile.Create(strIniFile) do
    try
        ConnRemoteIP:=ReadString(DbSection, 'ConnRemoteIP', '');
        edtAccount.text := ReadString(DbSection, 'User_Name', '');
        edtPassword.text := ReadString(DbSection, 'Password', '');
        cmbDatabase.ItemIndex:=0;//:=ReadString(DbSection, 'Database', '');
        edtServer.text := ReadString(DbSection, 'Server', '');
        edtPort.Text  := ReadString(DbSection, 'port', '');
    finally
     Free;
    end;

   end;

end;

procedure TFClientMain.pro_ObjectEnable(EnableState: boolean);
begin
   { btnSymbols.Enabled:=EnableState;
    Edt_symbols.ReadOnly:=not  EnableState;
    btnconn.Enabled:=not  EnableState;    }

end;

procedure TFClientMain.btnAutoHandClick(Sender: TObject);
var
     jds,jds2:TFDJSONDataSets;
begin



 try
  // fun_check(cmb_autohan空')=false then exit;
   if fun_check(cmb_antohand.Selected.Text,'你没有选择切换模式')=false then exit;

    // if FDMemTable1 then
   if FMtbl_trade_product_config.Active=True then      FMtbl_trade_product_config.Close;


   jds := ClientModuleUnit1.ClientModule1.Server_DataModuleClient
    .GetUpdateTradeProductConfig(trim(NumBox.Text),inttostr(cmb_antohand.ItemIndex),'0');
     FMtbl_trade_product_config.AppendData(TFDJsonDataSetsReader.GetListValue(jds,0));


   if Fmtbl_trade_product_config_real.Active=True then      Fmtbl_trade_product_config_real.Close;

    jds2 := ClientModuleUnit1.ClientModule1.Server_DataModuleClient
    .GetUpdateTradeProductConfig(trim(NumBox.Text),inttostr(cmb_antohand.ItemIndex),'1');
    Fmtbl_trade_product_config_real.AppendData(TFDJsonDataSetsReader.GetListValue(jds2,0));
 except
    exit


end;
end;

procedure TFClientMain.btnConnClick(Sender: TObject);

begin
try

 with   ClientModule1.DSRestConnection1 do
    begin
      If not ClientModule1.DSRestConnection1.PreserveSessionID then
       ClientModule1.DSRestConnection1.SessionID:='';
   // FConnection.SessionID := '';RES;
     // ClientModule1.DSRestConnection1.ClearSessionCredentials;
      Host:=ConnRemoteIP;
      Port:=211;
     ClientModule1.DSRestConnection1.Reset;

    end;

  //   ClientModule1.DSRestConnection1.ClearSessionCredentials
    // showmessage(ClientModule1.DSRestConnection1.Host);

     if btnConn.ImageIndex=4 then
     begin
        btnConn.ImageIndex:=5;
        btnConn.Text:='已连接';
      //  pro_ObjectEnable(false);
     end
     else
     begin
         btnConn.ImageIndex:=4;
        btnConn.Text:='未连接';
       //  pro_ObjectEnable(true);
     end;

   // showmessage(

    //设置要链接的数据库
    ClientModuleUnit1.ClientModule1.Server_DataModuleClient.SetConnDabaseConfig(
        '',cmbDatabase.Selected.Text,'','','');


   //取得所有的表 显示到 table 中
   var jds:= ClientModuleUnit1.ClientModule1.Server_DataModuleClient.GetDataBaseAllTables(cmbDatabase.Selected.Text);
   if fmtbl_tables.Active=True then      fmtbl_tables.Close;

   fmtbl_tables.AppendData(TFDJsonDataSetsReader.GetListValue(jds,0));


  {  ClientModuleUnit1.ClientModule1.Server_DataModuleClient.SetConnDabaseConfig(
        trim(edtServer.text),cmbDatabase.Selected.Text,trim(edtPort.text),
        trim(edtAccount.text),trim(edtPassword.text));      }


except
  exit;
end;
end;

procedure TFClientMain.RadioButton1Click(Sender: TObject);
begin
  AppStr:=trim(TRadioButton(Sender).Text);
  var str:=AppStr;


    if str='测试系统' then
    begin
    // ConnRemoteIP:='47.93.11.161';
     // ConnRemoteIP:='192.168.128.148';
      proc_readini('0');
     // ClientModule1.DSRestConnection1:=ClientModule1.DSRestConnection_1061;
    end
    else if str='1061-9.0' then
    begin
    // ConnRemoteIP:='47.93.11.161';
     // ConnRemoteIP:='192.168.128.148';
      proc_readini('1');
     // ClientModule1.DSRestConnection1:=ClientModule1.DSRestConnection_1061;
    end
    else if str='1090' then
    begin
     //ConnRemoteIP:='39.97.190.62';
     proc_readini('2');
    end
    else if str='1111' then
    begin
    //  ConnRemoteIP:='39.106.14.245';
      proc_readini('3');
    end
    else
    begin
    // ConnRemoteIP:='39.105.131.112';
      proc_readini('4');
     // ClientModule1.DSRestConnection1:=ClientModule1.DSRestConnection_1061_2;
    end;


    //


end;

procedure TFClientMain.RadioButton4Change(Sender: TObject);
begin
     // ClientModule1.DSRestConnection1.Host:='10.0.2.9';
   // ClientModule1.DSRestConnection1.Reset;
 // if True then
   btnConn.ImageIndex:=4;
   btnConn.Text:='未连接';

   Fmtbl_Symbols.close;

  //关闭 服务器 Fdconnection

   pro_ObjectEnable(false);

end;

procedure TFClientMain.SpeedButton1Click(Sender: TObject);
begin
    if trim(TSpeedButton(sender).text)='数据表-导航栏' then
   begin
      pnl_tablebar.visible:=true;
      TSpeedButton(sender).text:=' 数据表-导航栏 ';

   end
   else
   begin
      pnl_tablebar.visible:=false;

      TSpeedButton(sender).text:=' 隐藏.数据表-导航栏 ';
   end;
end;

procedure TFClientMain.btn_newsymbolsClick(Sender: TObject);

var
  pt: TPoint;
  r: TRect;
begin
  {pt := Point(SpeedButton6.Position.Point.X, Edit1.Left);
  pt := ClientToScreen(pt);
  Edit2.Text := inttostr(pt.X);
  Edit3.Text := inttostr(pt.y);
  Mouse.CursorPos := Point(pt.X, pt.y);
  GetWindowRect(Form2.Handle, r);
  Mouse.CursorPos := Point(r.Left + 20, r.Top + 150 + 20);  }
  edtWeb.Text:='http://data.eastmoney.com/xg/xg/default.html';
  web.Navigate(edtWeb.Text);

end;

procedure TFClientMain.btnSymbolsClick(Sender: TObject);
var  jds:TFDJSONDataSets;
begin

  proc_checkconndatabase(btnconn.Text);

  if fun_check(edt_symbols.Text,'新股代码不能为空')=false then exit;



 //  if FDMemTable1.Active=True then      FDMemTable1.Close;

   jds := ClientModuleUnit1.ClientModule1.Server_DataModuleClient.GetSymbolsList(trim(Edt_symbols.Text));
  // if FDMemTable1 then
   if Fmtbl_Symbols.Active=True then      Fmtbl_Symbols.Close;

   Fmtbl_Symbols.AppendData(TFDJsonDataSetsReader.GetListValue(jds,0));

  // StringGrid1.em
end;

procedure TFClientMain.btnTelClick(Sender: TObject);
var
   i:integer;
   strsql,strwhere:string;
   jds:TFDJSONDataSets;
begin

  if fun_check(edt_LoginName.Text,'登录用户账号不能为空')=false then exit;
  if fun_check(edt_tel.Text,'用户手机号码不能为空')=false then exit;


  jds := ClientModuleUnit1.ClientModule1.Server_DataModuleClient
     .GetUpdateUserTelList(trim(edt_LoginName.Text),trim(Edt_Tel.Text));
  // if FDMemTable1 then
   if FMtbl_UserTel.Active=True then      FMtbl_UserTel.Close;

   FMtbl_UserTel.AppendData(TFDJsonDataSetsReader.GetListValue(jds,0));


end;

procedure TFClientMain.btn_addsqlClick(Sender: TObject);
begin
   if trim(TSpeedButton(sender).text)='增加查询' then
   begin
      pnl_sql.visible:=true;
      TSpeedButton(sender).text:=' 关闭查询 ';
      btn_execsql.Enabled:=true;
   end
   else
   begin
      pnl_sql.visible:=false;
      btn_execsql.Enabled:=false;
      TSpeedButton(sender).text:=' 增加查询 ';
   end;

end;

procedure TFClientMain.btn_execsqlClick(Sender: TObject);
begin
   if fun_check(memo_Sql.Text,'你输入的SQL 不能为空')=false then exit;


   var jds:= ClientModuleUnit1.ClientModule1.Server_DataModuleClient.GetSqLByRecords(memo_Sql.Text);
   if Fmtbl_Records.Active=True then      Fmtbl_Records.Close;

   Fmtbl_Records.AppendData(TFDJsonDataSetsReader.GetListValue(jds,0));
end;

procedure TFClientMain.btn_webClick(Sender: TObject);
begin
  web.Navigate(edtWeb.Text);
end;

procedure TFClientMain.chkDatabaseClick(Sender: TObject);
begin
     if chkdatabase.IsChecked=true  then
        pnl_datainit.Visible:=true
     else
         pnl_datainit.Visible:=false;
end;

procedure TFClientMain.CornerButton2Click(Sender: TObject);
begin
     //  PopupMenu1.Popup(CornerButton2.)
end;

procedure TFClientMain.edt_RecordsFilterChange(Sender: TObject);
begin
     Fmtbl_Records.Filtered:=false;
  // var     str:='%'+edt_RecordsFilter.text+'%';
 //    str:=' table_name like '''+str+'''';
   Fmtbl_Records.Filter:=edt_RecordsFilter.text;
   Fmtbl_Records.Filtered:=true;
end;

procedure TFClientMain.edt_tables_FilterChange(Sender: TObject);
begin
    fmtbl_tables.Filtered:=false;
   var     str:='%'+edt_tables_Filter.text+'%';
     str:=' table_name like '''+str+'''';
   fmtbl_tables.Filter:=str;
   fmtbl_tables.Filtered:=true;
end;

end.
