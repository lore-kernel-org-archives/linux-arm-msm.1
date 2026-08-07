Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D78B3557F3
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093815; cv=none; b=a5rt7D/vuavzQyQUfPNzoBITzuKc/SLN2XTrL6xSC6B+ErpHvW6e/YXZEWgnkx7j8LeoVwEfufJAPTnaXSF/ELHKjbO+Oa6IDzFc/yjRN+h388ytX8cJRq3no1ZMZ2xrNQaP1ftnU+E5r7r+58N0XjbXzElGTurEoA7nGXVRtiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093815; c=relaxed/simple;
	bh=g8Pd3hLWXKDO1TxCxTibVOhcinoabj6frf5OHE6N6r4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbN+XF05wmSldxBfwzK8QRQdxQIfazDAdKxYLBI5QUC1QlLr+2z+RPIBy58ILzxoG5sBQsn0OQsxoWFnAEYAM2xY2JTGOkr4DZSk1fmUMHiibYbtNZEf95WPSfNSw4cKqz+bY5YQZdfn4AWiIAAUfthROE6G7Y0v8ihfGkB/hw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pWsZIzPp; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWsZIzPp"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8487088510aso4555184b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786093813; x=1786698613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ff2PqEjwL9/E48n/LYtyoRX7V3j9un3+kJnzZ64yyh8=;
        b=pWsZIzPpqelHngJ98XRM3q6m1VwfH3Au1wer4+wHds6MxvevrWaAIwAtB3vtxkmGj2
         K8NthasfzDwZS7huwZBUlL848HjDkkdjK8GnLvcvhy5tOeebTj1ncNXge8ecyRfIKiM1
         FzsAG9vITXDLisvDekxSLmKGoXKCAeTwW7Fqsq1zX4mrQaJmoXVLnYw2RxRuWBXM8UgS
         xswQkft3hM8zYi3ASOhax0FdIAIAhpBsSi8t3OgSsGmX+z6oPM97kw97k26h1yZ7HMQU
         TG3kFKWslNC1TTBDfM7L2I12e59TgeEOvI1dmO2xiEdtto/R7lqDEHsd+vh1C+DuvF0t
         FNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093813; x=1786698613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ff2PqEjwL9/E48n/LYtyoRX7V3j9un3+kJnzZ64yyh8=;
        b=p5B+T54YhFDG/ipr1I0nvJUDCFMVg/MQ5Sj7TeGbgjZ/Ks+aYwNSyl24EEqQ/KEMnM
         xAsu0dpweKFZokQEag7BeiFDa6NwTsRjBiPptTqjMBHoyXEqB3GFD8T6TsxK1serzAPO
         cCMpgbLppgGT1TnmZcJgcGOaGxd77Y8z7pfsPSzUErWTg40DjstmpsgEPmDN9bCJEMRB
         VEHgiuyKNcC1A4Z+ctxhPQoVbGSKeSpQgbfvHMoZgEzo4Y6aF2DkeXk8M0J7pq6tB29V
         TQCDLnMNE646aTbh+kO1RKVRB1mhRtVjSX+Zi0K2f2dTjAsRRcZN9SHRuDISSMx6+A9t
         d8ng==
X-Forwarded-Encrypted: i=1; AHgh+Rq5k7us7z6Dt9G+GFJAc9rZgwo/ZfzxW3rwS8DjNyHstparDKLQOCrVutRTRBPw/qGaQRRf3QsTvZ1GYSQT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfa8JxTaQ+kDVOUXlDTPbOvlCxZFfpAuEyViKAxtqkVY+N9ze7
	RwC4qf0oKH74hkrFDFC3I4vSkCwRi58QDC5Suq+AhqS8EhT2rdWdtdWC
X-Gm-Gg: AR+sD12vWzEi5jr468VYc6Gcwx1bzWWBDY5BkfB1Y2TuytpHP+OObKzj53epic7N874
	rrC3L3jS9xS5swlmpe0+3jsclkoJ4E9mqBd5KhgqQmG9gDC5VtODUugiqrdTKeRdX6o1CluflZs
	XNPSVnONCuUpQhltm76lRB3zmK2iOXtjmgmG8aQYIuIO40G+X62d4uma454EGQovhTqRdvCHh1N
	EHkVi8+m0GVFudBLaNRi+JGPFRWHufRotM9Atn9LHpoGZTro8TLeXDaDyMYtE9yAFX+lAHZFfyP
	AYSbk4qj1erAg1FWKEqeoihagB+5Wg40TE3KgRIMizNBdZyVXA+DnDS3cywzoKanfe/N3o6OIvB
	xTzDptv9hjRt2+OAhL1dYfvs8+TgnwU2KI6mnIoa+oLig5eTSfGV7w1PnG139EkgxRcOzxxs1d4
	YqMIruxEftosGVq+93+r2ijRxn6kbGUWAI34dli5kyFFVmar1XpqFvCfwqva+/p9MleKdAizyKX
	E3+CYG86VSHsYEYyr57f0rteuDEh2OiKlm54df1xYUTMlESBScSDxm6XgM60XJAhBCkDHugVXPH
	M6g4Yj7pzL5/Zag=
X-Received: by 2002:a05:6a00:420e:b0:84a:6726:62f9 with SMTP id d2e1a72fcca58-84f2dff7c61mr26343835b3a.9.1786093813505;
        Fri, 07 Aug 2026 02:10:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm715908b3a.42.2026.08.07.02.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:10:12 -0700 (PDT)
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
Subject: [PATCH 2/3] tty: serial: imx: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:09:44 +0700
Message-ID: <20260807090945.41690-2-phucduc.bui@gmail.com>
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
 drivers/tty/serial/imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 251a50c8aa38..4224454d360e 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -2463,7 +2463,11 @@ static int imx_uart_probe(struct platform_device *pdev)
 	if (rxirq < 0)
 		return rxirq;
 	txirq = platform_get_irq_optional(pdev, 1);
+	if (txirq < 0 && txirq != -ENXIO)
+		return txirq;
 	rtsirq = platform_get_irq_optional(pdev, 2);
+	if (rtsirq < 0 && rtsirq != -ENXIO)
+		return rtsirq;
 
 	sport->port.dev = &pdev->dev;
 	sport->port.mapbase = res->start;
-- 
2.43.0

