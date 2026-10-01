Received: from mail-qv2-f40.google.com (mail-qv2-f40.google.com [74.125.230.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415EF5237A3
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877322; cv=none; b=PPLNaorEUwauMutcFtf+qXTIotzzT/5DPHEk3odfQP/cGCjPTXmg9dSrPLFhc7kVtxbMxH/89EruygYD+tMCBQVSKNfwv8zPEGXSXk0VZ2/ErMpbEPZ3JHs+B5+Ad9QGmNcgDWMEWcCoJ0yt7qhcBBVz4oTxGUu5050RbCYqSMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877322; c=relaxed/simple;
	bh=DSpR+eIPRBF54SbKN9yo7UEYapSBpiuM6wm8TWPC1+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Clh7Bpqo4fmKgYjkCaIpd4K7IgFQjkCJk14kB6ef9dkiHs16BCIsL/gtZLoZ18butGfetFi7m6yW+9d2hAzX05CdlYPsc3q0O0YaZwss6TMkjpwnMuOMoouQXj4Us/s1oyjF15lCjlvffvhYt+Gruyai5sCk7XItu4+wHtI3hb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7Id13UQ; arc=none smtp.client-ip=74.125.230.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7Id13UQ"
Received: by mail-qv2-f40.google.com with SMTP id 6a1803df08f44-917a3545923so18303786d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877309; x=1791482109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uHw2NWjMi2sZfkej/m/I7q1/1oXqeNZYUpECWxq6vI=;
        b=E7Id13UQomuPL9aWkapua+tmuQRYbj0dThURePlTxw8/TeZ7Cd+OPua3QkrTXge67F
         eu/ayh5Odq656jVhBR84uic7znNkWW6o5Tp27K6yKPOAgyoRWOKj8CfNU6C9oV6KCU/g
         4TNaC/DhfARHEn3hhuG05fnvAMUs527VXLVlD/pHw+Rb1nJ2m+bLxbgBprlWZ4sCXMTf
         bzHWCxW3c4W5J86oq0KbGlU9wfZZIpKMv5oIc5p0h4dklZsduRiEQyWIfW/wtBfMALc0
         cddu+EmN//Jz87YQZsrjRPJzzmxqq+EiPsxCHZgcma/a2zibgSyoOGJ8xUFvI2q5UAyy
         eiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877309; x=1791482109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2uHw2NWjMi2sZfkej/m/I7q1/1oXqeNZYUpECWxq6vI=;
        b=ssVmIzsTQ9O1AP/Had7dVRa1UBVpPfBIabHyleQPP3POpJWVdmxoIswqC4aYrFjveK
         aosLGpOzaQMn6FTWXkYZXVscNWE3APZpmjAd+/ImB64J84Y8+l/O4Y7o+hNSkLLgsmen
         zFLYsqUcrSLdsrIZCyyKIM0Fl+39cpflrmL+oZLFTbmo59hR0lOoPxjv3uRy2tE1bhMV
         SPtyGRN+bUjU+AO35GDClMPP1PVC4VNktj/tFfI0aj+T6Gp+T/NaLZ/yXqreVMkS6doT
         tF7TXw2Gw8RARiDtZS+92T6YHRbGz+l5nbFYqduWwp2/9Rp+9vzIcaywAV1cp1Y1Du+q
         80Qw==
X-Forwarded-Encrypted: i=1; AKwUvBw1s2Ie6ypdbWcZQqWIhTPQjsQcL6px8e1bv2Rq75AsmcKkMF7CoyuiiC4OUtNi/w9anqxrvW3EdjrlZQpk@vger.kernel.org
X-Gm-Message-State: AFq9FYIkTimMji0iaipPnIt1X0iypGBmRlGl+ksgrDjfcmA/5lyMAnrT
	t6YxZby1F5D9RsrCDnTcQxFwCorZ6mseMo1jaW0h+4ozmt9FODveAKc=
X-Gm-Gg: AYBFou1HsTqMy6v2Mh0IlFxQSboAFlg0RfzVdt0FH8TFD0c6Y79BuTXKMVrOxwq8uJZ
	PHjHw+B9dcGXYriMx/dbSGcbhsFlzIg5s9Xwwr9/08HIl59QCdDNHrngDSbvUlW2RfCsOrSO1Jn
	yMNO05jIqJfk98fptv8GMaz8nEkHyxgwMdIY6ROetlb9NVImpw+TUAKzEneeGgh+JB1b4Hbcvo3
	w2voVvrW84shQVCUOtuFmiaEofc44GxFwDYYZzCkf8GDa1Vi/TqANAuad/swiDf90XrKAYlzq4K
	qIL3eZKap+kEo2q7V6XViyqSQIr3bHHmaoW/0F9H3Tsu8yEyFzX8U9C/NFYyrn8f5e7Z/JWMTFA
	pnrTUsKd9oafxdTStmcfFBJdEGZr6XLH76yTbIVzQPx3V3uts9HZCGLflFFItEEcD2hh+uyzpPt
	TVOSqBT50rC6ntqGhWGVV/NIuVVe820qzcM+jSm/Q8htM+nKD35Pwx4eosMnvYWd51iDCTOvb/+
	fOhqgLhHbzxvxBVy8+T5XcMoc8OhfJmjYFZQX7wxD/Il0J49PdEum0Ztl5HibCcRn8ynBGN+PE4
	n7a2abaa1yyiJ3VuShmv+7ZYhBAd
X-Received: by 2002:a05:6214:458b:b0:917:a1f9:252c with SMTP id 6a1803df08f44-917c018f4d7mr4051756d6.26.1790877309360;
        Thu, 01 Oct 2026 10:55:09 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a22f96sm32077796d6.32.2026.10.01.10.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:55:08 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: mhun512@gmail.com,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v4 2/2] media: venus: disable recovery work before HFI teardown
Date: Thu,  1 Oct 2026 13:55:02 -0400
Message-ID: <20261001175502.4045853-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001175502.4045853-1-mhun512@gmail.com>
References: <20260925191653.3144006-1-mhun512@gmail.com>
 <20261001175502.4045853-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

venus_remove() cancels core->work before the IRQ is disabled. An IRQ
thread can queue the work again after cancellation. The work can then
access HFI state after venus_hfi_destroy() frees it. The work also
requeues itself when recovery fails, so cancelling an already running
instance alone does not close the race.

Disable and drain the work at the start of remove, before other resources
are dismantled. Do the same in venus_hfi_destroy() for paths that bypass
remove, including probe unwind. Disabling the work prevents both IRQ
handlers and the work itself from requeuing it. Drain the work before
disabling the IRQ so an active recovery can finish any IRQ based
completion waits. Then synchronize the IRQ before freeing HFI state.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7087af32060f..6e495bc04691 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -596,7 +596,7 @@ static void venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;
 
-	cancel_delayed_work_sync(&core->work);
+	disable_delayed_work_sync(&core->work);
 	ret = pm_runtime_get_sync(dev);
 	WARN_ON(ret < 0);
 
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index e7e4e78a186a..20b8ba1e62f1 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,6 +1689,7 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 
+	disable_delayed_work_sync(&core->work);
 	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
-- 
2.53.0

