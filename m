Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDAD3806AD
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 21:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791063924; cv=none; b=khKRfYkVi1UKk1V9IDza73ERXBpSTZCX8VUJfAapGl2FlwDjeCLfa/xv9jL/PRCIaXqaBm09+LEvxL6K7HJBRKu4KhlwfdvkeMPMOSS+Fzf2+GLGnUSQKVPMe+X0HfOgS79Lbxv08AKiydmdHDGxH5UiG+UAZJiaBNhltFLcIBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791063924; c=relaxed/simple;
	bh=h2y5ekLFmu6lTIqptxUqfe1ov4xut9/IMYr639ap5Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qf1X7/4tVno82SRhVigAXI6G/N49VZe2BVPACQt9AmMAd705b107JRP1wU+N3NBGHWS+DENTFwAFqU7SilAUNQBYJyhRS1R0ufGD+zH1rdc3qSoo8pPyvCeidlYT1fCE+2cR3F08vmyyXqY+Cy1/1A1hU9gTRrb08rCn/EkmZHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/waC3bV; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/waC3bV"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba4415869aso439670e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 14:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791063920; x=1791668720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAmnXAdXxOh3z0LoSvp9bSH7NOEWelIN6hCn50zbh8g=;
        b=P/waC3bVUH73V4RgSrC2x0rrySeFftK2FnBJCtiW1V/jDT2aqTsiNLFhJzQOpRDbCT
         Zd01KHvD/6YJPzb+4+axz7QkFRCLb0I/8xx3/x1HPoUQEgHUhUgHCAc8VF+XVXTPqDD3
         GwBAYoYJwmD7+vX0+OOXTLlAtgeVTo2YmkvDJQluleYAAhpxOtE1FEkmsewBG1hSr0ch
         7x3OAT1bhys/LBJ1JuO4TkFPDpFWNKJoIRC0+83LSQ+t2KQgi57fhJQAtkoEVc/SOnG4
         OXQr1InBba0mM4geZuEGG7QwEB2rGzomq0iNjpit3QN6KHptGbTcy7X0vsnq6aLCqEyO
         /6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063920; x=1791668720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MAmnXAdXxOh3z0LoSvp9bSH7NOEWelIN6hCn50zbh8g=;
        b=CPE7Qn0nwbAvfonsoTUuTazGmtZGCbZCRjCu6jm/8fJrPxmrm9RDAYwCxu/FBfOdCL
         QnmrNVQCCF/+pzHHHo/J9Zq2AF9dahSnT2YQoOSbH/7pyiQj5QaNnn1TWeVxQU4AmFbk
         WzpCYzz7lWzFdw2ghnobsNyEy7269la4l7GNKc8CCW0u0ZyDcgCUaT3UN10CgfAXDW6H
         TpOXkuCFwp6A5RFEkraBtc6SlIXY0Vt3lUkycy2lFW/nuVkLdr2R91MIimqlc7+EAnoA
         CpJh+3oVTc1sMYucGdtlesuANNWXQGldnhhQSfB93geXWoCHT+V2s2w6ROwAwZrx1fZ4
         Q18Q==
X-Gm-Message-State: AFq9FYISxEba9KFnamn0k3//xzvUO9vPfJohF0A0eL2zvX25jhLDrvHZ
	esgltP0r0oHbhlsqhVBvqMUv1K4ehxqBNa6SD8F602OdetRviTRLryIY
X-Gm-Gg: AYBFou2ix0P5BmdJY8LOInCbJc4id+e6Uy4hzkcZv6rf99DPeGXbzk3JvD9Hq2gYTNY
	7G8JOP5D8Cf29EusPkucLzh1YVendu4gUaVrtQzJBpAjVDEYDfFwIJ9sUeDT3O/qVJiJe3DK56k
	UDirfnZs4Xk1RL5SOg6Su/A9acwYBD03RUe1qyAcs42y8xV/JUZaVobTAXq8tEFU2uzU0qHTse/
	q3lefxThPMPKs0CfopjWdZwwCsC9N1x5ariQEWQ+o9Ejy1x7t+2RWV9KLJGZSN+vudvuIkyDlAy
	c2478kOdiXheNKDGhnyPJJey23NBZcxuJNco4/iKS9it61psqgmYjPC6eEhBpcK2ir33czNtuXu
	b2Uf1zEhGQ1JSHmnuhwFRxb2KwFEgStzygPhqTU7jWgBzPnixnae2TLSLZj4wG+xz5HAFd85Ay5
	YT+C5hvV6+4B8bNpDL88WmtHQheICdLQ/0PgJJl+0WLGYh/MyjJ0ngqtJo/vA540uI4mUvGIQLc
	dsRPPF/nvIZnI1ft7Q/RiWaqmIRM9RVh5Rj4AVRR54U5PmfNzZ85MsRChFWdKsXsmX1YA==
X-Received: by 2002:ac2:4984:0:b0:5b6:1a7c:1f with SMTP id 2adb3069b0e04-5bb9bb22272mr1993059e87.34.1791063920290;
        Sat, 03 Oct 2026 14:45:20 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c719110sm1859789e87.2.2026.10.03.14.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:45:19 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Sun,  4 Oct 2026 00:45:16 +0300
Message-ID: <20261003214516.128573-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The __acquires() and __releases() on adc5_gen3_mutex_lock() and
adc5_gen3_mutex_unlock() name adc, a local declared in the body. With
context analysis enabled for this file, the build fails:

  error: use of undeclared identifier 'adc'

The lock and unlock are split across these two helpers for the ADC_TM
driver, so mark them __context_unsafe() instead.

Fixes: baff45179e90 ("iio: adc: Add support for QCOM PMIC5 Gen3 ADC")
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Found by building with CONTEXT_ANALYSIS_qcom-spmi-adc5-gen3.o=y, which the
driver does not set today. Build tested only, no hardware here.

 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c68c6c5f6aca..6a3cabedf4e8 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -663,7 +663,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 }
 
 void adc5_gen3_mutex_lock(struct device *dev)
-	__acquires(&adc->lock)
+	__context_unsafe(/* returns with adc->lock held */)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
@@ -673,7 +673,7 @@ void adc5_gen3_mutex_lock(struct device *dev)
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_mutex_lock, "QCOM_SPMI_ADC5_GEN3");
 
 void adc5_gen3_mutex_unlock(struct device *dev)
-	__releases(&adc->lock)
+	__context_unsafe(/* releases adc->lock */)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);

base-commit: 04434a1d0f311d76b1f15fa987918b471a0b8c6a
-- 
2.43.0

