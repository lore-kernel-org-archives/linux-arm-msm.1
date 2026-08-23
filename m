Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33801387362
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514509; cv=none; b=ueKq+8sTlxRDMIthfX5LEQSWBbCl3ZdFpwwL67NgyeAr31gXMsqJge+VA5wVU0MdiJ8oUmy7aJQiqQvbeAf/GxmzwafmRl+W2/jcoW0tH50c/gxoG8qxBt1a8CpdVwg2tXRSL1YlRe3Pz/WXx0vZRffnzwUTE/nmO9WvfMLizRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514509; c=relaxed/simple;
	bh=sSu1rmCbKklvuYL8pG9B62fBY+5STvRKxD0ZbLLROYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IapFxyn0jpsMukA4c3sChx/t8wq/3EEBVZzcIRbsyYPv0upYhouWmT5ZecG8Cb+19jCxTcFI3uONSd0IjAg3jRQuWb85a1eqtP4UOKJdRNBxcsadNXSn11VaalK4Cp+6CH7kuRPsuSfgzDwFD1S2RVQbDEQMoaqeH+lIgIAKTDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e04guieL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVUIeKwG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e04guieL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVUIeKwG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67NG6mUW197790
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGCfN3Etp4rNqYD8yfNNQic/5RsW0siFclTSIyKyGb8=; b=e04guieLGXwXmUqH
	X9WHo+oZfM4/1n1iLsPw8MFqIVhoJSQom83V0WKOS4hEEGilZ+T4MnlnQ1xFo8FR
	2n2zt00MLW5GZG0p8+uLRa2PDmY870NCx5m/ZjQLSvDZiUzWxA2PupB8VPaAic8o
	C3p5WLX3olBLXMbJmeuO/PWcABv7eZvq2mgiJirDcxd1Gqx9aNJI1nzYbAsdyR7M
	Ecd2/HZGIPM4N8dTTrgvp2FFQSt5v6KC+InV41XXDZT5gDfeoGnhup/qGwea64s5
	lZfDqSmF3bP9NDFE33sai3jM7apk3bRddY5A1qSctSVHM+rA0gUN/JMPUmPg4sFp
	bN/M4g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740f4dvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:48:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6823efcso21759915ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 12:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787514502; x=1788119302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGCfN3Etp4rNqYD8yfNNQic/5RsW0siFclTSIyKyGb8=;
        b=bVUIeKwG/wNMHCNq4g18tr77As0fv/yJszRRUNBIyQFt4kJaCLriiBzJUaTOLVnHYq
         A+pz9RbFAekQVX6YV2AyTMwfqK62O6OK2yUauL46NyCFyc7pPgh1KEGAXxptQ2HcF2sr
         0O6vttVPM+zJEG+j4rWJPiQEywHDnk9nxuILN3+JNJ9L2cHMThQoMUYF3kxjiAxWnDtB
         zgLnJtI/UfOvNN/MAk7Y7Z9NsVLC8pN/hZidguckw+xGUJUziI9rp+R9TbGOk9WWvkih
         Wys93OKUvubfrUtTR5mlFq8FaQbBuuNWS8PKWMTqh2OEM+LIYJMEA9cB1LwSptXFjc1U
         kDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787514502; x=1788119302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGCfN3Etp4rNqYD8yfNNQic/5RsW0siFclTSIyKyGb8=;
        b=TZFPowpSsNsY0iRPENwc1NP+6QLZp1IklleCYhM3/ICRl9hxVtAfc9ff2OncWaHNvy
         yqhBOrNk5kKaKRMkogeIJ2+wjvm/NLw9ft9KuUdEfZTWENftwl3KvuRbNHlKfTJBquso
         +FrROFJvlOzBYUA3ozT/sN+VhATEJRODp7HC+liMJCthHMJtnLB6AltOfO35ZUTz683R
         pUzljOBBtdF39EGn/CUQ4u7+JsJoIHeTJHZHF41D/mtgC4NRJBuq/nkrTX/yXy0KPGTH
         EMDS7AfI0tC+UxIlB99ccow0oyCMegzWWwSxyGCbzrSMWsd4qVIRaOvNvzjwD0Pg4vNL
         BOFw==
