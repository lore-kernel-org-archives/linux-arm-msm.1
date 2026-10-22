Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662118;
	b=fGH7PI0hcIp+dUBUEh+M/gCxlKMvNxKCzZ+FHZALyFBz3+02Fj9JlyfWtqjyRV+0vwsg
	 daiIFoko5HNl0GwDp094XxkPlALOapKhyW2QF9u2jdb1Jq7muGQJvXYMWkXWfzC3tLpN1
	 ZhpSjyF04wa0FA3NCUoSTGZY5Uyw/UoePaK0Han6hUkUi2uWfO3HzQCSuFXQphLAEqjNv
	 opG/LpZxlrdLBvkRf3w8x635RjqMPTe8YHIabtFNazW96QJehLnm0uuyp02RMSpdFeGqI
	 NME/tEXf/9SNRcfp2VTyfyN1uPgAcG5ITQbfsppW73/uiAcaWzv/cp1IEMyT1Rsl2KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3coeDBrZk8u/krbuiegVJJLUnKMcE1BvLH+6X7PiidU=;
	b=4QI5ZcDRulgjMHnHv/aHcYQv9fQCL/M9I/PUi40qx2+faE03OWLtwiX6mj4Qp3DuUkpd
	 Uxk98IDduBMx6qt5xq/yL3uKSoFkSm6rHlCTycL6GaG7DDy6RxI6D18K4cYYljvUIwFge
	 81RN9uYR8EAOiTr9u9I7V/MQzHOMf2ifiXf12mzeL4oFryLEND7ubdk2+cwTy6DeF//Kb
	 Ph3HFP5RerCgNKKMq/5oNtHE87Eq0ZJzKYLDtZklyT5V2tL3SQ2Ou5YT/0Cf5LApsmJ2G
	 nI72MpxSQQMoBJuWhWk4NYhHRB9NukFzI4A/0uc7pC3VsevWAisseH+vqmeTHj5PIDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LIJPXttu;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F49760A2600
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F49760A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LIJPXttu
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2dd76b1361dso10960375ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662118; x=1793266918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3coeDBrZk8u/krbuiegVJJLUnKMcE1BvLH+6X7PiidU=;
        b=LIJPXttuRUF3aI6VA/GbBvwU/mjQ6tXV3YypQwF+4GRv43301OmIvWAXHrJhFZjeFq
         Vad00cxPu09jBuojeK00Yd8iprJpKIyvwgZLjHrGgqDIxdWFs0Hence8H7TTlUpSX5Oe
         4gWrGNreVcrl56t6kWRkHrgPI3wjH2evjhvDPGfucj48lHepJS39H816/MwkrhPipp8T
         nvAk9NYjyy6CsTD+c0dj0OFIPTRLOXOHmnnmZVPbaSynfhi66ky8kk0inu6PH3mYspIC
         hTF08O9LNCE5EZYsbSPEWGqOVdKGOo+LxlQPaPMBhw4rZ9eqZHIIn2hjmDTZe6Svs0tl
         /1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662118; x=1793266918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3coeDBrZk8u/krbuiegVJJLUnKMcE1BvLH+6X7PiidU=;
        b=QYbghVddhpURjptqmMJEnaN4wq1hsWtHYVua8I7kKggW2jbEQh22ZP1v52tqHXLLou
         F7XDQjzGqkopMUX7wMl7n0swIN3RQM6wr98suz6J2VDSZgo5WsvJ8lgIg7tWYooMb2+T
         RfGLDmEbSw0sZF1ObzoAyWwupVlRUsiQCqhzS2NB4OeSn3wo3hYf13dF1siNbok0Mh3Q
         OrZgOTPUvCF/zpoRGD5wkdxPQPEDVu7XDyKQP0YpVPI1ISLLHNKvGadSWt50wcVHVaKt
         Hh4eEKDenrz7sasaRivf2su3XqGTw3Cmq+1Tn3ihAWHVazP5EGKmIKFcm5Uh4hTws0Bp
         FO3A==
X-Forwarded-Encrypted: i=1; AKwUvBzvNFOGPB9G9rVX+9hrCMeI6rOsfNyStbVHeQqUAJEXwbi8ZNRHjueF+JByRh5vxE4sN3m/YKXGcxJ8/q3m@vger.kernel.org
X-Gm-Message-State: AFq9FYKkuVuqIjgX5dAeUrSpHdDrCTijgbsMCsfilaJOZcDS30nN4nhI
	c5mpUFopzdgaNAMHKhBdhkzcXPxvccKs057KATEjPKnv8y+mBSwSkw9q
X-Gm-Gg: AYBFou0mTeOOTwVG3X4QbXjSg5g68Gsa4MdTsk0fRwhA/bBcJgUHZ0ibOS5XhbRvFe7
	7zmS3+tClQ4I1mAq7GxLxDQuDLeBmoNar6jLCmqAKL2AsD0v5vDZ2CsmsvQZtOKDEGyrx53Ak2Q
	XSsxVZvExCgRq4H4SIC2BB1zJ41h+JNMBvsDoJ4fXDY1bEmG6CErxZdC0Xo7/P380qZvAeMAiKN
	Th4yylD7NtBN9LCF8PHg+d/C/RlUumdOSWVNImtuzuBR4S8fr318oc2keosAKQHCMDyIteUwd4+
	skAIOItktkFS86PXQ5xcuMcK3OlmzOYxGIvzgZXuEgm84C6+WTJDzevI7rm55uWX1xb1cL/HuY3
	3iw1olr3P6vwerjlsHP5VHEpXAgHKyM7frqSl6wxigmEck0g+9IkhbmVjko1nuNeCHjzwDSWnG6
	I2ukKyr7AN3QQXse3mJG0NsVA0xb2qShYrDuOq+euEgFbuVcZWDZZe3UULUXQ2xqroYQD2ScLAD
	4nfT1krhXW3Liyzbgag2TYBb5ryUbdSAp6gbxWsXiL2+6FB
X-Received: by 2002:a17:902:f683:b0:2e9:5c55:c46a with SMTP id d9443c01a7336-2ea4396c346mr37258705ad.7.1792662117740;
        Thu, 22 Oct 2026 02:41:57 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:57 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:12 +0000
Subject: [PATCH v3 3/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
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
Message-Id: <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

MSM8917 is a single cluster SoC, so powering down the cluster means
powering down the whole system. This causes two problems:

1. The system becomes unresponsive, even to common interrupts. Waking it
   requires an interrupt from the MPM (MSM Power Manager) or scheduling
   the MPM to wake the system later. Linux currently has no way of doing
   the latter, so the cluster may never resume operation.

2. Entering power collapse blanks the screen. When the state is entered
   and exited repeatedly, this shows up as visible flicker.

Even if MPM scheduling were implemented, the second problem would remain
and it wouldn't fix the system being unresponsive at idle.

Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
is less aggressive and can wake up from conventional interrupt sources.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index a2907f8a63..06f7e7f57c 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -112,10 +112,10 @@ core3 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
-				arm,psci-suspend-param = <0x41000053>;
-				entry-latency-us = <700>;
-				exit-latency-us = <1000>;
-				min-residency-us = <6500>;
+				arm,psci-suspend-param = <0x41000043>;
+				entry-latency-us = <240>;
+				exit-latency-us = <280>;
+				min-residency-us = <806>;
 			};
 		};
 

-- 
2.56.0

