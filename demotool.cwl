class: CommandLineTool
cwlVersion: v1.0
id: risk_score_cwl
baseCommand:
  - python
  - calculate_risk.py
inputs:
  - 'sbg:category': Input
    id: quant_sf
    type:
      - File
      - type: array
        items: File
    inputBinding:
      position: 0
      prefix: '--quant_sf'
      itemSeparator: ','
    label: Gene Quantification File
    doc: Gene quantification file created by Salmon Quantification tool.
    format:
      - SF
    secondaryFiles: []
  - 'sbg:category': Input
    id: sample_ids
    type:
      - 'null'
      - string
      - type: array
        items: string
    inputBinding:
      position: 0
      prefix: '--sample_id'
      itemSeparator: ','
    label: Sample IDs
    doc: Sample IDs in the order with quant_sf files.
    secondaryFiles: []
outputs:
  - id: output
    doc: Calculated risk scores.
    label: Risk Scores
    type: File
    outputBinding:
      glob: '*.tsv'
    format:
      - TSV
doc: >-
  This simple script calculates lung adenocarcinoma prognostic risk score from
  Salmon quantification results using the formula published by [Cai *et
  al.*](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0175850)
label: Risk Score
requirements:
  - class: ResourceRequirement
    ramMin: 1000
    coresMin: 1
'sbg:job':
  inputs:
    quant_sf:
      class: File
      path: /path/to/quant_sf.ext
      secondaryFiles: []
      size: 0
    sample_ids: sample_ids-string-value
  runtime:
    cores: 1
    ram: 1000
description: ''
'sbg:categories':
  - Other
'sbg:license': CC BY 4.0
'sbg:links':
  - id: 'http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0175850'
    label: Article
'sbg:modified': true
'sbg:toolAuthor': Cai et al.
'sbg:toolkit': Risk Score
'sbg:toolkitVersion': v1.0
'sbg:wrapperAuthor': A. Sinan Yavuz
'sbg:wrapperLicense': Apache Licence 2.0
