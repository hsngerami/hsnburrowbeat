from hsnburrowbeat import BaseTest

import os


class Test(BaseTest):

    def test_base(self):
        """
        Basic test with exiting Hsnburrowbeat normally
        """
        self.render_config_template(
            path=os.path.abspath(self.working_dir) + "/log/*"
        )

        hsnburrowbeat_proc = self.start_beat()
        self.wait_until(lambda: self.log_contains("hsnburrowbeat is running"))
        exit_code = hsnburrowbeat_proc.kill_and_wait()
        assert exit_code == 0
