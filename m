Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A10233924
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743235; cv=none; b=aUTZRD8fFeaDZPCHXqeyXGnYmtvw57VDB5NwfULDprrsa1JfaRc6TZY5MjGwrKUcebuB1GPDSjrxVqNUdj37FZaRZ1oUJWRdICg4rAVJFimlUQNJ0SpXGY6ga4P0HcIPU/Nlf8i9ZjLhhtZWKaPIH0pTjM4TdppxziScJS0OGNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743235; c=relaxed/simple;
	bh=0bhEEsl5KehrWJF3bo2JsUSbKzVSTngwxVyTkTsyPVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYLawRGogtI+TEwuiUr9yvVKtgD75mtCuetrdE2KQFrFtgmTQ+rERruzVeHH76MHBEacv6DNiSWRxDG/3GqQSZ0nHRi4J7EZlsQW2NO8sx/ZzT6yGLZ1HtdqCg7RFJFm8cwKjfT+HXQ+Ip7xbgoYGutO4ikxlbbdVDv1cGrioro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N3nVuvTm; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N3nVuvTm"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aebd7da975so84646e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787743232; x=1788348032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXV+s2ztHMfyz3KkPq/1WSu+dd+ztAjXwGzu7vXR+h8=;
        b=N3nVuvTm99p+PrYiuMcGuLOuaHRVGpkjK9KxfX8IIaHx6Sb5vZRojlD+U9DFg2NaK7
         LOWcbHhR39l3RkYHAF4H7KBRmNNzhLfX3Lp+HA4/FmAiMAAFJPbWBwCPNafKa8PeHEMl
         lYn+SNyVLRkW91In9YbIjKwbGo9B/+WNQK6z+Nki+jY/SO2cTqEwuRaWMDP8lb+uHiyo
         jLU6AH0+Nhi5yVU0/gz/5DV7palbv3c4lrHXNilywTca7JMDzHpPpKMTG1PkdSECNt4w
         CcDYddG7w44iITHkN+DxeDuas2p1AEqMr9h+4lczHiOmR1lTl3vebtTI/jB3YIjV776V
         vzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743232; x=1788348032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXV+s2ztHMfyz3KkPq/1WSu+dd+ztAjXwGzu7vXR+h8=;
        b=pemCAF55FoLTLVDLFu4lEMrrRquloSfMQhxaiv6bdWjAgx7v5zgU9qoTmIaQjPFT1W
         6R1IAU6gT58RmL9q53/JC2Uu+ddW2XcICSKUY8GLaVx2c11S0BGGZHN24OOzqkgjuGuY
         bWw1+CpbwbMqC2odAI8RVabFtICE2TfRMtjdjlnhQKiQzW4aeRzOZfM7Cm2nd2XT6Mqo
         U7bedwArkUNVu43r1H2lTJXEMDaDKuvshWg6eXTpQpbhss2Uk6LO5BDFVuXJAvGsQe8O
         NkhHKn1ABGlXUlIZwK9V1h50RNc8Tc60XNFRfA+K97cMoye30ZIuUnfYXi+1cmn3F2U+
         /1ZA==
X-Gm-Message-State: AFuF++nHKSuHSih791LlxhzsddqLi31Ke17ABjA64wfRrB8mcF/Yrx8b
	BCm8NPMj8fULlbxBNNcPczTzUYoGlWEk0cXRtfD7TJH75//aOLf7EcRIPIkSZCN3IJw=
X-Gm-Gg: AR+sD13GKhmpknJFxjYl+l+/mjBN3Ah0JzPD7rBf5nsrONafAInsLeCIkHr6RdNpjy9
	TYzbc/mGuLo106rWkwR3KZTJ6G54vWh5gUj/xbYbThaRr3nMJeXngAqBCS7Zth6RMw4iL1pD/0D
	sH7CKqA3YLqXVZLBNSas4qBu1Lw1vl2Hg9nshazYHmF9+5I/Uhk1Cax5MLDDuU6Ah0nXUCio7N5
	9S/B9MSc2hznUT/EgW5wAfOYrUiyMcmMN46HNJjfAFUaGZdfwRQpDi95wSCk346GGTAUT93EHyf
	3b3Qlq/8ETRdvkWAc/YCgX2XRigpQGeb0wo4Dl5O4ovNHKIHapgiQDREI0JBVuhQdSLGThgaXAC
	pwVjNKqtUbDJlZbyGuTQTKRot6VfnrzRSvQwX8yX+Twn9/LJZBMWxFpy0Tnnv/fFv3F84ZvIGLB
	PPmSKKD38V0ug6LuqlCyIY5bZdw5aBC20YSs308roXZG2HluctNTE/AGgY5AE/botv7PSiVCCG8
	lqd9Th0oIwa5z17aHWjb4mSHdOB
