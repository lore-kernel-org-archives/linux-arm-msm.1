Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4AE427A1F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889576; cv=none; b=BFb+xK0bUGvTPX/OEKDfrdWYgjP9m2n/+e9nCzPiURh32d1njhlJN+/V8sexp6YHHImU+aXRKTCZY0/UQqoupbYfgPFBS+6a7zra0J07g5H1G2azZhp4oQv8O4a+72uw7gZhADvfKQaS9KmW13JUALUeOsf3vSrZta1z2qQI5JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889576; c=relaxed/simple;
	bh=A+5TRK9EGz9fRh7GbcDS+rgwOlXWbnjXZFW1ALyzjTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ik63pAjs44w2EdLQmwfzvd1zI4lKKZVYuU86UY07CvBQgQuS4EbJVVILrWiZfrnRvQ1vrHeqLkX3FkbaHmKnUaRme7ptqeHyeRlJJpkyhZ3SQzIL1EqkaA4gwIV+bWVsg+i+POxQ6INwSI/ATpQsNxlWvozQHwn8d+JrQDh1p7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGCzD5Br; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dH2S4nCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGCzD5Br";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dH2S4nCC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADaML3889401
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FKM8mzcDPeP
	brNMyncwZRP5amm3MqElucl2ZBJ9iPr8=; b=JGCzD5Br+5X+EDBTTTZM2xfo7lX
	Qa07ac9cxKNKVRAraRsAz7b+Zvd7MKOSObOVwnRrXY6TgeymZKHcv2x70b2d9wjI
	WoU0frIJbbTh5q0oMWF5/gpAl/NyNQ4b6FimwUPSk81gwsEY21kp6WZ14Ipf6IH4
	TSZHoS9VNBU2vyVnYYA26FcVKpMcMw8lRHypc8hyfCTII/gjgWCzjnR0H/nfvlro
	x9A3LpaL5oLMmKFi5LiCjMG54HrI16/EYkGt+FC0iVeE/M8BsSWxbXQaNxN/v9qQ
	5bYoFdPgYPADa/QgO/oaygR2y6q/ZNaLPwY27HDs+rjYPp85Rc/3YBpss3g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5f688hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:39:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb733fc5024so473356a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889568; x=1785494368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=dH2S4nCCXumeT8Xx3CTxtV5uh29BFHD+B5vsc+rV9MPrk8bFh9JjaJxunBwXXgPKkC
         mYuNyP3ElNsKu9/P/KNLQyEzNXRrHuHNuAzXmuQIN7jLNfuHIMI6G14fQgX3OAmCnTxe
         cPEvdOY1QS6poHLVqfxIOm4T3RSRyPibBS/ebD9zmzdzIfu77I2bjTGaUCV+TCbgIhIE
         kN73um/8PIWGyQae4N/kPAOna4ve0sI77k6Om6v2Vf06h6yqK9Abltptk/Hh7vWvIURY
         HSp1x9WMxcXVHduakdnZsRH4F8oGNisaPvGOtVTaDGDOac/WZXqhgOo+Lpyn3gefD5cy
         b+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889568; x=1785494368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=PWCXdkQyDmX/Y1OKFOQ2mNRtvTH51mD8FVEViHl78hBSwMkxTflOZiBqvFdUWGMC8+
         w0Sujf7/HZBpEqIxCGbyH7zIz4ocizQtmFUsCyjvi2ptldkK2FlzrxxAealN6RD9GjyK
         0F9g8wtJLf/ZdXivmXo0MhFp4H57rN42ndpA6X21TgRa/EjHfNNj7RIrpgS+F3uG0WmJ
         I/PfJgbS6L9XmokgRz0qWC/sD4RSnRKCCYMQTDjYjSK8hXL1T3xLBy0Qw6U+XousRPB0
         oXg04WVW8+ppyrRHOzGLLm2Uu5PYrVC/J7NQP+Y3phVFJSxQdKS0R+lr9f5paGpL9dG3
         fqww==
