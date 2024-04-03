--a

oink.ui_context("ulx-pm-spammer.lua")

oink.ui_button("spam")
oink.ui_text("name")
oink.ui_text("text")
oink.ui_button("destroy all timers")
oink.ui_slider("rate (incr. 0.5)", 0.05, 5, 0.05)

oink.event_remove("vulx-pm-spammer.lua", "chatSpammerEH")
oink.event_listen("view_render_post", "chatSpammerEH", function()

    local rate = oink.ui_get("ulx-pm-spammer.lua", "rate (incr. 0.5)")
    local name = oink.ui_get("ulx-pm-spammer.lua", "name")
    local text = oink.ui_get("ulx-pm-spammer.lua", "text")

	if oink.ui_get("ulx-pm-spammer.lua", "spam") then
		timer.Create( "cum", rate, 0, function()
            RunConsoleCommand("ulx", "psay", name, text)
        end)
	end

    if oink.ui_get("ulx-pm-spammer.lua", "destroy all timers") then
        timer.Remove("cum")
    end
end)
