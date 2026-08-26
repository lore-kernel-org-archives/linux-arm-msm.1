Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCEE3655C4
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743237; cv=none; b=FOiDFtsUNTuJFPJlvvjlMPvEhZAdC85jGElYFLLi09/1WVd10xZmfygKmkNuzQxxx5VFvSGNYeua4LwRaSq/Lwj+JMoO8KTxOtxAga3i8qqP/RZ8xHMG65CoeAfLMbaddd7tOKlRTtqpB7uyO9w2iuxe1RVghaxKjLAQBYePdUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743237; c=relaxed/simple;
	bh=BiNjdvz2S5a2QleDZRTTP5yYseJfyFkXeoAjCVsHY4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LP3ufBo1HNB4gVEU6kkTRZ1+R6A/be4gvDXw9ZurqTBCClAdokp+IsusV4Iz9JLyZP5scujjZ7kL29tuJcjqX6Bee2xQlYuawOzrgtVrw+mbQbwB358XcWkDoqG+daIyowlYvRVNXYgoHRkjn5kHBo2VOldlpAgPeAX43ggU5RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1VBVTxS; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1VBVTxS"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b4a2ef5ff1so81153e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787743233; x=1788348033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QLl3MM1q5k3nKGlCDC9G7xw63zQ3/9cX9kt4JyEsEVs=;
        b=k1VBVTxSaYqdVLNuFL2aQf7mKtRPddAz0mtc3KVd0kvF6hrW/7Rop9FTcb+6JvdwlY
         /BVUm4tuLprdV4QK5QK1LDzVLG4cDzEKkR5K40DDDlTiydoqXSaiYdjUR5q27cYGEezc
         EPOZ8saDTVG+3unWIUbwvFtdezzkMQXA8DcvDtTEKa+I3p3f/ql73SSVOLoIHhnBKrmw
         OGz4aKlsuKfof8EjZjcrPLIj1l1OgvOZlMqLQCdi+IA2Tl8IoFnsy1+Hy9Rk75IeJFLB
         mnjCIUtrzcHVuXSIRa5l0QuIjygARlvZrL7iaQcVBNa6HxqlxW8jAZWvwUJvYEW1a95g
         oR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743233; x=1788348033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QLl3MM1q5k3nKGlCDC9G7xw63zQ3/9cX9kt4JyEsEVs=;
        b=YP6vFRNJTtQXUkkHqZLqjd2rJYgKh0l+qSchfwy/5lHKbEp1UYXic0n6p9njoiEH7z
         PTUtB7cRZclgWBBM0nnRMAbYVVYO/aw6zlMdQaqIHYb7/qEV4YWmfd/Fy57ieO2JJMz4
         yh/PndtL93CW5HgLoCNhokLXBPkrALQqYu//77eUPALku7J/EhJGc8xltW30F/mApxyd
         KEA3IiKO4SUHzSX7ksqef2zu5wEgJhdYS3D66KCSJ1/QrB0ShaQ5ywF9AMg3LQjrcrDM
         bbKbXPf1CHFlmKV9WdQOaKw55Dm1GDjOuyvy/ooPTVS2RCrvJKOal1kiJ7EtPhYNL72S
         B0lg==
X-Gm-Message-State: AFuF++nPRBEyUUEfyOS39+bDxoAa0S0n5mwz5PTMVTVTi+hZ0Y4LqQxI
	39OxKjLOPQn5u3cE5CsW1mjnT9nmDvhkl5QRh7s3H6zXy30pjivYo+WvCLTQ7RRlToG1TDynEca
	SCzs3yF24pQ==
X-Gm-Gg: AR+sD122XShqVsFHNttYWsMQVqAjAYgrYHuDqptSLN2yg5tnm39w67H5Horv9R8DS2/
	4IY2AoCNj8OLPug+FUR7cni8kPAu6df2zXbsPVSzFWBZ7rGKgQeZvNmuwV5AhbeggO1W9TOwG1I
	qvG8r7VvQpma69rBQzgg7rR+Pr7iX4dQGpp37/zp0n6YVJzuzLtHsRFZegquRPkTA/NsbUXLkq6
	LVj5P3PAky0rM0mDAMpYMG8zU9Kf7Iv6/PgZiu7royH+Uxi65Z+9M+5NRM8EIeqgcDeefnsYBzG
	QOI69oHDk/uyNXf8auUWmGv9AaXxCEZw/B/mHF74SCmxr0/kcBAeDv9NM9W5RYBFhG8nYJJnSVR
	NgLYhu0FvByTnQ10RwurphYznnvwOivvDSTT6x2rIk8UOkCQmeBhIhoo+uSlSdwx2lvk0LUTfZA
	05rQNT59lCbbKqKFlLlMTffKzrPipTO0NwLvM+vozPq8LxR7iAcScZ21Tf/LvovIif/SXvpsnVc
	g5DIFNP7RQh1nj2oFN+nji2IUWQf3Z78eEQuIg=
