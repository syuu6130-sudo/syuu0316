-- Rayfield UIライブラリの読み込み
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 多言語対応テキスト
local Languages = {
    ja = {
        windowName = "柊羽 UI",
        loadingTitle = "読み込み中...",
        loadingSubtitle = "by 柊羽",
        keyTitle = "キーシステム",
        keySubtitle = "キーを入力してください",
        keyNote = "キーはDiscordサーバーで取得できます: discord.gg/KUnQaDRN",
        
        tabMain = "メイン",
        tabPlayer = "プレイヤー",
        tabSettings = "設定",
        
        sectionMain = "主要機能",
        sectionPlayer = "プレイヤー設定",
        sectionLanguage = "言語設定",
        
        btnNotify = "通知を表示",
        notifyTitle = "通知",
        notifyContent = "ボタンがクリックされました!",
        notifyOK = "OK",
        
        toggleAutoFarm = "自動ファーム",
        toggleFly = "飛行モード",
        toggleNoclip = "壁抜け",
        
        sliderWalkSpeed = "移動速度",
        sliderJumpPower = "ジャンプ力",
        suffixSpeed = " 速度",
        suffixPower = " 力",
        
        dropdownWeapon = "武器を選択",
        weaponSword = "剣",
        weaponGun = "銃",
        weaponStaff = "魔法の杖",
        weaponBow = "弓",
        
        inputPlayerName = "プレイヤー名",
        inputPlaceholder = "名前を入力...",
        
        colorUI = "UIカラー",
        keybindToggle = "UIを開閉",
        
        labelVersion = "バージョン 1.0.0",
        paraTitle = "使い方",
        paraContent = "各タブから必要な機能を選択してください。設定は自動的に保存されます。PC・スマホ両対応です。",
        
        labelLanguage = "言語 / Language",
        dropdownLanguage = "言語を選択"
    },
    en = {
        windowName = "Shuuha UI",
        loadingTitle = "Loading...",
        loadingSubtitle = "by Shuuha",
        keyTitle = "Key System",
        keySubtitle = "Please enter the key",
        keyNote = "Get the key from Discord server: discord.gg/KUnQaDRN",
        
        tabMain = "Main",
        tabPlayer = "Player",
        tabSettings = "Settings",
        
        sectionMain = "Main Features",
        sectionPlayer = "Player Settings",
        sectionLanguage = "Language Settings",
        
        btnNotify = "Show Notification",
        notifyTitle = "Notification",
        notifyContent = "Button clicked!",
        notifyOK = "OK",
        
        toggleAutoFarm = "Auto Farm",
        toggleFly = "Fly Mode",
        toggleNoclip = "Noclip",
        
        sliderWalkSpeed = "Walk Speed",
        sliderJumpPower = "Jump Power",
        suffixSpeed = " Speed",
        suffixPower = " Power",
        
        dropdownWeapon = "Select Weapon",
        weaponSword = "Sword",
        weaponGun = "Gun",
        weaponStaff = "Magic Staff",
        weaponBow = "Bow",
        
        inputPlayerName = "Player Name",
        inputPlaceholder = "Enter name...",
        
        colorUI = "UI Color",
        keybindToggle = "Toggle UI",
        
        labelVersion = "Version 1.0.0",
        paraTitle = "How to Use",
        paraContent = "Select the features you need from each tab. Settings are saved automatically. Compatible with PC and Mobile.",
        
        labelLanguage = "Language / 言語",
        dropdownLanguage = "Select Language"
    },
    zh = {
        windowName = "柊羽 UI",
        loadingTitle = "加载中...",
        loadingSubtitle = "by 柊羽",
        keyTitle = "密钥系统",
        keySubtitle = "请输入密钥",
        keyNote = "从Discord服务器获取密钥: discord.gg/KUnQaDRN",
        
        tabMain = "主要",
        tabPlayer = "玩家",
        tabSettings = "设置",
        
        sectionMain = "主要功能",
        sectionPlayer = "玩家设置",
        sectionLanguage = "语言设置",
        
        btnNotify = "显示通知",
        notifyTitle = "通知",
        notifyContent = "按钮已点击！",
        notifyOK = "确定",
        
        toggleAutoFarm = "自动农场",
        toggleFly = "飞行模式",
        toggleNoclip = "穿墙",
        
        sliderWalkSpeed = "移动速度",
        sliderJumpPower = "跳跃力量",
        suffixSpeed = " 速度",
        suffixPower = " 力量",
        
        dropdownWeapon = "选择武器",
        weaponSword = "剑",
        weaponGun = "枪",
        weaponStaff = "魔杖",
        weaponBow = "弓",
        
        inputPlayerName = "玩家名称",
        inputPlaceholder = "输入名称...",
        
        colorUI = "UI颜色",
        keybindToggle = "切换UI",
        
        labelVersion = "版本 1.0.0",
        paraTitle = "使用方法",
        paraContent = "从每个选项卡中选择所需功能。设置会自动保存。支持PC和移动设备。",
        
        labelLanguage = "语言 / Language",
        dropdownLanguage = "选择语言"
    },
    ko = {
        windowName = "슈우하 UI",
        loadingTitle = "로딩 중...",
        loadingSubtitle = "by 슈우하",
        keyTitle = "키 시스템",
        keySubtitle = "키를 입력하세요",
        keyNote = "Discord 서버에서 키를 받으세요: discord.gg/KUnQaDRN",
        
        tabMain = "메인",
        tabPlayer = "플레이어",
        tabSettings = "설정",
        
        sectionMain = "주요 기능",
        sectionPlayer = "플레이어 설정",
        sectionLanguage = "언어 설정",
        
        btnNotify = "알림 표시",
        notifyTitle = "알림",
        notifyContent = "버튼이 클릭되었습니다!",
        notifyOK = "확인",
        
        toggleAutoFarm = "자동 파밍",
        toggleFly = "비행 모드",
        toggleNoclip = "벽 통과",
        
        sliderWalkSpeed = "이동 속도",
        sliderJumpPower = "점프 파워",
        suffixSpeed = " 속도",
        suffixPower = " 파워",
        
        dropdownWeapon = "무기 선택",
        weaponSword = "검",
        weaponGun = "총",
        weaponStaff = "마법 지팡이",
        weaponBow = "활",
        
        inputPlayerName = "플레이어 이름",
        inputPlaceholder = "이름 입력...",
        
        colorUI = "UI 색상",
        keybindToggle = "UI 토글",
        
        labelVersion = "버전 1.0.0",
        paraTitle = "사용 방법",
        paraContent = "각 탭에서 필요한 기능을 선택하세요. 설정은 자동으로 저장됩니다. PC 및 모바일 호환.",
        
        labelLanguage = "언어 / Language",
        dropdownLanguage = "언어 선택"
    }
}

