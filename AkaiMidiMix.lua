-- Developed by Paul Ledbrook (Frequency Control Centre)
-- https://frequencycontrolcentre.bandcamp.com

-- With inspiration from The Sighs of Monsters http://thesighsofmonsters.com/

-- Updated script to support soft pickup for the sliders but not the knobs. Knobs can easily be added in.

-- position of first analog control in the items table. ie the first fader
gFirstAnalogIndex = 9

function remote_init()
	local items={
		{name="Knob 1 Bottom", input="value", output="value", min=0, max=127},
		{name="Knob 2 Bottom", input="value", output="value", min=0, max=127},
		{name="Knob 3 Bottom", input="value", output="value", min=0, max=127},
		{name="Knob 4 Bottom", input="value", output="value", min=0, max=127},
		{name="Knob 5 Bottom", input="value", output="value", min=0, max=127},
		{name="Knob 6 Bottom", input="value", output="value", min=0, max=127},
		{name="Knob 7 Bottom", input="value", output="value", min=0, max=127},
		{name="Knob 8 Bottom", input="value", output="value", min=0, max=127},
		
		{name="Fader 1", input="value", output="value", min=0, max=127},
		{name="Fader 2", input="value", output="value", min=0, max=127},
		{name="Fader 3", input="value", output="value", min=0, max=127},
		{name="Fader 4", input="value", output="value", min=0, max=127},
		{name="Fader 5", input="value", output="value", min=0, max=127},
		{name="Fader 6", input="value", output="value", min=0, max=127},
		{name="Fader 7", input="value", output="value", min=0, max=127},
		{name="Fader 8", input="value", output="value", min=0, max=127},
		{name="Fader 9", input="value", output="value", min=0, max=127},
		
		{name="Knob 1 Top", input="value", output="value", min=0, max=127},
		{name="Knob 2 Top", input="value", output="value", min=0, max=127},
		{name="Knob 3 Top", input="value", output="value", min=0, max=127},
		{name="Knob 4 Top", input="value", output="value", min=0, max=127},
		{name="Knob 5 Top", input="value", output="value", min=0, max=127},
		{name="Knob 6 Top", input="value", output="value", min=0, max=127},
		{name="Knob 7 Top", input="value", output="value", min=0, max=127},
		{name="Knob 8 Top", input="value", output="value", min=0, max=127},

		{name="Knob 1 Middle", input="value", output="value", min=0, max=127},
		{name="Knob 2 Middle", input="value", output="value", min=0, max=127},
		{name="Knob 3 Middle", input="value", output="value", min=0, max=127},
		{name="Knob 4 Middle", input="value", output="value", min=0, max=127},
		{name="Knob 5 Middle", input="value", output="value", min=0, max=127},
		{name="Knob 6 Middle", input="value", output="value", min=0, max=127},
		{name="Knob 7 Middle", input="value", output="value", min=0, max=127},
		{name="Knob 8 Middle", input="value", output="value", min=0, max=127},

		
		
		{name="Mute 1", input="button", output="value"},
		{name="Mute 2", input="button", output="value"},
		{name="Mute 3", input="button", output="value"},
		{name="Mute 4", input="button", output="value"},
		{name="Mute 5", input="button", output="value"},
		{name="Mute 6", input="button", output="value"},
		{name="Mute 7", input="button", output="value"},
		{name="Mute 8", input="button", output="value"},

		{name="Solo 1", input="button", output="value"},
		{name="Solo 2", input="button", output="value"},
		{name="Solo 3", input="button", output="value"},
		{name="Solo 4", input="button", output="value"},
		{name="Solo 5", input="button", output="value"},
		{name="Solo 6", input="button", output="value"},
		{name="Solo 7", input="button", output="value"},
		{name="Solo 8", input="button", output="value"},

		{name="Rec 1", input="button", output="value"},
		{name="Rec 2", input="button", output="value"},
		{name="Rec 3", input="button", output="value"},
		{name="Rec 4", input="button", output="value"},
		{name="Rec 5", input="button", output="value"},
		{name="Rec 6", input="button", output="value"},
		{name="Rec 7", input="button", output="value"},
		{name="Rec 8", input="button", output="value"},

		{name="Bank Left", input="button", output="value"},
		{name="Bank Right", input="button", output="value"},
		{name="Solo Select", input="button", output="value"},

	}
	remote.define_items(items)

	local inputs={
		
		{pattern="b? 12 xx", name="Knob 1 Bottom"},
		{pattern="b? 16 xx", name="Knob 2 Bottom"},
		{pattern="b? 1A xx", name="Knob 3 Bottom"},
		{pattern="b? 1E xx", name="Knob 4 Bottom"},
		{pattern="b? 30 xx", name="Knob 5 Bottom"},
		{pattern="b? 34 xx", name="Knob 6 Bottom"},
		{pattern="b? 38 xx", name="Knob 7 Bottom"},
		{pattern="b? 3C xx", name="Knob 8 Bottom"},
		
		--{pattern="b? 13 xx", name="Fader 1"},
		--{pattern="b? 17 xx", name="Fader 2"},
		--{pattern="b? 1B xx", name="Fader 3"},
		--{pattern="b? 1F xx", name="Fader 4"},
		--{pattern="b? 31 xx", name="Fader 5"},
		--{pattern="b? 35 xx", name="Fader 6"},
		--{pattern="b? 39 xx", name="Fader 7"},
		--{pattern="b? 3D xx", name="Fader 8"},
		--{pattern="b? 3E xx", name="Fader 9"},
		
		{pattern="b? 10 xx", name="Knob 1 Top"},
		{pattern="b? 14 xx", name="Knob 2 Top"},
		{pattern="b? 18 xx", name="Knob 3 Top"},
		{pattern="b? 1C xx", name="Knob 4 Top"},
		{pattern="b? 2E xx", name="Knob 5 Top"},
		{pattern="b? 32 xx", name="Knob 6 Top"},
		{pattern="b? 36 xx", name="Knob 7 Top"},
		{pattern="b? 3A xx", name="Knob 8 Top"},

		{pattern="b? 11 xx", name="Knob 1 Middle"},
		{pattern="b? 15 xx", name="Knob 2 Middle"},
		{pattern="b? 19 xx", name="Knob 3 Middle"},
		{pattern="b? 1D xx", name="Knob 4 Middle"},
		{pattern="b? 2F xx", name="Knob 5 Middle"},
		{pattern="b? 33 xx", name="Knob 6 Middle"},
		{pattern="b? 37 xx", name="Knob 7 Middle"},
		{pattern="b? 3B xx", name="Knob 8 Middle"},

		

		{pattern="90 01", name="Mute 1", value="1"},
		{pattern="90 04", name="Mute 2", value="1"},
		{pattern="90 07", name="Mute 3", value="1"},
		{pattern="90 0A", name="Mute 4", value="1"},
		{pattern="90 0D", name="Mute 5", value="1"},
		{pattern="90 10", name="Mute 6", value="1"},
		{pattern="90 13", name="Mute 7", value="1"},
		{pattern="90 16", name="Mute 8", value="1"},

		{pattern="90 02", name="Solo 1", value="1"},
		{pattern="90 05", name="Solo 2", value="1"},
		{pattern="90 08", name="Solo 3", value="1"},
		{pattern="90 0b", name="Solo 4", value="1"},
		{pattern="90 0e", name="Solo 5", value="1"},
		{pattern="90 11", name="Solo 6", value="1"},
		{pattern="90 14", name="Solo 7", value="1"},
		{pattern="90 17", name="Solo 8", value="1"},

		{pattern="90 03", name="Rec 1", value="1"},
		{pattern="90 06", name="Rec 2", value="1"}, 
		{pattern="90 09", name="Rec 3", value="1"}, 
		{pattern="90 0C", name="Rec 4", value="1"}, 
		{pattern="90 0F", name="Rec 5", value="1"},
		{pattern="90 12", name="Rec 6", value="1"},
		{pattern="90 15", name="Rec 7", value="1"}, 
		{pattern="90 18", name="Rec 8", value="1"},

		{pattern="90 19", name="Bank Left", value="1"},
		{pattern="90 1a", name="Bank Right", value="1"},
		{pattern="90 0f", name="Solo Select", value="1"},

	}
	remote.define_auto_inputs(inputs)

	local outputs={
		
		--{pattern="b? 13 xx", name="Fader 1"},
		--{pattern="b? 17 xx", name="Fader 2"},
		--{pattern="b? 1B xx", name="Fader 3"},
		--{pattern="b? 1F xx", name="Fader 4"},
		--{pattern="b? 31 xx", name="Fader 5"},
	--	{pattern="b? 35 xx", name="Fader 6"},
		--{pattern="b? 39 xx", name="Fader 7"},
		--{pattern="b? 3D xx", name="Fader 8"},
		--{pattern="b? 3E xx", name="Fader 9"},
		
		{name="Mute 1", pattern="90 01 0x", x="value*3"},
		{name="Mute 2", pattern="90 04 0x", x="value*3"},
		{name="Mute 3", pattern="90 07 0x", x="value*3"},
		{name="Mute 4", pattern="90 0a 0x", x="value*3"},
		{name="Mute 5", pattern="90 0d 0x", x="value*3"},
		{name="Mute 6", pattern="90 10 0x", x="value*3"},
		{name="Mute 7", pattern="90 13 0x", x="value*3"},
		{name="Mute 8", pattern="90 16 0x", x="value*3"},

		{name="Solo 1", pattern="90 02 0x", x="value*3"},
		{name="Solo 2", pattern="90 05 0x", x="value*3"},
		{name="Solo 3", pattern="90 08 0x", x="value*3"},
		{name="Solo 4", pattern="90 0b 0x", x="value*3"},
		{name="Solo 5", pattern="90 0e 0x", x="value*3"},
		{name="Solo 6", pattern="90 11 0x", x="value*3"},
		{name="Solo 7", pattern="90 14 0x", x="value*3"},
		{name="Solo 8", pattern="90 17 0x", x="value*3"},

		{name="Rec 1", pattern="90 03 0x", x="value*3"},
		{name="Rec 2", pattern="90 06 0x", x="value*3"},
		{name="Rec 3", pattern="90 09 0x", x="value*3"},
		{name="Rec 4", pattern="90 0c 0x", x="value*3"},
		{name="Rec 5", pattern="90 0f 0x", x="value*3"},
		{name="Rec 6", pattern="90 12 0x", x="value*3"},
		{name="Rec 7", pattern="90 15 0x", x="value*3"},
		{name="Rec 8", pattern="90 18 0x", x="value*3"},

		{name="Bank Left", pattern="90 19 0x", x="value*3"},
		{name="Bank Right", pattern="90 1a 0x", x="value*3"},

	}
	remote.define_auto_outputs(outputs)
