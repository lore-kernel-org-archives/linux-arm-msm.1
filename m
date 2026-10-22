Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662126;
	b=wa017iLV5uHoya87yIEaaBMxoOXwOF64aZp6emsbNh19631dx7Qy8mlaU63nSHWr2OSb
	 3bLBVSxX2GaBx7m3lMJzmZ7TRjJswH2fLqvl/yLzsl43maDrMTzMND8XjrBLyYBRMJTsV
	 jNBdnMj+ZXgSRKorTUaHpJHTyaNsPU+dXCMEdwu7pkfGFEzYODm0GhPqCxUmy+gRulBGM
	 jrVWgFi2QJPzikhL8C7IgS3WoHM9827HI9m7na+DzEXc8BywyVICQWBlx+3GTsJFn2oF4
	 7P8kfrw+zYV63WfLOVvNu4kmjtaDZvlOn3PXMVm1m/qJCIvbCWEcp1wbxbA+sQ5u73g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2nt4hBSHpClOgv3HgtYgoEhMhOYNcFrEBCSUvXNxseY=;
	b=3MfcHMAIurwx8JbOfp7TPKCT5EdCme1CHOZjNPhSr5394fXVyXXtBNU1wIVs0AiyQrgW
	 1oUd8jRrF35n9xpqOym/Gn/1hcgH3R4wR5pvNh/51R4TBBmM2yqj5XrscXmS0TNawYmal
	 9qdVHQHj+3go+E6EVdUjyY6E7QT6349dqyUIxgr/t28BQgswB5vZLa6LbX3/cCkPfriUz
	 DqV9EEBGr4OqHumasL7vPT1Q4n42ocICzxAhvUMkCS/83FJBmTVuWLOEFEw9689SfSJMR
	 Pxlmb+/d7OGX0P1mXVZ6L9DlC0Db7i2VQs5718DIZwdH8iU3bXPT4jmw0ODiFrSoLiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXN5FGnH;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39663606A33F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39663606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXN5FGnH
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e608cd460eso10043115ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662125; x=1793266925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2nt4hBSHpClOgv3HgtYgoEhMhOYNcFrEBCSUvXNxseY=;
        b=jXN5FGnHRwP+5OJ7cTrRlZff4KAtHfziQlUnTWwd2J3/DzoQH338aRE6AVC3TtWQWS
         4sfhzUWpvN1/untLl6zPcQtwXvrsxdWrdvTw6mYDfYze6ooDK/U5SZ1xP2IRydnaKq8/
         rvrRb5SpwO3oRrLu7b1TWN9h9qbwpLk/5P216h0QTRr5ck0lTWB0SsNUdp8FHX6AGy/1
         Q+WJAEfhDkpylmSvx58DfEd05xu0nrLLEIFpJu2JKt2RVo5zQv5fxLR//YUlgHSJbLxR
         X6YhLYWNCxb/Pf19khjJrMBq01joJ8baqg6WiDNGbtA70nJMj4mKVSFFpjb0j4amgUyd
         n+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662125; x=1793266925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nt4hBSHpClOgv3HgtYgoEhMhOYNcFrEBCSUvXNxseY=;
        b=HbI024iecgy8S3icR3ig+PHtpmnZMD4OOGFxy2k7xxcxNJw+SfaiCoxRCpv620/YQ9
         ZYgsiKMxOmEVhDTCeDCR/3boDn9WtmpZHktHitNSqizcnu3uNf2W9XoX6XCc+AtQWrB7
         +85Avkh5gOaJUPqHo6D9uxsAqPRecC8sh9/IajumP3S6M2TMK6s59DBH3Of8luJGKPI6
         JR+lH5+d6cmZeS+X04odzawZNtIo7/SMyLl0fvPsQXdAZBf5BnHHwsZtOUBsEjibjaE0
         pmfFjtjr1nnA5CXlvRUsPFjNfAAsgW27lE3n+KzjGv3bkZI+M2w1UGVNFrdp22SFjB1F
         h+iw==
X-Forwarded-Encrypted: i=1; AKwUvBwIJrxL6zHyXJCZ0fjVav3FlIZzopT9hUrM1I81TgvqKRuac260+M2r/TrDxvz3v3QyXOQx+QoSfKwM96D4@vger.kernel.org
X-Gm-Message-State: AFq9FYK0FZDrkd0DNiFGYPuRCwzpbZqj/LONDYWseQbCDXVszBjWKCHf
	wmgwQMHtlcGdVE3Wd1HirLxrZjN1IbyfxQoeGQKTlrK/ZRh1IgTynEK6
X-Gm-Gg: AYBFou0OgSD/GqeV3B2nhMvS/6JZ6xHvdLolPgrpxUcTrHilDEwzqkTHxX3KKOInk76
	U+LII/JY5tF/efgGd1JfqhHe5/q0E/9MCjFtYf1gwMuupAmAV8aawF2KVTaWjd01UnghWV9PteL
	s5F5tHBnZMDbM79Y5k8o3D1aXkZuFRn2lVw8O+jEEOLMgUBPiizVndx26TpBi12sbeCm7VA8qHr
	NejsuS+Rxj3VSJ1Wyjff/iizacUCzAbPZxSaBUWb9CQp/RpjwkiFkKglK7+1w5X1Qk2vPmAnz+k
	z5pJKy8lqmW7t+CriKtQOBaU8N84sxl0PIvleHo4Ki0MmVNmCWfhFEWvcSykHdAQKWOK8Alyaf9
	RvCRLDjJVDneS8iVm4q5imXzXh7GT3aZWgGDibsy7hxbbZedNLLux6UB5i705PKwvyP10WU8kBO
	TxpyDFhUde7xKjbFalLLnJO61MSuDPtjj6OpbuG/WuYvW7OGru+nAjAXJ4cECe9fAP6VqKS0TsG
	pOcS3qnrhtv2IApDcRFM9JrCjUnai732zg12w7sf6P9MHDq
X-Received: by 2002:a17:902:e892:b0:2df:b250:ad9a with SMTP id d9443c01a7336-2ea43cc2bdcmr36258875ad.48.1792662125463;
        Thu, 22 Oct 2026 02:42:05 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:42:05 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:13 +0000
Subject: [PATCH v3 4/4] arm64: dts: qcom: Skip suspend mode switch on
 MSM8917 and MSM8937
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-psci-fix-v3-4-9ce2133c5659@gmail.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

The PSCI firmware on Qualcomm MSM8917 and MSM8937 reports to support
OS-initiated suspend mode but rejects call to PSCI_SET_SUSPEND_MODE with
NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and
probe of psci-cpuidle-domain is aborted:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

Skip the mode switch on these platforms and continue with the topology
that was already built.

This is expected to be safe since it matches the downstream kernel
behavior, which manages the cluster power level in addition to the CPU
power level, just like Linux does when OSI is supported.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index 06f7e7f57c..7730977e6e 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -182,6 +182,7 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		skip-suspend-mode-switch;
 
 		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index 7de6447de4..a66a544f30 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -311,6 +311,7 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		skip-suspend-mode-switch;
 	};
 
 	rpm: remoteproc {

-- 
2.56.0

