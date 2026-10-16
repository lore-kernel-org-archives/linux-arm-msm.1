Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FF7399003
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129217; cv=none; b=Rqi0K6XcWkebsYilV/K/XQ2Ld2sWZTpOw/S5gq5IeyGwMSsyGOn27n4qzoAKnlFLp6foYStd9+XuUoAW+VX6OtpA+wpoTLnb1+x0birSw0Mh3TPQzns+s5H/IlIz02UwMSze9y3JkNVe8Z3JVqpeA8wvtrmeq2TXIBMRVTQ+tIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129217; c=relaxed/simple;
	bh=CJ9uaSzQghC6lH1iGbaK94WLx2v3FiycIFCYKuXJlW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DGjvGc72y4Vj5WSE4hROI3DOYL+ZZZpCCNfJ0t0PAmSHWP71rge5l7IBpyJzxZYtNmTFXMqwUU7DTv+PL/Dz+/yo3Rr/BEWL3P2jC6680EQAyUl4EI2P1acZD4GO4KilA9PM+TBf1iO5WN/QWV7/frsj/L0R2shigi3SaOyG5Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prZPfVa8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLvDk2yY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prZPfVa8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLvDk2yY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNfxjr1635310
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P8GzhAakLwWM97pAG37TwFNHub2FFsaxlZcI6MJIasA=; b=prZPfVa8v5ih7+Rd
	VC0oQ+SprhiPyWjEAlZ2UzFk20uo3X+XzHLr+/w39geb8ms4qOum1PQRcL4oaPou
	12ZX8Q2TmzfEh+CadkswJpcYpaAflIlnX2qmqY1Q6vZzDgXmkrLLz8OT5FKz7BNM
	IfRBT8qiZUOPefsLKKfgaIkKrxfIjVsNXvDn2m7vNRcc0ZyxFQ5S0oIQ2AO0RwZY
	rwM960/FFz5vuUgXxUUB8xdFvUmTvwYUY31V2vQBc1jful5FV4o9SeoRDeDTY6sh
	RCkCAYEp+lGBMa0b0r5xwCFVU64J2xzA1kPt1T2MXSgpLqPrmymihyu9PwmDSdY5
	Brdslw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r1113w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:40:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso10761444eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 22:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792129215; x=1792734015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8GzhAakLwWM97pAG37TwFNHub2FFsaxlZcI6MJIasA=;
        b=WLvDk2yYydNObZfOJQsU4fmlTE/SzBH9wi0O0jWCUMJAJD3U4QpXKTxyRLCaRZtkm4
         XLPRZ+RIqXSKsRnExdoh1e8a52g07Nx8K83RfZSDFQtZeJyDlK5uoYSYxyTqPKL+Iwpu
         GF2dlbmqPurlD9NuQvfyKVHCV+mvYMRPytc+lzt6u4TOadguGnk26R/QMbjlHGNc4EWb
         +ZE0MgZr3NPavEoV9MFbVnwpcIlgJKWcySHkzBJyCW+vdOl8Wy/HXFcUYcxduqTI3t70
         pfnQUVVZ0xIJRXXXZ/Z8psQxcZ6gFuOoa8Bg8eLl+Qm7CCRBg6tYdEpwVaVTPIL/52Gn
         6gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129215; x=1792734015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8GzhAakLwWM97pAG37TwFNHub2FFsaxlZcI6MJIasA=;
        b=n6fiZXbjhRWUor4RZflykgQn+pe8XRBHwuieeXqe5SGoTOT394dby0MRWbgRWslAcZ
         mziLvP/RB+qxCmMXLbKHGzlCU0qdH0lt/OjppwHuusku+sQkgX/it/wieCB65dIurz+2
         yC8pBNbu9qdz6ChTN+Qy6iMz1tZ/IwT9tTHMCtzNR9mAAR2UoZP+R0edUpxpc6iQDbsI
         ORnWFeS8e3oRCT772UILbUT41KiDsHwwKTe2W0afpQiH4Inw+6BEnpyxkpo8oNC0V3Os
         GLaKU0JOqaOmagpV7VGZ9piJfKUtciXIGTmPoc96BVVxoLkhSUbSfuM7pEijWXNEFYRr
         lP2w==
