Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809660;
	b=4lQJSHknMi2eVvM6dFDzsH6VhvzsHLffeIfGnl287BwsVNVPhen7WeG2TXj+tDxUi4A4
	 EGr5E6Ru2b6tKOV60wTahkbLq9vL1XvLNw1KpGWR+rcDmCai56FRqGBTd8tMR1q4CtV7C
	 dnOJLkbi0bNM3qELt8swuV0bM/AWV7CNdNV9DSkuZ40X2GoYxSy2gvku4lCMPt3V6B99h
	 eL6X5ViDlXFoZIzG7r9Lw4eVq+D1Wzn2hB1mglwoGj2SS8kKdRZPOO8urRCQQ4VnZmL5T
	 an86hdvGH3librH+0XsdUuumDxl8ZZ2xcrzmvUkbHGjMtzU973Hel/iXVzVy+aehLMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dyxLFL3v3aOd1FtHeGOANRa81M315sVflTjGuyXXt9k=;
	b=H8Iq/AcRoVdy9kQTzP0pruXbWo9ShK5nKPvuWR3hZhH+yBWjp59JJF7vtChV5Sc/G9sw
	 PKxfpwAyUcPQG4I2TJfZlNfJADWYcE8HQ5QnBiHtMeO2BW3x67VCGhZAoUc+wuYPgd7se
	 KwHyVWeTOl2c+1bkDhGl7sEZiLfvsnSC4jZCucPp2aFjdUP/JETLPwCOJTtZ03dZ+p5BE
	 IPAPJk8/2aHXEgKpmWujVLof9I9wrOqOYXtPdR3M7o51lnntgmelektoi4cG8EFMc+/Y5
	 KJMyFVPHhne1IXP07IQ+iFJfCIwFuBAmuy6SgRqEdyC003MagaqefCCuJC2DtoYjPeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b1jx1KTN;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597DF606A333
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 02:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 597DF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b1jx1KTN
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91b9e758c50so18845186d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 19:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809658; x=1793414458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyxLFL3v3aOd1FtHeGOANRa81M315sVflTjGuyXXt9k=;
        b=b1jx1KTNxpYtk0D26oCx4jhvPEk0vYhRmZpnl5znUQg3qNFXmRrBjJntRKJJkfCVd1
         2FUP06UB8zo808hn+ke+HEmT7VKYpChDPP4k25cPQqi3apwjTmsXZLyIDzjo3atPyzKv
         t+5oLTjVY4ZQbtq+fpS8jBEfXV/SL7vMIMNhNnBn4BKwC59MO0zyA28u1heY1u5bpY0B
         Wc4qiqBYIUTmpfOrrx/lbiUihMi9lZnExf45fzvqXsIPXEkXWn90UgAGC1wn68+cP0Rm
         0QWgpcYEc+7/0FuxPVsPe92Mjk8lqo9J8OdFoXhFgOOJZj6BJAhykZ42RJcld0v0MZru
         JOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809658; x=1793414458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyxLFL3v3aOd1FtHeGOANRa81M315sVflTjGuyXXt9k=;
        b=g9qzTeg/kG/brN2v+D0x/rD4LwoNq4GnLVUZEkQfYUaK2WFlFD0+1FwTOWcZiRXhwl
         ShCS/YAe4ZEzSRCdcTFHK2cw1wuNoFQAIz5oze85GWj9lvdV+S/ZLK9in7XJrp1jDH+J
         QtsEyKNPnAMTSBnF2f4+BzRXaY6WGPbFXUPSTNlqU4sQnOchnCmS7IK/MYFAOrvtuhSx
         vvs0LvkJbU0RuY18eB+xEf5bFNkmuwIGTX7Df5dgpDCwQSK+wZWR/dXRLe0Dv0Tkmy61
         X2IVMen6aH7wVKTUhfWTr2XsRcX1NTYv9X3lNPPKpNuccFp3bMeS0FTmcM5T/fTo7JTj
         Ssmg==
X-Forwarded-Encrypted: i=1; AKwUvBxYLf2LNnVAwzRs8atmW8Wz/92Jj9S4ja7AGuGJxBoaG+jivvL5OYqDycqjPRIV/BcO0H3L2aDTaXbYnx/g@vger.kernel.org
X-Gm-Message-State: AFq9FYLskk1j9CNbiq4eh3lI+egdzbE8hSjCxgluVSdPxQpZfHS2yoRC
	L+NBmNq2fVD3kv+iRQX9Y14HtnLpxZU9v/0crfcUgXBXZMdA26CEnbY=
X-Gm-Gg: AYBFou1fhvTo77L5H+IQYwYOEm9O2T2Iab7pRCSbHD1ohcpwq/Fc1gofom+LuPwzyXR
	VovbJQ8jkxhS+LAOu8BABU9cZMmg8y0DijErn/KCheMnV3NyYp4K54l5wklMz8lmS6rk2Dp2TjJ
	lzo3st8QM47MWrW0kb7wvD/qnQUy0u14mOla0kXyl6afyWxUcnMJOlZ0loGvxkgYAeLt5bd355x
	0LYg0Nzb09GZqbFAVn5ARELvx+r8z0Vs81ibk8S9sPUVRDmRM7Yk5sj/9ypmMzt1zXrcQm2ljYR
	wCrnIDyfK8Hq7TNr+9wRivxUIyFEOCMsauZVNn1nTo1uFPA27363dbA/WQe/9n0zeeTFj/lyhrz
	FXKUII/NnsGEoE6KiABEW//i5G8Euz+ZEGOaLErsQAoNgahmYRnzn/jKVg7NuMsaYse/jRt2hu6
	UXj9ZkIHRvunW/mNqmKukfAHehvtaUCz5qwDuGFhRjJOnJSfe9EPOH4VUlIVxMrFPz6iZTKl6/b
	1cwKK1dIWibgNS63J42gay3RIZ5X3p/1CSLwDOytsEeNecX+grb9aTOk7srOTIRMqmpbPfBMOH3
	sS5pfRhHguLtlhLZzc0B/FMNqoHVWD5lUgR7G8VY39pbGO9Hxk/NoWRCGDfs+n70/8tXsCwO39P
	GJfJIwjLgpuI=
X-Received: by 2002:a05:6214:d62:b0:917:a7a5:af08 with SMTP id 6a1803df08f44-91c48f16f2bmr13423826d6.25.1792809658336;
        Fri, 23 Oct 2026 19:40:58 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c48feca9bsm7203526d6.39.2026.10.23.19.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:40:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 2/2] media: venus: disable recovery work before HFI teardown
Date: Fri, 23 Oct 2026 22:40:51 -0400
Message-ID: <20261023223635.3c895c4752c4-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
References: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

venus_remove() cancels core->work while the IRQ can still schedule it.
A later IRQ can requeue recovery work, which may access HFI state after
it has been freed.

Use disable_delayed_work_sync() at the start of remove to drain recovery
and prevent further IRQ or worker requeues. Drain the work before
disabling the IRQ so recovery can finish completion waits that depend
on IRQs.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7087af32060f1ed4190bf9f5d4a58cf88dad537d..6e495bc046913b46c926a498c062a6b55c6f7b64 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -596,7 +596,7 @@ static void venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;
 
-	cancel_delayed_work_sync(&core->work);
+	disable_delayed_work_sync(&core->work);
 	ret = pm_runtime_get_sync(dev);
 	WARN_ON(ret < 0);
 
-- 
2.53.0

