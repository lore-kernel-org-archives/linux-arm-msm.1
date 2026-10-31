Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445750;
	b=QfvNmkgzm98QzepnYuJa8N16K4pDJ6XKze+vlHMaLFVUBVlp1ZF8Sn95wF0FJnKpf3wA
	 Sm2Vcfxo6fbMUUB9lIS863Rwm6YjwwXa4kfOngVTPfBUkf0hw5xx0RWhPkZNnfQgaoN30
	 ewZcIN5ChZo9F2ycIJYBaX69J7q1Q1voITzdKwCpE2ademVCUhal2IlxevzeJ/avnOYL/
	 vrdX/q+8lnV/x6/NrtkpFV8nae/Mlc3Z+0dw0kgWWnboaL17aKKIkiQoDYYMJWvnCz90B
	 zluOd4KFCupbKgxISH2JO07G9P0433j5tMK3O97CNZVRNFkPv3LgylatFpYNZEjpg/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8JBgjbAiNKzEfjsqgd6C6n3aL2nG6tu2D9Z/SOgJ6U8=;
	b=i6EIubMiMOOJj3/I7QNEFjWIYIK0RiFGFKUjoy4HfaBoG3NT6shZl+5Hrs5zAUPYgflH
	 gzdkMkitW8k3GRkHN9Hb/YqI6tHbllpFvyilphl0Hi5iWLS8CkpVhZwswkMiMOs452uVW
	 kVpzylrumjPqznNv8EJ6XAV+tMZDH3BD8P5aiwBu2bAf4eK3IW4KKkyqNXI0yfmWZXtIg
	 WOtts9qNM9VV+RcA9GTuooD5ljU2auHbg27viRK0jgG/16QaBYSAAdldJJs/AKxqVBABv
	 Imoj6YhLQ9H0SGLwaGmHTxLw6/MPREpApq8gh+UWRx5/uU2jB01hVr2df+Cv/Bu9TpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QdjuGpm3;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B04606A33B
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 11:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B04606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QdjuGpm3
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso2744501fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445748; x=1794050548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JBgjbAiNKzEfjsqgd6C6n3aL2nG6tu2D9Z/SOgJ6U8=;
        b=QdjuGpm3AtA2n9CkeDY/hf9+Jwq8FSHcJT+66e3eOkqgvFOTaBpTPdjI/nkVoST2wO
         EJCtdZ0b0r2ESLmAIUPNC2BbvqrkU7gbWQ6B8gvkVZQzUpMQRaY2fK4OwOvhCG9+j/ys
         MGs1OYTlHq2P7XcUVbWPfva///1Z1MA/p6+Uy5JedhF+2uXbzNVXf8FEK2WbuwuXwBFc
         y1JnNpwFjt8ngU2rkEKTHqcmk+0X6jTdQyWUu96N0XVekjYlV9/nBN55oBKrEdD1aNw0
         eCnlH9zos6U4I3D59NDa1Q55ts/6mNBPre1Eg0UILOOojVFmSaWBUsJXq2DifWfZzPvy
         ePQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445748; x=1794050548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JBgjbAiNKzEfjsqgd6C6n3aL2nG6tu2D9Z/SOgJ6U8=;
        b=fMTfHWjL8a/dkzAphnDzPAaVgSnTxBew7ZRY6fKDitpRWU0/cSfkdtc5Jw/+c6MRJt
         ous1iZWv2kapTusHIInr3NwjtOTnMklWB/saufTiSdBRiri96DJgK3X+NcYxoS5z+CoP
         lVJe8tkymdqQwvuy9biM0W6+cBqfQesqLpGwB/rl8wHGUaGdQtOmwyeNnlgnBo7QpFK2
         XbiRP41/f44o7sPE9EsHmW2ZZubGfh47u9N8NOYA8OjqSkOfISkM45WXNt5hxGJatR+D
         EIhKEefr9zry4MVa06TWnZdJBDmnKNwhobfaZzu2nRp34NVvt+dpV091ADNG2+8Z5lC/
         tjZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9XQwaXEG2g6J72ehIsL9Yg1gKdbo2qxC+mw3pFlcKCLpYKvLniEs0B6g+P6rFgoGVHPzoLix19wixHyNY@vger.kernel.org
