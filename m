Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6B9385D6E
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 11:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786188366; cv=none; b=KJFf1mvktjhkjzfgOFueG3NMK4UFyfCJp4czP2QBmamXFuUyIHCXxhDMxIhnPPmPYTQVuUkT4aZh3DNeoe2HazHEyw/E/BZlZGUkAmW5jtyGn9zvLTPi9069R0b/fDHrl5YfGTCq3Ppmo//WkXrBsvg+ojW5EK76ng1ESzNwYeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786188366; c=relaxed/simple;
	bh=79eIeLy6BGI+fBiKuSwA2DDf6rq8Fp/Sbknof2xZaCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k8ZLwq4RV0Q5wOb3RESDCMBdXaDmnHRT1vNLYPzsUq1X6sri+zgWkIVrnDZLo4m8czbPOyLrsaMaSjlRzgrHOGOqWzNvK8CkoUT9RvrVgNthHFyNl0ZDS0zddjYTkMRusKpfG55JMDi/JZSGNeSZ+r0JE2Zoi4ErTseiWxTEWoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhRmPf1o; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhRmPf1o"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3811f512167so572992a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 04:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786188363; x=1786793163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtuOINh8YkDKYuvWIfvZnBXqzDMcNfimlyPxz7Xqg8g=;
        b=NhRmPf1ooNhtD8AfKCgf5GHogVhYqIiEEBRqK3l9qxvopheTpDhbE34jNuuPgz2TIN
         lRRvX4OOhP8wRUbN71lRCP4fQiYod42+QAXaDOt3EDCJzbBFPpMUdjjKvaz0zD4F5yP+
         Qjlsz+oJxufHt0W8EsWs3J0DtyL6G3M9gpwXgBPBl9F8Y2rru68Yrqq0/vFuUU462nmG
         7TlkDBsRYn69p77o9hDhpDHlCkeFN6mwOruoik2OkgC/EKB+fP/krI+vzNpJJbeyWPlM
         hyftV8N32KNCGYq46E98FlBhPSEu81UUgTsstj4aBDzdeB1w4VS+Ie3xAhw9T3Dmi7Aj
         xC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786188363; x=1786793163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtuOINh8YkDKYuvWIfvZnBXqzDMcNfimlyPxz7Xqg8g=;
        b=K1zaRCvKKq96Th2Rhc8qpwysqwdz9V8OzVbguwgWnAQj90GTyWdHoiwFDgWbAq4LfF
         9PnVqbRkniH+6marF7jyv1nMwXtvU1yq+LSWum1SBSVnzXV0qRXp8SrApspi9031Y6Bu
         x/iw0IJTt8iwS5ZXcH/I3DL5jCUKmO30o6YmkK4Dw5Ar5jhiRizNB2zYCJeBf+AaUCme
         8bM1kaX6/4pP/PPG3xlNFLwIJK5imvOWneS1NHbO2MTYR3JF0Nj65X1TuMtx1FNhLQF4
         +hR47WUZQaMbDE6Rga7peashF4j9dwMNOwuSp57T7hSDh/XSbzmhDB5HaY8rTEsWHbnw
         an0A==
X-Forwarded-Encrypted: i=1; AHgh+RpWyfKQ/1Pjst6I2KNgPIKXAYvkE6KAmgR4ZRb6qy4J8qXvtKAC01+UKRjXcTwgFvjJmAojsn7LeO+BUic1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtvj/IYDpiqDkv33kkSJE5+VQRIU3dAwc19lrfTnixhltNQwLA
	w1uz/ZBe6oAXHXfYfcmyRX8I33M8m6qGiMwMFmnIIzF6MUX/d/GRyj3S
X-Gm-Gg: AR+sD110KjJGay8biP0xT8Q+mMcc6ezYvpXi5he4iXgviiW/sLhTvcwcWAY7Zp4BNjv
	Vs8Vh/H92T3jHRIfNFi8BLHwCLinWWRERTvpi5s9dLsZ/bbn4R1G+bWJBRNDq5ocp15IDWz2CMo
	g9oKXq/sIojZ5Rp/UdnPSGuzA5doCaR78c07PY6w+DADbUaLSVGt/opOTCs8hkOYlSIiBqZBzl0
	LJgffioEbJeqwLHQ0JC0bOjvwh4t7dgUfZisQ1/wYI+ugIeUqXGIT1xUS2K0CYGiuINiWZoREwV
	WjTwPacYuqNpyrfCe9WykHKwWwd4J4sS8Vlvj2dPplu3TnHl7ReE0yK/KEPLhgQqedZ87+Bf5Ud
	KqwAUKSUpfYyxwjeLR4LcTd4J0AaqbOV58za9g+dXApRJ9ZQeX0R6d/rBhy9UUA1MZDlIfUhwoN
	cwnV/LnT45Ny0ccEDxczRecwF7ypAFuhPdJ/kievDWvksDHuYpqcQ=
X-Received: by 2002:a17:90b:1e53:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-3903c54cf2bmr27833795a91.4.1786188363482;
        Sat, 08 Aug 2026 04:26:03 -0700 (PDT)
Received: from lgs.. ([101.36.107.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dbf82csm8235726a91.1.2026.08.08.04.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:26:03 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: qcom: hidma: fix autosuspend cleanup during teardown
Date: Sat,  8 Aug 2026 19:25:51 +0800
Message-ID: <20260808112551.2786782-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidma_probe() calls pm_runtime_use_autosuspend(), but neither the probe
failure path nor hidma_remove() calls the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() calls to both the
probe failure and remove paths before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 67a2003e0607 ("dmaengine: add Qualcomm Technologies HIDMA channel driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/qcom/hidma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be21d..78fd765c81e4 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -893,6 +893,7 @@ static int hidma_probe(struct platform_device *pdev)
 		hidma_free(dmadev);
 bailout:
 	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return rc;
 }
@@ -930,6 +931,7 @@ static void hidma_remove(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "HI-DMA engine removed\n");
 	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
-- 
2.43.0