end


-- ############################
-- Soft pickup on faders 
-- ############################

-- "Analogs" indicates non-encoder analog controls and refers to both knobs and sliders but here we are only targeting the faders
gNumberOfAnalogs = 9

gAnalogCCLookup = { 
	
	-- uncomment the line below if you want to add back in the knobs (Pan) and readjust the number of analogs in the variable above 
	-- [18]=1,[22]=2,[26]=3,[30]=4,[48]=5,[52]=6,[56]=7,[60]=8, --Knobs 1-8
	
	-- converts CC numbers to slider/knob numbers 
	[19]=1,[23]=2,[27]=3,[31]=4,[49]=5,[53]=6,[57]=7,[61]=8,[62]=9, -- Sliders 1-8 + master fader
	}

gAnalogPhysicalState, gAnalogMachineState, gAnalogMismatch, gLastAnalogMoveTime, gSentValueSettleTime = {}, {}, {}, {}, {}
	
	for i = 1, gNumberOfAnalogs do --set up slider/knob tracking arrays
		gAnalogPhysicalState[i] = 0 --stores current position/value of control on hardware
		gAnalogMachineState[i] = 0 --stores value of connected software item
		gAnalogMismatch[i] = nil --difference between physical state of control and software value (positive numbers indicate physical value is greater, nil indicates mismatch assumption due to unknown physical state at startup)
		gLastAnalogMoveTime[i] = 0 --stores timestamp of last time knob/slider was moved on hardware
		gSentValueSettleTime[i] = 250 --number of milliseconds to wait for a sent slider or knob value to be echoed back before reevaluating synchronization
	end
	
	--acceptable difference between the first reported value from a control and the machine state for the 2 to be considered synchronized
	gStartupLiveband = 3
	function remote_process_midi(event) --manual handling of incoming values sent by controller
		--Analog Messages
		ret=remote.match_midi("b? yy xx", event) --check for messages in channel 1
		if ret~=nil then
			-- Catch knob events
			local AnalogNum = gAnalogCCLookup[ret.y] --try to get the analog number that corresponds to the received Continuous Controller message
			if AnalogNum == nil then --if message isn't from an analog
				return false --pass it on to auto input handling
			else
				gAnalogPhysicalState[AnalogNum] = ret.x --update the stored physical state to the incoming value
				local AllowChange = true --we'll send the incoming value to the host unless we find a reason not to
	
				if gAnalogMismatch[AnalogNum] ~= 0 then --assess conditions if controller and software values are mismatched
					if gAnalogMismatch[AnalogNum] == nil then --startup condition: analog hasn't reported in yet
						gAnalogMismatch[AnalogNum] = gAnalogPhysicalState[AnalogNum] - gAnalogMachineState[AnalogNum] --calculate and store how physical and machine states relate to each other
						if math.abs(gAnalogMismatch[AnalogNum]) > gStartupLiveband then --if the physical value is too far from the machine value
							AllowChange = false --don't send it to Reason
						end
					elseif gAnalogMismatch[AnalogNum] > 0 and gAnalogPhysicalState[AnalogNum] - gAnalogMachineState[AnalogNum] > 0 then --if physical state of analog was and still is above virtual value
						AllowChange = false --don't send the new value to Reason because it's out of sync
					elseif gAnalogMismatch[AnalogNum] < 0 and gAnalogPhysicalState[AnalogNum] - gAnalogMachineState[AnalogNum] < 0 then --if physical state of analog was and still is below virtual value
						AllowChange = false --don't send the updated value
					end
				end
	
				if AllowChange then --if the incoming change should be sent to Reason
					remote.handle_input({ time_stamp=event.time_stamp, item=gFirstAnalogIndex + AnalogNum - 1, value=ret.x }) --send the new analog value to Reason
					gLastAnalogMoveTime[AnalogNum] = remote.get_time_ms() --store the time this change was sent
					gAnalogMismatch[AnalogNum] = 0 --and set the flag to show the controller and Reason are in sync
				end
				return true --input has been handled
			end
		end
	   return false
	end
	
	function remote_set_state(changed_items) --handle incoming changes sent by Reason
		for i,item_index in ipairs(changed_items) do
			local AnalogNum = item_index - gFirstAnalogIndex + 1 --calculate which analog (if any) the index of the changed item indicates
			if AnalogNum >= 1 and AnalogNum <= gNumberOfAnalogs then --if change belongs to an analog control
				gAnalogMachineState[AnalogNum] = remote.get_item_value(item_index) --update the machine state for the analog
				if gAnalogMismatch[AnalogNum] ~= nil then --if we know the analog's physical state
					if (remote.get_time_ms() - gLastAnalogMoveTime[AnalogNum]) > gSentValueSettleTime[AnalogNum] then --and the last value it sent to Reason happened outside the settle time
						gAnalogMismatch[AnalogNum] = gAnalogPhysicalState[AnalogNum] - gAnalogMachineState[AnalogNum] --recalculate and store how physical and machine states relate to each other
					end
				end
			end
		end
	end


function remote_probe()
	local controlRequest="F0 7E 7F 06 01 F7"
	local controlResponse="F0 7E 00 06 02 47 68 ?? ?? ?? ?? ?? ?? ?? ?? ?? F7"
	return {
		request=controlRequest,
		response=controlResponse
	}
end
