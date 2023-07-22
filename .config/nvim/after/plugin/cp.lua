vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.cpp"},
    callback = function ()
        vim.schedule(function ()
            local dir = vim.fn.getcwd();
            if string.match(dir,"testCP" ) then
                vim.cmd("read ~/testCP/Leetcode_Template/template.cpp");
            end
        end)
    end
})
