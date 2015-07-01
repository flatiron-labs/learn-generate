module LearnGenerate
  class IosLab
    class LiftoffBackup
      def backup
        `mv .liftoffrc{,.bak}`
        `mv .liftoff{,.bak}`
      end

      def restore
        `rm -rf .listoff .liftoffrc`
        `mv .liftoffrc{.bak,}`
        `mv .liftoff{.bak,}`
      end
    end
  end
end
