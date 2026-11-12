Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523179;
	b=XkPRr7dYlaKBWCQ93OOhOVG8CdpLFnTIkOvR2c2dLFCUAlKo/f/Zler6gnnp5Yb80uhe
	 +gzgIWMwfdP+JdSHWpUuC4Q2SwoHCxbVH7O13VGnDyxcz6KXHHSOQfVz+wEx+JhHeOcIt
	 YOUd82ifLjEnuAvmFhfC/3A0TQfpM8QFSXlrxsXHrg2AAWTB2ujddI6f8o+74vFInBx3C
	 lYBIZh22eCxWGMBkSoTuLlOv0vLWygtF1c3Td/pqr6Sx2EzBexmIV5DBPkBG6LYQQK3Ns
	 OwPaHTpQf7LAHNU7kxqQQQVRZiFoi+sqLP04F22NhPLhNrWbMQn/zAKilf/ClBLhO/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h5d7qQ1TmiafTLELdwxVa2K3qpo7e3rfmt0oQazEA1I=;
	b=LwADTdORmS0+e3Jc0kT1clhAatkHyUmY1MGQdrbJDxum69/rFP+hfY/NXt3aXiBX8DSE
	 mGeEPBLfYN1RiM1fC2V2qbvbCY6gbk2E5y3PG1triJBJlpLI648L6Gs2SWmkZgfFnmP71
	 6OEsfCWSIDCJJidgal0oZZ09pemszyvdHbYuWeL1FiUdOtBrkSwbD/Z1Le0ROZleLzaPQ
	 q88Ij8y2JW3uotlwkxBpEBHPJ2fICExe2xDvnPM8xQDxFxOItccsw662d+lCTY7H6PONY
	 B267zqO8nEscw5T9GvoXonh2a/W8ZFoTT1ez/8IhCMck4v/CMbiR0VmeQN1HzmefTbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PffptluP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FeJVhMhO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4823860A2616
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4823860A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PffptluP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FeJVhMhO
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZl0B1183506
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5d7qQ1TmiafTLELdwxVa2K3qpo7e3rfmt0oQazEA1I=; b=PffptluPAo9AWFlH
	b6SXJuXvj4CNYdzrEcMKlMqjIGmfFAw7foySfT9Ag/2KpLeCba1+0DawoDpHTet/
	73jnUhT5yV+GliUh3/VuOF5hAa4cus18hUMidkNVdBA8XY3KvosqC9SIzaJzcRKh
	yjbvZBJvfvbLJBA/n6rG/sDuFoUufFwb+te7wO2ngClA95Jk/OQgtKjnrn5H0/yg
	XTtxdmtxb6DFy0nPlmmCmPMbsw0em7LuZcdq82epzuuMJSWB3mXTWToMe3c0kCPk
	Bhwkm8+QdgpVkcNYwvvx1kqHLq/wwlAENMop6WV6iI2gPMBG4a/+DS+BZHOKTScv
	YfpPnA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yukp2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:38 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so1310111c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523178; x=1795127978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5d7qQ1TmiafTLELdwxVa2K3qpo7e3rfmt0oQazEA1I=;
        b=FeJVhMhO1ZG9zVHEigvHJWvYBBrEQHXGoocJNJSCtxDoD6UxFFMkxlupoBaqbA+M4V
         o8RmQQyw6QkQKGovol+mM7LYC5u0sDQTnVGFzKHx7n6eccYUIIvLAi9/7igSEqwhHXmh
         ZSFFyhTsuHet4QGuEsgffBo5vWNeR+5gCJC+d593K8b4jJyg263NniFo5585dgY8n/1y
         RaRZPCYNLEvC+uOeyK8fWOqOgiNclpLf0x93LpwKWsdbvMo7Vo+GGNOY4jZ/hJIbroZ8
         R67DBYj26P+C86ChVIXXAwVMPGFfYxzcbTuO8acVjwf0Y7uMvRIlvtCPO5UOHmaBkCxM
         8WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523178; x=1795127978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5d7qQ1TmiafTLELdwxVa2K3qpo7e3rfmt0oQazEA1I=;
        b=IvqSqCF8/FaJWgJT46K1SHrZRdhLmEIDMWqFwjacPPb59/vus6ggKv673nirs4+Tdz
         u9H8YaFPQSaBXg5FMP2HzuVp4DVn25Cfl5wvW5ZiKDyLSkEQzFB+HuwanR8Jwf6JcfsT
         bODD5AA8ImYtrT5zHFUZcbqGu3mhY/m/DSiEOHRBwlpfCkVWSWf2YFv3I6AWkqso/FS9
         SFAcB+NWf0BxY47Lj5OH46m1GEOWuWynYvP+WsCzYcxiknn5ZkNinScp2cf0xBQvGTC1
         rgsHyhJkSfS5en2EYEzgRy3TL5HWZF4KbobDVJy98x2rY+bWsMA2p3JBDPTKHqmoB/xX
         OOzg==
