object DbManager: TDbManager
  OnCreate = DataModuleCreate
  Height = 536
  Width = 508
  PixelsPerInch = 192
  object Manager: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 128
    Top = 96
  end
  object DriverLink: TFDPhysFBDriverLink
    DriverID = 'FB4'
    Left = 120
    Top = 240
  end
end
