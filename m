Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EF83C1D6F
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691689; cv=none; b=YBvd2ruzB1Xz62pLckzGgbRjUj1jkhfkjshaoAmBMFMeGxygn5VjBj+i3uiitucaVRjr7ChL09R8yxAgUE5yjZVaA8ZzLKP362e4HtyjKxCnkEaFqgfwTXWbHQVp++tAkEsD356mK3UUvM1QdZN24t6m+EWzXkez5+9FN8shYXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691689; c=relaxed/simple;
	bh=kh+eVckj58ICHx2pcEO7VkoBdGTerhu2jcp6is5w27s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5N7WohSZ+jfrwFsmOuNMdiiXcTdL8hAJu3AFELHLnh1gPMhM4ElXweJngMmfEj2IeOSeRMtGH3VFH6G+CM4BOEhQJVTpEf9uGJg5BTQUFeTTQhxGgzSYP5yVpdhyT9naDhQaYkTZFiLewdSmG/e2mVdADNJqroFLvR2lGDlekI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dk6iB8NH; arc=none smtp.client-ip=74.125.230.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dk6iB8NH"
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-3a49e9e7cd8so32063781fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 07:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790691682; x=1791296482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lftI/6ehzwzDEr+70gWwS6iuo2yG+lmF8bwoB3kKEVc=;
        b=dk6iB8NHFICki+AxqO+4aTB6cBhBO1XBsTXToTYOEJN7lb+l/zynIqP+YlBG7rgpg+
         3nx3PDC7AuxjV6ZawMc6yEnrt2sVY1HdlwTMDs6IH61BR5fQpccUBqemGb5Van65PXIG
         +26MjTDjHFzx8qqe7XTaAsfrniJ9yCjuDBZKDKZrtWe/efeXe2fcXBHQoImRAvARqYer
         La8DLo9AXf6xBP9qkgi22da/LjTVV09vo9KELsum/wTGMkZgrhvepRwUkBbz7jJWJCiU
         M1dXMIUoRGQf6toBgU1113r4Q2hE4hDGtdJO7iTaQ13+3N/QHWH9ixvP5jWzfIf9jaQo
         dJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691682; x=1791296482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lftI/6ehzwzDEr+70gWwS6iuo2yG+lmF8bwoB3kKEVc=;
        b=VG8XN6BISYAQxEklWP9mwJgCdW8mQ41HeVKgbwy8/o/VLgwyvFUH6GuAKiiGkWo5J+
         OnC+/OV8FkMRikxr0e0NTiRFlIFZhCvA4sWrkg6c4zOtmVeJgexifNaNGP5XC8pg25cp
         lWM41wsMxyE15UK8lsZIu5I3GkX/clgJ+HNwd+pb0EZ5nIL5+MVDR09avcqeLTQcJbqz
         vYKlzKx56vKId95ynP5GMJi8QqQn2nTRUjHT288J+anzO4hzYIBov4MyECeq0bvXDAZK
         NtTkgSGdvdazL77tuvs8pe6ugFbAxfXEspbSPpmiaMfFmhpIGddJ47gnOX64vL7GphJJ
         xdKg==
X-Forwarded-Encrypted: i=1; AKwUvBz0tvbcO9MEf3m5CU+ePSUI6f0Cqkc1ouyAAxXM/mAL4jFdO+7DPnOzYIvM1yQSVFM1NCXrT+RewXyR17wX@vger.kernel.org
X-Gm-Message-State: AFq9FYLwU8Di5Ae6VkoVGk752Gpw3Ub0lAEqg91tDvhDA6cw2CTPe5BB
	plA8TjvW1wLnzJtU2l0mqK3feqU7+Rl6pg8CfRKrJXu+hiTZ4SFSZR4V
