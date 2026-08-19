Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81418345CA8
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147870; cv=none; b=PptODbotwN5Q7d2gFMG5Lp7H/5d9cnF/UegGtedxblugzNsEA8xxBuWN6tsL6YmzAWEoQKKpbN+ThgUHMCDmK6OnSobMvtOB33k4MTpK8XSGxMEePRl9syzaPV7pGWm2CWZ1bJC6lGrXZFKpB0/0rGuMS+4nmYJFkZHlsWBYScQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147870; c=relaxed/simple;
	bh=2x/wDH270ncP5XFNztki724N/aW4CTrg500U3uSnNWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmnTF+uMkpzKQMUtTXMXAYYZMX0hBIbJ9FZPwxf0YxXLlNIxP5I3Of59EbjQVCHMjeyurS4htJqlneapsZ+fHSyVPuwUZ/FWhLxmGrxZpylDVQlFRsWhXu7le/A4p3fKZscudyhf04bNfAV5F31jzNV7tBdHV/NgynB5HYc0pEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bc2IsQ60; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZK/BbRe5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bc2IsQ60";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZK/BbRe5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0HUm267944
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3o74uStGGv0uqAs85SIll3s9rIKEHjCc9Ikd2SHgFw=; b=Bc2IsQ60xp44C4IJ
	djyVe8KDwZ/Lg3TlVLa5BIZ9cnSTUrfBsXWHVu/QvnOPRlHmRiWeIFNyxUPr7cGG
	jya25RKb1mcfb4rvsSrKBsgJeraWLfUVW5iwMUcwb6VpIFVfxhpS1c+IXuuMAaCV
	2AJZUksN/EUsctrqGE08RKqmAXQ6Da2xY4fDGeXAlIeEANsLC0M33D1xhYV1Um4q
	N5K9QFxv0QkvD0oEEU1XAuLrzPmTjfLngnHS3Fdi77/ToG90QVUwJ2LQV/j33Z95
	lnm1lvhSaLJst2v2Nq3GmqblLbjmQLbR1rsJRLXMPAduzjxyGSQfA6VioVhsB2Ct
	/3dLtg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfnbgp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 13:57:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc4c126cf0so2026255ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787147867; x=1787752667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3o74uStGGv0uqAs85SIll3s9rIKEHjCc9Ikd2SHgFw=;
        b=ZK/BbRe5tsbGyLpilga2HNnIfCLKKHHmo+V2D+eEGse/5vK/6i1nED7cqpGnWs1K3C
         mQi9AsFJz8vIp/aG6QRfKgR2+aoeEC0hEiKS2HArGtxeYNTbaj9yvXMi5SnaY4qM5nop
         4sRWvye21OmcC8s8FVwhvmIfr3NqYXFcJm+gXHaLMIInGaASB4wqLj+Gm7Wl3Af6uOZf
         TziI9FFnY8/uInyGtXWMNPqLE1rz64favm8wcuFvKg/zHBgGR4Xy3D1quukk2pGB4tki
         UxSy5/liouufOS3eFj/bOWfPaLdFzMRzH6dp+zz5xe7Nthic+Jr/9ZEVpPWEW4TvrWFc
         5q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147867; x=1787752667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3o74uStGGv0uqAs85SIll3s9rIKEHjCc9Ikd2SHgFw=;
        b=kJ2cxCL5EEycmIfODtYOPEhj+KX1YEBL8D3eIfeDEtjynklSIAqrD5lcUsoiKsNPb9
         qQh0Z35OVO/Cv0YLtJ2Ub11fJ3cEM0oxRI7WqdXL4kOHEJ6+qm94GTP0L7aW2GlokRmr
         infWD14/bRpsL1reVql/BEwVwyEPz9IPn/38SKGOlmaYHkvBI3U6HuznYxvNBUyqtQQC
         PCQPYPa0kJxxuUoEO+ID+8GEdq0U/FdL9u/1d7+zfXRCnyc3rEX0xEB1N/e2ABZmxofm
         lRlC1fWT6sD+bAWZY9X/pseLIBymjw0pJsfi293vY1x+5y/DV+bM3kWTdBB7BkUDjDlZ
         yGtw==
X-Forwarded-Encrypted: i=1; AHgh+RqDRMbfRVt/HgpuiyVz7HQuDmd2S5INm1hxfX5wS2Q7Wh26RytPOhT5CuAX/UPwqbwbVmYIiCgUGcVwoge8@vger.kernel.org
X-Gm-Message-State: AFuF++lTK7fQjmjAeT9gidp53f1dhAWyglhvpnVbP7AjEry7/eTx+ZJE
	5MTuwZgSOQ47gqjPR8ixKWaKDSH/zsXUks0J+2UJyjF+pARB6OyTP3EY4HJ09XGe6wOeMTEADk1
	VWSDKupqt2fV1rdl5fxbUPxLOTiDYBUEhfUvRrstIyCP2B3/H2ymb+WgPoQe1ggt0Xqkg
