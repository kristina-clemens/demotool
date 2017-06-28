{
  "sbg:latestRevision": 2,
  "sbg:categories": [
    "Other"
  ],
  "sbg:modifiedOn": 1498575730,
  "sbg:license": "Creative Commons Attribution 4.0",
  "sbg:revision": 2,
  "sbg:sbgMaintained": false,
  "description": "This simple script calculates lung adenocarcinoma prognostic risk score from Salmon quantification results using the formula published by [Cai *et al.*](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0175850)",
  "sbg:toolkitVersion": "v1.0",
  "outputs": [
    {
      "sbg:fileTypes": "TSV",
      "id": "#risk_scores",
      "type": [
        "null",
        "File"
      ],
      "description": "Calculated risk scores.",
      "outputBinding": {
        "glob": "*.tsv"
      },
      "label": "Risk Scores"
    }
  ],
  "arguments": [],
  "sbg:toolkit": "Risk Score",
  "baseCommand": [
    "python",
    "/opt/calculate_risk.py"
  ],
  "requirements": [],
  "sbg:id": "sinan.yavuz/api-demo-toolmaintenance/risk-score/2",
  "sbg:project": "sinan.yavuz_demo/risk-score",
  "temporaryFailCodes": [],
  "class": "CommandLineTool",
  "sbg:job": {
    "inputs": {
      "quant_sf": {
        "size": 0,
        "path": "/path/to/quant_sf.ext",
        "secondaryFiles": [],
        "class": "File"
      },
      "sample_ids": [
        "sample_ids-string-value-1",
        "sample_ids-string-value-2"
      ]
    },
    "allocatedResources": {
      "mem": 1000,
      "cpu": 1
    }
  },
  "sbg:createdBy": "sinan.yavuz",
  "label": "Risk Score",
  "sbg:image_url": null,
  "stdout": "",
  "id": "risk-score",
  "sbg:contributors": [
    "sinan.yavuz"
  ],
  "hints": [
    {
      "value": 1,
      "class": "sbg:CPURequirement"
    },
    {
      "value": 1000,
      "class": "sbg:MemRequirement"
    },
    {
      "dockerImageId": "",
      "dockerPull": "images.sbgenomics.com/sinan_yavuz_demo/demotool:5900601",
      "class": "DockerRequirement"
    }
  ],
  "sbg:toolAuthor": "Cai et al.",
  "stdin": "",
  "sbg:cmdPreview": "python /opt/calculate_risk.py --quant_sf /path/to/quant_sf.ext",
  "sbg:createdOn": 1498573859,
  "sbg:modifiedBy": "sinan.yavuz",
  "inputs": [
    {
      "sbg:fileTypes": "SF",
      "id": "#quant_sf",
      "type": [
        "File"
      ],
      "inputBinding": {
        "separate": true,
        "sbg:cmdInclude": true,
        "position": 1,
        "prefix": "--quant_sf"
      },
      "description": "Gene quantification file created by Salmon Quantification tool.",
      "sbg:category": "Input",
      "label": "Gene Quantification File"
    },
    {
      "id": "#sample_ids",
      "type": [
        "null",
        {
          "items": "string",
          "type": "array"
        }
      ],
      "inputBinding": {
        "separate": true,
        "itemSeparator": ",",
        "sbg:cmdInclude": true,
        "position": 2,
        "prefix": "--sample_id"
      },
      "description": "Sample IDs in the order with quantification files.",
      "sbg:stageInput": null,
      "label": "Sample IDs"
    }
  ],
  "sbg:links": [
    {
      "id": "http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0175850",
      "label": "Article"
    }
  ],
  "sbg:appVersion": [
    "sbg:draft-2"
  ],
  "sbg:revisionNotes": "Initial commit",
  "cwlVersion": "sbg:draft-2",
  "successCodes": [],
  "sbg:validationErrors": [],
  "sbg:projectName": "Risk_Score_Test"
}
