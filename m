Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699473;
	b=pynauFNG5q7JSsgzMUbNt/+1n0PqWLSbgwYjfdCWO5KuG4L6Nl8BkG8OQxe8rmHmwe1M
	 YeXu9Ue586GVHjVoZjDGlDKSxo3bxQipIJlfWHUl9sxuZrB+ssOZAatlSN0KmfHVsboup
	 gx/YbRxwFjRN6RAT7zTwo+l5W/aCtWEc7nvCyNH90jsU5OaYpsuqR4oZI9inUern+V+vd
	 BPuxNRGD61wTuryAcn2qJ61rpgoFYuEia3soicc0uGT2ZI0r6yQfU8S/gW/bD/G66/xA7
	 gHbTWcblVwObDvf1T8quaSgj5nmVEIaXWAu0LgbbIwoiyWiwgmuDj3wXYPso9lOmYCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=agh+7DaHk9l6HM4O4vSm/A7msIgux62Q7vlo/Q1Z89U=;
	b=gzpzRkyklZ/xegsmYt1gUkpH6a9FzLdohDi+EuEOIQ9zJKwGfVCu0w1ZUK+tRx7/bssA
	 e8XyatxOe+PxH+TwJvOsYUJflsLIG9aktPwyrc4zUkG2ZYV4sr8LMzneW0wTB90kv+uA2
	 WNRX17QMpTuff3pqZPKSUaoDmJbRYxNhGu7nb3LUOnRyAKOWpozsLe+XS9gW+I6Vqpd6a
	 bpvRANEflUKON4gVcH46Wz6NB7JRtN9Wefn66gEcz68oRg2epXh2a0RZ9J3HHu8p6McwW
	 rvIA+mcd0rSV3FpZfhh/bzQ/tyiJseHjCiAo+p5WMbOAwq/Gb/+CzBBz/9fj726yQYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=REMyzvPt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aD0TTbhn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E8F606A329
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E8F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=REMyzvPt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aD0TTbhn
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVQon2785104
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	agh+7DaHk9l6HM4O4vSm/A7msIgux62Q7vlo/Q1Z89U=; b=REMyzvPt6HY4Stem
	GGkPk9+AHPwmDL6ZzzkW85PkW2hDcVmVNNelCV5rjYeqhAqI1kSh8zTb4vjMt7W+
	LPFBqEECYo//xb1MUK/Bx+a2gCQFdFcdrvYeAvnBccHi8I0MXmwVDWijjuJVnxb1
	k9s8Ulg8TEHlvnlcCfnQ0mHFxCKPxu51Q/J9f3NOLg49joqhQKeWIHQGMQ8YTtK3
	JZeD31Vc6U5Fnj8t29GkuUJQrkLa7PVhhR06sosGei0zL063AaTh25DSC9ls0NVc
	Vu8JHrrhH6DhiYgebpMvaSqq/+222Mb7j/ytoo0IaLXj30sZqsJBqV1SxzEEu7Bi
	i9C++g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfb36u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:24:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b7cc3f8a4aso5053509b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699471; x=1796304271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agh+7DaHk9l6HM4O4vSm/A7msIgux62Q7vlo/Q1Z89U=;
        b=aD0TTbhnvucpEcQDDAAy53k7J/rlgttOw2JBPVlwxgwk1jlKHrxdqotQ1xRttnh3Cy
         cCEu0m1157AgIo3Yir6VTBWfhbpXSjkKq4y6VFUfcxqfVL0uX7hC4R9VJmaTReTnL737
         xxyJ8BFjqisbxI79rmUri9Qs2MoOhGksOxbA3Qd1/9vt7IQxBjr1YvpEgZ7JPIgt+Oir
         Y8o2ivRpqAFGpsGRT4W5y1nxQYK4X3BU/wlT9bDdWlalwe59TemyohPPPWeSZtociQpp
         BMs/oCDL6ZepKJc51Wl9jAoMEpdcOhB7yaLxCxamBQ5Gh7vrosgnuvRaR1xUPhFi6kgx
         7kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699471; x=1796304271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=agh+7DaHk9l6HM4O4vSm/A7msIgux62Q7vlo/Q1Z89U=;
        b=LZObbOCGbx7OENgVOt8nkQe+LJcaLbWOVFshE+I3i5wlL3o6Tm7V494AWppajaIIwz
         VaN7P3jWmQf8l9IRmQ03P8cSZEmYxuedKRC7sY/uga75kPpXYFWIhliwaZ7UmFIQfgQA
         DYlmhSB6OaivSvAqXugNPJ8RXiCvsGK96oOJ3+W+mzsjKYsSliKhihIPCvm37y7S3eIu
         KPRg/UY6BSVDkAMQcDVLvDiXtaC1RKNQ2aW2wHQn+fKT/Jfj96Z+29GjNBaWNk0GI4iA
         Leope0lokEnEVUM2G0F2QSb2MX3KGR2/JhJPbBf0CrLoopQQ10EdQTL+3pe2QpHZuCm1
         ZXwg==
