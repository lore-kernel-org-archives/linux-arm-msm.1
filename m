Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6C23B27F0
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786187219; cv=none; b=dNjHIrdU2MguTRN4JWkvtFMypBlnbP0Tn11DHeiddYJioeV2NZf+LnYM+MgwCQeU4fhwLIoUCgHLNNYhrAGRgQRpR27gyBVtPzpCXEmQ4wo7N8X9xQN5q00mGFCSKTkWXmtYdyLZ5lb8lF2RUM9xY6uHruglHrh74p/VNBjsS+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786187219; c=relaxed/simple;
	bh=J/ymqtZ5t4rqiTSWSp7zbVWBqr+7P+uQXvX3Ct5nAoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EcaXbonzs5jPSZyp7SnVJXMJWEpaYZkxMlia3WKXudRkvuIhvwsALCR6phIbXk1WlZTpW3o8O0X9WpYtt2bsiDbCTV3Q7BlDqbQlzoPyW7E72LHLXsIot7PulsLNKQ1QNviiztCpBmxrL3UkeI+3HMAlkLnS9fU5Gj0jFZ3850A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fy/Yj0Ki; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fy/Yj0Ki"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cedda2ce6fso3604225ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786187216; x=1786792016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8p77R5oDeTzUjp3uZU2mFPZEkph6YP/aLn1kfdoEnU=;
        b=fy/Yj0KiYipgqOQm5AZt3hYehKtzjZWKSsuMQS7Vi8iviYvCrYXWm8avEU0qQ7HJcW
         s1MwSE7S1VVPPnT5NhuU1EYkUwviPOH4xcveqLDXnj+cWkLUEQEOOMrRuBrLuk+igfhN
         Yt66gBg9mMoTKVnHRfQvy3MhuZV4LNCvgPc3XCSddrjxPKC7nvEY5sx454o3YkcwMpqr
         qXMN6jrQBvVHtj3v8Map/3vrL7jrSvjZJ53ff1jquW5RhjVJ9nxZ+tsAmCGTM11eK5ry
         fVmBsxcMSj28JmPOZHF0P0t8g852+inlgmq5OY6uGBUnbS+/m3mkFaXfJnp6U5l+1E3B
         dAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786187216; x=1786792016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8p77R5oDeTzUjp3uZU2mFPZEkph6YP/aLn1kfdoEnU=;
        b=aCooHC3VATET1fgjPlZmsdBn+khoNsEFdSg2NFWSIb9hMCyjxfv6e0G29LjxfZJJ/m
         TCcUjZu4peONQXRXowqRx0IMbeiibgeKhejkjFoxCQ7FQPjHTZQUIQVBlU9uLEZIWs/I
         Wj8S5LDuQdiFAdko5yNapcL7qOuPrS/8nXuBhgxBWHFr+qpcRP+2+A/VZ6r0cwEG1qW9
         2hhMGiUgaHy14SFoWbzpVsvU+LrAK77b9N715veGSOttdxA3z+EwfST/wiB3tBL9LQEp
         4vLIQZ8LxP9/qbUeiPYg1crPe6l3VNsS4QrKPHmur5HBiIQqim34+kkvS54ntuwM2jL+
         YxcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJskhkAzvA1hLrrGpuvyQJxBtjUxZ72mQ1qWZ2RatZZEpVPT6fBBdCGeXymhyotyB9wUBIdHnIV4goOqLJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwPGrZUbOZxOTqVCpsUvIS8wbfZ+kwcDntP+IieRoGj1yKeUe48
	lkwsz9zpa+Akq1UFrTr6czQQujNbeksvLMnTej5MPE7A1BetlblJuzE7
X-Gm-Gg: AR+sD12Am0oLmP0iqGhq11e88Doj8a6dfUYVCjIt1Ll7HtaQhteigyClfbBBb8jx6AK
	EGVY2e/xu2JN1tv0iIhYFIzqXNvo1Y7zlCrzPe9YlE4RdZJduD9lLxihFecR6W6qBBEIb7JLPV5
	fkFMUj15SnKcEU5Am9Bf7iSaeJdumwirx/toDU/bjPa4ne6ZDVYftS0+1/b3poJ1i3gRCOhvrFk
	wzKiqh4uJRTaMpIO21g340pW7K8chhzwm1/dNKOC3Xx1qV5Ip8eDxYzQjRlFoZ7iGjIJiTneETl
	jAGlvlkIS/2DZFl4XDubkVm5mwqkh4/vjoVFfyWVsMNda9izwbSl7lQ/O4ui1AlhY+tQ48cEt1Z
	J5Cs/ZJkZdXvdF8hpCQgOzwDBKqGFvOSuDzOL/xpmV4g7fkTuRlUNvjHcfrkBi+iOVodhYFbsZy
	1aqM2uTMKjYDkhNElt42voCsMuGzvGandcL01npGAwxoeVIdN6yNwiJK0fdA==
X-Received: by 2002:a17:902:e851:b0:2c9:de53:f84f with SMTP id d9443c01a7336-2d0ca9904acmr318334315ad.19.1786187215843;
        Sat, 08 Aug 2026 04:06:55 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4e1182sm18019325ad.72.2026.08.08.04.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:06:55 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Pramod Gurav <pramod.gurav@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] dmaengine: qcom-bam-dma: fix autosuspend cleanup during removal
Date: Sat,  8 Aug 2026 19:06:42 +0800
Message-ID: <20260808110642.2770355-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bam_dma_probe() calls pm_runtime_use_autosuspend(), but
bam_dma_remove() does not call the matching
pm_runtime_dont_use_autosuspend() when removing the device.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during teardown, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call before forcing
the device into runtime suspend during removal.

This issue was found by manual code inspection.

Fixes: 7d2545599f5b ("dmaengine: qcom-bam-dma: Add pm_runtime support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/qcom/bam_dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1bb26af0405f..05a3b1f9e0c2 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1401,6 +1401,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
-- 
2.43.0

