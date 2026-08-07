Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B24037C927
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093823; cv=none; b=ZIybLcG8/938rWXl8nzqRO4Oq9uxXnf1W7DmBv7s4S/22DLKoldn9xqRP1Z6UwfouiJgIeDPvd/kcoKMfTlHj4gj38njOhW4qpF0YkLV7a30ekyBQLD3vVb8lKapex+zEBnMa8+2r/wn2N5kKI5f8+2hPFMqvF+H1iCFarcKVb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093823; c=relaxed/simple;
	bh=zmd+hXMz/1zZGAjuKxtwL7umtro7DdjiUAmgu9dyibQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmYOxUcxMoeWh5MkoBKUAURq861aN+ULCRAlavdM5qAgTgXwXiVtTiz+o6Twg1eZfw6+e2owOYJ7K1+OQsgoBEdaLigGUpmcGp5oJbf/GS52T6fzhKMYJh5SY5fOcOBM9q84AakrU2/0caSjx9zD9ej7/KtmN2ygTHWZD+xpLQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5CYqQI0; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5CYqQI0"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8487088510aso4555321b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 02:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786093822; x=1786698622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElLqReA861EolgaVnlXggqBl/5aqmb9EAPSEfZwWA+w=;
        b=S5CYqQI0UahkAkppVaHE7UZKBJ33HhmZgafDHfHMK2nV+I7XO562yKRYO8V4B05jgJ
         Avc1zgLFGnOzCVOZYsSpvIi8ljvR1DkO/c9xE55xVA30VCsPYXPRsS/NvHPfGfnqIZnF
         4KU5ULsnkHLTv7AOyks3ZQmhMUtrXu6d6TT+z5mzJ0eMYmRVMQuyipznN8oVbw8Qb0zR
         pyQfz6zWAINUA9coCF0P9vdHOjkPv15MQQa1Z32c16PjYnZ4kcY6u0wKeHD9x1WYbqPs
         h8oGuZcJG+SjvjZjgJrIM22/y45GYm+S9IF9z1ItrexTuVNsz/zh3YdeuBq3fd2oRzx0
         Y2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093822; x=1786698622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElLqReA861EolgaVnlXggqBl/5aqmb9EAPSEfZwWA+w=;
        b=HoxErASrSeufRmuyEaBeGBx4HKim9M2kytct1N/Jfq2ew2flD9IevAtA+9EQzY+GZM
         +LL6xiGit/rxWRxuPNYEqYkfa43jEk9Qq4tU/XZ0JMeH31dTlbuQ+9RBZVbjxAz+sxFn
         aCkGCyt3QDjtQDmbIQk9bGpe/TzzHasPRX4qfjeND1xrwBqTPt4wsmTf+/svcpechl1M
         g5gtTVj/gjDZHlH7ZMWhKc06rcsd8aODDPtjWpoT5Ufl86tBSslkz+xeX7eszEwQqQkA
         yFkYerLMRRNvK6MR5HXTzD4Es0xUzYU9C9V5mJjfZODnlYL1avwPZomDjiTzEQdGvBlw
         aImg==
X-Forwarded-Encrypted: i=1; AHgh+RrWdWdyi5aQakQYRmOXeP1CJUtozeM70BJ1rHVfRsFuwtwM30wseRQkHxCnxbvIPT1dZzNKyOnP3E0RRmzF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/qTIJofJhe/ZbGzIczCd/Qz0GNz1mNz8VdhKYC0ogrfX7cLem
	GTJT9VjWix21u24xhNJ1W2FxM4HSo9Gyb4EiqHgJXSbO9/2kONuCKa76
X-Gm-Gg: AR+sD12OMXITM7XRgzme6CnEvgpjF02EpIJ10g4BxPp5AyqAgrpmp06dKSzyOln+AuO
	RXGrYUbV/2AT9rI/8whcmTLZI3EKqDU37rw/TRBOGAjN6wVSCuvb53k6DqsHJZnQGh9CYQGcls8
	GV4R7qttjtkfu1b02DdIYUcGKzvlbUaQnd5NW92Tc3zebZgUH6DHljsbTXPGXceJRQSikKm1Bun
	79hMcA52TegGgRhIX7+2/0nWXDJjvLdKXw8if6aGtGg5ER7Fx7ZkGSX1kF90LnA/YBV606PhQKC
	3+f08JpuMBuaz13Hrc7hYZ1gdoIBEClwx7j0IPpQa0BA0Fv/f1VFMC+CY3wZZE9H5DJo1nniLuk
	jhYw25GAk1WLdEfK/LxPONuFA+HZVAc7x6fniHD+xLzE8x8AEYdXnLQCe7WKpgCNUpbutAdH2NC
	WMzdUTlbp5rX2trOPa97oahY5s11cH8gops24kj5+kptNh+YuJtbYXg7gFPFIJRnOk3fAD8uGd+
	fo05QiEm+mX2eWvMEAKXgeXQyv1lOECJLSX+2W3cLAEHTo/883eo/uKjv+1GZ2uIsOG3hvalF3v
	6yxv
X-Received: by 2002:a05:6a00:f99:b0:845:ebbf:e7be with SMTP id d2e1a72fcca58-84f2e03954amr24222618b3a.23.1786093821837;
        Fri, 07 Aug 2026 02:10:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm715908b3a.42.2026.08.07.02.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:10:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yenchia Chen <yenchia.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Zong Jiang <quic_zongjian@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Aniket Randive <aniket.randive@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] serial: 8250_mtk: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:09:45 +0700
Message-ID: <20260807090945.41690-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807090945.41690-1-phucduc.bui@gmail.com>
References: <20260807090945.41690-1-phucduc.bui@gmail.com>
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
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index e6a56cf54ae0..d0d2aecf9005 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -587,6 +587,8 @@ static int mtk8250_probe(struct platform_device *pdev)
 		return data->line;
 
 	data->rx_wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->rx_wakeup_irq < 0 && data->rx_wakeup_irq != -ENXIO)
+		return data->rx_wakeup_irq;
 
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-- 
2.43.0

