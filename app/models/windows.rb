# frozen_string_literal: true

# Windows
class Windows
  def initialize
    @conn = WinRM::Connection.new(
      endpoint: 'http://192.168.0.5:5985/wsman',
      user: Rails.application.credentials.windows[:user],
      password: Rails.application.credentials.windows[:password]
    )
  end

  def run(command)
    @conn.shell(:powershell) { |shell| shell.run(command) }
  end

  def suspend
    command = <<-COMMAND
      Add-Type -Assembly System.Windows.Forms
      [System.Windows.Forms.Application]::SetSuspendState('Suspend', $false, $false)
    COMMAND
    run(command)
  end
end