X-Gm-Gg: AYBFou0FwBDJYATQAtmiz246H6Vik8tZd1G3k8UBIjPGpE1jydSEBCrVNlzK+e0rkpC
	BnvWjwbeAIlSuD1w3//FdZhpUpFSWmwfJqhCm7ybJ3PO9Kj9Y5EQIyDknXuFR13p0ug1sJoDCC6
	CitBliM1GD+fuh9IYE/1FtNHEWNmIsGNH8j+RJ+bs1VyfmWbPTSLa30yVUOicCeVvLyEYcA1AG6
	MimhTYJmGUvq2/YWGEg9gpNgloqQG/pm/RRGDDOwV3DL5SnCaENjuwmif0W2f/k9aSWqBoRRVRC
	wSshcDVdFDgSx1x2TQmYas3cbMlThvwSk0TtjfRacN7RCqH3kofMQHuqZfENg+RjkouMOtUFv5e
	F8jQ8TvdYbLGY9F5+O1DyqJhR7BEDWwp94xd44Xot+VSGVpYYF1Zfho+jP5PhFXbkg0GlRL7Wjp
	Q1K7aqQUga4CH1e81MGP1L0NdmSEBQtRLB1G4ni1zXR9ztnKEklx8cQA/lUCabJdGkYk3yjErzR
	jhwCc1Si/7pn5ML
X-Received: by 2002:a05:651c:2212:b0:3a6:6282:563e with SMTP id 38308e7fff4ca-3a662825decmr21779281fa.4.1790691681393;
        Tue, 29 Sep 2026 07:21:21 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a76a503af4sm4538631fa.33.2026.09.29.07.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:21:21 -0700 (PDT)
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
Subject: [PATCH v2 2/2] drm/msm/a6xx: check pm_runtime_resume_and_get during resume
Date: Tue, 29 Sep 2026 17:20:59 +0300
Message-ID: <20260929142103.81854-2-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
References: <20260929142103.81854-1-roman.demidov.nn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return values of pm_runtime_resume_and_get() calls in a6xx_pm_resume()
are not checked, which can lead to hardware access on suspended devices
and PM reference underflows.

Fix this by checking the return value of each pm_runtime_resume_and_get()
call and properly unwinding the previously acquired resources on failure.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 38 +++++++++++++++------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c827986951cc..a6da448ee6c2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2175,44 +2175,48 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
 	if (IS_ERR(opp)) {
 		ret = PTR_ERR(opp);
-		goto err_set_opp;
+		goto err_unlock;
 	}
 
 	/* Set the core clock and bus bw, having VDD scaling in mind */
 	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
 	dev_pm_opp_put(opp);
 
-	pm_runtime_resume_and_get(gmu->dev);
-	pm_runtime_resume_and_get(gmu->gxpd);
+	ret = pm_runtime_resume_and_get(gmu->dev);
+	if (ret < 0)
+		goto err_opp_clear;
+	ret = pm_runtime_resume_and_get(gmu->gxpd);
+	if (ret < 0)
+		goto err_put_dev;
 
 	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
 	if (ret)
-		goto err_bulk_clk;
+		goto err_put_gxpd;
 
 	ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
 	if (ret) {
 		clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
-		goto err_bulk_clk;
+		goto err_put_gxpd;
 	}
 
 	if (adreno_is_a619_holi(adreno_gpu))
 		a6xx_sptprac_enable(gmu);
 
-	/* If anything goes south, tear the GPU down piece by piece.. */
-	if (ret) {
-err_bulk_clk:
-		pm_runtime_put(gmu->gxpd);
-		pm_runtime_put(gmu->dev);
-		dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
-	}
-err_set_opp:
 	mutex_unlock(&a6xx_gpu->gmu.lock);
+	msm_devfreq_resume(gpu);
+	a6xx_llc_activate(a6xx_gpu);
 
-	if (!ret) {
-		msm_devfreq_resume(gpu);
-		a6xx_llc_activate(a6xx_gpu);
-	}
+	return 0;
 
+	/* If anything goes south, tear the GPU down piece by piece.. */
+err_put_gxpd:
+	pm_runtime_put(gmu->gxpd);
+err_put_dev:
+	pm_runtime_put(gmu->dev);
+err_opp_clear:
+	dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
+err_unlock:
+	mutex_unlock(&a6xx_gpu->gmu.lock);
 	return ret;
 }
 
-- 
2.53.0