X-Gm-Message-State: APuU4Z9+vambcvYBSw6Od6/39uFzzeeYwd37giRjRfZob8jVC8mv5Ivy
	EhvQF2jU7EtLqdrZVwcPo9a6zDrUksAQ11V9ZqyE0w4L6/xAJPkWKM7QeRXLCC2yoiReEoejHA8
	4uEAjs0v+2c9ZBD8Uc23Eqidc/5lA2ucCzDHt70N54pHLjOnONLGYp62cDakpfWtNfoJO
X-Gm-Gg: AYBFou3upjrMX+ZxlGTAXNmxfzJOw9yDUC1zw9ebflai1TCRpcqboTjIzzpsJmzfhuz
	pERtUhKPZsJK0q3sRkS6JB8NU0kM68hPKKpDQ/IEmPvAop/H3NlnR7JvkcMAJz6hf3gCX2Rp7XB
	ZZtkH1HiAQEajj9lOH5Yg+vuM0MpHmOBzP62UElcGTeGku1UAKO55W8L4I1A4O6RbrxBmvMVSM9
	8Lt7fB9YpWbs3gb2DV8/0dv/aMmZX2p0GB17kryeqcJQBIoyVvfq1m0/qPq84GqBwph3DTLOQWw
	Yeus2GeDuRlg+QGgmK25vhm3rv305NzBjhJQUY7qfL4M10BWSMUs9S4j4/rGDgmcwfGwqIARoKy
	SPvYroox6vOetVrhTb+fpBqguy+JORWUHWu/y7vzmGknY+GsrwYojOU3sLsWDH4Uja/ypTwBfW/
	yAv++ijNB4KQ==
X-Received: by 2002:a05:701b:2402:b0:1b2:6d4d:9d8a with SMTP id a92af1059eb24-1b4f5ea832dmr2727951c88.2.1794523178006;
        Thu, 12 Nov 2026 14:39:38 -0800 (PST)
X-Received: by 2002:a05:701b:2402:b0:1b2:6d4d:9d8a with SMTP id a92af1059eb24-1b4f5ea832dmr2727934c88.2.1794523177498;
        Thu, 12 Nov 2026 14:39:37 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:37 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 04:08:30 +0530
Subject: [PATCH v13 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE SDHC nodes
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
Message-Id: <20261113-enable-ice-clock-scaling-v13-4-258dc817bd63@oss.qualcomm.com>
References: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
In-Reply-To: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: hzXIYTbUQlxzNJ1XVKawtCxInqqPoU-O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX2xPVLIiKbdQl
 UlBWsIWlTRZxcfdI6wESqP/yTbzxrRPbVkyOcTgEOFuxocZ9suuwKSuYMWBei/od7tH9DvL9zxH
 MLny/7XMaXvoTqDJ5OpErjy4O1Q9l+w=
X-Proofpoint-ORIG-GUID: hzXIYTbUQlxzNJ1XVKawtCxInqqPoU-O
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af6402a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Gfx0KCctoiflwLzBlNcA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX2rHmQQ6A17IU
 OZgokVoFoK1GY0DXO+ZL6Y4mqz+fzCDi7S8hRqeLH9bu8McWYf5INEpEJZfoJVKYAyxnxNbWcZX
 doomXN2p7PxvPtAJBDxlZjLFlDes/2Q62C2WuUCI2KIjfI5LMzEIkGWsK5AiVNfl9OMD+6ipXIc
 K0PbWE83+K97ZOpOSDISuZtgVRaAr4WwRX9w7U1UwFSAQ8DrlsC5+h3VELeWlfoBeW2r4snBRJK
 Xg30YEj/npPrARvLpSd+9mcuTd1CeD1cQ42J8dxy0Pvr9oq7arGBgHkxMc+inDXCdynGOv1xQCM
 cCcw9JOWUv/XQlU1qq7mQanvqIHB5pLyeap4Zw4MWNrWwxlo6Qy58wwwLsHgzIeycD4LRtO49Jq
 1LsXDRg9h2XwRO1z1UuDX/sAh3NHjVoFJnZ0cc3rYxuT7+89VszPLUesKVMayl6Ged6/OWtAqpO
 VJnLJtdb2Yxc7Sxi6gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120090

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE SDHC device nodes for Kodiak
platform.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed60cea1514097354b8f0f59ffca2fc..397764d78dba579fe95654deb7b01ae3b1735f89 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1100,6 +1100,27 @@ sdhc_ice: crypto@7c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd SC7280_CX>;
+
+			operating-points-v2 = <&sdhc_ice_opp_table>;
+
+			sdhc_ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
 		};
 
 		gpi_dma0: dma-controller@900000 {
@@ -2608,6 +2629,27 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1

