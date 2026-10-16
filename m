Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0737D4A9D74
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154781; cv=none; b=Zm5SeZf4Ew7YVkgjy4AXweMV51mYq9PjkU2QZUsFLBqz9kmC4kdqMZpmNFWiwMEn8jXLHUNBl9YmAYz6gPXVaVb2crh22LQhx+JTJzPL6fvgGUTXtgJQehkqKNG38mune+buMOVLI6ZV+PZpvfD1Vj807PzKr4gyOwDvssXivpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154781; c=relaxed/simple;
	bh=V8vvEiOuQbTCyNnx2s4Py2QN+SBBIhE4P0oLXRNMnjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hCRWbu2zNRw5z6xDTy1EUAZVcwrdB5j3wVIs5N/OOwc+t8xbufutgzgw9maYLO8MRug3fxV3UAmZ5JQ9l8ANqg8vSJq3N6VHsAwlbX8BSHPFZjErhEQCmP8xnJV0/u8U2TOU+HPaBVl74DWAmSKB9ovZMbd/afv/vwzUJa7Vz9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bt3rmuA9; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bt3rmuA9"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398b3c37877so3255141a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154779; x=1792759579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vp2w6ovy70f2VqzeJRvoANmmDfJOujsOCwhZHkqjIQ=;
        b=bt3rmuA9/zx2E/FmZ6B9nX/YYYzM7HMSqNQjk6ow2GYSlo+8beKJfwmIL2KMHx2vF6
         /hUxYqpwsG4ffdmRayuqeJ9sT9CrNwJVOlXqv8v4g9ohLpHE3lWSuPrV4iUVSxzt/e+A
         INwJivS9wIQeTu2D+3SROrJKo902Z7Z7wQOdKG5WxGLW9zk0SLZcgOZjH1enB5w+0mJe
         JBSVrT31qn+EHOVrCFnpnJUPu37bmNua96o45fa37i2DWrZ12A2NwYupwgyh3baHpzsz
         c4TCq0PtnkSk5GutfK/K3EpbIPM1EKxz+ANtrfjCbOK8TxvBhBy648CPnmx3BEAB1oy7
         6Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154779; x=1792759579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vp2w6ovy70f2VqzeJRvoANmmDfJOujsOCwhZHkqjIQ=;
        b=WTQUn6qo4fgLASL03jEABdzktR5w3rl0Lwovx0cKWhkGKbMBn7Gj0RMcnZnDNZtNIG
         H/UA1WBM1E2FtcEIdFS2NHkBDjG+w1uHkuO4waKvFIChUeYNzvYyZ788fKtI0PgCyuxx
         dT/9g2/S51z5eMVbFmc3PS2SPckjHs0C3KR3NK8xUGVRMN2np8Q50bZL28CmCIN5SslR
         8B0agCfPduuZ6XDWDtcDCz+AJCGyccXKBqh1+BKQ/hbUddZRiF/XI5UwAQ24TcWXyaGV
         KeSnal38aowrY5WaZzHa7uBfGMSlOk9/r1G/cRVNRiUqRUeQFT1K0SuD5ve6pK0iywRn
         qGjw==
X-Forwarded-Encrypted: i=1; AKwUvByq9uuMRQt1hWLmXoCsRFl68XIrsxxy7IiX2c2tWH1O7m+nAl3L3cTRHFkqfPou+UEEw3dkeZOgZC5Pe1fb@vger.kernel.org
X-Gm-Message-State: AFq9FYJldkwoHRtApmODBCsXqcVZlsfL0vvUwDzVMQawG2FlvyfwcNQP
	xPgsbqV5nDeYpIEe3M1/TgLsdu/DFhuZUCONjyIivxicQZZoMjx1na7M
X-Gm-Gg: AYBFou1LRzLZr4ZquLmu5egjD08fh8g+Tdw2qPYOMG/+BiXQsY0gY4xajS1KS1rVxzF
	1wi4F045HqUxRmGakxh7hNkqgts1E88Dy9PfU/qmp2R32b0ywi6yEu0upgW/WH8OGwAIC+Wg4Pc
	JRp8ixDb/uxDeQGRxaSUHArUCVBAY12ev32qrbFYKhPp0/Si9mmVSxOsE6cc8UA6cHqUqzWzBUB
	bycix/iBxcO+CxvBOTPMQTVmXQoayWuPREnBxJ5VZ6BNmE8wNMOFF6P2WQCoUj858C/V7L+ERtk
	yQQ4C5IZ1LEWnQMCk+XT5bZGvrOYSWN0xYDaelKlqGLVmk+Z4aMDpyZXSZEBRDRnMqsd0ZOht+5
	y96D+prWXUZdalV6NwCP7XjAmawh+/A9S9jqoONI094/nqt+sj0g8I/+bdWqOYkoXasJfzOB2Jk
	Na6wWjQd3iScivTY5xImpZJZtmjDKMNt4ix5UcQFdpsQrQJlb84tQAE6toMF1xGUn/RIyuGuFbA
	KC8uo/i2PHb3w==
X-Received: by 2002:a17:90b:4b09:b0:39e:3713:c2e4 with SMTP id 98e67ed59e1d1-3ab3ac58076mr18715633a91.14.1792154779157;
        Fri, 16 Oct 2026 05:46:19 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm9089769a91.8.2026.10.16.05.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:46:18 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: brgl@kernel.org,
	johan@kernel.org,
	loic.poulain@oss.qualcomm.com,
	linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: qca: check the device address on every setup
Date: Fri, 16 Oct 2026 21:46:15 +0900
Message-ID: <20261016124615.61-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qca_check_bdaddr() sets HCI_QUIRK_USE_BDADDR_PROPERTY when the
controller reports the default address from its NVM file, so that the
core programs the configured address again on every setup. The check
is skipped once hdev->public_addr is set.

If the first setup runs on the ROM firmware because the rampatch and NVM
files could not be loaded (driver built in, firmware not in the
initramfs), the check is not reached. Once user space sets the address
with MGMT_OP_SET_PUBLIC_ADDRESS, every later setup skips it, so the
controller falls back to the default address on the next power on and
bonded devices no longer connect. Seen with a WCN7850 on a Lenovo Legion
Tab Y700 Gen 5.

Check the address on every setup. Setting the quirk while
hdev->public_addr is set does not make the controller unconfigured, as
is_configured() only looks at it while no address is set.

Fixes: 32868e126c78 ("Bluetooth: qca: fix invalid device address check")
Cc: stable@vger.kernel.org
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested with the WCN7850 over UART: the configured address survives
three power cycles, a bluetoothd restart and an rfkill block/unblock;
without this patch the first power cycle reverts it. The NVMEM BD
address series [1] changes the same branch; the two apply in either
order.

[1] https://lore.kernel.org/all/20261015-block-as-nvmem-v11-6-f890ac74f87d@oss.qualcomm.com/

 drivers/bluetooth/btqca.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 22b08ab05b82..756a4a8d5631 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -686,9 +686,6 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	struct sk_buff *skb;
 	int err;
 
-	if (bacmp(&hdev->public_addr, BDADDR_ANY))
-		return 0;
-
 	skb = __hci_cmd_sync(hdev, HCI_OP_READ_BD_ADDR, 0, NULL,
 			     HCI_INIT_TIMEOUT);
 	if (IS_ERR(skb)) {
-- 
2.43.0

