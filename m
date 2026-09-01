Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82A367F21
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 06:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245138; cv=none; b=q60hm8Fa4zzU7rC8QsqAgwWhFKs+ZCRYClkxkb4VqToXRaOnHRqC0fqEpgCBGMW8kkDYOolGPWATx46+2qioHqOmY0xhpC4bUsTT5yjjNEfHlRD21Ai+PF2A3CLZB/45/4wJAEMcLP38dIk0Las7MWCBQQyFUwpCwvsVXbnVhXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245138; c=relaxed/simple;
	bh=SL1wdM6vp1VIszL+xuNFr+53xhHZT8pJnJOiXD1KxBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRdJKVa5gEZN2xaqIaT8WQFyVFdIJdPFvd2IUt+TiF5EqpOXy1qBAM48ZTBmfu60Sm690jW0lAk3RymeX+nLbqMryGSVVc9pmEKiSC0MqznwgX1rwzve8Dyp9gP4zEIQ/4rWLom7OkZusiZJRI3jd7g7mXRJFD00mZMjl+D24X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx9yH77e; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx9yH77e"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d7195706f1so43395505ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 23:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245136; x=1788849936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=cx9yH77e1Z8sZhfdSJZ5Cu2hZ0snWIRFiHpx9+SoiHEycLcu6kPbzAVJYVnshh4wgf
         YG+SciIbDSQqmQMwcRryoSiQozzM3NVhl233uTn7NzOQ3I7A/UsxDvA/FxW/9uSqWW34
         3OeWfltYupz3m5VCzrwGQ4QOxJ249C0UEDMBlJdy5iFN4YFl1selqoR+Js0vRRyYvcLm
         5fYO+JcS1LdMbFpKiddQbrmjXC2ApZMMr9H5M48TXcQPq4VknVKCypu2ytNcPljr0TKP
         jf9SmvH1MB4COX4uSRGA81HA3djyBwGSIZH7iEBp+RXrfeT7UaLw0S3kk5l3hRBR1U5C
         aqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245136; x=1788849936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=DSQQBKMhVMg9UsR+nTEkOGO1ElfGInfNepLjfBotbGvNnOZm2RVN3fbhJHtT/Mbszm
         wet5XF9BZQjps//E2BHyKxeqgx9zcuFEZ0Pt60ZmaoDBWjIW+cTyCFBmidlt35M7fYxN
         pIxbfIar1mJnIiDulM8f+sVpgqaQxBvoxbp3HJsdH/6Wc679e93Uft/KtveanXhW8277
         oFsGuYiF73nC7p3Hu9YNEfPmZaYM6pr/8cQ3Y04PV/JiHhfzrw6u7P5vauFmjRxBvEz3
         Eavwk85IIVa2lIrQ/GWf9GW9ELlKIoMkywR3H1QIBy7fOIVBTJXFT8ky05Gp5ZqkH5aV
         hOYg==
X-Forwarded-Encrypted: i=1; AKwUvBwUqKoJIydh9gHLXDcevVa/Fwm94HwHIMEbrWRCymgOR39VAy4TjRCRS4KZlSxHZTsz/8NPAqa+gTcn884f@vger.kernel.org
X-Gm-Message-State: AFuF++kNb1ovde0uqvFCY/1xCxwUNCemON9yoSqC3GkWm/NmvxnzV1h5
	mTROahDn11xZjmNseI56Ki/T/IHd6gMKsMaRfe2Mpjju5gI2ObXXkBOL
X-Gm-Gg: AYBFou0eo8fUH+7aPdB/FpwuHYPkw7so5evmIQD3aKWjidcS5zPPZPGKwtT0WxXlsux
	Ha3ZEAyZ4ESC9aRLGD8qmwOJhUfkr0vSSqVaNO3JuNRwjF4YQ3RhMU/lNtGkTa9DAIYTvN7ou+V
	Ogm8Htj304tmVumoCrYsNrqGoF+Gr3I6LgaON28r1LISN509OwbzUz637Av1U8tueh3PsTNY5xv
	sDxisFx8Q/Pw/cTQ7Lq4l70JJ6mAf3N6PmxlLc/w0Ejnxs/1GRLEYfkhBefndtpBR9mFd4U2bxl
	AjJs7HXkMlzNGvX8fRH7bIC4nINRoadj1MWi9zjD0golxB7AoNRjxymtVSOrSP7vyBI6C4emZvy
	N3qGRstoacO3Z2quQm5D81cgaKa8BAwcSN85sOUJcnW1NzqR0/p++1jTPIY1W557J/5aN3yKCfr
	sJysK+L2tcmyCJzr0PM3egPziaeIytSz3l0HMVtxQtG5XAQ3GY3TAPRncNQqTUM0sRdUdWRqq61
	vis7ukmxC7h
X-Received: by 2002:a17:903:2f0f:b0:2d8:d4cc:be65 with SMTP id d9443c01a7336-2d94a905007mr80536945ad.18.1788245135571;
        Mon, 31 Aug 2026 23:45:35 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:45:34 -0700 (PDT)
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
Subject: [PATCH v7 07/12] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Tue,  1 Sep 2026 06:43:52 +0000
Message-ID: <20260901064357.20055-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901064357.20055-1-sreeshankar0910@gmail.com>
References: <20260901064357.20055-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

