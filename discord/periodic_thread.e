note
	description: "Thread periodically calling a routine"
	author: "ZeLarpMaster"
	date: "Fri, 27 Oct 2017 04:00:13 +0000"
	revision: "0.0.1"

class
	PERIODIC_THREAD

inherit
	THREAD
		redefine
			execute
		end

create
	make_with_interval

feature {NONE} -- Initialization

	make_with_interval(a_interval: NATURAL_32; a_routine: ROUTINE[TUPLE])
			-- Initializes `Current' to execute `a_routine' every `a_interval' seconds
		do
			make
			interval := a_interval
			routine := a_routine
		end

feature -- Basic Operations

	execute
		do

		end

feature {NONE} -- Implementation

	interval: NATURAL_32
			-- Number of seconds in between each call of `routine'

	routine: ROUTINE[TUPLE]
			-- Routine called periodically

end
