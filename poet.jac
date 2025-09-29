import from byllm { Model}
import from os { environ }

glob llm = Model(model_name="gemini/gemini-2.0-flash", api_key=environ['GEMINI_API_KEY']);

def poem(text: str) -> str by llm(method='Reason');

def write_file(filepath: str, content: str) -> bool {
    try {
        with open(filepath, 'w') as file {
            file.write(content);
        }
        return True;
    } except Exception as e {
        print(f"Error writing file: {e}");
        return False;
    }
}

with entry {
    user_poem = poem("Write a poem about music in 4 lines.");
    write_file("poems.txt", user_poem);
        print(user_poem);
}
