Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE293E5ED8
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369332; cv=none; b=gaKwa1I6bfsONeUW/DGaFDhO82/pw1gsPiLj8elz21h8lAq3CLMSz5xhmlJOFqSHvZfldztIp5U1KseZtlGO3/9tOpUBUu2qxy26Kw8sYwSzgvKeGXr5gBlcTZds3kNPHH5IjVIpoWNh1DDvPmtY7TPu7WlQi37B+YHEVj/PuR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369332; c=relaxed/simple;
	bh=i3X7bXY12LGDSAHzrx5fd49Mj5p5W5ARx4JofDHNaKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChNtZcw10etzCYU13w3ovWsA1e5T7OHDiaRMDUcqspnA5/G/92D3joKLa30Ffq+1PFv3r+scYWPVd1+v35obeTXewqau2yMhaCqgC1zzj8jh0YyYuNloeaStZbt/mVUMYri4zJAu5hq8Eq+cs8W+Ih0Er/fh9BK/IflcUfzw62E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7LcKAu8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+q4FBl8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7LcKAu8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+q4FBl8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jFf93842394
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PE7sMS2mftUf1+wn2Bn4ZVpHKV3DcsVLenNeeQbFSkc=; b=V7LcKAu8tO6JKPCt
	q8qRbgrW05oaChIxtHO2R02ycSN77/yhdRjQ4dz04LpIz222szuEZHyUHkNroRht
	LDC1Cq3WuK5bWPUC5oLtPE3l81WEOBodHYWjdok0BkYVXbWKCjaeknjogxgDTCGK
	LckABQwyJq29t+ezPL7qAKQdSmpNcaV1wj8GtTSroQ73iM8E4o6CjBeUY9ee30F7
	zmjV1gPUlLHAgJcOGC7O6yAD2iK6ti26YKaSxXBTPXXBTOixxIP3ReH3XqumIfkM
	hgcd4IILP176f1bV8IvlXhkO9x/UbfcAXMNDqUb/P2/buJdLdVG7jx5RU2P2PeLX
	UuvmAg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5ekb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:02:09 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b8b593a4so2890552eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369329; x=1789974129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PE7sMS2mftUf1+wn2Bn4ZVpHKV3DcsVLenNeeQbFSkc=;
        b=I+q4FBl88iihf68VgHOFPnleBEltUvUwlQ0IKI7Mq4xcIMgFAS+tWxEmEFDkYMuBv7
         RZx7e4zjqXhhyj3JBmqLDiPwcaA4Rxy8vcY3RORJrDBg4Ih8EB/b1KrI2QHw7y7bRMlK
         95jbu7sK0M65pMDmF6S4CDpvSXz7M7n6E0ZW8ThHDYXAB48o/GvfM4QkqjYA6yIT/h8y
         cTtx2prZb9qpQr2d9yUX9Tj3SM+46PbKex3HdvlA7fbFEEzqLqhGgoTvs+5w1CjxvIbr
         bZARLgG+4pP3y+ZjXV0M7CuGvyEPxPagHtosEcR61Mnqd6bSwMQavuzSKVCeZUCpZX5z
         VApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369329; x=1789974129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PE7sMS2mftUf1+wn2Bn4ZVpHKV3DcsVLenNeeQbFSkc=;
        b=HHqcU58BC/ldXuRMOVjxC+ev22xmFny5a9VzxoxH9eu1Fu8xeMbe/OV8CWI6mqvp0+
         7L6XAvYwvLpoGjfwy2PjzcL62x6MWANEyTBk1O0cTbfIGvwBiaoF0R5QFBu1+UJaxEsf
         u21lmoKrrJ/pbpxIB4X0V6wielQW5/NpemHT3MLLFw92IFNDBPpXEhS4o1KwLNanGs3z
         +uxZ2F00BtnDs2oMRnL2+saT0MPWpyhSBmE8UPIkpxQamxc7fF16kNe6w1KKELlgJpPk
         3+RiP/G72xmMaxwCIeOAbqD1ar1LNpEXM9aMAq5JoYspX+5g4HZjCJ1KSHs0BYCwbxWD
         Cw5Q==
X-Gm-Message-State: AFuF++ncaDbXFkqdJpG56gq+c91vMwW68Er2k6KlFC92EgOXaGr6GbGr
	gQTa4XcAtyS44Qe99XPoc6/IYKdoakm5cELkzvaj1DvxXaoYmtPnvJK7gKmwlDecH0yu3dzW0vO
	8Tc6zEBzB0G3v0/UqRVUFheuuuoEpbWrbm6noI75vp7Uk0zXfURQN4uPc+DxnviLODSeo
