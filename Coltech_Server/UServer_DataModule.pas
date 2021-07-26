unit UServer_DataModule;

interface

uses Winapi.Windows,System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth,Data.FireDACJSONReflect,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
   FireDAC.Comp.UI, FireDAC.Phys.MySQL,firedac.comp.Client,Vcl.DBCtrls,RegularExpressions,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,IniFiles,ShellAPI;

type
{$METHODINFO ON}
  TServer_DataModule = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Fdq_symbols: TFDQuery;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    Fdq_pub: TFDQuery;
    Fdq_Tel: TFDQuery;
    Fdq_trade_product_config: TFDQuery;
    Fdq_trade_product_config_real: TFDQuery;
    FdWeekReport: TFDMemTable;
    FdWeekReportHoldNum: TIntegerField;
    FdWeekReportUsedInvest: TFloatField;
    FdWeekReportUsedReal: TFloatField;
    FdWeekReportAmount: TFloatField;
    FdWeekReporthistory_Amount: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
      dbUser,dbPass,dbName,dbPort,dbServer:string;
     // EdtValue:string:查询条件，用 ’，’ 分割成字符串数组，如： 600007,600015...
    // TableValue:string:查询数据表的名称。字符型  如：sys_user
    // FieldValue:string:查询数据表字段的名称。字符型  如：usercode  作为条件的字段  usercode='张三'
    // FdqName:TFDQuery :查询输出的对象  这里用 FdqName:TFDQuery
       procedure proc_Locate(EdtValue,TableValue,FieldValue:string;FdqName:TFDQuery);

         //生成sql语句的 where条件
    //var1-> EdtStr:string   查询条件的字符串，，用 ’，’ 分割成字符串数组，如： 600007,600015...
    //var2-> FieldValue:string:查询数据表字段的名称。字符型  如：usercode  作为条件的字段  usercode='张三'
      function Fun_WhereSql(EdtStr,FieldValue:string):string;

      //执行exEsql  update insert  在服务端执行 sql
      function Fun_ExecSql(strsql: string;Fdq:TFDQuery): boolean;

          //简单条件查询  select * from tables
      procedure pro_LocateSql(Strsql:string;FdqName:TFDQuery);

      procedure proc_readini;

      //连接数据库
     procedure proc_ConnDataBase;

  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    //从服务端 取得 新股代码 返回到客户端
    function GetSymbolsList(const StrSymblos: string):TFDJSONDataSets;

    //取得数据库中所有的表
     function GetDataBaseAllTables(const StrDatabase: string):TFDJSONDataSets;

   //取得数据库中所有的表的结构
     function GetTableNameByFields(const StrDatabase,StrTable: string):TFDJSONDataSets;

    //根据sql 条件 取得数据库表的记录
     function GetSqLByRecords(const strsql: string):TFDJSONDataSets;


    //更改用户手机号
    function GetUpdateUserTelList(const strUser,strTel:string):TFDJSONDataSets;

    //更改成交模式
    function GetUpdateTradeProductConfig(const RowId,WorkState,RealFlag:string):TFDJSONDataSets;

    //周报表统计
    function GetWeekReport(BeginTime,EndTime:string):TFDJSONDataSets;


    //设置数据初始化参数  写 config.INI的数据库配置参数
    Procedure SetConnDabaseConfig(dbServer,dbName,dbPort,dbUser,dbPass:string);

  end;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses System.StrUtils;

procedure TServer_DataModule.proc_readini;
begin
 var strIniFile:=GetCurrentDir +'\Config.ini';
  if FileExists(strIniFile) then
  begin
  with TIniFile.Create(strIniFile) do
    try
        dbUser := ReadString('DataBase', 'User_Name', '');
        dbPass := ReadString('DataBase', 'Password', '');
        dbName:=ReadString('DataBase', 'Database', '');
        dbServer := ReadString('DataBase', 'Server', '');
        dbPort  := ReadString('DataBase', 'port', '');
    finally
     //Free;
    end;

   end;

