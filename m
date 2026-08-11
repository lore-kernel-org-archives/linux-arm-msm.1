Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C0B4582F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455488; cv=none; b=oP9i8QrQeOUPK1u95LLFAMzAOigdo4B++a54UO0brPQ0dBPJlYg4+egfsDCz3vLYDddUxMcyjsCJOkyr/rxSESeKJrka0vKeLzrt+wXGLlTnP0hYoIFsHc/ALiUk5jWS99FxsqS9DsfQfCqvF4ZszkiYPY+d3gB8byVHdBfTx1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455488; c=relaxed/simple;
	bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/ZYGAsbYmgIIEG+r/bi/sGZoHh67PQ6ICoMHOI/UlT4PWgUX1IXx6IGxhxOGwPT5f7CztwaaEAoCKgP+ULNVVUpTqvc4EXxNi03fBUXPn16fssyybiUtntFKU218y6x2rgNvs3hpTTpnFiQIDSE5RnhVZh2GDuB7A1HCVu/AFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5WHwFkd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q01+jpuJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5WHwFkd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q01+jpuJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWf8I1317136
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=; b=Z5WHwFkdf5S9C+hL
	ZK4XBa8N3GnKZ6wZkwd7kGuCmMOrDQQCA9nzHFx+t24aRyZEe1FHNBQMLiuQ/lQZ
	fDvuhkucPTCvNbSoitqLYl2T3gNp5gHE6W3Q25lFNBFqS/emsRZsOZYTyzymk53U
	w5nmnnfIDrAwTCXEb5rO1Hnagxh2OvJf5LP6VB36+GIrrC6TY1bxltFqSYSKeDi4
	cFwPhWibosteAk7/+p1yOsFwb+3W1nh2RUB+1/wfPkGWkuWe10m/1mMI4BkJDIIT
	pBZQThhPqvPqxVxIzVZuCyATkNx6yvjz2/x4I1REUFj2rfR/HWEGpZj9qLcEEhAf
	KwXiGQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyqmk2yfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:37:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccd1958e8fso43919275ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 06:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455469; x=1787060269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=Q01+jpuJcfC/j8L9UCBMldxB7qg4iZko/QpfP3RG4EUtI6fwsP3Wi34Js2oBN6VwEk
         hF93PdshKfz5AYrYsG4Dd+YWGKfbnZnMG92lJVv71tBEy3Eis87ODEAVhgjaHAwgL6TY
         DFUv9CXWpV+AxGzt+krGTe1dLTj+ELN1w6cNOmsKzgvZmY5HoiMWRFmBYalIHPd5U56t
         Wn2Uyo9ARFPBM2SyC8yhT1of1vS6hioMT59DFDJIsoTotB1KmWQUMyixPf8h0iaUXazo
         aWCz7RVjv25gjz26WuznOfCgSNAlulMB9JvlFJgD2opYZIkCL4uOwuy+zK03i8U9ukwD
         tbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455469; x=1787060269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=pVeTMwRFgXpSL9r2VvsObgfup0ekYUDN5SG505PGoQ3I1B+HNhNet3vHEaIQKPgXzH
         isij0W/Oi3LqX1fFBDuChm4m/pnyPldguBHJB2HZoL+pzspuzwKYV2JROT1F+feS9etY
         gc+UWRIldirIskUpJiyULqcjKo152jnK25Sd9bXQsKcSM40krpzCfXDPaFv2l+lN2Fq1
         /I5W9rId6CBhrWP2e3H+A58ptBtVeTQoxrQAIB7hk245tbFdvhQ9nLpdP/7COzuf+ezU
         9hpyQJ0WEsEwNCxQyvQaGDi++ZLAAzQ7U+Bb9GtzbP5u7Fp3hK5BqO6glLsIayeQPw7H
         553w==
X-Gm-Message-State: AOJu0YxcgDROvPpl4URLNIusS/UdBuE9GbfDPxoHi3XkRbPPFBiTbeF+
	qO2F8umc+rsdgrDER+kUlq6MGkg02w7/fQDcnEqZPG6IrWtbs3tIVN6RWJvn77Ei+Zv1tlKqBMh
	F88DeZogZwNn7unFRV1WExTmpBrHXbTI4uP2kSfDY8SAxJtP5D+lMeYdi2KBEvELbpLFYmXPJhN
	be
