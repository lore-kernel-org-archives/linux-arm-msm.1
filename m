Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458210;
	b=WmDtZrDIHgdLQGgsIm/Llc59FRD6/wpauEI9Q+LAuIGee78WJBaII+PSej+2n4B1/2c/
	 XjDTBKcoTJewcexgQRm4WndCyoRXnTUKE7y0PuuC9B6ngQPk+feXRIimtSbQ7IH1fiFUs
	 XMntBW394VWlzpTqkOCwMxay915uUA8JO9Ruae1MEdd4qmBUo85WZQ5SEbASGyMnOT5Dy
	 C6R0zK8XDblrRiZB0TnoMIWLCTv+65fOCw5JH/P00Esn+5xDkCTpMTfEkUtfwLcUaYEW7
	 3bVhq5iPqwI1dSpqEQ5xxFeXBJntivogbbE1wEV4jgIG7fJoAxKLuXgjTZTfeYnF2mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oMdtjkwHEoqDsA7OYyn3caTVREh9LlAS5yuCVMg7B/A=;
	b=4xnH49ookfsFZIIrYZVRa/8WapWrvB7eP0JmgqYQ/20kT0YDaPciVfuq95d3M4gzOBAu
	 MLsiY9vHqsUL7PlNYbqtmpmmFR55nFPVZMEGktUb2cV6qkTWTutyJtz9je8m6pAnKnDnO
	 essshMprGqwV07+vKsh0j1QArlvChH6E+LM7BcM/wdUy+ur/agquOCcMenxxZ7SyrKlmM
	 zFEeri6svp6wl9xuQKCihAWtpXybobgxez5wjxEpynZD7wTTNTA589VHz/bZFkcAMN2BY
	 DkjLCMJZSx7YVPj/wge8uWV4DFeqwyLq3fQC+b5TxyW3dssoBauQPjzBkv1ALaez9lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oifmBZ6C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ctm/KkqP";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B506606A89E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B506606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oifmBZ6C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctm/KkqP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zdk12135818
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oMdtjkwHEoqDsA7OYyn3caTVREh9LlAS5yuCVMg7B/A=; b=oifmBZ6C4d99gSrY
	M/wHrGMM/v9ZElNijdWT1oX0pDAV3minEPzSPZmwFWlwpd68ZhzCNBlBtCbf/k4+
	Rme8SB3eaFCzgBYCAiM6HXeFsl9qh2jSpY6U85bMmdyOmtLgY68l1E7Rxmam3NJm
	H4sVDNifKjlHQ6Hd7+e7eU8lg3xtdTpaH5Uwo8hMTloRpNW2yeirl5A63iWQnTy9
	oDIRtPI3y1rVVqsik1xZQ3ywZlMNCIxQ9bfdduNC3DyBdbXrAlixolNNCXqta55l
	mo2NvLpBozOHFpditxnWlREWUSKnd9xuqsAwXd/zLVnsV7bkNWBEWraNwzYQwCUG
	Rt60lg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjv08p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so327176eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458208; x=1795063008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMdtjkwHEoqDsA7OYyn3caTVREh9LlAS5yuCVMg7B/A=;
        b=ctm/KkqPyntqD9a0A1wD6QOMI5+nWdwl8L7eMG0SSKw9NRyCj7wSryhmaTH0AEpqgA
         C6U5Z6m7CkOLJQUvjwxKBT9M4sOOHAAd2qugCFAxBtQhefjtXSiz7vUX2kjCCx3NKPLZ
         6UNIrP0i7nPa9uXZcZylEgUEuBiAln6xXjGDCNKMze04tbf+GiaXMZyqyQG0w6Afo9OT
         GDB2b1xDWX5rNXXsLtVhGIWg8EBD7zf37o2A/9MfAgNJwg1tbFKxKx8zfZ1qfm46M87k
         bgSB6O+USfCNE1gne1hArFUT6bReZ/bFNXZVo21QFhH7fLHe/Of26qD2yQuYFwCmbroT
         EPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458208; x=1795063008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMdtjkwHEoqDsA7OYyn3caTVREh9LlAS5yuCVMg7B/A=;
        b=m/9eV2Vg29ZXsvUlN0tmc5x6AaCfJOnXX2crF7YCh+1k7cZPrhdNJQsXSt/c4keUYB
         k9NqFmMArVRmtukWinswDZHRXxsRUHjkFHd2mOSFbe/PTc3pFzYz7NaRbsskTiGR0rBG
         WNrdITVtROL1/9UM4Dp+iuxG4+I1EL5B8Uzj+7MWZwWt+tKf6FdMQrU8coH0pAcq5Jy3
         J+k3VHBe5VpnZwldjMoJWflTmLzz86TnnomnQrzTZ9kYsW3Fn+hrZzofkUO/KqGDOq2/
         O/rS9/YA72tO2O+fDionuyWcNB9L5Jv3zWCsaO61xZY1lACmhXZQmP4moR1/XYW5/weL
         KBdQ==
