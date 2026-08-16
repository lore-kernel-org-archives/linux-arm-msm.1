Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0099C1465B4
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786897118; cv=none; b=NXsWizUXCvPRWpZDIjzLOjSF4JN/uoC8MnaalA+fFBHO4bakSbO50lBomvTS0priapMujjdGjq3+T2hNcNpD2AunMyLYNK+kqQ6yXdo8rW9Uy+kZ+pMOWhXCtQyS8w4JvOc/0WIigpiSNIBRES74Of02sBvyLWn2xgIH9r0ttE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786897118; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGl8CIiKS9pLJ9UF/zF1I3YXNssNBkIOzrbmRiQXAMhKe8HRPoMReoBrmG8w+fmpt+N1vt8YMn73V42pG6RlKMBsHewPtZvKg05BnDLTM575Ju5TGpoWaDuf9+lxo80regsx/nGl0jEmekX21Zw0q7UQEYfCFteQ5KzB3847y8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdDyGu5L; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdDyGu5L"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3429435a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786897116; x=1787501916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=IdDyGu5LrqX4Qjs8Q5CZQy4P438w9v6NWGmo8xleWI2u3LV4GF6wuIFxj+z601CRYc
         vJo2kFv3GxgyimiFXZ2G3a0tmGRhOhFKx+v1XjTasTHIYluZcMnC2Gb9+sNBwY+DyMyH
         o6Iggnp5KoWutVCZ3XhtF7tp7BcmA9IjnMzJkSnNI8Abd2StrgKLVClfyqt5SHoMCS5E
         9P8sZzhJDrgqAkzKKoujPKnl7M6Lw97eGBiodrcFx70C4SCwZtad5D/LxHEC0TkODnd3
         is9SQPUNx/oJhhJUPeTAQ1UyO1cFKYDbWa/WJQLkuifArkOFCCi+K6xXwAChlOTNPOu/
         Yw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786897116; x=1787501916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=evRz0f93zo9zqJ0w/04X1mIjtGtz/KPI5058q5sxVwLMgfyDsNWkVo/hb6E8wnus4Q
         oQ+YB0pNx+zGYXpsYAFBzT8JY/k/GcOlG7oAYEoz1nhZHUGKp+Tk2TIp4smPH3jisNrd
         Ly7NY4HVVOEVpv5Nyc4cePqx2QAbMzNrNBvwfjCUcM7VlA4GuuSxb3D2xByUqtyDp4QR
         dl9M0nOXTvJTfv+EPq+dczrB2s8ddekrFuGoVyN/8PVuFlIaCFW2z84Pft2Xh4a0GAqg
         kZs3lrkPZhxT1z4ocx42tlJMBZjlZs8NjwOqMB+mtW3IXfu2kWF1yoVCOI9Wi3gc7z3m
         o4Bg==
X-Forwarded-Encrypted: i=1; AHgh+RpoQvIM3/i6LLvh2If5LSG8oNwMz/f7qXRnHIyxfJilH0bDuzsUO7BO4BR+g9tSlRaaLiseJEOLj6BIXwLu@vger.kernel.org
X-Gm-Message-State: AOJu0YyJWEK5ZQDI4Pw2ONX6dXiiwCnJ94rox3ax79iY/t3IWEkM3yAD
	BU54u+i5sNjcA1GL1nj73mGJQwPzDNwlw+Lns7aO0ooBXW4vLvFH7oPT
X-Gm-Gg: AR+sD10hO1e7iEuSzRMulvhQUw/MjqfzFcSvMBdRGzulg+8JIvE4wgYsu3GH84B+J27
	vvK+IP501nw861gToIZWyph3gG0931lUT5W6+lhL0KZfb7Kj1eiE170ihHwhUhxkOm/DkAgLShk
	iU9vkEO8wBCyLwUKU5YyPiEbTCeKwS3at0bH2Pxbq0llcLYBwnIca5I+IQESqaxTg/WESKFohzO
	oHh9ys674EZdddlRVgBcbE8UmRjOpcd1cny6/jLx8K7V3hb1vL95AI7RR0K9jQ6+AZEfy+XADeW
	Rqg9N88Q3p8QrHq5ecAg32hw2aVOPFvgtPKJY1XTraPDLPTlVG7KX3DICsfgNHpggw10q1ovBNJ
	uI9/Zgy1k2HoFQIu04ybwDCYScJOv/QOHVyVHLbXk6L8C4lufzTBTdMksEcVc+ydtbh3QFJixUQ
	DIkOk3vx8sy+zelLx8CUPHOrQZTdHAor+MKfdsZDQBxTEuAYW8uXvnVQXYmk3nqFnm2D4w1V+jh
	1qKwdH+hlej
X-Received: by 2002:a05:6a21:150c:b0:3c3:791e:5e18 with SMTP id adf61e73a8af0-3cc71ac3791mr21187630637.7.1786897116158;
        Sun, 16 Aug 2026 09:18:36 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9679sm28969988eec.3.2026.08.16.09.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:18:35 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 2/5] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Sun, 16 Aug 2026 16:18:05 +0000
Message-ID: <20260816161808.12419-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816161808.12419-1-sreeshankar0910@gmail.com>
References: <20260816161808.12419-1-sreeshankar0910@gmail.com>
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

