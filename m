Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D688A481A98
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153269; cv=none; b=kVCa2dsVq9uFxYFEB74LFriVW3Ehf2K8ItDyKtRj5t0UjJTAGluHp5PKU7ZlDw5ludX7w+Ek4dziHJQlk7FEy7Sw8L1tTYqrIrn0rE44nUPaeYBkj4pOXu8mh4pLHGnzHEAHaqSuMRXZct7GqyPD4vUs0rKjt383ThjW3PeZAD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153269; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7enYJFJ+XV/h8wlNSLjHDxFSvGqF3AHSgorEeIdqIyRCiUm33K6J4yPMX0W49W5eXCjsKaJOzqA8BPJy1d8/4NU7uPIy3L+2deNqaOmlnI6/ML1uzIRsxBSR4KvbflGMa1trHYdKghHho5Z7f+9Og7oQR1njpyJ7KtGC4ldWbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmC7/ZnM; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmC7/ZnM"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b13fcf22a2so302915eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153265; x=1787758065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=UmC7/ZnM1yMfwnNWSrK0kOoCj8KZm44RRrUsiZcDgDHxhbWwGSEiLV4Yovc4i4o9h/
         qnoXjCVC5NsH2rpc1BNt+PLqOlQMbIHVJZHPcMGRxFnOsS4miRDFqnh3E8d/lGstT06E
         1l5DoN8SnxF4PpwUoygAHPEOcDdgAbjcF7Teu4j1kDZwzGeEqu/iYqodCe5b8FjFplFy
         Sb4jZMjyqTqnaJZexSXbTJobuGmV/gC6ukmUvwxLyznZ4rklgMkb9OuXGKnF/mUiSWv9
         biKPEBenG9qHBZQCAgiU91lOUBqyTnywqQhFZvVGKdmPQCpieXqkkjTgc49XpXXABc1E
         G4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153265; x=1787758065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=mml5vo++JqmxzWLTQVeEa22XHNDd6cIY0Aaa7x0Vr0dtmGsbE1lpqO3hPpXrmrD4ej
         x23OBlHdRNqdb4vdHp/YofQTtaNggThVIwHfgSCSJSWmNxTU/LEVow12U+m54M1Nn7Tv
         4gopQbMZEn+k5P0yzGVue/1YEY3uzfM4cKtPPD9gtz+t+znFEcd52TS84bX6zfaELuH9
         54PULucyMxLbf6wVJTv58vz+g2rq6WHTVBJFLHvQ+T8Q1gNhv5JjfPnpkjNHG9lUPrGI
         Lg8a1HoNnYGXFSphBYJ4aOcopFnkyQO/+ja/uBB4XyL8rWOhq1d09vH2NNBHUNGBzecT
         yLxw==
X-Forwarded-Encrypted: i=1; AHgh+RpAql4LPb06mgDm+/ypcN/D1qSp7061RadUK+7MJTV/YhVxVZARFF2ibmQyrh+sIUWZJQUGmNdZbjqccrbq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7lYdN03lbzKUTSvykh3jTU3cLLvTPfEDmti2n3+p6DxsYaHTD
	cBMeIXyeVReB6xtwxEkYR9lMVMSWFRr9uNPMntL245eU9n0o8yhekv+R
X-Gm-Gg: AR+sD12Xhsgx1o+ELE7E2bpPsMrUALpBdQmybFkqh1SsUAohSxSgf8qqnqBSU7/qJNN
	CfLeyqgushEz3hCeLZt7m9v1AkEUMUHJu/4AbzxNufsQgFk5YAal/EwylBN5c5IgH3XtJuKMbGQ
	g7/17goq4mMpQJVUkvA05l24oJ+rpjJficoV62cB4cAIP3JiLzOjjJZ7wfn0+XcFus5HWu5LD1k
	2SMlV3BNZG9uzQWKzearPYDDNn9ntmk5wxSagS9h3XWE+c0V1gnCc+nwSNEwga+y9GeLAsSlu15
	7TBtD/7tuC2sjNTg1n8vJB4wUyMgwZ22NHC0PwDMLMkz80X1h7F0H0e+qDpEscYIhLs5fF5V3vR
	fgrdThgeb6qRrLh3CrkKqsQZ+vRuEGBHCSOVWCYACzWDwdwcPcawEAC3GJi/vNVaJ08MTEEnTTu
	bP61XyLSERwvwTtazOJwYyEMwDjqSIVpVw5NiqzmfVPDN6QhINS8lLkln4wuHNEFvEbTvLCjL31
	cUnZQy3GBM=
X-Received: by 2002:a05:6820:810:b0:6b0:4355:3c8d with SMTP id 006d021491bc7-6b13c6bcf29mr4325143eaf.34.1787153264564;
        Wed, 19 Aug 2026 08:27:44 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:27:43 -0700 (PDT)
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
Subject: [PATCH v2 09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Wed, 19 Aug 2026 15:25:38 +0000
Message-ID: <20260819152545.3934-10-sreeshankar0910@gmail.com>
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

