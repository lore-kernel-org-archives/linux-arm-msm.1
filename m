Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE263C09EC
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230225; cv=none; b=duyQmKJBTXTekB5lPQM7U7VIBbJ4IrdaMjg/qY/rWl0CDrTS7ak+ajsJLzo38NGAi7HUNS7oGjbzQkS13fEQBc6kSJwOPu/PAutLSOHJAtIg7TaQUjtWWqTtfPfmoBgeBAng92ziOU0T9qVdhQeiQ+4vGPszQNtpuX9wdq1rXyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230225; c=relaxed/simple;
	bh=NzsD4QcajZOVRH4NV4GO2obUNyWXJF0JtcZuLN8XyqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JkagFigjrMXzouwRhk6K5V9q26EOs7cLMaReM9Dgv1Kzl9Syq6l95LY+stn2Tv+6USOB/lsQt/BZHWvEVR8FEuBKNilfyVByr88axrWKbhBF54xtAiNmhGWrXJ0irxyi4mJh9wfYyKdgzEzNSt1gYGqRbcxX+00z//55MVRyooE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0NbT0FZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4Xx6sSb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0NbT0FZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4Xx6sSb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eIjJ582379
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=; b=S0NbT0FZIxcuhKot
	HDtBPzTEh4ryyTu4nJ6JZRXC2cku5E3yg4ow69g55l5WYr/a4l7p5szRhVfOrnPT
	L4GIJwkx18Ubf2ALsDP5oCF/hvgfAtuWGnW4u1NZueL78mzJBbf2DZ/9NiDNrjMf
	6ZttFXCUYyNbCfal57g/13A8PVBVpaDY6jNxmyZRrHT5kGR/CIIEXX0cf145cqv3
	9UF3vzp55UkcjYqaGseD122LfGqGX2o27/9mrVnCR4LtR+EwEA8wz0GoUcv/C+lg
	zAO0r0ErFftHetMlYJWY5mOs9sNMKBZmev3JwFDjxMX+N+gdYLWpzUJ1jysWcu81
	DU/5Ew==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwkhrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:10:22 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1416f32fe11so2379045c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 23:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790230222; x=1790835022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=I4Xx6sSbNYee5Is/4CVTiopl8JXUSSXAwwCL0ByhCvD5+kqcWiylnfylojdhxb7MVt
         ZfLZwTdQffCjGr59mfZ/VGqZDJRVhAciXALJ7QPpFgMkLp9ysi0yWP6VEaBiZYndjz7S
         AM6+6Pp9ym35jWcOdCY+GJvQomr515o+IaoamVIqmJYN5JssCLtEHnencoZgqL99bPYJ
         tm8hzg4NeH15EyzcEGSYsErqHl2my6iGvKuoZuoWEW1HE+g21qU6Ghw4TFYfWIU9oNDg
         xzlgXQXGOQAsZRaPN3VWCkSHVXnsNDNMKd/zBBw3srF+f6pwfVjxoui79gkB9SkgBLFV
         4gZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230222; x=1790835022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=Ik/nNSj20ifUkHj0fqOTIjav1mE69MCr0RMV5twYJiBWdCfEssH3FYeVbWxHccv6tB
         zyniPeVFMMPC9FMvEeKt4NQqatO6ESeows7vvbL+2VPNF2FCPL4V5HyobdiRLQKysptp
         tuGN4T1clP37Wt3FLGSRQruC+KbqrgSnkZtv+9BdOUusFwl1K1PKnhajZpMUFLst1CV3
         74lcbWqJn6puvpS/RWUu4r49l9PsnyGVGT3a4APSVk1pu58V4gSTwFIqm6wY2+G/uTgf
         LQW/U0Cok/I6r4AhN5e41VubO86A/6PnkMb4fIUA7dfZE/nRvuUpjLTvQM+V7npg44H0
         JStw==
X-Gm-Message-State: AFuF++kTsAgT2D0jLvBigQa2aDMk4IFa6b5oMCMLD0IRMLhyO3AFhpLw
	5q2199A2WMlXynF1pJH40CIjFGSKnjI0xJVJ6GvWOyBIyXeDfKgDW5GNG3/hDwM7q2vwqsJ39J1
	SV/N1HVAz2qg8jltXE/G6eMQTRuKifa/1xevlE4fRi+rJOVPkD+xpJ/zJ3gQspRU/7woaeqBb/C
	3y
