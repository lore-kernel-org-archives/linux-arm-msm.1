Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7566A3ABD8F
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889061; cv=none; b=hu35VKUIkkE8ejrZ5PN/85PPAdyh3AL3XzWrp6cZL18xT01uDhjoh2aabegABrBXZ47KkJKw11F1EzHK5vF+i2vI070Fwo1GkjYrp6Whr/Oh3isHoD+aABYeIB3prWe9rGcahRO/Yd3KRvct4vZkUss1KVS7MYopIqSzVb1D4Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889061; c=relaxed/simple;
	bh=taHT/FWrTTmTNXum4aFu4vc3zEZd97waKqjHUDl8gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNjAzbXTWXjMRrzF4ZBIO35udcfazef9MAnJRNBDF+cMJb80+AJ9qmbGEZckyKyUo58HqfFhH5XaOE05TMAUV6xT7pZnLRC4Lreng7GrRwaTtuOSqgY7mwzBSsmNVv+hw/AA9rfJR7qGCOL5/NRJI2zuFMlsZXDIu4qtAo58ctw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfXbXjLB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9+AF2+J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfXbXjLB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9+AF2+J"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S3Jx231811912
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=euO68b8p5f2
	lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=; b=HfXbXjLBQshQXz+sWpgbSt5CBy+
	nWvpdQt2vf6TqXkMgRKydXcK+lsJpRfD/77ydiR9RpFY6bnw/mWNdcGFuxdtM/zn
	70J2Ld1MNsQXUGh8Mk4DMA3OPRWJbbSzNEsa5YsvcUtl38pizj9VJUeutB+YHcj/
	/IQJlVIdf/PNlaSj19H0dxrbkc8bJoo8kZEljZhgwkypA+KI++Wzk+HiCjke2GWR
	LvS7MHiktn5sjRgDcKFERJ0iYDefY02cDPlPuirYf+4OgF3hpopIHh+6YJDG5dp3
	Gmr7yMrO+jX7cxfsiw5ee/GiKvek+pmRPJIO1PhadpqDaSYz6cvd2W+MZXg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garee2wsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:50:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d02df2bf09so5964355ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 20:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787889054; x=1788493854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=W9+AF2+JFcNRqsqG391aZwjjtq8nPJ8dFIGEXFAlL4ZtAhGmH4ehnyCIiPvaLFr+fY
         mckMzr91Di94eNJUzYI32O5SfRK7vSNJhMuVzyq1YTnjD3lTyVhOrozv6HpBcBGoB3ZU
         /0fG++i8/4xG1BW0gqX0JgKjZmj/gr4RyRaEDjfs/ThY3oxBmRXlrpQoBS2MQ6e3P+zO
         hqX28nnz3COA2j5+fbdaLVMD8ZKov5oX71V/ZX5OPcvpbbFuwLM50KbtDzjAjks2QnWJ
         ozQ4x2WHa4xmpikHgQgW9yyREaSqDtK9siN56e6rbIVDzS4kYnCZum3nj6FPZ2Rrx4Jm
         AkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889054; x=1788493854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=EUnjj4xnQ6kTjE782SCW9vfpADIZhmKZUr+r6iIDQAX+GZWn3rYGlQYjJt4wzuNbJu
         hnk2HBhqDUxl5ovPgvNZNqQNMoHlzpkPdDEZJ5wUDy4ECWdvUcwhyRUv5TzvaDRl0yxa
         TKntqWg5jXTQgyB8jYj4T7XJOSXrFmtzEVYEvU6xDZjPXZw8VpSM4fNHTMC0SCBGvkzW
         Yo4eZAgFlSd9IK4DM3VCju1i+pXYIaGDF1peARr74MnOJlP/cCP5i++ZSaTw+r3ZmpL/
         /VLl1t3OLaKFqYUfxNnIXNDBB8GsW44k4Nw+bCj4ANYM5DqRl0zUdJb5xyogrJEHWmie
         e+Gw==
