from PIL import Image
import os

def crop_and_save(img_path, target_dir, items):
    if not os.path.exists(img_path):
        print(f"Error: {img_path} not found")
        return
    
    img = Image.open(img_path)
    w, h = img.size
    print(f"Processing {img_path} ({w}x{h})")
    
    for name, box in items.items():
        # box: (left, top, right, bottom) as ratios or absolute? 
        # Let's use absolute for now based on common AI image sizes (1024 or 2048)
        # Assuming 1024x1024 for most.
        crop = img.crop(box)
        save_path = os.path.join(target_dir, f"{name}.png")
        crop.save(save_path)
        print(f"Saved {save_path}")

# Image 0: Gems (Expected 1024x1024)
# 2 rows, 4 columns
gems_items = {
    "white": (50, 260, 280, 490),
    "blue": (290, 260, 500, 490),
    "green": (520, 260, 750, 490),
    "green_alt": (750, 260, 970, 490),
    "black": (50, 520, 280, 750),
    "red": (290, 520, 500, 750),
    "black_alt": (520, 520, 730, 750),
    "gold": (740, 520, 970, 750)
}

# Image 1: Nobles (Expected 1024x1024)
# 3 Vertical portraits
nobles_items = {
    "noble_0": (5, 290, 335, 715),
    "noble_1": (336, 290, 665, 715),
    "noble_2": (666, 290, 995, 715)
}

# Image 3: Cards (Expected 1024x1024)
# 3 Cards
cards_items = {
    "mine": (30, 260, 330, 680),
    "ship": (340, 260, 640, 680),
    "shop": (650, 260, 980, 680)
}

# Image 4: Buttons (Expected 1024x1024)
# Stacked vertically
buttons_items = {
    "btn_purchase": (230, 330, 780, 430),
    "btn_reserve": (230, 440, 780, 540),
    "btn_end_turn": (230, 550, 780, 650)
}

base_path = "C:/Users/garyr/.gemini/antigravity/brain/8e00b6f7-4791-4242-8d64-e382aee6ea13"
client_path = "d:/python programs/GaryTTL/Splendor/splendor_client/assets/images"

crop_and_save(f"{base_path}/uploaded_image_0_1767798968604.png", f"{client_path}/gems", gems_items)
crop_and_save(f"{base_path}/uploaded_image_1_1767798968604.jpg", f"{client_path}/nobles", nobles_items)
crop_and_save(f"{base_path}/uploaded_image_3_1767798968604.jpg", f"{client_path}/cards", cards_items)
crop_and_save(f"{base_path}/uploaded_image_4_1767798968604.png", f"{client_path}/ui", buttons_items)
