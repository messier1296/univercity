import pandas as pd
import sys

def analyze_excel(file_path):
    """
    Analyzes an Excel file by printing summary statistics for each sheet.

    Args:
        file_path (str): The path to the Excel file.
    """
    try:
        xls = pd.ExcelFile(file_path)
    except FileNotFoundError:
        print(f"Error: The file was not found at {file_path}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"An error occurred while trying to read the file: {e}", file=sys.stderr)
        sys.exit(1)

    print(f"Analyzing Excel file: {file_path}\n")

    for sheet_name in xls.sheet_names:
        print(f"--- Sheet: {sheet_name} ---")
        try:
            df = pd.read_excel(xls, sheet_name=sheet_name)
            
            if df.empty:
                print("Sheet is empty.")
                continue

            print("\n### First 5 Rows ###")
            print(df.head())
            
            print("\n### Data Types and Non-Null Counts ###")
            df.info()
            
            print("\n### Summary Statistics ###")
            print(df.describe(include='all'))
            
        except Exception as e:
            print(f"Could not process sheet '{sheet_name}': {e}", file=sys.stderr)
        finally:
            print("\n" + "="*50 + "\n")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        file_to_analyze = sys.argv[1]
    else:
        # Default file if no command-line argument is provided
        file_to_analyze = '地域公共交通調査結果_20190312.xlsx'
    
    analyze_excel(file_to_analyze)
