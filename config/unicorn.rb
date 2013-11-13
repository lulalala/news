worker_processes 3

listen '/tmp/unicorn.news.sock'

pid '/tmp/unicorn.news.pid'

stderr_path 'log/unicorn.log'
stdout_path 'log/unicorn.log'
