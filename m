Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668980;
	b=AspLZP4vj1Ta1Xm3fChuMbq58702BQ6uPniY1qA2aNsCXUwdgz4sDBjFuUuwhogKU+qP
	 4zQZ0V9sGP2pEtqX08jZejgZhw/jBuyglJOtv980QzibrPngWStKOMmQAb/CAxGM+GeDU
	 K9rBbsNvltQ4Cv5fQQQbPCjJ2p1zzjWtBsH7DhocgbS8GIIrG6iGtmLE7A4KKbvN9n2y/
	 ysKVcp5bIC+xZ2AdvLK/AUcrwbJkHfIUUGyg3mfraoL+FHMcyLEyTBQ4J1JSq6rdLw/XW
	 zr034kVMPsdXnvqcdO+39QmiD+J34sIxYq1E2dPHal44I2wJCJJRqCmnikA9aF3M7Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bfuoG+nZyeQYfwICqr8wZaR3SV5xzcqhy5qUYyq70HI=;
	b=VLAyc8Pk1OEBQb1gya9d9p87DCbeTeOY08kHFzIRXZfUfvmBRwvJsYwXmwhzAdNIHyHo
	 qSdSUvwUhYQSG7UjoBOcYWcOw3KNZ57pkxcTFMuHrW5UjFsmhmxkUzuLADGR0yNbBKm+1
	 V8HawsUaQhc9lUCLkDDch1UBYlvAHNX6ymwOA3j+kiIBHZX2ocBlJ0OoWWkw7+jBGYbar
	 /Ls4pb56wferAlodgBMSjMD14BzuVaY6tjuVbHFxyOwNeXxBMg9FqldHxhTbLklq1SLtC
	 EQPQ7Vek+SlrOTe4dSdt2nixLfjihP9qXO4XsZeYx95QbSEUjJWpN7+JtyOPAccnlEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZnTPfHJ4;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B26606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B26606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZnTPfHJ4
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so509868a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792668979; x=1793273779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfuoG+nZyeQYfwICqr8wZaR3SV5xzcqhy5qUYyq70HI=;
        b=ZnTPfHJ40xy3kmxyUvyr2B0ZqNZtmfGJrSVXAcGIcs5nDXm4SvPiLkuO9W8gUzr/Vs
         b1Of1qQ13YN2iRXvvu6r4aFaF+G/ocaYW/TT/Z3p4dSAGm0rJLESCCm/hfrZU+YHxNih
         qH24JhIfdKbjYC/XHZVx5hAcmdjkEKlBXy2RpjkRq4MJiIAguaz+/pdsGdjk3dszQH76
         gSLIRfaUA3qCSglB/zqfW+xaqph5ycvxKFlRniJnRkA4f9F5q9LOgwwdRiRBrQ3u1i8d
         kdMQv9FHkkLXtCT/C3AkbgmDNhZr+fj8lMMSg/2GYbKUL1vQ7Biy/VZrptXnzQGp8DPs
         mpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668979; x=1793273779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bfuoG+nZyeQYfwICqr8wZaR3SV5xzcqhy5qUYyq70HI=;
        b=RyofuiRHrx2AZyxwbH+e0T9OPRx6MEzoPCVfMuHj8zuum2HndVFzJ6g4QgMe/3N4Em
         Z3NTxfGzyyt8BaLxtnvMsbd8vtMZd0PrRwWjIh2mqw7H5lGvYa2LO2GYf5mTyr3qVuLI
         3zgsm+7lwksruS/XxjIXT8KW7TR0Rr2M4z49VmxxvRUSGrRT79NB+8OVYEFbbt+Tnvup
         koNInYvzROeAj1a3f19lDg4VX2i4t0GB1NVQZj7no6OilkRbJPsg+fjKXIjI6ERHefWO
         ruYGNa2YsK+viA2HUTUOyqTHnipfonr4cbmeJcmSInhaw+5AAn1mRIjm6qOa6En5jidt
         I9ww==
X-Gm-Message-State: AFq9FYIFiY6pDfOMGaBzQP8WaHxLIK8vNTgjkYNtxhnP9/h3s7DVsieY
	PIdt5jEC283Mja+TUIfMbAHVePfz5RoA6VO15tyuOZ4IIPPX6u9enLZF
X-Gm-Gg: AYBFou1msdHR6p5l2DBUDAFtt2YfHLn7kMnmbDYK64ePynw+rqhSXAoSnnMtSWm6cZG
	7g6fechsi5HK41HjEkKT2rzOioBrhofGCSrxrlWYlYtX66SFoKYQlpZbF5PDsbmPqu+v4qID8VP
	WaHgkhZHfJSTVMhr6q18BoyYQ/00/z0WiiocswI21yfqfGhOICgUmuu2NwVVBnl0UV0CCQYH2Fq
	/wQVbem1Whjjv9L3ualOtz4qSE7US7F2WwVmjgb+FJJrEWS+G2TTZNzVlzDfIcRpYT5DZL/Ouuj
	6zSI2g0AptJZtpLrXmmsUu34C7uumi3M/Ah6KWWksiF5Qpj4IVJYghfwS9cAY17V1iBIA1dki6h
	FY+fhAHzPKl9e/sPbZb4+e/VOwtWCnD0DKr811zhPe6Kh4aYWWOP0nMeXjGctdiVpeWCqatgfp7
	KYBaTnxg/01vlGwbC0T2eCbwZRsA51spQr9zT7wrZYOyjRjJ+oTgMMqhnsggCWbpWfX4Kbql8LP
	W8WXJ6J1iv2cFjT5lZncIIH2kIVpLE9OiTviZITMhrue6h3CA1pmKI9734Z8i6fXwhOVo5lvp5k
	Drq8qBkF+Pzle+iFOa8=
X-Received: by 2002:a17:90b:268c:b0:3ac:860e:1af9 with SMTP id 98e67ed59e1d1-3ada6cb5e87mr1241992a91.41.1792668978969;
        Thu, 22 Oct 2026 04:36:18 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5edsm3997668a91.8.2026.10.22.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:36:18 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	redstonee <1516235445@qq.com>,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH 4/6] arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
Date: Thu, 22 Oct 2026 19:35:59 +0800
Message-ID: <20261022113601.2320940-4-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022113601.2320940-1-dc_redstone@outlook.com>
References: <20261022113601.2320940-1-dc_redstone@outlook.com>
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

From: redstonee <1516235445@qq.com>

Enable the 2 PCIe ports on sm8250-hdk. The pcie0 is for the on-board
ath11k WiFi; the pcie2 is for the M.2 connector.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 9ff15d9d7..77273b6c2 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -712,3 +712,24 @@ pm8150b_typec_sbu_out: endpoint {
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