X-Gm-Message-State: AFq9FYJKC4arbwHVKMAxuWYOedyEJOM/t3PKbvm+kAQqjfkblR4uzPrn
	WAiLDxLLaFRVCL7ZrNWYm0ekeN180wyjFagQHlBG2zUzzcGXULj7gVIeHFORRk7R9YRt5efDu9e
	WbuP41fwoeQlrsd1MVgqUKcV0m6yLQp/vxlm1d+N0tz5Z6bRpp2ISIjYE4P1NFHKrrqVk
X-Gm-Gg: AYBFou1hpO4OQ7nueOPyU3/VbUl3uLQ9s3qz+9ebiKJasX4oGQWTLsRN3ual5wLVcWl
	ke5g2m3IhYiBQio6k0xLm0a0EGpeaATBrCNCnASNG9vOQsGeV8OIudUwSufkUx8bApecfQ7GoqP
	05dcNMfppWQ216INhC0grd3ZHXAXzg6wP/eczneyQ+wRSz7P6qwWattGG0lHIH/sJvzzce7A9fT
	homltWpGSFr03bUjeHTtphvgVOmYaGa0tpclQUCX5L4GPDU/O96X0JF7pAZDS/IjJ93U27lbYfj
	bNB8a5EZ2R636rsMx/NDO9/pKpl6tQyupcSMXylzAPnqVdKzVCN4pq43cFAdF56ZQ/0VYpqlpGT
	g89oNvsa7zcAfNuKXZBc6wV+2hQrD3mvbC9Ge
X-Received: by 2002:a05:7300:ce86:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-360ca2ff3b8mr803912eec.1.1792129214793;
        Thu, 15 Oct 2026 22:40:14 -0700 (PDT)
X-Received: by 2002:a05:7300:ce86:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-360ca2ff3b8mr803886eec.1.1792129214248;
        Thu, 15 Oct 2026 22:40:14 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm3811393eec.6.2026.10.15.22.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:40:13 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:09:56 +0530
Subject: [PATCH RFC 3/3] arm64: dts: qcom: nord: Enable SoCCP on
 Ride-Embedded board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-nord-soccp-dt-v1-3-ee13aef55d8b@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
In-Reply-To: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: rflhP3vJ9QNsvPNuHtj60q5oxtJ8OKam
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX6mHkVhHutyn/
 TZix3WkkVcZL0jTt30xOFC5iSTLIK6leb75X0Y1YHIl7958tY1RXU7rEswmRs2ans69vsG6IxGu
 Y4phgKXY5LuVF1bpsXBBQTGfckUIfS8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX9A0AOicMlh3L
 vr5+0R46Nc2QC+MYicrhTTIi2sS0gwzq8wCxiF2jJCtO4zoskQc10Afrhs2D0ZitZIXSBGcLhBL
 +pj45waEMLEXojkGNIQpQkYJ3p17kRHavQ5kN4KTbhXNphXma2ok2BFPPvrSauzV4ATp7lsB6Pd
 vFBb+npx4tEPLWbc2RaRO1er7dcBfCDbQeHRKlNVSXSj1IaDVogCMTccdpHLxyCh15I1YUXclRL
 PDI0FGG1TsRu9dy6ioDpYumGWEMdVvq1yKDviZNjAjkmRNfMeS6tGoZ1UAliksxcIiIv4wTpdyv
 KbCFTTmPtmGsgHyx2+6Rnklv3wlt4g6QDa3SqudPAGtQbcTx8xIifKNmW7dqNfabW/LmYCKDpPg
 cQDPB6CEr2lWc12MiVSFtuENeHyj0K2Bz0ZHvKICnG5uBizm4GIyehfcRMuqggAD0JfiiAJQQow
 eXELUU3OmNwMTKgBYRA==
X-Proofpoint-GUID: rflhP3vJ9QNsvPNuHtj60q5oxtJ8OKam
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1b8bf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=J-qd9a_u2GMogK4B2f8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160022

Enable the SoCCP remoteproc node with its firmware path on the Nord
Ride Embedded board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..1206609a5030 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -419,6 +419,12 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+
+	status = "okay";
+};
+
 &uart15 {
 	status = "okay";
 };

-- 
2.43.0

