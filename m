Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793052630;
	b=X7T41xheqSVkaVlmKto89EbNIMrsqsBdWWznC4+cwce5oq5lnnpQ1y7xzlLysyfqECZ7
	 75PKeC8K67aCfNHDdnmIGVDhGGN8l+GUdqt30catBh6f2YwjxcemfarXQt3F0rcuKRqnb
	 C7tHD01iYVojPKyxfAWp2KFi18D1ajmG8bOGSuUqTrOy6tm0/I9dXU0QKepnTNZmRso2T
	 0iAcUwiA8VpKs8BRBlgTADSr1fSNKlgCJmsT0f2+zS3ZMyFHe1waZOV8jkLFwfxeH8hkf
	 lmgpAuSGDpAQfd8/tPeDRJgj2rqozQtb2SDQ6wOyWcFONzGzWGK8khwP89IyTxZZIeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052630;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ABoVPvvrFqOEH2gV0M6izYCHk+pREbqv5zj4Hi7+l34=;
	b=cYZm86htKDMFLGcn5j8PSZzPk0OhYcxPQsLQSq0WpaFAOav7Lix67bWgClO6MVcHXUPl
	 O1a6IBrl37Yjfzr7O19yyCP0o62M3w7fn6FTOLpIVtrArm7tTbJ5qF+3d1IlAuZWi1oL7
	 rxr9Gxa21eGRR0+8XZn7ILYt9NlbxsjjmGKNw3YV+R2GouNOV0YWKGPocvl6CmzDjt0KF
	 2ZHPt2cI8MzUu15vNx8hs0bcpInBaq8Xg6bkU/zLmvPf2ecWS8fCcHMrwF+7N1rATa+vv
	 MSlF6+8zhShANTsyTS6Z6+rfrxOztWqN7HH/CSJSyX/1mNYtpiAd1jxv16hrlcTvKeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=OQ6H+wJa;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56996606A322
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 22:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56996606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=OQ6H+wJa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1793052628; x=1793311828;
	bh=ABoVPvvrFqOEH2gV0M6izYCHk+pREbqv5zj4Hi7+l34=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OQ6H+wJaLSNK8+HBG0bpkjufB3xFVT04k2YOBlVurBKTeXhSiAYWWaBCkd03OcNtE
	 Gp2HavLSPTfRNuQlf460YAy29DvnQ9WfBT7BYoYnvWjO6SQMAYpj6aNBY5wgWR/PQu
	 gi6vs18p/76Gx2RE6+U1uPhUBr7zfnWfqu9qDLrk2ZVgco6L3Wo8KsQKjgco04D2Yd
	 fBP7eFl+76IyH57TS6fFZdcswNF4LU5k8R7Z0BV4hhZFed0FipZs6RvNGjdvjQRk7J
	 eP9JqnVVHAH6wHyqCNjl7KQrdZj59Ju2mhBE09HpznmIKlSazDiJ2b9NNUAHTba2d3
	 tydIqBmtulTaQ==
X-Pm-Submission-Id: 4jD79F21fvz2ScXH
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 22:10:16 +0000
Subject: [PATCH v3 1/3] arm64: dts: qcom: sm6115: Correct cluster idle state
 parameters
Message-ID:
 <179305261663.94591.234076861502971834.capri-dts-v3-1@michaelmcallister.org>
In-Reply-To:
 <179305261663.94591.5491359960257085739.capri-dts-v3-0@michaelmcallister.org>
References: <cover.1792840208.git.me@michaelmcallister.org>
 <179305261663.94591.5491359960257085739.capri-dts-v3-0@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The cluster state IDs encode unsupported CPU modes: the GDHS entries
request CPU mode 2 and the power-collapse entries request CPU mode 4.
The CPU power-collapse state is mode 3, as already used by the CPU
idle-state nodes. The GDHS entries also omit the cluster affinity level,
and cluster 1 requests cluster power collapse instead of GDHS.

The downstream Bengal power description [1] defines CPU power collapse
as mode 3, cluster GDHS as mode 2 and cluster power collapse as mode 4,
with cluster mode shifted by four bits. Its idle driver [2] combines
these with bit 30 for CPU reset and bits 25:24 for the affinity level.
For either cluster this yields 0x41000023 for GDHS and 0x41000043 for
power collapse. The Motorola SM4250 tree uses the same power description,
byte-for-byte, as the Xiaomi SM6115 release cited here.

[1]
https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/02ca1a919564a9b176a79cce09c40977f833e9ac/arch/arm64/boot/dts/vendor/qcom/bengal-pm.dtsi
[2]
https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/02ca1a919564a9b176a79cce09c40977f833e9ac/drivers/cpuidle/lpm-levels.c

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v3:
- Remove the final commit-message paragraph.
- Add the received Reviewed-by tag.

 arch/arm64/boot/dts/qcom/sm6115.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 0f2af8aba..79ca73bfc 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -232,7 +232,7 @@ domain-idle-states {
 			cluster_0_sleep_0: cluster-sleep-0-0 {
 				/* GDHS */
 				compatible = "domain-idle-state";
-				arm,psci-suspend-param = <0x40000022>;
+				arm,psci-suspend-param = <0x41000023>;
 				entry-latency-us = <360>;
 				exit-latency-us = <421>;
 				min-residency-us = <782>;
@@ -241,7 +241,7 @@ cluster_0_sleep_0: cluster-sleep-0-0 {
 			cluster_0_sleep_1: cluster-sleep-0-1 {
 				/* Power Collapse */
 				compatible = "domain-idle-state";
-				arm,psci-suspend-param = <0x41000044>;
+				arm,psci-suspend-param = <0x41000043>;
 				entry-latency-us = <800>;
 				exit-latency-us = <2118>;
 				min-residency-us = <7376>;
@@ -250,7 +250,7 @@ cluster_0_sleep_1: cluster-sleep-0-1 {
 			cluster_1_sleep_0: cluster-sleep-1-0 {
 				/* GDHS */
 				compatible = "domain-idle-state";
-				arm,psci-suspend-param = <0x40000042>;
+				arm,psci-suspend-param = <0x41000023>;
 				entry-latency-us = <314>;
 				exit-latency-us = <345>;
 				min-residency-us = <660>;
@@ -259,7 +259,7 @@ cluster_1_sleep_0: cluster-sleep-1-0 {
 			cluster_1_sleep_1: cluster-sleep-1-1 {
 				/* Power Collapse */
 				compatible = "domain-idle-state";
-				arm,psci-suspend-param = <0x41000044>;
+				arm,psci-suspend-param = <0x41000043>;
 				entry-latency-us = <640>;
 				exit-latency-us = <1654>;
 				min-residency-us = <8094>;
