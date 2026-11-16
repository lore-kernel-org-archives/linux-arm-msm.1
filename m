Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835028;
	b=MkbQnpalb7xQ8E/CM2aLYwlfUq+lviUivoRCvufWZ4PRpP+hvlqnR7RKP5TpZ4AlmpVY
	 ZVQaYSnq30Z2JYih480pWM/9jMn1J7hZGZ837KXide0CcpMRdSt10/x8Tz6jw8iPBPu1F
	 2ueLr2FWQVXP8z3B7CsH7auY14y7cfPsA9RfyubArdJiijtnswRslq0AsxE1XDSKA0a2m
	 9yYQXMKniWgVJUJXFy6r2PHqOOTBZYjxk5P7nf9rfqn5UHnzQPBlQan/8pW+k5j0843gf
	 LQfNCWXvpNnWgPIy+3AZo3mkia1bUomS2j23k6f9h3RPBH+nBE2LF/PDHXBnhFbZ8KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mX/bLIK/LBbOqRGK+WPRiYe1oCKMmUPphTR2ycXJySw=;
	b=C/QTpcFQJHT3iU5hcP2JCbz5TNvjEo3xdfexLqzugA5F6CShSJy0y1hnahtq8IgEHVsI
	 yjRvakb1dDqWn8gNWoSyTz2EzSCv5UIQ54IBHBUCAHEQ7QXq9Rc8uxgTTGLMGpFbHn5Qv
	 SeNuuQIRKGer1N88p25FnURKS1tYseHBL/CpmsJLUtZ7Zc4RcCUFTaYm4mXtgo4ncCG/M
	 a0MKxEGAKQoMFjBZgC4Aq+VUWXJvopEJnsIwJKq0xl+uM6SXR1tHEHtbGoQmomHk164Ov
	 uqOGpBzq7ZScVmA75R3kBO71Pfa2aeAQlbEhcv2yNBGbzQ87ftnzKXRgXU6t+BwDuBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p47nZ7iM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bX80nJEr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5842606A33F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5842606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p47nZ7iM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bX80nJEr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1MTD1004664
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mX/bLIK/LBbOqRGK+WPRiY
	e1oCKMmUPphTR2ycXJySw=; b=p47nZ7iMx2ZEdr+qIWmsiuMkUMJAltKW/VTGHs
	HQBF3knKftCCwVEhl9HOpSvB7FbaGU+7fUWUlIgoXMaVa1MI7ZZM1cgujk6LltEj
	MEjfe7qp/AdiSshd2HGn7r7BnyYAdCnTonGE7wi6uTs0bSDnBdPv8HZmUcekEW8W
	vOLZjRHUlfLFlDK7WSpWx1PBIk7/oRhzzbEiporDRtsUoUstTZcKO2BDt7z5UANA
	+2pNdUJ7B7uZYiLGDIrCtUeb6VkFhHU+2nFd01ss4/UCp2AJRxtBSf5Za/0XhAPk
	gJh5eSl3H/FAS+veudhy5li784SMAtTRrltzl+DWGYGSejQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g0ky6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:17:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f6f4fe531so610535685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835026; x=1795439826; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mX/bLIK/LBbOqRGK+WPRiYe1oCKMmUPphTR2ycXJySw=;
        b=bX80nJEr4pBuerGIoWs90cfZysNajVrOMgeN9NNRLy81+0en0Cc36q8HKl+UADlcfP
         3lRI7QuiM290tLn7kfec9s/QWgMvIjorNVtnQTpJnJeHAi06Xolr5NUT3pghIga9hA1Q
         iEzJUQHUstTzRvcu1OVMaq6pBSiCAXO1g0ik1yul258R96K5DPtqmqCJMLbUeNxD6N78
         NQ6gjwlGz4JHdhbBBASIMPusMeNCGGo1SESKdr8biymsMe9CX/PgOr4Jqzs0BWB8IiRw
         hcuJWcVMGSEoz2G8hgcnChblIyC0y7Eb7iKXwRfY6wZzkttRUIvbstzen/UyZm+UHXzE
         qb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835026; x=1795439826;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mX/bLIK/LBbOqRGK+WPRiYe1oCKMmUPphTR2ycXJySw=;
        b=uLUfdFJAVLy0aK8xFmEVppppe2nN/vRaZYefOXVYvtjGpboTkTnHR1qhEHLGbph6bE
         SS2UKF1dJ0FLmqJ7DZKem12hSxYkEMXNuS2Y/nhICRLYDcIOQn16C4Y0E6rbX2rRXQhz
         DtFTbPtzYLELmRLdYfLXkpN8Czlo01XhCydWC7a7aBBmt5gimzKtKJcArYjll+FRrcgN
         boErejSLOuBaW7HmOSvHBBF626YxgDMfe53V0RKftY4Qpj+m3mtQD1KSgzaI0BsiMX39
         69QQVnPAjEsyFM+mvfGbD5yme/i9w7a+dKjOAM3Iad65MOEFAIIrZICeK+iWCHPnhNfC
         Bgug==
