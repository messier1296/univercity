import json

path = '/home/hayato/univercity/ITE/sql2.ipynb'
with open(path, 'r') as f:
    data = json.load(f)

print("--- Cell Analysis ---")
for i, cell in enumerate(data['cells']):
    if cell['cell_type'] == 'code':
        source = cell.get('source', [])
        if source:
            first_line = source[0]
            print(f"Cell {i+1} (Exec {cell.get('execution_count')}): {repr(first_line)}")
