import os
import codecs
from config import *

tm_list = [f for f in  os.listdir(TM_DIR) if f.endswith('.txt')]

def search_file(file: str, query: str) -> list[str]:
    results = list()
    tm_file = TM_DIR + file
    with codecs.open(tm_file, "r", encoding="UTF16") as file:
        for line in file:
            try:
                if query in line.lower():
                    results.append(line)
            except:
                pass
    return results

def search(query: str) -> list[str]:
    final_results = list()

    for tm in tm_list:
       result = search_file(tm, query)
       if result:
            final_results.append(f"Found in {tm}:\n")
            final_results.extend(result)
            final_results.append(f"{79 * '-'}\n")
    return final_results

def main():
   while True:
        prompt = input("Enter search query or q to quit: ").lower()
        if prompt == "q" or prompt == "й":
            break
        else:
            search_results = search(prompt)
            if not search_results:
                print("No results found")
            else:
                for result in search_results:
                    try:
                        print(result)
                    except:
                        pass


if __name__ == "__main__":
    main()