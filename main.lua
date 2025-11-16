-- Rayfield UIライブラリの読み込み
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = "柊羽 UI - 板スポーン改",
   LoadingTitle = "読み込み中...",
   LoadingSubtitle = "大改善 by Gemini",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ShuuhaUI",
      FileName = "ShuuhaConfig_V2" -- 設定ファイルを別名に変更
   },
   Discord = {
      Enabled = true,
      Invite = "KUnQaDRN",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "キーシステム",
      Subtitle = "キーを入力してください",
      Note = "キー: シュークリーム | Discord: discord.gg/KUnQaDRN",
      FileName = "ShuuhaKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"シュークリーム"}
   }
})

-- サービスの取得
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- 変数の初期設定
local selectedToy = "Pallet"
local plankDistance = 5
local heightOffset = 0
local bridgeDelay = 0.05 -- 連続スポーン時の間隔を短縮 (0.15 -> 0.05)

-- タブの作成
local PlankTab = Window:CreateTab("📦 板スポーン", 4483362458)
local PlankSection = PlankTab:CreateSection("板の設定")

--- おもちゃのリスト（Roblox Studioで確認される正確な名前）
local toyOptions = {
   "Pallet", "Basic Bench", "Bench", "Basic Desk", "Table (Metal)", 
   "Cracked Stool", "Chair (Metal)", "Basic Shelf", "Couch",
   "Daycare Table", "Lab Table", "School Lunch Table", "Crate",
   "Orange Bed", "Blue Bed", "Spooky Chair", "Spooky Bench"
}

--- UI要素の定義 --------------------------------------------------------------------------------

PlankTab:CreateDropdown({
   Name = "おもちゃを選択",
   Options = toyOptions,
   CurrentOption = {"Pallet"},
   Flag = "PlankToyDropdown",
   Callback = function(Option)
      selectedToy = Option
      Rayfield:Notify({
         Title = "✅ 選択完了",
         Content = selectedToy .. " を選択しました",
         Duration = 2
      })
   end,
})

PlankTab:CreateSlider({
   Name = "プレイヤーからの距離 (X軸)",
   Range = {1, 20}, -- 距離の範囲を広げた
   Increment = 0.5, -- 細かい調整を可能にした
   Suffix = " スタッド",
   CurrentValue = 5,
   Flag = "PlankDistance",
   Callback = function(Value)
      plankDistance = Value
   end,
})

PlankTab:CreateSlider({
   Name = "高さオフセット (Y軸)",
   Range = {-10, 10}, -- 高さの範囲を広げた
   Increment = 0.1, -- 極めて細かい調整を可能にした
   Suffix = " スタッド",
   CurrentValue = 0,
   Flag = "PlankHeightOffset",
   Callback = function(Value)
      heightOffset = Value
   end,
})

--- スポーン処理関数 ----------------------------------------------------------------------------

-- スポーン処理を外部テーブルにキャッシュ
local spawnRemotes = {}

local function findSpawnRemote()
   -- 既にキャッシュされていればそれを返す
   if spawnRemotes.main then return spawnRemotes.main end
   
   -- 最も一般的な名前から探す
   local remote = ReplicatedStorage:FindFirstChild("SpawnToy")
   if remote and remote:IsA("RemoteEvent") then
      spawnRemotes.main = remote
      print("デバッグ: RemoteEvent 'SpawnToy' を発見し、キャッシュしました。")
      return remote
   end
   
   -- 見つからない場合、ReplicatedStorage内を広く検索 (遅いので、見つかるまでのみ実行)
   for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
      if obj:IsA("RemoteEvent") and (obj.Name:lower():find("spawn") or obj.Name:lower():find("place") or obj.Name:lower():find("toy")) then
         spawnRemotes.main = obj
         print("デバッグ: 代替RemoteEvent '" .. obj.Name .. "' を発見し、キャッシュしました。")
         return obj
      end
   end
   
   return nil
end


