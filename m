Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B563E1723
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704482; cv=none; b=ac2LRgxs7ZCyLwU477rUvtjBrej9CzDHr3GLzjnpEddtJaMlz5OcsoWKn/bWw1mi6NPlR2gfpDEcyx5QZ89IS0YPXyzqXur24+xXOZd0yt12p1YGDIqEfiotKbYurV9g3X3j98jAmi9QxNP8JaaSana8JPJnC0sWkJAwHSjXeFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704482; c=relaxed/simple;
	bh=K9g1SPytudaQ80/4FyVWQl43Z2IGxbYxunNGayfA1VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oklDz/H214MQMmPSIibtY8k/iK2t+WUDHGrNGBaC2yu86QEL00UGKwkOj/QEBs5bDw3p4PtNXN643ine+WD8EHAHSfGQIbxs8xD0UNFkGQRpioEa7rGmFwswoPyEuDRke8DqTIni72JFxtUNXGGy5R45qK3rYLHRl2yJbMgsyTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K99ys99S; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K99ys99S"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4843e9c5960so2626966f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704467; x=1789309267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwbqmAMM/ypUlaqINsrCHwxKGoX/kGgUWXbINf9VL+g=;
        b=K99ys99S/Q4at6NWbxmgD9Xlkxr7bksLIIS/FxM90ACDbIzjr2M1M/ym97QYYrzfks
         gDwA1pltynEngyz31Cm4vYzC+sIKqlGwZvc4wv7Tmm/iVWDa/Swm+b7ZyiEnPGpnvowr
         l15/QmbvNynef/7kYPYG9/5P5/z9RcXzA7uDGRVkkdkVpdG+nmI6Vp80CECwOCgfEoe9
         FJPNbFVTk1u8c0eTRfTdX5E9yFgY4OE77ad+T4ZvycJBlupKb+xpw9xwqDiEF5LJmOgI
         M/wszP4aEyuRqDZxYwDHzdVV4B0ZSAxI5dZqpcbGhN1FfBqMuf14rsHjPdpReohhbCBM
         vFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704467; x=1789309267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwbqmAMM/ypUlaqINsrCHwxKGoX/kGgUWXbINf9VL+g=;
        b=WJMGI/w9ZvTt9raDPclY1H+GkFLmnEe/+hg/kytvRlPTPi2zx4bS6iebsfd0x0ztnb
         jpX+sayZuhAljXHMnEuRRPsaoJZmBLfFlmlBMcK1KFSzrz+XH/Xp8ODTW35kB9rLYDTF
         vj61QQU/yjULaJigAz2vxesMTuCPTLI2Qzrdlkym5bP95FD/vNsRnT8jqvLpIuYbWVFa
         7bT10WkeaZnERfQb38Asm8kSm49DcF6CR9ZRg5kkEbeL3fHCqngxpr0rFyLzCE49Zkho
         xZ60UP5PzjxK1ZnXnFCFXMsz22b120y4AV0p6UYYceaMLeeAFgA5ehj4P79irBRDdOcj
         cfww==
X-Gm-Message-State: AFuF++nrde637/hYF0FZmKgAP5iaGTOTG0qswq8FjH4NIYzS/4Bica7w
	Lup2zebG6L/e/rDZ+zXzfZSymgcCQQEO9B5dXu9rDE5q/8H7BjDR7w7sgUpOfN6lkbs=
X-Gm-Gg: AYBFou0P9609frDiajVtvdR8WmJxtaspXGCnWmceE/zT3YAIMtGDyuntNNnvF0AkYla
	j0QsKz7wGL+uP6ETIqElwmvGq/+xG9zwiayss7VZqH2Aqved6UuhLTCyN3Rj9e7rQJ3ByCXEEOU
	4l8CyMLItX9SvY/4htcmWJ0MBftw5myJJBALrpCpvmAjEeyCYYuw2KjM1VlP2ITShMW6DHcA1FO
	/8SC+5rqWoagU1RhkMebdXwXIhQcX9gPXogMvBDQyn2CRnJbZICv2AOZnpw/JWRlCEU/mp2E6Qp
	JScdYnobPzviLdkvpI98ZAU93Ku88dx8E0muO0AJg4d+/qO+ZB2GUybOGQrTuA7+OHq1D8BREZ9
	HENTxhsVU1bh28RMznfsNBEp7vCCMQWSPKI7IB4VYu2Pfthorq41z3G0i/LhYGZ69eNnhlVsMKA
	WqEY4+4UJ29mC0Vcpe47Yfld6PS9aeHiYZv5Urswp2Dzkk2ZMbVzqzuJ5UMudFGUTO72ZaWD4wm
	4wvmfItKXA=
X-Received: by 2002:a05:6000:2909:b0:485:8dd9:910f with SMTP id ffacd0b85a97d-4858dd991a5mr15138977f8f.9.1788704467103;
        Sun, 06 Sep 2026 07:21:07 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:06 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:56 +0100
Subject: [PATCH v6 11/13] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-11-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=K9g1SPytudaQ80/4FyVWQl43Z2IGxbYxunNGayfA1VI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbDhEoJTD2v+EKZ64ZpYHfHYp9gMmFoT0UpO
 dVOYcDSXbCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wwAKCRAicTuzoY3I
 Oll2D/9xroTKd/5qJAUKKIKyvXXg38gFtBnfwtVJT4MWAP2mmKU4dp1CxPs2066HL43w2R3GS26
 Oa+Hmyo5uVGNAnPBjjc0OjPNc89/nv4QC7KMtJCHTysndWfK0gcz4qmbTJN6XybJAr3AkfjpQbI
 qyt/ZJIZcqElsRO3y2S2D08vjRipciG+OWQXSWjBV7aCoxQsv9yxblrn1PmXNzp6Tb/TSbzT8SZ
 932kr+bu26XtX5iv5T3ahxH4u2Adu/HsV2fRgA/ouQvIO+GrkoNyntNryVOXb2BiDA+KU4TeZ5L
 ldSuuktTvV2yLMFfuRsGbZSsD8y9oxNBf6x2167ncwEslOf/+WKH+3Pl5rjOtUqLxZyHAEeMFXv
 V71skipgaajOtHwdQ8tmXVCLCBHEM256iZlgSrCI4NMIopi0ZrvYCjGhtsUJCmS8E7kwebdaArn
 IsdMgzSOM685H5qdOTb5Ehki6viDjm69tt3/Iofm9E05OBA8sQyS6GHUR2h6WKIvpAsvWyAVpGy
 kO3ESKajF5H0TSXcNW2/7MI+Zy4l5mdHoiVdUKxKlOFv9Y/y6u00umoqIdBRAAN58YIAia3MxsE
 YPBTT/j5MJVJfnfZ+grX5fKod9NLTFrD86as2ID88kM0jCxYC1o59V3Wmukfs1dtBBwsPnnEwHH
 T8Umu5tAyRXgfgQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Some sleuthing work by Aleksandrs Vinarskis in the bowels of the ACPI
tables for this part shows we need l7b_2p8 for the avdd supply.

Suggested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 0a8275d501f85..bcf3e2f610e66 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -552,6 +552,13 @@ vreg_l2b_3p0: ldo2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;

-- 
2.55.0

