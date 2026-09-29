Received: from mail-lr2-f1.google.com (mail-lr2-f1.google.com [74.125.230.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC13CC7CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 14:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691681; cv=none; b=jCOVsQrVF02K1RgCmWV6fa3vO/V+OPuddjLQUaN/630f/83FW8ahEp/MbYxsCqG13NW24i1ZsiDOStAhalG67Mq40WoHRSglNZJBjOs2nyry07Y+Ac2m34qGs+dFQUqtu+iHrsChko8WZ7bJmeJa7k4tzKIkB1rf/VGob/+AYbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691681; c=relaxed/simple;
	bh=u2peBFtCnaS48tRLq75BL5c7YmE04xPWL+26QN56leM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ux+A/mtzSqBTKXK1HAe7Djm/8BuD8irOxz2FPf58PDyv1OSiVj9SHNVa2aKvGLQ5HdqolpmlBsviZ9Gyy1irx17ADPzpPdCP/3507ctPTrnEuXEUC+wTUfFmFcnhnZNuE4vqU6WgZQPSdD035yWxTMStXyhrs+abW46OIZiLq5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRWMhbY+; arc=none smtp.client-ip=74.125.230.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRWMhbY+"
Received: by mail-lr2-f1.google.com with SMTP id 38308e7fff4ca-3a64f8b0e43so27623801fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 07:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691675; x=1791296475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTXKKkjD2DPm867cDZvzjVmhgplcLwudkdm5kHSl/UM=;
        b=MRWMhbY+NqK8UWUgeViKnikGvovGYIjWxkE4N02QvvOLh2la/Bkc+Xdv5+vDCehnzd
         rAzM4ytk+RoSIXktMg5M3OaAj8sdg6ZfLibRv+wsf4Lj6ZWeDddXZ0RTJ4LQn4p8t/MK
         PqZrIuF9fIHSq+wc0eVkSbz2i7JvogVZjX0hziIjAU7+vnUQ9OU/Bn0ZWZ7eBvFNHRY6
         9DXuAOsPnv6YADChCTT8bGxONBQwobHhbBSZKV7NG80eNcQvekdi5wAm9gQD857X17CV
         YIVcgyT9u5pm9yueUyeE19iczIleSuHLKeDZL9DC/gXEZr64Mnt9qftYn0dbl36Mexam
         q8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691675; x=1791296475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTXKKkjD2DPm867cDZvzjVmhgplcLwudkdm5kHSl/UM=;
        b=MqN33tAK6ZvFAHPGlrY9zeVW3L/2/zysM7pvrbGpOEd3gZIct7lNS7MJG8QoMxhURc
         OnY/D1pJHrdTAPsUlQZuddsmv+JqIkVIP73VpXLvthQ55rk8OrAHoOrPf1U0h2sEX2b/
         8iBuFbPohF8JCSWy+iaIPpi5c5KZs/c00D5pkbv9nKAOOdVjbQfCDwexB6rGTDoXgl8M
         K91+2nzPSOXYuqCRZRHDm4RNk+1ovX51E3u/z6T7/xbPjYnJN3Ma1SCmqw/eVnzRiWVe
         xEzi/OcNzJd7k28MVSGsRWgcOF1aq8BkLTC9DohuIgneZk6vt05v1VLM4lcXdaPYJiNh
         a/IQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7bOk0kTq49BjqaFrVffJzalgKDJGRSsFwmEJJDLc2jqB/dfL0t27N0GfT+4VwhMvMBDF0uZZWxzvxIyKb@vger.kernel.org
X-Gm-Message-State: AFq9FYLdD/y70qK+nJWWCH2aNAatrfjPT1xeKRu/5Pxs1KRZ6dYcCzAr
	/nIU19JY1Zdp5fWD8c5V3/Lfmqcn5+lltHVWv6d3KSihbQ5BThxjYQnT
X-Gm-Gg: AYBFou3jNXINBNQyf22k0VaBcHxxjuZNezf4DWfG3FqLZ2+49+2lCkAy754kfxNyMbe
	nMIGIJ6XLWByP/QXlz1Fy6JybZ2NjhxcbpxiJ8vQAlZ5jc/cmnH0ASH52+3W+lnYLpqMutBVZN4
	+ZSKZ1sjmiAQKEKkakLo1HvwLU2TyXj5kPbq5eYkirCsXvqejxjFXy0qdBXBRCTYn9UeHh04ykg
	Pfavku6/k0p3ijhV2qVIzd6I6+HDVQ5OrDtOpgNLueNjWBGWqX7D1IocQN+wxKn8Qj6JaLS00EM
	tQ381OKp4Gu1707/QdPVssmMGmLONrCX49DYgA/LFNZ3rQmAvoZ0paOt/d+W1LyqP+P9lqMVG9O
	CSn7bKXJG9cElo/T9Zkg1aaY1TebuP9TT3T3qdb0tS46CrULeAe1a0xmEq+LSpFt6J6Rs7Nc4t1
	1QQ+rOzrPgDKRtiRLt24mMOINXcA10vgt+uDihxZIwjWt2Hpqd0TulnaqBHIBdbT+vgHMxR2i/R
	F6aI3bpd8oVh38dwgdc0h2bA9A=
X-Received: by 2002:a2e:be25:0:b0:3a7:5f55:5e00 with SMTP id 38308e7fff4ca-3a75f556084mr13204741fa.9.1790691674420;
        Tue, 29 Sep 2026 07:21:14 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a76a503af4sm4538631fa.33.2026.09.29.07.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:21:13 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
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
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v2 1/2] drm/msm/a6xx: fix use-after-free of OPP in a6xx_pm_resume
Date: Tue, 29 Sep 2026 17:20:58 +0300
Message-ID: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OPP reference obtained via dev_pm_opp_find_freq_ceil() is dropped
with dev_pm_opp_put() before being passed to dev_pm_opp_set_opp(). If
the reference count reaches zero, the OPP object may be freed, leading
to a use-after-free when dev_pm_opp_set_opp() dereferences it.

Fix the order of calls: first use the OPP to set the required
performance state, then release the reference.

Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
v2: The dev_pm_opp_find_freq_ceil() function returns an OPP object with an
incremented reference count. Dropping this reference via dev_pm_opp_put()
could cause the object to be freed if it is concurrently removed from the
OPP table. Fix this as Sashiko AI <sashiko-bot@kernel.org> suggested.

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f9de9329dee3..c827986951cc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2177,10 +2177,10 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 		ret = PTR_ERR(opp);
 		goto err_set_opp;
 	}
-	dev_pm_opp_put(opp);
 
 	/* Set the core clock and bus bw, having VDD scaling in mind */
 	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
+	dev_pm_opp_put(opp);
 
 	pm_runtime_resume_and_get(gmu->dev);
 	pm_runtime_resume_and_get(gmu->gxpd);
-- 
2.53.0