X-Gm-Gg: AR+sD10UTsntbsX4RMF8dDjvS23eQvcbUMcIuG5FTEdEor0Ytdkb/obvIM1JbbEIY8A
	WODI0nOjWyUOyx/weZ3hVRvZe8LPYJSGJwzLqXvVISowt/2tvPX2WkBesugDo21/gnPMm/2MehX
	oZksoxf7khaGllkLHFUepsqhIzfMGbSU5rtpqB3o46G5VNE23ouzU+q1eOI73w65pk7dVk04SOl
	qZYAHlmQ2/PVvuELdWjbdiXPbSX1pjWWwx19QrKlowJvKdlkKobg2dQbDsd15EYdfkmWm4mkH2P
	eeeTPeO0HOKQ/Hkh+CA2QUuLbiOGNR1DzpuVzhmNtGW+rblZv1Q6x6WlK+kXmddIfSOp5EpS8wl
	9NLCk5slVA2aZsdvZL9/Zcu3Ruhtgp4rFFrnEHYl0fymSYgrNHv4=
X-Received: by 2002:a17:902:ef11:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2d601865ac0mr49080605ad.4.1787147867415;
        Wed, 19 Aug 2026 06:57:47 -0700 (PDT)
X-Received: by 2002:a17:902:ef11:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2d601865ac0mr49080165ad.4.1787147866844;
        Wed, 19 Aug 2026 06:57:46 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e550dbsm25318255ad.42.2026.08.19.06.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:57:46 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 19:27:33 +0530
Subject: [PATCH v3 2/4] arm64: dts: qcom: monaco: Add graph port/endpoint
 anchors to pcieport0 and uart2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-b4-monaco-evk-m2-v1-v3-2-988145ef65cd@oss.qualcomm.com>
References: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
In-Reply-To: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a85b65c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YQEAmTBiAzzqGyEmVFkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: t_LUICLn0YRE_uY6LdmN8UaVswcm3pyU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX+J72joWEiEQB
 SkO06axTdCzvKdwESzig19D77fjEVoku8A7s3MMZeK48BVCFkfl19Bys8//EuNtA0rdkUtHBcwG
 aP8ZJ+sbPbeUVhIiDpKB6cPgFqe4qzA=
X-Proofpoint-GUID: t_LUICLn0YRE_uY6LdmN8UaVswcm3pyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX97buOBgeoFXt
 2wcrpaj7CjIf2t+TkOQJGgce0LL98ijJd/1T5RDbPpi4E7Jse4Z9OaV/sY0eVezSnbjvlLDC9u9
 bbympCnxDcu9q99Mw4PM8dQCxMsWLaNYKN+leOBL9egAOWCsiMSHAM8VQ1qGKrHVxPESyBSXa7w
 lT455GK2HPAJlQctV9a1G9+/Hr0xP25XqYHcd9x1cLaz2NYPTr6cvzF8vm751uRw4LDdZFC+g68
 RV4EVsmV+ZD812PN8/mzXLzD3N0ZvYpcSLDu1KmgQ/skjBXK8QJBhTO4V8ysXwXl68ihNoBZozQ
 BXHEN+JXzy8fB0uiiVKR1aDxx1k89B3XoTB8o/OElOcpq6QutcT3FwrWOgvY+fzreiVD17NUvSi
 jUeHIx7ryxvDe7V87ihCutFHT8mp/x0TyxwMEe2J5yV8L8iWDXjFqNFf0d76lRZex5TQQhvxfGp
 0XYo1IZkRLhtLRE0BbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190109

Add empty graph port/endpoint nodes to pcieport0 and uart2 in monaco.dtsi
so that board files can reference the endpoint labels (pcieport0_ep,
uart2_ep) to describe connections to M.2 Key E connectors via
remote-endpoint overrides.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 438ccf6eba64..b17d41059e7c 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -1184,6 +1184,10 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				status = "disabled";
+
+				port {
+					uart2_ep: endpoint {};
+				};
 			};
 
 			i2c3: i2c@98c000 {
@@ -2402,6 +2406,10 @@ pcieport0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				phys = <&pcie0_phy>;
+
+				port {
+					pcieport0_ep: endpoint {};
+				};
 			};
 		};
 

-- 
2.34.1

