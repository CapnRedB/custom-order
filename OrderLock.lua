--- STEAMODDED HEADER
--- MOD_NAME: Order Lock
--- MOD_ID: OrderLock
--- MOD_AUTHOR: [CapnRedB]
--- MOD_DESCRIPTION: Prevents Balatro from moving your cards after a hand
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d]

----------------------------------------------
------------MOD CODE -------------------------
local ui_boxRef = create_UIBox_buttons
 LOCKED=false

function create_UIBox_buttons()
  local ui_box=ui_boxRef()
    local text_scale = 0.45
    local button_height = 1.3
    local play_button = {n=G.UIT.C, config={id = 'play_button', align = "tm", minw = 2.5, padding = 0.3, r = 0.1, hover = true, colour = G.C.BLUE, button = "play_cards_from_highlighted", one_press = true, shadow = true, func = 'can_play'}, nodes={
      {n=G.UIT.R, config={align = "bcm", padding = 0}, nodes={
        {n=G.UIT.T, config={text = localize('b_play_hand'), scale = text_scale, colour = G.C.UI.TEXT_LIGHT, focus_args = {button = 'x', orientation = 'bm'}, func = 'set_button_pip'}}
      }},
    }}

    local discard_button = {n=G.UIT.C, config={id = 'discard_button',align = "tm", padding = 0.3, r = 0.1, minw = 2.5, minh = button_height, hover = true, colour = G.C.RED, button = "discard_cards_from_highlighted", one_press = true, shadow = true, func = 'can_discard'}, nodes={
      {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
        {n=G.UIT.T, config={text = localize('b_discard'), scale = text_scale, colour = G.C.UI.TEXT_LIGHT, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}
      }}
    }}

    local ui_box = {
      n=G.UIT.ROOT, config = {align = "cm", minw = 1, minh = 0.3,padding = 0.15, r = 0.1, colour = G.C.CLEAR}, nodes={
          G.SETTINGS.play_button_pos == 1 and discard_button or play_button,

          {n=G.UIT.C, config={align = "cm", padding = 0.1, r = 0.1, colour =G.C.UI.TRANSPARENT_DARK, outline = 1.5, outline_colour = mix_colours(G.C.WHITE,G.C.JOKER_GREY, 0.7), line_emboss = 1}, nodes={
            {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
              {n=G.UIT.R, config={align = "cm", padding = 0}, nodes={
                {n=G.UIT.T, config={text = localize('b_sort_hand'), scale = text_scale*0.8, colour = G.C.UI.TEXT_LIGHT}}
              }},
              {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
                {n=G.UIT.C, config={align = "cm", minh = 0.7, minw = 0.9, padding = 0.1, r = 0.1, hover = true, colour =G.C.ORANGE, button = "sort_hand_value", shadow = true}, nodes={
                  {n=G.UIT.T, config={text = localize('k_rank'), scale = text_scale*0.7, colour = G.C.UI.TEXT_LIGHT}}
                }},
                {n=G.UIT.C, config={align = "cm", minh = 0.7, minw = 0.9, padding = 0.1, r = 0.1, hover = true, colour =G.C.ORANGE, button = "sort_hand_suit", shadow = true}, nodes={
                  {n=G.UIT.T, config={text = localize('k_suit'), scale = text_scale*0.7, colour = G.C.UI.TEXT_LIGHT}}
                }},
                {n=G.UIT.C, config={align = "cm", minh = 0.7, minw = 0.9, padding = 0.1, r = 0.1, hover = true, colour =G.C.BLUE, button = "sort_lock", shadow = true}, nodes={
                    {n=G.UIT.T, config={text = ('LOCK'), scale = text_scale*0.7, colour = G.C.UI.TEXT_LIGHT}}
                }}
              }}
            }}
          }},
  
          G.SETTINGS.play_button_pos == 1 and play_button or discard_button,
        }
      }
    return ui_box
  end

G.FUNCS.sort_lock = function(e)
  if LOCKED then
    LOCKED=false
    return
  end
  LOCKED=true
end

  function CardArea:sort(method)
    if LOCKED then
      return
    end
    self.config.sort = method or self.config.sort
    if self.config.sort == 'desc' then
        table.sort(self.cards, function (a, b) return a:get_nominal() > b:get_nominal() end )
    elseif self.config.sort == 'asc' then 
        table.sort(self.cards, function (a, b) return a:get_nominal() < b:get_nominal() end )
    elseif self.config.sort == 'suit desc' then 
        table.sort(self.cards, function (a, b) return a:get_nominal('suit') > b:get_nominal('suit') end )
    elseif self.config.sort == 'suit asc' then 
        table.sort(self.cards, function (a, b) return a:get_nominal('suit') < b:get_nominal('suit') end )
    elseif self.config.sort == 'order' then 
        table.sort(self.cards, function (a, b) return (a.config.card.order or a.config.center.order) < (b.config.card.order or b.config.center.order) end )
    end
end

-------------------------------------------------
------------MOD CODE END----------------------