X-Gm-Gg: AYBFou2vatV2EsPV7ZcQX0soE0gxwrdxxoPS/bZbHqNq28nmtdkqcWQGFZ2G9nMTpTt
	m0iXO9a5VvNQmkrDF9Y8alHPdLBN08ofz9VaDfRv9IL+xT95vSLGOjlLVTBN8Ymh9n5eA6h84oo
	SCy4uhYNyXNxp2RxuOyiW6VcRdn8xDBEkT8c2yqhiOQwGmBApsS4X6TdM/S2JuS1YIbp3iq8h3w
	JYBl7uHxnsIaJ7molkIEQhCi6mPrGPBSSgQdzL2VMJ554gRk2V/lgI1VEdme/8P2mH70n6QYJ6b
	g/1IdLB13haRK6Oksjf9OSJY9GstudvjR2kTOBj75+FSOtKkZHh+HQEywmHXc5NGNbK6QQIIIOt
	NSsXMT1bM+Q3cT4IcqpJ0xYF4XtTz
X-Received: by 2002:a05:6820:f00b:b0:6c3:616d:efb with SMTP id 006d021491bc7-6c54057da45mr565822eaf.17.1789369328897;
        Mon, 14 Sep 2026 00:02:08 -0700 (PDT)
X-Received: by 2002:a05:6820:f00b:b0:6c3:616d:efb with SMTP id 006d021491bc7-6c54057da45mr565782eaf.17.1789369328467;
        Mon, 14 Sep 2026 00:02:08 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:02:08 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:30:00 +0530
Subject: [PATCH 28/31] arm64: dts: qcom: sdx75: Add domain idle state names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1892;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=i3X7bXY12LGDSAHzrx5fd49Mj5p5W5ARx4JofDHNaKk=;
 b=mu5mh1mf2kXeIDMZX4td8W1iUWiYh3dUe4HGv4LwMx0eezC25tfsZJwkLIPksqVgdhHrPduyC
 qth5mr+t+wYBXz04gtBnq7wd0QrqCxSiG/jtUCnBq9Uwm9efaP5LEdC
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: DTGUA5WGxlCLrSnYOlHDk7mBpWOU-oxA
X-Proofpoint-GUID: DTGUA5WGxlCLrSnYOlHDk7mBpWOU-oxA
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa79bf1 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8fg_tvuPYJi1a8Ph9hQA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXxLhYDuqSfRcO
 967NGKjrzyOHqm/Z7onvxg3s3ajURvSV+kMU0SzW9LKM462ppfw0zdKPzHPoe64gg069WviVMYg
 2NfDP4dY4HKXeQUAKNKp/UOY8KytPWmbwThw3YocqDhWknmq5j7V5WfmEircpchd6hz7+wLS5cM
 MxycbbAs2pHS77M8m3HYRw3EH0OT6XJY0iv+IV+XgNF8eKOW1pseBvU5n81de39aBhepdIjwv17
 dgFT3rq1khf12Id7u4mU6lxmXRQo0FbOhlWIzCV+nIoH8vfyiu85k7hvzLcCVbmtGipDGBYTiw0
 jplPAVw672d/c6hknu6EGVQQinx8WWnYG2KDGwktWIGwbVanonigbvUD7dnygR2RPfRx7NOUtEH
 ctmXLPcIc6d9j3MZYJm52jTDGXjfj5hPFoK9DEG3Dhn/AxtbPYumGnnMK4L7vugv3c0w4665Ls0
 1sxndFhC1sBVo5PwFHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX43t9DN8D6L3F
 naYvsQ/LIZ/Ox44fA9uyxan8SeZQY0YBewtCmaYa3CfYj8ojZ2XZNSj9HkhoA1tNHbm7N+o9nWT
 j+r/+RJxHkciSD/6/WTYLn9h5YVxDU0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 81292850e531..42a44176a32d 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -156,6 +156,7 @@ idle-states {
 
 			cpu_off: cpu-sleep-0 {
 				compatible = "arm,idle-state";
+				idle-state-name = "cpu-pc";
 				entry-latency-us = <235>;
 				exit-latency-us = <428>;
 				min-residency-us = <1774>;
@@ -165,6 +166,7 @@ cpu_off: cpu-sleep-0 {
 
 			cpu_rail_off: cpu-rail-sleep-1 {
 				compatible = "arm,idle-state";
+				idle-state-name = "cpu-pll-pc";
 				entry-latency-us = <800>;
 				exit-latency-us = <750>;
 				min-residency-us = <4090>;
@@ -177,6 +179,7 @@ cpu_rail_off: cpu-rail-sleep-1 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <1050>;
 				exit-latency-us = <2500>;
@@ -185,6 +188,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cx-ret";
 				arm,psci-suspend-param = <0x41001344>;
 				entry-latency-us = <2761>;
 				exit-latency-us = <3964>;
@@ -193,6 +197,7 @@ cluster_sleep_1: cluster-sleep-1 {
 
 			cluster_sleep_2: cluster-sleep-2 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100b344>;
 				entry-latency-us = <2793>;
 				exit-latency-us = <4023>;

-- 
2.43.0

