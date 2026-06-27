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

# --- Convenience factory procs (Python-rich compatible API) ---

# Panel(content, title=nil, border_style=nil, box=nil)
proc Panel(content, title, border_style, box_name):
    let bl = "left"
    let bx = "single"
    if box_name != nil:
        bx = box_name
    let bs = border_style
    if bs == nil:
        bs = ""
    return rich.panel.Panel(content, title, bl, nil, "right", bx, bs, [0,1], true, nil, "")

# Table(title=nil, box=nil, border_style=nil)
proc Table(title, box_name, border_style):
    let bx = "single"
    if box_name != nil:
        bx = box_name
    return rich.table.Table(title, nil, bx, border_style, true, nil, true, nil, [0,1], nil, nil, nil, nil, nil, nil, nil, nil, true)

# Tree(label=nil, style=nil)
proc Tree(label, style):
    return rich.tree.Tree(label, style, "dim", false)

# Rule(title=nil, style=nil, align=nil)
proc Rule(title, style, align):
    let al = "center"
    if align != nil:
        al = align
    return rich.rule.Rule(title, style, al, "─")

# Markdown(markup=nil)
proc Markdown(markup):
    return rich.markdown.Markdown(markup, nil, nil)

# --- Print helpers ---

# show(obj) - print any rich renderable (replaces rich.print, since print is a keyword)
proc show(obj):
    let c = rich.console.Console(nil, nil, nil, nil, nil, nil)
    c.rich_print(obj)

# print_styled(text, style_str) - print styled text
proc print_styled(text, style_str):
    let c = rich.console.Console(nil, nil, nil, nil, nil, nil)
    let rendered = rich.style.render_styled(str(text), rich.style.parse_style(style_str))
    c.rich_print(rendered)

# print_markdown(markup) - render and print markdown
proc print_markdown(markup):
    let md = Markdown(markup)
    let c = rich.console.Console(nil, nil, nil, nil, nil, nil)
    c.rich_print(md.render(c))

# print_table(headers, rows, title) - print a quick table
proc print_table(headers, rows, title):
    let t = Table(title, nil, nil)
    for i in range(len(headers)):
        t.add_column(headers[i], nil, "left", nil, nil, nil, nil, nil, nil, nil, false, nil, nil)
    for i in range(len(rows)):
        t.add_row(rows[i])
    let c = rich.console.Console(nil, nil, nil, nil, nil, nil)
    c.rich_print(t.render(c))

# print_tree(tree) - print a tree
proc print_tree(t):
    let c = rich.console.Console(nil, nil, nil, nil, nil, nil)
    c.rich_print(t.render(c))

# emoji(name) - get an emoji character  
proc get_emoji(name):
    return rich.emoji.get_emoji(name)
