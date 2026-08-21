Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D525A36EAAC
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326946; cv=none; b=AnAI3Ey0ug6QhPyp4DipmttdZe3iHmrzXnLdIbfrVo4W6YR5P9DU1R/XM3nhjeU3/B8DLoJqR/VbwGN3acBRM9lno1FemQsYTVv+4wMaAweacYowwSb/KVNlimMawD23bB//ppH3nLwCpAGRsE+tpRZHBIP46zTZz5MSooyaG88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326946; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tyydMgkT4cwJJNaiKLqs+y/2VoJmLjiUPKw8ugqNlTTUy75MK8w8+AYs8MOdEOHFOkX7ghsK7BzSVia6Ryn+qHHApiMcj8qYUzPUBf9256eADL/wDm7S/SMWkBdE3qLQufVyHHiyR9kJo95d7zdUkXgv0Ga0drzVeaj1+a+YlGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1tHq6Yv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1tHq6Yv"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceaf8a1265so13222845ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326944; x=1787931744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=b1tHq6YvPwXtf5nW7b5uSWj9XO+kTtJ/2lNdtA54MYuJaDu+vqHIdmUCeJrTNxhWqk
         N/vfTXI3kLTGzd7nrDzKsDcgbpjfrVccjGAvh0JKGjYIshjzYh0xEQmmijwGeDzJooXC
         UioHgEj6kX3fPMAmH3XrSn6v7++LMIlcUs7SXzuKIj2UeWrRDiatF7spcn+CRjcWLIyy
         gF3M9IrGC1BHSaRU1uJc9mcUasZOLCLzxHENxeKO7zl3V+FjjTHRmANPWfhIhCmDlIyl
         iv3MCAk3Mqg3+/nqeKX+mrvq6k4lizwAYNYrmYRBo3fT48lmbuM6uVctTJACvYheTsBa
         ZNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326944; x=1787931744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=R2gmyk9EfvxUn4QgMU3//dUQ+Ib1Uye1KfwDBqwcOSccbFc7/uM+B4Xz7M8FoML3AQ
         22ewJ4U5dgY4h9KRsIuIDUXQx8Cmwtq7L8P62gPboRzOscOaoDbBpEJtJOhNTDfNER3e
         Y2R8wAlDvBRtc0PgDFBv29escqh5hgNdR2RvIdBLbQZ2BcCwPF4tIazmUFXXwplAlgi4
         /yWR80lqd+0u8uu/auAiRJeVj6Yv5GY2Ds9ZwYSxacMXeok5D6paC17JuK7PjgRhgSyV
         TmYuI9Uy6o2lxh7/0QDyMSmpjKRU5cN3tvUs/riB7dXx6/3rZjGaUDTKRq0bQmHRJlVf
         vUDA==
X-Forwarded-Encrypted: i=1; AHgh+RroBBApbtb0BkBeG+kTxcUw2oIC9jOVVEoIBYcF3ArKGO9qC0XGwAl+O6OhGlw7cPWZw8uNFD2bXwIvl9Jj@vger.kernel.org
X-Gm-Message-State: AFuF++nZvKHl2jHrmN00q2RHWMCa496FxOoxzckHS66xgkaQeQV8uaB2
	7szGDxiXcMg86qsB8nvYxLwwAn/aQDxH9a5h7XpcakFWfbqW9pESh2zxu+JKXg2vsl4=
X-Gm-Gg: AR+sD13M8K6RrspZFGo4N8gell/a46U8t98oZfKwWBaMcSWJKL3myAlV7Cm6ScKR1M+
	DOrig+a3koWoaMIfotmnb5gAcLg5KtVP7UUy+ks0I/0oEoyCKU/3Qg0/f3Pt0zvSN+7Tk5ieEJJ
	cH1C9cIsQcleeZEG91l6/8hHyCmD/LPQNQqTNRiNBgtBXVYkhr+owkU4dcGI9tLkSeP1shyfWjj
	wL7RbLPmp0YY6C/2jo4/doYFJpaiwlE6pleue43dUBa84TZ7x4zMK0cNaC0dShKK8ZSYZz3HKus
	8z2t6lKNL1PFZvCGqgZRPlWzBhxojV9VV4jO69wZMJUMs//U8ivnqXiVJO4RHLA3J4ZujI8nVix
	VHSe3PVFX54GgF6pGNeq+wJUNmxq0DreJa0Nq603KOF4M6xngnhzggUSIxp4CYsfeLDQeOa4DDC
	i2vO8zz6wSVB8mG2M55gHfDiFon0AD7lpMYs6nraxoZUWBz/wHe8Ud0DrrX3lv2bt7rCQBI9d3o
	K8GaW8p/71y
X-Received: by 2002:a17:90b:3142:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-395c35e27c2mr12635806a91.9.1787326944265;
        Fri, 21 Aug 2026 08:42:24 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:42:23 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v4 09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Fri, 21 Aug 2026 15:40:26 +0000
Message-ID: <20260821154030.2514-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

