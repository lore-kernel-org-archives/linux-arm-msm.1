Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745EB4A5C55
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154778; cv=none; b=sRTnxFYlmFTA9VKyzzMw21KDCrDck823kPJSfQzoH36trX60T+WdayZWreNjOii6LVkhEbNAoGSYlt/BUkuUkjS5SRfzoqs8ennG55C09sZrRomTA/lcD0YDX4upUruJwhxIFL0hHCI+NN/vdb5QxAOR6n6EtCMpc9yiTIyAfvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154778; c=relaxed/simple;
	bh=g/A2LNTpg/TBBWsof9UO+iJupz/JhBE9bEfYXnOvlvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lIxKsc3gfVgKN7YTJwplJdqZgX17Wpdp4FuQn/hvZCW7eJ7Ei3hn4s2LocudzfLhfdj8RJfspPv1enLeCM0Pv4lhvBOhrPFVBGn9gVNcFRGa1BZWATuGT6t14jdasEaZRoYj475WV+Dj38l0HB4IL/tcqgN0Xzj61FLFKgIrWvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPiZgMhJ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPiZgMhJ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1431490a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154774; x=1792759574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9uelrnhVgBO69REznhFRhGJ0U4UCFyoo6ufjAB5aFI=;
        b=PPiZgMhJGO1DZn+ni3QL4jrdTbWZx/nfVOzdxu48kKJGgXpa/RfAzumq5L327kOkmU
         UeSGyPU6P99RIl8m8dRxI1m8di3hMMW5WwdKfxG3BPiqa04vbaKHq1ZHNfL+/Xd3m26n
         SNYApLqyflGHFSS/O2fsyjZUmzveV2YORI3s2Il+VGCHfWFE6sCGyRObLpMZr2m7EVU2
         pF3AkINSodeSDJ+nAoTNEbzoQq8jdYju2yHS6cE2Gdnmp7UyvPG1xYGHFp1qTL6Wd2Jt
         oG668bSVPgw9Dn7GIA4aLdp1qXnq6yCzxKFdu9aYYeih3KmKzIAqLAsyFr/Q4X84aEO6
         VVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154774; x=1792759574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9uelrnhVgBO69REznhFRhGJ0U4UCFyoo6ufjAB5aFI=;
        b=hQIjznL7AjBAcxYxMIVqnQZU6Nisk+7IGw2UxV48+ONd2RsJo5r6Duu17yseHvgYiD
         D344DvMI/Ph9rH9noLLOzj+F/HwouJyYg0WQqWP6qCtxj8yl2GCOSrZdhrrCf/AYDqcd
         2EA4/crtXutaCG0jvvPmjHFEmtoEYyP3X7JMK0LcTCEjbBcZH3eV9kw6oi8GItJfAFU4
         HCbx9/4utRsR3/v4sAaqq7dopOeoYM5rJp/1faopyw946y0jOCSVkw9MCrW4e5F+uhsq
         3+iDK8ys644wy8UfYaWgYAOxhAXuqh8tCTqXFy5SyWP15kzgM/7YT0hcREFogJEPWQeD
         U7RQ==
X-Forwarded-Encrypted: i=1; AKwUvBwf1rWa8c61p+izhDZgjxLlaCdGwTS+MiAGje7y7qHXmpf0Kuz1dhC5X7Fm0piIQKsZwfsx8a6tF4H8qqzL@vger.kernel.org
X-Gm-Message-State: AFq9FYKggf8zHb/J6biDz0M62pwf1s/psdahf4cgND2grOApvxgRL81r
	MU31x/MfWUT/CW8HMC0z+QjIFMvvLCYiCL/3/IA7gjxZus0u2iD+Sahx
X-Gm-Gg: AYBFou2kGWu0FdQ/foap8Sk0MwJ3yxaenoQsRj4IJ41YJmToiJjPMzQnKQvl2F+YpIa
	JbZdYJk3DEzW3mFcHAYK1G8Is0N+pGUqu/qf7E7tU/9/YLpuNEoNcC/nG/ev00QhQ32vLM6vF1m
	fsAJw3kIH0JLFzXy6QuCKa4bY5MQz4Fz4OrqyhxUe4LAvItMkVP+aTImeIEPVV9BHOmm6s78Vqm
	qpUijsIbftCC6P0CjxVujQ4m1JdDi1Mh5XspzHx80LhcS5Ac+e6fHK69mh6NPkNZmjZBh4FFD5S
	PLvB3PQ4ADtcNZele6a1zxtdXuLXeo7wMHYTS7oYNHtlgX/3U4f55hmoKRPwrGZuutB95R2Ox1d
	SAOTfeEDgK8oKoRxSF1H0Fd01XhHljD5Ax5IynHfhx2DVn4us2IrhZIOpwBt9BxMQwp6OkKfOY1
	CWsdiiDKwc+YVDWjZSw7QMnBv6zTMgp805gq2I1cFFqGuhPA4gvWtsOFpiWlhXX+6D+fXSeb1Lq
	jkR3EZqmIVTTuG9wp+dJbaL
X-Received: by 2002:a17:90b:2cce:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3ac8af94f43mr6385936a91.10.1792154773600;
        Fri, 16 Oct 2026 05:46:13 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9d266d6sm1756414a91.1.2026.10.16.05.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:46:13 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: James.Bottomley@HansenPartnership.com,
	mkp@kernel.org
