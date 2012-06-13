require 'timeout'

module ForkTimeout
  def self.timeout(sec)
    if (pid = fork).nil?
      yield
    else
      begin
        Timeout.timeout(sec) { Process.waitpid(pid) }
      rescue Timeout::Error
        # The child process might complete normally after waitpid timeout.
        # Sending a kill signal to a non-existent process throws Errno::ESRCH
        # Sending a kill signal can also throw Errno::EPERM if there is permission issue.
        begin
          Process.kill("HUP", pid)
          Process.detach(pid)
        rescue Errno::ESRCH
        end
        raise
      end
    end
  end
end

ForkTimeout.timeout(1) {
  puts "Going to sleep"
  sleep 3
  puts "After sleep"
}
