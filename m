Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718310;
	b=B2PviReSfuIlBCwkrJ3mw8v1KP1JCkXOM9N2KGbaTZN2OZLBwaC+vHSD3OHcTjrOfiDy
	 NcOTq9zhWKzjcBDZDwkU/Ewz1U3KAsjyj2jUgRVY2ikU0NWkQd1U2Gou+aMrzX+0s+F04
	 Ty1GDW9nJ/oxdR2sL3AkRLt4j795vEdaMLuwxyT2MtqVF0o3xn52wNVr8hhJJ3tGyYlI7
	 G8vYum9n8cf1W9KLRWvJq+d4Ru23g6ZtfNw+FX3cprvpL+oAQq1FQvwCIvjnWFMS3ZvU6
	 PulGY4ieb34dF9nE/vLlkCLtfv0r94KBAL4tFEtBk4seanPJAS0epmGuFMHP1aTDnNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RjJP/yVn5Zo3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=;
	b=adDRpJSNLnmUEyCripn2V1//XVXU1aNW3/e3d/wnN8TrZ/J1VbRsIJ2ESzbWsG7ZRr8F
	 luW0TRyssp2HsLpHbXNtY1ZXYlrV5bSQgC6DP8/C8rGZZ0NsHZktz/vCF7PH0RkmmTITQ
	 /lWfA7t/phDijNONgsgcnZNwSIfHS1BSVXMyx+iDqLWqGpOzh3P+Ialhpn7jhim3uIVms
	 BVlO6DCCA/VA2eWh5peflRIli8REcFH5RwhLMUDV+Vn2QM2p0FeEGdlHBMDxJ+3azhW2R
	 tJr5KW0dQ4uQC5l6DxKLbH/pVQ+47dl5oJ4VnGuoxqubnh6iowMb6t8f897CAhPPYPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pmLM9Qxp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vg3UNItw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9D060A2604
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC9D060A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pmLM9Qxp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vg3UNItw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFtxgj4048197
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RjJP/yVn5Zo
	3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=; b=pmLM9QxprgnHqvs1HYhjmUu4WiD
	p4LNs5nPNpj+SQHK9NtdgTLQOu3BKdFpqJpO6dw1mHsh+5DVDHENEWhdVhNhhnwp
	j+xe2Ypp7LGldnqPoJryS+X5w3hez2lP3z6dMRpPb23MboRGF3V+PeDKk6ZFH1BO
	A13twpH9ecuCJrKZpzuEt93AU8Vqb8zIRk2k6Ujox9nH6NkBcWS7jYnia95AMo7S
	Rbf4affIblFzyKdoSFfMTnOIi+2Dksvu/KVi0ApZ08ph88Kc24wlKvyvmNUN7lSC
	jSaRZoohE6vyt/DVhDh33TFIw1UqzJQpYGDzm+BkJg/XcytBLGaM2eOCy8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rjjy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495c71055bso454814885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718308; x=1796323108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjJP/yVn5Zo3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=;
        b=Vg3UNItwB54bDE/elz1MkD3Ca1BjCbdI6D5KknQ7Dc3OpYGn44FwsFfzn0/0ZhS+8Y
         yA7nQR7v/DE8CGiwpbT5tNZtVdUGFWtdtXe25kjYXDeydCpAfLrsn4ywfxuw/7o9g04L
         xC2C2OYSysnoQOj/4L023nW2dxdCzvj5igW6ZbxkuegOtgHT3sQMjK9RL5Q2dyI3HtP2
         YwhhlaiNMueeaC9D6PqdztJSzhKZPKk95+TKF/PI0ru+rB/H+mUAn8b4wCA+HagMyeH+
         rpUYILmymXYRSQswvLN+P6+H7ehDeyAP7sh+hOE59+lkFbcxUW9afNtFgZCxRqoMV/1Z
         kDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718308; x=1796323108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjJP/yVn5Zo3ETtO6OpLswGKOSp2VwIJzOn/FhsZnys=;
        b=jmCUaaSJDBdP2iydfYAdFp5p69TEgLyGeOYCfVee3kOnTDTaA5W7Tt6ErulnajCr8A
         B7GzuFAU7zVk0WFwPmoLA/rTb9564Kf3g8GOUcFT8pS0gZeLE4jzSFGDeoZSEiOyPFvd
         8ZNZIvmqYohMaL3TBhIjBfJl1akWBIBkAp9bDo0T32m9qn1JMS/qeGYOmxbNux3kVqBZ
         3kerWQ+3bPRyBW/KALVB52KO5N4ggWxEudGxefj1CAIWijlLQwJlaVqk+x9HTId3EPLj
         KF6K7SPEHnC25WCm+cGaueL4q0ooIx81RqHtVeVCbB3C++AudU5lkRAGn4pbRpIB6nEB
         37FQ==