Cc: alim.akhtar@samsung.com,
	bvanassche@acm.org,
	beanhuo@micron.com,
	stanleyjhu@google.com,
	peter.wang@mediatek.com,
	can.guo@oss.qualcomm.com,
	mani@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] scsi: ufs: core: Fix a deadlock between clock scaling and device commands
Date: Fri, 16 Oct 2026 21:46:08 +0900
Message-ID: <20261016124608.46-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 08b12cda6c44 ("scsi: ufs: core: Switch to
scsi_get_internal_cmd()"), device management commands go through
blk_execute_rq() on the pseudo SCSI device, which shares the tagset
with the logical units, while ufshcd_dev_man_lock() holds
clk_scaling_lock for reading.

ufshcd_clock_scaling_prepare() and ufshcd_pause_command_processing()
quiesce the tagset before taking clk_scaling_lock for writing. A device
management command holding the lock for reading at that point is never
dispatched and never times out, so the writer waits forever with all
logical units quiesced. On a Lenovo Legion Tab Y700 Gen 5 this ended in
a hung task panic.

Take clk_scaling_lock before quiescing the tagset, and in
ufshcd_clock_scaling_prepare() also wb_mutex, which is always taken
before clk_scaling_lock. Release them in the reverse order. Commit
b52d695d0620 ("scsi: ufs: core: Keep internal commands dispatchable
during error handling") fixed the same problem in the error handler.

Fixes: 08b12cda6c44 ("scsi: ufs: core: Switch to scsi_get_internal_cmd()")
Fixes: dc5dcac53278 ("scsi: ufs: core: Add helpers to pause and resume command processing")
Cc: stable@vger.kernel.org
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Reproduced on v7.3-rc4 with out-of-tree board support, using short fio
write bursts and readers of the exception_event_status attribute while
devfreq scales: a deadlock within 10 s without this patch, two clean
600 s runs with it. The pause path was only checked by reading the
code, and the reversed release order only by building it. Sashiko
flagged this lock order in [1] and [2].

[1] https://lore.kernel.org/all/20260723130641.92FD31F000E9@smtp.kernel.org/
[2] https://lore.kernel.org/all/20260813222950.8C1581F00A3E@smtp.kernel.org/

 drivers/ufs/core/ufshcd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index cc75384c6502..87f78ffc8cbd 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1360,13 +1360,13 @@ int ufshcd_pause_command_processing(struct ufs_hba *hba, u64 timeout_us)
 	int ret = 0;
 
 	mutex_lock(&hba->host->scan_mutex);
-	blk_mq_quiesce_tagset(&hba->host->tag_set);
 	down_write(&hba->clk_scaling_lock);
+	blk_mq_quiesce_tagset(&hba->host->tag_set);
 
 	if (ufshcd_wait_for_pending_cmds(hba, timeout_us)) {
 		ret = -EBUSY;
-		up_write(&hba->clk_scaling_lock);
 		blk_mq_unquiesce_tagset(&hba->host->tag_set);
+		up_write(&hba->clk_scaling_lock);
 		mutex_unlock(&hba->host->scan_mutex);
 	}
 
@@ -1383,8 +1383,8 @@ void ufshcd_resume_command_processing(struct ufs_hba *hba)
 	__releases(&hba->clk_scaling_lock)
 	__releases(&hba->host->scan_mutex)
 {
-	up_write(&hba->clk_scaling_lock);
 	blk_mq_unquiesce_tagset(&hba->host->tag_set);
+	up_write(&hba->clk_scaling_lock);
 	mutex_unlock(&hba->host->scan_mutex);
 }
 
@@ -1461,16 +1461,16 @@ static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba, u64 timeout_us)
 	 * clock scaling is in progress
 	 */
 	mutex_lock(&hba->host->scan_mutex);
-	blk_mq_quiesce_tagset(&hba->host->tag_set);
 	mutex_lock(&hba->wb_mutex);
 	down_write(&hba->clk_scaling_lock);
+	blk_mq_quiesce_tagset(&hba->host->tag_set);
 
 	if (!hba->clk_scaling.is_allowed ||
 	    ufshcd_wait_for_pending_cmds(hba, timeout_us)) {
 		ret = -EBUSY;
+		blk_mq_unquiesce_tagset(&hba->host->tag_set);
 		up_write(&hba->clk_scaling_lock);
 		mutex_unlock(&hba->wb_mutex);
-		blk_mq_unquiesce_tagset(&hba->host->tag_set);
 		mutex_unlock(&hba->host->scan_mutex);
 		goto out;
 	}
@@ -1487,9 +1487,9 @@ static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err)
 	__releases(&hba->wb_mutex)
 	__releases(&hba->host->scan_mutex)
 {
+	blk_mq_unquiesce_tagset(&hba->host->tag_set);
 	up_write(&hba->clk_scaling_lock);
 	mutex_unlock(&hba->wb_mutex);
-	blk_mq_unquiesce_tagset(&hba->host->tag_set);
 	mutex_unlock(&hba->host->scan_mutex);
 
 	/* Enable Write Booster if current gear requires it else disable it */
-- 
2.43.0

