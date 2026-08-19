Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB0A44AB90
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135216; cv=none; b=fTVt36TPEoS2T3p1M+3brf7lcFqPOBKhfUL0BughqOVGGxMH9bLsZSwRdernOpowqQBHOjUDDT8/FX4yeLKc51M7FYO3/zrOGTAIJc00fce910eYS/dO7sbMWHjMYVXzLLTN0AS6JjOJ536pws0czIG5DqZ+Zsfest277FCr9fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135216; c=relaxed/simple;
	bh=fY13qhhO/8Gf6JKMpaPERld1NLDM6gscAauMtHxFhUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cSOb9Zxs8/EOC6TcjEKqd6/WbEEIckssoZ4nXbVDTpkI5UHcTGFzwJGUcMLs7M0zhnz/QFNwhKxfWBfCBSPREZ5l+1IhpjYpS2g0+1oes8yeYl9vzGD6M2nb2gCGef3HFJFjzw4EmA3P2nJDboTSEHOtsUjmiNdzHsMA5b4gCXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4dKxBdX; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4dKxBdX"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e041ea211so958720a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 03:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787135212; x=1787740012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sOo8+WXu3Ze0ZJYkplMM54LZrdC6MGdDMGkd/spmK4=;
        b=E4dKxBdXKUkpcI28RWxTCs28bBOSKMkot1qPY41142pHXRgd69mza0juNWw6dL1EPt
         2A4qdeNl5HdkG4SB550YVd0rdQdZRFZ5PwpHzB8JmdllxgkuMXja1Qwvng4yoxs7bYbp
         kyInC0FFrNjNgxqm6fuI7H0/JKuNGG8d/Eln8o7182tzWTJhfkHBxTjWDwvR5ChmCzKm
         RQ+V/k/YNXccg/M18Q+oSyWgmW1L4aLEkicP3IrW9hp+Q9S8gaQ+nC2ckxOzkTWiaeqM
         /w3xYtWLH3Kb/vShpK7c/NpTXUzfJ4viZ2s6aEccHDULISGQ4vlU7Ke//SXObjT/lFRE
         8IWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787135212; x=1787740012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sOo8+WXu3Ze0ZJYkplMM54LZrdC6MGdDMGkd/spmK4=;
        b=dccqPudDBe/MMRSSB8ahJB8FGEbOBuAJNuOi9RT3p/53rcuvDCCupo0ixmjThGIdvc
         S2A/hcCCGUqcat5VpddPoDh5uygFRF1blY7wN6LFHl1MdJDdeLLYgxpuSxZs0A9qOQm4
         F+gQANuFS9s9RMrkhXulbfD1bjC2ZSsBNuuY/ifd9XlLizhfdyxiIOY2yp3HWN5/ndsQ
         WLom4F7bWTleyqCFk2/azA2IB1WmYOPWnRvOaGvb8JE7TiKCUoP7b9zozc9nvKB83Okx
         6hC8/KEPIADCFHNmTYjd6LIKpCWq7KzBgACmyVx4MyqBDuYpOjuBgJSnpgCqoMvk1MQg
         yTDw==
X-Gm-Message-State: AFuF++lhwSoAMWFG1nuzsyc9pDf1nY1E0AVsCx5yI1ejwJhN978OUZe8
	8w02e6X5IHAmjyEDp0n5sAGttdoLUHbOvMuYn1IKOBTBs4TMEbjJ9b6f
X-Gm-Gg: AR+sD10siEhnZ+WJnCgcnnaYP4i2HjYUVsThUvbcyh0+bmi7wDdSw04I18hPHLN24Ki
	afLUQN2YSML58eQk9HjsqEO+fYtSXi+qxo5FbatEg+mhkaOUsw9v98ByhCPizN8EXUVrTpkaK26
	E4tSdtt4f4lvg93Xek7zE3CmGgyD8irMV/g/G5VEE0CYsZ6HBVDuCJO6KpsTEq2i7J6MvnM9dB7
	sqRNTAORD6+Jij/IhGZFg7zYXuR/0nmpkSzTh9EuzIcw43kDcGBskSuF1wjuVXXTWcFUuo/MKC8
	Uzk0LO9cj6uLqXViqaSJmaI5LBBHHJFIVtgjEddL6QCOJaBJGGHndztf7MHM8eho5lhkQnh2y6b
	cyf7Cr1LFFWz5tdmiP/Bz+dDOS64XhHjvsoAM+L/sp74ZG1LV++vlNcLBH/46vJxEk6T0+UrKkj
	l+UNQGRNN0eRJIgyQyHo9Unj4zlVe6AfoRLgELJcUKFUNp/PKk7z1W9QiKzAncoEzXc44OeNIcJ
	KA69lK3upSZyFXtulG40qGPv5KjE5TMF5CsJS3fnHzUEA7OFw8P+XNgs+ROBcJc/3ssMJU01kx8
	2AYY4JJ3A71yuP8=
X-Received: by 2002:a17:90b:37cb:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-3958046ce9cmr6771407a91.0.1787135212143;
        Wed, 19 Aug 2026 03:26:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb87174sm2185525a91.12.2026.08.19.03.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:26:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] soc: qcom: llcc-qcom: Handle errors from optional IRQ lookup
Date: Wed, 19 Aug 2026 17:26:30 +0700
Message-ID: <20260819102630.68991-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

Propagate negative errors other than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1:
https://lore.kernel.org/all/20260810051031.26656-1-phucduc.bui@gmail.com/

Changes in v2:
 - Drop the unnecessary check for a positive return value.
 - Update the commit message to reflect the existing error handling.

 drivers/soc/qcom/llcc-qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 733999867bbf..b166d45cdb6f 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -5617,6 +5617,10 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 	}
 
 	drv_data->ecc_irq = platform_get_irq_optional(pdev, 0);
+	if (drv_data->ecc_irq < 0 && drv_data->ecc_irq != -ENXIO)
+		return dev_err_probe(&pdev->dev, drv_data->ecc_irq,
+				     "failed to get IRQ resource\n");
+
 	drv_data->edac_reg_offset = cfg->edac_reg_offset;
 	drv_data->ecc_irq_configured = cfg->irq_configured;
 	drv_data->dev = dev;
-- 
2.43.0

