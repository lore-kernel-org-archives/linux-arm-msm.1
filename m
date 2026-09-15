Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444D84AEBE5
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475444; cv=none; b=HuVtXN4mZcAT+Dqmu7S667gJqSzWJlPbzxHqh8GJPWGK8QdScMOdiRH67bnPa3pwoPbloG961M02WL/WrMpH1R5z23p6msIXhSpL6U05OurKi3zWzDYOlsjuhAc5+u80GeBbHckQQ/vFVwUnyCrH08tr0BvVtpZZVNC5WYNGx5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475444; c=relaxed/simple;
	bh=rD24ettfq/yp1pQmJ0kLVwsU5W/LV5RYcqusbnnOepQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q+tutuu062yv1uoOtitTHgRdW0O/vapj0eKmbhjC6XR959PsouDUVzsecGjQHQvI1AFZ7y9T9fFNZMpOqGdcmwFMakdTNQ4oG/deRHqRTX+BogF9h8+zED2SJGk/wsKjnPoN+xqkVmq9cC6ofu+btN+kk4lJejTZzHA2Nf5Hq3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tqwyhhm/; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tqwyhhm/"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so42506465ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475442; x=1790080242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xqadnkZnQpvwO0yu2aZCQtLbtAViRwE5+Ankys+V6vM=;
        b=Tqwyhhm/qk2uBraPWQOJYiTLghbGUNE3NYtSIKcrYvKSuVXblfX2sPcfo9T1FzVaoo
         u43HBmnROPCzIS8v3l/58yzIckmyoMfVL2AwhqSanHTFeOO9zSAC77Qz0DV1byI08QFd
         YfVE7DuazfFgTYR5/8Qfu4y9jp3sqVkEu+qBhvT+a3NfiU+F8GDDrWz5x1G7079YTWsF
         nyrHXU20Js/xuHeaDjzsEkj/29TpXOvZv9PlBdyaA7d5wDd9Hrxk++1tb+Y7HRJnd48i
         xRz6HdbnAelqUjA/1ilSqqFGyR4vNkIDml4WVM0ir3AXOiSqSvakBZuoOPEnkNAy3Og3
         OqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475442; x=1790080242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqadnkZnQpvwO0yu2aZCQtLbtAViRwE5+Ankys+V6vM=;
        b=APIMMVtbO2Gc/1GiLeGCHeL/oZ2Qft9mRhz+HFgkPUnJHcTWy87JKrr0NcQpryWcxc
         e1oUF3+ii1VSijCImcE09tWhU+053Y+UjnVAu53cCLat/SJCKbCxDaEvc2pTR5vyiPai
         whi0EVoiABpSMQnR65OnLnYyYvLajlPmlJg62HpT1F2eGF71dmV4uK8ip75Vb6FZGSTE
         mrVM62m2KGPrDhGWlF/06Rgs+un7TdTs6+O3yeVjVmt3P/csRP6WqhzCLlzkeyEqjPKp
         /5X00bVFn99SJeuqcZhp7JGVMKawAC5Gs40gV+IBPkR42RZBVYzThN/aKmVGzKtrTnlM
         Gxkw==
X-Forwarded-Encrypted: i=1; AKwUvByGedisvyMdqRjs/8wkDlPToG6QNcS4GWiNYhBjeexGcjSy0WUKfvvb+GCa8HP1ehLyEtkRUXrIcJpIad7k@vger.kernel.org
X-Gm-Message-State: AFuF++nw16hsLLg70bxQkhrSPXhvxrFFQYcagOUu60v7722fbx/h6stg
	eLMHhEtW0cLS4InBKkvAdlrTxWvMd2Eb6qw1OlqPop3Bg/rJJBkOtSws
X-Gm-Gg: AYBFou1toUCKqRRPnjXJYETq8gkUvz+fwpqV9i2FiL8P1dg/aSiH5a7qVw8buRHOLJ5
	e34d/NE3MHfxmWeRWcdjfibfdXS+hfOoh/BCE26O+9bN+CTONNQ/IKOIBJdkJsbFmsX2SNI0OeB
	8yA+CQkvcimLOuv0cuOzyCa3WPJGLZt6q6ZRYLNnfv0bl/2F1BIHUDlVZl055fwdTV7dZGCzcJN
	rJfnXj4LOVkmHTLTXtL3cjwwvOMxW7TpgWMTi36MVvV7NjRsoGaaeNxU/Y21pE4O4bc5FC6j03C
	tbahxkLZtKkzRub+48gvttKwmyuaBtZsxI5OKoH1m2t38flBwAIROJ5HF5Itmze97VzB5TVoUSf
	QXh2kgcnsVKUIBi9tej2B9NIHbKl4d5jHse6MXLNd9ruO6woRCoCozwC4BBDOtdN2k9jU2Fc+kJ
	OtaRHqmBLekgIXcXyXg3k6oNwjHwNN3IT9oeLfB9NPlHCxaEOU3S6SCd4=
X-Received: by 2002:a17:902:e54b:b0:2d7:203b:9863 with SMTP id d9443c01a7336-2dd6c5b1084mr131399045ad.1.1789475441464;
        Tue, 15 Sep 2026 05:30:41 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd76fc2c54sm12402345ad.72.2026.09.15.05.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:30:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: venus: avoid HFI resource leak on IRQ request failure
Date: Tue, 15 Sep 2026 20:30:09 +0800
Message-ID: <20260915123009.2420780-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

venus_probe() calls hfi_create() before requesting the IRQ, but the IRQ
request failure path does not call hfi_destroy().

The history patch moved hfi_create() before the IRQ request to ensure
that the interrupt handler context is initialized before an interrupt
can be delivered. However, if devm_request_threaded_irq() fails after
hfi_create() succeeds, the error path jumps directly to err_core_put
and leaves the HFI resources allocated.

Request the IRQ with IRQF_NO_AUTOEN before creating the HFI device so
that the interrupt remains disabled during HFI initialization. Enable
the IRQ only after hfi_create() succeeds.

This preserves the protection against interrupts arriving before HFI
initialization while ensuring that an IRQ request failure cannot leak
HFI resources.

This issue was found by manual code inspection.

Fixes: 3200144a2fa4 ("media: venus: protect against spurious interrupts during probe")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..42348bdc2332 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -432,16 +432,19 @@ static int venus_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
 	init_waitqueue_head(&core->sys_err_done);
 
-	ret = hfi_create(core, &venus_core_ops);
+	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr,
+					venus_isr_thread,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT |
+					IRQF_NO_AUTOEN, "venus", core);
 	if (ret)
 		goto err_core_put;
 
-	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-					"venus", core);
+	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
 		goto err_core_put;
 
+		enable_irq(core->irq);
+
 	venus_assign_register_offsets(core);
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
-- 
2.43.0

