Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750597;
	b=ioy1hNvJ+rJ9bwsvf5TTJuapJ7W1CE5qIbOAfYce42U/wzS55Qqc9FkzprmFZlJRz8To
	 NYEl7ZnTrxS/ESU0jz7QBP+give2AxanEMFvQnp/0axI/o9YuPm+fnT1cwMAAFegQNffw
	 sMyR//lgkPnObAkjvKLNOFVJIkImsn2CQFMEBkoOgXoGrWiOATrCsPTFzRHX2bGNF8d2d
	 AoqCDwsQwEQyJBRILyKu16XUXES3k3/ADoAqqM16p7WqeHvQ9Z4wn4ddmFq+q30reJ6HJ
	 NZz/zU2cYu7YttZ5LS7QX8UoQZiBP7ldvt2Z9pFBsnjxLVmR7q+1A5Z/1BNvPdC4irQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=w3JinBf0Z2jF81QKjb6rRVvSkFxoBcyPBCQyWjZnSYE=;
	b=2drvUKzARsD8hEg52zt6BYlLaXCCX4PM+0QPPaKW4Ax6lJViM65QIr+vapCvT0/pZAVz
	 +bjDdEAbb7OvI3sic8PpQzhxuMDwcwRl+PEXm18R+NVoZyOuEUbOFBQxeZ7E6AynOg0eA
	 NaSSXnx52lhRPkra3pehc52UAxeOYtnjiaoEb4sLKQTaSTt3fmk5w/nnEK0szEdAJPvua
	 J80472G2+LzM5fxEQ+V5jctxiShy4PcT+rWn/u9js4BqTDY3GDvo+BFDKQV8yRp9QEywk
	 s22lQq3grNesSVwK3ve6409qJhS4M+DuBRLQHQgvEhsPGZCNWRYTDQAUsLinLfeF9rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lKBxdyju;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12ED606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D12ED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lKBxdyju
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c25501f4aa2so85194766b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792750595; x=1793355395; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w3JinBf0Z2jF81QKjb6rRVvSkFxoBcyPBCQyWjZnSYE=;
        b=lKBxdyjushZ+5eg971tfk2uIwBETMu3NrDXozbFHyWCXB5At8VD7ucPRFqLIBZunsz
         m8VpXVYAo8CRUVTcSsaqPf84rMM6G81z6tdjEUf1xbsvUAQR4pKPJm0U41XIK9UbaFxR
         Xc/hMMQ2BKe22GNP3SNK3PJDQ09YBvn5/T0Sgn1D5cZEwNaXD9HImYqcr4BwOhD4wE7R
         32zBUf349CB+OtDLe4HHr7EVHwCYdGcWwYwom8ge4ZIEEWrOhD6iwjM47tUsrBceEGHw
         C3DpV3vxZ77EGR9vEr3PQal9vx/SdL0yjK55oPgXmqPCX/V4j07QviSvXjiY22h6BwYU
         MZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750595; x=1793355395;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w3JinBf0Z2jF81QKjb6rRVvSkFxoBcyPBCQyWjZnSYE=;
        b=2N571L8GMDql7tJ57TUJHV6cQ7kMN/TqiruX7ieytEQ4s1wcRW6fLVFejxocW6cMOD
         SNCfz8zJpo2ltYIeqzWai46dHJRHT0uVzCnND269EWrVDt/rbXfBROSwAhZYfHJ/atbo
         GejXBld188sWiQMYBQrdo2XqmVDTnc8YU1trYuZ1VkmWOKEvz8DJqdg+mGCaQN+mp8LR
         sQtKjDuWNJuO4lv2SBZT7Lh2fdSStqDv5t31INIa1w9FRqTkyuvs979/kh97alD/K3ja
         780ea2207DoJnpfITNwWES7XJlB9BTlfLnb+aiYBWaVNkO0HJTzxN3wUm2xkyz0phpzW
         /9Kg==
X-Gm-Message-State: AFq9FYL3JV1IWR2TzCoHxN6XLgYD7anAy3BXDUznQBHqzHbV91pynfWT
	40O31YBJo0nMMxvPQW5EIE3zCkkzitpFPJJ8eGYHozJ4sed5q0LswKM0FYDuEgTEzktT1rWolBN
	bqJ1jI9lIPhcJkw==
X-Received: from ejcog42.prod.google.com ([2002:a17:907:1dea:b0:c31:81f2:c52b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:da2:b0:c2a:ac35:95fb with SMTP id a640c23a62f3a-c468d88a5c0mr676886766b.24.1792750595024;
 Fri, 23 Oct 2026 03:16:35 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:15:35 +0000
In-Reply-To: <20261023101536.3965344-1-smostafa@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023101536.3965344-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261023101536.3965344-2-smostafa@google.com>
Subject: [PATCH v2 1/2] dmaengine: qcom: bam_dma: Take a PM ref at remove()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

bam_dma_remove() calls pm_runtime_dont_use_autosuspend() and
pm_runtime_force_suspend(), which on a BAM with its own clock disables
bam_clk, and only then writes BAM_IRQ_SRCS_MSK_EE and terminates the
channels, touching registers of a block whose clock has just been
removed, causing the board to reset.

Sashiko(Locally) also reports, it then calls clk_disable_unprepare()
on a clock that runtime suspend already disabled, which can trigger
"already disabled" warning in clk_core_disable().

Hold a runtime PM reference across the register accesses and the
channel teardown. Once the hardware is quiet, disable runtime PM with
the device still active and drop the clock exactly once, balancing the
clk_prepare_enable() in probe.

Fixes: 7d2545599f5b ("dmaengine: qcom-bam-dma: Add pm_runtime support")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/dma/qcom/bam_dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index f67a93a37d48..8a1f4e5d24d1 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1403,12 +1403,10 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_force_suspend(&pdev->dev);
-
 	of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&bdev->common);
 
+	pm_runtime_get_sync(&pdev->dev);
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
@@ -1428,6 +1426,8 @@ static void bam_dma_remove(struct platform_device *pdev)
 
 	tasklet_kill(&bdev->task);
 
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	clk_disable_unprepare(bdev->bamclk);
 }
 
-- 
2.56.0.307.g5fe7bd680c-goog

