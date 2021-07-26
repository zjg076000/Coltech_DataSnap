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
      'DriverID=MySQL'
      'CharacterSet=utf8')
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
    Top = 272
    ParamData = <
      item
        Name = 'A'
        DataType = ftString
        ParamType = ptInput
        Value = '600005'
      end>
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 72
    Top = 392
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 72
    Top = 336
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
    Left = 216
    Top = 64
  end
  object Fdq_trade_product_config: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sys_user')
    Left = 224
    Top = 144
  end
  object Fdq_trade_product_config_real: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from sys_user')
    Left = 224
    Top = 264
  end
  object FdWeekReport: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 488
    Top = 192
    object FdWeekReportHoldNum: TIntegerField
      FieldName = 'HoldNum'
    end
    object FdWeekReportUsedInvest: TFloatField
      FieldName = 'UsedInvest'
    end
    object FdWeekReportUsedReal: TFloatField
      FieldName = 'UsedReal'
    end
    object FdWeekReportAmount: TFloatField
      FieldName = 'Amount'
    end
    object FdWeekReporthistory_Amount: TFloatField
      FieldName = 'history_Amount'
    end
  end
end
