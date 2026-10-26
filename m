Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016573;
	b=tzWrX8gO153OWciTEKriA7+8NkDi8V2y9fNjZ6bda1c9U7ZMOirmea9cME4RHcOfGpSZ
	 G+IltCS9V7jjRC7O0vo5xkS8cba4VZayFOk7TqcUe3Sazj+SkCW02V6VIR6YGCPVwRns/
	 DfZoqi2v/LbhFFOQBLagE8pt6q9pYbgmt1OZs7wL1ssl36VbhFa2TlMstJnqEojJzMp9K
	 vzhPs+B6A+QsUEporNfuvyNrPFNIP5gOLniFVp3ItkXdP1ANLlYVa6f3bp8OAyKqCCj6V
	 mlrlQN9JgXDC/7Uyx+uUS46tuCiuueOs2A7081UrT5ttpG+VrrvcVv0hrolRhLPbTZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1XPOBam7G51rl7n3GTaB7HD60REecu6em+DTE1e8j8E=;
	b=RDbDCFPENRADAFNVtb2KYlwEiBQGeOt178R5nFoaMt5x7QO8UqqmalgogdW4lppipKgh
	 ZeKVFC9rzCcbMDuprv3Cj4WmIGPGtj1JJ216jO/sekVrBrPvBFKhWdyrf0L8Leo2zXlc5
	 P8Ne4QKZMAkPo7ECdrTz2mm0RpDtYen9C2agAkVCMsYDXVg/V5nV8QNoWwFyIgue/r2cw
	 aPUAlb+XrWmvzzT1Nq0xikkhlWTanznbYLooylZGL4UXEq/JfUkEXVeFrQd+DTba9cVA5
	 VQZZ/NDOg4h7gzFbvCf4rxyO8CualNogtQ8B6Gnxf41yS4dIfmyIouawpiKsn8yPD2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOOm4Ef4;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3632C606A320
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3632C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IOOm4Ef4
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so12844005e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016571; x=1793621371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1XPOBam7G51rl7n3GTaB7HD60REecu6em+DTE1e8j8E=;
        b=IOOm4Ef4YDTqKiGToDXLmbxqjqQL1TIvvhk4ERP/ch8VUtWXD3OyfF8p+pG1NnZ5es
         1JHByO622WHqoByvRR3qc0KFrjoNSLhPEtS/e6kyE2qtkHRZz+YN2uKJHltG52/MjNXm
         S2Xp1R+AzbvgHiV1DFxRvyUasvOfVknS+PARmwyTg1YfamwiJqi8gNiAv8JQkVbHaD2d
         nSgxiGBhnWjdv/Fh0lRfRyOzDgRES19kECggb9GYwIDWimthSxLb/PxGfdWNh94HkxiM
         Ft3YgjyPk//uVZ32BqWrkLlgSF6k8mLAXe+x4dTxhU3cibtdeFvxARYLlkOUJFBfKfN8
         +VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016571; x=1793621371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XPOBam7G51rl7n3GTaB7HD60REecu6em+DTE1e8j8E=;
        b=Ao4RWw3jqdGt+n6QFHHPpLNlZV/QnwrN1aCor3xGs7lGsvaDswdCmHJARkQUixGXkS
         RQmy0+2R2WgjPV7yAMNr3tQ2K7kpl8Lf8GZCLn7MtMypxsIGfVJGBVmn04C+L9QRb8KQ
         J6IkDoXUkvW9j2oQJRIbCMeBc2f5ID+DqeIe0bPdYCdHx7d+TcwqcO/rHbREFLz2kMT2
         lUA6GgWzj+Gkzuiqv5dHSRmsgysJvyqz2lcPQHWJmnnBLrnrU6XtJc2wYQ44FW21zjbi
         hLocXepidk9SRnXGxC1m7V3ZsTusZgbCWpuQ+FrWz95/FfCN63lRDHOkEezqoGWRWsqc
         g1Ww==
X-Forwarded-Encrypted: i=1; AKwUvBwt2c3GTyCwNbfGnX6SVGqs6q9+wYj2yLIgA0NnGgtkj3y9ILiT/8QKXpEJ9IDwTbsnq/IQaan+Cu12KF7z@vger.kernel.org
X-Gm-Message-State: AFq9FYKxDR6DRFMMUFycU7u+txhy995rKy/Hc7q9c4S1PvqN041tFaou
	tjZ2EYlUGVCyGe3W+NUiqjvsxnJ0SOhTzGLNTkym8qmzHYUq7Yd3RUM5
X-Gm-Gg: AYBFou00tUB1uE3KCtm833dH5Qxa4mnWHwOPn7ncA3Y/+wgJurRH9vYipvuxjJ2Gpko
	vgY2hW45ck48GFgJjXNpeJ3/INn9KWuJvb3obtRBrsagqONToqExNeKmfWSs1EEKEQn2Yd90H6r
	RX4Vgj2vOj6diwULv5BExJBM569K+CaviEMKGsaYvsoVZZKpctuQf86DsdqE4e8pz/FHwNkk65F
	GRDr9BVspQb0ucoDuMMtSo86+U1UEJT1VhC7bue0xLXPlbAQ1Tz1xNWRNsXwvSjTQrl85Y7xPPM
	p10QtovsNuIU9V3dT247mk7h1zsxx/0CnCRb961mQLAuI0he7r9qf3phgm/Ad17o4zsCnTIaXep
	Lm2UZE26uF3uwBmQeDFbfUuJN4cBld7txlB3yJJpjifuUQaFU/NYdLPM1IgBXIKidSEV/dV5LVU
	WylveL9pZ/VBKW7izS2Y008JevSp58ccyH9g95U+aQEi4RXt3tCY1mIao3+xg074IZmi4/JHlrL
	3SnUwHSEFxc1IsxCfzGI0Ci5BkMSmlQRH8i7KXA2W3LWE/0oPbjKPf825fd9yKVK5MmNYkn6HGo
	4iT6Ju7Yomy5dGWOQaLOqF/4KlwpV1dTt7khsI/dj0lcA7lkQS0qgwTqx07BF5GIuA9jeHpNjHb
	9nonG
X-Received: by 2002:a05:600c:8b86:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a35acb17bfmr117309135e9.22.1793016571251;
        Mon, 26 Oct 2026 05:09:31 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:30 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC rate
Date: Mon, 26 Oct 2026 13:08:12 +0100
Message-ID: <20261026120920.1667982-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IPQ8074 NSS NoC bias output feeds the GCC NSS NoC clock without
a divider.

GCC and SSDK (Qualcomm vendor switch driver from SDK) both configure that
clock for 461.5 MHz, while the CMN PLL driver reports its parent at
416.5 MHz.

Report the 461.5 MHz output rate so consumers see the correct rate.

Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- New patch to correct the IPQ8074 NSS NoC bias clock rate.

 drivers/clk/qcom/ipq-cmn-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 74a2043632b7..76678a4d6b7d 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -237,7 +237,7 @@ static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
 
 static const struct cmn_pll_fixed_output_clk ipq8074_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
-	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
+	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 461500000UL),
 	{ /* Sentinel */ }
 };
 
-- 
2.56.0

