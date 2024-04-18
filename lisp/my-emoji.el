;;; my-emoji.el --- stuffs that I use everywhere	 -*- lexical-binding: t -*-
;;; Commentary:
;;; Alternate name for emojis

;;; Code:

(require 'emoji)

(setq emoji-alternate-names '(
															("🤗" "hug happy")
															("🫂" "hug sad")
															("😆" "xD" "><" "lol")
															("👌" "ok")
															("🙂" "smile" ":)" "good")
															("😇" "innocent" "angel")
															("😶‍🌫️" "hide")
															("🫠" "melt")
															("😭" "crying")
															("🥺" "please" "cute")
															("😳" "big eyes" "omg")
															("😟" "sad")
															("😥" "concerned")
															("🙁" "unhappy")
															("😮" "surprised" "étonné")
															("😱" "fear")
															("😵‍💫" "confused")
															("🙏" "thanks")
															("🤝" "cooperation" "contract" "allied")
															("👋" "coucou" "hi")
															("💪" "muscles" "courage")
															("👴" "old")
															("👍" "up")
															("👎" "down")
															("😅" "relieved" "smile and sweat")
															("👮" "police man")
															("📝" "notes")
															("😎" "sunglasses" "cool")
															("🤬" "colère")
															("0️⃣" "0")
															("1️⃣" "1")
															("2️⃣" "2")
															("3️⃣" "3")
															("4️⃣" "4")
															("5️⃣" "5")
															("6️⃣" "6")
															("7️⃣" "7")
															("8️⃣" "8")
															("9️⃣" "9")
															("🔟" "10")
															("🛸" "ovni" "alien")
															("🍻" "tchin" "beer")
															("⚔️" "fight")
															("✅" "valid" "true")
															("❌" "invalid" "false")
															("♻️" "recycle" "recursive")
															("💤" "zzz" "sleepy")
															("👀" "looking" "eyes alone")
															("🤺" "fight2" "person fencing")
															("🎶" "music" "song")
															("🎮" "gamer")
															))


(setq emoji--derived (make-hash-table :test 'equal)) ;; Directly insert emotes like 👍

(provide 'my-emoji)
;;; my-emoji.el ends here
