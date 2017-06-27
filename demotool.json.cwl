{
    "class": "CommandLineTool",
    "cwlVersion": "v1.0",
    "id": "risk-score",
    "baseCommand": [
        "python",
        "/opt/calculate_risk.py"
    ],
    "inputs": [
        {
            "sbg:category": "Input",
            "id": "quant_sf",
            "type": "File",
            "inputBinding": {
                "position": 0,
                "prefix": "--quant_sf"
            },
            "label": "Gene Quantification File",
            "doc": "Gene quantification file created by Salmon Quantification tool.",
            "format": [
                "SF"
            ],
            "secondaryFiles": []
        },
        {
            "sbg:category": "Input",
            "id": "sample_ids",
            "type": "string?",
            "inputBinding": {
                "position": 0,
                "prefix": "--sample_id"
            },
            "label": "Sample IDs",
            "doc": "Sample IDs in the order with quant_sf files.",
            "secondaryFiles": []
        }
    ],
    "outputs": [
        {
            "id": "output",
            "doc": "Calculated risk scores.",
            "label": "Risk Scores",
            "type": "File",
            "outputBinding": {
                "glob": "*.tsv"
            },
            "format": [
                "TSV"
            ]
        }
    ],
    "doc": "This simple script calculates lung adenocarcinoma prognostic risk score from Salmon quantification results using the formula published by [Cai *et al.*](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0175850)",
    "label": "Risk Score 2",
    "requirements": [
        {
            "class": "ResourceRequirement",
            "ramMin": 1000,
            "coresMin": 1
        },
        {
            "class": "DockerRequirement",
            "dockerPull": "images.sbgenomics.com/sinan_yavuz_demo/demotool:5900601"
        }
    ],
    "sbg:job": {
        "inputs": {
            "quant_sf": {
                "size": 0,
                "path": "/path/to/quant_sf.ext",
                "secondaryFiles": [],
                "class": "File"
            },
            "sample_ids": "sample_ids-string-value"
        },
        "runtime": {
            "cores": 1,
            "ram": 1000
        }
    },
    "sbg:sbgMaintained": false,
    "sbg:id": "sinan.yavuz_demo/risk-score/risk-score/0",
    "sbg:revisionsInfo": [
        {
            "sbg:revision": 0,
            "sbg:modifiedBy": "sinan.yavuz",
            "sbg:modifiedOn": 1498574418,
            "sbg:revisionNotes": null
        }
    ],
    "sbg:wrapperAuthor": "A. Sinan Yavuz",
    "sbg:toolkit": "Risk Score",
    "sbg:revision": 0,
    "sbg:createdOn": 1498574418,
    "sbg:modifiedBy": "sinan.yavuz",
    "sbg:links": [
        {
            "label": "Article",
            "id": "http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0175850"
        }
    ],
    "sbg:validationErrors": [],
    "sbg:latestRevision": 0,
    "sbg:wrapperLicense": "Apache Licence 2.0",
    "sbg:categories": [
        "Other"
    ],
    "sbg:modifiedOn": 1498574418,
    "sbg:license": "CC BY 4.0",
    "description": "",
    "sbg:toolkitVersion": "v1.0",
    "sbg:modified": true,
    "sbg:createdBy": "sinan.yavuz",
    "sbg:image_url": null,
    "sbg:contributors": [
        "sinan.yavuz"
    ],
    "sbg:project": "sinan.yavuz/api-demo-toolmaintenance",
    "sbg:toolAuthor": "Cai et al.",
    "sbg:appVersion": [
        "v1.0"
    ]
}