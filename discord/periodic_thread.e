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

	make_with_interval(a_interval: NATURAL_64; a_routine: ROUTINE[TUPLE])
			-- Initializes `Current' to execute `a_routine' every `a_interval' seconds
		do
			make
			interval := a_interval
			routine := a_routine
			must_stop := False
		end

feature -- Basic Operations

	execute
			-- <Precursor>
		do
			from
			until
				must_stop
			loop
				routine.call
				sleep((interval * 1000000000).to_integer_64)
			end
		end

	stop_thread
			-- Stops the execution of `Current'
		do
			must_stop := True
		ensure
			Will_Stop: must_stop
		end

feature {NONE} -- Implementation

	must_stop: BOOLEAN
			-- Whether or not `Current' should stop running

	interval: NATURAL_64
			-- Number of seconds in between each call of `routine'

	routine: ROUTINE[TUPLE]
			-- Routine called periodically

end
