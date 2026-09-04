Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAD8492502
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 12:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526556; cv=none; b=SQvmBG3khxeLirN9rZHzFbpo8KtXvwQWurIbq8twn7LD2twoFWdt1mN8Gso5COVsX97SatCHA8h1LfogoDd+W0hBurajXNJKY1zRERCIfHoV7xX2oTKFzyIBta5112InHLJskVvfSIBGGfLest2QsnmF7uWf5MBW1NLm1UjjoyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526556; c=relaxed/simple;
	bh=0F7XUZN9os5wZQ14PTPyoer3FkQnqiZfXaCAGTl7uaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4qM4cgPrLT3w85h3s+kUB79G3+5n8zX416Lm/RoAFqqS+dZs/EiCKqOlfpgEQ3kQDFuLshPIvoPmSC5NykpAJ+SDHrEFjXoJxmLwloRHrzV1564nbZQ4eW5ohOErH7taQGYYip3GoJuNuzWk/lMX/FfwRr40pCwPQGANZa6bH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaUaeBiH; arc=none smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaUaeBiH"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a2ebc73ee1so6199171fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 05:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526552; x=1789131352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B8bbaT/K4F9QIRkgiCQIzbuZJYSHMTac2dqp5kAWa+s=;
        b=TaUaeBiH15L/21pvf56UeAanOnPLFTh/Cdexw9+73rgXrcnvwaB4G+T2X1XwCpbmlG
         YiOKwk/4+Z+TrSDHxlOi9OKjanpRrJygeJFvS7W4Bg+HEF/H7n6UpBxm7tDZfFTH8PvP
         GQDEpX5Oo+8JO5ttenqWCFRq4hqfZzepgkqNNv0/760V0v3zrdNJFSamr9qJaucLBo7v
         O/ie2PWT6EylzMuwx2iKz48dU5bpIciNTF9wZ5zP+0ve6LK1+35QBiQuwTmB36YxpTZK
         3bQ7PocI3KuVu6+6gEoUP54N3HE1jntV8RYzdLFwIL+emXAWEDX6UAcUBpGfTfO0oSq0
         x9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526552; x=1789131352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8bbaT/K4F9QIRkgiCQIzbuZJYSHMTac2dqp5kAWa+s=;
        b=UtNmSw/kJDXrCXudA/s+kjnrrYOCvhIXzS1kdJhVN6p8bwe9F430MON0jii33EyvkW
         GHFRKJrqmtjwpTMjh/8R1PNFic+D40+kGrxhsG27J+mdMCBazIrlnn6cyClTNwYz/gYl
         cM/m5gBmskPPoVyhLkznE0KzXF0NAtd5g6wzakejYHCLdCVKA5vRmotUqQqIyvLA1QA0
         VA4EGwn3dD5ZAYBHhdzC9wIgSquV2/7bpEKhSGrx7DT7UJj04NIcDXtENYA98utz14TW
         uMHNqxtroF3fbcb4Ng4yuGprjHBWQob0QrdHJ4yo9g2XElKOv4dOe08xK9SWiXl7MwVI
         FPUA==
X-Forwarded-Encrypted: i=1; AKwUvByJCZYxZ8yEZDxEn09eCRWMDz9lQksOL981jTtuA/hkY3PMr7YXjqRly7NddtSHJ71Ad+LzswTF2d3RDHZn@vger.kernel.org
X-Gm-Message-State: AFuF++mgXi1LLe2RvJAQnBG5JeFo/9MPIurpHglKLyrUH7wZUEYA2uL+
	8AZRjyB6GeTEHxEkT1IhQOgDuLwe5Zfku0cAatKtkwhlHgTD8+zZ8edB
X-Gm-Gg: AYBFou3nMcJsRDiZzX4g3BCTFHk36C67KnhcrSmldHoBLgGLM2SxOb5OcPk1nFY0LRC
	Qsmocy0eMND/1qFfbe/ZCGDztqvkJoJ2zjov9OQcmPj6veYn81ohM4BaB9wMs5Imm1Y77JQrjYj
	S+Cct6j2JHRsXSW0OxecMxAT1zb8uYqAJxCYHE/Tfz9BGt5zwpnt+1kWAuSBNzySJRwHnxKJhF8
	GOwrGjuM0FbyAR8pZru5du8moEINkdKnk2sUFWawfOSU2L7tiEbzjooSAyHcmixfMwT/RPe8vp0
	FIWX/BK0N0ERK/6ewtVa/0ZrGLFtG0KqXDja0kMD5CgrToi6mXP08cdN+ZaxfadVigRXLAyLoZG
	LPF1pxdg5sa6P8m83jncpmZQ4rZ7VLR9bqy430h4fMWg4nRJRkEDFqlEr7yQTA+KWrgmjI2XJdF
	JDA+R4YBiDlmCc31DgAmjvJGoUYRNpqWwbXDelZWiaDL3lQyzG5LgvZcwCnnK/iemYtm9uSNIOt
	aVmUg==
X-Received: by 2002:a05:6512:3502:b0:5b0:23b4:be97 with SMTP id 2adb3069b0e04-5b616ed4b1dmr1822141e87.6.1788526552231;
        Fri, 04 Sep 2026 05:55:52 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61669aedesm524025e87.10.2026.09.04.05.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:55:51 -0700 (PDT)
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
Subject: [PATCH] drm/msm/a6xx: check pm_runtime_resume_and_get() during resume
Date: Fri,  4 Sep 2026 15:55:21 +0300
Message-ID: <20260904125523.43813-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
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
index f9de9329dee3..0cf205ea744b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2175,44 +2175,48 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
 	if (IS_ERR(opp)) {
 		ret = PTR_ERR(opp);
-		goto err_set_opp;
+		goto err_unlock;
 	}
 	dev_pm_opp_put(opp);
 
 	/* Set the core clock and bus bw, having VDD scaling in mind */
 	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
 
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

