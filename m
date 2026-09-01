Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBA03C343C
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246568; cv=none; b=Z0mBhUUF57V6+4MDp3hCReJAT9qbtdgqX82DVlySxhMQbG/2YBljuFF4q3mPbTY6lN4p7F0j6Crl/ik3k/GA5wNkeDT3eIoDIPBYVvgdMaQgyINCYnV/5qV04lAP/Kf+JGVxvjwEmFFrj2CZxcvOreOiwdeF+Ed4Q1UkZAc0VIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246568; c=relaxed/simple;
	bh=0S9ZiRaNeD0ONuhBWck3LZ15qfVQqVd9GHb68v++sEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVRSm3gZjYc1rV7KFFRx8JN6BrPTOQbCcS2GIUa1/vuOkahZBykCJyIm83x0GBkFucgXNEFgxQGSwTStnfq10tfSVPKjD/EafpeABw3yjCl+QRGnIhdGf1inf7M0N4mZdhD6Dz7ipYDkU8OEUpbEwW04wGl/P60OcHGUU8rD940=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rPkjIEQK; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rPkjIEQK"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d8fd3b729dso23818655ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246563; x=1788851363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=rPkjIEQKdxLZ/sXl1sfckXlub5hLeRHLy5Vf7DydP0RRWgPmVtiTv/Bs5OF1SHHaBe
         +GXv5zKI6kNnmpMTKhFLFuPmVZhPsAIXJ5NJdeSXvRP2wZqh3mQPp1Uw9kb7Kvwrk+jF
         QlSSicUyzhoD5f1DKA0uT95cHi819y4UQOnh5Dm60fE9SM4K4LyNYJYkU1VfOufhSnZh
         U7gWpE4+g/UGi+s7G4sueh6/dTdiP8jQmc1GTZmV3XUr9/ENTel1GdJ/BMRjnyTxrD3b
         iHRG5tMayKi17hOB8HhCiIjuhCokVNVKlKjxNSruGE/mqBaQm8f0ukqVhsNzuMGc1ABu
         sm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246563; x=1788851363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=ONdPy7RWRvIPSImxWBvQaPIqr+tCAOVLxt7wxWgTZOk7/8m+uhB7u1QiXQFLs6dDG2
         MLtETAbxtAUH+uORp23n/M5tEcQYe4pFT5ZE76h7YqMt4ANc0LlN8bvzi5OtvXt9CMrG
         clL7VX/mbdfhtvDGcQPjMY+oMzfh6F1hpJ4RuZgXtnP+2qS2ExqIdK6cD4deM3cWxVaB
         SpuYZretDczHjtquVnT0S1pNQdYUhS7W5yxwBfr/WA5jp/rygMqPvZB5bC0Q1DdxgwK/
         0wdZLtmdmAicr9kjRsGo+85kuf1WhGAkdAFzvm3VGXHPhC6uTL665csc9Q6OVN1m5R8M
         C6Nw==
X-Forwarded-Encrypted: i=1; AHgh+Rqk8zauA0OOY0cDxzGKfnIaK0TVAB+0SbADOMMk8N/GNMojLCOiUzxiNYXuGNLkBcfsLY/I6oqMdvRcRAN9@vger.kernel.org
X-Gm-Message-State: AFuF++njIz2BbEMT8xu/B/K47XPGn+hqynR3iSNQOz37rD3/Ln/+jthg
	9aGyru8P5Z09dlgGpnz8pkMkNyMDV41dsd8Sir4fvlOm/9qH4uWZdeGl
X-Gm-Gg: AR+sD12/ftSTjEFBLB47ZATpUKhz5ADKKX8tPxuLdo+sKqTcgHoVC/XiQ5tl4FKoaib
	ugtLjwomYuGydoG7bzUitfS3pqGxZ15+IG5GfnqMD6pwFxalW6mx2YNzr9vX21OpbZyA+oLu2QP
	WxsGZlZAmWfEjAu7oSztUvlQvDDTE0u/jp/fJKIof3f89vPWPRaPgThH1St7zuyf1ntMBwzN855
	62FMOJAFdDxPUs3NYHd937BVbRK8raCoGC1sbWTOeb/V6t7DY39/xUBUwGbf+Zt+gGBWkKwLpBQ
	nDAMmocAZ94+cXxs123UmjcEVXRlyEH3K49d+7e4G7IcYQBGfVcGjCLXTBjJgG+0L2zBXRrOB4a
	xPIZnQbVaq3YOsRyeWhswbKIiud1YgqrZeaWNKuhrHSkka3k4lk8GEHbKTHh3VY/WkBDmFseb8y
	4e1CPqX3SfikwDM7Er18V6MV8SOVT5hFfCeb+QIooxetg3IHPK3AMPTyl03jb/6ClzxlT2U40mk
	daM1h8RxtS5
X-Received: by 2002:a17:902:d48b:b0:2d6:e401:9676 with SMTP id d9443c01a7336-2d94a713d37mr81458035ad.1.1788246562799;
        Tue, 01 Sep 2026 00:09:22 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:09:21 -0700 (PDT)
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
Subject: [PATCH v8 11/12] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Tue,  1 Sep 2026 07:07:16 +0000
Message-ID: <20260901070717.20513-12-sreeshankar0910@gmail.com>
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

