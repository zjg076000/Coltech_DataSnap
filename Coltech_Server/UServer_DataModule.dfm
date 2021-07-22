object Server_DataModule: TServer_DataModule
  OldCreateOrder = False
  Height = 416
  Width = 492
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=funding_system'
      'User_Name=root'
      'Password=Coltech'
      'Server=10.0.2.46'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 88
    Top = 48
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'D:\SoftCode\Coltech_DataSnap\Coltech_DataSnap\Coltech_Server\lib' +
      'mysql.dll'
    Left = 80
    Top = 128
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 80
    Top = 200
  end
  object Fdq_symbols: TFDQuery
    Active = True
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
end
