import pandas as pd
import matplotlib.pyplot as plt
import os

def visualize_traffic_data(file_path, output_dir):
    """
    Analyzes and visualizes public transport data from an Excel file.

    Args:
        file_path (str): The path to the Excel file.
        output_dir (str): The directory to save the plots.
    """
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # --- 1. Data Loading and Cleaning ---
    print("Loading and cleaning data...")
    try:
        df = pd.read_excel(file_path, sheet_name='調査結果')
    except Exception as e:
        print(f"Error reading Excel file: {e}")
        return

    # Clean up column names
    column_mapping = {
        'C_2011\nコミュニティバス運行2011年': 'community_bus_2011',
        'C_2017\nコミュニティバス運行2017年': 'community_bus_2017',
        'D_2011\nデマンド型交通運行2011年': 'demand_transport_2011',
        'D_2017\nデマンド型交通運行2017年': 'demand_transport_2017',
        '人口密度（人/km2)': 'pop_density',
        '高齢化率': 'aging_rate',
        '自家用車利用率': 'car_usage_rate'
    }
    df.rename(columns=column_mapping, inplace=True)
    print("Data cleaning complete.")

    # --- 2. Setup Plotting Environment ---
    plt.style.use('seaborn-v0_8-whitegrid')

    # --- 3. Create and Save Visualizations ---

    # Plot 1: Bar chart for year-over-year comparison
    print("Generating Plot 1: Comparison of public transport adoption (2011 vs 2017)...")
    counts = {
        'Community Bus\n2011': df['community_bus_2011'].sum(),
        'Community Bus\n2017': df['community_bus_2017'].sum(),
        'Demand Transport\n2011': df['demand_transport_2011'].sum(),
        'Demand Transport\n2017': df['demand_transport_2017'].sum()
    }
    
    plt.figure(figsize=(10, 6))
    bars = plt.bar(counts.keys(), counts.values(), color=['#1f77b4', '#ff7f0e', '#2ca02c', '#d62728'])
    plt.ylabel('Number of Local Governments', fontsize=12)
    plt.xticks(rotation=0)
    for bar in bars:
        yval = bar.get_height()
        plt.text(bar.get_x() + bar.get_width()/2.0, yval, int(yval), va='bottom', ha='center') # va: vertical alignment

    plot1_path = os.path.join(output_dir, "comparison_2011_2017.png")
    plt.savefig(plot1_path, bbox_inches='tight')
    plt.close()
    print(f"Plot 1 saved to {plot1_path}")

    # Plot 2: Scatter plot of Aging Rate vs. Population Density
    print("Generating Plot 2: Aging Rate vs. Community Bus Adoption (2017)...")
    plt.figure(figsize=(12, 8))
    scatter = plt.scatter(
        df['aging_rate'], 
        df['pop_density'], 
        c=df['community_bus_2017'], 
        cmap='coolwarm', 
        alpha=0.6,
        s=df['pop_density'].clip(upper=1000) / 10 # Use population density for size, capped
    )
    plt.title('Correlation between Aging Rate and Community Bus Adoption (2017)', fontsize=16)
    plt.xlabel('Aging Rate', fontsize=12)
    plt.ylabel('Population Density (people/km²)', fontsize=12)
    plt.yscale('log') # Use log scale for better visualization of density
    legend_labels = plt.legend(*scatter.legend_elements(), title="Community Bus")
    legend_labels.get_texts()[0].set_text('Not Adopted')
    legend_labels.get_texts()[1].set_text('Adopted')
    plt.grid(True, which="both", ls="--")

    plot2_path = os.path.join(output_dir, "aging_rate_vs_transport_2017.png")
    plt.savefig(plot2_path, bbox_inches='tight')
    plt.close()
    print(f"Plot 2 saved to {plot2_path}")

    # Plot 3: Scatter plot of Car Usage Rate vs. Population Density
    print("Generating Plot 3: Car Usage Rate vs. Community Bus Adoption (2017)...")
    plt.figure(figsize=(12, 8))
    scatter = plt.scatter(
        df['car_usage_rate'], 
        df['pop_density'], 
        c=df['community_bus_2017'], 
        cmap='viridis', 
        alpha=0.6,
        s=df['pop_density'].clip(upper=1000) / 10 # Use population density for size, capped
    )
    plt.title('Correlation between Car Usage Rate and Community Bus Adoption (2017)', fontsize=16)
    plt.xlabel('Car Usage Rate', fontsize=12)
    plt.ylabel('Population Density (people/km²)', fontsize=12)
    plt.yscale('log') # Use log scale for better visualization of density
    legend_labels = plt.legend(*scatter.legend_elements(), title="Community Bus")
    legend_labels.get_texts()[0].set_text('Not Adopted')
    legend_labels.get_texts()[1].set_text('Adopted')
    plt.grid(True, which="both", ls="--")

    plot3_path = os.path.join(output_dir, "car_usage_vs_transport_2017.png")
    plt.savefig(plot3_path, bbox_inches='tight')
    plt.close()
    print(f"Plot 3 saved to {plot3_path}")

if __name__ == "__main__":
    excel_file = '地域公共交通調査結果_20190312.xlsx'
    output_directory = 'plots'
    
    # Ensure the script is run from the correct directory
    if not os.path.exists(excel_file):
        print(f"Error: Make sure the script is in the same directory as the Excel file or provide the correct path.")
        print(f"Could not find: {os.path.abspath(excel_file)}")
    else:
        visualize_traffic_data(excel_file, output_directory)
