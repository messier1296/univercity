import json
import re

notebook_path = '/home/hayato/univercity/ITE/sql2.ipynb'

def fix_notebook(path):
    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    modified = False
    for cell in data['cells']:
        if cell['cell_type'] == 'code':
            source = cell.get('source', [])
            if source:
                first_line = source[0]
                # Check for %%sql with leading/trailing whitespace
                # We want it to be exactly "%%sql\n" or "%%sql"
                if first_line.strip().startswith('%%sql'):
                    cleaned_line = '%%sql\n'
                    if first_line != cleaned_line:
                        print(f"Fixing magic line: {repr(first_line)} -> {repr(cleaned_line)}")
                        source[0] = cleaned_line
                        modified = True

    if modified:
        with open(path, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=1, ensure_ascii=False)
        # Add a newline at the end of the file
        with open(path, 'a') as f:
            f.write('\n')
        print(f"Fixed {path}")
    else:
        print(f"No changes needed for {path}")

if __name__ == '__main__':
    fix_notebook(notebook_path)
