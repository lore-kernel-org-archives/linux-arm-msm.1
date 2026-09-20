Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE62E3E5A22
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 08:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894203; cv=none; b=P7ZDWZdIdCAcPwAs97czrC06AChgkKhuq4E2Aa2qt2Qt+2d7JlX/KLgJd7/gVweZobmLl8S6wjpHuZJizBv0RzMUXH6IXFMrUMu355H7NIqynG1nE541wMRHqFkjriiefwnBYH2vhcEPYLeTYGiOe+NRz9Uhlj+jvMJUt2G/UEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894203; c=relaxed/simple;
	bh=yQoh4B3TH/uFnMoxO5cD/A9qDqZzEegxSBACB5gc4Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRrlvpnysFT4GLoDHOJ+9f1OnbqcsDt+6nOwzE47VErOuM3rPyMOHoAP2AlFm5oMkJ5UCAitHvZ07DAuHEsDJ8gXTwmrEOuL8mWEwrFmwFLTL2Jf7SbLzRPpp2U8OdfKRKDPJnhbr0gU4R7oU35T1S9S7Xjlf7V/I5RPay87VeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0s2ntfd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmmUB9Oe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0s2ntfd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MmmUB9Oe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VOhM1175249
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 08:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kod6a/x8RN7
	WalgHXkb0Q64ON5/9kdjSXWThu1ze+jU=; b=f0s2ntfdhpYrztm1M8tc+HRyYgH
	kz21ZPCTw4SXolNiE5B81DNM6lfTeUA2oqnnq8WzRmbeoG8ykxLh4KFT3axcUuwt
	fsgEbGy+CLpU8RbcFziUDbcs4rISgyqilfUwc06gLrwU7eBvQQOoR4KRh9YEEpum
	HJHoDdU4uI5XmVsOxAYo4m3CrDklE0u98oMOEYESGcYMzCbpyXsLDEkUQUeFDKJw
	i5px1QNUxmGT37oCGdBWlugSuW4bLAunO+YDc3jNYQtgZvPucGo1HweaQQKVTCA5
	czwW13ch72Z/tje5jH8v9Qg05fKcFGkTmCcXL30LMDXODSKvsy9c9CKgwCA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9tfj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 08:50:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94f086fedso31354565ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 01:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789894200; x=1790499000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kod6a/x8RN7WalgHXkb0Q64ON5/9kdjSXWThu1ze+jU=;
        b=MmmUB9OeJM1w0duzfEMvWP5OTK2rr2HbpJ6GHr+Vb8dKc+vAVVmiFBY57mjkuhUQPm
         WbJKPUvFMt/n+kjtz+clIE6x1m6V8BSP5M5xhLTdWVS9OC1H2cgFy7pfm7bbFlqcDTFX
         kQUoqDe6X4j/tQ3gqyyvBVXvZhjMi+zZZHUXX2eaiKBaZ55s7UTSJKK9zxFaVXBKAVO0
         neW9y/21khNeEoP426srcrjuHRDaHXq0yUVFTOiBE5NZe/YJ0dupjIEf71c8b60r196h
         gH7xgwqmfJgjVCwb88CkfatRJpfwS4fQSe4NeS6qu5DC0rqqofnUCEfZ72ne6kblocLg
         vDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894200; x=1790499000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kod6a/x8RN7WalgHXkb0Q64ON5/9kdjSXWThu1ze+jU=;
        b=dD0vF/vFFhaxraH88lG0do8p3wGplfvMTSWN25lCzF9aD+vkuSE7fGhfqJboFUyIQl
         re5vOARuVxsAlRY0LuWGLr8ExrEHgpIMnXuSqY+XSzdJs9JmK7KZWKI2Ak2kAKWhA8U2
         tOfnRSmyQxS6Yda+1ewWFtYsYYAUWeQ5HeXXq7EXchEq/wMwJQvY7ZSjv42OEq+FDd1D
         UHYvRvhHr9TdG3lnoj6fAacvOpqHzOp/HmwYTIkHK8qIiAhyMuelaOdKDgfdX0S6PRwf
         56xGMciGRcdaPCWzcYLIAAZEJKTGeW4xw4Vonplq/99E6f4ymUekFbZXgvbk10yyh5bt
         uytQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKuMx+M7yHsWDKoJrpTYY7wlB1RoJDchEJgJEC8FfdIBXM1CBm4HwYFXupR1kTXZfFSsd1SQkD0KVZYW8e@vger.kernel.org
