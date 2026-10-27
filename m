Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088574;
	b=W0BpT9KkS1PBo3G+74SfrBNHkvDbP1CHgXYCV2JOilloFtUt0AOgbtbsYwaHItxCRpj2
	 kwW46+0OvpPixn9bcZ5UCuIgm65nFrmbE3iEa1LpJiDltoL96+HG3DnvL4Bg39dCZ9AD+
	 6jHLgDwTSSXr21UPuPyEzDZdkPe96c3VZtDP/9b4FnZa9GAahqwNuRp+3BNC8/kSWk+Kd
	 wCzyf1trI2mgGiODCSN3X2pmpeG1W08xFz9VRpJQzyE4wdj4tO/4rEnCr4+VVgVbDa+TV
	 0wDB7UuQLZsMIuqWLrIx0VlDL5OzDbyWUPStHEUb1KsjS75k7gfmEcefGZvYvQ1ACqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yIlFDFOCLlOt1ZkFsp4BTd0cM3qgVmPIY+YJA6U1sSQ=;
	b=zxSukgHMVanQlcbA2zrP1bhP/ODXS00aR+eWWgTrXdB/dRWJ1Lv8q6OZw0Rv6zN/73qt
	 /yY4oWc9LVlLXgIXyFv7U72kEGrQSVxntnvGovcnMaFAK7tiy+9stB50xLQFMpLxim4bf
	 QZpnsP/ZlN9uhVsDwzxs35MnpR3Hp4SDO5dKe6l2c2dNKKsriq4Ncs34FtukDrwZ0SACB
	 h8tNR5vgLe+SetPFD+SMOZ+zfwxLLem+UxtLjWDBknHCZvVP2Hq2hCyffktOlJ5MOmXhR
	 VM6XH0np8SbgvtsFx2OGgm/QTx+ej7Euuj9ZU8j5ew52UOZDI0pwfJEW8Nacq05UfKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="A/DANsdY";
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404D1606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 404D1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A/DANsdY
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso614887a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088573; x=1793693373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIlFDFOCLlOt1ZkFsp4BTd0cM3qgVmPIY+YJA6U1sSQ=;
        b=A/DANsdYOfMZdDcFo2VhxZS4HLmDEhEXfo+5iHr4cINMUqrSCsuSj03eR9mc0wM/Uv
         rb3o4QNYpdlEbFwP0jlxP0rAbPOih3gJMmHdlz3riMA4GifVw0n4tYakhiA5aMz8sXvD
         eP5j61jOAYuj0rXjJ6Uy+8nFlcE/iWV8H0GmNBya3NjBrPDdrx82tFjE26NGk3pavMYG
         4vVLkccHH4u9JQ6vTw25myiGN+GbSslRyKOFctFqfz2Qor9BPtXqcynU06PF3MVD07js
         vZXzYl+GVvVWtw5Y+eHAlpfGqebCu9TTlyoEiymQwGo8eahElkpax9V6EaJnKwVYEVAd
         80/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088573; x=1793693373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yIlFDFOCLlOt1ZkFsp4BTd0cM3qgVmPIY+YJA6U1sSQ=;
        b=yMYNMELaSyLr0BXh0yDh4TT+El1YhZlQ9tOIwXVI0IFoBCQHnrQ0Wwiy3R3dh36NQD
         sGeVID/beijvzbjBTZC3BpUtPhQOjSm3vAd3qcF7rgIPzuC/3y41IuWsbMLtlWK9GS2j
         RbZdZfJzR8PuPAVRIC+50lw1J12opXE/8QyA+NqhzN0gSNg23guyx7bm/vPsaXxh6CYy
         zZSS472zQfpIad9v1krSJqW3pzx7j4nDVCNVgeobLjiySp7gGfERpqZO6HZhW4PE3/fz
         doTdSQkZGm1JXCBEJewgDFXRGz/zQ108pboXYo6ekFmpw/FdSHqS2CTmJ4b8k817/FTD
         WK3Q==
X-Gm-Message-State: AFq9FYKdKruZVUlLJnnB3Tjzh6vu3anu3uIPQpkEgY79CtGfRQuVRIVh
	Bsx41ZMWzhmB8k9RVRZEhHZvRvfgoGr0Qs5GQ/la67I6B9jiYAN/lKRA
X-Gm-Gg: AYBFou17qLstE/irdhZQEf8Ds/FzObf4n5UdC2zIrsIrHkL5V2privvrsofokOv7Gsn
	23HvJjSa+RNyfQAzfThhEM5e9Qhs9ZPWWZgPHMmTImccD5/gA9JjspofHxyo6xF4mYwzGsLdp2B
	VUcoI+aQ1yx99ixGSlsTbazurIx6XyQRv810v/rstDPa/e49WxAwOMvArJV/kULdGPx9/SJd70i
	HO8gyqbPWBzecpFQnxfY0tZIkHp9rJXoSPsgFwSS+z4zx4SZnOlHycxKSo/GNfQmY+oF7CbnDVd
	eXQoe8ZRxWdK7ia6HWYxr+MHIGkKGb7cuJTwq7Kr2cTpau3Ahv+i0+62CPWUtoaiOCQVttic+7W
	C0lNpYkmCc5muyHj+yzTxkg3bNI7Rd0KUWMYUFglIe25EiLAUvd2f6TtG4KFho9pI+Oq/sDor5p
	8Vwx4Bn0Kv0gVkXdE5Q9k+5Fj8nkhm34kAUA71C/ox8H+3+tEdfB7G3VNSfXreEdVz8a7/Nqr70
	OlY10i9hBVvpoWcmrM1tINvwYr1VddZUgECxDp8qtfq4c/U+8iOA+TBdSmwipgwqXRRbIfwZBra
	XnSxxulYpbx88m+HrlC0cxUQfsXCgk+yC84LqGYS4rmhiPw=
X-Received: by 2002:a17:90b:134b:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3adeb0ff8b8mr7038477a91.54.1793088573225;
        Tue, 27 Oct 2026 01:09:33 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406361e2sm2592284a91.8.2026.10.27.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:09:32 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v2 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
Date: Tue, 27 Oct 2026 16:07:53 +0800
Message-ID: <20261027080758.3990418-2-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027080758.3990418-1-dc_redstone@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
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

