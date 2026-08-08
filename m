Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4456141754
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786195011; cv=none; b=Rhv4ONUidKi78CavgF0xAMOhBY60t9bteGBrsDMglfLCQwBMFmOKnB0/6emc/Ow6Om2vK7Qw2BC2NQCRzQw0+Ixt8v8KHiW++05ei3Q4o3FCyyTyDoFLp6V4Mm+sMvG1+u/ZYEzJa1/lQ2rHuO4SO0WiQPy89GkdX3xDhCUALag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786195011; c=relaxed/simple;
	bh=TMYGCPWzWxNWnWnXN5IMnP4GVuS1UaG4vXqIdbqa/6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kXhkxYXXLHuQz58B9oD2nggSUAbOK5hkkcVRNShjYhJUgvfJuT4B+CXZZwNf6fMoClmc7FFDgXiCZA4iF/hbaqXkxPwRIBHBI0azk1Y7knVm1tB34ak3CLMImL8cq7dNMM1Pj60RyOdwgkC391QPct0f+hmgjmoZ1QevnR5+QxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxmTsUcN; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxmTsUcN"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso460841a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 06:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786195010; x=1786799810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ScR2OWx8A6oqcrYtXEp2YggGcFi1+8jFkpl9OoPWy+g=;
        b=QxmTsUcNhSUxb5SLxY269jXkQf5RzF0USGAxymK8Gpl2z3eOp47dvT5w8HeGXtxQK2
         w6l8I3EShn3C8NCi2YjD9gNeS93m5/3DWkbyfx5BE+iqOP0JlB9CMyN9+1hYDz7eEnWO
         bXA7Kwhstex+LKQ9DC2MAqxWpWfQtBm/C80GmAgnS7pWHK5RDHv7HkB1PrFZD3uB5KR8
         +UkTAusjmhKdO+1p+c89f8pJNms3/ftihQ2gR0yn40Lb+OWCZo6+um0KNxnyOCBzOwa8
         +3+npu/9cMoiOVydP/LNE9heLIM6aaDnAw0KUoG/Mk7uO0o3ycc+dHzFqJlaSve/vMCo
         y/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786195010; x=1786799810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScR2OWx8A6oqcrYtXEp2YggGcFi1+8jFkpl9OoPWy+g=;
        b=qn/MhxqLAIpvTgF0IqqjGgJc+8gJZZ5gCn46w3PAjtUcXFwn9ZWXUjXX33G35oRPMe
         M7PyvdJ6c2omIR4zmNs+2RXJgcZWjSHMyUuKL1TfPgS/tNuPRwUd6WHF8zlSZBRfDRMU
         yT9at1oESTNyi9llsAW35Twedyfcr4Hd8i+weQShClMNzaya2RzHoalRJZUFA4afJlvf
         ff2KmPAK3p9EzSl4NBcX8vTL0QpBkWiF7YmGxCIzL082xVZMy4/k22NwUjk/6gwATxnR
         e/I/+X2XklWidJhtd5sojGmaslrTNyay+fzE46vS/5YV+91lPnta8O8g5JbdLAuZHiLW
         BPmQ==
X-Forwarded-Encrypted: i=1; AHgh+RprRnIxQNuaytGJm+IY4xr9NVieZsFNgzsl8ziRCJHUBVPTzlZCoic2XHPjjK5i7HpwOj+7QZkVcZyUCWgL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywej/5Tiq/bR3WsvSjc4tO9U+sGONCHVT/kKxyJLP/+8StjbaeQ
	VZZJzU7Ga35uWKAieTNeZO9uk7mabJNdgm+L/c9yHOEmJHOErkRISXjJ
X-Gm-Gg: AR+sD11uNUeoRYcbONbunHHMmDl6WPhcg+XK64gRi+sNNTW1NWkGKj4CVvMdSVX80TV
	LDqMvnb8PxsKR5Coa48OOBNa6KiQOTeV8mdBGqeXArNIgJhm4/IuZWiHW/mLnkcE20Erw/AGHS2
	l4xyyK8TelbEFoIzFfB01dUG4mDBBpVEW7Dd1Pzb/JfM0L2zhXG30ytI9eeNj/QfWk2QyNCe0Q7
	0DIRb9kVeoREjAqF9J/burXhCC9za18Rxn1fdHp/7hnSoCO3GLykEQ54wrNk7ami/Px5gm0aVWK
	8az2vYAwgo0knYhRkhuKxLfTRb26GbUg5SMfWwfQkbmsWXpApt1vkRp+zugPOyK6T8jDTrurNGm
	8pOr8JwuhtH2Tk4sf0fHWWwG34sVrvkTA+2/+vVBg7SHwYnKFZiAYVmTqgFKXw7/bGiLEbilHQV
	D5IVb2Zy2ub2HrnOVBJYUwzf7NwtQyZ8BPqECgVeSCKoImjg1FEw==
X-Received: by 2002:a17:90b:288d:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-39261ff3945mr13138690a91.9.1786195009547;
        Sat, 08 Aug 2026 06:16:49 -0700 (PDT)
Received: from lgs.. ([118.193.33.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fd95c40sm6170661a91.8.2026.08.08.06.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:16:49 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/msm/adreno: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 21:16:24 +0800
Message-ID: <20260808131624.2854412-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adreno_gpu_init() calls pm_runtime_use_autosuspend(), but
adreno_gpu_cleanup() does not call the matching
pm_runtime_dont_use_autosuspend() during teardown.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

The documentation for pm_runtime_use_autosuspend() also notes that it
is important to undo it with pm_runtime_dont_use_autosuspend() at
driver exit time, unless runtime PM was initially enabled with
devm_pm_runtime_enable().

Add the missing pm_runtime_dont_use_autosuspend() call to
adreno_gpu_cleanup().

This issue was found by manual code inspection.

Fixes: eeb754746b14 ("drm/msm/gpu: use pm-runtime")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index c62c45bb0ddb..29c59899fdef 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1252,6 +1252,8 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 	for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
 		release_firmware(adreno_gpu->fw[i]);
 
+	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
+
 	if (priv && pm_runtime_enabled(&priv->gpu_pdev->dev))
 		pm_runtime_disable(&priv->gpu_pdev->dev);
 
-- 
2.43.0

