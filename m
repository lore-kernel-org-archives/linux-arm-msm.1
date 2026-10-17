Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2124E3D3321
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 16:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255378; cv=none; b=m39SAjx3ADdPgaWbC0QLhs6+MuyL591rQY2zmQ8QdZTw2yL1JysAgyS+2wu0NIEXwvyo4G1XQ1n0N3RPI8diUDCqTtPK57/HEcSHSSzxrQU1WAkO1FBD+wQcOhTwPUh8zJJW09kIVf7k5NSgJx1HbpEkVwx6IbOpNzbdTyRuux0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255378; c=relaxed/simple;
	bh=BGOJLVXVccbwwnFWY84JCzL1yNcyYfyrD1jQgZCkXjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H05mj3irUKPTfFf4hApQo7QgW1FyDCogNVdhdOfUsX4+AduriHiMBCIIR+pPUfdsM62Lce7eHTTnvN9KywAoGJFIPn/97zCi30zNRBdlGYAwfAwtXUxNr4sMsrwa0xkxrskgdBsbD8NWs4C6l91kDk7g5w1GKTEiDXTxzcI8zjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atob6bsV; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atob6bsV"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-89f1318195fso419762b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255376; x=1792860176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=;
        b=atob6bsVJ1rIh2QWg23PqJPvd4vJ2U21qsAJQBBZd8RLkEGaW1YaWR9nP06unqEJ7P
         EDxqnAw+P5HBuQmEVCO3sMsMM2GSWAVRNgZe7GiIyIVaSFmoATFqPbWYq2N/euFDGWB+
         atUC/FLh5Pfx9VNvlvrxR3ti8Xbrl7vRvJKufAOF/S/b5xYlLgY87L6T1h5gjGhPAwFI
         Mg+OX5KYUHuTq+AB1vu6SszAWKeESxGwpi3KPgUSbqVTh/O2PAR4il2oLMf3jaK2ufQ8
         aJg2a3lYgrz/Uld/j03oV808sw9xzmn8oY7Mb1ZW+ALN2QZ4tflTKBrd408Jyhvq/kTn
         v8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255376; x=1792860176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=;
        b=NZDiFhq0daTW86Bk7kGVvvsv6m/1tWXlG8a5l3QOhlcnZnR3VY5gIW2KYGlCy9Otr/
         bolJH04DDt9HmsYSKCPqmoXuPw4xmyJREOmT9G5G94/UfOV+RuThrNWJyh4ZkK6LyV79
         aqn0hVQbS58qdUd6lBrEz+kWSDwWM04X7s97CNuv3ZP9O2JjslyyXBASmrfrG5KdF1PC
         RSBGXLKjoWNuz/VWn6QQbV4U8r/3TZnTzpkvwsCRaS8f+q9c4hIlvJtk6U599BE1FLpt
         t3MhBXH9AjcnJME/UdD53f2kK4YrgenRsnHnX2GjA1Gh5lSoR+QUJWbVn9m6t+HaPsZS
         Kgig==
X-Forwarded-Encrypted: i=1; AKwUvBykgIvPwUBlhRStAOUiWTE7h+GWEelIyfWdH9/bXqyV7PU8A6rq6FffMcYH6hGZN3EmZ4tNLIFDvWlEs28u@vger.kernel.org
X-Gm-Message-State: AFq9FYLQbT9wVWTk9JQYgxn4qqyH32sifjVd/InuheoYu8CpYRlL34OI
	k2WuKaPQiudTRFbxMIRNc1aPsA7kY5hhQBCyiaGpsi8ceVXU8vUZSg4D
X-Gm-Gg: AYBFou3CjhAkXtgImshraue5NINzMHUrJbK2OpqPVbHdRea7PgtbaJY64MtsyqTiHoA
	pBSEkjTB0KTCFjkBLC6XDV0yHbkJzY7l2esikqPS8vXx1+2eLy9iU7W+ivAgHfnOqxKElVoktJn
	ks8QL3W7u6r1K+4B4BIhBV7Zm/LqCoXmAIn+qHmS2t1Uea/lWfKvYkDyo4GzfTfRt+7E+VCR1wW
	+f7MWG0kV6SS3BlDsPem9ubGyxKmQrfZiRerg0O+Q++HP+AzlOhs1zKCYBqm+B/5lA3Obbl3+YN
	qNC2ihG4GbuCuJhFpSOsBUg9uNxv4+zgzlKDc07hqaHMsmUgfuZbP7kY745pccKzUGpC8a0dKjt
	THrTIWxN7+a2UAI1BFtoHb9qNvCV62ZfwBnpKxfSVwcllOGi9QBUyIpdiQAovhuGkkwVfdqplk+
	yquzGY25UpAkagjoZcirPXgGpaeprVufHeql5TwWGoVVq3T4ZQtoByHgqJPdtgqw==
X-Received: by 2002:a17:90a:fc48:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3acef14544bmr3161802a91.26.1792255376492;
        Sat, 17 Oct 2026 09:42:56 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:55 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 17 Oct 2026 23:41:25 +0700
Subject: [PATCH 3/4] arm64: dts: qcom: Skip suspend mode switch on MSM8917
 and MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-psci-fix-v1-3-dedae27e4a31@gmail.com>
References: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
In-Reply-To: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Reza Kurniawan <imkyufie@gmail.com>
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

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index a2907f8a63..f0771187d0 100644
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
2.55.0