X-Gm-Message-State: AFq9FYKeOB2Dsp99JE6pyMCeDZ4gEiJyrBdQiyqLlYTe3STUglzuiwmw
	G0G1z/+G+N2/D34JXWygWTe9x+mrPPm/mPQrY9UXAhA7DtvYjd7kfSNUtmzadsvEq0M=
X-Gm-Gg: AYBFou1/F5I+2amzRDZh39evsHyU9LfeJK1vzY3y/CZh/UnsRqFC+tTlK+iz/RGnwbX
	8aw5rh6uj03P/wW3fMrWXM5CVFs2MUEtG6okUs7Xj4UxQFOIjyrv7ayUWuDm+ZsAxI7JBv4kxv7
	vfuFpjndUy3mWOIyKUBrlSNl7asxRkssKesjrsk8pxVbEgONLJ/qtJTpUx7ZM3pTsSm1YFtEmxl
	MV+NCKFxFuubEkcEbY2CFHgjrteYlieepIXF9beoPBcQhe7NHYy+S9h/eJSUX730R6y94S2ggsr
	+jXbaKDc8OM9Xp8RvznjmdeeWyVwWQPO+SR8PrdX1MwU7nJ9iNZ91bOYNqjEUlkW94zzS36rok7
	Zq4VrF7VLcXz2L5LQxm7+jy48BJ9HrvWW2TSHmUeCwYlpvEXuF5Uu4LFWsT/efa6ZZyJJ5eD94z
	Z0iBLRf8ptsazuxzXrPCPTTDeQQAQ8o7mXu/9y9NF2y/2TM8igNxAlB/FYGHdxoKVv6EVAaEwFU
	Q8uJ2mtMZLi/U4ENiAqdhm4Uk5Hc+TUoHjHnqPbGRDLpuQshVISQ6GaEnRN4Gz/nnKorWcwA+Ny
	GSkKhJpUKapde1R43t8cu7+hfy7iQcpMxqyH2j4seZw9uRCzZU17m+jH3HaCzlkeGrZpfA==
X-Received: by 2002:a05:6512:3a8d:b0:5be:4d62:4e65 with SMTP id 2adb3069b0e04-5bfd9566ff6mr1862293e87.6.1793445748364;
        Sat, 31 Oct 2026 04:22:28 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:28 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: sm8650: Add CAMSS test pattern generators
Date: Sat, 31 Oct 2026 13:22:03 +0200
Message-ID: <20261031112203.545319-7-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

Describe register spaces of three test pattern generator (TPG) blocks
found in Qualcomm SM8650 CAMSS and the non-real time CAMNOC AXI clock,
which is needed to get TPG output written to VFE.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86fbb0fd6472..f40ba0880c90 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5463,7 +5463,10 @@ camss: isp@acb6000 {
 			      <0 0x0ac71000 0 0xf000>,
 			      <0 0x0ac80000 0 0xf000>,
 			      <0 0x0accc000 0 0x2000>,
-			      <0 0x0acd1000 0 0x2000>;
+			      <0 0x0acd1000 0 0x2000>,
+			      <0 0x0acf6000 0 0x400>,
+			      <0 0x0acf7000 0 0x400>,
+			      <0 0x0acf8000 0 0x400>;
 			reg-names = "csid_wrapper",
 				    "csid0",
 				    "csid1",
@@ -5480,7 +5483,10 @@ camss: isp@acb6000 {
 				    "vfe1",
 				    "vfe2",
 				    "vfe_lite0",
-				    "vfe_lite1";
+				    "vfe_lite1",
+				    "tpg0",
+				    "tpg1",
+				    "tpg2";
 
 			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
 				 <&camcc CAM_CC_CPAS_AHB_CLK>,
@@ -5514,7 +5520,8 @@ camss: isp@acb6000 {
 				 <&camcc CAM_CC_IFE_LITE_CLK>,
 				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
 				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
-				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>;
 			clock-names = "camnoc_axi",
 				      "cpas_ahb",
 				      "cpas_fast_ahb",
@@ -5547,7 +5554,8 @@ camss: isp@acb6000 {
 				      "vfe_lite",
 				      "vfe_lite_ahb",
 				      "vfe_lite_cphy_rx",
-				      "vfe_lite_csid";
+				      "vfe_lite_csid",
+				      "camnoc_nrt_axi";
 
 			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING 0>,
 				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING 0>,
-- 
2.53.0