X-Received: by 2002:a05:6512:3095:b0:5b4:59a3:c67 with SMTP id 2adb3069b0e04-5b4a907ba8fmr900198e87.3.1787743233137;
        Wed, 26 Aug 2026 04:20:33 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4a4110c82sm540693e87.0.2026.08.26.04.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:20:32 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: Remove .use_rpm property from Qualcomm clock controller drivers
Date: Wed, 26 Aug 2026 14:20:21 +0300
Message-ID: <20260826112021.1455707-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
References: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the decision on connecting a clock controller driver to runtime PM
framework is done independently on the supplied platform data, the outdated
property can be removed from all Qualcomm clock controller drivers in a bulk.

The correspondent struct field .use_rpm is removed, and driver changes
are done by running `sed -i "/\.use_rpm = true/d" drivers/clk/qcom/*`.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 1 -
 drivers/clk/qcom/cambistmclkcc-sm8750.c    | 1 -
 drivers/clk/qcom/camcc-kaanapali.c         | 1 -
 drivers/clk/qcom/camcc-milos.c             | 1 -
 drivers/clk/qcom/camcc-sc8180x.c           | 1 -
 drivers/clk/qcom/camcc-sm8450.c            | 1 -
 drivers/clk/qcom/camcc-sm8550.c            | 1 -
 drivers/clk/qcom/camcc-sm8650.c            | 1 -
 drivers/clk/qcom/camcc-sm8750.c            | 1 -
 drivers/clk/qcom/camcc-x1e80100.c          | 1 -
 drivers/clk/qcom/camcc-x1p42100.c          | 1 -
 drivers/clk/qcom/common.h                  | 1 -
 drivers/clk/qcom/dispcc-eliza.c            | 1 -
 drivers/clk/qcom/dispcc-glymur.c           | 1 -
 drivers/clk/qcom/dispcc-kaanapali.c        | 1 -
 drivers/clk/qcom/dispcc-milos.c            | 1 -
 drivers/clk/qcom/gcc-hawi.c                | 1 -
 drivers/clk/qcom/gcc-milos.c               | 1 -
 drivers/clk/qcom/gcc-nord.c                | 1 -
 drivers/clk/qcom/gcc-sc8180x.c             | 1 -
 drivers/clk/qcom/gpucc-glymur.c            | 1 -
 drivers/clk/qcom/gpucc-kaanapali.c         | 1 -
 drivers/clk/qcom/gpucc-milos.c             | 1 -
 drivers/clk/qcom/gpucc-sm8750.c            | 1 -
 drivers/clk/qcom/gxclkctl-kaanapali.c      | 1 -
 drivers/clk/qcom/videocc-glymur.c          | 1 -
 drivers/clk/qcom/videocc-kaanapali.c       | 1 -
 drivers/clk/qcom/videocc-milos.c           | 1 -
 drivers/clk/qcom/videocc-sm8450.c          | 1 -
 drivers/clk/qcom/videocc-sm8550.c          | 1 -
 drivers/clk/qcom/videocc-sm8750.c          | 1 -
 drivers/clk/qcom/videocc-x1p42100.c        | 1 -
 32 files changed, 32 deletions(-)

diff --git a/drivers/clk/qcom/cambistmclkcc-kaanapali.c b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
index c96e9196d908..08ec0975a722 100644
--- a/drivers/clk/qcom/cambistmclkcc-kaanapali.c
+++ b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
@@ -405,7 +405,6 @@ static const struct qcom_cc_desc cam_bist_mclk_cc_kaanapali_desc = {
 	.config = &cam_bist_mclk_cc_kaanapali_regmap_config,
 	.clks = cam_bist_mclk_cc_kaanapali_clocks,
 	.num_clks = ARRAY_SIZE(cam_bist_mclk_cc_kaanapali_clocks),
-	.use_rpm = true,
 	.driver_data = &cam_bist_mclk_cc_kaanapali_driver_data,
 };
 
