import os
from binascii import unhexlify
from dotenv import load_dotenv

load_dotenv()
key = os.getenv("PRIVATE_KEY")

try:
    raw = unhexlify(key)
    print("✅ Valid hex, length:", len(raw))
except Exception as e:
    print("❌ Error:", e)
