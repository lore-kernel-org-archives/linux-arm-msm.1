Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF20942C516
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299969; cv=none; b=SbdX28gUx8EqIC5Ry2M4J2QuoVgw4bSd+25gAxqo/Gi3QNBQ76f/nm8gkBRwI/NNSnCZ6UcEF+0zyU9Nt6CaAWxjvGLbsJypAUPj4lrrr9eTHrjTJ2K1YaAEj6TwfmupUGC1uXiKOZFK5wYqb4BxX8848cOV6Ro73Uiw5nf7HzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299969; c=relaxed/simple;
	bh=KyU8fbc7e+jGln1gvgBbCQwRZ+9nqq3IhPL/wCHuXiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRgqrIA6+WrEEFjoEbxx++LMu7Xk+Pja4LAVDEuH51EpT/HCYW24eyZKZbShJr+9vXjeOJa7L33YTqN5QEVFYlMhMaoVNIJgwKp+Z6KmpOxQPodBHeLInUVhHtVpfOhDhaTFzvtk+snDYRm8n1qBwmQuB4Ab3hoqz372eSpWg3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scASW0vp; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scASW0vp"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbedf318752so569630a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 01:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299967; x=1787904767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWJvev8rwDkHrWVtePCBv0HB68OwkWKr1ifArwWeRlE=;
        b=scASW0vp31nf5qVKfqyVi/ygjtkjr+we5uVdhmP/o7Kf7EumwHmdsPXH1th0JxrEvn
         eh5ULlEA9n+MTw1t9RLf2R1+H/xFiVwy/RlYxIFy++f7xY10vXYHcFLQBIQX/jpvLVUt
         BCMXLEvvlpaYyVPboRA2OXKU+lrVgWyl35cUtHZq2KJNVHWG3gcewa4Dw+r0Kn4CPILt
         D/q5qfht85ns7deLgBmbNZoFic8Jcvd5LjfcxdflzEku5OnCf3DIR0vFnCY1dFb7xblC
         0VG9AmDQFbOyBOMcRrgZuyQa1FcXDsg8c9yKnc/wJgb5BYl+bZsTfm2TC9tXP6OMmn4k
         CCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299967; x=1787904767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWJvev8rwDkHrWVtePCBv0HB68OwkWKr1ifArwWeRlE=;
        b=WSGrJQiLfjh7k+aKcpmZIz06CfkANDliSoJIfmX5YolSX65F9Gr1P9HOpKwfR8bq4u
         I3wJxQBLz2pereX+5aEDjVWynUbjgvjJbxakhOgEP+dO3CkL2oyf/iBIIrOhoaDW7z7z
         g/xYvKl4Ek2K3a4Y8knzTq2NxSGm90p51d2YfdMlsdDF7uItACLirU4F+3hxbiLAkQkn
         p2fcAM8mEdhJ27v1GdSlSBY4IRomzTmGKyqbAK984N1thAbJr8gGAMgrxm3EDtCPy/2O
         hLXguRuaxAmay58nEEnp5/87c6TuktAmBNg3TQ2j/3idXru2zDx9cinXiHAUImtK9cUY
         MRnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2KhAE4QbSY06qnRSyjLBtkN3HcDdO37VH2sBfJv6FAys1CIByLjkO432BJ7K5/2qhUiLMHtUzdeUxCj1t@vger.kernel.org
X-Gm-Message-State: AFuF++ktibFxkqr/jcAZDbrtKdg1w7KmrPE91IUJ1N5FMzrI4MHABVBL
	V3sEq8JLMM2vn7lVy+V6VP8Wu9WGuB584Ry3d6COMCBnnNg3O77G67TT
X-Gm-Gg: AR+sD11AdNHDASd1uH9qkTpG/IpB4wHVx63oWGinGcuItxWKrBKreBss85x6gndH/tJ
	QYj4GRF/9lO8x42vOtYNIUu9gXSje9nt8kazjh6pVnxzDUiNZ5YSKZ3qewpsMCz+bOnqXDPK0sm
	2dYgSpce9BF1MvQUXhXCuNDjXepK9+zx9ZCoW2sweoiPfzm4Vc/CjzlA2go0c2L073Axl141j+K
	OOpiIxqRB/8bvistkqY1jEnjnmc82fApZL0wptbxrm9iRgfyndrCGvNcPeQH9F8n9qvX6Y/ndTV
	/q0pZk+I5OeO1WACI1HY+YgmNSeGTe7biKaUb2lofkFAhhqLYDQAcvv6uqAdaWcoU8c4T02m0+p
	KRbpx+0z6LOyNbcJaRR9tT8WXt6T2Wsx+3PjtBHoRXfLpqj3qm4pltkp8v5vheDaTLE0rizdOOz
	h6xkeyVZYR34u/NyK9Nys9jAzS/PBFg/BDhJESe0yfC1o8QMHK0ptgdNXmwOxh9c2LP5ZPgJ8E9
	y6nXjFM9qba
X-Received: by 2002:a17:90b:580f:b0:380:f389:447b with SMTP id 98e67ed59e1d1-395c386d163mr9033418a91.11.1787299966990;
        Fri, 21 Aug 2026 01:12:46 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:12:46 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 05/13] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Fri, 21 Aug 2026 08:11:17 +0000
Message-ID: <20260821081125.4522-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RPMHCC compatible for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b3386..df9e37f90 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
       - qcom,sdx75-rpmh-clk
       - qcom,sm4450-rpmh-clk
       - qcom,sm6350-rpmh-clk
+      - qcom,sm7250-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
-- 
2.43.0

