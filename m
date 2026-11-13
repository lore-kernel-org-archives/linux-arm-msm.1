Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572664;
	b=vsF1M7xDy6Exkw34oCP4mJGLXBFZ+j4bBRI1PGpje3mAaqncaMalxhL3iUXBgFgYNHtE
	 MS1cN0wbGJzNhHpjWJvMqtL7PwMehGo/EwY8Mfgp5/SPZXMTUJJVW480lF7zZLC8USi5Q
	 NPjYgs5Px6K/uwFFOm0cCv+KspyQHpAu99ADIvfU/N8+//thhu9ySwC8EwqvMU9PcDeeD
	 1P90kcRYsx/hAON+dTTpaB+Evdxz+Ktkg8RbqbahOQjMNC+jBIn2dkAmO3uSA6Ew7d/KH
	 hyctvSDTrJgMhwsjSehUvRsBH90bDFDJLxb0+/u7cCncgqywNuMa4JiG/Q3rP5Ay1IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1I5Fpk9OxKRpuP/kBPSyuFL2Dpl8V/mFpHvK/1KMpxM=;
	b=1YvbwagYVHuq67nKZkLmq5sm2S1ITho/FfEPCw7rJJ03PF0//3ceVwzdMfVSZpuk9ESy
	 XFdNQsmmbofI5QFp1QDyA+O0RSHTd5UonsOzb/9JcsCNnjdJEpFzqgEkU6YxgV/nG3cfI
	 9Qhu44L8Yifcy/rHCG4F92FWhVbbwCHg2FJoMQtsdNJl25SPpp4QF6CFBos0AuJ5QrzGC
	 itHuypAVKNiJ71al0QfydN1RhV2GU+kjAg0mgfo7QzW203s2Ike9mSDnIj6e/I2xS8lx6
	 elGJ4CW/YGp/A69KDSWgMMCgnKI6cIOJpZ6vLeagYgHpG1s+ntyKpB9qxl3EpZT5K8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OauCjCfQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T68PIrv9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04E860A260C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F04E860A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OauCjCfQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T68PIrv9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJo03516559
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1I5Fpk9OxKRpuP/kBPSyuF
	L2Dpl8V/mFpHvK/1KMpxM=; b=OauCjCfQOozEM3K2Exonmvr3kZRLjOm0YoBNZq
	hxY+6PeQPkkaSy2WiF6Zx7MR/CCoz+o7VWJcuCXinnzDncz8EgJTd3WGiALX5Ebv
	5cb4Jkp2ki59qMi19qzDCs3iidv10CLpbYIDoG6BOx6gA8ZJ8x3ri4Wh3GPi0Dxq
	bkwh4UwwJ9f8lNK6cVQMc64IUnkuaMQKBWEYnvb6nAS503foatQgt67FLDkrpV7U
	bPq+tbTruAiDhaOQKH9uHdZpyFJUK9itzowJdzZiNWPq8aZLuOvX3obi/WjLD2on
	osS82S7pFTuNrsqsx1Y6T9lWBddqOPFIFMuo+z5c6+GJaVsQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdk4as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 12:24:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a08903566dso1243436b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794572662; x=1795177462; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1I5Fpk9OxKRpuP/kBPSyuFL2Dpl8V/mFpHvK/1KMpxM=;
        b=T68PIrv9vBcKLXW/e4IlShurs08biqGVfu8AP4+VFrVQE5dsL0bnviIqDARVu4+Rtf
         6jqyMOs3ybG4+1nJY2OGaV2Q/HI4RVHoM7+hcnM36Ome0UwVT3C/WPBz9Qzj3S/KziAx
         pOGMRehsvdlA8RnKKjBK9RDDl/sZ+PQnBeRQmtO5repbH5dUSoSBYBD9XLBR1xGowNSY
         CmwWXDuKrRkezC9PHRQheY5dLUygtXBPVPTU1YM2XI13Ovp8II2tWdmerPG6vhiQHDZK
         Xvn2L6+AhnkgdaBHF5fjb+F5hGeIqYFKVZ6Gf2yLvM93pgCObP/Jro4ab+oUAhgRyeqZ
         m38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572662; x=1795177462;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1I5Fpk9OxKRpuP/kBPSyuFL2Dpl8V/mFpHvK/1KMpxM=;
        b=saZBzA8ILQ/nnbwsEMBYLffke/XlDfKOM/LDztJlkXwMYDV7y95iAbxWKxrI7K2e/q
         eAiO//oFYuzMTuVAGForLCm5PQ6E5ci3V9p9BBK2TGlHNXZrZiXOsOFmRJinEbfTGfvh
         oUl7ZZ1mApyj4lbig/55/4fDlI4+tuyfdx/S9m1h54sFDWZSKH+mltNYG45B3yeMWm/F
         jfNKyWYyAJMnNKDNOFavX4+KhZHLjP3Q8LidwVGlsUGtbVUYTrObKzLjEuY8T7871Y0N
         6zaLbf8rCiLa6aad7+zGKhHSE5mDWz1sZyRel3tFJJB2KC5dWsFLUUj78ws37j6+MDDC
         oNBA==
