import numpy as np
import pandas as pd
import seaborn as sns
from matplotlib import pyplot as plt

metabolites_inoculated = pd.read_excel("plot_metabolites_inoculated.xlsx", header=0, index_col=0)
metabolites_standard = pd.read_excel("plot_metabolites_standard.xlsx", header=0, index_col=0)
mos_standard = pd.read_excel("plot_mos_standard.xlsx", header=0, index_col=0)
mos_inoculated = pd.read_excel("plot_mos_inoculated.xlsx", header=0, index_col=0)


def figures(df, name, signif=False):
    
    print(f"\n\n\nDF: {name}\n\n")

    df = df.reset_index(drop=True) # corrigiendo el problema de "duplicate labels"
    df['abundance'] = np.log(df['abundance'] + 1) # converting to log scale
    title  = name
    if signif: # title changes when looking only at the 
        df = df[df['corrected_p_value'] < 0.05] # drop if not significative
        title = f"{name[:-4]}p value < 0.05)"
        
    # violin plot
    plot = sns.violinplot(x=df['name'], y=df['abundance'], data=df, palette='Pastel1', inner="points")
    plot.set_xticklabels(plot.get_xticklabels(), rotation=45, horizontalalignment='right', size=6)
    plt.tight_layout()
    plt.ylabel("Abundance (log)")
    plt.xlabel("Name")
    plt.title(f"{title}")
    plt.subplots_adjust(top=0.95) # moving plot a little bit down so title doesn't get cropped
    plt.savefig(f"Plots/{name}.png", dpi=300)#, bbox_inches="tight")
    plt.show()

figures(metabolites_inoculated, "Inoculated metabolites")
figures(metabolites_standard, "Standard metabolites")
figures(mos_inoculated, "Inoculated microorganisms")
figures(mos_standard, "Standard microorganisms")

figures(mos_standard, "Standard microorganisms (sig)", signif=True)
figures(mos_inoculated, "Inoculated microorganisms (sig)", signif=True)
figures(metabolites_inoculated, "Inoculated metabolites (sig)", signif=True)
figures(metabolites_standard, "Standard metabolites (sig)", signif=True)
