<?php
echo "Current PHP user: " . get_current_user() . "\n";
echo "Reports dir writable: " . (is_writable('reports/') ? "YES ✓" : "NO ✗") . "\n";
echo "Reports dir perms: " . substr(sprintf('%o', fileperms('reports/')), -4) . "\n";
?>
