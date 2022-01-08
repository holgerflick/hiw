object DbManager: TDbManager
  OnCreate = DataModuleCreate
  Height = 268
  Width = 254
  PixelsPerInch = 96
  object Manager: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 64
    Top = 48
  end
end
