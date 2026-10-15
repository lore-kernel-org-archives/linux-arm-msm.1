Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A3350C2B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057797; cv=none; b=IZDTcvw7FpSRjpC3DsuXIbj+HK0HlImftFJQuigNGvifkuKQS/oKubDcRVvswEIDIgOgqV0+EKMCeV0lX2CYYOzqlCyYZt2+Wx8m4Fa/LGwpb8o3jTsT36s515Pdu8bTuIX8Mjz8S8KSG2f+MkN+JKd78qSnO9vAQRSKNjy6kqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057797; c=relaxed/simple;
	bh=ZOpltpafv/7LlNWra6wWjfFa96A+83F+yhqApR3l6JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gRXjcnEhH5Dlf5YVVIlqFpBbCego1oeHjsatILJRj39SpGBoMyGXrQ5oVfsEuDqI2fJBIeTDc7fO7U7QKzW5JFqC/74ZVZaZICCJSWOyVUkZ2ywrM1hL7sCWQCiWhEs4wab6Fa05x5eYpvdZUYos9mDt1dN5ddAFj0Jglrcgx58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=KAa7pvlf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="KAa7pvlf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dd33a7bd4so1375843f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1792057794; x=1792662594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZtTPFUdhwPPjPop4o2Vw8B13QBJM3YcreGJyrx1Qvs=;
        b=KAa7pvlfN9u1gjVrWFZ+5GeN+qfPSajRIwkJ7IzoTZjpdwy3h4vC0Z3Ws3h+3Y3OZD
         tLDamhB/H4brlXm1u+0MG7S6yw0FM06O+6McvXfODyIb9sxhUwk4zEAUCUVLZNzAyF3a
         vkToGr5ZQDTkUpYhEKs5GOcQkvlrtBn1Qo3XBWiEY2cxVZwp7xz8sOz3/MwPMu0Xn++/
         Emgb8LgRZp5EovzWJqNdw64sWx9bWP0OCz5LRiLS+vy8AIqAm+GB5ZEeokOL+9NeBD5S
         +1wDW9lXZD3CEQteiAwBmtpqZdgL3K3UB7zRdjnfguT55dh8bQpsU4JJlkveI9PWG0mu
         OlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057794; x=1792662594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZtTPFUdhwPPjPop4o2Vw8B13QBJM3YcreGJyrx1Qvs=;
        b=IL94MYfDu1D9TFQgOrgt5e28E+2MZkPZQ0tc++5lsGovyJTI56fDpmC214og8koqLI
         nAOyx92C8jub7vV4cQ6vzrQLAp58haqun7CLZmUqQDORzq1ZxUzdqmSZEVj/yDPQeiHg
         N2ga46HdKaVWw9+JiLV2jqZUXwh4j7YPhQNo9YYzD1IX4tXS7A9KpTWJ9Xn7M0Krz/Cm
         RgRPj56IhIklEzS/wqqEE+h/L4sfoAVH1kYtqlapnl1L3pTS8L85hUcfS/u7NYlzB9Oc
         JQem2GYKWCX70E/5IDLdztG5sB+2k6cpTjJ+idKVRvmiSyJckx53WrE7S1isyiMgdCK/
         0tew==
X-Forwarded-Encrypted: i=1; AKwUvBzCgM6Chlm0NHK7frl4phS7nCaHiLIy7GV01ihT+rQc6xvIVhZvZJBhgb6arMDmwxEZ6+2+EvUiLtgoMFBK@vger.kernel.org
X-Gm-Message-State: AFq9FYJSvW/fAcEPA2Y96Lw9xErLjpN6AF/j07sO0q2MPoy7KlFzuajz
	FAyECOjtQLrwCsJ1qkhlTEre5JD08RIFTthirw5zbM4MUqlyGGu60NQPwErcK0SIIN4=
X-Gm-Gg: AYBFou1Fl+6vO+sjXgMRFTrtqP7kP5cZnujZ40D6D1MSabZatX4Yd8OeRHaohcdEmEZ
	6zKOYb+OReg5V/FXGceqFhFNgw+68f+lew+6VKz4qduSba0+f2yEcn2L9e9HojP6pXMmXslPrgg
	baXKrE4fls4abHNBX4hgqRvhi4/OCeBu4OprKkOKPTBER5LlDmsARIXfRfLC2/mia6dZkbfeEb/
	qStRJghDPQxKDMawa4ECAK92YvNTOa1K9dr/5XdQsEGFpoRiH/iY+8HQFHWPPr1ILNbfZb8njbZ
	DOY0a+o/KFgADCNy8Wh55+933IaX4bKDuyUWo/WMTGbQRhX4cGru2ANmD5SvYgt+5XTzcNgptyh
	6mZroP05pLzUeiWS4VpTu93T8VY9YwUra7dFh6FEHeTHNHB/jjDOKfFCTT82xPCQv+lHVC0Oik9
	0hTTpFWwUL5HAPzunvodJMx4mkYKDU6bhzmmBPE2SPYZ2IOXrxMsYOp8Y5aHXrgvze8G8YDxjKQ
	BGmgLVBjMiiFHSCZuw/+w2DyRgdI15DPVHS7a7oU/8p+cZ9aJAB/jVJ0v2IAFy4ztofdiBkMIq/
	GvNJIS/bWgLQ37+1S4KyO3UVAOCBdMgnqVfDOA==
X-Received: by 2002:a05:6000:40ce:b0:48d:bb54:77e7 with SMTP id ffacd0b85a97d-48dbb547b24mr36277483f8f.29.1792057793781;
        Thu, 15 Oct 2026 02:49:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:737a:1f7b:d586:a293])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm16926246f8f.54.2026.10.15.02.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:49:53 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 15 Oct 2026 10:49:32 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8550: Add the CSI TPG regions
 to camss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8550-camss-tpg-v3-3-00fe06a3c557@imd-tec.com>
References: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
In-Reply-To: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2

Add the three CSI test pattern generator register regions to the
camss node, matching the updated binding. The TPG blocks sit at
0xacf6000, 0xacf7000 and 0xacf8000 and are used to generate test
frames without a sensor attached.

Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d21c04b1a306..1270ea8e4fdd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3862,7 +3862,10 @@ camss: isp@acb7000 {
 			      <0x0 0x0ac71000 0x0 0xf000>,
 			      <0x0 0x0ac80000 0x0 0xf000>,
 			      <0x0 0x0accb000 0x0 0x1800>,
-			      <0x0 0x0accf000 0x0 0x1800>;
+			      <0x0 0x0accf000 0x0 0x1800>,
+			      <0x0 0x0acf6000 0x0 0x400>,
+			      <0x0 0x0acf7000 0x0 0x400>,
+			      <0x0 0x0acf8000 0x0 0x400>;
 			reg-names = "csid0",
 				    "csid1",
 				    "csid2",
@@ -3881,7 +3884,10 @@ camss: isp@acb7000 {
 				    "vfe1",
 				    "vfe2",
 				    "vfe_lite0",
-				    "vfe_lite1";
+				    "vfe_lite1",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2";
 
 			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
 				 <&camcc CAM_CC_CPAS_AHB_CLK>,

-- 
2.43.0

