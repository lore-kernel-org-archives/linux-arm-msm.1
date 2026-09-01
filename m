Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC3A40A95F
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246469; cv=none; b=tnGK2F4M0Y6/8Q64tHjAuXXTy28mAf1RpdMQcOsIbDqYNc6A/I/029OyVGLmhMHyXTRp+DJf+mBW1FKIhDm3DSR95ry4EMLfKzjjqOXmq62XX4BS/xd72gchrteDNynI3L9cN2JKFdpOE6vbdRZ5nSu+OEGzg1cNN3ErOGimaQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246469; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jypXiJ/U+5WNTZWf5wECyKScJblxtYHHnjJ21PZ5P2KRCGG5Bpjn+PPFfmVKUGCtZ4npBxn6C7ro7cjmHPzjfQ63yV4SlubbeZCeFmcD3D6f7JS2H0G9GIsJcxpClaZCthpslT1OhgwJfYufkD6Mk7aFUzqZ65oeSXWgGhj34Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gb00GfeS; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gb00GfeS"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso481827a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246463; x=1788851263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=gb00GfeSlSTVxcbk7DATppkpH7mC230XrpG+2I5v1dSPdan/uOCo66qE1+d/ASGHei
         dfr/yBlAZ/Jb4CMNZUhlg9BdfAxHQyOpBv33fR6oLnf9BizdrZJeRRC4L39uQDRqKdnp
         eriRRaSxJHRGPNH7SSvHjVVyuUzTqEXFLBuJu2nVZC95LjqAwXhwE6uajI9Yd7svt8dB
         qPOZub54W/v2VxyoyS1SecH3dnsel9QS6jtvh4Sc0cAwBWR+8xwwrlcpJb65aZBV7LTS
         UWvSmOyAC/3kLuaMgQJubCQgGn+7lpjc6jVNLB84nmaNCryRpr8MD+eK9K+lFbFomLvK
         XeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246463; x=1788851263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=FyIeEjJTLtC4LuMr3uHQ1Yh/ixBrQ8T9opB4JYNlWELiPMl93vHzrNeCDfK0asuQ1x
         z0UiCe8fxW2kftm300yCqv4xqP5rG7+QpdQAAKbLv00JYU45WSlI0MK8PFKlgSisBU4x
         ZmSRUJ7vnOSOkjMfFiUCWJik09olUKOC2ZS2aNirhzTHVsjHmpzj9HA5tHwCebNQLpLc
         iUec0sqhnGhB4GEwckRA5TiclV6Vns65NZKz8R0txKR6GF7HjyTuRUEqhhBltve2s3Me
         9rY0v56GjSMRqy0XpKuClGTp7Vuu/DckMdKkqo1DJsrG3vp5LGH684xZGKRQukscYrMR
         SyiQ==
X-Forwarded-Encrypted: i=1; AKwUvBw34rF6mqR0Hbvzdv/O/6rc8YypabiDQhScQBex2/ECwyFKMNPFrikIc7AmvcbX2jHxJgw+o96Io5oeUYwY@vger.kernel.org
X-Gm-Message-State: AFuF++mDLBXIjNPk4/4kFyIvbGLnqFIbcnzlL2TYrdhbmlJcbMEyc2HV
	PejeCJlUN9Ma6WOwNzjrb97gTnsBRraWOd+5rIV0qm4kpqpptL2tAhSP
X-Gm-Gg: AYBFou1RT+wZ30cO0cNTrmrS2v6ebhtpsY6W0U7wyN1c80iDlgkfyCQccQQuu1JL/PU
	MIxcx929gtHyDZnMdQ+tPLBs2J9VhTKnVmXScp+mgK2XuoE/L0vR8/mmSnABT6ET6vP7MEAwDE9
	Obww4lH2G9KnlCQCP3SZo5KoplJl8ueO57ZHiNospm4/1RkfBGCQS3RuJ+JTrrfF1du+rO0iEIt
	BGynlP8wY8qTO2BZ6yv0cKY9Sr24VYEzODs0T4DU1lUPuotqYmumdizJ0kHClODqyzPZNYFlLN6
	nuqr22v7yYRIasSYs72JPiuMZbJ+te6jxEHZKL2FUa4hrAz2oz5tBwSi1BOcXIUjMQI8oNnLD8X
	FjRG+6Y+6ER1JBiD7WxhmpgWrn9LsGVRIWvamMHro5l5a1c6Q4xRy4ontDDy9kJQaXccSuVrzw7
	PjER7f5fKDjFD0vVweYHsHTETH+a6v7svH0/8V7lB+L7vit6p4r35HFZqWQwarZEwNBHQQTxf/v
	G3pSA87p+De
X-Received: by 2002:a17:90b:582e:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-3989be9acb8mr32700156a91.19.1788246463258;
        Tue, 01 Sep 2026 00:07:43 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:07:42 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Tue,  1 Sep 2026 07:07:06 +0000
Message-ID: <20260901070717.20513-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ID for the Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 2cf433f61..b63e4a0b8 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -209,6 +209,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