X-Gm-Message-State: APuU4Z9Zw2lQfC1i8hOMXgeBYizarzvaya1LKwQlZjYc6VcAC5PtGh2W
	MwQ8AGpmAGeomI+ApIkatv2VXiT6qxE3Le80cCw7CcqblvW3aPu7/OF+2Md0DeRFljfG0eeO9aV
	GvSg9olzLu7hw58rp3V6sxEcMxtHNzid+7cne1I33CM0VbHnJa5kVXPM04F7Qn6JmUTS1
X-Gm-Gg: AYBFou3H5kdGWYv62s9cJuxgt4HXcwsIW7zSES7k1KX5vVFHvRQvJigHiFTpkpamzQ5
	aVmttOGTgrMB2tEP2dayL3cYK+7eOxmKXwGCVFR3k1Gsp+YdYvIenGU/0lPTXPHHPzIWUvQAPJI
	I3EZOwQRuc+cIO+XIIyYCRSA+Al/Mx+pxfDwHYeiWj9MDPBon8iCo1NVOBiI3uHs0v3/YUR+45i
	QN7U0JS90QFVgPb1Zv7XOUrqZid/hrRuGK3ljfol8yKpn9VaZElAZcrSMyjI6XcoorjC0FRi0/Z
	5RRG3QJvAy5MlP82Z3YTrG9McjIVI2NPR7KMkE323Kx9SssPSirfTP7lpvHplS1UpV6NY52JiDu
	UwXNdUZXjpOat+62bFeSJn422lpZAzwMbvaf4MtitplV9AfJ1Vi970BBPcVcJPnCKuTbjNMQncN
	PJsZbPVnj+wZ9c4uma6yXyf82MCea3DSTkFo8sezIlV4eY/JXJqlm7uMVruVNMDxXOzYvNWW1r3
	mzAJ94=
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr1845790eec.25.1794458208135;
        Wed, 11 Nov 2026 20:36:48 -0800 (PST)
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr1845763eec.25.1794458207594;
        Wed, 11 Nov 2026 20:36:47 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:47 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:24 +0530
Subject: [PATCH v9 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
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
Message-Id: <20261112-08-dts-v9-5-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX4DCkdmQn4HV2
 qOj/0yU3LPNoUspfElrqsZbHGD4kh/bqb3Zyn0NGwgrINCd326OaFPYyzUHuQ7VcQdNVSx9s0Jl
 fjPDRfhPOrKtC/3dfl2w3hg3XyqOAAjXWMsVoscsIhW0PcCxGhaczgv8IKcHtFrM2R9/c1LrFPy
 CP37s4NCVZl/7ORxEoVJWkMg0K1fPZf8yGSddEy1yHiBwKfpV1D1hO3mcte9GK9rjOMFvMHOdnS
 IgYx18uc3/sA9WMOCj5rrnXT4gkEVJDPhWoegrqRmZ3DH0v8BNtOosAnQe9v2PduFk82WAn+lJx
 HkbIC1DEy2yrEQZnwnkr1ImTHjvC88f5flR/dJAJ6SoWYteKYWQs3WRBSNZ8XzKKrSXTBoY5Och
 8GiO3j9aR1n8xWbx1giZFPwqfCP2RF9dja4KHVvJ+pyxumQPs9a9ln9ZagRZb6bNLD5InZw+QQP
 uwq/Vmo6+6Rmjcc/mFw==
X-Proofpoint-ORIG-GUID: 2W022EBl8RYPqehH103jHZhrzjAJFNvd
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af54261 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NgvM7Uoa01S4sPDBfAEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 2W022EBl8RYPqehH103jHZhrzjAJFNvd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX7isGIS0gMHDa
 CdPw9AnFGpM/MM+xY9oQ+6QGb5BBGPCP3cGnIcqP65SJ3kb1+oHh00t9eZ4vMe0hl9midrKy5Y3
 84CQSUralzYQmg1eUeAiKyZJ00giGwQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
all CPU nodes.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 504364ca031c..f3d688fded80 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -49,6 +49,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -60,6 +61,7 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -71,6 +73,7 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -82,6 +85,7 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -93,6 +97,20 @@ l2_0: l2-cache {
 			cache-level = <2>;
 			cache-unified;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <181>;
+				exit-latency-us = <149>;
+				min-residency-us = <703>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {

-- 
2.34.1

