Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C002246AA8F
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457659; cv=none; b=YgOXvtt51Rp/NvdYFmOs/JAIT5OkMOr5zHbXSfvfzIrDjjAs2qXxLptDrJ3PvAXKcBXVweEZruli9LlzcaVV/e6/4zlEL8fHALFvgmx4XN1IfQRIGMzdcwJpeO2rF3cjbfm41N2f7Ng92vcftw/f/bzDnTFB4MiC2dL4+c2Td3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457659; c=relaxed/simple;
	bh=IIOYvvyALTUG5OEiqhn5NfeJoZGdRah7bahBexEevB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F64LxqWEROZc0ilbGo+hLXNBqadSXyHU1WO1svn3Y4MMA+3V21X2zrrJs4flZiHaQ7+C3W1pI/dpP87StMWiG+gkrLyIumAMaKUTedmeR7AtnIvlIRpxujBKGmllNEXwkH/QQkD+gH4DmXJ/Fy0Y1/72w8kvY5dYhyoIEDgsuSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVkq+4Py; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UyqnE2RI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVkq+4Py";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UyqnE2RI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbMEE3129083
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 11:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CmKdk7qhbKZD0yxrnAv49ma5jpixmKgDnITWoYiUaeo=; b=VVkq+4PyiqgFNTNQ
	QSVrgaOx82iN4CJvoOTugfBp7ZkORDePaqXkq3lCNfEWmr07lfOFkBBin0SIHB4B
	Si3HIU+oY9W36w7U56bN03VoMfGPrXXkSuV7XD/yu6zoVwPd61k87LIAhBExWdsb
	EeqfKLkBm5CF8/T4XKEks+wrl1/fZUXc89Xn0fnBQtU+hHXUtfcKHlRlOgbeTedC
	7m1cMKVnxFqqVVfdyBtt5a2kz9TKZbrqXvgpXPBw3I87gdGgOUZYe29LXGVTA7h6
	3u3JmV77k+EeV3pBaKeETkyzip9zo8gar76agFbPeKKJ3GMgk14tVQQf/yuc8Um3
	6YQJUw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe42m8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 11:07:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so5961735a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 04:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457647; x=1792062447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CmKdk7qhbKZD0yxrnAv49ma5jpixmKgDnITWoYiUaeo=;
        b=UyqnE2RI7q6rEmRU4hrCvc+dZsUsnida36J4Ghh6sw958sPLGATgmV6lsUKeQcH3vc
         umIRDt2CJZ8R+8Sv6cXW93o7UDLv87vPZlEGT+7/38XVWtPWxiFEZzGXq3FwMW/3GC/u
         8+BI2sY2aOEi2ybDyDasQ/5pGbEcVtbBCshHZ/1PLins1VVrSgKJf4JnwfQggmmPSkgP
         4xYfkgVdDhAZBndlT/iWjNcRIql7jrCWmdbhuQuprXq3ulOutFMQ+LtZxFAy3i6KfKrN
         fUvt1cH4krITeybb6LBUBfAmZZSBK33PZmyZoJ11lmS4dd5PIYWA3gaBPv+tLUwNJq6X
         zlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457647; x=1792062447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CmKdk7qhbKZD0yxrnAv49ma5jpixmKgDnITWoYiUaeo=;
        b=d67SOBm9N+QAKdgYWitTpyKmwZylTKW2unGhihOnhSwUJkcVJmzURgX2qYdmA17gm6
         NZe97V8RPsBvK9WzM4tsDOj64yyHMCf9VhLkdozbyPOwlwkWV7uDWZdJ6iqiTa1R6M3A
         kAExVKsmS6zZOzbXxyLtp/aZQE2uyiz6nybzEQLvBuaHxTEudgS/vRi1m+C6tSWxuZFm
         Kcc0poeAG8nR/LpEyYsSF2AdW2qmXuk5Qpw11VcJYH1Wyzmyo5cwaSQIE9KxU+AcsFG+
         C5LL9jBEuvSvRKn8VBp2RkFpzIiw3J0+txMYDb155dst2gpostw3AdsKFVWubO/mv/Ud
         8nrA==
X-Forwarded-Encrypted: i=1; AKwUvBzrLhqsKDJ3D5zRB7i9dtUKJSYJ6hU+QOPshi6ifhf3UlFghIJA0a3lQJlBoaHGh9LYd3HXRgLl2DfdGjfa@vger.kernel.org
X-Gm-Message-State: AFuF++nfoI9FELUf2zrm+ojP2Zf9QgcjBMBUXJom9mWP6/ZNYAfksmco
	UcDnYhW0T+zfnstaUB0aI8b3TGQja4vLSCZ6D9JYUDTfAXBfeOuRDU8hdGv+Gb/kQoPLu20UG/e
	irezuNOVCPz1AKLErtbpbUzdDnhxhbvxtsQ9YzUfzkwig4Bi8Z9QL4iV2skfpl4q6eFDX