diff --git a/drivers/clk/qcom/cambistmclkcc-sm8750.c b/drivers/clk/qcom/cambistmclkcc-sm8750.c
index 69abb756c04f..2cf762f7c755 100644
--- a/drivers/clk/qcom/cambistmclkcc-sm8750.c
+++ b/drivers/clk/qcom/cambistmclkcc-sm8750.c
@@ -424,7 +424,6 @@ static const struct qcom_cc_desc cam_bist_mclk_cc_sm8750_desc = {
 	.config = &cam_bist_mclk_cc_sm8750_regmap_config,
 	.clks = cam_bist_mclk_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_clocks),
-	.use_rpm = true,
 	.driver_data = &cam_bist_mclk_cc_sm8750_driver_data,
 };
 
diff --git a/drivers/clk/qcom/camcc-kaanapali.c b/drivers/clk/qcom/camcc-kaanapali.c
index 50bd19fdaba0..9e69159cb291 100644
--- a/drivers/clk/qcom/camcc-kaanapali.c
+++ b/drivers/clk/qcom/camcc-kaanapali.c
@@ -2629,7 +2629,6 @@ static const struct qcom_cc_desc cam_cc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_kaanapali_resets),
 	.gdscs = cam_cc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_kaanapali_gdscs),
-	.use_rpm = true,
 	.driver_data = &cam_cc_kaanapali_driver_data,
 };
 
diff --git a/drivers/clk/qcom/camcc-milos.c b/drivers/clk/qcom/camcc-milos.c
index 8dda816a1369..a9d78701b8d2 100644
--- a/drivers/clk/qcom/camcc-milos.c
+++ b/drivers/clk/qcom/camcc-milos.c
@@ -2138,7 +2138,6 @@ static const struct qcom_cc_desc cam_cc_milos_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_milos_resets),
 	.gdscs = cam_cc_milos_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_milos_gdscs),
-	.use_rpm = true,
 	.driver_data = &cam_cc_milos_driver_data,
 };
 
diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
index c8b98f81ddef..fb9aee60264d 100644
--- a/drivers/clk/qcom/camcc-sc8180x.c
+++ b/drivers/clk/qcom/camcc-sc8180x.c
@@ -2856,7 +2856,6 @@ static const struct qcom_cc_desc cam_cc_sc8180x_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sc8180x_resets),
 	.gdscs = cam_cc_sc8180x_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sc8180x_gdscs),
-	.use_rpm = true,
 	.driver_data = &cam_cc_sc8180x_driver_data,
 };
 
diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index 4025db23d1a9..f1a84e9d703a 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -3044,7 +3044,6 @@ static const struct qcom_cc_desc cam_cc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8450_resets),
 	.gdscs = cam_cc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8450_gdscs),
-	.use_rpm = true,
 	.driver_data = &cam_cc_sm8450_driver_data,
 };
 
diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
index aaae5e671905..9734502b25e9 100644
--- a/drivers/clk/qcom/camcc-sm8550.c
+++ b/drivers/clk/qcom/camcc-sm8550.c
@@ -3544,7 +3544,6 @@ static const struct qcom_cc_desc cam_cc_sm8550_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8550_resets),
 	.gdscs = cam_cc_sm8550_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8550_gdscs),
-	.use_rpm = true,
 	.driver_data = &cam_cc_sm8550_driver_data,
 };
 
diff --git a/drivers/clk/qcom/camcc-sm8650.c b/drivers/clk/qcom/camcc-sm8650.c
index 3aad816ed233..bf4336537c2c 100644
--- a/drivers/clk/qcom/camcc-sm8650.c
+++ b/drivers/clk/qcom/camcc-sm8650.c
@@ -3562,7 +3562,6 @@ static const struct qcom_cc_desc cam_cc_sm8650_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8650_resets),
 	.gdscs = cam_cc_sm8650_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8650_gdscs),
-	.use_rpm = true,
 	.driver_data = &cam_cc_sm8650_driver_data,
 };
 
diff --git a/drivers/clk/qcom/camcc-sm8750.c b/drivers/clk/qcom/camcc-sm8750.c
index 4dac298f06b1..45cd27d3d96c 100644
--- a/drivers/clk/qcom/camcc-sm8750.c
+++ b/drivers/clk/qcom/camcc-sm8750.c
@@ -2680,7 +2680,6 @@ static const struct qcom_cc_desc cam_cc_sm8750_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8750_resets),
 	.gdscs = cam_cc_sm8750_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8750_gdscs),