-- 現在の言語設定（デフォルトは日本語）
local currentLang = "ja"
local Lang = Languages[currentLang]

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = Lang.windowName,
   LoadingTitle = Lang.loadingTitle,
   LoadingSubtitle = Lang.loadingSubtitle,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ShuuhaUI",
      FileName = "ShuuhaConfig"
   },
   Discord = {
      Enabled = true,
      Invite = "KUnQaDRN",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = Lang.keyTitle,
      Subtitle = Lang.keySubtitle,
      Note = Lang.keyNote,
      FileName = "ShuuhaKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"シュークリーム"}
   }
})

-- タブの作成
local MainTab = Window:CreateTab(Lang.tabMain, 4483362458)
local PlayerTab = Window:CreateTab(Lang.tabPlayer, 4483362458)
local BuilderTab = Window:CreateTab("🚀 Builder", 4483362458)
local SettingsTab = Window:CreateTab(Lang.tabSettings, 4483362458)

-- メインタブのセクション
local MainSection = MainTab:CreateSection(Lang.sectionMain)

-- 通知ボタン
MainTab:CreateButton({
   Name = Lang.btnNotify,
   Callback = function()
      Rayfield:Notify({
         Title = Lang.notifyTitle,
         Content = Lang.notifyContent,
         Duration = 3,
         Image = 4483362458,
         Actions = {
            Ignore = {
               Name = Lang.notifyOK,
               Callback = function()
                  print("通知が閉じられました")
               end
            },
         },
      })
   end,
})

-- 自動ファームトグル
local AutoFarmToggle = MainTab:CreateToggle({
   Name = Lang.toggleAutoFarm,
   CurrentValue = false,
   Flag = "AutoFarm",
   Callback = function(Value)
      print("自動ファーム:", Value)
      -- ここに自動ファーム機能を追加
   end,
})

