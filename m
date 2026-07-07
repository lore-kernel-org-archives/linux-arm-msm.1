Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C6D3FC5A5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 11:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425387; cv=none; b=lC4oo0EtFrZJmsG44n1/UFQmaLicTBU9iMabj0lRicXOcmsYBRxhQ8yjCSqQftdlhTCKso03Fr2K+Eini6obCttpVGz6+0EXZHOm21l6R6bE1Fb8yS0NB1p/dc4yrLZ2kFgjv5zi5wgZSQ5beq7E92Ij1e9/r/qXrqlsx22UTkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425387; c=relaxed/simple;
	bh=nnvK5OyVStyB68ojaRbHyRT1K6wfBsNB9/88lNM7q3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AmbSCc1/KIpcdXbfHg+omO9wKJwOGLRSrc6EDZDHaUEMYUyQ6a4MTP14nqBTbmfxN9831BYjprlTA0LVDSAKmiLad/gWbIUI9WJS3v2h/ZOv1jdrzTuZg55bel+ydiGVJpaNsANo6HxcINeHy+fOGYULp6H+7rLVm2oYMPYPvMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=waVWNUPp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="waVWNUPp"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso1501852f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783425384; x=1784030184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BRFTSXmxEyf0zn6J40dawyzSU98C1I44YPIDxQ+qYw=;
        b=waVWNUPpnFKFd5HsJlat7safSw6ScvxyOW3zlTehKGTkSB6+bZKmH0hE1tFrpSmvOK
         q3EUOYoHlgNFxyQPW6RtfBjmWQHJ09QXL8buaT4+PgfBHJ32nw+SlJKVIUGYM8yhflsn
         jDwPg3JZ3OqkPrtpacUwYkGNBFp95x7yOwUG97fb4Qy0m3ylZ8knW/79eBP/NWpmGu6E
         hoP6CH6Eq49/kUA/SCNXPutGJ47MKWV2R/N6R46ZZIDuepE8cDZOtO0cCvJa7z8fFrDi
         CP+1vSZbkFHQsYUkyVG4PNZCUsZAtNUtabe4XwlKpiCWDRMPh6ZMqmbAWv4lxIoXtiHM
         xtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425384; x=1784030184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+BRFTSXmxEyf0zn6J40dawyzSU98C1I44YPIDxQ+qYw=;
        b=cBFIBI2Dx9NHD7S6BZrv5uX8qwrOKh9Q9m8XmFJjbCBbo6E86S4mhts4EwNhkyj4wJ
         UR+BQWSpCcp6S3ekjQTOw1m11W9uiI6l1b2Sn2CsPdCUu+JdwXCsZHQMi5CuTM8Sl/zG
         dtVLnLqbacGTvgctIRnIcmK+GX4zxBbFufBwt4DbFNRwslo8VDqSUxtzqRbf4V9wJdcE
         G3kiczqHlsY6pcuUSjEHHjBrm14ja+nhYKU3cn1QHBUM9rIRKTN6zpJg+BeEYoqY9Y0V
         sjQnxGPO8pyo633MjTYxRz1gQh4couD7Mt0v4lO7NH0Bx+TWPjqRq3SiQCG3LfiBVQ7j
         2jsA==
X-Forwarded-Encrypted: i=1; AHgh+RpllZjolP4CXS6vDvIXc4ffXVKcUFQwvs8aweMA46wKEHh4sI5QFsxrcnXNuSdbDmCnue/DeeX6Qc6e0cFu@vger.kernel.org
X-Gm-Message-State: AOJu0YyRv0CrNt6EQ91GVT1POLWt96SWcIzrhXOcHXL51zKftPzTIGr6
	FSFjfwIKaAdi28PSvW9vCXMwzhWYdN7UdNZwaB2dItv2NEPD0jxXLi2XFIL/Ko8vRlo=
X-Gm-Gg: AfdE7cn+8SXlLZjJkU35yHzjWcyuQRRYA8rOlGKBo4AvSfW2km+/bOihvfVHtwzlu9o
	dHS5XIjTJCZ6m8l5nJZCCOXYbnkOznDRB6A/eo75P4BOw48emUSL0NEkN5VsWXyGhISJxRJDLw0
	LCq04hU2us/xSr1jK0GMJKYvvecnx0qFr00OpIDkiTxmTOrrMhyEeY3/oH8SKl2J858sWSMvGm3
	qo2mGvSvynMkkr5IavXGCCiylVg1kYj9B7ZW1fMPxzZtrhgI1CdoIuGZhjIDbX19NC41FfESHRa
	S2hdGpP1bZqwpMhckYOo3K4mIj/O98ovfSH2NfnO6nl76XJcZS80pHWvt32/yNj44CFBzDx8Xx/
	fCxExmvd98FlE5rUK9dgKtuEtCRKp9Za05jZ9Qy4/azkq4gR+VzDm47f1p2Ka9zX/NPtPoNJsV9
	LV/6Hso+WF9Vlxxqt5aALWGM1j0Q==
X-Received: by 2002:a05:600c:548d:b0:493:c76a:2363 with SMTP id 5b1f17b1804b1-493df062bbfmr53504795e9.6.1783425383827;
        Tue, 07 Jul 2026 04:56:23 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:adab:817c:53a0:8f31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm55401235e9.15.2026.07.07.04.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:56:23 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 07 Jul 2026 13:56:02 +0200
Subject: [PATCH v2 2/4] mtd: rawnand: qcom: Make "aon" clock optional
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qcom-nandc-mdm9607-v2-2-d906f7e8b814@linaro.org>
References: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
In-Reply-To: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Some SoCs (e.g. MDM9607, SDX55) have only a single separately controllable
clock for the NAND controller. The actual clocks in the hardware are
managed by the firmware and turned on all together when needed. In this
case, there is no separate "aon" clock that can be described in the device
tree from the OS point of view.

Make the second "aon" clock optional to avoid an error when it is missing.
For platforms that really need it, the dt-bindings are responsible for
validating that.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4b80ce084d9a..0251dd591d40 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2280,7 +2280,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (IS_ERR(nandc->core_clk))
 		return PTR_ERR(nandc->core_clk);
 
-	nandc->aon_clk = devm_clk_get(dev, "aon");
+	nandc->aon_clk = devm_clk_get_optional(dev, "aon");
 	if (IS_ERR(nandc->aon_clk))
 		return PTR_ERR(nandc->aon_clk);
 

-- 
2.54.0

