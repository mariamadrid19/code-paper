import pandas as pd
from scipy.stats import hypergeom
from scipy.stats import false_discovery_control

# data
combined_inoculated = pd.read_excel("combined_inoculated.xlsx", header=0, index_col=0)
combined_standard = pd.read_excel("combined_standard.xlsx", header=0, index_col=0)
matched_metabolites_inoculated = pd.read_excel("matched_metabolite_inoculated.xlsx", header=0, index_col=0)
matched_metabolites_standard = pd.read_excel("matched_metabolite_standard.xlsx", header=0, index_col=0)

#transform metabolite abundances, need to be whole numbers 
rounded_inoculated = matched_metabolites_inoculated.round()
rounded_standard = matched_metabolites_standard.round()

#Function for hypergeometric test
def hypergeom_test(data, outputName):

    p_vals = [] # lista a la que se van a agregar los p_values
    M = data.sum().sum()

    for sample in data.index: # Muestra Ej. Inoculated_1, Inoculated_2, Inoculated_3
        n = data.loc[sample].sum()

        for abund in data.columns: # Bacteria/metabolito
            N = data[abund].sum().sum()
            k = data.loc[sample, abund]
            p = hypergeom.sf(k, M, n, N)
            p_vals.append([sample, abund, p]) # metiendo array de resultados a la lista vacía

    df_pval = pd.DataFrame(p_vals)
    #df_pval.columns = ["sample", "x", "p_value"] # giving the column names
    df_pval.to_excel(f"Hypergeometric-test-results/{outputName}.xlsx") # !!!! saves to a new folder !!!!

    return p_vals

hypergeom_test(combined_inoculated,"microorganisms_inoculated_hypergeom")
hypergeom_test(combined_standard,"microorganisms_standard_hypergeom")
hypergeom_test(rounded_inoculated, "metabolites_rounded_inoculated_hypergeom")
hypergeom_test(rounded_standard, "metabolites_rounded_standard_hypergeom")

# Correct p-values by False Discovery Rate correction (Benjamini-Hochberg)
def correct_pval(file_name):
    df = pd.read_excel(f"Hypergeometric-test-results/{file_name}.xlsx", header=0, index_col=0)
    df['correction_scipy'] = false_discovery_control(df['p-value'])
    df.to_excel(f"Hypergeometric-test-results/{file_name}.xlsx")


# run function on all files
correct_pval("hypergeom_p_values_inoculated")
correct_pval("hypergeom_p_values_standard")
