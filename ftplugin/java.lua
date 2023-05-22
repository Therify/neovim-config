 local config = {
     cmd = {
         '/Users/fitzpj3/.local/opt/jdtls-launcher/jdtls/bin/jdtls',
         -- '/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home/bin/java',
         -- 'java',
         -- '-Declipse.application=org.eclipse.jdt.ls.core.id1',
         -- '-Dosgi.bundles.defaultStartLevel=4',
         -- '-Declipse.product=org.eclipse.jdt.ls.core.product',
         -- '-Dlog.protocol=true',
         -- '-Dlog.level=ALL',
         -- '-Xmx1g',
         -- '--add-modules=ALL-SYSTEM',
         -- '--add-opens', 'java.base/java.util=ALL-UNNAMED',
         -- '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
         '-javaagent:$HOME/.local/lib/lombok/lombok.jar',
         -- '-jar', '/Users/fitzpj3/eclipse/jee-2023-03/Eclipse.app/Contents/Eclipse/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
     },
     root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
     settings = {
         -- java = {
         --     configuration = {
         --         -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
         --         -- And search for `interface RuntimeOption`
         --         -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
         --         runtimes = {
         --             {
         --                 name = "JavaSE-1.8",
         --                 path = "/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/",
         --             },
         --             {
         --                 name = "JavaSE-11",
         --                 path = "/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/",
         --             },
         --             {
         --                 name = "JavaSE-17",
         --                 path = "/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/",
         --             },
         --         }
         --     },
         --     -- format = {
         --     --     settings = {
         --     --         url = "~/.local/share/eclipse/vanderbilt-format-2.2.xml",
         --     --         profile = "Vanderbilt",
         --     --     },
         --     -- },
         -- }
     }
 }
 require('jdtls').start_or_attach(config)

 -- local config = {
 --     cmd = {'/Users/fitzpj3/.local/opt/jdtls-launcher/jdtls/bin/jdtls'},
 --     root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
 -- }
 -- require('jdtls').start_or_attach(config)
