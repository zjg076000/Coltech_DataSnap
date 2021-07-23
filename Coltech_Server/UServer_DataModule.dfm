object Server_DataModule: TServer_DataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 540
  Width = 837
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=funding_system'
      'User_Name=root'
      'Password=fd12345@coltech.comdba'
      'Server=10.0.2.28'
      'Port=12336'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 88
    Top = 48
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'libmysql.dll'
    Left = 80
    Top = 128
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 80
    Top = 200
  end
  object Fdq_symbols: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      ' select * From funding_system.trade_product '
      'where  ProductCode=:a')
    Left = 80
    Top = 280
    ParamData = <
      item
        Name = 'A'
        DataType = ftString
        ParamType = ptInput
        Value = '600005'
      end>
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 232
    Top = 240
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 248
    Top = 184
  end
  object Fdq_pub: TFDQuery
    Connection = FDConnection1
    Left = 388
    Top = 56
  end
  object Fdq_Tel: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sys_user')
    Left = 752
    Top = 16
  end
end
