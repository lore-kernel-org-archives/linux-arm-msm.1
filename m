Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323925;
	b=n7lDKi+LVUtT61FeCWBAh81BgDgYW1ePYOl9Pkuo1t63/v6H0SZxb7NhCphTsJxwsPUc
	 MwATPpR99S+Ii4aHcZJ3JZL42lesvHTOS/dCQYWKglWo30hSDFzrF4FOWpj2hKIWMo/TH
	 DF86uQDQHLZAC8O+KsGwn8dNNPTJshE09tjxiFQ2KoaSFcGAIYNhApaTabs22Mwy8I8sF
	 L0iqmLfmNt1LqS4qIDy6NyZpkgG897s9prYUonJAUCoLXmJFYZr4Tbf/pPYnWj3+yvXLp
	 M2lKuWX4s7qG2cyq6Fk5oOkgQfGzkylYUnU0HVa7oIDZy4uhvzY8uTxGhvGAvQ8QdtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yIlFDFOCLlOt1ZkFsp4BTd0cM3qgVmPIY+YJA6U1sSQ=;
	b=KCaDFl4ettZ/FHfZXMZ8PQ++TPHFU8xCPJgmnqj9d2VZXkw9ckgdBPFIVpxvo83xs4jL
	 g0naHe2tVYomgPdnSnJ0lmRWawHXEuBTfr2IhK8UVWbXKJ0KdbE17QLlTQjQsAA5ogoH5
	 aEEzaybdWqEkQqmoUQeVGZDvasTUyYLm1t87esEl32nvnUuXPpPfUjABHCXE9zDjWtURi
	 sss7BFlatLPTHMpvSlb+bLZPfppoI74PqdPBoONcShS+rgBYd9Ceq88L/+U6obSg2Vurj
	 hY46d8euWmCv5NTCTJvQ1Ho/L8L+z3Vb6HVF8KZMlC9EyC6ZK6LQrCwunTaPyyBrO8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX5cy0R4;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ADD606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12ADD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX5cy0R4
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8246b13cbso1867235ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323924; x=1793928724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIlFDFOCLlOt1ZkFsp4BTd0cM3qgVmPIY+YJA6U1sSQ=;
        b=KX5cy0R4Pf4Wt0qAcCTxPKYp7HxRWjYf0GR34UtxG7gl8as6ytj5y3x/4HRoW3Dz62
         4fXqTs94DPRpsy15NfAnupgAWSvhHYBg3PHctkCe5bV4t1bAOizZOGzwkLs3U3eiw+CZ
         DaTBbRw72BmuUGsvLx+0A4yyuZR5jIFEdAUuRqNxJwk6I8vbMfBIcM0bfcvzEGtSG4PZ
         JH++2F52MFmjXP68AUVWucqCeR+AHXmPgGCjGWxCfrGQnDMhxCsEJwbl53bdMhHFsmWG
         8vJbnMtwV/ArQff/+tVVwPi2N3/XcY3A5hKOugo398kJa/Yq5T2JBnndWXB7z12z/Da6
         6xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323924; x=1793928724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yIlFDFOCLlOt1ZkFsp4BTd0cM3qgVmPIY+YJA6U1sSQ=;
        b=IPYAEBv3vI+zeeVrK1rBg9q9RhMWwPJa2mJPSc68MzVDkcpkpHG4FhtTIRV0uU/bL/
         v8gIoWAJ6mYQWfmHfMoEewEQIZC/cwotZXR/G0SShKx7z0b9evEwu5vvsf1lAY7TpGMX
         0AzrKzglGXvTlvTNWPoSx8FoMy1Zanc3cs2q/jUl0xJDI86WrYf2P549+F+YIR06X5nt
         nJE4HZXQgIZnI60JJSDW1gxMIPc33MJ4Ssz32iJirtxTRqrLpcmjau8fVKHv7P7krHin
         9c5xZ7qyR7fyK9/6LgXQVVOHf6t4pHYUWFC3BBa+jPwvSEdtsQe2KtIKcYFP9jcissOC
         8Tuw==
X-Gm-Message-State: AFq9FYKej37O7pypNkEyinn8wwayOaAVN+C6ymcb8lV25sZ6g/Vz+e+E
	lM8vuLuf4gJ9xKeq/HHrHa4GushM6XD1Rrzng6wFtXhdw9deRZRIWN8n
X-Gm-Gg: AYBFou0t7SEciVFOH9CiFKcOSQSookjIohKSw8EhHvGFPXR947Rdm2ky05XKxdUKMid
	F/tBhDOBKveA8sxra18L9t8RBVOKNA6ZEp0i0hXuJxjlZg7CTJriv//dW4qpDJhS95xdOy2U8A6
	Dx9aBPv5fpGJMWvPaoF0+YgbpPPJGEj6aVn89GeB5JfVC+blyC9u9P0eyxqrKzF6NA5+P9iJ/Ee
	cBnSaw0HvAH2S9F/TliMU45jjDoSoaT/W18AXERsJXpYVzmL0+MhbflR59iAktxFtixHmKIkhox
	yKfHRGUi6QkKgugE3HIK/3MEOOCFqFH0bmmLCfj3MAdonKlsNFygtU3+ne2Sp/SkJuPM8hSNyNM
	IpovSAcoUKmQLBEAlx6ViIwi8fem7XLcSPNfhI1kKQfhNO9PcorcTAmq+Mb6EeobvH4FigSYYUb
	omWwWlsppCuPN6qluWDT9TL2jrqxMwl3EOl95f0Z3djhHP0ErN95M1bh5qutMeV/QExQuyU7/BH
	46pQ0HO+RecFrgJF80DrdTBESzCZ7xveRtqvrFYt/RpK21ejzbmxwxLUa17jwrhcq6EUjybciz5
	Qy+yMycqQsD2pkUECEQVT6tU/ivz95rQJUYri68WWrU=
X-Received: by 2002:a17:90b:2742:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3ae897158ddmr638114a91.14.1793323924302;
        Thu, 29 Oct 2026 18:32:04 -0700 (PDT)
Received: from localhost.localdomain ([240c:c983:5:4bbd:2481:c7c4:68af:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm911575ad.73.2026.10.29.18.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:32:03 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v3 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
Date: Fri, 30 Oct 2026 09:31:30 +0800
Message-ID: <20261030013135.158157-2-dc_redstone@outlook.com>
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

The sm8250-hdk has an on-board SD/UFS card slot,
but the SDHCI port hasn't been enabled in the dts,
so we can't use it after booting.

Enable the dts node of SDHCI for the on-board SD card slot.
Add the pinctrl node of the SD card pins.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index c1c673086..ad60be5d5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -396,8 +396,47 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9c_2p96>;
+	vqmmc-supply = <&vreg_l6c_2p96>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_default>, <&sd_ufs_cd_pins>;
+	pinctrl-1 = <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <40 4>;
+
+	sd_ufs_cd_pins: sd-ufs-cd-default-state {
+		pins = "gpio77";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	sdc2_default: sdc2-default-state {
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+	};
 };
 
 &uart12 {
-- 
2.47.3

