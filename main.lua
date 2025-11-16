-- Rayfield UIライブラリの読み込み
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ウィンドウの作成
local Window = Rayfield:CreateWindow({
   Name = "柊羽 UI - 板スポーン",
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
      Note = "キー: シュークリーム | Discord: discord.gg/KUnQaDRN",
      FileName = "ShuuhaKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"シュークリーム"}
   }
})

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- タブの作成
local PlankTab = Window:CreateTab("📦 板スポーン", 4483362458)
local PlankSection = PlankTab:CreateSection("板の設定")

-- 使用するおもちゃの選択 (初期値は"Pallet")
local selectedToy = "Pallet"

-- おもちゃのリスト（正確な名前）
local toyOptions = {
   "Pallet", "Basic Bench", "Bench", "Basic Desk", "Table (Metal)", 
   "Cracked Stool", "Chair (Metal)", "Basic Shelf", "Couch",
   "Daycare Table", "Lab Table", "School Lunch Table", "Crate",
   "Orange Bed", "Blue Bed", "Spooky Chair", "Spooky Bench"
}

PlankTab:CreateDropdown({
   Name = "おもちゃを選択",
   Options = toyOptions,
   CurrentOption = {"Pallet"},
   Flag = "PlankToyDropdown",
   Callback = function(Option)
      selectedToy = Option
      print("選択されたおもちゃ:", selectedToy)
      Rayfield:Notify({
         Title = "✅ 選択完了",
         Content = selectedToy .. " を選択しました",
         Duration = 2
      })
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

--- おもちゃをスポーンする関数（信頼性を高める）
local function spawnToyReliable(toyName, position)
   -- **方法1: 標準的なRemoteEventを試す**
   local success1, result1 = pcall(function()
      local spawnRemote = ReplicatedStorage:FindFirstChild("SpawnToy")
      if spawnRemote and spawnRemote:IsA("RemoteEvent") then
         spawnRemote:FireServer(toyName, position)
         return true
      end
   end)
   
   if success1 and result1 then
      task.wait(0.05) -- サーバーが応答するのを待つ
      return true
   end
   
   -- **方法2: 代替のRemoteEventを試す (より一般的な検索)**
   local success2, result2 = pcall(function()
      for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
         if remote:IsA("RemoteEvent") then
            local remoteName = remote.Name:lower()
            if remoteName:find("spawn") or remoteName:find("place") or remoteName:find("toy") then
               -- パラメータの渡し方が異なる可能性があるため、一般的な形式を試す
               remote:FireServer(toyName, position) 
               return true
            end
         end
      end
   end)
   
   if success2 and result2 then
      task.wait(0.05)
      return true
   end
   
   -- **方法3: (元のスクリプトのまま) ショップ経由を試す**
   -- これは非常にゲーム依存度が高いが、念のため残しておく
   local success3, result3 = pcall(function()
      for _, remote in pairs(ReplicatedStorage:GetDescendants()) do
         if remote:IsA("RemoteFunction") or remote:IsA("RemoteEvent") then
            if remote.Name:lower():find("buy") or remote.Name:lower():find("purchase") then
               -- Buy Remoteを呼び出す (このゲームでPalletが無料でない限り、通常は失敗するかエラーになる)
               remote:FireServer(toyName)
               task.wait(0.1)
               -- スポーンされたアイテムを移動 (これはスポーンが保証されていないため信頼性が低い)
               for _, item in pairs(Workspace:GetChildren()) do
                  if item.Name == toyName or item.Name:lower():find(toyName:lower()) then
                     if item:IsA("Model") and item.PrimaryPart then
                        item:SetPrimaryPartCFrame(CFrame.new(position))
                     elseif item:IsA("BasePart") then
                        item.CFrame = CFrame.new(position)
                     end
                     return true
                  end
               end
            end
         end
      end
   end)
   
   return (success3 and result3)
end

-- 画面上の固定ボタンを作成
local function createScreenButton()
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
   button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
   button.BackgroundTransparency = 0.2
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
   stroke.Color = Color3.fromRGB(255, 255, 255)
   stroke.Thickness = 3
   stroke.Parent = button
   
   -- デバイスに応じた位置設定
   if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
      -- モバイル: ジャンプボタンの上
      button.Position = UDim2.new(1, -100, 1, -180)
      button.AnchorPoint = Vector2.new(1, 1)
   else
      -- PC: 右下
      button.Position = UDim2.new(1, -20, 1, -100)
      button.AnchorPoint = Vector2.new(1, 1)
   end
   
   -- ボタンのクリックイベント（1回押したら1個スポーン）
   button.MouseButton1Click:Connect(function()
      local character = LocalPlayer.Character
      if not character then 
         Rayfield:Notify({
            Title = "❌ エラー",
            Content = "キャラクターが見つかりません",
            Duration = 2
         })
         return 
      end
      
      local hrp = character:FindFirstChild("HumanoidRootPart")
      if not hrp then 
         Rayfield:Notify({
            Title = "❌ エラー",
            Content = "HumanoidRootPartが見つかりません",
            Duration = 2
         })
         return 
      end
      
      -- ボタンのアニメーション
      button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
      task.wait(0.1)
      button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
      
      -- プレイヤーの前方に板をスポーン
      local lookVector = hrp.CFrame.LookVector
      local spawnPos = hrp.Position + (lookVector * plankDistance) + Vector3.new(0, heightOffset, 0)
      
      -- スポーン実行
      local success = spawnToyReliable(selectedToy, spawnPos)
      
      if success then
         Rayfield:Notify({
            Title = "✅ スポーン成功",
            Content = selectedToy .. " をスポーンしました！",
            Duration = 1.5
         })
      else
         Rayfield:Notify({
            Title = "⚠️ スポーン失敗？",
            Content = "スポーンを試みましたが、サーバーが応答しませんでした。ゲーム内で一度「Pallet」を**手動で購入**してから再試行してください。",
            Duration = 4
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
         Content = "画面上にボタンを作成しました！ボタンを押すと1個スポーンします",
         Duration = 3
      })
   end,
})

-- ボタン削除
PlankTab:CreateButton({
   Name = "🗑️ 画面ボタンを削除",
   Callback = function()
      local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
      if PlayerGui:FindFirstChild("PlankSpawnButton") then
         PlayerGui:FindFirstChild("PlankSpawnButton"):Destroy()
         
         Rayfield:Notify({
            Title = "🗑️ 削除完了",
            Content = "画面ボタンを削除しました！",
            Duration = 2
         })
      else
         Rayfield:Notify({
            Title = "ℹ️ 情報",
            Content = "削除するボタンがありません",
            Duration = 2
         })
      end
   end,
})

-- クイックスポーンボタン
local PlankSection2 = PlankTab:CreateSection("クイックスポーン")

PlankTab:CreateButton({
   Name = "⚡ 前方に1個スポーン",
   Callback = function()
      local character = LocalPlayer.Character
      if not character then return end
      
      local hrp = character:FindFirstChild("HumanoidRootPart")
      if not hrp then return end
      
      local lookVector = hrp.CFrame.LookVector
      local spawnPos = hrp.Position + (lookVector * plankDistance) + Vector3.new(0, heightOffset, 0)
      
      local success = spawnToyReliable(selectedToy, spawnPos)
      
      if success then
         Rayfield:Notify({
            Title = "✅ スポーン完了",
            Content = selectedToy .. " をスポーンしました！",
            Duration = 1.5
         })
      else
         Rayfield:Notify({
            Title = "⚠️ スポーン失敗？",
            Content = "スポーンを試みましたが、サーバーが応答しませんでした。ゲーム内で一度「Pallet」を**手動で購入**してから再試行してください。",
            Duration = 4
         })
      end
   end,
})

PlankTab:CreateButton({
   Name = "📚 5個連続スポーン（橋）",
   Callback = function()
      local character = LocalPlayer.Character
      if not character then return end
      
      local hrp = character:FindFirstChild("HumanoidRootPart")
      if not hrp then return end
      
      task.spawn(function()
         local lookVector = hrp.CFrame.LookVector
         local totalSuccess = 0
         
         for i = 0, 4 do
            local spawnPos = hrp.Position + (lookVector * (plankDistance + i * 3)) + Vector3.new(0, heightOffset, 0)
            local success = spawnToyReliable(selectedToy, spawnPos)
            if success then totalSuccess = totalSuccess + 1 end
            task.wait(0.15)
         end
         
         Rayfield:Notify({
            Title = "✅ 完了",
            Content = totalSuccess .. "個スポーンしました！",
            Duration = 2
         })
      end)
   end,
})

PlankTab:CreateButton({
   Name = "🌉 長い橋を作成（20個）",
   Callback = function()
      local character = LocalPlayer.Character
      if not character then return end
      
      local hrp = character:FindFirstChild("HumanoidRootPart")
      if not hrp then return end
      
      task.spawn(function()
         local lookVector = hrp.CFrame.LookVector
         local totalSuccess = 0
         
         for i = 0, 19 do
            local spawnPos = hrp.Position + (lookVector * i * 3) + Vector3.new(0, heightOffset, 0)
            local success = spawnToyReliable(selectedToy, spawnPos)
            if success then totalSuccess = totalSuccess + 1 end
            task.wait(0.1)
         end
         
         Rayfield:Notify({
            Title = "🌉 完了",
            Content = totalSuccess .. "個の橋を作成しました！",
            Duration = 2
         })
      end)
   end,
})

-- デバッグセクション
local DebugSection = PlankTab:CreateSection("🔧 デバッグ")

PlankTab:CreateButton({
   Name = "🔍 ReplicatedStorage確認",
   Callback = function()
      print("=== ReplicatedStorage 確認 ===")
      for _, obj in pairs(ReplicatedStorage:GetChildren()) do
         print("- " .. obj.Name .. " (" .. obj.ClassName .. ")")
      end
      
      Rayfield:Notify({
         Title = "✅ 確認完了",
         Content = "F9コンソールを確認してください。**SpawnToy**のようなRemoteEventを探してください。",
         Duration = 3
      })
   end,
})

-- 説明パラグラフ
PlankTab:CreateParagraph({
   Title = "使い方",
   Content = "1. おもちゃを選択\n2. 「画面ボタンを作成」を押す\n3. 画面のボタンを押すと1個ずつスポーン！\n\nPC: 右下 / モバイル: ジャンプボタンの上"
})

PlankTab:CreateParagraph({
   Title = "⚠️ 注意",
   Content = "板がスポーンされない場合は、ゲーム内で一度手動でPalletを**購入**するか、**装備**してから試してください。ゲームによっては、一度認証しないとリモートが使えません。"
})

-- 起動時の通知
Rayfield:Notify({
   Title = "柊羽 UI - 板スポーン",
   Content = "キー認証完了！板スポーン機能が利用可能です",
   Duration = 4,
   Image = 4483362458,
})

print("柊羽 UI - 板スポーン機能 読み込み完了")
print("選択中のおもちゃ: " .. selectedToy)