X-Gm-Gg: AR+sD13Rot0SjbqebaoV3UeIejGcsQzsBBIoD8/NZbNTv1y1brqtt2o3jOIvV4zC7z5
	OcJZNnJcls7XcK00+Yha8D6ILrgxWIOlAhetdoqm01In7wmENlTKgPJBArZiplmwWad/66syp7p
	A1/MJ5S/2QC23R8LV60mSMWw6iZBoMvpv+OMviRYRL/i9Et6/rXskbAxXFGpRE0xfCYehW8bV8s
	tTfanXPxdnPV5OD/2hBkitRShTTG7qrx08Ewla3wtqmZPMxxkHxleNZID/Yyk8tRowxMeGJ9sky
	6hgTiPsAkeZ+1r3A5PYDta8Px/ntIjj9QcyZuSNPO8RhdcromgY1LvMupWUPa2qSCjk4SGcB7s/
	NWILfuLSVBsSMbr0k+cj2QfHW8pMGTVO+RO5tZMJ1GQOE6u7yBiteo4jc
X-Received: by 2002:a17:903:2c10:b0:2cc:307c:51fc with SMTP id d9443c01a7336-2d31792672fmr42113475ad.21.1786455468760;
        Tue, 11 Aug 2026 06:37:48 -0700 (PDT)
X-Received: by 2002:a17:903:2c10:b0:2cc:307c:51fc with SMTP id d9443c01a7336-2d31792672fmr42112435ad.21.1786455468060;
        Tue, 11 Aug 2026 06:37:48 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:47 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:44 +0800
Subject: [PATCH DNM RFC 15/15] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-15-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455331; l=2861;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
 b=aJaoYrw9W+mA2/V0kzVcJpwauWAIFZKYoqSpfelZhQsRlyjmZPL3F7nE5RXcGdIQV55guzjjc
 nWbnib8y0S1BXytBv8z+28xwewiHOvt50T4FGPEVTHOjsarfwWb3E4a
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX9SYsrY4Soxh2
 svE/mXF0KAXU043iM+7BQeYRmWpHEeVC8y9Dvco5iro+zuKTn3pIj8sPy0ogiuX8lxUxx1Jqvn/
 mM1um5hzmSMQTgvZMUepN9uUfG40OxTqi13BQDW5IpcPNnnnKJDqj1g2kyM0Hg3lxukd0TNoCIw
 wMe0vxJosFO26AsTMgwPi1fBhbxNhC7HPnX57jT+VvWDjkxQVui2M5jWQTIL8uTu/vCCu9b9J3G
 y+ihv5wBVML3wxB//sLsL5ouWLSD9IFmVNs8RBr0vdbNNff7887KFDu07befAa4Ke7NJ8k7v/o+
 I50mFP5YD6DU+GiSHwsvnSicBPzORiwry42qstoq7skLRwp0ZWhdg6hJyMk0/4vG/KnzrP3RuQs
 xj3tm++ty2HOtM2ulEj/DuKcm9QM0ZdpJc7KUB3P2P3JWbR3DBgGc4/Wva9GYqfFeKYH4IfODVZ
 wDBA+p8iDO9aKxebzRw==
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7b25ad cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX/VW4SIajZthl
 QWQFmIyn+d47m48NHCWL93bADCJbaXXetUMnequrBRcqdxJDdPCyahMTjng3lw+WgnAGHfxn0o8
 FFkHRQR01l/YMFqsmrBAgYV2JCXjAwY=
X-Proofpoint-GUID: B2v39GfId9u4RVxDcirimfYTX2c_F2aF
X-Proofpoint-ORIG-GUID: B2v39GfId9u4RVxDcirimfYTX2c_F2aF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node. The root is
the root of the physical address space, so each cache node only needs an
identity 'ranges' property for its nested MSC's 'reg' to be resolved to
a physical address. The two caches use distinct node names (l2-cache-0
and l2-cache-1) since a cache node has no MMIO unit-address of its own.

The nodes are disabled by default. Production firmware does not expose
MSC register access to the OS, so these nodes can only be enabled on a
local test setup where firmware permits direct MMIO access to the MSCs.
This DTS is therefore only an example for other platform DT authors and
is not intended to be merged.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..b1dcb1e9c570 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -48,12 +48,6 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -120,12 +114,6 @@ cpu6: cpu@10000 {
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_1: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -531,6 +519,44 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	l2_0: l2-cache-0 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@19870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x19870000 0x0 0x10000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
+	l2_1: l2-cache-1 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@1a870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x1a870000 0x0 0x10000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

