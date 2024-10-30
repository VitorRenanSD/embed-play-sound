local Sound = {}
Sound.__index = Sound

-- Constructor
function Sound.new()
	local self = setmetatable({}, Sound)
	
	return self
end


-- Method to play sounds from any specified location
function Sound:playSound(location, volume, looped)
	
	-- Check if the sound location is provided and ActiveSounds folder
	if not location then
		warn("Sound not found: " .. tostring(location))
		return
	end
	
	-- Check if the ActiveSounds folder exists; create it if it doesn't
	local activeSoundsFolder = workspace:FindFirstChild("ActiveSounds")
	if not activeSoundsFolder then
		activeSoundsFolder = Instance.new("Folder")
		activeSoundsFolder.Name = "ActiveSounds"
		activeSoundsFolder.Parent = workspace
		warn("ActiveSounds folder not found. Create one at game.Workspace, the code will proceed with a temporary folder!")
	end
	
	
	-- Clone the sound to create an independent instance
	local sound = location:Clone()
	sound.Parent = workspace.ActiveSounds
	sound.Volume = volume
	sound.Looped = looped
	
	sound:Play()


	-- Clean up after playback if the sound is not set to loop
	if not looped then

		sound.Ended:Connect(function()
			sound:Destroy() -- Destroy the sound instance after it finishes playing
		end)
	end
end


return Sound