X-Forwarded-Encrypted: i=1; AL+hErG7n0/+/GvnBxg81kK+QkTcY3CxYcj0g58zveNweNIg87IcJvuxLgJCZzQORHGsy7551BFBfojy+G2RGq1e@vger.kernel.org
X-Gm-Message-State: APuU4Z8EWLNqdV97/Th4K2s+H5gCB8eYU4T+IJbOFel3SBK+LhWq1ak6
	L9x7kjcsVxYKOfoUEKn8F9dGIyo9SsXEC/vw344RiEAHiiHM1JNTqMvmtfjthkyWB7wzfaEBO0p
	LJFeVOy2CvXDfzPxe0CX2dAwWcoCoZT/h6lUEkwEw5wzAsikRqSmnwJJiG+1sMvLCZyjN
X-Gm-Gg: AYBFou2XwSVW7rrl/3ffWkFD3g0RfWTy1hBkoA0xpkzj6IM5eSpqXaHVsxM22MLkzO7
	6mMS45pCncBHehGQ/epFhAn3jeEA41TeQOpcVHNc1wnDGIR+CG0H353XB8UEDWMVxfNX8r1iJWo
	x85ARcLXAK0XBeJXmIl2ewI2PomBC5Jrykl5kMY7R8TrgpxuZ3yKN1NMIdfsj2u1APD1nQjmdZV
	gxP6USnTblI7Tetb1LV2f59QMoMUKtmD9j2aBPCpFvzi9dLZB+A2rKHWM0PvMShKzebROJL+IrG
	61BbuXLWvjB8PBUtgWH/kMXGVJKvjg3+nypiLRmuo6B5DnU6iqXgWzCoxo29Dco7tSgT4g8RE5y
	pvRw+r0UGISYk06wJyx6JCf0hkgw07wljZZquneVMuI5f98fRIr5Xuxzj4f+26PKi/dSxs7QraY
	jY
X-Received: by 2002:a05:620a:4111:b0:93f:cbd:8e20 with SMTP id af79cd13be357-9494bbeb2cdmr1633082885a.73.1794835025881;
        Mon, 16 Nov 2026 05:17:05 -0800 (PST)
X-Received: by 2002:a05:620a:4111:b0:93f:cbd:8e20 with SMTP id af79cd13be357-9494bbeb2cdmr1633075685a.73.1794835025311;
        Mon, 16 Nov 2026 05:17:05 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:17:04 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v3 00/11] Add Qualcomm Nord display and eDP PHY support
Date: Mon, 16 Nov 2026 18:46:39 +0530
Message-Id: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIADcC+2oC/23N0QrCIBQG4FcZXufQs7ZhV71HdOH02IyapZsUY
 ++eLgiC3Rz44T/fP5OA3mIgh2ImHqMN1g0pVLuCqF4OF6RWp0yAQcME53RwXlPtI9Uj1Ux0wE3
 VShQkfTw8GvtatdP5m8PUXVGNmciN3obR+fc6F3nubcuRU0YRasXaShneNUcXQvmc5E25+71Mh
 +SBCD+CMw7/BCRCguyENKLea9gglmX5ABMWLIECAQAA
