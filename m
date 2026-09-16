Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C747DD7C
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549331; cv=none; b=Zln1Y3FG/mqDXYIcDD7oVjVOlMqdg4OOhnUEfCHZiw6Z8DB8bKDvSeVPU4rM1Kx/Rw5Rf/xWWF4cCnIGoPhNN5FleMLVJIX0xCGkTtZ/NAUdwxqVXRGgnPq/L22P53Z6eJR+kMbt/LOC0WRABxHgn530EZUXt92/gry31slC0tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549331; c=relaxed/simple;
	bh=74+NXWRLulW42h8LCDGQtUqGGw4TZyZ6WSPtQhdY/jE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qjBc/TKGA0ynkg4NExoGoJ1GaaxPh3C9ZV4ZPV4Ny7fj7fNf3eHslR5caBQCvntwrR0oA0W1X4s0z5RMea2xHgw+WASnA04DwfxGvuO1wBf+r3AfpvYCL7CwwUaQHliciwgeIPeipKi4piwQMnkjL76A7DqrAdqIRFE/00A8c7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDfjua9P; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDfjua9P"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso600151a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 02:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789549302; x=1790154102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D6tQdqZnuOU/60EvuEJ2W5w4uMx9pH4irbJ1JjeHep4=;
        b=KDfjua9Pfabyus4iUkLuEbwaH8RqIk4642tFlU9F326OxUY2IXPaixt2PpQ1dHrqMo
         PtpTOu9wwhWUXwKSTbwpdHRbCzaanWXS+CabwFJroa6oKndYx440PeHOm8+ZYOPv2Te3
         S8ud/y1XoOQGbTr+JWDXurNKM8kIcc5BSk2T/cH2sj4A04psErV+zs02J9prcGqSP8II
         BlzXeGqBw2k4o1clumzPfBY7iTVc8xxGdnsdSvp+qO/Tq5AyVxtKQVK+vPHRj8tLTROK
         JYjE3BDWCZUJZ1rNixPB2GzSVsIRwdosV5WMGaM4QhCl6v2nqN0igQSwp3EgpSaHfDhI
         OsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549302; x=1790154102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6tQdqZnuOU/60EvuEJ2W5w4uMx9pH4irbJ1JjeHep4=;
        b=FKhTUnrOSX+yIIA46IjiYrmnNVXwowZlX7WtgtyutFI4IWPh1Vt1aAStk1Q8dRgwiH
         8ZhMcz6X/Yf7Nq1zSsWSM2w7TPlznUeIx12mn+NRGld+GhuQJLVWhBIRYO5pOk90F1tg
         +V/jZ5Htco9GKBbI+hJkIxaOlUniIhNgH7ekDtFTN//UgOfBrMRq6rVy4wFUZJha+ZCP
         QVXygjRa85IbT0exBzskkwXenZUSZCFuHOPKZW0WBHEWNaEtI4mtfgJ/+YPVYBDHYA1O
         7XS4ay4hGbjjcz/hXTTTParCMWtAiwVQPxk40JECBjP53anEac5JcUZzS6OsEdmvg1k7
         BsfQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0vtuHljjhZZLq02G/4G2IRHKKEXfQdP8EjXPialUeUpuHXt978Wb4FpVw6M0UlPaF5eJPR3QgiaU+BG9r@vger.kernel.org
X-Gm-Message-State: AFuF++miFOqzYJygTydj6EuG4/HinaLbJMFkPbyasW1JvGBq0n08iaaT
	hc+vem0mL0yvtWfH30mrTZXcapnn1adIjZ0LDAUBztt3rLzJb4B1OMni
X-Gm-Gg: AYBFou2NHaufY4pEyiyCIM8roYx/otPjHLrYdWu9VKyRZQXCScwHh2eyrev8wmB4tHr
	UKr1+mHavOOYHKu7M6p3TxK6deYLhCQp72GtuxJt0r0I02DHhpRy9W7NGQ24aJiAaHuTru3zjJ2
	mBDu/SuxzSCgT6fSEeIdF5dVv4WBIdMo2rIv1uDAqEiag62zJrFwz9dpcK7XhdUr5TEU34eqYm7
	FB4szIC3l9DSgY/vAi592ZPIWP9rBguWACKwydZ4OGHgC+m+OvlcAL68u1Yd3ei6Fo++lZ0FOw8
	D9tMMbdIRkLEm+ReISP+CkaqpUawJsoReSHM4wicSvdbBfHV9YmFczxkkylOz8JC4UmDzTIQzpB
	XINDkY/9SSrHCkj4RSy4FQbCoFq4jEZTUPzsed/A8L+hq2gfmebB078jHQk2pfBh1oN6/d2xFNS
	BU8bEm993JHsIE6Xesj8+clXXsysAcR4kvt9+BwyjUuDR2NpS+pAgaG4gA5ns2/UkR8r0eKQ==
X-Received: by 2002:a17:90b:3950:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-39e1e31e264mr4511213a91.10.1789549301596;
        Wed, 16 Sep 2026 02:01:41 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm3609040a91.10.2026.09.16.02.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:01:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] PCI: qcom-ep: deinitialize endpoint on remove
Date: Wed, 16 Sep 2026 17:01:26 +0800
Message-ID: <20260916090126.2963064-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_pcie_ep_probe() initializes the DesignWare PCIe endpoint with
dw_pcie_ep_init(). The probe failure paths call dw_pcie_ep_deinit() to
release the corresponding endpoint resources, but the remove path does
not perform the matching teardown after a successful probe.

As a result, resources initialized by the DesignWare endpoint core can
remain allocated when the endpoint controller is removed.

Notify endpoint functions about EPC deinitialization and call
dw_pcie_ep_deinit() before disabling the controller resources. Keep the
existing early return when the link is already disabled since Qualcomm
endpoint controllers depend on the host refclk for hardware cleanup.

This issue was found by manual code inspection.

Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 56184e6ca6e6..28949386b0e8 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -944,6 +944,8 @@ static void qcom_pcie_ep_remove(struct platform_device *pdev)
 
 	if (pcie_ep->link_status == QCOM_PCIE_EP_LINK_DISABLED)
 		return;
+	pci_epc_deinit_notify(pcie_ep->pci.ep.epc);
+	dw_pcie_ep_deinit(&pcie_ep->pci.ep);
 
 	qcom_pcie_disable_resources(pcie_ep);
 }
-- 
2.43.0

