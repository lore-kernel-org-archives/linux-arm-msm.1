Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A03420488
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576757; cv=none; b=n94ImA3PLgjdFGOYBHEVgF3vnumzKGyd1ng8kVME/HV0lifHrGI76zM/f9dfPE1GH4Qq09gCZxoqARPzDQBccRM6HPM+n8HF8v+9L6h5A8bOE0KgReC7wAPLlCwu9X6B3nFKazJoVoeGG5oONv4JBBLLB6heP1i/6pQ457TAaUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576757; c=relaxed/simple;
	bh=nZLd8IMnK+qlnesykBsMlKugO6FZefT2Z+rNkHuVLQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MKxjiOy/CGafmtwde1szcc+v52wvKc7zaVuZ0x1vihTwlulIq0P45GB4jbGI77s7RqX/xFEpCxNsb/25xxNDG6LgGn8pHzL/scJGngRWInILk/bAdJFPbW3Tk60brRN2uJ2lNSZnh6aKVlCGH4ibdBvCx0h8iqhgucyrqgVe3Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0eK4lrn; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0eK4lrn"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43b7e186a0cso1330376fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576755; x=1788181555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ckSz6fnME6Yn3dq6dpHlPLur72/KUgppRHgWdzen3s=;
        b=g0eK4lrnbTmgX0cFesKT00oS/Qd4bZWYYQDbTcTkFiuVgMrJWkg+EP1LF6vy9jm6fK
         WlniZLkTtHnrX+AltqnwsbGJ3kxtdkETHZjQIjckkru0ncVK+bnKUIt4pI5fUkmbGUwC
         vau/xUcSETA3LrDDkKYzGhpoYONLkaiwF6z4kp1bHUxr/gQ0Whgr8sDKWTvVbgmt0JJX
         BOClbS61zurkuYemuJIOqtGDh58j8dxl9XNLrqywu4L/kpytCWPlCthL+ocwmf5bWnLy
         xurJDp/KvE/gmAONkItd4+wibFKszjyvozzrlP8Y2SBwvhZEAfDvRiKCM6F5Qugly7ZD
         vQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576755; x=1788181555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ckSz6fnME6Yn3dq6dpHlPLur72/KUgppRHgWdzen3s=;
        b=UbxsA9kUhz9ieMHOk7IP/Wp/EcxfooNMTbKxkfRTSNT9yqVTCRqvFGIUJoKSfAL0os
         3NhY4V706vxnLIKzH+omNwiHLwx7+2hVPl3+seBys7RQkgH+S0cWkYPUVsUCrGccSwND
         PClcGYmydSK2DqpYkqpvoJdJuz9mziWbv3ryXVLakNitCaSd36ClitOKD5ahbGo9AwLu
         e1bV9a+UhXoJcNQpeGhvtaVJ+PaNVoQSGb4Yla4XHcCfTTvr2uzDSb+KGKcDqWUn3XOO
         JuKN2QcwdXoPwOGPYyNzz8hXHQ+rlECRLsOAJlf9yFV/G1nxDTXjljifC3t5tSDGpaij
         fg0w==
X-Forwarded-Encrypted: i=1; AHgh+RoddzI364nI15ObDsi/WO9P18UiSp5qtUBhJOMfmFi/QYY5shDmIhCcrz18t/VPdmgAEAMDotR8fDArTF+K@vger.kernel.org
X-Gm-Message-State: AFuF++ld3pXxwty6njvNPGfT3NtPPBz/CBToSqbf4ub6GMx6Q3wM59Fi
	NFcnFzZh38QBWrTwVUTXHx9MOlbbgIDXQrpPkYt44sc1BeMr/z6stQlz
X-Gm-Gg: AR+sD11qZXBHxRTxitIILQCopfsUe0VB37HvVR/K0ZyDba/HZUqayxIWgblUIV2ph5d
	Ta3kU3aF6d1gMLO9kGMHlndBGHBgvVZgHvWOPbsOW6OPgVJOKCrRum7uQpqg26rY25RDFc6SnIJ
	XJcqAXW4Nk8t0vOUUoKLnYLbH2m3t9maLqkREYoIu3kbQ/dESp4JiRQwch+CiWY/lzQEVRGrhTz
	0ZKq6BfAchJ6/QX1Y6jeCNKEsSB2uCIXDpYB/sS40gomv1/Z9do/YKTZlgtTmYwmlOK86eD7oEP
	Hd3QFIsUwQQqa1pK8i8cBe1MJbfDFLngkB7NCvYKo2SyIFoN65p4M9ILxMjetPKu0b0rLbOob+k
	sK7781WeN4mx6o6+wvGDujEIrzWuX8TLiUyeJTHrjTLkKaZdeAnhN8hkAti9D3oBTMLexs79VwC
	7qZ5Usc4Mqg3e1cqABxzvePkaCgIIBM/TP556pA64+T3dxKsBoUJj+tTEN7Wnf/voxrJXcdvD4P
	hI4EyzfEjKo
X-Received: by 2002:a05:6820:60b:b0:6b1:430f:1bd3 with SMTP id 006d021491bc7-6b16b1bef04mr16104300eaf.7.1787576753647;
        Mon, 24 Aug 2026 06:05:53 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:05:53 -0700 (PDT)
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
	taniya.das@oss.qualcomm.com,
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
Subject: [PATCH v5 05/13] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Mon, 24 Aug 2026 13:04:29 +0000
Message-ID: <20260824130437.2771-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RPMHCC compatible for clock rpmh driver on Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
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