X-Received: by 2002:a05:6512:3e1f:b0:5ae:b6cf:2864 with SMTP id 2adb3069b0e04-5b4a8fa8fe4mr1007738e87.0.1787743231849;
        Wed, 26 Aug 2026 04:20:31 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4a4110c82sm540693e87.0.2026.08.26.04.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:20:31 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: Remove .use_rpm property from Qualcomm clock controller drivers
Date: Wed, 26 Aug 2026 14:20:19 +0300
Message-ID: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A clock controller driver is expected to be embedded into runtime
PM framework iff there are specified power domains to supply the clock
controller. If there is no power domain, then it's a noop to add
the driver into the runtime PM framework, and if there is a power domain,
the dependency can be considered using this fact rather than relying on
a probably stale data from a particular clock controller device driver.

Since the decision on connecting a clock controller driver to runtime PM
framework is done independently on the supplied platform data, the outdated
property can be removed from all Qualcomm clock controller drivers in a bulk.

Vladimir Zapolskiy (2):
  clk: qcom: common: Tune clock controller dependency on runtime PM framework
  clk: qcom: Remove .use_rpm property from Qualcomm clock controller drivers

 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 1 -
 drivers/clk/qcom/cambistmclkcc-sm8750.c    | 1 -
 drivers/clk/qcom/camcc-kaanapali.c         | 1 -
 drivers/clk/qcom/camcc-milos.c             | 1 -
 drivers/clk/qcom/camcc-sc8180x.c           | 1 -
 drivers/clk/qcom/camcc-sm8450.c            | 1 -
 drivers/clk/qcom/camcc-sm8550.c            | 1 -
 drivers/clk/qcom/camcc-sm8650.c            | 1 -
 drivers/clk/qcom/camcc-sm8750.c            | 1 -
 drivers/clk/qcom/camcc-x1e80100.c          | 1 -
 drivers/clk/qcom/camcc-x1p42100.c          | 1 -
 drivers/clk/qcom/common.c                  | 7 +++++--
 drivers/clk/qcom/common.h                  | 1 -
 drivers/clk/qcom/dispcc-eliza.c            | 1 -
 drivers/clk/qcom/dispcc-glymur.c           | 1 -
 drivers/clk/qcom/dispcc-kaanapali.c        | 1 -
 drivers/clk/qcom/dispcc-milos.c            | 1 -
 drivers/clk/qcom/gcc-hawi.c                | 1 -
 drivers/clk/qcom/gcc-milos.c               | 1 -
 drivers/clk/qcom/gcc-nord.c                | 1 -
 drivers/clk/qcom/gcc-sc8180x.c             | 1 -
 drivers/clk/qcom/gpucc-glymur.c            | 1 -
 drivers/clk/qcom/gpucc-kaanapali.c         | 1 -
 drivers/clk/qcom/gpucc-milos.c             | 1 -
 drivers/clk/qcom/gpucc-sm8750.c            | 1 -
 drivers/clk/qcom/gxclkctl-kaanapali.c      | 1 -
 drivers/clk/qcom/videocc-glymur.c          | 1 -
 drivers/clk/qcom/videocc-kaanapali.c       | 1 -
 drivers/clk/qcom/videocc-milos.c           | 1 -
 drivers/clk/qcom/videocc-sm8450.c          | 1 -
 drivers/clk/qcom/videocc-sm8550.c          | 1 -
 drivers/clk/qcom/videocc-sm8750.c          | 1 -
 drivers/clk/qcom/videocc-x1p42100.c        | 1 -
 33 files changed, 5 insertions(+), 34 deletions(-)

-- 
2.53.0

