Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402335;
	b=1gBDFakrWzfWx38YAZeCoI+ER+VECFwDKkMm3HD3cULdDpeJ6TU17KAwb9ESap3LmZu8
	 ootlmOFjbJgmDSr3YfKvAkH+6vytEQrUR5e1nctgefVUJuOq1HNqQyppkMRY0cGO76A37
	 1JXmwyN+rpcnP1ZiSa4AuDqcQ1pUPbAAYUenYe3zJEA91y1yMjVJoCiiAaq2gXcTAf4kV
	 6qNWIUbyFQ3SlY2bryyjPp2K6unsUe1ZpoNzhUT/QjAO4xrrqD47ZMRpjUyjgZ2lj6rqw
	 WaMHpwZ/M8WrnLdIY6cQ5trhpqctiD6y0gXjyy9swGt3qNRXFvIrwDJoeK/hpfmFKXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6ovnIEyc2J8D+ybmpj/3V5WAu/+92pfJIfGhuR0QfCc=;
	b=atSNaNPy/Ja93XFPMFaakI32KFT0QUn9NBajCq9m6Rfpe6rBGGDXvjlHzvDlwAnXB+WV
	 hEy/bgmvqps0D0g3AAgZU4rdt11UJ0dprWUuryFJrv8qbJDL7h+CsLYQIP9PUMAmV/A2n
	 zm0+2UGXK/ugkT/xsB9X+2y4foWSoNYREeHK68pF73pRwbNjCge/asqpoUsEPqMJyQSOW
	 NNxu2VSGB8D3Cdb16IdWVw00fOil3fa06rGZvafQIORqE07K3SbBXDrxrIKyI91vMdQuu
	 W0b3lPQIlzlr+bwsM2TacDS4VhMRJMO+6mHrA91KaxJMubcU3jxHUou9gI8IG4tATHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dE9/VK19";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cH1LTwCR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F34606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F34606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dE9/VK19;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cH1LTwCR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZDr0707999
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ovnIEyc2J8D+ybmpj/3V5
	WAu/+92pfJIfGhuR0QfCc=; b=dE9/VK19NVGmAophCknixC+JA8zw2F7eBn/a3J
	z7k3NiY2sd+Tjoek3WhPYPUeT6hZd2kclK+u4k2/WVEzmM6RbCBqGeWj0B4EeGAw
	5h9cLlDe7dzyRk+/esLyeI0NN7dh/jCZJ2dUiR30RqHM1PbBivhEQX2atQ/s8GA5
	VMfqUfzf32fMLRLPnWXzRyTP6jHoXH4rp5LEzra2rH4GP+cMhQ2OJ2pbqx4tOQLF
	ohil2VuLREnraiVT4ubFAQQYr4SXnu3pBt0TRG82sRbW9hQvAE5XgJeMbm3UFS0n
	F+0GxnlsuzH7EqvNh4OAfGLodOFeAAPfhEmqN5kROjpYBhew==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b33m9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:05:34 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ece7e4af28so2682617e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402333; x=1795007133; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ovnIEyc2J8D+ybmpj/3V5WAu/+92pfJIfGhuR0QfCc=;
        b=cH1LTwCR+cCjeCU0p9eYQ7vBEnIao+z+l5FL4PRrD7aaJSlJtxrIe+1p5NpwWLOJQp
         N4ZJdLJJFfV/JZ1Y3/ADrNfdNaw+e+zfytrG2VusZjyGG122puDmnjm4pBbR/WxsteGG
         T1CrwXX5d9RNZTOEsieXA/I99Dz0Th46u90RGCJvge9E0xefA9M4BA6W+Dm1wGmJQyik
         AsfsR0B/1HzsQor3ypMOcy+zSycAX3lRT0aNfeMFHkY0Xlo7yV1rm7ncofYlphA7Rh5h
         PYaYOl+/a6TYMpAuKsCpyx3iDmSr0cF99ZNLjtEfeW2GVk1lAroBRTg1rzh6667PWnBr
         zTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402333; x=1795007133;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ovnIEyc2J8D+ybmpj/3V5WAu/+92pfJIfGhuR0QfCc=;
        b=o0b8BFRYPbZdOx8M++d8ISK+fS3aAEks0AFGZuV1O93XqO852o0iT0IM4afVpeBaNY
         9jzyK8fdKszsPERtVh6v6zpWRIi0+2tM/Yh8mRRk3oGyZLrCWx4ENAeEgkXuJxbPKZYc
         QCn4kBsMc455SxNKuv/c0FO4VTApRcTiWdyXQKZZkxtyXL9V9yLgxFdZidpEjC9caBqA
         eLIyLLrnOb5jrECSKLIwYJV9Xp99vqFMV/L6fU1hMO/rvo9gTTTjBHZkJGn1k5lv2xGD
         7RFG6NpiQMIvFtz9UZIhVmC/4WqCRulPrUVNQupUSoQvu5s8XgJrd6IMhUtUwcge/zz9
         GSNQ==
