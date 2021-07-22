unit UServer_DataModule;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth,Data.FireDACJSONReflect,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
   FireDAC.Comp.UI, FireDAC.Phys.MySQL,firedac.comp.Client,Vcl.DBCtrls,RegularExpressions;

type
{$METHODINFO ON}
  TServer_DataModule = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Fdq_symbols: TFDQuery;
  private
     // EdtValue:string:查询条件，用 ’，’ 分割成字符串数组，如： 600007,600015...
    // TableValue:string:查询数据表的名称。字符型  如：sys_user
    // FieldValue:string:查询数据表字段的名称。字符型  如：usercode  作为条件的字段  usercode='张三'
    // FdqName:TFDQuery :查询输出的对象  这里用 FdqName:TFDQuery
       procedure proc_Locate(EdtValue,TableValue,FieldValue:string;FdqName:TFDQuery);

         //生成sql语句的 where条件
    //var1-> EdtStr:string   查询条件的字符串，，用 ’，’ 分割成字符串数组，如： 600007,600015...
    //var2-> FieldValue:string:查询数据表字段的名称。字符型  如：usercode  作为条件的字段  usercode='张三'
      function Fun_WhereSql(EdtStr,FieldValue:string):string;

  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetSymbolsList(const StrSymblos: string):TFDJSONDataSets;
  end;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses System.StrUtils;


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

function TServer_DataModule.EchoString(Value: string): string;
begin
  Result := Value;
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

function TServer_DataModule.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

