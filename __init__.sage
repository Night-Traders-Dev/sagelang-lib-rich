gc_disable()
# Rich - Terminal rich text and beautiful formatting for Sage
# Port of Python3-rich to pure Sage

import rich.color
import rich.box
import rich.style
import rich.measure
import rich.align
import rich.text
import rich.theme
import rich.console
import rich.panel
import rich.table
import rich.columns
import rich.layout
import rich.tree
import rich.rule
import rich.progress
import rich.markdown
import rich.padding
import rich.emoji
import rich.spinner
import rich.traceback
import rich.prompt

# Re-export commonly used classes and functions

# Console
let Console = rich.console.Console
let Live = rich.console.Live

# Panel
let Panel = rich.panel.Panel
let create_panel = rich.panel.create_panel

# Table
let Table = rich.table.Table
let create_table = rich.table.create_table

# Text
let Text = rich.text.Text
let segment_text = rich.text.segment_text
let styled_text = rich.text.styled_text
let text_from_string = rich.text.text_from_string
let span = rich.text.span
let assemble = rich.text.assemble

# Style
let Style = rich.style.Style
let parse_style = rich.style.parse_style
let merge_styles = rich.style.merge_styles
let render_styled = rich.style.render_styled

# Color
let Color = rich.color.Color
let parse_color = rich.color.parse_color
let rgb_color = rich.color.rgb_color
let color256 = rich.color.color256

# Box
let Box = rich.box.Box
let get_box = rich.box.get_box

# Theme
let Theme = rich.theme.Theme
let create_theme = rich.theme.create_theme
let default_theme = rich.theme.create_default_theme

# Rule
let Rule = rich.rule.Rule

# Tree
let Tree = rich.tree.Tree
let create_tree = rich.tree.create_tree

# Columns
let Columns = rich.columns.Columns

# Layout
let Layout = rich.layout.Layout

# Progress
let Progress = rich.progress.Progress
let ProgressBar = rich.progress.ProgressBar
let Status = rich.progress.Status

# Markdown
let Markdown = rich.markdown.Markdown
let parse_markdown = rich.markdown.parse_markdown

# Padding
let Padding = rich.padding.Padding

# Emoji
let emoji = rich.emoji.get_emoji
let emoji_replace = rich.emoji.emoji_replace

# Spinner
let Spinner = rich.spinner.Spinner

# Traceback
let Traceback = rich.traceback.Traceback
let render_traceback = rich.traceback.render_traceback
let from_exception = rich.traceback.from_exception

# Prompt
let Prompt = rich.prompt.Prompt
let ask = rich.prompt.ask
let confirm = rich.prompt.confirm

# Measurement
let measure_text = rich.measure.measure_text
let visible_length = rich.measure.visible_length

# Alignment
let align = rich.align.align
let ALIGN_LEFT = rich.align.ALIGN_LEFT
let ALIGN_CENTER = rich.align.ALIGN_CENTER
let ALIGN_RIGHT = rich.align.ALIGN_RIGHT

# Quick print with rich formatting
proc print(obj):
    let c = Console(nil, nil, 80, 25, true, false)
    c.print(obj)

# Print styled text
proc print_styled(text, style_str):
    let c = Console(nil, nil, 80, 25, true, false)
    c.print(rich.style.render_styled(str(text), rich.style.parse_style(style_str)))

# Print a rule
proc print_rule(title, style):
    let c = Console(nil, nil, 80, 25, true, false)
    let rule = Rule(title, style, "center", nil)
    c.print(rule.render(c))

# Print a panel
proc print_panel(content, title):
    let panel = Panel(content, title, nil, nil, nil, true, nil, nil)
    let c = Console(nil, nil, 80, 25, true, false)
    c.print(panel.render(c))

# Print markdown
proc print_markdown(markup):
    let md = Markdown(markup, nil, true)
    let c = Console(nil, nil, 80, 25, true, false)
    c.print(md.render(c))

# Print a table quickly
proc print_table(headers, rows, title):
    let table = Table(title, nil, nil, nil, true, false, true, false, nil, false, nil, nil, nil, nil, nil, nil, nil, true)
    for i in range(len(headers)):
        table.add_column(headers[i], nil, "left", nil, nil, nil, nil, nil, nil, nil, false, nil, nil)
    for i in range(len(rows)):
        table.add_row(rows[i])
    let c = Console(nil, nil, 80, 25, true, false)
    c.print(table.render(c))

# Print JSON
proc print_json(data):
    let c = Console(nil, nil, 80, 25, true, false)
    c.print_json(data)

# Print a progress bar
proc print_progress(completed, total, width):
    let bar = ProgressBar(total, width, nil, nil, nil, nil, true)
    bar.update(completed)
    let c = Console(nil, nil, 80, 25, true, false)
    c.print(bar.render(c))

# Print a tree
proc print_tree(tree_root):
    let c = Console(nil, nil, 80, 25, true, false)
    c.print(tree_root.render(c))
