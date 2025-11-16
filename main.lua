-- Rayfield UIライブラリの読み込み
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = "柊羽 UI",
   LoadingTitle = "読み込み中...",
   LoadingSubtitle = "by 柊羽",
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
      Title = "キーシステム",
      Subtitle = "キーを入力してください",
      Note = "キーはDiscordサーバーで取得できます: discord.gg/KUnQaDRN",
      FileName = "ShuuhaKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"シュークリーム"}
   }
})

-- タブの作成
local PlankTab = Window:CreateTab("📦 板スポーン", 4483362458)
local PlankSection = PlankTab:CreateSection("板の設定")

-- 板スポーンの状態
local plankSpawnEnabled = false
local plankSpawnConnection = nil

-- 使用するおもちゃの選択
local selectedToy = "Pallet"

PlankTab:CreateDropdown({
   Name = "おもちゃを選択",
   Options = {
      "Pallet", "Basic Bench", "Bench", "Basic Desk", "Table (Metal)", 
      "Cracked Stool", "Chair (Metal)", "Basic Shelf", "Couch",
      "Daycare Table", "Lab Table", "School Lunch Table", "Crate"
   },
   CurrentOption = {"Pallet"},
   Flag = "PlankToyDropdown",
   Callback = function(Option)
      selectedToy = Option
      print("選択されたおもちゃ:", selectedToy)
   end,
})

-- スポーン間隔設定
local spawnInterval = 0.5
PlankTab:CreateSlider({
   Name = "スポーン間隔（秒）",
   Range = {0.1, 2},
   Increment = 0.1,
   Suffix = " 秒",
   CurrentValue = 0.5,
   Flag = "PlankSpawnInterval",
   Callback = function(Value)
      spawnInterval = Value
   end,
})

-- 板の距離設定
local plankDistance = 5
PlankTab:CreateSlider({
   Name = "プレイヤーからの距離",
   Range = {3, 15},
   Increment = 1,
   Suffix = " スタッド",
   CurrentValue = 5,
   Flag = "PlankDistance",
   Callback = function(Value)
      plankDistance = Value
   end,
})

-- 高さオフセット設定
local heightOffset = 0
PlankTab:CreateSlider({
   Name = "高さオフセット",
   Range = {-5, 5},
   Increment = 0.5,
   Suffix = " スタッド",
   CurrentValue = 0,
   Flag = "PlankHeightOffset",
   Callback = function(Value)
      heightOffset = Value
   end,
})

-- 板スポーントグル（画面上のボタンを作成）
local function createScreenButton()
   local Players = game:GetService("Players")
   local LocalPlayer = Players.LocalPlayer
   local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
   
   -- 既存のボタンを削除
   if PlayerGui:FindFirstChild("PlankSpawnButton") then
      PlayerGui:FindFirstChild("PlankSpawnButton"):Destroy()
   end
   
   -- ScreenGui作成
   local screenGui = Instance.new("ScreenGui")
   screenGui.Name = "PlankSpawnButton"
   screenGui.ResetOnSpawn = false
   screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
   screenGui.Parent = PlayerGui
   
   -- ボタン作成
   local button = Instance.new("TextButton")
   button.Name = "SpawnButton"
   button.Size = UDim2.new(0, 80, 0, 80)
   button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
   button.BackgroundTransparency = 0.3
   button.BorderSizePixel = 0
   button.Text = "📦"
   button.TextColor3 = Color3.fromRGB(255, 255, 255)
   button.TextSize = 40
   button.Font = Enum.Font.SourceSansBold
   button.Parent = screenGui
   
   -- UICorner追加
   local corner = Instance.new("UICorner")
   corner.CornerRadius = UDim.new(0, 15)
   corner.Parent = button
   
   -- UIStroke追加
   local stroke = Instance.new("UIStroke")
   stroke.Color = Color3.fromRGB(100, 100, 100)
   stroke.Thickness = 2
   stroke.Parent = button
   
   -- デバイスに応じた位置設定
   local UserInputService = game:GetService("UserInputService")
   if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
      -- モバイル: ジャンプボタンの上
      button.Position = UDim2.new(1, -100, 1, -180)
      button.AnchorPoint = Vector2.new(1, 1)
   else
      -- PC: 右下
      button.Position = UDim2.new(1, -20, 1, -100)
      button.AnchorPoint = Vector2.new(1, 1)
   end
   
   -- ボタンのクリックイベント
   button.MouseButton1Click:Connect(function()
      plankSpawnEnabled = not plankSpawnEnabled
      
      if plankSpawnEnabled then
         button.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
         button.Text = "✅"
         
         -- 板のスポーン開始
         plankSpawnConnection = game:GetService("RunService").Heartbeat:Connect(function()
            local character = LocalPlayer.Character
            if not character then return end
            
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            
            -- プレイヤーの前方に板をスポーン
            local lookVector = hrp.CFrame.LookVector
            local spawnPos = hrp.Position + (lookVector * plankDistance) + Vector3.new(0, heightOffset, 0)
            
            pcall(function()
               local args = {[1] = selectedToy, [2] = spawnPos}
               game:GetService("ReplicatedStorage"):WaitForChild("SpawnToy"):FireServer(unpack(args))
            end)
            
            task.wait(spawnInterval)
         end)
         
         Rayfield:Notify({
            Title = "📦 板スポーン開始",
            Content = "板のスポーンを開始しました！",
            Duration = 2
         })
      else
         button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
         button.Text = "📦"
         
         -- 板のスポーン停止
         if plankSpawnConnection then
            plankSpawnConnection:Disconnect()
            plankSpawnConnection = nil
         end
         
         Rayfield:Notify({
            Title = "📦 板スポーン停止",
            Content = "板のスポーンを停止しました！",
            Duration = 2
         })
      end
   end)
   
   return button
