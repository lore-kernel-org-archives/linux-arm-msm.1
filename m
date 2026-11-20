Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202706;
	b=xzuyWHZX3oCeLvYEeYCTx1IKp7OaFDX91IrvekqHPzOohpCbxkISN3yo2um6fM2/moMw
	 kycxChtMo68mD6HCs58/Lym9PkoetwdVMZtj2mfKvSo0czlO/3AjajIXN634YAOPp3g/L
	 s5oqgmy5z4bzANltwByvN+Ds5HuQvS1B8lvL/mIzswCZMmfX5Z6gDGtqNsvxENebofQYX
	 fu7Ux4QdWC+GceiIE/xDFufP+qWAK71kkPfo7xCWZra910gnqXFAYSyUlS0+BnKwxnlCK
	 +OjitkfQ0MI27PflX+pNwCu1dwVqdq8K2DbBlbl6aWLQN38gvhc3PNrR8RJdzfI8wPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=GM6kjUvXbDa10d4WZljkBFVBHg4IBJ7Pu0WqJwPjtL0=;
	b=jNYtDQmXtYRvLJc1Ng+pghLL12JaS5DkQRz41CVOA8cic5iNuRJJk/JeVtAGFVyP+yRH
	 PobzZGve4Yjyc7ewjxifZDSqnOWO15r7SNmNqJvDK5plHZdANU1YpZZduAWB5srTdZ1eS
	 Lo5mUEBe2/XJiM9v8ka//gD7/Vh7mZApZ9tkLVKRN2RkS5CgSbvwKh/HxZn8UZLNJ24yJ
	 g3+6IdNdObzZSGAdKWt5MkMmbinsae/e0XOyJnKTcoxNbigOdUkyxJv0YEe7qfwYnwuat
	 EkR5ijQro24kEmSiX9dyz7CSq+ZBS3AiMVpdHAYwi/pgbwzHsLsi1ik0qIPNLlDOOgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c45vwFgo;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69100606A6F3
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69100606A6F3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c45vwFgo
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3ae17c536so1202273c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202702; x=1795807502; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GM6kjUvXbDa10d4WZljkBFVBHg4IBJ7Pu0WqJwPjtL0=;
        b=c45vwFgoDksr5mTd+mDOLniVOU2upBOW/mtK1tOzkrAEmY0LvGJ0kz++/iZj3Y9hE1
         EAqRwR1cbzZjsk+1JBgWXkzhk2Mr3HbYsIly9wWceZtJRs7c8wPdbsXdf53O5Sx/3lhY
         x0RfazScfvrJBGgql+/+9ka1Y2SU4O7gqvoHkA3oT6ee99u173FkTiZOZx3rlZJsOEC4
         imAteu55I2b2+kM1w75Wml6BDepkNFiYAcPWuk+t+hvtSfHmi17vmJyzM5n+mi0wa6qR
         N6+JrzNvq3uTtFVaOmG4aUEFN8+RKzR3pjXGdS+2xBMesnhSk5KU7uvdyaaBszdA/qvZ
         D/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202702; x=1795807502;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GM6kjUvXbDa10d4WZljkBFVBHg4IBJ7Pu0WqJwPjtL0=;
        b=GOSa4Ex3bhj6moE39SdHBav+HKFvJyu/Aoya9TYMEoxGP07RDA7aBF/SkIRF1NF1Sy
         QLHLDHqQqEzcInQ18yGbG4KxL+RX2tw+wW+4EduwKObmSXNdSFpBCdUhYN7jGKRia1g7
         Dw7u2if87DIH4SGEwVF9/SBJFVPPIid+BAhBiI6sZ+A++Rrg2vGmPquPod69q82DCWS5
         LbP0mDA75XCQwC/Vg+6kWvN9LCVQ8MuU276hMRVfNfHuA5H9qKukiSoEI6e/7DQIvScx
         WtGQ39RPnHs7Gv6hLrQS291hVruBIpe2D8tZ/S3vDG7fl+hAlH4/pB7IZP8uefQ94wyr
         cDLA==
X-Forwarded-Encrypted: i=1; AL+hErG4i08iQLtSU6cl+ewZV68AcfWoO5EenkZhElJIGM9v/FRxV9O7j4ejQ1ygPQxp0BU3IWLD2qks455qHOPh@vger.kernel.org
X-Gm-Message-State: APuU4Z+xAZpTR1imwUqNgNcqoLWKj90vthvpDuN56ZRTCyEEZWCoVCL6
	S4nx6tm44zrjvvC07mPRwVEAiYwZKB5JTxtYEjDxHZ03hgg8/MkDJ8ZOR2aIZ+HIMyRnr/mYgV3
	i8w==
X-Received: from dlx4.prod.google.com ([2002:a05:7022:84:b0:1b2:63d2:5906])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2608:b0:15b:afce:62c2
 with SMTP id a92af1059eb24-1b55691337bmr3351862c88.41.1795202701742; Fri, 20
 Nov 2026 11:25:01 -0800 (PST)
Date: Fri, 20 Nov 2026 19:24:46 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192446.2874087-1-elkin@google.com>
Subject: [PATCH] drm/msm/a6xx: fix error unwind in a6xx_gmu_wrapper_init()
From: Elkin Cruz <elkin@google.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

a6xx_gmu_wrapper_init() has three error-unwind bugs when initialization
fails before gmu->initialized = true:
1) When a6xx_gmu_get_mmio() returns an ERR_PTR, goto err_mmio passes
the error pointer directly to iounmap(gmu->mmio). Jump to err_clk
instead.
2) When dev_pm_domain_attach_by_name(gmu->dev, "gx") returns an ERR_PTR
(such as -EPROBE_DEFER), goto err_mmio skips detach_cxpd, leaking the
attached gmu->cxpd domain and its runtime PM device link. Jump to
detach_cxpd instead.
3) err_clk: drops the gmu->dev reference without calling
pm_runtime_disable(gmu->dev) to balance pm_runtime_enable(gmu->dev),
causing an unbalanced pm_runtime_enable() warning on the surviving
GMU platform device across -EPROBE_DEFER retries. Call
pm_runtime_disable(gmu->dev) at err_clk: before put_device(gmu->dev).

Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
Fixes: 15cc59ac954e ("drm/msm/a6xx: Add support for Adreno 612")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index a1561ca41a5b..7f6932d7200a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2290,7 +2290,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, &start);
 	if (IS_ERR(gmu->mmio)) {
 		ret = PTR_ERR(gmu->mmio);
-		goto err_mmio;
+		goto err_clk;
 	}
 
 	res = platform_get_resource_byname(gpu->pdev, IORESOURCE_MEM, "kgsl_3d0_reg_memory");
@@ -2321,7 +2321,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
 	if (IS_ERR(gmu->gxpd)) {
 		ret = PTR_ERR(gmu->gxpd);
-		goto err_mmio;
+		goto detach_cxpd;
 	}
 
 	gmu->initialized = true;
@@ -2335,6 +2335,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	iounmap(gmu->mmio);
 
 err_clk:
+	pm_runtime_disable(gmu->dev);
 	/* Drop reference taken in of_find_device_by_node */
 	put_device(gmu->dev);
 
-- 
2.56.1.750.gf70dc682cf-goog

