Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFFF266581
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743236; cv=none; b=MFSCjxaHC4X+p83mHZeG/gj9/TNzq4XgT/X4zABm7Fcn3uU19ovdS7G0Nj7afrlV7jGlSakNK52GhyOxsVUuUk0UH3K5sD+cGuk+zqswS21zzXIJ2dd54Sy2qkq3cfTm6GcscyR9iPsMPz7Et4Hj71FBKXrH6MnvOTm0FCU3ktw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743236; c=relaxed/simple;
	bh=rNQQAanWo0Hih162TIR65ln7UHhYUZF2rU3yGOOyLdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HhmAThYHocfxnfQn6b1nxMaOFR74N5zGVCLNTq/6ALY390diiHnWssK5vqgteFAld8+me/68gwSNfELM3FYm8Gw1lz3FMi57VhKg5vfY3RzXMNSmtkNKJkVecH8Lu4do/6/qkLgtZ0a/NskRQgr2BHK2CEloOmpCkVMySs/Tdxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ghpHlMqL; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ghpHlMqL"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39f8346e2ffso604751fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787743233; x=1788348033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pNWnnn8sCmArPh+QNsffYr2uxqrd5fOVKS+lCyVBf0=;
        b=ghpHlMqLLPsClPasFGzXVo2m1ZyeWxh2r/lXIqa0FpmVL+jaVjin/bQhRjY7UxqFr4
         2C0jRzvnIg7bgyOPr5nLZ5w1VqkzAEFOIuRxTpDOOE0v9Xpebyk3yW7k/xLq9ka/qP9O
         gu1DyfaztsLR+bUBDUaCGYpxoJp+ceK2te8QHFO7JrTKN5MCFo2CvKuyKeXo02g8wxsm
         aJp0uW2mzHyRjVYApXTYM4jw8UQecUh0z/YmGHrQ61MYsYPzwodyrhjLR7IBPX1vdCDH
         +BUqG7fz8A97wgxCbn6Ta9P+fEnJ2HeUFrJ8w/PG07WNkZEHfDvro0imRk+GMak9HEMT
         4AFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743233; x=1788348033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9pNWnnn8sCmArPh+QNsffYr2uxqrd5fOVKS+lCyVBf0=;
        b=MMs1T8fvzh4IHKce5pCf7JKhRlJs4gSM7/ka3NS+yhZeQ3+3YPDb/mv9oU2uk9JL8f
         ze5Um9bVJ7uXytmXlRKcguRrSiNFNwENg4HBwShraS54das7L4tQOgvfmGCyMapInNoY
         Y5Wb3h0DJD3slsWb8ntWtqopKf6GdIcdhr3BqY/jhHnceC2QteU5GCRQm5a+rLO67YHx
         5RiEBB1IbtFohStutdbDVzfbRFYFLVETyYJqOmFj3w/2NA2WFuUidoBRRjUG6pWklhsB
         +a6ayfUxV55WZreHhhGD7LFsO3zz/4Nkje3K42WPTGAITfZ36xiMoQBQPFXe1VcwMJoo
         ulmQ==
X-Gm-Message-State: AFuF++kjiexxMJAETRa/kW8oz3sdkMuNBDBSQ0aRev3yBq7PU6fbXZB6
	jYFuvYez2I7PpZbSDg/NAnXZhPTsvJSN/npYI5bwkz3eT7YY6RcFM9Tl+0gDGeBDIVM=
X-Gm-Gg: AR+sD100SRLyGRLxpgxmVSb9EHskAdglkkBfkvdnkdb2TNK1DsLFvX9Ru75Ct6DBkgE
	Q/pRrl14ZQZski2X227Z5slQQi4h/XafGjfYLuga6pQHAGCmFIBulKL0CvoLCEd2kXKkNjNvWjS
	N1v2jOArjh00qBrWHlYNcSmRWsxIrtZ3t9cSWgARu+wK6V0SBVez4zC/e+xzeBKGx9ejdBeGmOa
	1eW6F7DSAL4fTLP1pQbYKf8oF3dMek3gE6jWzZgsubyYuiTbTpUE0GqD/OMQjCB2Dv0uq3Impcb
	j/b0p/GRy2093zeOJO2FxBpuHnnxq/iYnWTHQCPjaBbGG8rrYDhuuh6ULBYQJhFoaGWIXqkwZ5i
	W7Barvk9xTPIeI/0yLh6Hli/8lN7Z0hbabQNtGZFsy+nNdyoEMp0NxjiyGUtueFhZcGylo3m5d+
	8UzDX6JKVi4xAU2h2MtudtEa9Sa+sO/JFhvTMx+TN/6Dq1UAq4yuhm1LnhHxrODXGGxikTReBVo
	HECRxy9+5WT5UTwjmvajYs3mi+BvEKKm11PRdA=
X-Received: by 2002:a05:6512:32c6:b0:5b2:8f21:9208 with SMTP id 2adb3069b0e04-5b4a9061e53mr793379e87.2.1787743232583;
        Wed, 26 Aug 2026 04:20:32 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4a4110c82sm540693e87.0.2026.08.26.04.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:20:32 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: common: Tune clock controller dependency on runtime PM framework
Date: Wed, 26 Aug 2026 14:20:20 +0300
Message-ID: <20260826112021.1455707-2-vladimir.zapolskiy@linaro.org>
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

A clock controller driver is expected to be embedded into runtime
PM framework iff there are specified power domains to supply the clock
controller. If there is no power domain, then it's a noop to add
the driver into the runtime PM framework, and if there is a power domain,
the dependency can be considered using this fact rather than relying on
a probably stale data from a particular clock controller device driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/common.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b..bf21a314e6cc 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -332,6 +332,7 @@ int qcom_cc_really_probe(struct device *dev,
 	struct clk_regmap **rclks = desc->clks;
 	size_t num_clk_hws = desc->num_clk_hws;
 	struct clk_hw **clk_hws = desc->clk_hws;
+	bool use_rpm = false;
 
 	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
 	if (!cc)
@@ -341,7 +342,9 @@ int qcom_cc_really_probe(struct device *dev,
 	if (ret < 0 && ret != -EEXIST)
 		return ret;
 
-	if (desc->use_rpm) {
+	if (ret > 0) {
+		use_rpm = true;
+
 		ret = devm_pm_runtime_enable(dev);
 		if (ret)
 			return ret;
@@ -427,7 +430,7 @@ int qcom_cc_really_probe(struct device *dev,
 	ret = qcom_cc_icc_register(dev, desc);
 
 put_rpm:
-	if (desc->use_rpm)
+	if (use_rpm)
 		pm_runtime_put(dev);
 
 	return ret;
-- 
2.53.0

