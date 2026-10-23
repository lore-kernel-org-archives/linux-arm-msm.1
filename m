Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740571;
	b=jOGmpy21oGUh7CSPh6eEL2RngEz+lj+oObi2fqVHlRAdG/Lbg8wrgsbst1+xSQbBORnn
	 FfXV0U5N9+YRnJ796mCcF5EGvLld3kqD8nhB5oSNMtrRIG6xwRj0ZTJ4wlb0Y7wRoqoyN
	 5sYZrzrgLCKOs0t1VVCzhTcDsqPrR/9ZMxmzlpMHT5XEzYDWedYEuj/ChJ9vA+3gpuYaO
	 3v/2aUMBf7JNubjpxTONFuGaQNscoeT+jwzRilLkmhLSdD+VWixR948cCyIaRmX3PxI++
	 C5ExGcmzamIv4q+lDrpYWKxqOk4RyCDc8HqcR4oWfOol77DFY3k+dW9txh1YkJO4UKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+5UHV1G0YVSK/YoGiO0tozDo+nOza612odgEK6eiNJE=;
	b=NMmM8I8qPV/VV3Ztp56yi+xniDE53VM7kn/HRlUiNJrZfd5VwYBD3EzxQkE9fShc5n22
	 xW77BYRlaXE3rqBTZOfbaGjorMioQKGDLnrWaWIwc0xK6fEWtJARlOiljCVcDteysuz9p
	 sNAse6hDKXEiYgkpwPbeTjRPRqUEFSObtU199CS3Lqsq2wYDzMqLaJNzg1SLMHK6AnDHF
	 mhHQWwlsHAIMcgFspqDOV0u5HYdd460jfwpgCzIVgb9s3Gp19xb3WG+BF1XUHiDBvzp0I
	 zHsVBB61/snkvuJZerOS5ieJPW3A7qxcHrC27HEvhc+/16i/Q6BuAIIEFwmN5sPXhtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GpEoGB4A;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264ED606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 264ED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GpEoGB4A
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8fe8e343fso2661715ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740570; x=1793345370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5UHV1G0YVSK/YoGiO0tozDo+nOza612odgEK6eiNJE=;
        b=GpEoGB4ActhJ17tme5qS49n3VkDxo91rpsAwE+aaUy7pqELCSZbbmFdbMNCp4Bg9EY
         sZPJU/zII4O7Z5F5k+jRVNIBSu4JTvFwHvNnpFLrkWXMUNxm7hp7vSoRkQbC7vKImuiO
         GEi81FnsHdjurtXKSbPc5VuVPnmkim8os3p9mmphJvZ/5Drp+iVMbgsGAHjeTq1VbzT1
         qbVsIYKaBdbxJJWYRn/w6sffafAxYbub4iAN6X2XGRwMJu6mCJa12pT8JtHsnbpEgIwK
         5nIPEPyfGoSdIiMVTTl9SGK+EeJv/Xs4M6v7MdDqcsZ6QqR1yGA6Bem8p38AuCesaDmB
         d5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740570; x=1793345370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5UHV1G0YVSK/YoGiO0tozDo+nOza612odgEK6eiNJE=;
        b=s3fl/UcEEab970qOxiYQVef5Re3ANa6xXnTRp43xjutGXCMxsi1oqgOUsMu6AocwL3
         Huw+SDXUUrF14XdS2OOm/Jh/7+ml5BuZuHSqtrj5+itdeox1Yb5eySaFBcbYx/PAEZBD
         85SHcayJtlgaUOTLhLvjghUuXFWyT7KT3LEHuuyMeNrq6KnZKiaPtoc8V/gEyYYvCwa1
         lWZGQ2VPA2ieTghLvygPELgSlxm0LGfUaDGF5kP8ciVz0nLFzHQ1kLPHdHMeEf+mII2R
         0ax2mpor+AXoOxbigHAW2DuGsuW+elj+h+qeKMgxLC7Gfck67q+0oEydmfE28EKl0dbR
         c3tw==
X-Gm-Message-State: AFq9FYL/rxwLLWnWkRedMs480X5NPNYZJ/BTiJfKGppSsnyth6GUzWIy
	/b49/Y+4UtT5G3lMaZO45Eq7laUs8Go9ntzt7XFAJD31Xlq83/T5Zh6A
X-Gm-Gg: AYBFou10d27/fN5YPlyrY+9H7udG0qFHMVrAkS49WW2QV+YT8eAQaqcFnZRKH0m0ZWL
	QrCib1f+LNRLytaHez9pKfmiH2O61MJcfoNEyChXBROqgxZYx7/a6Jk61+7KyBpaXmBBpQc0uKJ
	as266dvYg2RGFxyUDE/TtJBdwvnbOQgElWcGtoCgB/34IJtvPRwQfFypaeBuAiGTQFEFb2wunKR
	UM/EXFFzR0SsrWIy19AX+3nC/UE5ptaVJYk4BVg71QB6dSuNGP/vMxxzcffvvjzBPFlxcdrkMd4
	gscLdycr+qKiDe78rxYogNIMJIEOh7sdy9SxN0wCK1OsBe3+Yr/FSsBZgOyjOf4sEeWyt8r1oHT
	Ls206TXaphvhDBcH1mOKRAiLRH8Z/oMcbgtXXiC0YnP73qobLbKaTiTTnMsCb+im9Vz9fuRF6ft
	4Mxb+6oT3Pz7yh8XO1y/tpxVdSXyXHLvNP9ngGM4547SSG+BONEepwpnRL3AV8GRX4ketwmWZFi
	ePxodvP2qUJMNWxu6v14quIg1NfJfaU2StUz8/43PvymPSxl2tt5RlNhnqpcziY+9mGZwIVHw==
X-Received: by 2002:a17:903:2b0e:b0:2e9:6788:9373 with SMTP id d9443c01a7336-2ea7c2bf29amr15867445ad.17.1792740570393;
        Fri, 23 Oct 2026 00:29:30 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6a466sm6858715ad.9.2026.10.23.00.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:29:29 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
Date: Fri, 23 Oct 2026 15:28:27 +0800
Message-ID: <20261023072832.2642647-1-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
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
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index c1c673086..a049d78f5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -398,6 +398,32 @@ &qupv3_id_1 {
 
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
@@ -467,3 +493,16 @@ &usb_2_dwc3 {
 &venus {
 	status = "okay";
 };
+
+&sdhc_2 {
+	status = "okay";
+
+	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9c_2p96>;
+	vqmmc-supply = <&vreg_l6c_2p96>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_default>, <&sd_ufs_cd_pins>;
+	pinctrl-1 = <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
+};
-- 
2.47.3

