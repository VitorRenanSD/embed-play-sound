local Sound = {}
Sound.__index = Sound

-- Constructor
function Sound.new()
	local self = setmetatable({}, Sound)
	
	return self
end


-- Method to play sounds from any specified location
function Sound:playSound(location, volume, looped)
	-- Check if the sound location is provided
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
		warn("ActiveSounds folder not found. Created a new one.")
	end
	
	
	-- Clone the sound to create an independent instance
	local sound = location:Clone()
	sound.Parent = workspace.ActiveSounds
	sound.Volume = volume
	sound.Looped = looped
	
	sound:Play()


	-- Exclui apos o uso, caso nao estiver em loop
	if not looped then

		sound.Ended:Connect(function()
			sound:Destroy()
		end)

	end

end


return Sound
