Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B019E3DC4DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675379; cv=none; b=kpuEbgVIQzQO72BORdiG+rb79LXzJ+kucBEXVCMUkBLtiSjOEB6v0GgMIQIH0ur/FcgdIEkqbaVmO2KIVHfXhkQuIjdD3XTafs6KVDnjY1zl5mldawZKmJuA4Hjy4u42J4AIzC7/sv3xiFnRM3VxZs1MCBhMJOop8A1hEROt0uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675379; c=relaxed/simple;
	bh=+1KKaNTX/P7/V53JMeGAGQ8XdMuCS7KUkR2X20QbUvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sjmGbLJigufgpFz5aU2vCCV0bt6oqJ6NkUajVRlDTAuQYgeCaTds33uDVPJCVav/MOABbrTAYlnadsftPeF+DFfF1OqvcYpZdZtW7/hG0kKi1yr6CUvKAiGccaLos60dohtoJqSm780uvRBo1f/jnDEe5xpQJ6Vp/5Oz56p3akA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ULUXSBda; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ULUXSBda"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15e592da74so93305066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783675376; x=1784280176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqGhNzdohMFEPYe7rGIYSH65iapoiPfmEbyHAub7vT4=;
        b=ULUXSBdakKBgzIKKDtxc9hO2VcEF5rjtdCxiQsO0LtNItmWo2M5wGx2KbkkVIy1M7f
         gSAL88ZJW/R68wXxoaf7+yHfwLU+L/jL/kJZLRdmcoxkOJcpeF6Mti2j4UlJKZTQUWXC
         QCOll0caRl/lQphqeVkQyXT6uaBMhFKD5JsPl2pOwAMTR6wGU7PNhJL/shSZ2MYNgr/8
         U4RybdnHk4/Y2gBvlCbY7eyXte29fra/4dVE/NiEPKiLHkA2rJD1sfowNMxMW15yh4cW
         sQmPlCCd3k1T/4redMfj4hhoMsnfeWXIjVsdF3V1wP0pz0QVR5QdVvVpHyTydkIYdKvr
         fYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675376; x=1784280176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqGhNzdohMFEPYe7rGIYSH65iapoiPfmEbyHAub7vT4=;
        b=F/IA2MWOrawdr7v+x59FUPsDe+0mnyITBLm8GPWURIjD7n54uV/BxbQf8czf0EF9Dm
         +eNuMlaLuKKLvowl18pFsnomfR6VuYmRjcOWcU218h29WA2DcKxRhYGG6q29iybtv0Iz
         yw1hL9cSg9g2lU1681uhpR2KXEgZHePAIVMOFWmJeWwiZ74KYxpoz01x1ehRVW7m2+N4
         /DLAQVbGDnamGMc2kjeXUhyEYlDD67pS67pW2p538Z7GkJEGVgS3dhQcLCZGjro9cL4Z
         bumj5Bt/Ji268TCQM4NluUr9Epj/2VcyjAzR0kAyzd+8gonS7UfWO25a74IVSh+IVxS4
         q8jA==
X-Forwarded-Encrypted: i=1; AHgh+RrtMwr88qm+KDkidAS5KnFZmk2V5tBWLD+/itLJJ6z1YLybJJK/ccHU5ONdDSGJDE/qV+9Jbofw7/lz5EZ4@vger.kernel.org
X-Gm-Message-State: AOJu0YysNwQj2p1x/dvDhk3f3/vhUKvDdoAlXM1CWHLmxkCHMME2+fGq
	ASmXcQ70e4nOf7joS117PDBa7THov9jLiEHfkP3VRhegg+z6I5L7jnfKf83Y+b8P6029kd41U9z
	gPGEqLA0=
X-Gm-Gg: AfdE7cm6A/eCzGbzk4sWW4IwmMRCzR1WNDvZoy6V77w9CQ4muNRknlM3pNR3M73/fLe
	mhZgJy1hUAVPeRFAX6Cdytw8hhLKFJMyWKdRKVxhiGmSMtujZs6QTEJcb4M9aVMCjNJZClCxH++
	X0LgX/WMZaEyZnah8II8h5oX2aTRjOkAeUptlpbkBw1vtkNu3ofIwO006+pi7PY/zpcFwf33t0L
	SboEGbKXE0Fzhjv7AqZ/cQYB/w/GHhhNmcYcqwJkEYGeDWHxEMAkLef83vg31kSrWKJ2yc9MPyd
	WD9ZsfOmaHVTMOWgv6Nu4x38qhEaLiM5pFBpRcWGVs6GDDA1tFxi8OkjHTBKmxBb8NHRhHWkZ0u
	tEr7XmmYd+OSBrSuZCari5c6QldyIaVu+dm7bkt3BbaKrAQrTRWmT4aLpZrmU1/CsxyztXZXUpB
	LxCwc2uY7a3TD5lhxvG5u49Bs7TE0U/pkVQ99c1nq0HaXhyYuYzUv5srKN5Ois3DiK7mCmXW3nU
	tSYEw==
X-Received: by 2002:a17:906:7303:b0:c15:dd38:7f26 with SMTP id a640c23a62f3a-c15dd387f5emr361970666b.31.1783675376105;
        Fri, 10 Jul 2026 02:22:56 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm261785566b.36.2026.07.10.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:22:55 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Jul 2026 11:22:40 +0200
Subject: [PATCH 2/4] arm64: dts: qcom: milos: add OSM L3 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-milos-cpu-opp-v1-2-ae7f4b09bc77@fairphone.com>
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
In-Reply-To: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783675372; l=931;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+1KKaNTX/P7/V53JMeGAGQ8XdMuCS7KUkR2X20QbUvM=;
 b=7KzlagRFrXe26etPJVuOlzaav3hBDxk223iegLY9WRmoMroFHuylAyvI6EIEvhMaF09DPfOs4
 kH+zUzLWvF1DPyPHaQf9La7JjzSfvsNwTKQIMTt3BOFTQ5qTJFmhAAa
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the OSC L3 Cache controller node.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8c9232988953..1172a4f6adab 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2639,6 +2639,18 @@ rpmhpd_opp_turbo_l1: opp-416 {
 			};
 		};
 
+		epss_l3: interconnect@17d90000 {
+			compatible = "qcom,milos-epss-l3", "qcom,epss-l3";
+			reg = <0x0 0x17d90000 0x0 0x1000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPLL0>;
+			clock-names = "xo",
+				      "alternate";
+
+			#interconnect-cells = <1>;
+		};
+
 		cpufreq_hw: cpufreq@17d91000 {
 			compatible = "qcom,milos-cpufreq-epss", "qcom,cpufreq-epss";
 			reg = <0x0 0x17d91000 0x0 0x1000>,

-- 
2.55.0