end;

procedure TServer_DataModule.pro_LocateSql(Strsql: string; FdqName: TFDQuery);
begin
     with   FdqName do
     begin
       close;
       sql.text:=strsql;
       open;
     end;
end;

function TServer_DataModule.Fun_ExecSql(strsql: string;Fdq:TFDQuery): boolean;
begin
    with Fdq do
    begin
       close;
       sql.text:=strsql;
       execsql;
    end;
   Fdq.Free;
end;

function TServer_DataModule.Fun_WhereSql(EdtStr,FieldValue: string): string;
var
   I:integer;
  strwhere:string;
begin

  var var_array:=TRegEx.Split(EdtStr,',');

  var num:=Length(var_array);


  for  I := 0 to num-1 do
  begin

      if I=0 then
         strwhere:=FieldValue+'='''+var_array[i]+''''
      else
         strwhere:=strwhere+' or '+FieldValue+'='''+var_array[i]+''' ';

  end;
  result:=strwhere;
end;


{ // EdtValue:string:查询条件，用 ’，’ 分割成字符串数组，如： 600007,600015...
    // TableValue:string:查询数据表的名称。字符型  如：sys_user
    // FieldValue:string:查询数据表字段的名称。字符型  如：usercode  作为条件的字段  usercode='张三'
    // FdqName:TFDQuery :查询输出的对象  这里用 FdqName:TFDQuery    }
procedure TServer_DataModule.proc_Locate(EdtValue,TableValue,FieldValue:string;FdqName:TFDQuery);
var
  // i:integer;    EdtStr,strwhere
   strsql,strwhere:string;
begin
 strsql:='SELECT * FROM '+TableValue;
 strwhere:=Fun_WhereSql(EdtValue,FieldValue);
 strsql:=strsql+' where '+strwhere;

  with FdqName do
  begin
     close;
     sql.text:=strsql;
     open;
  end;


end;
//连接数据库
procedure TServer_DataModule.proc_ConnDataBase;
begin
   proc_readini;
   //if FDConnection1. then

  // FDConnection1:=TFDConnection.create(nil);
    FDConnection1.close;
    with FDConnection1 do begin
    Close;
    // create temporary connection definition
    with Params do begin
      Clear;
      Add('DriverID=MySQL');
      Add('Server='+ dbServer);
      Add('Port='+ dbPort);
      Add('Database=' + dbName);
      Add('Password='+ dbPass);
      Add('User_Name='+ dbUser);
     // Add('CharacterSet=gb2312');
      Add('CharacterSet=utf8');

    end;
    Open;
    end;
end;

procedure TServer_DataModule.DataModuleCreate(Sender: TObject);
begin
    proc_ConnDataBase;
end;

function TServer_DataModule.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServer_DataModule.GetDataBaseAllTables(
  const StrDatabase: string): TFDJSONDataSets;
var
  LDataSets: TFDJSONDataSets;
begin
  //打开查询的NEW的股票代码表
 var strsql:='select table_name from information_schema.tables where '
       +'table_schema='''+StrDatabase+''' and table_type=''base table'' '
       +' order by table_name ';
 pro_LocateSql(strsql, Fdq_pub);

  Result := TFDJSONDataSets.Create;
  // Add departments dataset
   TFDJSONDataSetsWriter.ListAdd(Result, 'allTables', Fdq_pub);

end;

function TServer_DataModule.GetSqLByRecords(
  const strsql: string): TFDJSONDataSets;
 var
  LDataSets: TFDJSONDataSets;
begin

  pro_LocateSql(strsql, Fdq_pub);

  Result := TFDJSONDataSets.Create;
  // Add departments dataset
  TFDJSONDataSetsWriter.ListAdd(Result, 'locateSQLRecord', Fdq_pub);

end;

function TServer_DataModule.GetSymbolsList(
  const StrSymblos: string): TFDJSONDataSets;
var
  LDataSets: TFDJSONDataSets;
begin
  //打开查询的NEW的股票代码表
  proc_Locate(StrSymblos,'trade_product','ProductCode',Fdq_symbols);

  Result := TFDJSONDataSets.Create;
  // Add departments dataset

  TFDJSONDataSetsWriter.ListAdd(Result, 'Symbols', Fdq_symbols);

end;

function TServer_DataModule.GetTableNameByFields(
  const strDatabase,StrTable: string): TFDJSONDataSets;
var
  LDataSets: TFDJSONDataSets;
begin
  //打开查询的NEW的股票代码表
 var strsql:='select column_name from information_schema.columns where '
       +'table_schema='''+StrDatabase+'''  and table_name='''+StrTable+''''
       +' order by column_name ';
  pro_LocateSql(strsql, Fdq_pub);

  Result := TFDJSONDataSets.Create;
  // Add departments dataset
   TFDJSONDataSetsWriter.ListAdd(Result, 'TableFields', Fdq_pub);
end;

function TServer_DataModule.GetUpdateTradeProductConfig(const RowId,
  WorkState,RealFlag: string): TFDJSONDataSets;
var
     strsql:string;
begin
try

  if  RealFlag='0' then    //trade_product_config
    begin

      // 更新 成交模式数据  成交模式: 0:非实盘手动确认 1:实盘自动成交  2:非实盘自动确认)(A股)
     strsql:=' UPDATE trade_product_config SET  TextValue='''+WorkState+''''
              +' WHERE ConfigType='''+RowId+'''';
    //更改 trade_product_config 的模式
     Fun_ExecSql(strsql,Fdq_pub);

      //Fdq_pub.free;

     strsql:='select  * from  trade_product_config  limit  20,10 ';
      pro_LocateSql(strsql,Fdq_trade_product_config);
    //  Fdq_trade_product_config.Free;
    Result := TFDJSONDataSets.Create;
  // Add departments dataset
    TFDJSONDataSetsWriter.ListAdd(Result, 'trade_product_config', Fdq_trade_product_config);
    end;

    if  RealFlag='1' then    //trade_product_config_real
    begin
     strsql:=' UPDATE trade_product_config_real SET  TextValue='+WorkState
              +' WHERE ConfigType='''+RowId+'''';
    //更改 trade_product_config 的模式
     Fun_ExecSql(strsql,Fdq_pub);

     strsql:='select  * from  trade_product_config_real  limit  20,10 ';
      pro_LocateSql(strsql,Fdq_trade_product_config_real);

      Result := TFDJSONDataSets.Create;
  // Add departments dataset
    TFDJSONDataSetsWriter.ListAdd(Result, 'trade_product_config_real', Fdq_trade_product_config_real);

   //  Fdq_trade_product_config_real.Free;
    end;



   //  2. 通过json 把数据传回本地

 except
   exit;
end;

end;

function TServer_DataModule.GetUpdateUserTelList(const strUser,
  strTel: string): TFDJSONDataSets;
var
   strwhere,strsql:string;
begin
    //1. 执行更新操作
   strwhere:=Fun_WhereSql(strUser,'LoginName');
   strsql:='update sys_user  set  Mobile='''+trim(strTel)+''''
           +' where '+strwhere;

   Fun_ExecSql(strsql,Fdq_pub);

   Fdq_pub.Free;

  // 1. 查询更新接口  检验   查询到已经更新用户的数据
   strwhere:=Fun_WhereSql(strUser,'LoginName');
   proc_Locate(strUser,'sys_user', 'LoginName', Fdq_tel);

 //  2. 通过json 把数据传回本地

    Result := TFDJSONDataSets.Create;
  // Add departments dataset
    TFDJSONDataSetsWriter.ListAdd(Result, 'Sys_User', Fdq_tel);


end;

function TServer_DataModule.GetWeekReport(BeginTime,
  EndTime: string): TFDJSONDataSets;
var
  strsql:String;
  HoldNum:integer;
  UsedInvest,UsedReal,Amount,history_Amount:real;

begin
  // 统计持仓单    1
   strsql:='select COUNT(OrderID)  from funding_system.trade_o_hold';
   pro_LocateSql(strsql,fdq_pub);
   HoldNum:=fdq_pub.Fields[0].asinteger;

   // 统计占用保金金    2
   strsql:='select SUM(UsedInvest) a from funding_system.trade_o_hold;';
   pro_LocateSql(strsql,fdq_pub);
   UsedInvest:=fdq_pub.Fields[0].asfloat;

  // 统计占用保金金   3
   strsql:='select sum(UsedReal)  from funding_system.trade_o_hold WHERE  '
        +' `OrderTime` > '''+BeginTime+''''+' AND `OrderTime` < '''+EndTime+'''';
   pro_LocateSql(strsql,fdq_pub);
   UsedReal:=fdq_pub.Fields[0].asinteger;

  //统计周入金 5

   strsql:='SELECT SUM(Amount)/100  FROM dwpay.trade_pay_flow WHERE  '
     +'Status=1 AND CreateTime > '''+BeginTime+''''+' AND CreateTime <'''+EndTime+'''';

   pro_LocateSql(strsql,fdq_pub);
   Amount:=fdq_pub.Fields[0].asfloat;


  //统计历史周入金 6

   strsql:='SELECT SUM(Amount)/100  FROM dwpay.trade_pay_flow WHERE  '
     +' Status=1 ';
     //AND CreateTime >''2021-07-19 00:00:00'' AND CreateTime <''2021-07-23 23:59:59''';

   pro_LocateSql(strsql,fdq_pub);
   history_Amount:=fdq_pub.Fields[0].asfloat;




   if FdWeekReport.Active=true then  FdWeekReport.Active:=false;
   with  FdWeekReport do
   begin
     Active:=true;
     Append;

     fieldbyname('HoldNum').asinteger:=HoldNum;
     fieldbyname('UsedInvest').asfloat:=UsedInvest;
     fieldbyname('UsedReal').asfloat:=UsedReal;
     fieldbyname('Amount').asfloat:=Amount;
     fieldbyname('history_Amount').asfloat:=history_Amount;
     post;
   end;

  //  2. 通过json 把数据传回本地

    Result := TFDJSONDataSets.Create;
  // Add departments dataset
    TFDJSONDataSetsWriter.ListAdd(Result, 'weekreport', FdWeekReport);


 {  -- 周入金5
SELECT COUNT(*),SUM(Amount)/100,InChannel,Remark FROM dwpay.trade_pay_flow WHERE  `Status`=1 AND CreateTime >'2021-07-19 00:00:00' AND CreateTime <'2021-07-23 23:59:59';
-- 历史入金6
SELECT COUNT(*),SUM(Amount)/100,InChannel,Remark FROM dwpay.trade_pay_flow WHERE  `Status`=1 GROUP BY InChannel;
                             }



end;

function TServer_DataModule.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

// 设置数据的初始化参数
procedure TServer_DataModule.SetConnDabaseConfig(dbServer, dbName, dbPort,
  dbUser, dbPass: string);
var
    ini: TIniFile;

begin
   var strIniFile:=GetCurrentDir +'\Config.ini';
  // ini:=
  if FileExists(strIniFile) then
  begin
   ini:=TIniFile.Create(strIniFile);
   ini.writestring('DataBase', 'Database', dbName);
  end;

   proc_ConnDataBase;
  {with ini do
    try
     //  writestring('DataBase','User_Name',变量或字符串值);
      //WriteString('DataBase', 'User_Name', dbUser);
     //  writestring('DataBase', 'Password', dbPass);

      // writestring('DataBase', 'Server', dbServer);
     //  writestring('DataBase', 'port', dbPort);
    finally
    // Free;
    end;

   end;   }

  // 断下数据库 ，重新连接数据库

//  FDConnection1.close;
 // FDConnection1.FreeOnRelease;
 // FDConnection1.Free;


end;

end.