-- 飛行モードトグル
local FlyToggle = MainTab:CreateToggle({
   Name = Lang.toggleFly,
   CurrentValue = false,
   Flag = "FlyMode",
   Callback = function(Value)
      print("飛行モード:", Value)
      -- 飛行機能をここに追加
   end,
})

-- Noclipトグル
local NoclipToggle = MainTab:CreateToggle({
   Name = Lang.toggleNoclip,
   CurrentValue = false,
   Flag = "Noclip",
   Callback = function(Value)
      print("Noclip:", Value)
      -- Noclip機能をここに追加
   end,
})

-- プレイヤータブのセクション
local PlayerSection = PlayerTab:CreateSection(Lang.sectionPlayer)

-- 移動速度スライダー
local WalkSpeedSlider = PlayerTab:CreateSlider({
   Name = Lang.sliderWalkSpeed,
   Range = {16, 200},
   Increment = 1,
   Suffix = Lang.suffixSpeed,
   CurrentValue = 16,
   Flag = "WalkSpeed",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

-- ジャンプパワースライダー
local JumpPowerSlider = PlayerTab:CreateSlider({
   Name = Lang.sliderJumpPower,
   Range = {50, 300},
   Increment = 5,
   Suffix = Lang.suffixPower,
   CurrentValue = 50,
   Flag = "JumpPower",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

-- 武器選択ドロップダウン
local Dropdown = MainTab:CreateDropdown({
   Name = Lang.dropdownWeapon,
   Options = {Lang.weaponSword, Lang.weaponGun, Lang.weaponStaff, Lang.weaponBow},
   CurrentOption = {Lang.weaponSword},
   MultipleOptions = false,
   Flag = "WeaponDropdown",
   Callback = function(Option)
      print("選択された武器:", Option)
   end,
})

-- 設定タブ - 言語セクション
local LanguageSection = SettingsTab:CreateSection(Lang.sectionLanguage)

SettingsTab:CreateLabel(Lang.labelLanguage)

-- 言語選択ドロップダウン
local LanguageDropdown = SettingsTab:CreateDropdown({
   Name = Lang.dropdownLanguage,
   Options = {"日本語 (Japanese)", "English", "中文 (Chinese)", "한국어 (Korean)"},
   CurrentOption = {"日本語 (Japanese)"},
   MultipleOptions = false,
   Flag = "LanguageDropdown",
   Callback = function(Option)
      local langMap = {
         ["日本語 (Japanese)"] = "ja",
         ["English"] = "en",
         ["中文 (Chinese)"] = "zh",
         ["한국어 (Korean)"] = "ko"
      }
      
      currentLang = langMap[Option]
      Lang = Languages[currentLang]
      
      Rayfield:Notify({
         Title = "Language Changed",
         Content = "Please restart the script to apply language changes.",
         Duration = 5,
         Image = 4483362458,
      })
      
      print("言語が変更されました:", currentLang)
   end,
})

-- プレイヤー名入力
local Input = SettingsTab:CreateInput({
   Name = Lang.inputPlayerName,
   PlaceholderText = Lang.inputPlaceholder,
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      print("入力されたテキスト:", Text)
   end,
})

-- UIカラーピッカー
local ColorPicker = SettingsTab:CreateColorPicker({
   Name = Lang.colorUI,
   Color = Color3.fromRGB(255, 255, 255),
   Flag = "ColorPicker",
   Callback = function(Value)
      print("選択された色:", Value)
   end
})

-- キーバインド
local Keybind = SettingsTab:CreateKeybind({
   Name = Lang.keybindToggle,
   CurrentKeybind = "Q",
   HoldToInteract = false,
   Flag = "UIKeybind",
   Callback = function(Keybind)
      print("キーバインドが変更されました:", Keybind)
   end,
})

-- バージョン表示
SettingsTab:CreateLabel(Lang.labelVersion)

-- 使い方パラグラフ
SettingsTab:CreateParagraph({
   Title = Lang.paraTitle,
   Content = Lang.paraContent
})

-- Discord招待リンク表示
SettingsTab:CreateParagraph({
   Title = "Discord",
   Content = "Join our Discord: discord.gg/KUnQaDRN"
})

-- 起動時の通知
Rayfield:Notify({
   Title = "柊羽 UI",
   Content = "スクリプトが正常に読み込まれました！ PC・スマホ両対応です。",
   Duration = 5,
   Image = 4483362458,
})

print("柊羽 UI が正常に読み込まれました!")
-- Rayfield UIライブラリの読み込み
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 多言語対応テキスト
local Languages = {
    ja = {
        windowName = "柊羽 UI",
        loadingTitle = "読み込み中...",
        loadingSubtitle = "by 柊羽",
        keyTitle = "キーシステム",
        keySubtitle = "キーを入力してください",
        keyNote = "キーはDiscordサーバーで取得できます: discord.gg/KUnQaDRN",
        
        tabMain = "メイン",
        tabPlayer = "プレイヤー",
        tabSettings = "設定",
        
        sectionMain = "主要機能",
        sectionPlayer = "プレイヤー設定",
        sectionLanguage = "言語設定",
        
        btnNotify = "通知を表示",
        notifyTitle = "通知",
        notifyContent = "ボタンがクリックされました!",
        notifyOK = "OK",
        
        toggleAutoFarm = "自動ファーム",
        toggleFly = "飛行モード",
        toggleNoclip = "壁抜け",
        
        sliderWalkSpeed = "移動速度",
        sliderJumpPower = "ジャンプ力",
        suffixSpeed = " 速度",
        suffixPower = " 力",
        
        dropdownWeapon = "武器を選択",
        weaponSword = "剣",
        weaponGun = "銃",
        weaponStaff = "魔法の杖",
        weaponBow = "弓",
        
        inputPlayerName = "プレイヤー名",
        inputPlaceholder = "名前を入力...",
        
        colorUI = "UIカラー",
        keybindToggle = "UIを開閉",
        
        labelVersion = "バージョン 1.0.0",
        paraTitle = "使い方",
        paraContent = "各タブから必要な機能を選択してください。設定は自動的に保存されます。PC・スマホ両対応です。",
        
        labelLanguage = "言語 / Language",
        dropdownLanguage = "言語を選択"
    },
    en = {
        windowName = "Shuuha UI",
        loadingTitle = "Loading...",
        loadingSubtitle = "by Shuuha",
        keyTitle = "Key System",
        keySubtitle = "Please enter the key",
        keyNote = "Get the key from Discord server: discord.gg/KUnQaDRN",
        
        tabMain = "Main",
        tabPlayer = "Player",
        tabSettings = "Settings",
        
        sectionMain = "Main Features",
        sectionPlayer = "Player Settings",
        sectionLanguage = "Language Settings",
        
        btnNotify = "Show Notification",
        notifyTitle = "Notification",
        notifyContent = "Button clicked!",
        notifyOK = "OK",
        
        toggleAutoFarm = "Auto Farm",
        toggleFly = "Fly Mode",
        toggleNoclip = "Noclip",
        
        sliderWalkSpeed = "Walk Speed",
        sliderJumpPower = "Jump Power",
        suffixSpeed = " Speed",
        suffixPower = " Power",
        
        dropdownWeapon = "Select Weapon",
        weaponSword = "Sword",
        weaponGun = "Gun",
        weaponStaff = "Magic Staff",
        weaponBow = "Bow",
        
        inputPlayerName = "Player Name",
        inputPlaceholder = "Enter name...",
        
        colorUI = "UI Color",
        keybindToggle = "Toggle UI",
        
        labelVersion = "Version 1.0.0",
        paraTitle = "How to Use",
        paraContent = "Select the features you need from each tab. Settings are saved automatically. Compatible with PC and Mobile.",
        
        labelLanguage = "Language / 言語",
        dropdownLanguage = "Select Language"
    },
    zh = {
        windowName = "柊羽 UI",
        loadingTitle = "加载中...",
        loadingSubtitle = "by 柊羽",
        keyTitle = "密钥系统",
        keySubtitle = "请输入密钥",
        keyNote = "从Discord服务器获取密钥: discord.gg/KUnQaDRN",
        
        tabMain = "主要",
        tabPlayer = "玩家",
        tabSettings = "设置",
        
        sectionMain = "主要功能",
        sectionPlayer = "玩家设置",
        sectionLanguage = "语言设置",
        
        btnNotify = "显示通知",
        notifyTitle = "通知",
        notifyContent = "按钮已点击！",
        notifyOK = "确定",
        
        toggleAutoFarm = "自动农场",
        toggleFly = "飞行模式",
        toggleNoclip = "穿墙",
        
        sliderWalkSpeed = "移动速度",
        sliderJumpPower = "跳跃力量",
        suffixSpeed = " 速度",
        suffixPower = " 力量",
        
        dropdownWeapon = "选择武器",
        weaponSword = "剑",
        weaponGun = "枪",
        weaponStaff = "魔杖",
        weaponBow = "弓",
        
        inputPlayerName = "玩家名称",
        inputPlaceholder = "输入名称...",
        
        colorUI = "UI颜色",
        keybindToggle = "切换UI",
        
        labelVersion = "版本 1.0.0",
        paraTitle = "使用方法",
        paraContent = "从每个选项卡中选择所需功能。设置会自动保存。支持PC和移动设备。",
        
        labelLanguage = "语言 / Language",
        dropdownLanguage = "选择语言"
    },
    ko = {
        windowName = "슈우하 UI",
        loadingTitle = "로딩 중...",
        loadingSubtitle = "by 슈우하",
        keyTitle = "키 시스템",
        keySubtitle = "키를 입력하세요",
        keyNote = "Discord 서버에서 키를 받으세요: discord.gg/KUnQaDRN",
        
        tabMain = "메인",
        tabPlayer = "플레이어",
        tabSettings = "설정",
        
        sectionMain = "주요 기능",
        sectionPlayer = "플레이어 설정",
        sectionLanguage = "언어 설정",
        
        btnNotify = "알림 표시",
        notifyTitle = "알림",
        notifyContent = "버튼이 클릭되었습니다!",
        notifyOK = "확인",
        
        toggleAutoFarm = "자동 파밍",
        toggleFly = "비행 모드",
        toggleNoclip = "벽 통과",
        
        sliderWalkSpeed = "이동 속도",
        sliderJumpPower = "점프 파워",
        suffixSpeed = " 속도",
        suffixPower = " 파워",
        
        dropdownWeapon = "무기 선택",
        weaponSword = "검",
        weaponGun = "총",
        weaponStaff = "마법 지팡이",
        weaponBow = "활",
        
        inputPlayerName = "플레이어 이름",
        inputPlaceholder = "이름 입력...",
        
        colorUI = "UI 색상",
        keybindToggle = "UI 토글",
        
        labelVersion = "버전 1.0.0",
        paraTitle = "사용 방법",
        paraContent = "각 탭에서 필요한 기능을 선택하세요. 설정은 자동으로 저장됩니다. PC 및 모바일 호환.",
        
        labelLanguage = "언어 / Language",
        dropdownLanguage = "언어 선택"
    }
}

-- 現在の言語設定（デフォルトは日本語）
local currentLang = "ja"
local Lang = Languages[currentLang]

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = Lang.windowName,
   LoadingTitle = Lang.loadingTitle,
   LoadingSubtitle = Lang.loadingSubtitle,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ShuuhaUI",
      FileName = "ShuuhaConfig"
   },
   Discord = {
      Enabled = true,
      Invite = "KUnQaDRN",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = Lang.keyTitle,
      Subtitle = Lang.keySubtitle,
      Note = Lang.keyNote,
      FileName = "ShuuhaKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"シュークリーム"}
   }
})

-- タブの作成
local MainTab = Window:CreateTab(Lang.tabMain, 4483362458)
local PlayerTab = Window:CreateTab(Lang.tabPlayer, 4483362458)
local BuilderTab = Window:CreateTab("🚀 Builder", 4483362458)
local SettingsTab = Window:CreateTab(Lang.tabSettings, 4483362458)

-- メインタブのセクション
local MainSection = MainTab:CreateSection(Lang.sectionMain)

-- 通知ボタン
MainTab:CreateButton({
   Name = Lang.btnNotify,
   Callback = function()
      Rayfield:Notify({
         Title = Lang.notifyTitle,
         Content = Lang.notifyContent,
         Duration = 3,
         Image = 4483362458,
         Actions = {
            Ignore = {
               Name = Lang.notifyOK,
               Callback = function()
                  print("通知が閉じられました")
               end
            },
         },
      })
   end,
})

-- 自動ファームトグル
local AutoFarmToggle = MainTab:CreateToggle({
   Name = Lang.toggleAutoFarm,
   CurrentValue = false,
   Flag = "AutoFarm",
   Callback = function(Value)
      print("自動ファーム:", Value)
      -- ここに自動ファーム機能を追加
   end,
})

-- 飛行モードトグル
local FlyToggle = MainTab:CreateToggle({
   Name = Lang.toggleFly,
   CurrentValue = false,
   Flag = "FlyMode",
   Callback = function(Value)
      print("飛行モード:", Value)
      -- 飛行機能をここに追加
   end,
})

-- Noclipトグル
local NoclipToggle = MainTab:CreateToggle({
   Name = Lang.toggleNoclip,
   CurrentValue = false,
   Flag = "Noclip",
   Callback = function(Value)
      print("Noclip:", Value)
      -- Noclip機能をここに追加
   end,
})

-- プレイヤータブのセクション
local PlayerSection = PlayerTab:CreateSection(Lang.sectionPlayer)

-- 移動速度スライダー
local WalkSpeedSlider = PlayerTab:CreateSlider({
   Name = Lang.sliderWalkSpeed,
   Range = {16, 200},
   Increment = 1,
   Suffix = Lang.suffixSpeed,
   CurrentValue = 16,
   Flag = "WalkSpeed",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

-- ジャンプパワースライダー
local JumpPowerSlider = PlayerTab:CreateSlider({
   Name = Lang.sliderJumpPower,
   Range = {50, 300},
   Increment = 5,
   Suffix = Lang.suffixPower,
   CurrentValue = 50,
   Flag = "JumpPower",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

-- 武器選択ドロップダウン
local Dropdown = MainTab:CreateDropdown({
   Name = Lang.dropdownWeapon,
   Options = {Lang.weaponSword, Lang.weaponGun, Lang.weaponStaff, Lang.weaponBow},
   CurrentOption = {Lang.weaponSword},
   MultipleOptions = false,
   Flag = "WeaponDropdown",
   Callback = function(Option)
      print("選択された武器:", Option)
   end,
})

-- ===== Builder タブ - おもちゃ建築機能 =====
local BuilderSection = BuilderTab:CreateSection("🎨 創造的建築")

-- ロケット作成機能
BuilderTab:CreateButton({
   Name = "🚀 ロケット作成",
   Callback = function()
      local function spawnToy(name, pos)
         local args = {[1] = name, [2] = pos}
         game:GetService("ReplicatedStorage").SpawnToy:FireServer(unpack(args))
         wait(0.1)
      end
      
      local plr = game.Players.LocalPlayer
      local char = plr.Character
      local pos = char.HumanoidRootPart.Position
      
      -- ロケット本体（円筒形に配置）
      for i = 1, 8 do
         local angle = (i / 8) * math.pi * 2
         local x = pos.X + math.cos(angle) * 3
         local z = pos.Z + math.sin(angle) * 3
         spawnToy("Barrel", Vector3.new(x, pos.Y, z))
      end
      
      -- ロケット先端
      for i = 1, 4 do
         spawnToy("Traffic Cone", Vector3.new(pos.X, pos.Y + i * 2, pos.Z))
      end
      
      -- 推進器
      for i = 1, 3 do
         spawnToy("Fan", Vector3.new(pos.X, pos.Y - i * 2, pos.Z))
      end
      
      Rayfield:Notify({Title = "🚀 完成!", Content = "ロケットが作成されました!", Duration = 3})
   end,
})

-- ジェットコースター作成
BuilderTab:CreateButton({
   Name = "🎢 ジェットコースター作成",
   Callback = function()
      local function spawnToy(name, pos)
         local args = {[1] = name, [2] = pos}
         game:GetService("ReplicatedStorage").SpawnToy:FireServer(unpack(args))
         wait(0.05)
      end
      
      local plr = game.Players.LocalPlayer
      local pos = plr.Character.HumanoidRootPart.Position
      
      -- レール（波型）
      for i = 0, 50 do
         local x = pos.X + i * 2
         local y = pos.Y + math.sin(i * 0.3) * 5 + 10
         local z = pos.Z + math.cos(i * 0.2) * 3
         spawnToy("Plank", Vector3.new(x, y, z))
      end
      
      -- サポート柱
      for i = 0, 50, 5 do
         local x = pos.X + i * 2
         local z = pos.Z + math.cos(i * 0.2) * 3
         for j = 0, 3 do
            spawnToy("Barrel", Vector3.new(x, pos.Y + j * 3, z))
         end
      end
      
      Rayfield:Notify({Title = "🎢 完成!", Content = "ジェットコースターが作成されました!", Duration = 3})
   end,
})

-- 巨大タワー作成
BuilderTab:CreateButton({
   Name = "🗼 巨大タワー",
   Callback = function()
      local function spawnToy(name, pos)
         local args = {[1] = name, [2] = pos}
         game:GetService("ReplicatedStorage").SpawnToy:FireServer(unpack(args))
         wait(0.08)
      end
      
      local plr = game.Players.LocalPlayer
      local pos = plr.Character.HumanoidRootPart.Position
      
      -- タワーの各層
      for level = 0, 20 do
         local y = pos.Y + level * 4
         for i = 1, 6 do
            local angle = (i / 6) * math.pi * 2
            local radius = 5 - (level * 0.1)
            local x = pos.X + math.cos(angle) * radius
            local z = pos.Z + math.sin(angle) * radius
            spawnToy("Crate", Vector3.new(x, y, z))
         end
      end
      
      -- 頂上の旗
      spawnToy("Flag", Vector3.new(pos.X, pos.Y + 85, pos.Z))
      
      Rayfield:Notify({Title = "🗼 完成!", Content = "巨大タワーが建設されました!", Duration = 3})
   end,
})

-- 橋建設
BuilderTab:CreateButton({
   Name = "🌉 吊り橋建設",
   Callback = function()
      local function spawnToy(name, pos)
         local args = {[1] = name, [2] = pos}
         game:GetService("ReplicatedStorage").SpawnToy:FireServer(unpack(args))
         wait(0.06)
      end
      
      local plr = game.Players.LocalPlayer
      local pos = plr.Character.HumanoidRootPart.Position
      
      -- 橋の床
      for i = 0, 30 do
         spawnToy("Plank", Vector3.new(pos.X + i * 2, pos.Y + 10, pos.Z))
      end
      
      -- 吊りケーブル（両サイド）
      for side = -1, 1, 2 do
         for i = 0, 30, 3 do
            local height = 15 + math.abs(15 - i) * 0.3
            spawnToy("Rope", Vector3.new(pos.X + i * 2, pos.Y + height, pos.Z + side * 3))
         end
      end
      
      -- タワー支柱
      for side = -1, 1, 2 do
         for h = 0, 5 do
            spawnToy("Barrel", Vector3.new(pos.X, pos.Y + h * 4, pos.Z + side * 3))
            spawnToy("Barrel", Vector3.new(pos.X + 60, pos.Y + h * 4, pos.Z + side * 3))
         end
      end
      
      Rayfield:Notify({Title = "🌉 完成!", Content = "吊り橋が完成しました!", Duration = 3})
   end,
})

-- 迷路作成
BuilderTab:CreateButton({
   Name = "🌀 3D迷路",
   Callback = function()
      local function spawnToy(name, pos)
         local args = {[1] = name, [2] = pos}
         game:GetService("ReplicatedStorage").SpawnToy:FireServer(unpack(args))
         wait(0.07)
      end
      
      local plr = game.Players.LocalPlayer
      local pos = plr.Character.HumanoidRootPart.Position
      
      -- 迷路の壁
      local maze = {
         {1,1,1,1,1,1,1,1,1,1},
         {1,0,0,0,1,0,0,0,0,1},
         {1,0,1,0,1,0,1,1,0,1},
         {1,0,1,0,0,0,0,1,0,1},
         {1,0,1,1,1,1,0,1,0,1},
         {1,0,0,0,0,0,0,0,0,1},
         {1,1,1,1,1,1,1,1,1,1}
      }
      
      for row = 1, #maze do
         for col = 1, #maze[row] do
            if maze[row][col] == 1 then
               for h = 0, 2 do
                  spawnToy("Crate", Vector3.new(pos.X + col * 3, pos.Y + h * 3, pos.Z + row * 3))
               end
            end
         end
      end
      
      Rayfield:Notify({Title = "🌀 完成!", Content = "3D迷路が作成されました!", Duration = 3})
   end,
})

-- カスタムビルダー
local BuilderSection2 = BuilderTab:CreateSection("⚙️ カスタム設定")

local customToy = "Barrel"
BuilderTab:CreateDropdown({
   Name = "おもちゃ選択",
   Options = {"Barrel", "Crate", "Plank", "Traffic Cone", "Fan", "Flag", "Rope"},
   CurrentOption = {"Barrel"},
   Flag = "CustomToy",
   Callback = function(Option)
      customToy = Option
   end,
})

local spawnCount = 10
BuilderTab:CreateSlider({
   Name = "生成数",
   Range = {5, 100},
   Increment = 5,
   CurrentValue = 10,
   Flag = "SpawnCount",
   Callback = function(Value)
      spawnCount = Value
   end,
})

BuilderTab:CreateButton({
   Name = "🎯 円形配置",
   Callback = function()
      local function spawnToy(name, pos)
         local args = {[1] = name, [2] = pos}
         game:GetService("ReplicatedStorage").SpawnToy:FireServer(unpack(args))
         wait(0.05)
      end
      
      local plr = game.Players.LocalPlayer
      local pos = plr.Character.HumanoidRootPart.Position
      
      for i = 1, spawnCount do
         local angle = (i / spawnCount) * math.pi * 2
         local x = pos.X + math.cos(angle) * 10
         local z = pos.Z + math.sin(angle) * 10
         spawnToy(customToy, Vector3.new(x, pos.Y, z))
      end
      
      Rayfield:Notify({Title = "✅ 完了", Content = spawnCount .. "個のおもちゃを配置しました!", Duration = 2})
   end,
})

-- 設定タブ - 言語セクション
local LanguageSection = SettingsTab:CreateSection(Lang.sectionLanguage)

SettingsTab:CreateLabel(Lang.labelLanguage)

-- 言語選択ドロップダウン
local LanguageDropdown = SettingsTab:CreateDropdown({
   Name = Lang.dropdownLanguage,
   Options = {"日本語 (Japanese)", "English", "中文 (Chinese)", "한국어 (Korean)"},
   CurrentOption = {"日本語 (Japanese)"},
   MultipleOptions = false,
   Flag = "LanguageDropdown",
   Callback = function(Option)
      local langMap = {
         ["日本語 (Japanese)"] = "ja",
         ["English"] = "en",
         ["中文 (Chinese)"] = "zh",
         ["한국어 (Korean)"] = "ko"
      }
      
      currentLang = langMap[Option]
      Lang = Languages[currentLang]
      
      Rayfield:Notify({
         Title = "Language Changed",
         Content = "Please restart the script to apply language changes.",
         Duration = 5,
         Image = 4483362458,
      })
      
      print("言語が変更されました:", currentLang)
   end,
})

-- プレイヤー名入力
local Input = SettingsTab:CreateInput({
   Name = Lang.inputPlayerName,
   PlaceholderText = Lang.inputPlaceholder,
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      print("入力されたテキスト:", Text)
   end,
})

-- UIカラーピッカー
local ColorPicker = SettingsTab:CreateColorPicker({
   Name = Lang.colorUI,
   Color = Color3.fromRGB(255, 255, 255),
   Flag = "ColorPicker",
   Callback = function(Value)
      print("選択された色:", Value)
   end
})

-- キーバインド
local Keybind = SettingsTab:CreateKeybind({
   Name = Lang.keybindToggle,
   CurrentKeybind = "Q",
   HoldToInteract = false,
   Flag = "UIKeybind",
   Callback = function(Keybind)
      print("キーバインドが変更されました:", Keybind)
   end,
})

-- バージョン表示
SettingsTab:CreateLabel(Lang.labelVersion)

-- 使い方パラグラフ
SettingsTab:CreateParagraph({
   Title = Lang.paraTitle,
   Content = Lang.paraContent
})

-- Discord招待リンク表示
SettingsTab:CreateParagraph({
   Title = "Discord",
   Content = "Join our Discord: discord.gg/KUnQaDRN"
})

-- 起動時の通知
Rayfield:Notify({
   Title = "柊羽 UI",
   Content = "スクリプトが正常に読み込まれました！ PC・スマホ両対応です。",
   Duration = 5,
   Image = 4483362458,
})

print("柊羽 UI が正常に読み込まれました!")