X-Gm-Message-State: APuU4Z9h1tDOxDuqtZ2tseiBXIMFcxxgmuRuetLpLC+tBSGoafOpWVWM
	x0JR7ZZHwBkRbj5VcfjHdK4oX5h9KdD239ir31cap8/HLBrjIrfeAbT+e4gQSkqOSk2pt3/DHiJ
	xoJhsgiZT7KGywC7jle6ZAcaMMs7yJQA2KHp1v2TtiJSK+Bzt7XAV867u8YNCP/VUcXX+
X-Gm-Gg: AZFdTZeb69km75VA6B7MJiW1O3uw078/EexBFNemqe2VMch+Gke6yNpyeK1pHSAFK4/
	dX9OjUx6g4gIMe/xohZGVXjHeIlyfhp1212lx1tboQ6EzOwrbfEfktcCE/SlmPyTydtX50JSdbH
	ipJYXkRyeYMh6FPYgmoCLE0Dk35NR8UT1dMzAohj4Wxlv+GQ9guIAlCEvkojl3akDeh28Y2mr0j
	537dMeBGd4gzcKKlPxE1avo3QWBBvE4eEbVJuVlokzyEmaEG/0EJhb7vrcfBMDDzpVFPgcdjIL+
	yMmbUz0Xdg7ROPBCndpW9NmXgh2momykV9eGX7+dsWFonYKY+Nh+VVVTf0I/UaBkRpHvSZ3QLeq
	LZ+pYecIvPebLowttno6sOAuypbMAPmWECiaypaEasmiSVOjbghMIl3Zs3J2uE4A4
X-Received: by 2002:a05:620a:8089:b0:949:6d95:f62b with SMTP id af79cd13be357-949ba9e753cmr3683552585a.31.1795718308396;
        Thu, 26 Nov 2026 10:38:28 -0800 (PST)
X-Received: by 2002:a05:620a:8089:b0:949:6d95:f62b with SMTP id af79cd13be357-949ba9e753cmr3683549385a.31.1795718308034;
        Thu, 26 Nov 2026 10:38:28 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 7/7] arm64: defconfig: enable SDCA class driver and WCD9378 codec
Date: Thu, 26 Nov 2026 18:38:06 +0000
Message-ID: <20261126183806.172485-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX4qsX7rTAkJrr
 ZzdPNaZSJE+ldKXhbzFMFYyy43qPV1/+DZ/igh9qxN4yXS/WsVSqB8AWOvoC/POSKtFAk2Z442n
 WQMnXtDZpR3mcDeWWHtgI7uzWt/Y6ax7zPS+FkwNYZmhpgtfvXFmHbtrt5RmWC/RN1i0qcO4giH
 Kc5ySxSkMnJfJ3LdLwJYlU3z8817875yny6ERg3vsrlO9JuG6Cw4Fu0E3lxgpzSSQNmT+6F538S
 +T6+TS5Bt++TNPRlAR6eokKUAaYzPefySx4/VV3c2e9vvS9JWrRLuhg9yfy0+LS1mmN9jmyl17z
 Zt9ccbojb+mUDN4LNXCREil01jmMHXwzqjGKsMGRBjdqwHuYWAjXr3tL/wEmsQSqumBVN7MW7sN
 4lNHcJUb+6onFjH2Duo92LNfZRTnEhdH5zgGEorMTz9q85Rh4E2JK2vFTryN1GcnfRu8o+mBZlM
 Mtcvjk7rU/AvYd5LI0g==
X-Proofpoint-GUID: zWANjrrj3KwrmNe7dynTMc0t3Y1sbKAq
X-Proofpoint-ORIG-GUID: zWANjrrj3KwrmNe7dynTMc0t3Y1sbKAq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXx4wWcqv/SyKm
 Yj7DR4T6OjYX+VZgoPBQSNZvA4HFvq6/vOopMeB0NSVEHyxa5bzJTtEasXBAS5RmKSMlZ95ZuNR
 IIdxRXSf2zLYoNrr4HL25IgR9+j3JPw=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b087ca5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Lb-CJUeqFN5ILZ2-pT8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable CONFIG_SND_SOC_SDCA, CONFIG_SND_SOC_SDCA_CLASS and
CONFIG_SND_SOC_WCD9378_SDCA so Qualcomm Glymur-based laptops have
working headset audio out of the box.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a22..86b33019eaa0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1184,6 +1184,8 @@ CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
 CONFIG_SND_SOC_RT5659=m
+CONFIG_SND_SOC_SDCA=m
+CONFIG_SND_SOC_SDCA_CLASS=m
 CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
 CONFIG_SND_SOC_SIMPLE_MUX=m
 CONFIG_SND_SOC_TAS2552=m
@@ -1194,6 +1196,7 @@ CONFIG_SND_SOC_WCD9335=m
 CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WCD937X_SDW=m
 CONFIG_SND_SOC_WCD939X_SDW=m
+CONFIG_SND_SOC_WCD9378_SDCA=m
 CONFIG_SND_SOC_WM8524=m
 CONFIG_SND_SOC_WM8904=m
 CONFIG_SND_SOC_WM8960=m
-- 
2.53.0

