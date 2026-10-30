Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323937;
	b=TZFLy1fNQO6uS4u5kDzj35dJ6hv3bTPgWeRyUX6rQOPURXspbVAUK91UOaaAdlgACBSk
	 MXdTcEvALr8IJTSXjuwYqfDuUfu3FE/F1WK6vO2AjWXjBJSJwOo2ov5Qs0q0FJEP2j0sY
	 2/r1BMKntgZl6dMTHsJsJ0x2UYGCb2GiAtuMXUXaYQygmbCkF/8ydfRVw3nZXjoju+BOb
	 tfPxYsaWqYH9Ef7PsJDjI+r+M+ptvns7dhT/12NNvvfU/2JQgF/Dif7re3F+czfxoPVF7
	 pGfDUALAGX/9ujd4f0o2J+cm+sTKJFQmEkqlHNYZQ6sumAQHskujTZsPvponAlBXLZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bLVb6wA6hpXv4ng1CXTKPHF6TirtWtpxB3LCEmyOUF8=;
	b=Yukdbw+0/YjR0U+mbkcPIfLyK1cM3rpw0JIwV/iRtN16LX7unE0UzjkkgY6F65CPNNXL
	 a9WtyRVL3q5VXW2SNKO2fGnDWZf5u3Ar/isKTlw8Sq88ddtW35RK6Pw52E/R0PhjUxgcK
	 B2UtX3LUFXFR61yumQveiLAsdFr6k1gohS2p9r8dTrjlYpRou1AsuiIv6gAmW8nWalNDy
	 ZszbBeLNQY+yOtaUq9fpn1hyCa0w4SX7wp+XMGpLGmmuUmOhmQBvmSXUZ9pNzZw05H7cZ
	 7ujJ/ezx5+g54f/8y70wOKag+oTeU40GoMV/D9xmR2q0GUeRqOJrz+R5xveiDmQA8+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nt6GIPQr;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B21606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B21606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nt6GIPQr
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ea0efd636dso1903955ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323936; x=1793928736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLVb6wA6hpXv4ng1CXTKPHF6TirtWtpxB3LCEmyOUF8=;
        b=Nt6GIPQrGe+ghLLgDNrWtnfNPXKvsjyXRuuG86PyfO6+OWil7zALcj/CyZX5WNE554
         GVshKQ0HEaBtm/Os0EmXNh5yDLa6L4xlTbVvWTt59/P38kYTCeD1X/urdL/Xa4cfR9dt
         Fr/c+qUKtFrd8HADZvJ6SaJrfSGABhtjnzRhDqFE6TfPXp5UnGyDlI0Sl3HaDuTqxITj
         zdzpvATfCYrG4OqBDdt9NKipGDO3w7ryy3sGOjvX9hfJX+7ehEv4JG4Z3IctiORKhbWG
         TGgbUZG0d7MXCPCB+4SajbFvUcU3Nhlm/v/n7bmzJBpTAlFPuf3shF9BAvemoRQ2tV0O
         FyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323936; x=1793928736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bLVb6wA6hpXv4ng1CXTKPHF6TirtWtpxB3LCEmyOUF8=;
        b=ZDzlt1izxJ0RKUbCst8lH4gHaQD/wcRiwN2St9t9mrxCrzxKS9AHaeSkpyQT18fxo9
         xKoQympvtp6vcNfZmh1pgtMG9GcsFclJXtxryQSinVr6qPA/EEPA2UdxnR16AzzyC3wZ
         XWEcnWS7y854pB92Me9SWskN5CRGxAQ+6GWSEMsMV8gbb4ZZus/55UbETzv4M/khm+it
         BujKtFRhKJ/d5E1zJp3JK7BykPvemnDXL35aneJI4XWFqgMtmYMQtbfV1niEc6m7OtWp
         9DP3VncgblamgAHkGA/cj70AHCxmo7iWjmJ8Ao4IXP4hr9xyTnJaIhgHF5qaco7jafzo
         b+qw==
X-Gm-Message-State: AFq9FYI7cdo0yQwdbRQpNjz4kiZbRA+VZN+GVAlcwFrMQ98edsnnta4Z
	UmABdYIFvDL75F1ayIpELW59o2CTYs4TXtOTmfHdeBWfK2ZaIBDxxE/d
X-Gm-Gg: AYBFou0Qg3VyKZ6+gidrDa8WIcPxRLn5e55KJIEARKwLHUFA0R30mD2n9W7Ml0IR4Lk
	AyNw+kTDxhq5MNrzskLi/fRFODG1FA+paZgJpqAyvW7TNkFPPaSByViAsnYlyXp7O/abdUlJgB8
	KLoc7peKUHpJCUbSw1kuz0H9yZaYkg+vPQoYluM9u2K8nx7KStqKx7/F6zjMYNABlodr3kJL6L9
	TIMpr17sFhJjlf94DDuOUaDyxnP1bUSVm+N8z02SfuBEsqTT3ne/L4pFgU2PKhk7jHVmEv/94Ly
	T4Nqsviep+00cz0HLsScuJuoGzsp8kdWGZd9xpb3vXo40y3k3Omtr72+EdJFIot/gpnqBpjEdEt
	IYND1X6zWC4EkUBaxAnpT9F8w6iPpHsnxFIBdDh2RDW4NejszFTn4VTE4r0k+IafsxelF2jXY7Z
	1R4ytro8kbxJ5+jOPfcNroPFunzkGU3gdiHvZi4RsvpdX5xB6gzilYBOF+4aWEtU2HvxGY0baQ7
	j8tjPKrMXm3urugpHNYt5zp+AQLnFfgGfawOOGC8TuPXrOPJixRZhzBWw6n9JOGv12TbxD8kMhf
	LVkT/AS7v/giV4bci1pA7rCv66iNh69IZpNPI2b1wr0=
X-Received: by 2002:a17:902:f70c:b0:2eb:a1b:e9fd with SMTP id d9443c01a7336-2eb364de4efmr10001075ad.41.1793323936252;
        Thu, 29 Oct 2026 18:32:16 -0700 (PDT)
Received: from localhost.localdomain ([240c:c983:5:4bbd:2481:c7c4:68af:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm911575ad.73.2026.10.29.18.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:32:15 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v3 4/6] arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
Date: Fri, 30 Oct 2026 09:31:33 +0800
Message-ID: <20261030013135.158157-5-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030013135.158157-1-dc_redstone@outlook.com>
References: <20261030013135.158157-1-dc_redstone@outlook.com>
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
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 1efa9d53e..fe89af067 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -55,6 +55,15 @@ vph_pwr: vph-pwr-regulator {
 		regulator-max-microvolt = <3700000>;
 	};
 
+	vreg_3p3: vreg-3p3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_s4a_1p8: pm8150-s4 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s4a_1p8";
@@ -499,6 +508,30 @@ &mdss_dsi0_phy {
 	status = "okay";
 };
 
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+
+	status = "okay";
+};
+
+&pcie2 {
+	vddpe-3v3-supply = <&vreg_3p3>;
+
+	status = "okay";
+};
+
+&pcie2_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+
+	status = "okay";
+};
+
 &pm8150b_typec {
 	status = "okay";
 
-- 
2.47.3