X-Forwarded-Encrypted: i=1; AHgh+RoDpEyX5oZPT/ekQUz/9sObG2hX1ybdC19Psp0hT457hmpNYhrdBwqpNbd4PNBtK4Q/uf+ClLEU8WHb3/Iu@vger.kernel.org
X-Gm-Message-State: AFuF++m5DyAayvjdY0i4oQQz4X4WDL6eP53AoE2b2Ej6k4GyeUPUogA5
	hr44bn0Vd5a78qCW93W5bwpBuAEE7f56Mh/V/Cwwot4eONjiuL3Oj84/vSzs92XH3rcfMkL7uP9
	ZYKI8i4h4PEAn96xj9FV1kFI07PyONEkgthexcYSrODBd1sKTZvpAzJpTQtM+gSpvmvkS
X-Gm-Gg: AR+sD13Moab6HofGxSkdAag5LGGvZUUc+qs19Yp95wR1dJ7cLJsJTQMt1trKvLmE1Zl
	7TsR1wUVhP4ny+sNQYFRAEBVKldmg36Jt5Ex9aP9SyCjUQ3RJGZGPMGL/Bymh7/YC5Z85zCq6sX
	bhMwMwIWHZjTtENV8mFuqCi9CChz6ZYrokSjjBzfIJrr8eq1vlgbclAk41r4KIFOvAbGw8fL6/v
	zOxXORvwrFm+iUQ1AS18QBtinGLYD8DRu86F00KzUW36oBnQhhBqi0sso0FEBoIC6t6dCKVYAu3
	OlumvEbTFp779Kj6hEEdWGjGMLbBStYbQR4gUNUG+37OwLFq+kE4pwhlfEWUN7W+Fp0T57oILvw
	+xgvT2lthSUZHwCbrND7oHbmnrEIlWzkTQ8J99zztTSku28KX8q/Fw4BQAb94
X-Received: by 2002:a17:903:40cf:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d74dc6e884mr74007665ad.6.1787889054459;
        Thu, 27 Aug 2026 20:50:54 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d74dc6e884mr74006905ad.6.1787889053979;
        Thu, 27 Aug 2026 20:50:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm1133357eec.22.2026.08.27.20.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:50:53 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v13 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Fri, 28 Aug 2026 11:49:56 +0800
Message-ID: <20260828034958.3165-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfXyGNXI0WjmUMt
 yKcJNCQ7JOaTKGgFMN7rB/mZcjXoZMFw/BuJ2neEuSOzOsVktUsc9IcZMp4c+Di0dhBAo4X4cJy
 xvHhSz/L7e3zSXwM+MvPQHcFk5Wg/Rf6QhFexL8RHdZtWKe7MUt4w1XzPWZRJJSs6uvecvNIzjg
 KWaOtadOAiIo2qsB+GpUoDQhbr+izApdWqjDJaHYIxg++oV9qhALdMnBAhdO4phL29GgEyQQq4p
 wDBzEOtZjv3/tq9ifwOvDyj0SU1+2mxddRfaLixSF1IFHfFoF4Dcw1HYjh33RMymG5fszuh/rdP
 AQXgrr/+viEALu710Z0XEKeZypYCuoBm9FB3Om6VEvvZeNZsfA3W3FdoJNkCFQTxxju2qDB4HbI
 LueQzPFQXsLjkmJ6P3QI4fuxVlairE+693527lzMQYIb5oQGb7YeieI3Bim2myEgEslDUws7HB7
 eVx9Gmx8KgGWzJWXjHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfXxFaq1oqqBNCc
 Epar7Iyo6FhmIkJuHwVphZ+vQDgVVSg+4cOTIO/shWr6E9HMqEyFpf5npS48Iw/YkXrdJhK1mMZ
 YOnoUUedORLyq+4lzq9xZCEG2xqXB6k=
X-Proofpoint-ORIG-GUID: DKeLnb2pNOG6IIxELi1V8-vE_3Efq-7d
X-Proofpoint-GUID: DKeLnb2pNOG6IIxELi1V8-vE_3Efq-7d
X-Authority-Analysis: v=2.4 cv=e8E2j6p/ c=1 sm=1 tr=0 ts=6a91059f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280029

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..198314ddaa84 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -402,6 +402,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

