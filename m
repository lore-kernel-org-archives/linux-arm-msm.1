Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07BE4078E0
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246477; cv=none; b=doxwNVAoWRunZtyQrtrCQRUp8pdyx1uw8VSqBhOt2iLBeFm8KiwhXg+5t9o9OcU8aWsdHa4esBfUBxeHQlG3Je70/8NcxPEOTcdQfyzCUPvv/4owmS0GMOkXvL97HKz7oL+/B7PeJSRGf5maDmCXqX1uPVatMMQfWOtYV+lnUYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246477; c=relaxed/simple;
	bh=HpzD8eE93G0QF+A2LkG7W4+8iO6y5XPc4Rl8E5Fjv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/OOzLAKaLOwPshXe3dB5m4qAA7p4n2D0Flp9IUfbtFKRd+1DArPPfamL7bV1X8QfP7QZtqUo9w+8pKqA6kkP6GkV6AgM86Zi2TRujB7MwTafHBKoGVOCbH4TKPM0odO041C8UIAYiVtyirAUQEQozJmKfgh2xjUSrbKv+C9Wjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv8aySjf; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv8aySjf"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398e9698a70so679385a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246473; x=1788851273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=Dv8aySjfpC9KTDIW1iEoYJgwexn0RdcqOgHq0hJ+t6qviKAaov/joQynfsnUYxYiN+
         qWR409b8vIG+EIH0IL7BSN5XeGky8YuYAER8iPaWECQFA0tGt3K0ce08D3XduW8KbMWW
         nyf6V7geYnZufbBcWxEiX+bf52A8WhqFO3TmX7KM2EWDZNIswLk3B5kr67JDztySQc75
         T9vw+9QhIBXgc4Yybja1niUd9usBvJXUZGYW0I7ninEub8y1jLaxbvELCeIyLk+oJd1w
         5UgT5nMcQ97YxHVN+UthgxIgS6iN3e6wfEMp1cCVV/jwtIIVALE12CyRQdoIyJnQHdPx
         /Zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246473; x=1788851273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=Dm1Ml/dRbKi42XgLyjPLalMRyzhEiXcFNMvmbFOHSY/b+VfVIyblcBNMVfMx4WIlJU
         TYhI6rq3he+I6xjRrNLti4BBIQ6U627aJ0svzQmBNloT0nqukmI+ZevKC4FX4CbzsvVD
         5JfgrfkJCFel2JMALkiwYHnPbMIj1qc3g+sPNvX23ojYK5cS4j6Azzeu7QQkr7jM2VcH
         YijV2GJqAE5Bvd8Y7W9vXet4cpgTRtxADt8aljCTWNq3JaTzS0qFlVB6jrpsnMrHY0Zc
         pjZa7+3Bsq2yp6ToulqnPpY9xv84KA8KhAwra28BlGgVV3DYRJM1fgSNlXKHNGDh0ni2
         8mGg==
X-Forwarded-Encrypted: i=1; AKwUvBxe3DljPecnd1mgNRtS4b8RZ/H8teNzNX7VMyrNkZJQYdykm3MAAtPtuGqhcINCkqmTfwU5ULIAwcWi09vO@vger.kernel.org
X-Gm-Message-State: AFuF++lbLTijkfCKjTCMtG4lPFUbEHPPwYNDOed/i7IMHOmGMkYoYfVq
	t2CUrv/ohkPeWCqL9Nx+wNpa447SAGjTuNSa8gwcRv+6+9aWicbCWcRU
X-Gm-Gg: AYBFou0nUReLryAyh/NfC1bOspyfub+lKP0a6Fx8O0m2F2rFykiM9NmCuKptXaF2hZh
	btjFK9yuW+wf85WrHq2pBEB+w/3cnFPXXGc/oVc9NDnzdKfyPGSmG+AqzvHpga8Ra3gsH3MZgE6
	RgONuP2G8vbHu7KeMpSHficSDrC1niM2cEdGj85jckzRGr4u+twrg4arJ2yATMQ9HmqWLBa5QtB
	hnDtNhZ/bXlXA8LJr4/hYvn9ppS+IcWYjxsYNRo6cTcoilx7dVysdlYk0V6TtFAjVQnYcGLMSV3
	0LEsEzEMHM6Q2aD+t9f5d2O3zmW9ERpR0uYlaMAengW4oIH7i2tRTy4o0zGUtcy+ITmgj4pUAHl
	8TUQOUoXn+eZ0IfQLJhCOnim9FGASSje4nOA2vDpjyHPTtGcRx3yIYMeKUJR4ahsixKL+kEW+Oe
	5TJIdA7hXicE92nXMyZ1RIz9nu2N6RyY1N1AU0mJJ8HQh2SBjOidPTu1HmraG4SWKGFJlRw9Rwy
	l5vaaPI80whAs50i3M+vzQ=
X-Received: by 2002:a17:90b:1811:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-398e86bcf08mr15397552a91.20.1788246473340;
        Tue, 01 Sep 2026 00:07:53 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:07:52 -0700 (PDT)
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 02/12] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Tue,  1 Sep 2026 07:07:07 +0000
Message-ID: <20260901070717.20513-3-sreeshankar0910@gmail.com>
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

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 1836e226a..63ee5cd56 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -450,6 +450,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

