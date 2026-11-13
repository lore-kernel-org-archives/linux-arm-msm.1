Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560546;
	b=DVb3TfQX0IWJglZbJ0oy48cS2xIVvp7uxl5h27CP5bXUIiD1L29U9yTJ1r9l13BMXiqV
	 0SbHbMVrBrsZdbekBUk+ARbYS3aNQQmo8ofnqqxJ3pl+PQNKKA9Kj8usDravT1cw0YfFv
	 nGITfnddgky1AdLEmVF/vOY08ZSWV+Mhd3q6lDUkS1ZQP797a3XplBXRGS6FgZmYY65+N
	 rtLH43W3rF76pkD2lKIX6Rd3n2kjES+5oOlW9bkGRqUOtXyxXLS7LB+/OvKjWRr7gSiiG
	 zloXUwnJalp0q8ANW0uSFYd58CclvcMoOyRxvZKm2iwsFGO6ddOU/Jh6Jr7SJ4Fo/Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=spi0eC7tVCfNiex3d0zT8UXoDtEilCerp0eznL2nero=;
	b=hB/r2dbcyeV8MLomXwdJbWtVv6SL9rC+DSVDj+MmqnWv73OzMAeF3J/Z+z/qgh7uOnIk
	 6J7itJMFntlfUGqPIxxTkQnPNw9C8G/T2ymb6Xi+aavu5iCNa7nLTqFVGjfGWqvywf/nS
	 zWqIoP/c5D6WiCR1BqXS27l1q3Gk+WNfVOHIpF5jaYXYkuVCZ2IdnrQi7LBJCimeaZJn5
	 P4Jv9rU/vpg5nPlDu4rEeUv7bOv5zofV4V3bxmeLXOLBxMTH8UoaH6wlGw094Jcpj4CVW
	 aQogJPcSAIkNtY7f4TwaTLDcyoWgTRmCyN+RNTbtokepewg5kuFaE4LWbseH/yDr/7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ScWsajd8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fw9OfeJV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE59606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE59606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ScWsajd8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fw9OfeJV
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V9eM619254
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=spi0eC7tVCfNiex3d0zT8U
	XoDtEilCerp0eznL2nero=; b=ScWsajd8ps5+svUZeAiGK7dVHuHgAwv5SV8vaJ
	3MidTiyhVw/joQhRi1bF9ST8RdXaTVBjiYRC+BqhKbyfLwFkEu/MJH/++9w5bC7Z
	rvjEVyBY0HgvzvmiwDcX97dhOOCG/8NntDHnLNACMFN8lhpvDZOFkhZSe3qrIyMY
	hr5EzTIH8SL69SKGsFuTSFpVNAYc+25+coL6+o+yiBGFRxSKIgplTdlQPsjut7UN
	jbY4FAV52sjA4hUrZH85ZfuFV3jufqWdszbQ0XUV1EDKnXQyQ0vTWGcg9d8c9gNu
	oD5Z5lpFytwnbbPwav0N08XOYBrdSYcYTucjHzmz7qTgzBkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs04ase-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:02:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ee184a2474so2246955ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 01:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794560544; x=1795165344; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=spi0eC7tVCfNiex3d0zT8UXoDtEilCerp0eznL2nero=;
        b=Fw9OfeJV/QItiJyHJYOySX+9Jx59OkXPTOYWD8MvGJycayE9KdvEjoPtin8/JfeQbb
         bSt0HJJM+vBPsmTNyfy4ug2Oh0js+gCi1gm45UVt96vLxDQ1jJizxhjQzD3shgbc+GtR
         pN961OJL35D9+1CrNi6Bvox0tlrVxAPwSKtWHMo/LkdfAxtZX0KPsNSrhJH9GAiivs7M
         +G12H4WsdsRXV6rV/44AM/Ina2x7L/GybjRDrK3ePVT/FXWFYn5SNcc1KIn3EDjQd0/q
         gx0DQioMU1NfGdNOhsADX6xIM0Sxr2l3qR5WH84SUWBcPAAXxENT9eQdXWYmPI4j8Idu
         +ZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560544; x=1795165344;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=spi0eC7tVCfNiex3d0zT8UXoDtEilCerp0eznL2nero=;
        b=LBRondyzqJbx4j2wUB7NC7k5rnkzYIy0/yGhl153SmT3yELGRWRxcNiAINJOuVaA9g
         hqwQt0b8fFEXOZktJiY6thV5ZNj5g6x8lx8knM/G0WBLd4SnJyu0MPkDHuXCd11ACayV
         imK2xI/NKw6plEpffFwEbbYFFZGcIB7hTGqP256fBc6C1tOTucZYrg1t3kVbC+xfs2kN
         NT7r50v0OEIdTjghA0+JAWoKkczFoptDLJfeC2ZvAkIrPwSiA8n/YcQNH38ceyskN+Sk
         kpYpa4kmxHDTU45feIk+mXSJ3OetEkHxpXJdCU8newwZKtpZsZ0YtG9/RJDT8RvnFO/m
         SLGA==
X-Gm-Message-State: APuU4Z97rEjt7EbQ3lUu0lX4540+QiXSkmbcyV2BGArwsNcbmDqsyIdp
	bMFBfqbW3reo+nifc5ZC00UY0Dk2+BoJCFpz8bnQrdLhHL1fm+4PF3QyWRQbn4x7V+ucldBcvFl
	arFW5fDEYt0T2HTVbAwP4pYSM4mSEetQ56IJiO7ZCSkGTOpsO6h1WLbnJ5LieDlxEbxr1
