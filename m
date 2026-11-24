Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485397;
	b=Y9XAWkGdDodTbUxLcG5194ncqOi3OH9STqIucttQ4/W6wzKRnY000/6klqcRW06/NbRQ
	 gMPddhh+e1B/1dL67KHeuAkgZ1+q1IXg2hV4bcAtzuDNmwDWItu/S+QactrbJn9QTiaHF
	 SFeWU5dmni5ipO1fxLRxW0Wm1JERvEg9NqrnQzt5b5pONGwQ+jrZPL2eY+4ZKkhwCsPyE
	 s+UQyhAADvbKGooJw6ikmVdXzE/Fc1t4yo1c+zl95vz6JRdXtotJY2iETRRvC6D7ILGb/
	 z2S8o4O571mP/JJ+YUJMtkb+18vOCZbSuzbTjbYvsuQdt+i/ZYRWh0hSmsPBoW6znhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=olfHGmVoBSzOdX8diCWh4S8Q8GmJwjIk7FTkv39JtG0=;
	b=5icBoor/4DcgX1lZzepS+Cwx/sugLs9gTE2lMDqDnv5z3p0t+ptJh+7bGO32uhBkBTc9
	 1e8O0IFZGZ75NV8K7JFgUJSd6uNAqr7RBNbsDCKPrzK5dUIifWJQqmktt9f7bFS5tk8Dv
	 JK0A7BcOaMUlBcvNPm5lwkdIPMNWTyzW3rEVp4XFthB3ZSqOrJN1q+8HCpEEmAiIqdgDo
	 OQhoX1njd24Y0Gp+NL+xzODuPrc5+VjoqOLQaPXokVmvko/FlNgThVGcvvfkzpOsJBgSO
	 G+sqsTzBMC8w/0X+NsCDLAVTgnHTFsQIQFXPxidbAFKslHWe/wvar3IqPKghmINi93g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDiWOQzk;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2CF606A327
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F2CF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDiWOQzk
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-921342fae7eso44069106d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485395; x=1796090195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olfHGmVoBSzOdX8diCWh4S8Q8GmJwjIk7FTkv39JtG0=;
        b=YDiWOQzkO0itWpiZGHPNlHl+XfH7/3BcbaIiKvvp2aXm1x37s2vWJxvb+GV8bt3c5a
         62qgNc3BFlJOPSWP5ShvQLKqRHOn72BLshCOYGcEbb8vmjdClcAft5ZxXYpBXYlGGhm3
         UbHck+bc/k9UTk/aa1f3MbQrw4S/v9z4Q9wMtg4XvwnaSCuHZCZQYG5q/WwWFku+ACRA
         T2dJhdldkU/P+IAUFg5rI+8Py/btJpets77ZX4j12hu8tt2mclCNh+1IOqtAa2Ej+jxK
         jyu983WfsoTkDdmQPNLW4+2U4DTT1Tq871LOnDrXoPkAmYm/WGMQbigOICFyP5rxEn1m
         PJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485395; x=1796090195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=olfHGmVoBSzOdX8diCWh4S8Q8GmJwjIk7FTkv39JtG0=;
        b=wgExQ5gxIP6TB16hJ5tjX2I3dZihJmTAvh2/orCl5DCuPATCic6I/T6g+mTTR/Ai1F
         sQHqbGwsx695a/k61TUtxlHnWbchXl7JN4oKMpmBJcOhFeoleQFUR/a+lw+Cl7BzIkvn
         8w2LPWjHgwdyecWprljpflTL7zF03Uz/o9dT5tfJHbi/8Aj/jUpRKAMQb6o6D8KS7GYG
         siojxg7pcxSkXT07OVrE6vPwsSGI3R8U8RoLW4AozNpbT9EQC1+6FqSb35QQSwhfuMiG
         WEhOl5RzYyZ8RouYp0rg88Ui3arTtgdwhm6gguT/hqCpg0RYXXtYicv7YJbqWI6lezfX
         bnew==
X-Forwarded-Encrypted: i=1; AL+hErHgoeqtWocjdnAWA+6gml+TCW2xrCvMlRJfZhGPbmQ9BQTXPsXVQVN2PNSG7eAiBBoL8WG83p67vEkzg+AM@vger.kernel.org
X-Gm-Message-State: APuU4Z8LCIQ5Vc0qYDu/16qfU/j58InYQJLYDH7OkvCR9KKlL4xWK7ZP
	nAt5EzWNdEv8+pAkrMBDVRQkNCBjc63BQ9W74rCNx3isqbZcN8Mj1okV