X-Gm-Message-State: APuU4Z+2X/DKvyWp0Y5dwlMwJvD87x82gA8/LO/DDYBD4JxxS4mLhJRM
	7RMVtPxX31JPRJsin53Rdq5ge+j19kmFndQUm6zVm5mV1VYHa8lgwIHp6c9zvn3WxjfE7hIXwBJ
	mMGzA1qWFPEevd8+4Jbks2ZcQHZFF0YDH1jeMJ+vkDHR8yjpPEIg1SgsSMkZ0NigM9ZtLmHcu4M
	wP
X-Gm-Gg: AZFdTZezO0YYEsIirItWqCEfnP6NSl4YBgkkm4MOwxouJ90skSixO+dg/Vbo7JLwOdD
	V1DtQxoTCdm2bfgCZC1qZbM0HKfCSWknAZnO1RO6Y23KeIkkK0Q7YPKNcDqRrh/nCOX3fbt56MY
	O6t3Yyyg8OieVN+RHnpALmUBcVhjVmVyhKrRqOhbfOkYuy11ObwfagRDkdV9h6EGC6sgRQRcQHd
	E/8ExI5TmeDmJxFhraW4Vh3OkrYaEf8Q9BJJw8J1Ik/Pr7lWLuiuDjmgkPPMq2FDPZl3z4h+DHm
	d8Y0gQU5Qxymfm+jmF5JOjX+JrdFJcOsamQoycNjTIk+wPmqiVpee7LM8fo7JauusPAsWnpJv/h
	eY9yJDJXAho9hUaU6UMGaFsvIrR0pvRQxWyvqQwbR+VjL04hxQQgpG3Esmkdyq2t0sjv2ouVDN4
	5Zw2kH
X-Received: by 2002:a05:6a21:7786:b0:40a:55e9:faa0 with SMTP id adf61e73a8af0-40a55e9ff18mr1660337637.33.1795699471030;
        Thu, 26 Nov 2026 05:24:31 -0800 (PST)
X-Received: by 2002:a05:6a21:7786:b0:40a:55e9:faa0 with SMTP id adf61e73a8af0-40a55e9ff18mr1660297637.33.1795699470460;
        Thu, 26 Nov 2026 05:24:30 -0800 (PST)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm11232196a12.23.2026.11.26.05.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:24:30 -0800 (PST)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 18:54:18 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: nord: Add iris video node
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
Message-Id: <20261126-nord-iris-dts-v2-1-bb88dc5832ea@oss.qualcomm.com>
References: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
In-Reply-To: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795699462; l=4823;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=YL8KCvZY0zFig+FR/GaJCxaZ+dZIKa+fGm4xfX/zdmE=;
 b=NOCfsSJll0q1HjmymMhqrxhhV7DVAt3HnNh95nYbNp+5nor4doK8pWMgKl1D9nfyhAVIV5s5Z
 BHywCUUcfJCBk1wgVwgT3XGPjkPCyuqPZWbGdd7UdolcI3ycR8Oq8Ny
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Proofpoint-ORIG-GUID: R6Uje2g7P18Ydff3uO_wtG8EbGe_VtAf
X-Proofpoint-GUID: R6Uje2g7P18Ydff3uO_wtG8EbGe_VtAf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX/sOf2EWpFvSK
 Lhg1GSzTBTYXQwNQA0ZAkpap5F3nUlljfgs0YizesSr2fcDEq4UsbULabomidd+Ckz3AkN73z28
 0TxzPZqGQMjApOMjdf0kv9nXRIHBwZk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX3V6JpcdIUjUp
 69sAObwY0sNGwhJDwFu9DbYnCccs97j6/rczv7xBsTfRcCzgfm/FP1KvCxnU7l4K34IyJU2/uZa
 OtwJc/qCPbWiuSHqsqgqpl79h9MNwA64E+gqF7dVv2wbeVRcLlZE+UWxr24GCjgYwP7abYIR7Y6
 269rUMarjoalcxHmND8sqcpOeTEqUpYl6Qd1Vo2UT5+2xDUJg9I+VkxfmLwCbVHLGtvyhEuV9pf
 qKQL5ucym1nKUcIPv03LPsHXV6Uye7T7jmR+raYHevKLVDxwZ5omhP3vCiVYajuoFBYPVyActm/
 IX+SJuJHKWb7Va5WawWjR68XPj9dR46ovAnwJum2Eg/xRbbkge53i6OSmv0ULfb3YtNOCwjapQ9
 2RkMyn/rBjbTYJ5C0i7G4ht9ZBi6w1co4T/WyCiy9YuRWRuo4q1uHOCxGSM/tJzZJaHvmUJM43G
 aX91+WDnv8gs5r7dVOg==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b083310 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XU-mjTXoO_WADrldOwsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Add iris video codec to nord SoC, which comes with significantly different
