lua << EOF



vim.g.dashboard_custom_header = {
[[       /^-^\    ]],
[[      / o o \   ]],
[[     /   Y   \  ]],
[[     V \ v / V  ]],
[[       / - \    ]],     
[[      /    |    ]],
[[(    /     |    ]],
[[ ===/___) ||    ]],
}


vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
  a = {description = {'  Find File          '}, command = 'Telescope find_files'},
  d = {description = {'  New File           '}, command = 'DashboardNewFile'},
  b = {description = {'  Recent Files       '}, command = 'Telescope oldfiles'},
  e = {description = {'懲 Config             '}, command = 'edit ~/.config/nvim/init.vim'},
}

vim.g.dashboard_custom_footer = {'Do one thing, do it well - Unix philosophy'}

EOF