X-Change-ID: 20260911-nord-drv-dt-d09b21f37ae9
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=4475;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=S8GDL+ZuL9kSueOOYViGlnQ/WIx0vWEkvXhiQqNpogM=;
 b=OIEFjUoskb9ceeeg7IbVVPU3v49Fg1Xl8hofMyd9H3VeVLejaljeM3S4z5OJpRTBrxXyCsYoq
 3JlFoutkMCCDuhYvNvhP2NjntEunPSY+6sS3zQaNOkWfbp0CtQGUHCa
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX6fFEXTW8eQFv
 zTRRvPNBPK9eB+GlrqfUOacAdy7j3zoQXV4ml4mdz1W/4QwowhlAaYLHAICygefuJV6+j8TWUX/
 4PNrSrr+tXlzVF3Ur6JkL1kAFbP6mAUxjFKoI7gZ5OXktWQY6E/Ni/wP+vLDhFVS4k/nl5m2icI
 v69Q+F/RKjl/Z+oFq3HtLOIGbuIm7x0CsK2LbZqLqGa9tsxECx4VkMFy6i0tM7ngI44vHkay4ch
 jd/ufCdl6P1UyYzDX4H4/kYM8IAjFhFLdJSdFoXMF8fgrKs6RtQCJfY5iiIyF9uyByFbxq3FTQS
 a24lbHe1Kmuzaxqvep/O0w5ctzDnRvBbXHeZLBMzkgwPQLacAwcEJvRPTCwWVjkZLvCP89Zo15/
 SlJOoQ3OHKa3+E20J2bXjp0emednh4ej+jI6eFIAX6M4MdUJM1wUoYeE5ynj5whzk+xEMHkfErL
 i57IQcCAJGCk/GNAjVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX28hz6lSCqomJ
 zJjnm9c4vI1zN78b0soSkH/p8S9I3NDhUqQyJ3kOaMxMi8Fc55F4wS0qvtpF9pWR8PYcOWnb5ji
 GKpDFe9lE/Tc7hJjAR4ONRZXtqjaivc=
X-Proofpoint-GUID: gec1qfBCuq7rIAt4HsGf0tVlClkGUPVO
X-Proofpoint-ORIG-GUID: gec1qfBCuq7rIAt4HsGf0tVlClkGUPVO
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afb0253 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8
 a=JfrnYn6hAAAA:8 a=e5mUnYsNAAAA:8 a=VLagYuF82rudLD4T15cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

Nord is a Qualcomm SoC with a DP-only display subsystem
(MDSS 12.1 / DPU 1499A) and two independent DP controllers
backed by eDP PHY.  The PHY uses a different register layout,
PLL/SSC coefficients and TX signal parameters compared to
all existing SoCs supported by the qcom-edp driver.

This series enables the display pipeline on Nord by adding
DT bindings for the MDSS, DP controller and eDP PHY, DPU
catalog and driver entries for MDSS and DP, and full eDP
PHY support.

Tested on Nord Ride SX board with one DPU. Both MDSS and
DP controllers probe cleanly and panels render correctly.

---
Changes in v3:
- Used the SA8775p desc table instead of adding new for Nord (Krzysztof)
- Add the bindings for Nord DPU (Krzysztof)
- Split the patch "Add support for DPU 12.1 on Nord" (Dmitry)
- Squash the edp patches into 3 patches. (Dmitry)
- Link to v2: https://patch.msgid.link/20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com

Changes in v2:
- Reduced the PHY patches from 11 to 7. (Dmitry) 
- Removed redundent comments. (Dmitry)
- Addressed review feedback from v1. 
- Link to v1: https://patch.msgid.link/20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org

---
Mahadevan P (6):
      dt-bindings: phy: qcom,edp-phy: Add DP PHY compatible for Nord
      dt-bindings: display: msm: dp-controller: Document Nord DisplayPort Controller
      dt-bindings: display/msm: Document Nord MDSS
      drm/msm/dpu: Add support for DPU 12.1 on Nord
      drm/msm: mdss: Add support for MDSS on Nord
      drm/msm/dp: Add support for DP controllers on Nord

Nabige Aala (2):
      dt-bindings: display/msm: qcom,sm8650-dpu: Add Qualcomm Nord Soc
      drm/msm/dpu: Fix DSI tear interrupts broken by adding INTF_9 and INTF_10

Ritesh Kumar (3):
      phy: qcom: edp: Generalize power-on path for per-SoC overrides
      phy: qcom: edp: Add Nord-specific QSERDES COM register header
      phy: qcom: edp: Add Nord eDP/DP PHY support

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/qcom,nord-mdss.yaml       | 396 +++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../devicetree/bindings/phy/qcom,edp-phy.yaml      |   2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_1_nord.h  | 544 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  20 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c                |   2 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/phy/qualcomm/phy-qcom-edp.c                | 317 +++++++++++-
 .../qualcomm/phy-qcom-qmp-qserdes-dp-com-v8-nord.h |  51 ++
 15 files changed, 1329 insertions(+), 13 deletions(-)
---
base-commit: 693de981a44b0e7e3b6a73f0b0bcbae9c8d068e6
change-id: 20260911-nord-drv-dt-d09b21f37ae9

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>

