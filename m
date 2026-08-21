Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B51432E76
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300042; cv=none; b=Xa+VrmHDcrcnyCzBoPUNFmNI65UI9Bd+KVoJto7sF91jtPFombTy8M0TbChsOzYvLb6Up7BYSk8PLsN3DOihDKZsvN/m6+VmEPcDcGjto5tBQc/nyBQsaLl7zO8L6iAFf0QeLU8VEfPbyWlnA66dYuBh84PePgZO5cqFL7iYX5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300042; c=relaxed/simple;
	bh=u2Yu4YBYm2njILlYS8QED4Q5XuAaD+AtoFT/SlvHqq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSlyN8JcCxyAj5W2O6AdSX2BW9oqjBKQk6KDmPU32yZGDFvRokhLjDP89wysnos2VQOt3BPq9zaQG2W/upyr53OSua+FFazbMttS3H+rE9S0Di9cMWpY6mxVjXW2+hz/Le5D4nEKQIWlQ+TWh+TWzxZw7+5HUCWACSabzOnn9r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/v15Lxg; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/v15Lxg"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so10323955ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 01:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787300040; x=1787904840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=r/v15LxgIt+ClC1W8QMwX4ML+GIEitmBuXJhWqXrszq3yLDhXyxjJTy7SvJaovc/cG
         a/P4bOBWHT0dXeMWFGvsUbt1vVEajyXAc9O+s8xkvlm16quS0Vb5gm0r3KY6rfOyJlxl
         pC411eoo2m9484DOBo62HOW3VkoKp8CuMneNgi/L4dH6Pk43Z/vc4sT4gLtYAvKMOmPw
         lQWyjr1Ch/pTC8hCJenmwZ4Wp5zKMkG8h9HbS4U9q3HYml4syLwCUwuGnLlMoR7bxCbX
         4YizxtZL4WQ8XEeGdHPQWn3qQixsUQPPLQ5Lll/iOIJVSisfEKO41ZTUz0I7ohCg2tLw
         sx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787300040; x=1787904840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=Gnbo6+LGwabP9NKWyXzT0bg2tLno8ijw5Xqa3jsUGBB5qS5q468bsNPjTdbQ1LJ9VY
         m2j4PMjV51IyZeheTHQxQVw9gt3QQefF6uqOJZL1MfdCsthMXZXl+vG71aZzgIrY0E/y
         DwazfB7zQnqnPNcEqHW9iPexG7cIwDp6LxkwVJ04se4y69L0+RiQnJkINFnB+MtzGrph
         KfqgZVpEkhpqq4Ss0DijvTpluqnqid0STr2ro8MiVPPa6HRwRu1AeyCQMr3pqdQz4+j2
         fFetgPmbAvmRcGbzy0oyU1l7B3yhdERKxtKmCt8OKF/dIEjIkdVgKFkP+5JfCTHFIW8L
         8OfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0vgcW1M+68wx4ETXg606Y7LFsiCfKkldlEKxTVvupg2hvoEoytTlVhtiIkL22UdyXO9nTcxfVat+nOXXd@vger.kernel.org
X-Gm-Message-State: AFuF++lzjYgQbt8jFWeGsOXcNZQFFpQUQ/AGLXRJquL9P8nosYSh7MQD
	w7dqNWpFfl9c95Qtw9k31RfAFFlLd5bX48u2U9+3YpKLKmGi/padmV/+
X-Gm-Gg: AR+sD12mDwtPEXpPSnZPSsrO6oH6luCP/mzbbv02+LO7yOTVrqwHKW49ZhHcM4NTVh4
	AQbisTWRP43iLaMphKHk9lRII2WRdaQIj1HZMFxSLVcNjxgSEkNzpDlGfV+eNl4tyaRrjRYygg3
	lQTArcwClkPGl6Y4wkypAnS26lWatKKbgo9IwAVGN1Nje+3YkrrR03bo2bNPlJr2wsYX1Pu9mZc
	aDhPrrBucA2u+yfBvZmgbMG6TiJoOX06mLz0mxxHowzCQkrE6UHonDG7aZiPBjxF0x9QC6JJnwg
	2IoaLEfTadHvgPtPNHx9abzKmlqZGrP8jBhDGnX3GprxY4Wlc9tguAeCHYs/8pm90GpZy4DGYuN
	ch8cMDL90U7/6YdPxPqKIiMbK5v0DQyMlzQ8fESJHMqqWuMyoC75xohBlbSr/Q3ZzNLHZR8mQuU
	vOusgn9zRgNzSbWj3zCZU3N4XpqcPzd4QDDP8PxUnBIjM7u1N1k7MF4gFSLaa7ZG4uyLNjTIBh6
	zX6vfsHe/LTVRLjKr+2UF4=
X-Received: by 2002:a17:90a:c2cc:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-395c35d91fbmr8956473a91.11.1787300039934;
        Fri, 21 Aug 2026 01:13:59 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:59 -0700 (PDT)
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
Subject: [PATCH v3 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Fri, 21 Aug 2026 08:11:24 +0000
Message-ID: <20260821081125.4522-13-sreeshankar0910@gmail.com>
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

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
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

