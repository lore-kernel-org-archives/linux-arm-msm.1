Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAA837E310
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 04:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786594836; cv=none; b=oK0mHKvYoChnLfao5aqCZtQxsduM9ihNDHYQ+M5pqB22xUmEoRWBqBw4YX/STHiIMSYlDWnFkkMFVWvRBDtEInXt/Krb39s3EJfyzv4b9Yb3SLeQWmHonAS+4eA6AV8UuaiBmpgFc/Nu2duSbEjxhiuvUphUtCPpKXri7o3SeTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786594836; c=relaxed/simple;
	bh=jhz6oMwASk0fhspOmlgDfIWbfxvXA9ksWC4tOt4CDM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nWj0e8xHaHc3o8GJgNJRVlwszg2k8TkcLB0QWGJYxkYRGbFyoU7tVQupyFrzIVnv+aJ3E3GXdeSY95/N90Pi0rlKs+9d7uoEBTXqR0ZG7BfuDlmUV62x5WTdkVvUrm0Tm/LY06X7725D9xVfJ2FKlo3nF1ZTAE1Yo08n/zdND8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEFDFfTN; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEFDFfTN"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e88b60121so297445a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 21:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786594835; x=1787199635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuAX0QZtIVEwbbkqe3Q0lDnHOIC7HPwgoRkKSD2AJfM=;
        b=hEFDFfTN0bqwOvFLDsuwxuN6OjES+zKeTW29PWkaCsw+IN38zoaSkoFi5i7LKEiJi6
         dkBHmffSbqfyMDB4HKmvOf5vIcgt7VgNz9FeJCxWqmevHfcND25+FHqA79pfgsoRD0K9
         mmj7jp6AL9CwLONqM6sp4kmG3bBkqXThjuXXkwldtA1wfE73lbSHF1eiPGsu3tj4Gved
         lR9WCRFbmrWPXVniYhKcCzysdrwMhH3RLLv69NHCZNoSNa2FuQ4SOMai3r9B4glQY+O2
         rtpUtoiF4LAppZ30KohRwFbqhJw0tBLDX4foOX+ja3EFbw7cylzz/elvMct3tticw3eP
         SnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786594835; x=1787199635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JuAX0QZtIVEwbbkqe3Q0lDnHOIC7HPwgoRkKSD2AJfM=;
        b=BB5m26RGzErCd2NVVg+VBL9fnqy7aPAQ71KlzIKY+wQCt6xprk3h6qgLBEPhgCmdEb
         mr7QO2ifjlcvlZThFsntj31j3eRN8+IEaUJeMKUDRK6irN9rqDRpQRRcUR958mIiDwYA
         eNu4l5f5rOWufD3Vx4LPkAWBF81o8GdTuNjDYN/xruUsDG2jLoavqHiq5J1tMiUYVMJg
         KIRpCracn7WwGdhL2oekuVuVQMl7vqjl1rKI0m1QIwlQvfFfNz8Ev0iSAc7vXEHlJ5XR
         dqk8emft8csp4AlelAkz3izD2yvl8TPuNs965f16u0MXqvGObvPe2X88XPoJLXOsrYmX
         OFTw==
X-Gm-Message-State: AOJu0Yw4jVLaGJL5XgxhNZNZI2woLAfFR1pfKZC5QqreijcwVN0pvZEE
	p5jIZCrAxFo+Em6Ip30FrfgBPjQsMR71lFgejG2wPKqv9egc2ljaXz8D
X-Gm-Gg: AR+sD12P96p4P9iUfLlKSVWbAiNj9cYDMrHQigCVONgZ26Koyb3UcdElW3YW7LntGBz
	/1EA+5V57JhfoMeE7NekqzU7g7xg9pyWfhX0+nJVysEdfokBE6VaOUpRhC7SaTki54KmBjtBt1n
	8fjN4+6c4pmUD4JCTAbBdP/pL3GsQ3ub6sBxYUiDTaRVvwRrcLgaE/zFBexpBdKELASyW3PkMVl
	qfqHZGAXLXKE509UBw4F0jtFnxEChDLb3FIENg8KCBfPTCuwFDNnap0fyGhqDq9meRFbFXOxNcG
	TKWVSEZCh+Bz7mcI9c7dydz00Js5GeFmJkdvTw2eIS24K9VaN2prqs4oHWq9DtLVwHwoa6hHvGy
	ALEnoOQ7bwtjnRCFzRLzzraBN49SxGmkC8mjnhIUECvbKEfrqfZc7FYfZqj0Jko3Eq7lAkaJorN
	ozJtXKqJo9DXCvqle7yMTqMTcRx/gn3EWExOlQoH1Mha33aebb0oxXkR9E8g1TCJfgfcz+Zp1++
	i+8usIC1NY0hfyLZiFLfThGBmk8rXA5/9pUlt/Bx7wrj7ck6pw5CunpU92kqNAXzTQDtYFDU3O9
	0m3G
X-Received: by 2002:a17:90b:3c41:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-3931e0393a8mr3833257a91.8.1786594834730;
        Wed, 12 Aug 2026 21:20:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd468cesm1700084a91.7.2026.08.12.21.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 21:20:34 -0700 (PDT)
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
Subject: [PATCH v2 2/2] net: xilinx: axienet: Handle optional IRQ return value correctly
Date: Thu, 13 Aug 2026 11:20:12 +0700
Message-ID: <20260813042012.17631-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813042012.17631-1-phucduc.bui@gmail.com>
References: <20260813042012.17631-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

lp->eth_irq is assigned from platform_get_irq_optional(), which returns
a non-zero interrupt number on success or a negative error number on
failure. Errors other than -ENXIO are handled before this check,
so -ENXIO is the only error value that can reach this point.

Check for a negative value instead of treating 0 as an undefined IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index d23e9796725d..7ef099db1bcf 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -3051,7 +3051,7 @@ static int axienet_probe(struct platform_device *pdev)
 		ndev->ethtool_ops = &axienet_ethtool_ops;
 	}
 	/* Check for Ethernet core IRQ (optional) */
-	if (lp->eth_irq <= 0)
+	if (lp->eth_irq < 0)
 		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
 
 	/* Retrieve the MAC address */
-- 
2.43.0