-	.use_rpm = true,
 	.driver_data = &cam_cc_sm8750_driver_data,
 };
 
diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index 2bfd42904a29..b2b13a04782c 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -2525,7 +2525,6 @@ static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
 	.gdscs = cam_cc_x1e80100_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
-	.use_rpm = true,
 	.driver_data = &cam_cc_x1e80100_driver_data,
 };
 
diff --git a/drivers/clk/qcom/camcc-x1p42100.c b/drivers/clk/qcom/camcc-x1p42100.c
index cfe24bde4652..07df8d9e10f5 100644
--- a/drivers/clk/qcom/camcc-x1p42100.c
+++ b/drivers/clk/qcom/camcc-x1p42100.c
@@ -2193,7 +2193,6 @@ static struct qcom_cc_desc cam_cc_x1p42100_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_x1p42100_resets),
 	.gdscs = cam_cc_x1p42100_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_x1p42100_gdscs),
-	.use_rpm = true,
 	.driver_data = &cam_cc_x1p42100_driver_data,
 };
 
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 6f2406f8839e..ecd32596a926 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -48,7 +48,6 @@ struct qcom_cc_desc {
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;
-	bool use_rpm;
 	const struct qcom_cc_driver_data *driver_data;
 };
 
diff --git a/drivers/clk/qcom/dispcc-eliza.c b/drivers/clk/qcom/dispcc-eliza.c
index 290018d1abe1..8f8ee7896952 100644
--- a/drivers/clk/qcom/dispcc-eliza.c
+++ b/drivers/clk/qcom/dispcc-eliza.c
@@ -2091,7 +2091,6 @@ static const struct qcom_cc_desc disp_cc_eliza_desc = {
 	.num_resets = ARRAY_SIZE(disp_cc_eliza_resets),
 	.gdscs = disp_cc_eliza_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_eliza_gdscs),
-	.use_rpm = true,
 	.driver_data = &disp_cc_eliza_driver_data,
 };
 
diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index 32cc5226b4de..868f087c069f 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -1948,7 +1948,6 @@ static const struct qcom_cc_desc disp_cc_glymur_desc = {
 	.num_resets = ARRAY_SIZE(disp_cc_glymur_resets),
 	.gdscs = disp_cc_glymur_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_glymur_gdscs),
-	.use_rpm = true,
 	.driver_data = &disp_cc_glymur_driver_data,
 };
 
diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
index f8832482bd7a..51d823d4fafd 100644
--- a/drivers/clk/qcom/dispcc-kaanapali.c
+++ b/drivers/clk/qcom/dispcc-kaanapali.c
@@ -1922,7 +1922,6 @@ static const struct qcom_cc_desc disp_cc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(disp_cc_kaanapali_resets),
 	.gdscs = disp_cc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_kaanapali_gdscs),
-	.use_rpm = true,
 	.driver_data = &disp_cc_kaanapali_driver_data,
 };
 
diff --git a/drivers/clk/qcom/dispcc-milos.c b/drivers/clk/qcom/dispcc-milos.c
index c2f37d3458a0..b55ca0bf51d5 100644
--- a/drivers/clk/qcom/dispcc-milos.c
+++ b/drivers/clk/qcom/dispcc-milos.c
@@ -941,7 +941,6 @@ static const struct qcom_cc_desc disp_cc_milos_desc = {
 	.num_resets = ARRAY_SIZE(disp_cc_milos_resets),
 	.gdscs = disp_cc_milos_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_milos_gdscs),
-	.use_rpm = true,
 	.driver_data = &disp_cc_milos_driver_data,
 };
 
diff --git a/drivers/clk/qcom/gcc-hawi.c b/drivers/clk/qcom/gcc-hawi.c
index 018411e4f402..84e6f2ce380b 100644
--- a/drivers/clk/qcom/gcc-hawi.c
+++ b/drivers/clk/qcom/gcc-hawi.c
@@ -3617,7 +3617,6 @@ static const struct qcom_cc_desc gcc_hawi_desc = {
 	.num_resets = ARRAY_SIZE(gcc_hawi_resets),
 	.gdscs = gcc_hawi_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_hawi_gdscs),
-	.use_rpm = true,
 	.driver_data = &gcc_hawi_driver_data,
 };
 