powering up sequence than previous platforms, thus different clocks and
resets.

Describe the resources common to all nord variants (register space,
interrupt, IOMMU streams and DMA setup) in nord.dtsi, and the Nord Embedded
specific ones (clocks, resets, interconnects, power domains and the OPP
table) in nord-embedded.dtsi.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Co-developed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 88 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 28 +++++++++
 2 files changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index e6d0bd21744e2..8af7d13b30eee 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -380,6 +380,94 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
 	pinctrl-names = "default";
 };
 
+&iris {
+	clocks = <&nwgcc NW_GCC_VIDEO_AXI0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&nwgcc NW_GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+		 <&nwgcc NW_GCC_VIDEO_AXI1_CLK>,
+		 <&videocc VIDEO_CC_MVS1_CLK>,
+		 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+	clock-names = "core_iface",
+		      "core",
+		      "vcodec0_core",
+		      "vcodec0_iface",
+		      "core_freerun",
+		      "vcodec0_core_freerun",
+		      "vcodec1_iface",
+		      "vcodec1_core",
+		      "vcodec1_core_freerun";
+
+	interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&mmss_noc MASTER_VIDEO_MVP0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "cpu-cfg",
+			     "video-mem";
+
+	operating-points-v2 = <&iris_opp_table>;
+
+	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+			<&videocc VIDEO_CC_MVS0_GDSC>,
+			<&rpmhpd RPMHPD_MXC>,
+			<&rpmhpd RPMHPD_MMCX>,
+			<&videocc VIDEO_CC_MVS1_GDSC>;
+	power-domain-names = "venus",
+			     "vcodec0",
+			     "mxc",
+			     "mmcx",
+			     "vcodec1";
+
+	resets = <&nwgcc NW_GCC_VIDEO_AXI0C_CLK_ARES>,
+		 <&nwgcc NW_GCC_VIDEO_AXI0_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+		 <&nwgcc NW_GCC_VIDEO_AXI1_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+	reset-names = "core_bus",
+		      "vcodec0_bus",
+		      "core",
+		      "vcodec0_core",
+		      "vcodec1_bus",
+		      "vcodec1_core";
+
+	iris_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-240000000 {
+			opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-435000000 {
+			opp-hz = /bits/ 64 <435000000 435000000 652500000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000 480000000 720000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-533333333 {
+			opp-hz = /bits/ 64 <533333333 533333333 800000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_turbo>;
+		};
+
+		opp-560000000 {
+			opp-hz = /bits/ 64 <560000000 560000000 840000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};
+
 &pcie0 {
 	clocks = <&gcc GCC_PCIE_A_AUX_CLK>,
 		 <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 56778dd444e4e..c73db8cdeafb7 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -2371,6 +2371,34 @@ pcie_smmu: iommu@9980000 {
 			#iommu-cells = <1>;
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,nord-iris", "qcom,glymur-iris";
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xffe00000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu_1 0x0940 0x20>,
+					 <&apps_smmu_1 0x0944 0x0>,
+					 <&apps_smmu_1 0x0960 0x20>;
+				iommu-ranges = <0x25800000 0xda600000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu_1 0x0943 0x0>;
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";

-- 
2.34.1

