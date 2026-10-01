Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE8D4A0F10
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877328; cv=none; b=XtkRNfZtUids2DBbvU9kZp9d09u9kzogvN+V2yZk3rBs8V1qQOQWEgBjUYwszHsWQnhHgSB5qtH3TWMTKhtQKWPj7g0bYCp5+WSyMsW+HYeE/JCmXZehD0pCOkNAI3DGbvl8sEo48RNLY/AzckN1z9aEYDs9WE2U96qGvTE8MMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877328; c=relaxed/simple;
	bh=j5qbuXrDX2plwlT/z3lSzoNInbPkdLmaRYkhQoo2lGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cg74G/Wes17v3i6kIh1bp0XaN+AKxMm0p/rTvrCRhYADxEkyOokwTvSB6kyopqBmaLyvFr8k3WCfuAilIAyHlOr+s2pRf81krrP+TiY0/gWHzUvNArWFIa7C3wHjkvF3moKOmvjSrwsszA/LYpjhUIuWfSVPsXEKtrvq6s0P92k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIPTZDM0; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIPTZDM0"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-9179c1f49d4so19614376d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877308; x=1791482108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lfjo9pAawGhp175tsWiMgt+u8R0WsNzuMBsHkL3MrJQ=;
        b=qIPTZDM0c/Gj6EXjjDOZV3mYA0aDWCjPwJar//JToJ1LZ5D11gltJ9OJJetbSryOu0
         AejFTNqt2ER9Pd3f2mQFUCAFqlTBqNoP5uqhx+gfkW1DXrY/ayQRZwuV4tpPa4mSp/Ij
         fElMqfqDoksjJ+unPLXT4o3XNxDpEcw8Hokq8MOTaV/FOexBlLPyayEyfcrpVSC2tgBl
         is+A0BmfBhGSQfcEU8RudiDd/OktcUniDscZJEiSV8yzEEXuRRfrWJJn+anMl3jkfsuI
         auNZmBFHn689J2FcTXmqHLIvNRb/KPRfqJiz13oyTcr7D6RcMk3QZz78ePjXzSn3W74r
         DcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877308; x=1791482108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lfjo9pAawGhp175tsWiMgt+u8R0WsNzuMBsHkL3MrJQ=;
        b=y8D5KiUepPgDCBZ42BoSOIXOwpU0k5dg7lZL4BlaDsuXJN9iWy3zENtIwQaq6mlAbW
         PcHGsqi3sBoeVuKjZ5lzgM/qwFncJYu3y/8qkERWXfz3ZQglKejf0f06UwoCe3kumy5c
         ftaaiZYlLkg1bOkySOoND4VkTtjeFY9A6P9o+7u2yGnnCMe1cNqWSwC4CZgBcA1kpslR
         nQhFCjUyogbyLBS1rbS9RTytOZQwPkXBch32BsNZ71ggnEgxwk9kt6YrtHmvtLiogrcy
         XsxeclMh/l0FclACporZdiSxfH7MlgX0Z9hnT+q/HOv9A7nx+vK/Ce2rb88JlFU1diAl
         SSMA==
X-Forwarded-Encrypted: i=1; AKwUvBxH4A5kzV2uuBPVaG/FznB1x/jqa6TIjpE95VLy46YrNBrjtkYdBUbg8+UT7bTa8BemN0D48Dh0oKsGYfG3@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/Y/AYxgLLQP8yxjjkvNHOcTexze8NjeZHXBBhVe0yM8NY6drq
	eVuzTCZQ+vInlyuciB8zoVJjDaFEg7e+oSCZoxOyz0kOaYaQaWeCk90=
X-Gm-Gg: AYBFou3vGHD4dxGigstOsd/DUvn0I1g2PlG89XiPw5+FC002Vmyn9cWjbCyyIjI+9Vx
	OqRH27/NtmEk3F4YbVJSwqHP3vGkFemcRPxZ5P6z7J2mG7sAnRjIqMvgbKYN/C/3bdBoN9IZTTY
	Bv//ebJFMTxi+zjJgt17xJd3rtidb4jHnJN8mghwoFQe15GMkHgdzN+BditdZDn24oWeM5F2y7H
	WqgnvEPw2vKO4JN7ETuTNYJnrdyNpcp6qSI3XgTWFr2Okl+ZSDt/LJmO0Dinys3051coiRgubHC
	sfjjyhsNxnHm5dIt58OvaLICxuNqCg/cTvRFT7CLzKSZzDqsqhRfNImhhrd0ylv1ktkviKVXBOC
	2cROW0AYei7Ay5E4aU4AFFTgr1DydT9t+XNSgbmXJP3uep+22KSKOXzDT4ucupzPy+ohtybmOin
	4tiviLFT1KVGOgV+V5t2UScP9gm2nXyb4JWk2Jootqi3cQYQhU5HCDtXpDJE68NpB7xO8x3zSs3
	/bDm6WwxpWHU3v7BBwssnah1a7NSn0U+17oUHQegmV5Ty1tTMWktzWBXgjZAKweQOo92YgxnF/Y
	teCAQiYQkQYfuJX+aLiYunUZlTLZHTe3BheJR5I=
X-Received: by 2002:ad4:5fc7:0:b0:917:8aaf:bb9a with SMTP id 6a1803df08f44-917c0087891mr4797716d6.22.1790877308033;
        Thu, 01 Oct 2026 10:55:08 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a22f96sm32077796d6.32.2026.10.01.10.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:55:07 -0700 (PDT)
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
Subject: [PATCH v4 1/2] media: venus: hfi: disable IRQ before freeing HFI device
Date: Thu,  1 Oct 2026 13:55:01 -0400
Message-ID: <20261001175502.4045853-2-mhun512@gmail.com>
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

venus_hfi_destroy() releases the interface queues and frees hdev before
calling disable_irq(). An IRQ handler that has already read core->priv
can continue to access hdev and its queues after they are freed. Clearing
core->priv does not revoke the handler's local pointer.

Commit 640803003cd9 ("media: venus: hfi: explicitly release IRQ during
teardown") added disable_irq(), but placed it after kfree(hdev), too late
to protect a handler already using hdev.

Disable the IRQ first so that both the hard IRQ and threaded handler have
completed before clearing core->priv or releasing hdev.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260612103333.5585D1F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e7..e7e4e78a186a 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,11 +1689,11 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 
+	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
-	disable_irq(core->irq);
 	core->ops = NULL;
 }
 
-- 
2.53.0

