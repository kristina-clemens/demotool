#
# This script simply calculates lung adenocarcinoma prognosis risk scores
# from Cai et al. PLoS ONE 12(4): e0175850.
#
"""Usage: risk_score.py --quant_sf FILE [--sample_id STR]

Calculate lung adenocarcinoma prognosis risk score from Salmon output.

Arguments:
  --quant_sf FILE        Salmon quantification file(s). If more than one file,
                         comma-separated.

Options:
  -h, --help
  --sample_id STR        Sample identifier

"""
import numpy as np
import pandas as pd
from docopt import docopt

tool_version = 0.1

args = docopt(__doc__, version=tool_version)
input_files = args["--quant_sf"].split(",")

if args["--sample_id"]:
    sample_ids = args["--sample_id"].split(",")
else:
    sample_ids = input_files

coefs = {
    "ENSG00000105974": 0.12,  # CAV1
    "ENSG00000147689": 0.017,  # FAM83A
    "ENSG00000011426": 0.01,  # ANLN
    "ENSG00000100558": 0.17,  # PLEK2
    "ENSG00000118193": 0.043,  # KIF14
    "ENSG00000134057": 0.015,  # CCNB1
    "ENSG00000169218": -0.0048,  # RSPO1
    "ENSG00000135063": -0.091,  # FAM189A2
    "ENSG00000176771": -0.022,  # NCKAP5
    "ENSG00000121691": -0.036  # CAT
}

risk_scores = []
for idx, filename in enumerate(input_files):
    gene_quant = pd.read_table(filename, index_col=0)
    gene_quant["RPKM"] = np.log2((gene_quant["NumReads"] / (
    gene_quant["EffectiveLength"] / 1000 * gene_quant[
        "NumReads"].sum() / 1000000))+1)
    gene_sc = map(lambda x: gene_quant.ix[x, "RPKM"] * coefs[x], coefs.keys())
    total_score = sum(list(gene_sc))

    risk_scores.append({"Sample_ID": sample_ids[idx],
                        "Risk_Score": total_score})

results = pd.DataFrame(risk_scores, columns=["Sample_ID", "Risk_Score"])

results.to_csv("Risk_Scores.tsv", sep="\t", index=False)

