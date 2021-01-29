[Problem]
  type = NekRSProblem
[]

[Mesh]
  type = NekRSMesh
  boundary = '1 2 3 4 5 6 7 8'
[]

[Executioner]
  type = Transient

  [TimeStepper]
    type = NekTimeStepper
  []
[]

[Outputs]
  [out]
    type = CSV
    hide = 'flux_integral'
    execute_on = 'final'
  []
[]

[Postprocessors]
  [max_temp]
    type = NekVolumeExtremeValue
    field = temperature
    value_type = max
  []
  [min_temp]
    type = NekVolumeExtremeValue
    field = temperature
    value_type = min
  []
  [flux_integral]
    type = Receiver
    default = 0
  []
[]