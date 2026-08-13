Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A126F3161A1
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 04:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786594831; cv=none; b=A7jCNz2n6RknLvH/pa7dDl9LgM57x30ikMkZwx5HTiqyU0K6JFvgTMpDldBpBbbqiMlZzGbyTnwLNj6JIKn36MRqfvgBs3J/7FDU/505dwZdEjQih2jwhEWSF8pxQDTs7HH7PLrSWnEtVSkUbEiIAO2m71TWCAm3y8BL3uHTy0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786594831; c=relaxed/simple;
	bh=gXKfQPPtANNZHJUProhwbQDCYeFtL1eTSoCCjA+/SqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pfS9H2IOWW5PVsUyFFunOi3OxB5tkzhw2Jg5/KrR4Wj/f2fNFwjX/GZB7XcVoiw7rRteFKA1vRXc4wnkGQOGMewsvOgqidQuNCscWb0RPLqrOgPMIa/MKapi4mjsbd/ECT8f//pU+gx/y002sIjbfuubAbaTx/hvKjZfjzK4u2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBIH6qsU; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBIH6qsU"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1848939a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 21:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786594830; x=1787199630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvgR15Tx+UTRmIkTVdFC4whcGk/0e9sve+h3BkqQWSE=;
        b=SBIH6qsUr+cg0zVmlUClTwGkHH5SiptIZUucO0lWu3gltdHbYFhEadOxTHKKNK+JFr
         pVS/ArLGCe142EFjvw71LZt9opst/Pv0sof5796r8bQ2A5m2+U7zHQOZga1Ng4wtagSV
         daVpLudrbLVvMh21CWPLzEBeE8a16fJjHRHacpoeO9hxC9DqtxVE/TUjcddxhiEwMwZ7
         kH3DYUCjcraxdve5/gcNB/4hkg1andWk1fZeY+v5k9Wc0UhJITBsASrrDHJA2W/FS3W4
         GQxb9f9Hh7le3HjAPm9r3Nvbw/B6j9EMgTATJGf3wWFkqKKj751A2rZrF9WpJVhyFfCC
         HkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786594830; x=1787199630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvgR15Tx+UTRmIkTVdFC4whcGk/0e9sve+h3BkqQWSE=;
        b=VGMTb0uilqrb3+XbmcDeRaDuVpvqDmYheK11SubZup7bRtwgcHcQRJ0ZeJVmQc4v8I
         s4C/M6OlDFBW7tzPdyuVZeghUnL8CxNPihDI+IXFTsuDxV6qjNuXlROwlJaMDt+WrhO2
         lA/uRkD7kfty2MXwO81Rq1U4uGM3ekJ+yJL8fMbZeXU5HuzhXKdt7JgGZIug/CBOZRZl
         N65HsUKyZXgm0FdZCz1s2ABkyPHyt5H27XT0bSb23u7GNrNfydcyZcasPjYx4PBPL1Ws
         S/ZM3LEGofMDVEB1qKq3mSe/qhg/emqtmdtGpgXPWO2hk6slK6D7jL35QUXpAfyIBmdu
         r1ug==
X-Gm-Message-State: AOJu0YyVg3AHv70UwytxCloxR1gI3WA7MTzCkIEGFMBKTNhyUHWNUjnu
	MfwNFdx/G2utY1+O00bpZj0kXB5auxGLRuWtXwmcqxs8/qOmrJeiBtJ9
X-Gm-Gg: AR+sD13i299TCGysMiPI6+U06sUL8uj6H8qd4dR0gfvAiJySy1go+QYFAUoUS3TD+br
	06jcBD4wcZK7rayJ8/FEdE0qXdENbbpRlh9JhlBg0LJJNHL9YBgsX5PR24/D3d00Gh7qBkkKOsS
	B9t0gj6O4DSCMVask/HHV9NcstYveASvRlU67IDjmY8fETOWS5IpOhBvhIDtfDvqm2KhOqaucJh
	8iw4vsLbzLg1zU846/aYWfMi0lh7f/WqtsmhNQFXUDtRBSdUidWbLpDDCtsLzuXe5bxNhMR+Cge
	4r99lU2QrRn+zdUjsZ1Q+c6Xge/3ij1aJEuXfeoandyKKwWoOCmT453C2RrRiMYOwtKNpFiZx/2
	LEIa5jKN6N+jJ781cJJKMiBesIOQcNIa6t/KKpOss6P+i/XNMjYrRDMdSvuIufXlDP2jKkefKGB
	aqko4KrNKoS4Or/54uywcyoT7YohC2AUZM+q6pFzJvHlNDYaSkA0ANvQ8v2IVvCJjcPhsAGWdMw
	OYrSuavvaztpCnVCzmYe8GfVFFbj9TSMmdjPirJiDcLPrCyhBO6F+JeOZ+ON7Q5/jQ0aH5LQT0G
	rYzM
X-Received: by 2002:a17:90a:ec8f:b0:38e:485c:ebd3 with SMTP id 98e67ed59e1d1-3931e291d2dmr3936264a91.15.1786594830016;
        Wed, 12 Aug 2026 21:20:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd468cesm1700084a91.7.2026.08.12.21.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 21:20:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] net: xilinx: axienet: Propagate errors from optional IRQ lookup
Date: Thu, 13 Aug 2026 11:20:11 +0700
Message-ID: <20260813042012.17631-1-phucduc.bui@gmail.com>
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
that no optional IRQ is available, while other errors should be propagated.

Propagate all error codes returned by platform_get_irq_optional() other
than -ENXIO.

Another call to platform_get_irq_optional() in the same function already
handles the return value this way. Apply the same error handling to this
call site for consistency.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index fcf517069d16..d23e9796725d 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2957,12 +2957,16 @@ static int axienet_probe(struct platform_device *pdev)
 			lp->tx_irq = irq_of_parse_and_map(np, 0);
 			of_node_put(np);
 			lp->eth_irq = platform_get_irq_optional(pdev, 0);
+			if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
+				return lp->eth_irq;
 		} else {
 			/* Check for these resources directly on the Ethernet node. */
 			lp->dma_regs = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
 			lp->rx_irq = platform_get_irq(pdev, 1);
 			lp->tx_irq = platform_get_irq(pdev, 0);
 			lp->eth_irq = platform_get_irq_optional(pdev, 2);
+			if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
+				return lp->eth_irq;
 		}
 		if (IS_ERR(lp->dma_regs)) {
 			dev_err(&pdev->dev, "could not map DMA regs\n");
-- 
2.43.0

