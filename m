Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC053B05AA
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514497; cv=none; b=cXwTPsQiOWyxnpzv1ESBwqdq/ybWET6lc70rZIyYnilet404ySqdmhPyRAySBOwrePMbM8EOuUW6UGjD3/UAkP5dlZie7tu2Yrksxf+egmDUZ4h+38cFkIew6E8x2NRoLEPlyO7fPXnAVxXrasGbRVeEwix9tyDYbiE4iGzNJIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514497; c=relaxed/simple;
	bh=64Yx/oap9bx7pLvcpGavfWziESJkglcJnhLN1D4LXxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DH8mCQqcbbgfGM9dh/+GYqwPzNfAiTzvecae4gjyV92Y+c1sVxScgqDRBlPdLNnwXNPqmTPTnpWTa8FEHLuaUreMw1rO3kNgRsskgUcJLHSgoINagkZJinzV2oWebUJ0fTTd1hF16BW15FFSkjywc57pZ6vmoC+5xWxMJgnzJHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g3qe2F36; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuhN12pd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g3qe2F36";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UuhN12pd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67NG6aPE4033224
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iupV9vOqfaNe4LW/SncYaFTBIZ2zIXSFduS0Q0Tf91Q=; b=g3qe2F36j6MP6SKF
	uAX+PVAQfW0W1L56WxWjb37/iBu9awLQ5VbJbZKH5/5w4hCVQhNWB4AHYXIhsUpn
	3CHh480JaoeaxrhmmQKtK7YG0kQYA3qKeAEK29w+VPa3Zq1t6UyMrck7rC1NN0Z1
	X3NAHvcZBkUc37N8wzXCshN74fGotD+G02MFE7toSI661Jw5pJq+TcgUJa9Vy/JR
	twBUJNhjpjG7BmwmiT5/IlHJ0fAaZml8W3RLuZtmAT9zd/JcxHxXg9db1YRmP449
	TM4Q21pOw9/48zD4HMLW+65LIirqlxc6fCvL0jZy4Ue35Es/1SwzBCop15J9ZtON
	f/ZWwA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528m6ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:48:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so6644781a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 12:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787514490; x=1788119290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iupV9vOqfaNe4LW/SncYaFTBIZ2zIXSFduS0Q0Tf91Q=;
        b=UuhN12pdtRm9cm9Ygb+aADiIE9VZ4zZbo46mkhnuxitzRj+24VY6CcIPATsrJ37Rzi
         sbYDyDlIIEAW4+LwZNkJPWGb1vFUikus0HA5tt2tkSLA+m2t5qJytMJKtK0XVQtuOLg4
         BQN28zGcPdaibPHELTSULG4XGkk3LGRg83QOWCOFepmnDV47BMtfziQ2GIhY0csMcl20
         rx2oym2KCynrS6FdrrTux7V/UbzOprFBaf+MJCxnzkg51mbOkkZcWrHyiO0EALz8f7sA
         Un5q2Vg8sMXUzgABKEyJJLwoWxd8JMiHcgZz6g7p3Wk6cWEaife92ti59J+Uf/qlNNvn
         EhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787514490; x=1788119290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iupV9vOqfaNe4LW/SncYaFTBIZ2zIXSFduS0Q0Tf91Q=;
        b=s9VrfS88yDCzqEQ37PAXOvwDMu1NKa+XXP5oRuPWSs42vs0G3N3I8OWkF3tWzh6rS1
         WP9Fb0XH6w3WkFRQlFSFhlu+KYAFPvDMD8ktNtQDx3OJTQsi8RG8ZX2uiunTV/dqBSfG
         8Ab7r5ZcZjT41VL6MM3jM4sJEPXK9reu0IG78gMOBrvyXb5TZluvH0UygVtTMZeR481G
         WdLz/aQwbyQATYnTnVTwY69S6neHadbxe2ehUjftdPXaGSmeKLMTIviXw+df5mP2OMLZ
         8CF10sEof45Us4CL79xlIE2JRDtkfZQK7plaUzRnVq4HwzaaNTDSQrannjgTlSUPKQDB
         E4xw==
