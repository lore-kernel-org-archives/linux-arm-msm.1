Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207C535E955
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124876; cv=none; b=Cze0ZTERkeWi4r+RfvcMQFSKsrx6p0TvbVmK8blFrQhvt5fjcMQXzEEg7tzQue9jkD/w6idRHYN6P0vS5Bvyht4f+tFiM6enjZUR0K9cksw0VGf/dM8F2Td3Ulvj6TMbGxuvagd/XyuUb/1Wupx/ZllLPKQ/BE7C0nQP0MEXpMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124876; c=relaxed/simple;
	bh=0S9ZiRaNeD0ONuhBWck3LZ15qfVQqVd9GHb68v++sEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLas+XFC24Odoa6Q6WUHpAKbhDWuwox0DoULrjHKdagYD4EF19VWt0l1T7QyINFwrW7vKHrHcuGqYHdcw2CrOthIntLJlPo7c/3ec5m0V36iuKmzwcBo/epB/K4VlOmsP7RlfDe192rhtpHNT4G3CxdUO3MXcEh7yGeZpYCHRhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRiRWugd; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRiRWugd"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so3978919c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 21:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124874; x=1792729674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=TRiRWugd03HK68YGIOm6hyiVi/PjVf8wnrBkLIXB2TR+7DT0Z+wTQOsYquKPT7j0Ai
         xELXqywbzK5VnBe15X0qtvrcdt+PzFfyFgbkaqSsTjOWNCsf57XsByX4YJoFdOj3fKvp
         A31z1O9DXfPfgUTvyTZ4cfpHkL+N5wAW0Uu01DbnBSLNtKjFh9l2AR1UfwRBFljhrqZr
         DQIxdwhquy/cAbuMH7EDQbg5wXXdOQnYIaK9Gez0QluWOiNLKn8PfFbd+7dNUkht2fI9
         9oqoH6Za81Xmv8XP+hQdoM9NIst2DTGVyEfbmbFbldI4xpNeKpOTXbXVgfxr0mmb2kKM
         Gxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124874; x=1792729674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=02Ns18YPicary8Ccz/Oky1bBdolTrJHAJbbxf3QroHwSZxJJY/xrO1zhxyLJ7JVGOK
         3etfQVg6SAB26QU/u5o74ZwpqT0yPNi4iFn98NdzoIWDsbIUthmxiWaomMBKBg8PIMgn
         nS+QEOu7c/pN9RyygKq9XgBTP6iKRRuCJxKYdd73OMC385Imt4lB+gsr77jPIOh1YZ4u
         foMWmUqC2GLuWI8f3SSfoi9Mbqdr5MkuSBwMdUn2nEnyWJsLxuP3F9ktXH1Ej4irPVOB
         I2XcFKMUg+crC+7RvdBSTj/xucs099J3sLBqt1UQGbhXOnsH/F+2JPlmHA/5L+amCPr4
         hVjw==
X-Forwarded-Encrypted: i=1; AKwUvBx656vRaUCtGGfzUos4r6m7WpKX3Li2j7L/qOMQiWDqZExgC6IVwi6TiePihcL5QOgpwsNe4ejTt8UX7nHh@vger.kernel.org
X-Gm-Message-State: AFq9FYLn3J6Ycu4vb/u+wtM4Ox/qjW+kTmNE2M8ayyXqbYtFMLxknniV
	5gnz8sD0SFjFF4V+ba9tjrqpBrwSLsq8CHdcSBSBW9mgd6r9kPM776bS
X-Gm-Gg: AYBFou3WisC70QTdfSoI9kJEIIQR5wnper8WYf15bo13bvut1NIAk9AQQsXncBujiV3
	tysn1GF/lgYygGXRbmJWcT+3vEitQayUQw0hb65+hD7MoFUXCkkEbZsUR4vs1KkGq+BaxfRmSLr
	JdjJlD4XNe06ofYpjftgGvxrgTtID/0n6t/VcjT7tMZ6TTV/QUied+WeUxs8JsOF8QkE6g3wWRt
	rRVpXiDGCVZPi0h1Zdz0KheSmtp9msK9F5MTxJLn9Zwa7AMs3h+LAcCqmbibMLcgUvy+UURVdM4
	MUAgxTq5aZzyW+FcPiclqya9KBgmKmlhhvT+jlULMtfPnP/+qSu9h8qf+z9XLuXAMeArb2TrWyg
	pc0DDwF0TiyBQ/bq9+IDEuW0YWOP+daHUHBcwXqPnwKMqOLAs0h5XhEAZZu+PSeZwv3Z3kW14qi
	QakAzK87kW6IEROgoztM73uCiD8z2YpyVyZjjjCHquhxUNDqAgd0JK4AQDRR+SmCKnHPzGQsET0
	2WgDAn7W4QbD3HfdebTaZ0ulIKiu8LIOKP1sdk1KSLeL2kkrONEfLseGhFWbLgIKg==
X-Received: by 2002:a05:701b:2605:b0:144:fa57:c617 with SMTP id a92af1059eb24-16a60a02625mr30091887c88.34.1792124874051;
        Thu, 15 Oct 2026 21:27:54 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm2644712c88.16.2026.10.15.21.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:27:53 -0700 (PDT)
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
	konradybcio@kernel.org
Cc: danila@mainlining.org,
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
Subject: [PATCH v11 4/5] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Fri, 16 Oct 2026 04:24:31 +0000
Message-ID: <20261016042432.824-5-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
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