end

-- 画面ボタン作成ボタン
PlankTab:CreateButton({
   Name = "📱 画面ボタンを作成",
   Callback = function()
      createScreenButton()
      Rayfield:Notify({
         Title = "✅ 完了",
         Content = "画面上にボタンを作成しました！",
         Duration = 3
      })
   end,
})

-- ボタン削除
PlankTab:CreateButton({
   Name = "🗑️ 画面ボタンを削除",
   Callback = function()
      local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
      if PlayerGui:FindFirstChild("PlankSpawnButton") then
         PlayerGui:FindFirstChild("PlankSpawnButton"):Destroy()
         
         -- スポーン停止
         if plankSpawnConnection then
            plankSpawnConnection:Disconnect()
            plankSpawnConnection = nil
         end
         plankSpawnEnabled = false
         
         Rayfield:Notify({
            Title = "🗑️ 削除完了",
            Content = "画面ボタンを削除しました！",
            Duration = 2
         })
      end
   end,
})

-- クイックスポーンボタン（タブ内）
local PlankSection2 = PlankTab:CreateSection("クイックスポーン")

PlankTab:CreateButton({
   Name = "⚡ 1個スポーン",
   Callback = function()
      local character = game.Players.LocalPlayer.Character
      if not character then return end
      
      local hrp = character:FindFirstChild("HumanoidRootPart")
      if not hrp then return end
      
      local lookVector = hrp.CFrame.LookVector
      local spawnPos = hrp.Position + (lookVector * plankDistance) + Vector3.new(0, heightOffset, 0)
      
      pcall(function()
         local args = {[1] = selectedToy, [2] = spawnPos}
         game:GetService("ReplicatedStorage"):WaitForChild("SpawnToy"):FireServer(unpack(args))
      end)
      
      Rayfield:Notify({
         Title = "✅ スポーン完了",
         Content = selectedToy .. " をスポーンしました！",
         Duration = 1
      })
   end,
})

PlankTab:CreateButton({
   Name = "📚 5個連続スポーン",
   Callback = function()
      local character = game.Players.LocalPlayer.Character
      if not character then return end
      
      local hrp = character:FindFirstChild("HumanoidRootPart")
      if not hrp then return end
      
      task.spawn(function()
         for i = 1, 5 do
            local lookVector = hrp.CFrame.LookVector
            local spawnPos = hrp.Position + (lookVector * (plankDistance + i * 2)) + Vector3.new(0, heightOffset, 0)
            
            pcall(function()
               local args = {[1] = selectedToy, [2] = spawnPos}
               game:GetService("ReplicatedStorage"):WaitForChild("SpawnToy"):FireServer(unpack(args))
            end)
            
            task.wait(0.2)
         end
         
         Rayfield:Notify({
            Title = "✅ 完了",
            Content = "5個スポーンしました！",
            Duration = 2
         })
      end)
   end,
})

PlankTab:CreateButton({
   Name = "🌉 橋を作成",
   Callback = function()
      local character = game.Players.LocalPlayer.Character
      if not character then return end
      
      local hrp = character:FindFirstChild("HumanoidRootPart")
      if not hrp then return end
      
      task.spawn(function()
         local lookVector = hrp.CFrame.LookVector
         
         for i = 0, 20 do
            local spawnPos = hrp.Position + (lookVector * i * 3) + Vector3.new(0, heightOffset, 0)
            
            pcall(function()
               local args = {[1] = selectedToy, [2] = spawnPos}
               game:GetService("ReplicatedStorage"):WaitForChild("SpawnToy"):FireServer(unpack(args))
            end)
            
            task.wait(0.1)
         end
         
         Rayfield:Notify({
            Title = "🌉 完了",
            Content = "橋を作成しました！",
            Duration = 2
         })
      end)
   end,
})

-- 説明パラグラフ
PlankTab:CreateParagraph({
   Title = "使い方",
   Content = "「画面ボタンを作成」を押すと、画面上にボタンが表示されます。ボタンを押すと板が自動でスポーンされます。PC・スマホ両対応です！デフォルトは「Pallet」です。"
})

-- 起動時の通知
Rayfield:Notify({
   Title = "柊羽 UI",
   Content = "板スポーン機能が読み込まれました！",
   Duration = 4,
   Image = 4483362458,
})

print("柊羽 UI - 板スポーン機能 読み込み完了")
