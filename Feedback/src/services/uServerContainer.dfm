object ServerContainer: TServerContainer
  Height = 210
  Width = 431
  PixelsPerInch = 96
  object SparkleHttpSysDispatcher: TSparkleHttpSysDispatcher
    Active = True
    Left = 72
    Top = 16
  end
  object XDataServer: TXDataServer
    BaseUrl = 'http://+:2001/tms/xdata'
    Dispatcher = SparkleHttpSysDispatcher
    EntitySetPermissions = <>
    Left = 216
    Top = 16
  end
end