X-Gm-Message-State: APuU4Z9TeTE6pBu2+iQt2kqMsILMUrGCo5deqrP4JfhdXs9u3lxFE3Wt
	3AEu+EXePsyexUMlqDrNqMD1egFN/CsXZoZAD07bcSE/X/CX59bdD0zugDc1EpZRdGMlJcrGHar
	+5LTkGaWZdYTRHEp6iEcxzDQRvJ0vrTrZOymDbjIEcYdjnzighMdiLlPhzyagMlD0cVTJ
X-Gm-Gg: AYBFou0IGgu2NK+uOk/MyIvzOwIIpKJZPnJu9sZbm8NN2Rr+tFNBnxTEhwbFIf8F5yk
	qlRGlpze0zgYuDVBoznGJ+ddEzZpaAQBoDSNF2Et6/xUeP7Ly8FDtnIorj/MKJxcDjL+cqBSzuu
	8lp/IPE01OP0c4W5zBSmgmZbhRJ1e9blqQ7G4QJErjTnQyvcrzVaDAAA+TLjwnLjqmQ626ZSyLu
	seYYAsGpnBVvFr9Ss2DIuOukpMr42omFNrHwKlJvZzDNzt3NLJr0GWA6jDnDVmsPnBaWLY9mT6G
	e8uuJfuuetFF1EJ+RWKoBDfOb7Luu8t4wzJYuRdX5Cju32jOcO9ktRwCanFSEick+OJXgDr6Vjt
	EXoyvQzZvqay9LkHruQwQdtVgMkZIQJ3Snc/1yyNXiFSBMnyn1Ka2upXnTdSZqCs41j8l8BFnNm
	kRmPfZanP2S8bRn0LnApK8v8wtZG4n3FVmiwyteMEA8nfbvK/2Lc+Qf4IMHi3FYA==
X-Received: by 2002:a05:6122:1d12:b0:5e9:176f:a548 with SMTP id 71dfb90a1353d-5ee1bf5e39cmr747004e0c.0.1794402333327;
        Wed, 11 Nov 2026 05:05:33 -0800 (PST)
X-Received: by 2002:a05:6122:1d12:b0:5e9:176f:a548 with SMTP id 71dfb90a1353d-5ee1bf5e39cmr746924e0c.0.1794402332787;
        Wed, 11 Nov 2026 05:05:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15d368e81sm391858e87.21.2026.11.11.05.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:05:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] drm/msm/a3xx: follow the msm-3.10 kgsl CP setup
Date: Wed, 11 Nov 2026 15:05:13 +0200
Message-Id: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAlo9GoC/yWM2wpAQBRFf0Xn2SlDefAr8sDMxlEuzaAp+XcH+
 221W+uiAC8IVCUXeZwSZF0UTJqQHdtlAItTpjzLS6PjtoiRe4k8g7veFCgtHKwjNTYPfb5a3fw
 cjm6C3d8E3fcDbhvg0W8AAAA=
