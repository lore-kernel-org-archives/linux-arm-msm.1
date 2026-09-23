Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272B648642C
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159286; cv=none; b=gCl6q54oa4bgjadBRWoVlEMY+SFnGsxEMmdRw8KG0q7qYd8vsdeTNG3HBrtOt4M8Q+SKnvxKRJQBnkVwtKqi0LgXb/Fxqh0Fy1V1yIi/OcsNuWt6B2HLPYTeC7dNsEEA9c9Prn9tGHQIsnqTA7MzM2vZU4vCTt/xCYuIPI2FLyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159286; c=relaxed/simple;
	bh=3yrd9iaxk6WVgzH/+KegTwiSgLsdXLNTrYaYCjHpfy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arKlciXC/tg3PDB4Zj4ZR7i2cZV93/ebSOB7NPSRDWfbJQgDQoF0dry3nNBXr4f6eA5NWKxPdf1hpn4TayP0xfW2zaw/z4joERE3WQ/3zqwN8PLoHJNAYNN04L5Rfrg/8/fe4J77d7sWuue/J+HvOwozLjFp1ZmB7VoiJAgNbiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZReutKyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAC3g4Oi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZReutKyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAC3g4Oi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA31BV3936290
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RfrblhWfxf8VQ4VzE4Aa8JWdUn1BoSPKxiuXBWBY+60=; b=ZReutKyw0lRObdNO
	Mze2c9GJtqxQzOBe2R/l4aA/EYI4Kyqv6oTBQ5eRHwX9ibTeDbQGIZM+T13NiqBO
	hN44wtkFLdByky2siUYWSjFGMrFWGdzh1kFThelFe6Xp2SpRiIA7K1PQVpq2tek5
	5wLmBDib2htNu5u8WzkHQMJlZlCqcf84dmUuistLTW2cbpPJ8C7asYxAzcY8GMZ7
	FGjhVdHAUQcH2Km3Cut3sJhKy72/ozetajp1gIHNpH3OmXLNWNMJD7CNkUUnguMw
	Sh+93MHhTipFnscy+Act6UAfgXZHt0DORG7erx/kT0yPTmd3+BGKR/sEidhGAasV
	EU3Ogw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428t89h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-333543ac378so873241eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159268; x=1790764068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfrblhWfxf8VQ4VzE4Aa8JWdUn1BoSPKxiuXBWBY+60=;
        b=WAC3g4OizamdjY9ur3FpHX4+DWUmKZTXDg6fP/fSfLknCesE0xT24Q8MWw2bZ8llBB
         ve/thFMldzN1tq/oVRx+uoFbaaNLuMFiPJ7IXjlWFoTfgDrumdohkwUI2g3NAW9xtvBC
         lXlhj9a+aYAFFoCMsxYTInD7sEfN/8H5/V696BPyqpoZBhGC4DJ5kTQgqd9JIe3pRXE1
         rwYkJ4JnTW6/2D9mXZ87rcy3Gy1urAo0PHIty/bteTf52FNwn//dkr9Q/ioo+P611LvE
         KoOFZ9DAylI+OX6nIAwc8at3vskEmY1qJ7hJbfLPSIMvFNUui2sizGrOiqWvtxKySog8
         SKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159268; x=1790764068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RfrblhWfxf8VQ4VzE4Aa8JWdUn1BoSPKxiuXBWBY+60=;
        b=RU73QYH8JSu2N0vljuYolEcb9VWKJaDBCdq16FvxxWaJOi1ntG1qZwNLQFA7kWl5dw
         1RZzgFjCDuD9gIQmbj1MDsxTlvIMfcirSdLCkzI/um3LFG5a4UPPOzzZPcrHV5mIewjh
         IxoQAS3W0+l9qnnfA7uYJvYSfbOnMhBgk8HkW3P+0HZaXiLyTZb8D3PawH2jy6hTXa0Z
         gojgffAb5DsYg0eQt6ZF8NnM/q71iYmKTzcz3Nig2oaQ6PVUqD1tpXh5xqgQ1HuB/q8+
         FZrRHrzD+CnZ0ssZHMPYObqtfg7NOfEwcqo9IXrlNCjex/ah1v7fwtNDHRgk14USFSQR
         qqEA==
