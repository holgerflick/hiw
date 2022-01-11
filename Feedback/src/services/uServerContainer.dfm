object ServerContainer: TServerContainer
  Height = 420
  Width = 862
  PixelsPerInch = 192
  object SparkleHttpSysDispatcher: TSparkleHttpSysDispatcher
    Active = True
    Left = 144
    Top = 32
  end
  object XDataServer: TXDataServer
    BaseUrl = 'http://+:2112/'
    Dispatcher = SparkleHttpSysDispatcher
    EntitySetPermissions = <>
    SwaggerOptions.Enabled = True
    SwaggerUIOptions.Enabled = True
    Left = 432
    Top = 32
    object XDataServerCORS: TSparkleCorsMiddleware
      Origin = '*'
    end
  end
end