X-Change-ID: 20261111-a3xx-fix-me-bf13e6cedecd
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=870;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DUAj3e5OQiOBNMj5siOdfFBEyuSsNIZAllewi8t3uIg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9aXDP4J/157b1z/K/PlrU3VvTt7QierN6Rm2RvvcJuUa
 WK7Y5FxJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmsriW/Z+yh5iDxGs/3Qot
 pbUqMWrWi55N5V0WJz2pc6r40hqWxfU6b5fX3Z26sICpuEsgxLpNZD3Tt+kTBf8zMRSbaXf0Btg
 YuyzdL1jz12n6im0/ndQXn5CyreEUY/F/+/KzvTRP1Lc/138m/ooN0TRU2TfxbcdxuePNKTcy/V
 YHZ0fs/sCnVrYp0N1d3fxmckese+sHVTP7o8+/pCo9bQjaJ7MwcK/aCv5MAe9JErsnPTL9WuisE
 ffwwH6ObycnfP/8Z2ULa/QzZtfK4OQgvvKrD6z7tv1RjnonV9t5ivPmlGv5G3REv/3Scghe/Uo5
 1Z558T9jtwnWn/2OSU8wXnUhlrV4epxulZVCVaXw4/2HAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af4681e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=qa_B_Q5AuH6_wmrwAUAA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfXxl1EW/ALxM16
 hx60kPx/OKEUql6VA6+x4axAuJMgsth5YjWVRISmuppElpfAkezPLBSB+mpPavl52tUzWw7CyAK
 B7C0igw1kS74gNV+KP3j3kSSNS1FwkIdtGyZ7MP5NJPi9FlRh+AbYimF5yJMlu9qpLYCRx1XfkM
 1VYPdQE0zGTMZgYIAtx8HRGDbcZbvZos9AKd4D6/F3sSnVI3JpYxir8YlCSBSZV37EuFQy5X7BC
 3hOf+32MvQonPwK2dgy/+tipZQmT6vp6litW5UjvEh/rQd3CHYC2MbOmDFxY9GjAjhvoM3SE+xF
 Fg+Zv2BPV0zXn/bz2o2OUGI65tPOF+9S6YjNUZjNLc95KLvZtBKaMr2F869/r2GgNOdjLVbhCcv
 oXhedIcdvOWeMqu1uI9JEoueC+U3Tm+0gy7cLd3o4f3mu5otJvCpUiQXqqU/TFUWhFOwoHDxflB
 P1QV9w2kJ9+HDghw4OQ==
X-Proofpoint-GUID: fO7kueAVmRY7fFA4WZzmv74s2mwUgKTx
X-Proofpoint-ORIG-GUID: fO7kueAVmRY7fFA4WZzmv74s2mwUgKTx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX92IGMJn1FqLx
 omiVYw/sq1L7JdnEC4HZRdMQsWJYdtFKqQv1EclKkEIMcOuJcMphBQc2fBokgYcZuyIoeNV3Oyl
 YVoFMQ0ntNRgSW6cAc5RHQoHxtAA+J0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

The a3xx CP setup in msm still matches the msm-3.4 downstream driver,
and a3xx_irq() silently acks the CP error interrupts it enables, so a
CP error only shows up as a hangcheck timeout. Report those errors and
bring the register range table and the CP_ME_INIT data in line with the
msm-3.10 kgsl driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      drm/msm/a3xx: report CP protected mode faults
      drm/msm/a3xx: update the CP protected register ranges
      drm/msm/a3xx: update the CP_ME_INIT data to msm-3.10

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)
---
base-commit: bbfe1d58f42ad2cb56a01f5717355901698075e4
change-id: 20261111-a3xx-fix-me-bf13e6cedecd

Best regards,
--  
With best wishes
Dmitry

