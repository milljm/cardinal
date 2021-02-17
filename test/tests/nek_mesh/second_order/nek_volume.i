[Problem]
  # We dont need to use NekProblem here for this simple test, which only checks
  # the construction of a mesh. Therefore, we are implicitly using FEProblem, which
  # has some requirements for the existence of kernels and variables. Disable those
  # with 'kernel_coverage_check = false' and adding a 'dummy' nonlinear variable.
  kernel_coverage_check = false
[]

[Mesh]
  type = NekRSMesh
  order = SECOND
  volume = true
[]

[Variables]
  [dummy]
  []
[]

[Executioner]
  type = Transient
  num_steps = 1
[]

[Outputs]
  exodus = true
[]

[Postprocessors]
  [./num_elems]
    type = NekMeshInfoPostprocessor
    test_type = num_elems
  [../]
  [./num_nodes]
    type = NekMeshInfoPostprocessor
    test_type = num_nodes
  [../]

  # coordinates of nodes of element 0
  [./elem0_node00_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 0
    test_type = node_x
  [../]
  [./elem0_node00_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 0
    test_type = node_y
  [../]
  [./elem0_node00_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 0
    test_type = node_z
  [../]
  [./elem0_node01_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 1
    test_type = node_x
  [../]
  [./elem0_node01_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 1
    test_type = node_y
  [../]
  [./elem0_node01_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 1
    test_type = node_z
  [../]
  [./elem0_node02_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 2
    test_type = node_x
  [../]
  [./elem0_node02_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 2
    test_type = node_y
  [../]
  [./elem0_node02_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 2
    test_type = node_z
  [../]
  [./elem0_node03_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 3
    test_type = node_x
  [../]
  [./elem0_node03_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 3
    test_type = node_y
  [../]
  [./elem0_node03_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 3
    test_type = node_z
  [../]
  [./elem0_node04_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 4
    test_type = node_x
  [../]
  [./elem0_node04_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 4
    test_type = node_y
  [../]
  [./elem0_node04_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 4
    test_type = node_z
  [../]
  [./elem0_node05_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 5
    test_type = node_x
  [../]
  [./elem0_node05_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 5
    test_type = node_y
  [../]
  [./elem0_node05_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 5
    test_type = node_z
  [../]
  [./elem0_node06_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 6
    test_type = node_x
  [../]
  [./elem0_node06_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 6
    test_type = node_y
  [../]
  [./elem0_node06_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 6
    test_type = node_z
  [../]
  [./elem0_node07_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 7
    test_type = node_x
  [../]
  [./elem0_node07_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 7
    test_type = node_y
  [../]
  [./elem0_node07_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 7
    test_type = node_z
  [../]
  [./elem0_node08_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 8
    test_type = node_x
  [../]
  [./elem0_node08_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 8
    test_type = node_y
  [../]
  [./elem0_node08_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 8
    test_type = node_z
  [../]
  [./elem0_node09_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 9
    test_type = node_x
  [../]
  [./elem0_node09_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 9
    test_type = node_y
  [../]
  [./elem0_node09_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 9
    test_type = node_z
  [../]
  [./elem0_node10_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 10
    test_type = node_x
  [../]
  [./elem0_node10_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 10
    test_type = node_y
  [../]
  [./elem0_node10_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 10
    test_type = node_z
  [../]
  [./elem0_node11_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 11
    test_type = node_x
  [../]
  [./elem0_node11_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 11
    test_type = node_y
  [../]
  [./elem0_node11_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 11
    test_type = node_z
  [../]
  [./elem0_node12_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 12
    test_type = node_x
  [../]
  [./elem0_node12_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 12
    test_type = node_y
  [../]
  [./elem0_node12_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 12
    test_type = node_z
  [../]
  [./elem0_node13_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 13
    test_type = node_x
  [../]
  [./elem0_node13_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 13
    test_type = node_y
  [../]
  [./elem0_node13_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 13
    test_type = node_z
  [../]
  [./elem0_node14_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 14
    test_type = node_x
  [../]
  [./elem0_node14_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 14
    test_type = node_y
  [../]
  [./elem0_node14_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 14
    test_type = node_z
  [../]
  [./elem0_node15_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 15
    test_type = node_x
  [../]
  [./elem0_node15_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 15
    test_type = node_y
  [../]
  [./elem0_node15_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 15
    test_type = node_z
  [../]
  [./elem0_node16_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 16
    test_type = node_x
  [../]
  [./elem0_node16_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 16
    test_type = node_y
  [../]
  [./elem0_node16_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 16
    test_type = node_z
  [../]
  [./elem0_node17_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 17
    test_type = node_x
  [../]
  [./elem0_node17_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 17
    test_type = node_y
  [../]
  [./elem0_node17_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 17
    test_type = node_z
  [../]
  [./elem0_node18_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 18
    test_type = node_x
  [../]
  [./elem0_node18_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 18
    test_type = node_y
  [../]
  [./elem0_node18_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 18
    test_type = node_z
  [../]
  [./elem0_node19_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 19
    test_type = node_x
  [../]
  [./elem0_node19_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 19
    test_type = node_y
  [../]
  [./elem0_node19_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 19
    test_type = node_z
  [../]
  [./elem0_node20_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 20
    test_type = node_x
  [../]
  [./elem0_node20_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 20
    test_type = node_y
  [../]
  [./elem0_node20_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 20
    test_type = node_z
  [../]
  [./elem0_node21_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 21
    test_type = node_x
  [../]
  [./elem0_node21_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 21
    test_type = node_y
  [../]
  [./elem0_node21_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 21
    test_type = node_z
  [../]
  [./elem0_node22_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 22
    test_type = node_x
  [../]
  [./elem0_node22_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 22
    test_type = node_y
  [../]
  [./elem0_node22_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 22
    test_type = node_z
  [../]
  [./elem0_node23_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 23
    test_type = node_x
  [../]
  [./elem0_node23_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 23
    test_type = node_y
  [../]
  [./elem0_node23_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 23
    test_type = node_z
  [../]
  [./elem0_node24_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 24
    test_type = node_x
  [../]
  [./elem0_node24_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 24
    test_type = node_y
  [../]
  [./elem0_node24_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 24
    test_type = node_z
  [../]
  [./elem0_node25_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 25
    test_type = node_x
  [../]
  [./elem0_node25_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 25
    test_type = node_y
  [../]
  [./elem0_node25_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 25
    test_type = node_z
  [../]
  [./elem0_node26_x]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 26
    test_type = node_x
  [../]
  [./elem0_node26_y]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 26
    test_type = node_y
  [../]
  [./elem0_node26_z]
    type = NekMeshInfoPostprocessor
    element = 0
    node = 26
    test_type = node_z
  [../]
[]
