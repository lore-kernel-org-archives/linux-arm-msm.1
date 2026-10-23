Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740584;
	b=hfsS+z51fpn3RMAH4z37JQruFtERHTAmEjlU+URKKiobGsgfx/8MnwYMdOxOtoTtcl4g
	 tEzkybCGUEcDE+8C17ZTYsWm+GK2eqDy7HAkfPSO9OjG2at8ZAMhmZS4VI3vuyDudrsig
	 IoicxVeQIBVkoeYBcNysw1PIgi6AZpFm5s/xLal7r8gfpUuRPT2mF+DifEjEMcKcNxHFj
	 RWgw3WFaOT2ezmvjQDKsE+wJg03p0w4t7WWzmkcvdSQH6Grx0FTyeZF1qRZ561UFeoXZU
	 CpOtyY31deUhn7g8zw5+NWfDEQyi7w8ds4+9MplWRU2G4XRhlCHJKlaRD4g5vnhevLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eLVHH3gc9lK1BMaQAW0mg0NLpVegVjKZ8M484qroJKI=;
	b=duZF3nUEuL7XC2T9q4Hv3pzjZZNZt81bI67tW3o4K1pMv26liRRymrajLfjIyi9e0fjk
	 vws/5HFrtQ/KQX9PbA4QZ0Mdsmv25SvCOjjMajhxZ9QYe1JGL4V+KkBhc2E1hf09qVOdC
	 5rTJvRgWZF1wG/YicrxOodvbSGONZylyX1iowDTA/wv7a0j/qlWJVfGN1wX7gR3fUa43O
	 dmnIs/CYlLI/l3Lxaq3PdfESrZuui9owq9bUS3SHjpziYGAC0pMIVJpg+kez/Na/sPp9J
	 LUQp+bAd7+3H6dP7fRonrQq2veV7uSD3+uA4e04RyslmZyvAHcL5y6cS5+po8N1yMGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mpJqVp1Z;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F567606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F567606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mpJqVp1Z
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2dd76b1361dso2840575ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740584; x=1793345384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLVHH3gc9lK1BMaQAW0mg0NLpVegVjKZ8M484qroJKI=;
        b=mpJqVp1ZBE+Kr+pD0Uhs3ZTNIxFIIsiBshAGAGzVbiwoIQQLziZNRV3J6ziyOSVCX7
         ed/BmgZI9xfHbZc4F4lKJJnlmJMDOy+eqrrc7kOAwRWMf0hlvfvoOqhGjlVOqXF5Q0iK
         5YfwcRmBqj7sbD+U6PA2zk3xyt9lULgqYwpstBsZqZ7H9pghMZeCkLIBpVvivOaxOwg0
         XHChKjo4xpSpsGb08zo8VJoXqLu573AzzA1J0qiHlFW89q4PFSfTtW94arGHZs62QFOc
         P76ZQjPAsy77L/JIguXeRNPmQsx22hQ1g5caL03mRRgB9Dx6BOGYUfZR+RfSoIPxOUsr
         grmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740584; x=1793345384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eLVHH3gc9lK1BMaQAW0mg0NLpVegVjKZ8M484qroJKI=;
        b=G7qgcurBpfKHBotAnoIkQPvRhcbsYk/MdX5bfFmQhv6EVMvG+lSx9JRJ3Lo5ftJsPT
         ZyZEMGwVO//jnpx3N+HSMdfZoAjdso+ozYUooQDiSNGAuHT1/vYNKJGp8tF1hMfx2uwz
         PMGiTyQfGXQeNjjsel0B3FmFW/6CgQsjYgdii8NhkvJLtiFQWnKfW/ozRWXhGibSnLuW
         vaZwIuxB1flAlQuatxVUFd4+7qx5TG+fQML+D/f6MM1Wx1s3wn8GhymrNx9z4B88VAtq
         TymtxAvIdoBT/Ufj/5ep8Pb8u2KorO1Ffc2gxXkCprnqd3hvwCUDEXj5Nwel00BHoiN6
         rL5w==
X-Gm-Message-State: AFq9FYLeOfU++gAVrqBEdVh0lckWCMxyLfXrN/mGGrQYTMuqPkXN/DoF
	+k+RlvPmGz9zqcnEIAQujf9jXqEjcjpqUoCqllNOmk+/CIpHiHp6ZgYh
X-Gm-Gg: AYBFou0844bHMjVgN2yA62nONj1ebQGKiTeXld/NWYP5zIxfxBdkBgzgBPrufywYE0b
	wJ8hxZBRqsK/mvfx0hql+LgH8bDPqIfsJeYuVp4z/56zqHybKchBdCH+KnFrfBU88g84y5UnIua
	Dn/j6s+NXQ3mUTxhMKFOmNj4eyRTt3DmcSH4lxkBR/h8DmmTVz3M+pfWxdLHmJ1TISs4V5Ml5ZJ
	4ao5ZzaetHxfNZ0kx2JnmUVkphDqUee0LsUSsyCbKeXSrWgXUSNJJLsS/6SPkOlokAH/CxMDmkg
	FwyVIanrthJM2zLk1IfhvnRrfrHqfLgCt6hDv5XvVwXpo/rMX33pw1YfKk5dqj2DyNXrwoIb3rf
	QQPkgHdo1G4Mlh5TTcYQAMWMBczHLHzuQWSYwBJGgApo1gUKu5qLcia/by9cn/ITBudyEBHfcGt
	f/DleYSuHdivVdDAMUyujET68yhw4o6AbVcyik1Ub95hLIrjRYbsrNRkE9xKM9tl68GELAqnYRw
	xoBAqi0Xg7IRfSoZQqdg9YiDClcfdkqE7vUfBsfliVOzIqT474FkLZZiqfWnX/x+GdInK/7vQ==
X-Received: by 2002:a17:902:ef43:b0:2e5:38bf:cb43 with SMTP id d9443c01a7336-2ea7ca06645mr15833995ad.2.1792740583614;
        Fri, 23 Oct 2026 00:29:43 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6a466sm6858715ad.9.2026.10.23.00.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:29:43 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH 4/6] arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
Date: Fri, 23 Oct 2026 15:28:30 +0800
Message-ID: <20261023072832.2642647-4-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023072832.2642647-1-dc_redstone@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
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

The sm8250-hdk has 2 PCIe ports which are not enabled in the dts.
The pcie0 is for the on-board ath11k WiFi/BT module;
while the pcie2 is for the M.2 connector.

Add the 3V3 regulator node for pcie2.
Enable the 2 pcie controllers and phys.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 7a2903941..bd9b90fbc 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -57,6 +57,13 @@ lt9611_1v2: lt9611-vdd12-regulator {
 		regulator-max-microvolt = <1200000>;
 	};
 
+	vreg_3p3: vreg-3p3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	vreg_s6c_0p88: smpc6-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s6c_0p88";
@@ -722,3 +729,24 @@ pm8150b_typec_sbu_out: endpoint {
 &usb_1_qmpphy_dp_in {
 	remote-endpoint = <&mdss_dp_out>;
 };
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+};
+
+&pcie2 {
+	status = "okay";
+	vddpe-3v3-supply = <&vreg_3p3>;
+};
+
+&pcie2_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+};
-- 
2.47.3

