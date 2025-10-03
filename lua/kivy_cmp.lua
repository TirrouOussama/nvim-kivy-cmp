return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip", -- snippet support
  },
  config = function()
    local cmp = require("cmp")

    -- ==============================
    -- Completion data
    -- ==============================

    -- Widgets and UI elements
    local widgets_ui = {
      "Accordion", "AccordionItem", "ActionBar", "ActionButton", "ActionCheck", "ActionDropDown",
      "ActionGroup", "ActionItem", "ActionOverflow", "ActionPrevious", "ActionSeparator",
      "ActionToggleButton", "ActionView", "AsyncImage", "BorderImage", "Bubble", "BubbleButton",
      "Button", "Camera", "Carousel", "CheckBox", "CodeInput", "ColorPicker", "ColorWheel",
      "ContextualActionView", "DropDown", "FileChooser", "FileChooserListView",
      "FileChooserIconView", "FileChooserListLayout", "FileChooserIconLayout", "GestureSurface",
      "Image", "Label", "ListView", "Modalview", "Popup", "ProgressBar", "Rst", "RstDocument",
      "Scatter", "Slider", "TextInput", "ToggleButton", "ScrollView", "Screen", "ScreenManager",
      "SelectableView", "Spinner", "Splitter", "StencilView", "Switch", "TabbedPanel", "TreeView",
      "Video", "VideoPlayer", "VKeyboard", "Widget"
    }

    -- Layouts
    local widget_layouts = {
      "AnchorLayout", "BoxLayout", "FloatLayout", "GridLayout", "PageLayout", "RelativeLayout",
      "ScatterLayout", "ScatterPlaneLayout", "StackLayout"
    }

    -- Canvas elements
    local canvas_elements = {
      "canvas", "canvas.after", "canvas.before", "Bezier", "ClearColor", "Color", "Line",
      "Point", "Quad", "Rectangle", "Svg", "Triangle", "Ellipse"
    }

    -- Properties
    local common_properties = {
      "accordion", "active", "action_previous", "action_view", "allow_stretch", "anchor_x",
      "anchor_y", "anim_delay", "anim_duration", "anim_cancel_duration", "anim_loop",
      "anim_move_duration", "anim_func", "anim_type", "app", "app_icon", "arrow_image",
      "arrow_pos", "auto_bring_to_front", "auto_dismiss", "auto_width", "background_color",
      "background_checkbox_disabled_down", "background_checkbox_disabled_normal",
      "background_checkbox_down", "background_checkbox_normal",
      "background_radio_disabled_down", "background_radio_disabled_normal",
      "background_radio_down", "background_radio_normal", "background_down",
      "background_disabled_normal", "background_disabled_selected", "background_image",
      "background_normal", "background_selected", "bar_color", "bbox", "bbox_alpha", "bbox_margin",
      "bold", "border", "cap", "center", "center_x", "center_y", "col_default_width",
      "col_force_default", "collapse", "collapse_alpha", "color", "cols", "cols_minimum",
      "content", "current", "current_screen", "direction", "dirselect", "disabled_color",
      "dismiss_on_select", "do_collide_after_children", "do_rotation", "do_scale", "do_scroll",
      "do_translation", "do_translation_x", "do_translation_y", "draw_timeout", "draw_bbox",
      "file_encodings", "file_system", "filter_dirs", "filters", "font_name", "font_size",
      "foreground_color", "group", "halign", "height", "hex_color", "hsv", "id", "icon",
      "important", "index", "italic", "keep_data", "keep_ratio", "layout", "lexer", "limit_to",
      "line_height", "line_width", "loop", "manager", "markup", "max", "max_height", "max_lines",
      "max_strokes", "min", "min_move", "min_space", "minimum_height", "minimum_size",
      "minimum_width", "mipmap", "mode", "multiline", "multiselect", "name", "nocache",
      "norm_image_size", "opacity", "orientation", "overflow_group", "overflow_image", "padding",
      "padding_x", "padding_y", "page", "path", "play", "points", "pos", "pos_hint",
      "previous_image", "progress_cls", "use_random_color", "use_separator", "readonly", "refs",
      "resolution", "rgb", "rgba", "rootpath", "rotation", "row_default_height",
      "row_force_default", "rows", "rows_minimum", "scale", "scale_max", "scale_min",
      "screen_names", "screens", "scroll_x", "scroll_y", "scroll_distance", "scroll_timeout",
      "separator_color", "separator_height", "separator_image", "separator_width", "shorten",
      "shorten_from", "split_str", "show_arrow", "show_hidden", "size", "size_hint",
      "size_hint_x", "size_hint_y", "sort_func", "source", "spacing", "state", "strip", "style",
      "style_name", "swipe_threshold", "temporal_window", "text", "text_size", "texture",
      "texture_size", "title", "title_align", "title_args", "title_color", "title_font",
      "title_size", "title_template", "top", "transform", "transform_inv", "transition",
      "transition_progress", "transition_state", "translation_touches", "valign", "value",
      "value_normalized", "view_list", "view_mode", "wheel", "width", "with_previous",
      "unicode_errors"
    }

    -- Events
    local event_handlers = {
      "on_previous", "on_select", "on_dismiss", "on_entry_added", "on_subentry_to_entry",
      "on_submit", "on_gesture_start", "on_gesture_extend", "on_gesture_merge",
      "on_gesture_complete", "on_gesture_cleanup", "on_gesture_discard", "on_ref_press",
      "on_open", "on_transform_with_touch", "on_bring_to_front", "on_pre_enter", "on_enter",
      "on_pre_leave", "on_leave"
    }

    -- ==============================
    -- Helpers
    -- ==============================
    local function snippet_value(name)
      return name .. ": ${1:value}"
    end

    local function snippet_event(name)
      return name .. ": $1"
    end

    local completions = {}

    -- Widgets
    for _, v in ipairs(widgets_ui) do
      table.insert(completions, {
        label = v,
        kind = cmp.lsp.CompletionItemKind.Class,
        insertText = v .. ":",
        insertTextFormat = 2,
      })
    end
    for _, v in ipairs(widget_layouts) do
      table.insert(completions, {
        label = v,
        kind = cmp.lsp.CompletionItemKind.Class,
        insertText = v .. ":",
        insertTextFormat = 2,
      })
    end

    -- Canvas
    for _, v in ipairs(canvas_elements) do
      table.insert(completions, {
        label = v,
        kind = cmp.lsp.CompletionItemKind.Class,
        insertText = v .. ":",
        insertTextFormat = 2,
      })
    end

    -- Properties
    for _, v in ipairs(common_properties) do
      table.insert(completions, {
        label = v,
        kind = cmp.lsp.CompletionItemKind.Property,
        insertText = snippet_value(v),
        insertTextFormat = 2,
      })
    end

    -- Events (map to Function for now, since cmp doesn’t have Event kind)
    for _, v in ipairs(event_handlers) do
      table.insert(completions, {
        label = v,
        kind = cmp.lsp.CompletionItemKind.Function,
        insertText = snippet_event(v),
        insertTextFormat = 2,
      })
    end

    -- ==============================
    -- Custom cmp source
    -- ==============================
    local source = {}
    source.new = function()
      return setmetatable({}, { __index = source })
    end
    function source:complete(request, callback)
      callback(completions)
    end

    cmp.register_source("kvsource", source.new())

    -- ==============================
    -- Setup cmp for .kv files
    -- ==============================

    cmp.setup.filetype("kv", {
      sources = {
        { name = "kvsource" },
        { name = "buffer" },
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<CR>"]  = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            require("luasnip").expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            require("luasnip").jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
    })



  -- Indentation + syntax + colors for Kivy .kv files
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "kv",
    callback = function()
      -- Indentation rules
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.softtabstop = 4
      vim.opt_local.expandtab = true

      -- Force our syntax AFTER vim-kivy sets defaults
      vim.defer_fn(function()
        -- Classes like <MyWidget>:
        vim.cmd([[syntax match KvClass "^<\w\+>\s*:" containedin=ALL]])

        -- Widgets and layouts
        vim.cmd([[
          syntax match KvWidget "^\s*\(Accordion\|AccordionItem\|ActionBar\|ActionButton\|ActionCheck\|ActionDropDown\|ActionGroup\|ActionItem\|ActionOverflow\|ActionPrevious\|ActionSeparator\|ActionToggleButton\|ActionView\|AsyncImage\|BorderImage\|Bubble\|BubbleButton\|Button\|Camera\|Carousel\|CheckBox\|CodeInput\|ColorPicker\|ColorWheel\|ContextualActionView\|DropDown\|FileChooser\|FileChooserListView\|FileChooserIconView\|FileChooserListLayout\|FileChooserIconLayout\|GestureSurface\|Image\|Label\|ListView\|ModalView\|Popup\|ProgressBar\|Rst\|RstDocument\|Scatter\|Slider\|TextInput\|ToggleButton\|ScrollView\|Screen\|ScreenManager\|SelectableView\|Spinner\|Splitter\|StencilView\|Switch\|TabbedPanel\|TreeView\|Video\|VideoPlayer\|VKeyboard\|Widget\|AnchorLayout\|BoxLayout\|FloatLayout\|GridLayout\|PageLayout\|RelativeLayout\|ScatterLayout\|ScatterPlaneLayout\|StackLayout\)\s*:" containedin=ALL
        ]])

        -- Canvas elements
        vim.cmd([[
          syntax match KvCanvas "^\s*\(canvas\|canvas\.after\|canvas\.before\|Bezier\|ClearColor\|Color\|Line\|Point\|Quad\|Rectangle\|Svg\|Triangle\|Ellipse\)\s*:" containedin=ALL
        ]])

        -- Properties (huge set from completions)
        vim.cmd([[
          syntax match KvProperty "^\s\+\(accordion\|active\|action_previous\|action_view\|allow_stretch\|anchor_x\|anchor_y\|anim_delay\|anim_duration\|anim_cancel_duration\|anim_loop\|anim_move_duration\|anim_func\|anim_type\|app\|app_icon\|arrow_image\|arrow_pos\|auto_bring_to_front\|auto_dismiss\|auto_width\|background_color\|background_checkbox_disabled_down\|background_checkbox_disabled_normal\|background_checkbox_down\|background_checkbox_normal\|background_radio_disabled_down\|background_radio_disabled_normal\|background_radio_down\|background_radio_normal\|background_down\|background_disabled_normal\|background_disabled_selected\|background_image\|background_normal\|background_selected\|bar_color\|bbox\|bbox_alpha\|bbox_margin\|bold\|border\|cap\|center\|center_x\|center_y\|col_default_width\|col_force_default\|collapse\|collapse_alpha\|color\|cols\|cols_minimum\|content\|current\|current_screen\|direction\|dirselect\|disabled_color\|dismiss_on_select\|do_collide_after_children\|do_rotation\|do_scale\|do_scroll\|do_translation\|do_translation_x\|do_translation_y\|draw_timeout\|draw_bbox\|file_encodings\|file_system\|filter_dirs\|filters\|font_name\|font_size\|foreground_color\|group\|halign\|height\|hex_color\|hsv\|id\|icon\|important\|index\|italic\|keep_data\|keep_ratio\|layout\|lexer\|limit_to\|line_height\|line_width\|loop\|manager\|markup\|max\|max_height\|max_lines\|max_strokes\|min\|min_move\|min_space\|min_height\|min_size\|min_width\|mipmap\|mode\|multiline\|multiselect\|name\|nocache\|norm_image_size\|opacity\|orientation\|overflow_group\|overflow_image\|padding\|padding_x\|padding_y\|page\|path\|play\|points\|pos\|pos_hint\|previous_image\|progress_cls\|use_random_color\|use_separator\|readonly\|refs\|resolution\|rgb\|rgba\|rootpath\|rotation\|row_default_height\|row_force_default\|rows\|rows_minimum\|scale\|scale_max\|scale_min\|screen_names\|screens\|scroll_x\|scroll_y\|scroll_distance\|scroll_timeout\|separator_color\|separator_height\|separator_image\|separator_width\|shorten\|shorten_from\|split_str\|show_arrow\|show_hidden\|size\|size_hint\|size_hint_x\|size_hint_y\|sort_func\|source\|spacing\|state\|strip\|style\|style_name\|swipe_threshold\|temporal_window\|text\|text_size\|texture\|texture_size\|title\|title_align\|title_args\|title_color\|title_font\|title_size\|title_template\|top\|transform\|transform_inv\|transition\|transition_progress\|transition_state\|translation_touches\|valign\|value\|value_normalized\|view_list\|view_mode\|wheel\|width\|with_previous\|unicode_errors\)\s*:" containedin=ALL
        ]])

        -- Events
        vim.cmd([[
          syntax match KvEvent "^\s\+on_[a-zA-Z0-9_]\+\s*:" containedin=ALL
        ]])

        -- Highlight groups
        vim.cmd("highlight KvClass guifg=#E06C75 gui=bold")
        vim.cmd("highlight KvWidget guifg=#7AA2F7 gui=bold")
        vim.cmd("highlight KvCanvas guifg=#56B6C2 gui=bold")
        vim.cmd("highlight KvProperty guifg=#9ECE6A")
        vim.cmd("highlight KvEvent guifg=#BB9AF7 gui=italic")
      end, 10)
    end,
  })
  end,
}