X-Gm-Message-State: AFuF++ktfl465mAPLB4T/71FvYgH6wNoB9x6jbgZt3h9Kg3xwOztE+zd
	8VYuJ0bJ0P+NSoq7leWSJjcBFVHc3z/MIulekiVG1MvUgNVT/fOIm/DsFK6s+vjlLIBGsYyzIuQ
	i5iDle2sJr8GFoavnfbP/6FcoeBVf+UZUKKQ8rVs7yfkYxZV1ZPUkfv0nW/THI8T5hm6tfAeZ16
	64
X-Gm-Gg: AR+sD10exWV3qFv1ZyX7k/7kPuDiJBnZda/Xzq0/lPLGj//lvcHzju0ynko06lSJbWB
	0gEIKs7V9bqfDRC0FjxRNgVtFyFBWeuojOkF4OVP6FOI+ijSlUF5Z5NN1S7iWgL69g2njF+tVY3
	kqTw5lIstYPsFg02ICPOqkhOMdhiUsMl9/hPwUIx+Zfe26wJXU7951eKOKWKWySRa95eEiYhP7V
	xWSy5SDQi4vKR9X8QWn6RGbNOGQ+yPH0sBSQohCGI1OWSIvA83qlajVsi/YYTFpqdThKvZ+U2Io
	o/QIQkNR6Uz7CxyzKYtghQ5vHjICn1XRzfw9PklnXh4Sr5XPhtfPBnp35eNBZqzdhOhQl+Vbp97
	RfzM3Tp1D7xxKN8d9IwRlv3E7/izSIcAR3fdLkA==
X-Received: by 2002:a17:90b:2712:b0:395:543a:cf3b with SMTP id 98e67ed59e1d1-395c3518185mr40793805a91.2.1787514490601;
        Sun, 23 Aug 2026 12:48:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2712:b0:395:543a:cf3b with SMTP id 98e67ed59e1d1-395c3518185mr40793752a91.2.1787514490142;
        Sun, 23 Aug 2026 12:48:10 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f925190fsm32321623eec.31.2026.08.23.12.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:48:09 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 01:17:41 +0530
Subject: [PATCH v12 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE SDHC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-enable-ice-clock-scaling-v12-4-09271f583dc6@oss.qualcomm.com>
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
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8b4e7b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Gfx0KCctoiflwLzBlNcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: yOKpHWJxuTxit3ys6Tk1_pz9WHY9mmVD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX/4yGUSduUYcF
 z7L6Y1AxQpB4b+F/AeiSE8/BwtGc++/ONNFVyBRxU+E3Ax83qJYPGlVCKWDLRxrIHd30RYbIsKL
 ygEqzoJGz8tckFDCJozpk3zIxyE7mpjdZB1MOj2URINkDde3jR0HJG3nubPzdYZc/e7UTMbT2iW
 M+ElB76BGYzAmtQ2JFCiFxY1KbbNXxcCFNajAWDvI2e1oVYYoG/DlE/xtpqKZKk49rJUulivXUK
 9FtMKsV1SQf5g2A16TRmgxyJyw80hCTFRQRt4jVWsYPTWcUXbpbZYk/LZ86mHgkBsUqX+CcuPgs
 3tJ+VtBAu+bK4ED/dFlOtKW14+BaG3j5MG17+SFB0B+aoAExkXyMzB3OtbSKvF79tJGuGx2r3Uv
 dswGMhbU4Fnqm130HC07xOPuIDS9w87Yb6KIL4VoJsBSsOcztDMWxkLudYvZp0R4tuBmx8BvxCM
 RTZda/RqwGWeTHveJFQ==
X-Proofpoint-ORIG-GUID: yOKpHWJxuTxit3ys6Tk1_pz9WHY9mmVD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX/L02bUvAKDWf
 6ZMzOgP4whgEAXLdZ8K0VjmGb5mbAcVRIp2t2dtDdOvsuIyz5JU+ddvpz2KH6UeeH8zxL/pbvqR
 yCBGgsXV/GJgFkeBB6N5SMqJ/ejVkcU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-23_06,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608230181

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
index 3692be65cc21b2b13a024d26c05b98032488ecc8..ac3e458ef70fd2e68650505b402d1ba924fbfe96 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
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
@@ -2597,6 +2618,27 @@ ice: crypto@1d88000 {
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

