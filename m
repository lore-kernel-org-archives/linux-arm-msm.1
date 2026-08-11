Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BD32D060D
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 03:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786420054; cv=none; b=OHvNCt2qvvkPeeI2a/w19TmrY2SPgcP1457XMhyOydOAHRTN7/sIrolAodMIrIfWZZJx8yxSpkGai1Y4u5jZSHpTRw/XRQmUPy86m24pOiZvqbN9Xkt8KMuLa8O9xHuhZJ/TUzaVUz7ivBn1/1H3D3sKMqTQUzPMH2DGdcYX9bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786420054; c=relaxed/simple;
	bh=DyKm8VUkzskxpXoICI1bt3LPFqZDrsD2Xa2/Z1K2Msc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k28ExU+y823sT/oBUzz4IgXyZvQE9Of8PuPSumWPwXgZrU0n+Cp4VWKPxp2HMQnVQseTl5o/dF8++spBdZQLEAjRfoAlm/EP2qEQ6RMJi+wlAHIOgli413wZiJxvVJQA0N8ylMxqeIBHUPv1o7llQBP1SkJVCHHnD69XI+ru3q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/eJRfMD; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/eJRfMD"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so208362b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 20:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786420051; x=1787024851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fO//i2RtgcRB0nXNuwN1GB8vOhXT0TWv6CJA+FzAN1E=;
        b=i/eJRfMD1pHWwxenQTFOc5zJQW577h7huRsk3luG72Nu05SMXvPM14JXuwsqGy3MBU
         +UBVrbftP3IyOV4xOTX5IK1kORzyDbMdlYKJkpl/qDgtuasQ9drJVYOX4fUvh2eQ3ehp
         DEG9ZwpERZ+YUoSDn61tIpc/JIQgG/tTWDimjNHG9pXkfq5GqeHOCKphBZtjIJU+rnX1
         qgLHBZJ2LwYoBVc+3SWD3Kh1wGEH6umXyRgdI0HCW1Ss8aSkoksNx6bdboms7pWPcAc7
         ZvvCUfGTTGS5AR7BErhUSuCUQvgf5dM+8spMp8SzL1TUtRUjGiHyeTBFsI5MpZtx4h+W
         ai+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786420051; x=1787024851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fO//i2RtgcRB0nXNuwN1GB8vOhXT0TWv6CJA+FzAN1E=;
        b=pp9qcXVhLzB+ZCKQBSEWp4MHfICnNelqwTZY5nvLEVd4I88/zqozQzVJIfYdQz7N5r
         iFXSoti+Y6BSLGptxtIYEU7hgNrfZsVV/pOY/c/diGiW7pbsePDd4qLDGprdo4oM3WzO
         MW+UVH+BvfqL8VmYc7CtIqnVGjGpbivhteV9Kjy76SvgCn9i1OOvo8P/pajWViMMdOT8
         xkaU+md9R6r20Uf0uh6vUFMjI6fx0G2Al6FRVdx66tY1zwLBtbMywncJ2tEGEbnw1eCo
         OeDf69voUm8s31n4QfJ/lwyp3OM6+sQKT93FuUcIZHIq84nCxhI64mQr65EH2AvaH7Wj
         m0nA==
X-Gm-Message-State: AOJu0YwKH5z7Nndl3Xh4lrUTeDtw5RFkJDWjqrANeL7FvvZhiaZmb1aJ
	kA6zzaXSXKhkzvHW09Pdj1qr8pQV5njadznbKyvX0QoG3dI8ZM4tml4f
X-Gm-Gg: AR+sD100SDUp4v15DZEPmDPa7amA9lKsE9FOp/kWpK5VZnHCrrXyatuEBS6W6kW1NnQ
	BIdeWRDKby9BGp5zRrWXUIjVOTrBuo9RV9Igl736B/PFi95dgCNITpR0PoggnVQcrtgNVdnoWOg
	q6NBPH31zwjsTB4IzlCeEn4FO51CmdpHWsi7BPsmi52tBqooByrL4GQPvownpfihAoKO4WsrvEK
	fSwsrMUWWqOzUx6klVNMzGEsPQ5kELIDGPxYSLl7e1WS4QxvTKS4jnG6obNUh66dOkZ0SVMHsPz
	wRV0f/ucOW+GALGnpVYSpiqUF2jEUE7MPo7RYU7LpuaEnvl1yclbJLlx23WtAe7j4TudMzAyF9p
	rPGejMsomQgLmgn6GFgD3TM32ygMRsYM/omPqG3UX8t689wVcgypMuHpYoJllO7h61ggNvtdsf8
	vX/EEtFaEZyMTAteskQBWVLBiJPHroJgWhbNnRTxfsp3jOB1Tlwl0yOu6xKouId41EWNuRw1Zf9
	Trfy2g2caejhyXvnayqcYUdEooILSNi962KLHfEh+6ywm4qCvpaW/mUzJxwSIjmepZCv1c39uug
	3mEqig==
X-Received: by 2002:a05:6a00:90a7:b0:848:3f91:da82 with SMTP id d2e1a72fcca58-84fa8926f7cmr157503b3a.32.1786420051437;
        Mon, 10 Aug 2026 20:47:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a589d7bsm4537514b3a.53.2026.08.10.20.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 20:47:31 -0700 (PDT)
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
Subject: [PATCH] net: xilinx: axienet: Propagate errors from optional IRQ lookup
Date: Tue, 11 Aug 2026 10:47:15 +0700
Message-ID: <20260811034715.6034-1-phucduc.bui@gmail.com>
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
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index fcf517069d16..7ef099db1bcf 100644
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
@@ -3047,7 +3051,7 @@ static int axienet_probe(struct platform_device *pdev)
 		ndev->ethtool_ops = &axienet_ethtool_ops;
 	}
 	/* Check for Ethernet core IRQ (optional) */
-	if (lp->eth_irq <= 0)
+	if (lp->eth_irq < 0)
 		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
 
 	/* Retrieve the MAC address */
-- 
2.43.0