X-Gm-Gg: AYBFou0RLBRJdWGVKZj1u2jAxB956BXGMrH8rUQTRDjUEoGnpRbAingl/6QLhUa5baZ
	SsXo3QBdeg1KltGTg/IpfqhWrrMfpmCwRzsChJGiLtL507QjL+y6mm/miIWjA2/BvmvGCcctFXW
	2Kz2UZYyKc40oSno2xl7uVqzX9BUYsgPWFKtEwNGFzU95t4Hb2QlCAwFbrpBrmK3rTAQD8lJIza
	26kxGrRVuBJLfEDSk4ts40BoCYtq0cmzLypaQj6P9OZ2l9UlNJDKCPm7d1N1j5cxT178YlQ1CSS
	5ZHzdZOA4zdhmAVYkUun9qtjFjmRAfUnd7M9scyyWcdVvm1VFVaS1mIP6cMYZ5gct9UQZA24srJ
	ePp4IvIcaoKiUb/QRc8bHen2r1rQDBpe51GFr
X-Received: by 2002:a05:6a21:3990:b0:3dd:85aa:452c with SMTP id adf61e73a8af0-3e134044716mr4294481637.30.1791457647303;
        Thu, 08 Oct 2026 04:07:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:3990:b0:3dd:85aa:452c with SMTP id adf61e73a8af0-3e134044716mr4294453637.30.1791457646875;
        Thu, 08 Oct 2026 04:07:26 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892b560a21fsm1408917b3a.0.2026.10.08.04.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:07:26 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:36:44 +0530
Subject: [PATCH v2 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord sound card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-nord-asoc-driver-support-v2-v2-4-0b6f7e94060d@oss.qualcomm.com>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791457615; l=957;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=IIOYvvyALTUG5OEiqhn5NfeJoZGdRah7bahBexEevB0=;
 b=lMRtNXkMwmKTW5qGmC4AwfR+ZaCKriQdL7Qw8wmr5KDC8GawWLpjaWKcgMPLaAsT1rv/OHml2
 40nQt9hiXDVB1pa6auNbnoGY9z1Di8cITbPm8dBQwtpvVysxYCg9v0x
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: hdY32_IOVZP_c8ISBkJC8XSePO0776eQ
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac77970 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7YRCYCP2VF9Zukq8dE4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX42ZNEBTfWJjI
 +pkTgfFLCXvdbtuBLL7clE8i4GESpTmtW210MZw7hJq6o746aKMfMswnpaabaKx9U6f3sAa6fpX
 AAyqH8dgAgjBzE97cRLAl7GIVzc01po=
X-Proofpoint-ORIG-GUID: hdY32_IOVZP_c8ISBkJC8XSePO0776eQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX/1HuI/Bljzpw
 SLUdC0CX1JlxZNSF9VMh4RrVbSVTRmVpFP6I6O7ZCw3B2CweK8F/w5eEzh2WyEBmYZUhL+/KBgn
 UF0Esx/Rryur2cUrTc/jAJGObFKChcrO/h0TKE2HO3WIwHYJUNa0XSyzQuriwgHpYamfxyTSQJX
 WAeI5Hr8bC+viCLn6oK5DPaj8i8C5dpDWFKhUlimccUO3ZU1XpHl0vBof067AZ2VQDa3qeK8qrL
 fKlnKVCwKMgWeEeV13GnsHHnxDYr/yW5VIvydwnCMM5FQ3xwBI2K2p/xrIBR2/NFuMludU6bOnF
 Fzbz8/Dgc2M5qOhoOgBCK8Zikce+r3hF1/RG21BWhUWCQ4WfVBzd1y2bYsdAr/QdoR2JK0m41sF
 oASZcxj0AtSB3Z44+8cCCDkndGtbBGqNh2OIR1b7GdjQ18uBka+YRD1mq/+a8nsm0NtEwKn1rTP
 WPGzEP4Df7je8qxw5hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044

Document the bindings for the Qualcomm Nord sound card.

The bindings are the same as for other newer Qualcomm ADSP
sound cards, thus keep them in existing qcom,sm8250.yaml file.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index fc7bccdac..372919ff9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -38,6 +38,7 @@ properties:
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,glymur-sndcard
+          - qcom,nord-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs615-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.34.1