local function spawnToyReliable(toyName, position)
   local remote = findSpawnRemote()
   
   if remote then
      local success, err = pcall(function()
         remote:FireServer(toyName, position)
      end)
       
      if success then
         task.wait(0.01) -- サーバー側に処理時間を与える
         return true
      else
         print("デバッグ: RemoteEventの呼び出しでエラー:", err)
         return false
      end
   else
      print("デバッグ: 有効な RemoteEvent が見つかりませんでした。")
      return false
   end
end

--- 画面ボタンの作成/削除 ------------------------------------------------------------------------

local function createScreenButton()
   -- (画面ボタンの作成ロジックは元のスクリプトのまま、信頼性が高いので変更なし)
   local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
   if PlayerGui:FindFirstChild("PlankSpawnButton") then
      PlayerGui:FindFirstChild("PlankSpawnButton"):Destroy()
   end
   
   local screenGui = Instance.new("ScreenGui")
   screenGui.Name = "PlankSpawnButton"
   screenGui.ResetOnSpawn = false
   screenGui.Parent = PlayerGui
   
   local button = Instance.new("TextButton")
   button.Name = "SpawnButton"
   button.Size = UDim2.new(0, 80, 0, 80)
   button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
   button.BackgroundTransparency = 0.2
   button.BorderSizePixel = 0
   button.Text = "📦"
   button.TextColor3 = Color3.fromRGB(255, 255, 255)
   button.TextSize = 40
   button.Font = Enum.Font.SourceSansBold
   button.Parent = screenGui
   
   local corner = Instance.new("UICorner")
   corner.CornerRadius = UDim.new(0, 15)
   corner.Parent = button
   
   local stroke = Instance.new("UIStroke")
   stroke.Color = Color3.fromRGB(255, 255, 255)
   stroke.Thickness = 3
   stroke.Parent = button
   
   if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
      button.Position = UDim2.new(1, -100, 1, -180)
      button.AnchorPoint = Vector2.new(1, 1)
   else
      button.Position = UDim2.new(1, -20, 1, -100)
      button.AnchorPoint = Vector2.new(1, 1)
   end
   
   button.MouseButton1Click:Connect(function()
      local character = LocalPlayer.Character
      local hrp = character and character:FindFirstChild("HumanoidRootPart")
      if not hrp then
         Rayfield:Notify({Title = "❌ エラー", Content = "キャラクターが見つかりません", Duration = 2})
         return
      end
      
      button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
      task.wait(0.1)
      button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
      
      local lookVector = hrp.CFrame.LookVector
      local spawnPos = hrp.Position + (lookVector * plankDistance) + Vector3.new(0, heightOffset, 0)
      
      if spawnToyReliable(selectedToy, spawnPos) then
         Rayfield:Notify({Title = "✅ スポーン成功", Content = selectedToy .. " をスポーンしました！", Duration = 1.5})
      else
         Rayfield:Notify({Title = "❌ スポーン失敗", Content = "RemoteEventが見つからないか、エラーが発生しました。F9コンソールで詳細を確認してください。", Duration = 4})
      end
   end)
end

PlankTab:CreateButton({
   Name = "📱 画面ボタンを作成",
   Callback = function()
      createScreenButton()
      Rayfield:Notify({Title = "✅ 完了", Content = "画面上の右下にボタンを作成しました！", Duration = 3})
   end,
})

PlankTab:CreateButton({
   Name = "🗑️ 画面ボタンを削除",
   Callback = function()
      local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
      if PlayerGui:FindFirstChild("PlankSpawnButton") then
         PlayerGui:FindFirstChild("PlankSpawnButton"):Destroy()
         Rayfield:Notify({Title = "🗑️ 削除完了", Content = "画面ボタンを削除しました！", Duration = 2})
      else
         Rayfield:Notify({Title = "ℹ️ 情報", Content = "削除するボタンがありません", Duration = 2})
      end
   end,
})

--- クイックスポーン ----------------------------------------------------------------------------

local PlankSection2 = PlankTab:CreateSection("クイックスポーン")

