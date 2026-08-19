Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8683E480DC5
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153277; cv=none; b=oDBDIq6T69uuNT3TkEdPkM3mfRm/aKvAcYggZJ83hbfflZc9CYCllY6138d5iyZ8gPJ/AIjXNdj7T5P4md8H71eMc2ac96ivxHlpAq5MA8jDxH2bcCBYgehJPuZLJ13FPMwVsCqK2m8aFZUzBX3LFHmLW3Go3QaqHUoZh07TVWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153277; c=relaxed/simple;
	bh=gGRs8PNvl8Xi/tUIg8+pD+wbWYIKM4YMN8DIqhxVxmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJxbdrkUd1zFp3Gw+/huJNHLETKn511g3CFnjWtXfpK8wcl5znuwAwUGazorp6navZh2gI3M7UxPIa3wusbN5yNa8p+e+OrNNHaFdViPwKOVCqdWEMW2L7MELyHOz/MiW5rqNjqxjoA7mEAhesg0B338PhgdK7ZawAoCp4d4qc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0sUoFR6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0sUoFR6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caea3f742bso16841675ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153275; x=1787758075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4p0M/MEu5nAOoTIIepmDuyjSd5dmIXE6lm7R/SDctT4=;
        b=N0sUoFR66sGylAFgSLXVGwyEJ0UH83NTRMp46/tToh+DFe9hRIxE/12XgHDm6COQJO
         5uRBtQdYiw7xNSWTDjHOC/3Ak1jfJGR7yRIGsMQjIW/TpC95I4L/xWqwEWKnX+q0aA72
         LrkMuqQY+MDfp8Zq7Eeda+btl3dPvtS2VviI8bjlguPrCW6M6TunrVn29giuIfhv8mUH
         QIdclDHjhXuZswK2YI5nG7Ks637B3CvNrNCPrNVqBbArsOCIA/nlrWXZ3nZVQzohY4L1
         Ba3O64Bm/g/gAxU2Tx8sIZKodD8x/6sl0cok42tb3d/9MCBXZpJuvSrxCYYPrxddDI2p
         R0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153275; x=1787758075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4p0M/MEu5nAOoTIIepmDuyjSd5dmIXE6lm7R/SDctT4=;
        b=Cra/jRf88QnAx+tlxzGzStCWd3JqmMl3S1OGKHNuGY7m+o++4MZfd9OOx4GFznuknd
         hMh82C2eGNFYO//CLhG3NTWMNhdhK7GqNIaa4AXGlYOkcG2Hfr0Hkola8vKwBzIQTxUT
         Pbbts5ksc4EzRhdscuz7tryWz3KjWtYYe591+cL+CLfrxPkJ1QAanE59HTftndOhMvBE
         s0eA4eWZez+36UwxlTHNxe96Bfosd8LNjo+GzHnYTy2JY2Q5HExIn1vAS68lQlrod1Ss
         eC6pHzZam3oizdwHd2aisvg7kzEXN0Fdo0GX6NQ6LUs2T+G4VzHP6Wdw4AxFoVDnAohZ
         sgcg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2zAkcyks/n2tY+MKnoP8zbLmQPzZ90I/yBjb7jqlS72QvO3+NvD6rr10Co5erdVmdfX4V02Kz3b7INi4R@vger.kernel.org
X-Gm-Message-State: AFuF++nML8gWpb2yFjlmpNv8xcZ/iIAeyycklaKDONS9jsBWI5drUslG
	PQgflViWalMRx1WzJZq1uC0ZKcWasOeSz+Jg1LZGHEc0iSGMiZQmO/LN
X-Gm-Gg: AR+sD11V+P30TODlvI/yHFOPxGfJxgzrFlccvMhbOiNf2mrk4fBWFIds895rhwsH4mM
	PJmFuCVn8uwtC70s7iVsUvGOSJFFchtmhWEziZGzEc+oPZB6xRVLuLEyxAsb7CK1wFjDFzOQlYg
	pMscQH1ecbJ9Ela/X7gxgRFFK7APbDzaePCXneW7VJU6cR2RxsfxguOoCDQn21EYb+qdXIbcHAG
	n07oPlHBbRtbZxnxkvo03lBC4i1yxqtTNBmOWyE4depxuELniPtSc/kT3vV2priat2IG8wFQfQf
	gUPFRVoIEP/QKMfc8JDZbXKskuufszPm6DL/GFbbzaJhBBg0usKfZPNKQQ0GCQ9rk9hp5R34T6N
	5DbEuFntxSsybCKDvqOi3X1ksr3+f5lyjFWo7+RUw+anvcKoAwrqjt5kivJcLzUczGck9ZF6R0A
	VljtDB90uDi0vboZfhVyO8iBuBbHvt1TTc6IY+/aY3hT0LITo6ntojCRA8cTFS2ZQsk8LpeoWal
	GMg++OuT8Q=
X-Received: by 2002:a17:903:40c9:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d60197c4c5mr109473845ad.12.1787153274724;
        Wed, 19 Aug 2026 08:27:54 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:27:54 -0700 (PDT)
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
Subject: [PATCH v2 10/13] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Wed, 19 Aug 2026 15:25:39 +0000
Message-ID: <20260819152545.3934-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 24a49613c..c8f92de19 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -73,6 +73,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

