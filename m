Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0394E42C516
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 04:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297844; cv=none; b=WSTTEfh/7rXyYuRxiGtcWv/XbU8mTX2vOO1QU+7He6vC//2Wqp/Kj1OnNt+OPVhGJgLZfpNnysN0JJEr/dlAt8GGfx88+Rj72rhi0MSk3o0opSz4I3uuncPuc9DMdIEQJcfRZWPlWWX7pSZjKojPFUiBGW/1xzDmyuKbXYS/jzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297844; c=relaxed/simple;
	bh=V1PrfALe+dXwVq1n5n/hITI7hGqfkZud86/hme5sr+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eSMh0yupgWx+GNs7lgeqX2oyKE32KpkLOQqVk15tsh+Eh5bwck8ap8BFTz1AcJRf1NkzCHo8XC/jhbCoq1F2aYhaFvvlTXyaLnwwsRW5xx3fFwkpIt2mHt6NuUnBYa1nBL5QTXybV8Q5DF1V9qEABVC/A42Bps/B02XKnOyPpY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiDHFkgK; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiDHFkgK"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e5fb79ce82so5059155ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 21:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297839; x=1792902639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=AiDHFkgKgTtqrGV/pACAL8QeR3YGPRzDSBXywJIF6f9wfJDwzDVmmEddWI7PaShnbd
         FJfNZegkH5+dPNJ0D8nk1v3ZdwFxch0q52MQT7/hYQzyhKQq8jtd82zlF4CXxVfXvKWx
         wn/g2h7k6n3MM0gnrZfZZdFggOZ11slw9R33iORWeRbQ0My5xTBsVB5ECIduL/NyMhdy
         1Q00tCIjUUfK0Ay+r5X2L0USJGGMG8XD3vngyUm5DXHkKDsKws6P0oH64zx+5+w06cMz
         DmRGB3zUPzZZUFx2DwV8xDpbIr9dTUFzO6V6bKQfAJb7I8814WTsxNtOT2k/98ojtfz7
         zWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297839; x=1792902639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=TpKNtcFbcPTYgiGMiWuuYe1cp+XW2cUt91Yp7N/wK+yVeVy+405EQSArU/dMe3FzHJ
         twC/mZZksbTs7x2tkc6r32UmvaxsVPeZ7LlkRPAjF0Sg24DUcyfAz6GUuGHDgRudZOEF
         YQ2DjyVlWj3dJwWLp4NTTJEoYtwrm8z7AtAz2fdUkQ/NfPPvrd8KZ2QcfOgNUle66Ilm
         FOsThPkLsdCMOCGVnuchUfTobu90/MY7oZ4d7CTNTgjTHqWWmBxbWF42T1ZdeJlkr0tJ
         GnSIFjLaOgs1HSFfZ8ZpjAwdkTsUauBz67l4xRK6M2MO/THsKwfeAtF3T08yfjqTG1rc
         DeOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuQWFkT1jilHiZjNeZqAja2SVgU5sU2I0HdXrDfWrjZD9jAMUOBa0FcFHt6Mk1IGhEa6SkWCE8xD0Essiz@vger.kernel.org
X-Gm-Message-State: AFq9FYK7LA4mtjURGtj/cgNQrqtwfFw3W72v06UoQ8t5mvR19Xn3GP+S
	CPu9fMsnzwDyq0XjlCaARr2UQeynzj9u4lNgSmp9i3Hd737Gs8tzPpgx
X-Gm-Gg: AYBFou17werb0QYS/78m4M29yiZBRxFchJkvzSiyghkOAnoD4cUYjDwjoPM2iWJ/bqq
	W5R64FSnO5OCUapMguRG5bNtCnfV2IfJY14FcY60PrgP/xMyBCpsCL4ihgZdXaGIbYoD33B9eN3
	7+fJwb9AdhXvoSyehheiXmoVIIgXpCk4uU18zb+xS0rz9in+O6I70184EVCLHBsTud6BqJR+xgc
	kvdp4vpw3/mdmgv6gvOoRj2ox+gaIvGY5ojN8Ti2Qc+kjpDRkvnAEJK+nEZP7M6gI0fz8EjNgDU
	CEhOThYJsExlLvEXpVSXRbC9dJAMPIW4OrfsS2b/5zzmWJ/ZbJVkRNJZmXrCZ2Aw2OHcMTzaf5i
	v+1Zaso4pbu4MDOoGCxCmdpvFCBOqxXBHOfXKkxMf/XcDkLS9NjbCex3Y9+xU1prmZDXxLKkrgQ
	JXWwW+u55qo/0DvonHFNHk8hOXekP4wxva4YZUjxSTQWTn/We+yOzX3VIx9IgKUmM=
X-Received: by 2002:a17:90b:380b:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3acef14451fmr3843389a91.24.1792297839161;
        Sat, 17 Oct 2026 21:30:39 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:30:38 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sun, 18 Oct 2026 04:29:24 +0000
Subject: [PATCH v2 4/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-psci-fix-v2-4-35f65b59eb9a@gmail.com>
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
In-Reply-To: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
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
index f0771187d0..7730977e6e 100644
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
2.55.0

