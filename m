Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C913BF689
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021258; cv=none; b=H3Ljznd4r6qYOjnUweaw+XSvJw0QHqRaLxt1CSzk4m9JGShZGsHU/9qe0zp/+mMpt++2pM+oGJBdkNjRxpy9VXvdnsYPTaKHcO7y9i/aJ43X2IfEPrrAtKcK6opFc8zXX5q7LmSF5ahfTTiYNiKnzkRI7X0IOj+cPo+ic2/bxHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021258; c=relaxed/simple;
	bh=UyWgn98oC86Ag7J/nHIo1FudYinUSljMSVGj4DXtPfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adQQaj7qwJf6oNDMMINhOzG76SflOfiUFT6cSGAFALr1/sczyXhYUHXpyh65o3UJNSVtKMMRRg1tT2mKrb9DuNcnGpFL/Qh0orTkwHVYK7DRwQ0WWaf0WH2ip8u/b1DK2e80O/134dma5SfyFAmblf/sSKAZ7NiN6t8ZckUlWAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PpzQDxH0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akIpt3CT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpzQDxH0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akIpt3CT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GSQp3487379
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YSed+vK+mrdRChvJYuOI3Q4bZn3Tg5eAQaoTPgvU3bQ=; b=PpzQDxH0bFF9MsNl
	nw3mNLrPUly0WAGf7d2b14yov9KywWsCEyuq7DS9bF8nfNRkzD72ec1Ci21ElUbG
	9cXPTrxaGRrJeqgwKeXp7DrIZExH9lOoWAUAhhzMLxhHPMvfGEhfHWHqkzf0SUAt
	s8cp3xSB8sLHfwE8fYFJnytBQAZugr//+QBtglusZ7Z6xWlb74WDf6SsVdSwUq43
	GUbBWDFnidIWnpo/UuJ7N/0458mrHwK/yN380XlVyzLEz0imjOmu5VmBhy92ifeS
	7GU0M0qQVTeoEAEMDfS2fGwd7vI+GVorvGwNhgW6nL09fZwlzZtzenRow+9m2q6z
	4bkaog==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyejbhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:20:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso7926320a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 23:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789021252; x=1789626052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSed+vK+mrdRChvJYuOI3Q4bZn3Tg5eAQaoTPgvU3bQ=;
        b=akIpt3CT+0NTksSFIRWMyMWPWZQEvNHMhJFmIqxW2YhqDyhIOsVrpZRmusEWdCxuXi
         AIFkBd4SsHhPzR2t+9Rv32tnP0xla5aY3xBJoA+1aHH1BMSLmknZoHSwx9sAeB2DuU+A
         zeO+5PH2MrwTKuIe3UP0cmiUjXKLksGuGLLyO6aR4Ow0HwwMJjSvrE72zzIWaFNDwb7Q
         D+OnwxhNcrMZGez9KRhDHMLwPNHM8MwL5VEoDd1SKZvIXPZRrKoONutsreZCwbUz6z9A
         66A6v6CwF7R+uZt8vxaVvBHHwI8py4rdLB5qYjJmTgB0MEFsswMas1TPIAomoIpWj4Jq
         cJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021252; x=1789626052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YSed+vK+mrdRChvJYuOI3Q4bZn3Tg5eAQaoTPgvU3bQ=;
        b=ZddPgcwqvpIX23uQESTuqHlo3JaSco+2hlYKs0d/NZ0tIMtI423LGoeX7uSc58irvH
         ONrFixY2klO0+PzENmCYZj/4y8xIqOD6mbx2LGiuRHkIAxRkzPX5mjw/xme14xQSc7Hx
         GQRzct6NE+bmx8Jyi/oG7YK9cMG1m1qR0omUmjBG69DvPXrqhZadpp+OZbk9h16Yh7/j
         ZZGQcQ1ej8e6CpuY3LWSNbdDihdN7a1eEAKLDADp+yyTIPFvrpoqcWJG6wrUt45+C6Oj
         9H+8vNVyKX+V7pJvA1I6tCMUhwYctE6foqK/R9+Yp2KtrxhKxnRsmj57opWt8w8EYik8
         xTLw==
X-Forwarded-Encrypted: i=1; AKwUvBz7e4/zS4WEClsuvIsnZW+fUyu7HALHcM2OZRyNgUn21Tgm55K3y7hPx1Z9ghkOY/4XcCuVjDcZ23yqQ3Jf@vger.kernel.org
X-Gm-Message-State: AFuF++n7vvURYxJLYt+QlFjQmM+83c0MqXyJXBFhMc4KuTH3vVZBX8wz
	Sz5XwyPSh3JZGed7l+lcYwf166decMF+CrxkOLWlxamXqZQ6Q05NlWZOv+qj8h35lgLhLJEIyVI
	iqMGobzzsc7LNCipnB46CthNf0wdWedj+yhqCaQSlLlnzYRrE/JLncV76Ul8VodVBT/MX