diff --git a/drivers/clk/qcom/gcc-milos.c b/drivers/clk/qcom/gcc-milos.c
index 4219af2879d9..0ee65309b43a 100644
--- a/drivers/clk/qcom/gcc-milos.c
+++ b/drivers/clk/qcom/gcc-milos.c
@@ -3185,7 +3185,6 @@ static const struct qcom_cc_desc gcc_milos_desc = {
 	.num_resets = ARRAY_SIZE(gcc_milos_resets),
 	.gdscs = gcc_milos_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_milos_gdscs),
-	.use_rpm = true,
 	.driver_data = &gcc_milos_driver_data,
 };
 
diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 7c7c2171ac96..c1a0a8442b8c 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -1862,7 +1862,6 @@ static const struct qcom_cc_desc gcc_nord_desc = {
 	.num_resets = ARRAY_SIZE(gcc_nord_resets),
 	.gdscs = gcc_nord_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_nord_gdscs),
-	.use_rpm = true,
 	.driver_data = &gcc_nord_driver_data,
 };
 
diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index e6b7f1a5dcef..2c219d099b62 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4691,7 +4691,6 @@ static const struct qcom_cc_desc gcc_sc8180x_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sc8180x_resets),
 	.gdscs = gcc_sc8180x_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sc8180x_gdscs),
-	.use_rpm = true,
 	.driver_data = &gcc_sc8180x_driver_data,
 };
 
diff --git a/drivers/clk/qcom/gpucc-glymur.c b/drivers/clk/qcom/gpucc-glymur.c
index 001b2454786a..3ed22855fee5 100644
--- a/drivers/clk/qcom/gpucc-glymur.c
+++ b/drivers/clk/qcom/gpucc-glymur.c
@@ -588,7 +588,6 @@ static const struct qcom_cc_desc gpu_cc_glymur_desc = {
 	.num_resets = ARRAY_SIZE(gpu_cc_glymur_resets),
 	.gdscs = gpu_cc_glymur_gdscs,
 	.num_gdscs = ARRAY_SIZE(gpu_cc_glymur_gdscs),
-	.use_rpm = true,
 	.driver_data = &gpu_cc_glymur_driver_data,
 };
 
diff --git a/drivers/clk/qcom/gpucc-kaanapali.c b/drivers/clk/qcom/gpucc-kaanapali.c
index ae5563e516f6..a03405045a36 100644
--- a/drivers/clk/qcom/gpucc-kaanapali.c
+++ b/drivers/clk/qcom/gpucc-kaanapali.c
@@ -451,7 +451,6 @@ static const struct qcom_cc_desc gpu_cc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gpu_cc_kaanapali_resets),
 	.gdscs = gpu_cc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gpu_cc_kaanapali_gdscs),
-	.use_rpm = true,
 	.driver_data = &gpu_cc_kaanapali_driver_data,
 };
 
diff --git a/drivers/clk/qcom/gpucc-milos.c b/drivers/clk/qcom/gpucc-milos.c
index 6129f9aa5802..02d742db5c5f 100644
--- a/drivers/clk/qcom/gpucc-milos.c
+++ b/drivers/clk/qcom/gpucc-milos.c
@@ -532,7 +532,6 @@ static const struct qcom_cc_desc gpu_cc_milos_desc = {
 	.num_resets = ARRAY_SIZE(gpu_cc_milos_resets),
 	.gdscs = gpu_cc_milos_gdscs,
 	.num_gdscs = ARRAY_SIZE(gpu_cc_milos_gdscs),
-	.use_rpm = true,
 	.driver_data = &gpu_cc_milos_driver_data,
 };
 
diff --git a/drivers/clk/qcom/gpucc-sm8750.c b/drivers/clk/qcom/gpucc-sm8750.c
index 728597d0f82d..c5c4b5485855 100644
--- a/drivers/clk/qcom/gpucc-sm8750.c
+++ b/drivers/clk/qcom/gpucc-sm8750.c
@@ -444,7 +444,6 @@ static const struct qcom_cc_desc gpu_cc_sm8750_desc = {
 	.num_resets = ARRAY_SIZE(gpu_cc_sm8750_resets),
 	.gdscs = gpu_cc_sm8750_gdscs,
 	.num_gdscs = ARRAY_SIZE(gpu_cc_sm8750_gdscs),
-	.use_rpm = true,
 	.driver_data = &gpu_cc_sm8750_driver_data,
 };
 
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 10c1a8976c56..e0e1405110d3 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -46,7 +46,6 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
 	.config = &gx_clkctl_regmap_config,
 	.gdscs = gx_clkctl_gdscs,
 	.num_gdscs = ARRAY_SIZE(gx_clkctl_gdscs),
