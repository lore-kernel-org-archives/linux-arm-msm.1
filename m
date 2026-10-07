Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC9649483D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 11:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373276; cv=none; b=WL93sH4rXFUD6rEoc3zo1oAYqjULnINJS6b/KZi4ZDzD8et/W7PEGK0CblBVrV+D0IuFaRIYdU6KCV5Jv7sQHoiNItzwpGUK+0HMPDKvpJqTa3zeNOmZm1vWZvW0cbOYvG9IVS269QRyXxoQGbW42LYiEGcPVwCOtqr/dLlLpe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373276; c=relaxed/simple;
	bh=HrHOxl8vU4NtC3eVjUlc4i27OUvjn5hRvuvP9BpLLW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QomUtJ9b+7x6NyHzpeFT5wAfR5SqbEoaFuYHkWcXVPjqx0A8lPITXUV0g3GjHDtGVE+jADlRNhoVBfd1NX+QOU90X83/1v8+hoKBBtoW+wIVtuOE/bf2NUWIsoeY7yOZQ2x836DI2eOX9XI6c0/KZl8VZLNBI0H31bYfNqUcc+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKxsODvu; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKxsODvu"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso376320a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 04:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791373247; x=1791978047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1S+23ZtOjWwrYVTwNmNORRFxt1wYzNyVlF7uFakN9wo=;
        b=AKxsODvuOCo7ST92k4/L8taWX/E1wKOTTRb6x0ZB2HOUxt522M9TVesw4/Qzz0s8Nm
         dASR1xMiOGb49376DEEs8Ot9LkRYUDKnLZ53vj2nQvLFEm7AHQCREyTTaQDM9Uel9mJu
         8lC1l97sHDtn8LBtN+nqpvywHMOOIYOxkAgv4zIgkXnHOPWXzkSBpp76z3OevDpLLw8l
         2chpgwxN56yiTX5/8YhwivEogDteeRZvHeJzfK7QQwBQJXRCHyP7mWgBXWJA+/0LyNIC
         hLk6ti1SR385ghDQu6jyTfO1O/0YaKwNcKXyV716MfHnZABTubxB+n+8pIe/Nt52bZTG
         O61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373247; x=1791978047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1S+23ZtOjWwrYVTwNmNORRFxt1wYzNyVlF7uFakN9wo=;
        b=j1cnCI7qjAFYU0yKv0wosIXJdUz3s4uixwV8I/N5bxNr1NnLvMkuqBezmSH20BwMLl
         +azTO268f976UoVMuTCnZXT8QEHCv54SX1kNJNoo1PJZkXtW2Z3hEkM7Qv6cXfuYNke9
         MclrOsWgItVw8d5DwtZDVtEHuGThfVyrnpuGbELmyqtTrYKmnaMyeN53eNElwwPgYTA0
         0aQB2mcbU8uww3W4s1J4P8UmAeizy3Gwvq3LCiWpnGUz0MmMOQVONZsA17Ut7rTqKTW+
         9nWomBXCwdAU8Z3CnckcpOTYBY5o+woq/4y7U3xWl4hwzFUf4XAdz78RgnsrirRYu0gC
         U1DQ==
X-Forwarded-Encrypted: i=1; AKwUvBxp8pqmEUwCjZpq1eCQEzPQi1dPVM1bJKajg32jx50RyvWjFR3N6Rngtnfk2LfMEAX9RDB00wEEN9nVI24g@vger.kernel.org
X-Gm-Message-State: AFq9FYIoisBLV9c5s1j/Oo3/Oio7FYQCqaIxQeHcSx8UqI88sfcxolMi
	cu1QNp6pAp8/k0d/9bmnH4e7eqnpgWPzq7DDCZxbUwZg6XPvOQa9Bjzn
X-Gm-Gg: AYBFou3EIrPHmk8/WzygbUEZaxRk504FqPVky4To1JMochKllvWSrGFy6O67Vo7A8Gj
	Nzjcw71e/v0RVlHPhSgMaf6NIaZNBtciaOFFmsGZ5zNHDUC/H/bRYhBIDAPJ27ghtLilvIT0c4T
	b+TXdmA0c/AHDZD/kw1907V0U0TTH46oJYxqGPCOmK/eC32/ovKpgFSJToRGtpiOxl2EAnSV+41
	rpdzfIzMy8nhyJmhgmZgmW4imcHm9JDhwLOKY4Ho6CMY0PGqYGax2ETZHLAeuMAOHStyUT2GPO3
	agFkPemBSKC7qMES9Xv+bEKTZ5KNgtxXbY5j6WDBicNRpv2zZQK2fQzSbd1fbY33RSbqwnuG/oy
	5kgACVufb6kz10Jir8laq0dONoXNO/UN5fMV/NjgYmgrHs813x4jFVnPxGBWlx5nl+kBKbsVJhF
	Cgi69FLUhRroSOf+MulhIwojy0cAzgiBXrae/md+gPSqqmj32wi+DFkA==
X-Received: by 2002:a17:90b:384d:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-3a8a1553dedmr1695567a91.61.1791373246732;
        Wed, 07 Oct 2026 04:40:46 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::8534])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b5c5d9asm4127072a91.11.2026.10.07.04.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:40:46 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on probe failure
Date: Wed,  7 Oct 2026 19:38:36 +0800
Message-ID: <20261007113836.115774-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidma_mgmt_probe() calls pm_runtime_use_autosuspend() during probe, but
the probe failure path does not call the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before pm_runtime_disable() so that the autosuspend
setting is properly undone during cleanup.

This issue was found by manual code inspection.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/qcom/hidma_mgmt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 4805ce390ffa..d8c56af5882d 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -310,6 +310,7 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 	return 0;
 out:
 	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return rc;
 }
-- 
2.43.0

