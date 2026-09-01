Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D607047B423
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 09:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254825; cv=none; b=GrEtNQ/Sc/JhnREY7kFGXx+qGpsYbfWybXmnzv83oO7rLAKuVsdY33xDSNJAJVBZ9LWAWuxo1FeCnrfJ4g5LunhIFDS+5DDy+Nn0OETI9H/TShQ7Tv1YsFsqU8PDb6GN7KobB3ligW3T0oV5MV/6T/7nhzhAiwodKyyFjPduqwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254825; c=relaxed/simple;
	bh=0S9ZiRaNeD0ONuhBWck3LZ15qfVQqVd9GHb68v++sEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k9YziN4z/CQgc3V1uoqjCTvIDHOnk05PL/Xdj9uHNexrXDD4Vhq6XSKMjXEkXBn2apnV4PwzLlapc9Mvt82EJasWVHLxxv8mkFib6jvhoab/KzybBwuZcUYb+3GecnuUC4/1LyTtm0q25aeg/rSsaEAmcXu2hY/+9/UDfEMjW6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4RabrIH; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4RabrIH"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-85339ed040aso3913314b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254823; x=1788859623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=j4RabrIHhYV1Ub35pUQn41n1e6SX+9SUSz3Dmaqb7/V9p/jlYlcdOGlG8r+VYxK33W
         CqMcMhm6r20R2s/3Xdz92Or4lYLEAvH89AQmsSo0R++pl9FUppc5O8IEcsUy5Vr9Y2P1
         grDHpRYBT35lLiNAlwNI6REnAmY1Pa3YO0XzimZcUDJ57jjSfv6veYrlCJy3xYRZarrs
         rVFv7sX9Pix99fzmQNx0U8Vr7FivCzEjFj1auQsWcK+WRr+vkgjpS5/M8TMbO7rZHGAo
         gPHk0qzWrj/M165K1qo0UG/VzVVt/jqBhVJ1CNTY1o51lj1zymxwUqPHYzJDh5JR240h
         re6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254823; x=1788859623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=dZq0bp2uoh9tJUDFQFha+D4sUkHql3Q2mkGf/7e46Bey8rOONXiFlATj4R1AzMuaNx
         A3yyr0MS00Ave8G3n5BH1xPNvrLVQ4G3rfo2pXr0gdCS88OfI+hld6l2akH4M0Jxk44P
         nG2tL+5/sc98DgnAuj0wJf7tXo2jftm05BhrfRmBk6t+Nb6pSPy7QdsSfCVnlUOF2VKS
         6EeAwkjb/BukvH+EAO4bx7WGYYTLzDg8Jx+cLgWqpICDpHur6iX9KBwVcPDQlIGntQjx
         3nMCnyS0QxIC1fWcu+q4gVPuongKCg8qrUhCQT7M/6xjpziNq0CjJg4ab5z8SjZoqOmQ
         16ZA==
X-Forwarded-Encrypted: i=1; AHgh+RriMh7Y1+uxW3Le04f+SmMGjRizk7sEYOJO6ruJiiGUW/OSWqbiOLmNpKNMWbjmXRR/i7/XoVf3rrYSQFhD@vger.kernel.org
X-Gm-Message-State: AFuF++kJ+bfwNe/xGHu6LgaI5wxgxZ68K93vVyrQmmfApPt0zDmCOpm6
	HPkM7XmGXk+Tv2d8GB59uEns5W00VHbT520HnP+iQ+PcIChwO2U7v2Pt
X-Gm-Gg: AR+sD11/p7lLMBMtBGUKgn6URiFs2WJAjgvyTwXlLMYAeYrr1/RwHFkvD0cRT1UhhI2
	1vfO0TsAhAkMv9Dn2bs3Z0jnJnLUUXAU5A/3P1jUVoKvsWm1nL/mzMeFd+kdnK6j0YG196Lu5ph
	810Rujmm29T4q5ByQ5nzSIfb+tZfPloD10h4JLWnFFEwptjGmAgkCS2DLZjR9ihloZuxWIz0D9o
	ipzfvI7RKTpgXGNgoRPTT1SqUi7FmZzjW2RVmdIhbqLxyYRtsa3XgnzPHZcpv2MKLSgT5WcdkHM
	Dn9FAUyXTB1lTdu8TLcLivZG0Tt7SQCUnEUZnINIMrSl/bSIr4Oe1duIgDST86/i3kVevH/CxrN
	eU99o8USv3PeJBypuvg8fT7plUS47i1wnG0IGShQGNbfyjby76oTYYgSkoOjc6YGFfnXYlTs22S
	3sqZfA6UJVNti+Ce72J/Z4XlvW8HUCZorkCwr7f2HucH5o7LmTwyb6AHzIgrp0dy6l6jbtehoIM
	dMrrY2aRkC/
X-Received: by 2002:a05:6a21:7a97:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3d7ad992574mr11465441637.5.1788254823231;
        Tue, 01 Sep 2026 02:27:03 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:27:02 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 11/12] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Tue,  1 Sep 2026 09:24:46 +0000
Message-ID: <20260901092447.3028-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..2dc2c265c 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
-- 
2.43.0