X-Gm-Gg: AYBFou16BTWyS8+1cemm3bqh947Mn/uxMnGIN9a1hzhV/RSEQSIKrW6qphotDXYPhqm
	gGIQt1CEM/unPa6f1drP9Ukfa4Yo8OcPxm47EuJuhYvuwxnhFj2/7ZBlKPV+rwOuv7Fczakdbg5
	WtBZ+6UppuA2aJgk84xwkBXIW8H14Uiltsj/ZqiXuBSD9jO9YymxKkl0GQz7MfTspEgbVvlxu9I
	XvB2lTQyu0l7Shr4tsrLk//rjhk2mhYaWyvLRZE2jwonQIc1udWZbr0rXkBW85GsGMQkD1g2UKU
	DKgPWKBzTbMun1ax/pFuNSDFTEST2MQdSNfZ6fxwwwJVbz8cfHhOH9ifHyzlig4lf6lSxAwWJMM
	DAVesMSARF0rZx+CP8jjYWDNnx6Jju7W4+hpsUJvvt3cAx61e6JH+Zw4BHWvJT6pri4LZMcLAGK
	gdZy4wn11IW42bKxJTeKump7YfFGXa
X-Received: by 2002:a05:7022:3c86:b0:143:31ea:ebc2 with SMTP id a92af1059eb24-14503fc189bmr1068103c88.6.1790230221804;
        Wed, 23 Sep 2026 23:10:21 -0700 (PDT)
X-Received: by 2002:a05:7022:3c86:b0:143:31ea:ebc2 with SMTP id a92af1059eb24-14503fc189bmr1068063c88.6.1790230221207;
        Wed, 23 Sep 2026 23:10:21 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9895c1asm10197680c88.12.2026.09.23.23.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:10:20 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:40:02 +0530
Subject: [PATCH v3 1/5] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3
 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-phy-v3-1-088e7be0cfaa@oss.qualcomm.com>
References: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
In-Reply-To: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX01baKeojZFwk
 Ew+yIMj+ESdmH/jbqHjODPEeITQDTVLoRcQJG+L6JvgnmwwKW5vOYa8FG0CrEMlVfySfEXVsGLZ
 z8/NCajCJfIjsh0JEO8IT4su6ZQg3NLp/ZjZfhNyvgJHaDBjJT218TKOxHRkI4fXZ27En3d+6Gu
 YJHgpOP9q0CWIC11DhcAXfBRpofJyU79bI245DZFgTKsh1SbplmnIZQKMYM6x9GzxvVDbUe5AVO
 NTbKuBqyePP5B9I+AFXebPc96p1q4IWLOQkvOXuPFWTA6SCFmY8GLtV0Gzr5kkztzV4nwfbyCBb
 VSL59TnXrLhfZS+0gWPwsjTPs9Tpsei4QTYMuKD1fBGFit6fQnURQu8mqre+TYwLa5+eojMT64i
 /rpwnm31Dew1VGy84AjUtDeNbNkwcQRgk6JAwP33kmxmdmB//zaGtaONCGBo7Z/Fw3cBpCZBNZR
 dqF83BewFthky2Xa4mQ==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab4bece cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX84qZ2t6YcsIR
 PQHtwfJiLcUGExoEcooqEhEOoz79WLFsXequiOEApxX7K+I/nDCOEs/lTmyDv4Jj5FlIEO0vxv3
 SaosGlbongaqVAxpjpauBah/nOgxDbQ=
X-Proofpoint-ORIG-GUID: 4Nai6Om1TWIYH6T0dhEpeEGjG99OvQWw
X-Proofpoint-GUID: 4Nai6Om1TWIYH6T0dhEpeEGjG99OvQWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240026

Document the Qualcomm IPQ9650 USB3 QMP PHY compatible.

Use a standalone compatible because the IPQ9650 PHY has register
configuration data that differs from the currently supported SoCs and
should not fall back to an existing definition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 01342823e57f..746c5a331f48 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
@@ -102,6 +103,7 @@ allOf:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy

-- 
2.34.1

