--- @param obj table<string, function>
--- @param names string[]
--- @return table<string, function>
local function make_fns(obj, names)
    for _, name in ipairs(names) do
        obj[name] = function(...)
            local state = require('distant.state')
            local client = assert(
                state.client,
                'Client must be initialized before invoking fn'
            )
            return client:api()[name](...)
        end
    end

    return obj
end

-------------------------------------------------------------------------------
-- FUNCTION API
-------------------------------------------------------------------------------

return make_fns({}, {
    'append_file',
    'append_file_text',
    'copy',
    'create_dir',
    'exists',
    'metadata',
    'read_dir',
    'read_file',
    'read_file_text',
    'remove',
    'rename',
    'spawn',
    'spawn_wait',
    'system_info',
    'watch',
    'write_file',
    'write_file_text',
})