X-Gm-Message-State: APuU4Z9UEFnLOCKNmKMFW5WJw+vGefMSAexV5qmsmVA899qKq6P2Gi4W
	qvLRydRj8i44H4s949OTCuQhTbWE8hf3ThXNe1AfoER3lXmy/ZEp43vD1dfSNw5z1GWGPJ5Kapu
	rWUNNFpGCUcCrMCXmwDKcvuVVS5modWz1V3VMy5J/HOv7If86R2jzl2mnEve0m4jox0fw
X-Gm-Gg: AYBFou2hJ9nI3AR7LhqNEgL612EByprbd0smWJH/vzB79p5iAorkt0csZvPfMB8KQZl
	UCtcoeBgyX+ULz5kpvPaRVAT3HbsJaToMo3hGvEa/+dxktzohewNIjfLGDZ8ld9EGEldFGqeyaI
	oYGUIM1ULkUEt+YAh1ACQMseuLX9cMkXU/pE1BDnIHsU15i8lSxWkeeJdisTVoHtphloFNjw8/a
	/lJuLswBH0hvuoODp/8v7YCMYgbu3h/cIUlIqizCJ8LhDUBY6IAskgwElgOJxKsq8kloY0GeD/L
	NFV8T9M30cFTUb9V5v9hiNxT4wxz01zwqmEXRboHjBLT2Rvz3lEyh7bRxf1P+hPs6uSbcZqk1IT
	7OoFUo4tYiIsgzq5vkK4RiVTpkY613ieu2uWv1Rmzu5NDzh93wpuVxoesZ/IQtelFWI+jZGADNB
	OWtBnHgX4Vaw==
X-Received: by 2002:a05:6a20:6f93:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3f7a8dd87a3mr1537417637.7.1794572662438;
        Fri, 13 Nov 2026 04:24:22 -0800 (PST)
X-Received: by 2002:a05:6a20:6f93:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3f7a8dd87a3mr1537401637.7.1794572661989;
        Fri, 13 Nov 2026 04:24:21 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1870ce8sm1098025a12.9.2026.11.13.04.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:21 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Subject: [PATCH RFC 0/2] Add binding and fix SoCCP carveout for booting
 Nord devices at EL2
Date: Fri, 13 Nov 2026 17:54:11 +0530
Message-Id: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGsB92oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3bz8opT41Nyk1JSUVCAjx0jXwNw41cg02dzIwjJVCaivoCg1LbM
 CbGa0UpCbs1JsbS0Ac0uM2mgAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX0yIhYQBGaJW0
 tPB+qMOLEG8LQpCCMLKWht4eVq30Va5mSCPdLLz1FHrUmxt/ixdVW0C9mspaNiikULAu+aaTXh9
 5r9j7tQmNFeS2IEIjC0+h4iagEkaF4Y=
X-Proofpoint-ORIG-GUID: JDDYufkRblr38Oy0O6XUzDLpNyx3G7H1
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af70177 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F7kJTSH_YnVbI9ikjjQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX/9ggDpfuThHZ
 cav1GO8skFaAtDF50W/BSDmP/THOEMVKAF34EQrE2foF3JLPQ1GM5OUz3Hupzd+GvBb9EUPTpBA
 WB/WqlV/UxaK/Ni9UYL0qs7ZKwhByOJXV/J4i6TZydcFaqcKn04Czoo3R/9PVnsYBUYkMX4UOaf
 +ZoL7j6fKPUN3SxpzObBN7+WcBp3qmwQF62NCdOyz+bpDc1BNZEV+Iz1OoFPC3NLREJjznO+lsc
 NhexeUjA4ZI/NmPTZlZhl86HlatvPyMYlxR7e3vV8cG1kx5zpf+8TWOibNoU3JAeSN48XPu0Fp1
 r3HhvLN1R3bT7TZN5O4B0GYx5sdNM4BQNRWM4Uu0U6is7f+86CKPars//ii27BBUQqcJuYMo2gs
 OizXwpAOodQZL239I+RYMTwrbhYUneX6zKvpGVuRPq+ebD9LF7L2IlAvZcqb+ux8puytzLsRFun
 sPjYnPxg5BzY1j0AUfg==
X-Proofpoint-GUID: JDDYufkRblr38Oy0O6XUzDLpNyx3G7H1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048

Nord embedded based boards currently boot Linux under a hypervisor 
that manages the IOMMU streams of the remote processor firmware. 
This series fixes the SoCCP binding to allow two iommus entries and 
maps the SoCCP carveout privileged-only to avoid a stage-1 permission 
fault on first instruction fetch.

Dependencies:

[PATCH v2 0/2] Add binding and driver for Nord SoCCP

https://lore.kernel.org/all/20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com/

[PATCH v4 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc support

https://lore.kernel.org/all/20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com/

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Anurag Pateriya (1):
      dt-bindings: remoteproc: qcom,kaanapali-soccp-pas: Allow 2 IOMMUs for Nord

Bibek Kumar Patro (1):
      remoteproc: qcom_q6v5_pas: map SOCCP carveout privileged-only

 .../remoteproc/qcom,kaanapali-soccp-pas.yaml        | 21 ++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c                  | 16 +++++++++++++++-
 2 files changed, 35 insertions(+), 2 deletions(-)
---
base-commit: cb70f5c1654381390efba76b2feba8be2331b83f
change-id: 20261112-nord_embedded_el2-073e25c7289e

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