X-Forwarded-Encrypted: i=1; AKwUvBwEQXazbBiIWio8rNI0yFdQUSYZLcdg7y66fk5duotEMsv0BrLLqUs4wbj7ZLfKd8svL8+arHqQqCpXF2A9@vger.kernel.org
X-Gm-Message-State: AFuF++ne3vfRw+2Wjp+2dOdZIB1NGwUYqpde7zz0Z+V708x9litQEj++
	idXyYJ0Fqo9eQnLeYp+vGf0Sw40klO45x5SiVBKKywVoU2C4h0x6qbJGNbrIt8pDv9wajcOXw++
	DIsLgpNB6JCWYTgC6xwLQQ9Xs59d4BS8TmBqSqVPvnZptmXoil5Lpg+M1YN97yIGLaevb
X-Gm-Gg: AYBFou3uZiICj3GeLX9K682IpetyVBKjRGop0dCKsYD71J5YequoGbd1SwzNXoB37dD
	NEAcron9qsV+1DuRy4iYtqkNvMT4inkPrkXgJHiA02frMtuO6keAedGRgP/ylg2l5Wd3ZSd76d+
	CDhfURHc29V0sFc8aBagO4cr0F0X042auDZL11+M6T/X0dXE+aa8q6sJtO6uFD1HQ0JFvntydnP
	TDNX44hWJbEHW8k7UbYJOlphLc+YDK1YB+jzhudmRU7CqjgqflqmsJYdh+9qn83JswusJ3JSgN4
	1zDDX0tmXxXeOByRsrrUaxjjkYNuyUjs6saYgz1eEavRgOh+ufbCuihnaXJysMCfpLIuIcFtb7o
	9hxV8Yxv6XHP3mqlVUCEv9VA=
X-Received: by 2002:a05:7022:294:20b0:143:74ca:e825 with SMTP id a92af1059eb24-144f917e79cmr2282764c88.41.1790159267690;
        Wed, 23 Sep 2026 03:27:47 -0700 (PDT)
X-Received: by 2002:a05:7022:294:20b0:143:74ca:e825 with SMTP id a92af1059eb24-144f917e79cmr2282721c88.41.1790159267103;
        Wed, 23 Sep 2026 03:27:47 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:27:46 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:53 +0530
Subject: [PATCH 13/15] arm64: dts: qcom: hawi-mtp: Enable GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-13-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=743;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=3yrd9iaxk6WVgzH/+KegTwiSgLsdXLNTrYaYCjHpfy0=;
 b=z4IzWM19ZUzLaZsn01beUUV5IsAfP11dYgwYL6oOn1vBBwSz35w4MLJQ/iB/mjHrPSK/jyyCJ
 G2prA8e0ZtkBodOLVAY7mww720d3ehtoNhURELlFqkd/C7FKsGeqVNq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3a9a4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fF9zt-HNKniO5dK11HgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Lix9bRMJB4mETITIgla8xwcP7NBz0C4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfXy5TmBSxa4dGa
 WNOF0lNY9LLbpGSVVFjLSEWIg4wSUHIQSH6sNyVlDwmyVudggnOBEhMYfC8+6Xni2cGkM/W9i50
 b/Pp8LUmzrskUMWqE4jDIwG6bvwtGLZtIMPpMExkW2OVNsszZclZqtfBe1WwRNgM2g3SjjhCv+e
 msMrNa/B1kHLGFEjJ4FQpZ6jF0Og9za9JNdsCd2KmAfD74O9NH3mT95lh4Eyog6CEhm3dzWqpzz
 dX0OUcXYcNwcrWu/kPVYrfpNBNLtBFlbU3yAA0aFl4YC1nGWRhnLMoA7F34dOTdCcEtQSjwnyS0
 zMs80WAO+C18Vc9Niqpdd1SzU9O2b3uQnXlFUz5N7y8nKkLt6/cSe6quw2iTuFi2tcaYLMhG1EZ
 PzSc0V9U+DeiBVFn2adhzwkeUAuv2BIATjxn3bAOeIMpaEyHVEE23EDuv3rVDL9/3UPJCi5lulj
 5N9j7Mzd5GoDqLevBnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX8r/GgA7X4zTX
 eqamE0NHp0jE5ymz/bPvV349YuZW2p4Yivhe8uI2Jj/blThi2s8rzQ6w7RV8g3xwdnkhie5decU
 KIj5OmbTD3ei4NrvIrFWvp4PTZ8/Blk=
X-Proofpoint-GUID: Lix9bRMJB4mETITIgla8xwcP7NBz0C4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230041

Add the secure firmware name property and enable GPU support on
Hawi MTP device.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 7709582491f9..ee4b36f2bbad 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -781,6 +781,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/hawi/gen81100_zap.mbn";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.55.0