-	.use_rpm = true,
 };
 
 static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
index 18313a65e78d..eeb2c4eaad78 100644
--- a/drivers/clk/qcom/videocc-glymur.c
+++ b/drivers/clk/qcom/videocc-glymur.c
@@ -502,7 +502,6 @@ static const struct qcom_cc_desc video_cc_glymur_desc = {
 	.num_resets = ARRAY_SIZE(video_cc_glymur_resets),
 	.gdscs = video_cc_glymur_gdscs,
 	.num_gdscs = ARRAY_SIZE(video_cc_glymur_gdscs),
-	.use_rpm = true,
 	.driver_data = &video_cc_glymur_driver_data,
 };
 
diff --git a/drivers/clk/qcom/videocc-kaanapali.c b/drivers/clk/qcom/videocc-kaanapali.c
index 1f4ac18f86fa..10fa9ec21757 100644
--- a/drivers/clk/qcom/videocc-kaanapali.c
+++ b/drivers/clk/qcom/videocc-kaanapali.c
@@ -791,7 +791,6 @@ static const struct qcom_cc_desc video_cc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(video_cc_kaanapali_resets),
 	.gdscs = video_cc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(video_cc_kaanapali_gdscs),
-	.use_rpm = true,
 	.driver_data = &video_cc_kaanapali_driver_data,
 };
 
diff --git a/drivers/clk/qcom/videocc-milos.c b/drivers/clk/qcom/videocc-milos.c
index 386f2e1255d4..66a29e07dc07 100644
--- a/drivers/clk/qcom/videocc-milos.c
+++ b/drivers/clk/qcom/videocc-milos.c
@@ -373,7 +373,6 @@ static const struct qcom_cc_desc video_cc_milos_desc = {
 	.num_resets = ARRAY_SIZE(video_cc_milos_resets),
 	.gdscs = video_cc_milos_gdscs,
 	.num_gdscs = ARRAY_SIZE(video_cc_milos_gdscs),
-	.use_rpm = true,
 	.driver_data = &video_cc_milos_driver_data,
 };
 
diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index 887044aa3b24..09399e538f40 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -441,7 +441,6 @@ static const struct qcom_cc_desc video_cc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(video_cc_sm8450_resets),
 	.gdscs = video_cc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(video_cc_sm8450_gdscs),
-	.use_rpm = true,
 	.driver_data = &video_cc_sm8450_driver_data,
 };
 
diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index c2f11489a222..6e627ae73705 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -570,7 +570,6 @@ static const struct qcom_cc_desc video_cc_sm8550_desc = {
 	.num_resets = ARRAY_SIZE(video_cc_sm8550_resets),
 	.gdscs = video_cc_sm8550_gdscs,
 	.num_gdscs = ARRAY_SIZE(video_cc_sm8550_gdscs),
-	.use_rpm = true,
 	.driver_data = &video_cc_sm8550_driver_data,
 };
 
diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
index b62271a7dac6..cb7884656c81 100644
--- a/drivers/clk/qcom/videocc-sm8750.c
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -422,7 +422,6 @@ static const struct qcom_cc_desc video_cc_sm8750_desc = {
 	.num_resets = ARRAY_SIZE(video_cc_sm8750_resets),
 	.gdscs = video_cc_sm8750_gdscs,
 	.num_gdscs = ARRAY_SIZE(video_cc_sm8750_gdscs),
-	.use_rpm = true,
 	.driver_data = &video_cc_sm8750_driver_data,
 };
 
diff --git a/drivers/clk/qcom/videocc-x1p42100.c b/drivers/clk/qcom/videocc-x1p42100.c
index 503c03210ec8..f934a58580ad 100644
--- a/drivers/clk/qcom/videocc-x1p42100.c
+++ b/drivers/clk/qcom/videocc-x1p42100.c
@@ -555,7 +555,6 @@ static const struct qcom_cc_desc video_cc_x1p42100_desc = {
 	.num_resets = ARRAY_SIZE(video_cc_x1p42100_resets),
 	.gdscs = video_cc_x1p42100_gdscs,
 	.num_gdscs = ARRAY_SIZE(video_cc_x1p42100_gdscs),
-	.use_rpm = true,
 	.driver_data = &video_cc_x1p42100_driver_data,
 };
 
-- 
2.53.0