X-Gm-Gg: AYBFou3elKvJcA231aymgjGkTo8TpkiEJeK2Z/lVr6duTV9sdhRhngp4HuKpAYm9ip4
	Bcmh9HToY8kHMBPaDWCYBgwPmggjk6k3rBX9/EK3/3Svd2HKAJwlU8XnQ+fR2sNkHgLrqSi9XXH
	L+3E1z0Aftu72/jOxKYKVEORexz7v+u6G6760Udc7zgizmEAn7gq+4zV3SPloNeHFosMSUdcvF0
	Mczn+xp0YslNs3Yih3boZuZ4MGNZUSAhRHWu+Am6g+VkicacyZvqltYR5DqEVqFyHKciOCUtNtj
	MZFSZs6YXMpAUBSaYtHXmJZpxIRRIolKt9y9AtNyMYIPV1DUu8otcO6dKiv0FbfmI1OH3AaJwWy
	3swAMfI6OUw98qzQK5UHAYMWRB6Udp6O/NrFB
X-Received: by 2002:a17:903:3c24:b0:2db:479a:5127 with SMTP id d9443c01a7336-2db479a55c8mr352995665ad.19.1789021251556;
        Wed, 09 Sep 2026 23:20:51 -0700 (PDT)
X-Received: by 2002:a17:903:3c24:b0:2db:479a:5127 with SMTP id d9443c01a7336-2db479a55c8mr352994935ad.19.1789021251041;
        Wed, 09 Sep 2026 23:20:51 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm54709946eec.30.2026.09.09.23.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:20:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 11:50:14 +0530
Subject: [PATCH v2 1/2] dt-bindings: soundwire: qcom: add
 qcom,shikra-soundwire compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra_soundwire_support-v2-1-f98c9a6ea1e1@oss.qualcomm.com>
References: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
In-Reply-To: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789021241; l=1210;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=UyWgn98oC86Ag7J/nHIo1FudYinUSljMSVGj4DXtPfU=;
 b=0xilDjFBxsdVGeNOVdonbjktJDRXI1p8o8P87zKqhQ3BL1MRfRpqIcESAoPrXomaLwLXuTaqj
 HHLDsgWuXmeAjuSP2dci8Pza+Rqzo7LdtekQgCeJepulA7RSH0m9moL
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfX6En8ogLEqkaM
 0VZljtqwmHsZhitiEqi5KAW9GU/yR7IC6s2Rv0CMltDRVKlZBsLs3qk7ivGAMM0naxOd8AXmMN4
 g59IfeJ2ILUjqvWb4+YLc1Yf/aC7OzQ=
X-Proofpoint-GUID: uYOBAh8W4Odn-4m6VnH_72gDxg06e2vD
X-Proofpoint-ORIG-GUID: uYOBAh8W4Odn-4m6VnH_72gDxg06e2vD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfX3zqjsx3DEUjD
 oF7GRtts4fXegU1btJPk6KEnMpGAIKaMs9QXxatOdqSHINMcgagRs0iCthfwOISovGjecg7eOgl
 bSUL3WbOahCZxhMCU3wtYbXbvSACNTiL+zDHvWCkS/6KOk7ZcEjtkv+ZIUllxd/rS0JeENKzIyV
 uW01nyNQ6KbLmEAKOR6OHSMXoZaoHDWmcXfN92nwMLHTWvqI0D9+Mqu0cEAj7p+3sw64ytHXg1v
 BNja+TyznBccljlT9HUfv8cRpQn/CuwhF9f2X27fxnc2hkhTIh9AF1xIQyDUvIS2vCZlIXkNVQF
 3JfZriyPs6CLfFByDyyyNGjuSrPBd87+i0B1M9lYdobx7X9n7XRR9YuVC8rhaX9n54auIZdGmJk
 qxmWGFxjntKeAACToJZBDaKomgi2X/cGnRzqbvkk76X9v7bPZPd5AwqevY6wFL/3Td5UKET77uy
 +jxNGjZKHvbNTy2csvQ==
X-Authority-Analysis: v=2.4 cv=Go/XaU1C c=1 sm=1 tr=0 ts=6aa24c44 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rFUVSjzCmDUomrWsWBIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100064

Add qcom,shikra-soundwire as a standalone compatible for the Shikra SoC
SoundWire controller.

On Shikra SoC, the SoundWire controller is assigned to an Execution
Environment (EE), which determines which banked register window must be
used for interrupt, FIFO, and status register access on SoundWire v2.0
and later hardware.

Add a dedicated qcom,shikra-soundwire compatible so the driver can select
the correct register layout for Shikra at probe time.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 8e6973fa2..81532cf69 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,shikra-soundwire
           - qcom,soundwire-v1.3.0
           - qcom,soundwire-v1.5.0
           - qcom,soundwire-v1.5.1

-- 
2.34.1

