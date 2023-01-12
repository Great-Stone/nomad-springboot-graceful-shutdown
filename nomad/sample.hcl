job "graceful" {
  datacenters = ["dc1"]
  
  group "java" {
    task "boot" {
      driver = "java"
      
      kill_timeout = "40s"
      kill_signal = "SIGTERM"

      config {
        jar_path    = "local/demo-0.0.1-SNAPSHOT.jar"
        jvm_options = ["-Xmx2048m", "-Xms256m"]
      }

      artifact {
        source = "https://github.com/Great-Stone/nomad-springboot-graceful-shutdown/releases/download/0.0.1/demo-0.0.1-SNAPSHOT.jar"
      }
    }
  }
}