return {

    -- LuaSnip configuration for snippets
    {
        "L3MON4D3/LuaSnip",
        config = function()
            local ls = require("luasnip")

            -- Define snippets
            local ls = require("luasnip")

            -- Define snippets
            ls.add_snippets("html", {
                ls.parser.parse_snippet(
                    "html",
                    [[
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${1:Document}</title>
    </head>
    <body>
        ${0}
    </body>
    </html>
  ]]
                ),
            })

            ls.add_snippets("php", {
                ls.parser.parse_snippet(
                    "php",
                    [[
    <?php
    /**
     * ${1:Description}
     */
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${2:Title}</title>
    </head>
    <body>
        ${0}
    </body>
    </html>
  ]]
                ),
            })
            -- Load the snippets
            ls.filetype_extend("html", { "html" })
            ls.filetype_extend("php", { "php" })
        end,
    },
}