X-Gm-Gg: AZFdTZfiGcGh9yquxx25LCA/KYvEERi8OWoQ6btL2LbPL/XDDv4sZKuSzaV6cTKIU3s
	779+zPGJF6OJURhjL856mzURAGeUbdN2FVirc5AvdrBNEuFnfTXyshofDAFHVehYtIMlPmzcqaF
	opLtJZyxfhBuYIVc+XpbjWbI9zP/mrDYxPFUTJieyv3oxjTVVpGkK3TrTn72WCw/ulJGy/M9JOS
	z4JT9g/1+qRhe93uwn5ayfr4MMX+Ho1ZmOXTB1KRDI1KZC3BXUQ0CqjOvFS3RsYA4L0QqGZ98B6
	pQHf24zk6wfpyEY4Dz9KihAXHtn21+soUyUxiErx3K1WNTdi/vfUsQp7Xye78TTkfiEuuQ47Ww3
	DuqILQ0ECjiSdFXRHOEOwT0108/JhMdbH1nS8v1iIQZcxQD8eGzgTX7wWSuuvkPQ/+xF8MyvnGO
	fzyzyy9CPxhVgviLwXmeRThLTOY78KDusJVH5yQ/EthSliRUHb74mdBokSPMhJhI5b6GBlolc/a
	1d7aGGKmUi4Z19asWcm0fjpcOT6nx1QRKB3h7VAbU/McgjezZKbcz5Q4/HppyYENelSULd8r6cQ
	RpHyXj/XEFe9ssi2JNQMqzNa6OaZEeGizckL8G4IWFec40dpYQ==
X-Received: by 2002:a05:6214:458b:b0:91f:19ef:9ac3 with SMTP id 6a1803df08f44-92134aa4454mr237506776d6.43.1795485394690;
        Mon, 23 Nov 2026 17:56:34 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d14d1sm121560726d6.18.2026.11.23.17.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:56:34 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 1/5] arm64: dts: qcom: sdm670: add adsp
Date: Mon, 23 Nov 2026 20:56:07 -0500
Message-ID: <20261124015611.187024-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124015611.187024-1-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Audio DSP (Digital Signal Processor) is responsible for audio and
sensors on SDM670. Add this, along with the SMP2P nodes used to
communicate with it.

The sleep state is included to prevent the following crash:

    qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal

Otherwise, it is unused.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 177 +++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 711e15b56cb8..e99183c22208 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -500,6 +501,34 @@ cluster_pd: power-domain-cluster {
 		};
 	};
 
+	smp2p-lpass {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+
+		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apss_shared 26>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		adsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		adsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		adsp_smp2p_sleepstate: sleepstate {
+			qcom,entry-name = "sleepstate";
+			#qcom,smem-state-cells = <1>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -2383,6 +2412,19 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 		};
 
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,sdm670-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0 0x0c300000 0 0x100000>;
+			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&apss_shared 0>;
+
+			#clock-cells = <0>;
+
+			cx_cdev: cx {
+				#cooling-cells = <2>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sdm670-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
@@ -2463,6 +2505,12 @@ gladiator_noc: interconnect@17900000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		apss_shared: mailbox@17990000 {
+			compatible = "qcom,sdm670-apss-shared", "qcom,sdm845-apss-shared";
+			reg = <0 0x17990000 0 0x1000>;
+			#mbox-cells = <1>;
+		};
+
 		apps_rsc: rsc@179c0000 {
 			compatible = "qcom,rpmh-rsc";
 			reg = <0 0x179c0000 0 0x10000>,
@@ -2573,6 +2621,135 @@ cpufreq_hw: cpufreq@17d43000 {
 			#freq-domain-cells = <1>;
 		};
 
+		adsp_pas: remoteproc@62400000 {
+			compatible = "qcom,sdm670-adsp-pas";
+			reg = <0 0x62400000 0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			memory-region = <&adsp_mem>;
+
+			power-domains = <&rpmhpd SDM670_LCX>;
+			power-domain-names = "lcx";
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+				label = "lpass";
+				qcom,remote-pid = <2>;
+				mboxes = <&apss_shared 24>;
+
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					qcom,intents = <512 20>;
+
+					q6core: service@3 {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6afecc: clock-controller {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+					};
+
+					q6asm: service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1801 0x0>;
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1803 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1804 0x0>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1805 0x0>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1806 0x0>;
+					};
+				};
+			};
+		};
+
 		lpi_tlmm: pinctrl@62b40000 {
 			compatible = "qcom,sdm670-lpass-lpi-pinctrl";
 			reg = <0 0x62b40000 0 0x20000>;
-- 
2.56.1