PlankTab:CreateButton({
   Name = "⚡ 前方に1個スポーン",
   Callback = function()
      local character = LocalPlayer.Character
      local hrp = character and character:FindFirstChild("HumanoidRootPart")
      if not hrp then return end
      
      local lookVector = hrp.CFrame.LookVector
      local spawnPos = hrp.Position + (lookVector * plankDistance) + Vector3.new(0, heightOffset, 0)
      
      if spawnToyReliable(selectedToy, spawnPos) then
         Rayfield:Notify({Title = "✅ スポーン完了", Content = selectedToy .. " をスポーンしました！", Duration = 1.5})
      else
         Rayfield:Notify({Title = "❌ スポーン失敗", Content = "RemoteEventが見つからないか、エラーが発生しました。F9コンソールで詳細を確認してください。", Duration = 4})
      end
   end,
})

PlankTab:CreateButton({
   Name = "📚 5個連続スポーン（橋）",
   Callback = function()
      local character = LocalPlayer.Character
      local hrp = character and character:FindFirstChild("HumanoidRootPart")
      if not hrp then return end
      
      task.spawn(function()
         local lookVector = hrp.CFrame.LookVector
         local totalSuccess = 0
         
         for i = 0, 4 do
            local spawnPos = hrp.Position + (lookVector * (plankDistance + i * 3)) + Vector3.new(0, heightOffset, 0)
            if spawnToyReliable(selectedToy, spawnPos) then totalSuccess = totalSuccess + 1 end
            task.wait(bridgeDelay) -- 遅延時間を短縮
         end
         
         Rayfield:Notify({Title = "✅ 完了", Content = totalSuccess .. "個スポーンしました！", Duration = 2})
      end)
   end,
})

PlankTab:CreateButton({
   Name = "🌉 長い橋を作成（20個）",
   Callback = function()
      local character = LocalPlayer.Character
      local hrp = character and character:FindFirstChild("HumanoidRootPart")
      if not hrp then return end
      
      task.spawn(function()
         local lookVector = hrp.CFrame.LookVector
         local totalSuccess = 0
         
         for i = 0, 19 do
            local spawnPos = hrp.Position + (lookVector * (plankDistance + i * 3)) + Vector3.new(0, heightOffset, 0)
            if spawnToyReliable(selectedToy, spawnPos) then totalSuccess = totalSuccess + 1 end
            task.wait(bridgeDelay) -- 遅延時間を短縮
         end
         
         Rayfield:Notify({Title = "🌉 完了", Content = totalSuccess .. "個の橋を作成しました！", Duration = 2})
      end)
   end,
})

--- デバッグ＆情報 ----------------------------------------------------------------------------

local DebugSection = PlankTab:CreateSection("🔧 デバッグと情報")

PlankTab:CreateButton({
   Name = "🔍 スポーンRemoteEventを再確認",
   Callback = function()
      local remote = findSpawnRemote()
      if remote then
         Rayfield:Notify({Title = "✅ RemoteEvent発見", Content = "リモート: " .. remote.Name .. " (ReplicatedStorage内)", Duration = 3})
         print("デバッグ: キャッシュされているリモート: ", remote.Name)
      else
         Rayfield:Notify({Title = "❌ RemoteEvent未発見", Content = "自動検出に失敗しました。ゲームの仕様が変わった可能性があります。", Duration = 4})
      end
   end,
})

PlankTab:CreateParagraph({
   Title = "⚠️ スポーンのヒント",
   Content = "もし板がスポーンされない場合は、まず**ゲーム内のショップで「Pallet」を一度手動で購入**または**装備**してください。\n\nこれにより、スポーンに必要なサーバー側の機能（RemoteEvent）がクライアント側で利用可能になることがあります。"
})

-- 起動時の通知
Rayfield:Notify({
   Title = "柊羽 UI - 板スポーン改",
   Content = "キー認証完了！機能が改善されました",
   Duration = 4,
   Image = 4483362458,
})

print("柊羽 UI - 板スポーン機能 改善版 読み込み完了")
print("選択中のおもちゃ: " .. selectedToy)
