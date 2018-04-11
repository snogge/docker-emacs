require 'pty'

def run!(*args)
  command = format(*args)
  puts 'running: %s' % command

  raw = ''
  PTY.spawn(command) do |stdout_err, stdin, pid|
    begin
      while (char = stdout_err.getc)
        raw << char
        print char
      end
    rescue Errno::EIO # always raised when PTY runs out of input
    ensure
      Process.waitpid pid
    end
  end
  code = $?.exitstatus
  raise format('error %d', code) if code > 0
  raw
end