X-Forwarded-Encrypted: i=1; AHgh+RqEE6g0unsd357pO8bwhHJOeGOgHwQVBaA5F+WSYbm1/8HHZk3yaMHj035PURdJ++vzAsifc3P7dVRzDmUT@vger.kernel.org
X-Gm-Message-State: AOJu0YxOK8slyWJULGGoHQ+50YyU24t22uNQz4uDtyo5+drj6vZFJ1X1
	drGllv0SfEQYFpYfTRXIUmDVpeavJS0bKRvbpuAFDi9LSpT6zo+65ff2FK3Fq2iwPNP3/BvBBFY
	ATS/KBmB11kHk6YY5tYdAeLHu6KNATlT8vSlOszYsA96mq5JaT7UFLGTf+Q6ST084dYCV
X-Gm-Gg: AR+sD109jD2Bn3qf4HiFMgo9BGZHFIWArC+yB63Y/8Fb13qJhIWlMcusvKc6iSNi6f0
	dP+Rhakd9dQW+oOw3olpAHRuSSgdWNpzPD1Ilj15n/sqSTR6WuWj9L07u5UYYfNRf0bjKgevNqo
	EUJceJhK948QXwse2zv6dkWZ53ggETJF7MaMQU0t1b/0okSHbJYaupHVElT9BoYoD336ntnVSZR
	79q1+jL0ruSRvtAumQ1OdzlRkiEJwLNRAZ5zV+mHEVMfKU9HpvBAsw/+mTwD7J1gvJyOzdpzVLe
	iGK25ywAGFMOdxqb0cJVZKUDvl8KGFjzRInGNEeu2hW1Hc1UDMuHtrcD0onldu2sFYGGXgGMaMT
	8g9jnwtvtB5TObSSlFGOLGwbaDVYg81RKIwvW5GNhQSMayWzwrLQHR1JpOaNV
X-Received: by 2002:a05:6a21:3994:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3c44b1c86bcmr7905256637.44.1784889567681;
        Fri, 24 Jul 2026 03:39:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:3994:b0:3c3:bd32:4587 with SMTP id adf61e73a8af0-3c44b1c86bcmr7905219637.44.1784889567200;
        Fri, 24 Jul 2026 03:39:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm22495290c88.7.2026.07.24.03.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:39:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
Date: Fri, 24 Jul 2026 18:38:46 +0800
Message-ID: <20260724103848.233804-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
References: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfXx1Nn657rq2q8
 9+G2KVvWTE22dJtQpHCDIttYcH5B2GdHaR0vn1UbQy/BGPuafFzspQdZWpWNzwOZADF87v8XVDd
 3krTAj6hR5sWquQmy/iJ9U8p2XoSDu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX+jkK5gImeLpK
 BQJQ0kcrsWeUJPAARn/blY/fxi5BxBLpGf0DbH8AFcZR29LoB4ekzKZH5hwpZzXdY69GMTaGCVg
 iPpL8hKyLS9ljvVdm/UKSju3Kedg7yY0B/+aSUeGMSEQsALu+8SwTZjOu1+eI7T6ni0UseMdSch
 Il1Oojm9Mfc4PIVamL+SNJ35QhqHFok/iEvXOBj05dKRqkHwJbwnEEfuQaRoOotYy/mMszPQ9i9
 jgmpHuNzZwfiIGYPYGWj+F4TzTyWsAQXXlekWwJFMBUpZ3/gIn010PKbUPxfpvpcs5OM8kUNC7W
 z4AM6ifKl2lzNU8XeXso7HbYNqaRZwDmfF1jW57IReK4jy5523rVU/LxhwrF5K0GyT5VxLS3Qg3
 tvDdyRxD5GeFDjT19pRuDnjCYbfEC0JqQlveSJ9nX8yGMDyz1c+64+IMAwWJOz2hqz4T7RyKPBS
 oLAb1ol1vpz5mEf+72g==
X-Proofpoint-GUID: YpJUn1XYBoRCxSdABvvOY6lYqaU0tmIZ
X-Authority-Analysis: v=2.4 cv=BNeDalQG c=1 sm=1 tr=0 ts=6a6340e0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ubaIkse6WMRjXItqsd4A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: YpJUn1XYBoRCxSdABvvOY6lYqaU0tmIZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240096

Document Always-on Subsystem side channel on Qualcomm Nord SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 9f9d9bcb66c4..d2ae2ae87a95 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,kaanapali-aoss-qmp
           - qcom,maili-aoss-qmp
           - qcom,milos-aoss-qmp
+          - qcom,nord-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp
-- 
2.43.0