X-Gm-Gg: AYBFou0ZW14CcEECO6HZJmEOSD+8eYto/WXdYzU6sPtlyz592eWA4/pMEQRxZizP+0V
	VqqX0aEowyzlMepyCTxFoRNbi7P0Szgsswz2qwpVbp+I2EY4s3zcXXYOCviqYdaGl7sWs48yQu6
	QTh1kdm4qRLLtu/gwlmCV65pfIQvfABgP7amKCLpuQUMoo7wDnzQpNNRHZ8Y+DWpeW4ayx/TdPE
	avFIuae7m7fCIyHq7kIBCFGrx4jrujDoJFAgFYzlIIBml4NVX3foN5EDg+HbNcOHT0ef8OXX1NH
	ovybi+Z02FYoI4fBAnSOJk64MNS3IXLaabJURRCmpaXoHPhhBlIOtseTC7kU0D76n5XGdMZjeTC
	pHtwZST8OV8lVMEn46gdfSbF17/EMgCm1O/0JXUp0PCjZ09B+FLF72U/UDn/UBUfM/XA5fQbyGX
	W3oQnYgQ==
X-Received: by 2002:a17:902:e84a:b0:2e9:3ec9:5ad7 with SMTP id d9443c01a7336-2ee0dc052a4mr18944215ad.39.1794560543562;
        Fri, 13 Nov 2026 01:02:23 -0800 (PST)
X-Received: by 2002:a17:902:e84a:b0:2e9:3ec9:5ad7 with SMTP id d9443c01a7336-2ee0dc052a4mr18943895ad.39.1794560543014;
        Fri, 13 Nov 2026 01:02:23 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f884be3sm7068695ad.55.2026.11.13.01.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:02:22 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:31:57 +0530
Subject: [PATCH] arm64: dts: qcom: shikra: Add OPP-table for ICE SDHC node
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
Message-Id: <20261113-shikra_ice_opp-v1-1-14c222a83d6a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAATS9moC/yXMQQqDMBBA0auEWRswCsH0KiIhTic6ChoybSlI7
 t60Xb7F/xcIZSaBm7og04uFz6PCNApwDcdCmu/V0LWdNcb0Wlbec/CM5M+U9BCtsxHRukBQo5Q
 p8vs3HKe/5TlvhI/vBUr5ACVna6FyAAAA
X-Change-ID: 20261113-shikra_ice_opp-8f696fcc69ae
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX2xXuMyB02Hvj
 X2xm+WODZF234m1L0Aait7ewn3KeQsHqm0AOQOCjzmLSxkPjyj8OMkIx4TZtacnaLQKcH2Zj/Yn
 GtW2om+7ENZ1yB5yvEDuch3hcfZtLScmoRJC+yEL4svJN4ByDrexoYG9+81eREX5oIu1orxTCg1
 bDGYFi6CDg7Kay++Pk1onWIwJGaFaFe1cwsSVnlCxnOOT/tMoKKptSJUMkijPtjGJPBZvlxic6J
 jHhjEFyv/EnBetjhuvSRgAkQZ48WD2K/dWlohBDjPErj7FcnAlW9/rMjrg1Fz35v+DbGcUW2JHe
 4phxbCGVugs3wkmNSapWo53/sPc4XIUXfT3oX6pwL1NZi8YgpG/KSR+N64zUY0VPmithilflj61
 3tg5GNmhDN0FJ38e9cBPq7VvLLvnq7dLJSrthQ/kVGs7+RRhFVjAnHnefZfn385SO7nyt1Q8wIG
 Kp38ao3bnnFanJXYzfw==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6d220 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_O5C9CTu6e29N6usQqQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfXzIeusNNhbiGO
 QlioAQ9YTrIhEXxmaaoooboxMk2Awy44Mdp3pVdpfUbKlqJut6cItbuIdABQNB60JcjphD8+k8l
 N+YxukDAaVGReFVg+DA85QcKZSVYvII=
X-Proofpoint-GUID: UBPhreq7HbTptNKXiH-w0p9dFndyNiQM
X-Proofpoint-ORIG-GUID: UBPhreq7HbTptNKXiH-w0p9dFndyNiQM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130035

ICE run on default 19.2Mhz(minimum) on Shikra whereas MMC controller can
run at higher frequency(example 384Mhz) too. With no clock scaling in
ICE, it will continue to run at lower frequency and thus degrading
overall MMC storage read/write performance.

Add opp-table for ice sdhc node to support higher frequencies and
eventually enhancing the performance.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
ICE node with no opp-table keeps ice running at lower frequency which
degrades storage read/write performance when storage controller is
running at higher frequency. Add opp-table for Shikra ICE to support
higher frequencies.

This patch has dependency on below series.
https://lore.kernel.org/linux-arm-msm/20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..50cda82b6e94 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1406,6 +1406,26 @@ sdhc_ice: crypto@4748000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc_ice_opp_table>;
+
+			sdhc_ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+			};
 		};
 
 		sdhc_2: mmc@4784000 {

---
base-commit: bf7672020e0346bfe95ef54570af10f0c4364756
change-id: 20261113-shikra_ice_opp-8f696fcc69ae

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

