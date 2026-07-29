Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE4C4749D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785324454; cv=none; b=HcZQw/bkOPs+P+x4MF1bjuzIJ3NoyBe/jNf8vUAq5jMhle+Npz9a0/wMevg8A3vKA5/JDmGVmYBtWyMN91vxqrEwuTJOUJ/yZlBalRiBiVnyYSzE3LajyO3SBuaW4CourvS0BA30mCQkJN2cGvpj25x/1jlKj8aQbtfL7RPdEyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785324454; c=relaxed/simple;
	bh=o5fuh0olua3cmod/5ayAnVMOpDpteZ21Pp91RNNLJQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YEVCtUOe3IFDAnNZIgrDIXi8qnO6V2KOMzMgpdTQtxbw1rcSqPtCYc8aalDDV8UbRZYQaQnaDBTV9pO3HmKH1MRhl5y9675YHn3OWk7hnFwla9Ili61h3aklbjPPxMTJCDOKjNqs3DbFLkmajHN4IcD1YAYuinspREFodmbab3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PpioGXT0; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PpioGXT0"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aec090da14so70324e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785324450; x=1785929250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pWtgZKuw2W+ngq7ib5CKwcZeLXinWBcwq/8MK7k5OM=;
        b=PpioGXT0dPHRAW+OzKD0POXZK53LP4g/4DjOvStlbF1ny1m3ZHedQINi8MLvOrQ1z3
         fKuhL2xcTgEYmEMgW5Q6a1MwqvjQsq5xsi486d+xHY1LqZ/PQieKe9TcybegkPMBnFbI
         I7KF1BF4M9w+4yjMw6MxufngnF83LY+k19dGiuMxno+YetnNtZdVxVTXUOKlNtKmyH7r
         VVFYxNMrEf9Qug9GHeZoLRCqYqI94KvXGmSUH5kMz6k3f5xxL2Mj4crhKWVx3S1y5SDI
         Baw9y8rw1sIJgX7Rf1LdN3iKP7oJxL/kg/0XopR06k4TywN0CQqR9KT9OR9JbEXDtT8Z
         kpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785324450; x=1785929250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pWtgZKuw2W+ngq7ib5CKwcZeLXinWBcwq/8MK7k5OM=;
        b=muo7HPrK4F+K7yyj2E/Yn5EUOMz6KD2YmZLnWDOS4clt3M9SAFHMVaERTfovXOvfnU
         N9P/5WymqvcMrLyE7ujLd0MjgFzy58AAL35uvMT2NM5DfmAP4tMr2fSnGCNP98WGqmza
         9hoBx482szMPYSjB8aJ07wVSKxsXMEKu9W3+wuBwqSAluIPCyoCGdJN3exBd6fued4C7
         kfOxvryXdnW4idI/Cd9Ku+KaovyCUG3HF/eaQW32hb2zwXcPyx9fZvzHuyTSp5gk3rZK
         jq6dCjIhSvml6CeRoVBx9oiSGmLV4raIyPC3PYSt6u8aZlRBcXQMRnibZpqbvogUeYUv
         KWMw==
X-Forwarded-Encrypted: i=1; AHgh+RooSi9ZBlXpdMDNMIGc25K3VfSI6MpaWcOL5Bn5SMhTZhI1bT4zMMwp+83Jk/U9AmKyXyOcut27HvxToVcc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvq/B9MAVj7KPpxB283EBWU3++KjE2jEiNgVrItgyYe3gokiJY
	ePYK4UwpqV+kKBWFhbgP6izPX8isWRZFRWW3M5k4MlfX55fgKh1lcO/wxN1s1Ipzm4E=
X-Gm-Gg: AR+sD11RnJIDYPml5rCbgKPqjuBu+KU/875vOdZigBSfs0CG3Zp3X0KG6WcFgGc5DgF
	vJxQ/Nd8ygxRMFvLGAB3ksY3LLFpxr3v88c2LTXsvE72I4yKgem153TwKpsJX8YOT50fTPVZG9F
	GZbJirkQGGnWwLifLAA+AxgjiWxDmd+ZuMpQlYqIt6rqNWd3EcIcfgL9RZJoC5fXFho5RZYaPN6
	DZgA5pEdB2z7FGCZCHG3SCogaUInfOfsAmPTZ70dCXW5NEbL06wz06YtlvWVcqzhGaEBgJzAwSq
	grMgw5FcklzXuImIMYugZ5KgTvgJPUVxN7Tvsh7jjvYtxKJfejhmL+Lsp4qKWxqsSBvQkN1WPm1
	UEvogAioz0xJZfqjIC+ZuPbf7V65lRP7+uNyAoLUXqLZfqQW40/8kK6anJ4SI49h9wrtscdpUVS
	9eOV29sIFYQOm0cVsMjjQ8gDNrvHpjHDCtOhRex1dMlx2DEU+u5D7Lz4Ymk0jyTQu/W72HYoRD8
	3Sv3v6CayH80zpKwwvCYU5mo9+XRA==
X-Received: by 2002:a05:6512:3413:b0:5ae:cf48:bd37 with SMTP id 2adb3069b0e04-5b2d0247dd5mr930296e87.1.1785324449626;
        Wed, 29 Jul 2026 04:27:29 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2d76aa2b4sm336457e87.29.2026.07.29.04.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:27:29 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8650: Assign CCI clock rates to 37.5MHz
Date: Wed, 29 Jul 2026 14:27:19 +0300
Message-ID: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting CCI supply clock rate to higher value of 37.5MHz allows to
program the controller to configure its I2C bus speed to Fast-mode plus.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index a64922c21267..a14e11d81488 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5615,6 +5615,8 @@ cci0: cci@ac15000 {
 			clock-names = "camnoc_axi",
 				      "cpas_ahb",
 				      "cci";
+			assigned-clocks = <&camcc CAM_CC_CCI_0_CLK>;
+			assigned-clock-rates = <37500000>;
 			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
 			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
 			pinctrl-names = "default", "sleep";
@@ -5648,6 +5650,8 @@ cci1: cci@ac16000 {
 			clock-names = "camnoc_axi",
 				      "cpas_ahb",
 				      "cci";
+			assigned-clocks = <&camcc CAM_CC_CCI_1_CLK>;
+			assigned-clock-rates = <37500000>;
 			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
 			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
 			pinctrl-names = "default", "sleep";
@@ -5681,6 +5685,8 @@ cci2: cci@ac17000 {
 			clock-names = "camnoc_axi",
 				      "cpas_ahb",
 				      "cci";
+			assigned-clocks = <&camcc CAM_CC_CCI_2_CLK>;
+			assigned-clock-rates = <37500000>;
 			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
 			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
 			pinctrl-names = "default", "sleep";
-- 
2.53.0

