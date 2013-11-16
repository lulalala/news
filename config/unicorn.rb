worker_processes 2

listen '/tmp/unicorn.news.sock'

pid '/tmp/unicorn.news.pid'

stderr_path 'log/unicorn.log'
stdout_path 'log/unicorn.log'
