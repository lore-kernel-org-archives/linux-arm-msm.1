Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CD2495524
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519417; cv=none; b=H9s/icXUvoRnCm42KJtuMaKyjNffmjo4hJVatxI4a1NfxOaVcosqy70ZP7G1zkjzIPz15+Z/LhFLk4ktPak2v9zh8mOYGKjj/zcYrz1svMAGVP2zVI90h1dKOi17+DYLFOnJ/SirfyEr4Dko7PdltNpZDyd/XZMC0NhgyXynLWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519417; c=relaxed/simple;
	bh=+nZUv9j7gvSqxTj8ozUV/CguH9keLPj+8xmo9gBOgqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7EBdIkIPsnO1EyBM0Y62dzoxxv70gT/3VOiMdItBh0E4RSmlaiWFlcXShXxSgmc83g4csfwN0yz7lrfCFug5UfLvOIHn+7VJ/2n5kTBTxcbv5Fd0vsEruYV9Re6R/iXQrSLrcbT7UBt64LCa3dcD75JNIyO0JHWG02UhmPSiM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OOFxE/mu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OOFxE/mu"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso5762485e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 03:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519412; x=1789124212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUQ3HpNgjBNNWehA6JijWgAwJZ0GFdarA/7qHDAqJ1U=;
        b=OOFxE/muRFuJSwnnezShIQSE+4rlDpG0JULF7McR3VvQdQJXt4K/6CvR3fmeeucyi+
         mL8qAfDiVN4gDxgA420PjIxnNWtM2qFBVCzlks8kcTJXbo0nXz7bxiN632wqq4JjqQ3Z
         IZaXSMZuL4rvQsgwsIo3eu6s0fFzm6CpvSoRlI+d7M0cWfsi228XNmwnQ43VRb8aiIyu
         nr3XERMBQlzc+EAUOOu1l1+UNsHwwQ+0Z6Fe4H0CiVSjbMRXY9xSTJjrAbow3NxIUW/e
         y3W/mga/fhcLr1mgWaZ/v1+h1R7rVHzK0pP78pftk8M02bh9b+wgMbzTsWMh5pwObcBB
         epBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519412; x=1789124212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUQ3HpNgjBNNWehA6JijWgAwJZ0GFdarA/7qHDAqJ1U=;
        b=bmvchQcqcdzALgrdpgvLSrTLYmwYe4WpeEaVz66IFNUJeOpNzDmihGSUUbGGlnjFCW
         ga+vJYKUT/hUa9Gg+oowtssmeeTSePlc2+wn0tYORw48/S64ofgKju5FnTUcFgNOcZX8
         nbnVgXX61WxCholeJf1ddgUFcq4gTV2PTDQSoOSUK0NY124V5MjsHWc9dkS3ubH+mPRp
         xqJuRkxoS87yycKR6TVpMnJwQTs6BgEnQVM5UvgAiYcweKmlm1Ac4ZipjRPDElwLmklX
         bQqCHkA1fHXXykRdXDMziG9JvC4Mo8S6Ag9Hylo6IiMwky5dZ2n66TwgOTt4x+itszCp
         Ba9Q==
X-Gm-Message-State: AFuF++lXsLcR3gFCBwAeLLod1desLb/xbkUhzGHq3hImuKE54tUXYuqq
	KV829qKo0sNzCylBXn9SQ9BPUY05iQDn2hANGVCXQfKOsPe2REE0WUQnzMMwWu8Tr3g=
X-Gm-Gg: AYBFou3yNExNX//xXnyJEQ9S+EkrGsVCo0km+XqKZknao2abhvQonDaFN0hDAwrW1G1
	XodfdsgrZJz+H2x0ZKBViq3ZSxw9Xn7+FuWHk6fTFAG90vcKwHhHsVrXed3iMLLTfibhOzWvHeN
	usQPo3Y6GzGngqP5rAwCiYSicYYa2TnYXoA+fJAnsgyDqlUSya32rRtu7f5iqQ116RQYC0Yhs2K
	a8zWtjbAsWau9PcgQg76qAb9Dq/QeKPP4Yq2MBLxrlilE8iDwAkLO4FMztPXSUiUJsclQw2qVVC
	Q1Rpf00x2M70h0jpvPtxVKCclavanuW1iTnbTHhtf1XFsMVVpORgBt8KXG2nik8iDa830mT/UZg
	0BcqAa7VUiv1LbILAmI/Co0bS0frcyDzzg+7CTdMDgp9snyVhexeosQDRXtJ9YpDrL0YBILLb9I
	7kRv4bt+RQuJbYFdVnuhWzuHyxzzyCHDgX4wl5cg8A69FxTYmjeMjuQkGD0AaJk3cr44I+dHwW
X-Received: by 2002:a05:600c:34c9:b0:49c:f729:d757 with SMTP id 5b1f17b1804b1-49cf824f757mr58561115e9.11.1788519412030;
        Fri, 04 Sep 2026 03:56:52 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:50 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:38 +0100
Subject: [PATCH v5 06/13] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-6-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=+nZUv9j7gvSqxTj8ozUV/CguH9keLPj+8xmo9gBOgqY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPmKaHmP7GoZQcfd1lGlGlpLs2pvD9zUd5Hg
 7w+SdgV7rSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5gAKCRAicTuzoY3I
 OlGqD/93UA+8mblBo0epY5NpJvGW9BHqPTHq3xr9fpgADlpUwW47XivI+2uqn0oS4PJd5yFNxGV
 Yu4rVU2Qhd6eEuCX1jLAG4biktl3XV8epQ24rNs5kd3S+1+2jNjlR2pBhkD/3DhgYIdrQ/z+4uj
 WgVIN3HMW8bd207OQs/9m5Lo72f2GKxOTTbZI6T3glDsBP1rmrBV39mbXPTCnRSy4Rbmzmbz2jU
 nqQwN8tRT/ioyqBNTWR6yqLTF6GRD0ph/9lnEEPgVw5HAJYBOD4l0x2jK3K5UCyMiuy2hSG8oeQ
 AT5GLgftI6xrpdfjM5tY+todxWfcCJ46Btci8y+CZLbIZB39gWmvfk1U8AzEXIcm7la6jKs3dCI
 t6+l3IWWop7FRzDH8MlXDgtrZgHeqhmTybAyNIVWxihu/2K4hPh/dUg8o4eZ8wPJNL/e/rXTQgA
 cbzCF31OwatXNeqgQvWzCzfE0BMim/yBy1E8JG99i064cGYuzkJzxgl86+HRvVVIEmQnPYZephs
 WFzbBR5LOWzOA50KSEv7jyAOQex1h72mCkxrwjaefB+X6TzeNgWuq6G/c5pb8ZIrLGHOI19LJYD
 vssJ9wi9eUyMpfMU7fPOtd0+crgnfr5bEK2WooUf3CDPMO4/fAUjxdrpdMs0WzY/4PTsikHXeJn
 C7dzwN/9xzuBymw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index a9c5c523575ee..7b9a40a7b9a95 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -897,6 +897,36 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p9: ldo7 {
+			regulator-name = "vreg_l7m_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.55.0