X-Gm-Message-State: AFuF++lPx5Z9yOWZ+d2VbhnQJLeXCCne/G+7qS4hl8Dx+kQSeOsxDiwh
	E9Evsbgh9CCPmfcPLnpcOOSr7jdqxw6R5fSnmSE0BrVTzCpnnKST0+a8QwovLOrKPWI5zIyx7PS
	YZErU+GoEnLstduAe75WpOhz0AKjt7IoAFRtHLJNFmzxWCbiGsqaAyjVXUqn7txSTRr0oS/2jeH
	EHR18=
X-Gm-Gg: AYBFou0gZvoDBePLD81nYygZxsH4X9QLx7A9gtO6xInwPbgUzsWRRoahE9BxpEvipI5
	L7MvzLuYKE+Dbi9qvjEpkPvGhXimEXUn79SSuYWrPf0/JTupRuj2jhiRpD6NcHpAwkX6HqMQR42
	P4YgrcI+VgCDOEm8kVO4IA2foDv620qTzCU3LaUqoa1ElsmFlzCWZKfLnobDAwefibvFCucLy36
	DxTDMNLRzE5U7unDX/21tVN5a9VGdCpC82IKiKR/JyT7hVmCgJ1rgOiWBXXMNE95z9orNRSBy60
	ABKcUxLAB+hC13vZTMKasThlXYgfb+PTEATZlSUncJFelLx3+Xg5ZV0Z7V5/3hc1zCyRfsO0brU
	QT0DlC53s2wyu2Em4yTIDCx7QJNHjASkweyRB3b8rfwDj+CoHz7nE1ymc+DjO
X-Received: by 2002:a17:903:b10:b0:2dd:c053:ec6d with SMTP id d9443c01a7336-2ddc0540974mr56657965ad.32.1789894200478;
        Sun, 20 Sep 2026 01:50:00 -0700 (PDT)
X-Received: by 2002:a17:903:b10:b0:2dd:c053:ec6d with SMTP id d9443c01a7336-2ddc0540974mr56657495ad.32.1789894199649;
        Sun, 20 Sep 2026 01:49:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm11180808eec.14.2026.09.20.01.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:49:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 5/6] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Sun, 20 Sep 2026 16:49:19 +0800
Message-ID: <20260920084920.2201418-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aXNoaA02KbC7RIRfJyi78vus5vRe19z5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX1/TzCQuI+Rmq
 RRpMVuGScxCSCPbeBKmLLlyXrQl/xM2uKzUTaerS2Dnfv2Wjr/Dbx9GwBa3LK23ArLKkOFTBH8U
 YWkOugiAfVDKNUmFp6QnxfyZ8ICbDcdP76MFkGNwchPkLfTQhsl7QV9SfhdWy0oIlyoJPO+MIsf
 N6CndFfjkSrYm3zFD0LsMFbFO9lb77x7xW+vJonq3oZ8WWKi1mfX8/te2/yh4Z1a+7G50cx8f9+
 sgUiW31Kmiky1YsS8+W5KMv43mfMDy9502F1DceJQ3J3pHmMMqT5Rx8Te2q0Zk5bN6jBEtew9HA
 /VhK1SYog5H953qJLzXd8bOEcrWwKiBHBJM8nvFwCSQnW7Ql7bLpPZwIgNfA7dQY5hm/44C73XC
 ccj/touvvctlo2DHJ1i/S7hkSkJmTWzHiFdPHkFF9Cb42pHtDqXENFCDPT6WcU859j1EcB0kZAR
 hHdHtt/2Tb1R2ZZTmxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX5TGqMV1+AMgY
 0aHJaIPX+K/zQURVxt3YBg5pmljwa9xUEph1XDk/+BlYSe+W4+kbGmxblkcb7XBv/KP6egU3K2c
 JbB8m/AWIGxiEc0z9p+ae9fbPBjyxdI=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6aaf9e39 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=O22JRHuKkM2UMjjIyrMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: aXNoaA02KbC7RIRfJyi78vus5vRe19z5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200126

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Document qcom,sa8797p-ride-embedded, the Embedded variant of the Nord
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f93027caddb4..07ce0fab5ea9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -413,6 +413,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