X-Gm-Message-State: AFuF++kTKF98u9XCfX1ayQ++mZRDDcxAVFOsf6tcavROcXglOuC6XQ65
	9j1PqP76h7uBGgsMfjQGfnhDXLYk6mtaLFdIIQJhH0lYEvTpqIDB/ovAz9fk80Imrg3a4e3umuL
	TZ5YYFxvRXGxQHOMaXXavDsJPzB/iEZqxjiE2V6UROhKV6XnH9mckiQzz5yEVGlPZM51Vt0kk+N
	+v
X-Gm-Gg: AR+sD12DqzfXA75M3bBBznU81ZjChrZTHiC65tnvfyOB7Roza4AtdGAM8DBkKb1wmnm
	UTIZ8UbAm5alUARYXpjc/tK9F5IVrcY060oLGac++w5pi2xnpupYCjy2WpKZKCHlF9Th8xLSeB1
	q5r1DHHzekkjVlMop/p6hHAtWykpWCKjrlJmtaDvc4NxfgPOEZvIInmEAYudFouqnzpysSWpZ93
	ShDEG8qaRCJdvcJkbtJq4b91MGMwD8a0A2Sw+adahpcVw2rR4LlFqukUJn5s4avWE+Y65m2ZJ1s
	SlGDsNO1b1Vx0SrAhljZYizKHfEvogX2XJIlu1a4mKbX5zxWEze8hCmVuy/663ZbkSyC0hLUZgY
	nNeLOaGL18qSkl6S7F527hT+HhzfseA0/CkZFMA==
X-Received: by 2002:a17:903:fa6:b0:2d6:5beb:8692 with SMTP id d9443c01a7336-2d670bb5042mr259791945ad.6.1787514502441;
        Sun, 23 Aug 2026 12:48:22 -0700 (PDT)
X-Received: by 2002:a17:903:fa6:b0:2d6:5beb:8692 with SMTP id d9443c01a7336-2d670bb5042mr259791475ad.6.1787514502043;
        Sun, 23 Aug 2026 12:48:22 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f925190fsm32321623eec.31.2026.08.23.12.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:48:21 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 01:17:43 +0530
Subject: [PATCH v12 6/6] arm64: dts: qcom: lemans: Add OPP-table for ICE
 UFS device node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-enable-ice-clock-scaling-v12-6-09271f583dc6@oss.qualcomm.com>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX4TCou7ibV0/h
 FJw2r8/WVpFvrbVzJ/JxfTMORPmCRzTjRA8+EB32Yd4u9luszPgdBnVlWDld+dHrxZsjBKRRylC
 YQSJByS4kBJpF0KE1pE1udXejMOXL/l+3yC0+jCrpUWzfRtoCGUJ+w47+rOaa69KuIoheBTP3nW
 CV6mc7bpfUO0jhXOggC9puweNYY64qx0m8Nd2a7j2G5TfdWuU5Zv8QKLNKUZzmwZsvlW0Dpgrne
 yCYg0iE5PQpTIBGpW2JAh9GbdkTwGy6LvMzUtpdjwrTcCofZ1kQdcxFNDpXmWq1jx7Rjzaq4cZR
 M0C7hWMZ5VRWZxJB4WoHjHsuEjyKRLIuovahRyAxqBW0pYMcGfmUQKN8hbYeLMTct+DI1jzOELK
 zdSPtK4Rj/F9EyFHESG2ol14kh6TtfYtGlJ3vg5Jl69lBepR4X0c4Yj4LRLKos0T4e6XA3wAkQO
 HFnvh0S3Od3PODu/BqQ==
X-Authority-Analysis: v=2.4 cv=BZjoFLt2 c=1 sm=1 tr=0 ts=6a8b4e87 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ASeq7m8wwX9lxpDCPrQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX7zYbteQKlymf
 SQmO7OOt8s5dTaSx4maA0qnGqhMagL2iWOlyWWXvbEyPpbpmNKAsSs4vRCHQCtiF0sPxzb/KvOh
 lC3lca5/SqKM1AMS+iL8hydemRrOU08=
X-Proofpoint-GUID: 7fgkcqIXARPAszkHlz6aAQ3Lif8S-9Tm
X-Proofpoint-ORIG-GUID: 7fgkcqIXARPAszkHlz6aAQ3Lif8S-9Tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-23_06,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608230181

Qualcomm Inline Crypto Engine (ICE) platform driver now supports
an optional OPP-table.

Add OPP-table for ICE UFS device nodes for LeMans platform.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index a10322c5bc35754042640d56ecb556a5ed5cf281..40d13ba5f785bc712b511870b94cfa9c6518c19f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3109,6 +3109,32 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1

