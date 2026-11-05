Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877092;
	b=hRWgf4GWi1nvgdUdGteM72R5hQHQ0uRsRzgKropcWEEtPGk5gbg/AwIcxXq/b5fXVMqz
	 H+CcAPDFyC7+AttJUpVXllLrcEeKBi2gl5MDlrcKMc1GZycQnW6Aru24iaQhpJGiIctUH
	 RtosegBSQxED4Gq2yo6Ke9485D0akZF5ffXnjf9d30sH6y7oNcJolDvADaa9tL1JiKZ8+
	 GFeQpxK1cDY6dtrbiMGz7ivi+N6qA4KL6mPoDqtsNGU1fR+hHd/RLb2xFpFZGCsdZR8qc
	 cohaPXs/IzcicJKuVw4047e9VGjaSEUWS6auj9JHQmCTkfPb2noHQafVFajjctlQycQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=;
	b=OswAs6a5JT32LRoVJXeh6Nxo5T4HodbJ0HpZmXKdblKxVYppl9Uv6SRxDARbUrwIWw1Q
	 6J+OGZifdOlhyGWcn6twqG3YuLrs4lXV4EO3k+oNpxH8N/WEAl2iGBqgrBTVRpHsIMUUa
	 wLzr1v6JfFsfOxTIkkH3HTQCjipIEkpxdjGPQBJoUvC1nW4SiV6fzDDh4Y7sIFwAf5z6P
	 7XzRSmr29VjrIxdDh6UoXg2ou1weu0cKDG7IG3SzXk7DtZCkgL47JJPh3Wchb+u7B7Ky4
	 rU88tiiuoa7vwz95SZgS9KpOUUFgazV5uuqN2qS2SJehFnawkeDfFG/GLnPosUKzfyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LYU1q7hb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Pu5/zBxq";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B04606D80B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 11:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07B04606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LYU1q7hb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pu5/zBxq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5B3LD63193493
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 11:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=; b=LYU1q7hbol6nweMa
	Ih+LCLM9IifmB1k2NsdvECh0fURO1VTVJjDP5AK+c/gK7HEJ4yiJTAaAPN/plh2P
	QrPOsRrcJe9COmdca/D1hIKYGd3Z079lJ3OiUY+cYfj959SoHzONhU5sVOh+0dJp
	xsoTXxAxUrNpj8vvidFcdztPuNz+WiG5spcfmI9ZAe3pHUhdcIsI56g+gYpaESUv
	26IkDz84sZKCTvDHBaq3Ew6rcr98fYIokAuI8QgRIKFZBN6n0XK/7GUpyT8b+lEr
	FTzDDb3UcuFNAz3kLe6t75xhBMM6LcX1tR5p5pu33AQkJx0EOtp/QjyYo+z0xOzr
	KT75GQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdr11e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 11:11:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbf2fd504so343173485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 03:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877090; x=1794481890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=;
        b=Pu5/zBxqOnIOalaVvNSMdbrbDaydtUbiKphzoTewxLHsbhIHb8ad8e21d3sCVLWKk5
         1HUkaNYw3QARi9X3GJDRFLVLQrpWAmDlPc738RHVEG/2nHJDm7SdTpn971d9RG7GkpqQ
         iO9sIDCplNt1ZU1cTFdI5sOxamkJm83p2K6gm2RTDXqWrUuHHi9ZrEMaeIz+zbxpO6ZD
         OYDiPjT5zjp/+rkC0pqntOgwl8fsOfxg/Yl2ki9PBvO/wVOzBjEtaVefJXIWY8XxDrlf
         OHdv4lgZIRMe3kCmyVC3ZvRVokNlv79YTxscEtzKOvgL5f6dcMy84XXzqM9jvFaon6AQ
         NJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877090; x=1794481890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tx4N7P1fRkn5Ta3AZs9XVGYEyxqCt48WpsxBKXnWKvg=;
        b=i6blsYDSjjtIByV31i0cuvWsZY2tA4ZwkODV1O5N8/Cu78M+LOIhzPO6XNUHLhClWt
         9U5wiNVXEpvDg2VXAQxNaPj1U+hIKqXfJvSdnQUN+WL2dFB6yqv3UM4GLj57gQ+IJY8J
         eRQdmj2OFediZq4uiIHrFEMt9AFBqpqX4i+ldwzZAZjre70z5/gOeDvp1zFNEaO6BRcP
         n6x3Z/+YqVu89baUVxSpiodP9i5UqhvHpPSqEx/kYIQBzSekPqaU8YkZXnv9oUxNsvC/
         WXWVZrvrdD55s8qWuab6xZqVQutDGVTeiKXp3r/MtEIFAxf4ISL4lxBjPd20LOPjwAlp
         3tiw==
X-Forwarded-Encrypted: i=1; AKwUvBzZWZTHG/Lrqly4FhryGVIOG11jAaHvE3qKYMqyAjdKCjzBQ98XmvHv/vt3bbU91OuYxO4aL7apaphNt/tH@vger.kernel.org
X-Gm-Message-State: APuU4Z+fWM4Up0xJZP5ypOa318p5a4YNDTebsx6lmX/3i37vDvDx7aQk
	4xtVS2czyOHUV5FQBtglG1QJTV9Y7K5MMlh7cVs/NYDon/bHMiYv209MwInMYKjpl+Z4yagMrEV
	PH5J0qnI4AOXdrRaDqMavJHp16FU0zZ0N578DNFFJJ/rL48J0qk4LhUrxAXBcanzY2eMB
X-Gm-Gg: AYBFou0DyxL2vETYCEY0uz/VjplMKtEy3BoLjJy1yrngNFDyoCywybOMoFVMWcwN3k8
	/DyfD8Mg+u8VrTOGJZ1WvOYINaAJ1AJeW34E+XWPFWhpNGkM/5eL6G026mG/HdFuuOI35oFiK8L
	WlWHBovaSbaHxbPXIGCakQ4BcR1Li8E2Ej1i0g4RNA02AIW1g77ESriQXuIVTaqfxoMkSAKdTps
	Lwm0OkR+5zwjgbhesjRZkle3tAQy6NX6mejb6KAm0CETY3AN/uPiMiixhiyLdfEKKhwoyXS/xiV
	qskvmMyY1wSl4IAU+xmCPNpk/lEEdQYYjfi8vr+Ek5ab4ISVXWMv64huRr5hywOgfCfMpCqSKVD
	SCPgonYEZL+C6IOQeIPUTulbybOiNXlz9PvDCFr8fmkmQDC3rs0miJTZwk0gpPJxPl7Q6B0h7Os
	cwDbiGaFQykO9cbGILAM6aTR7i6UNbbnMgXWGNOhPY
X-Received: by 2002:a05:620a:8806:b0:93e:4d74:68fd with SMTP id af79cd13be357-944217b2aeamr3041639785a.65.1793877090356;
        Thu, 05 Nov 2026 03:11:30 -0800 (PST)
X-Received: by 2002:a05:620a:8806:b0:93e:4d74:68fd with SMTP id af79cd13be357-944217b2aeamr3041633985a.65.1793877089727;
        Thu, 05 Nov 2026 03:11:29 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm438320685a.39.2026.11.05.03.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:26 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 19:10:59 +0800
Subject: [PATCH RFC 1/3] dt-bindings: mfd: syscon: Add Qualcomm Nord Titan
 CAM_TOP
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
Message-Id: <20261105-ccu-v1-1-3accc4b901de@oss.qualcomm.com>
References: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
In-Reply-To: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, vikram.sharma@oss.qualcomm.com,
        nihal.gupta@oss.qualcomm.com, vtumati@quicinc.com,
        bryan.odonoghue@linaro.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877074; l=1095;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=Q3m2L70QHVhNFssz0d5iHd//KrXi34EuQb4Z/fjKNc0=;
 b=tJUyjpuxFIMXk3yVPv7pWbYsQQMLXi4d1roL6jwFr09gpB77pcSfkPDrM+jz0MMUgdXX+mAHI
 GAZHn2d/ZbYCRjZPtKEwPdztrnqtMsEyEjk98aw5f7HWCUbeyTDslPo
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec6463 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eQjVoD_657R47FWD1NwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: IvF9bptab7kp6lzixhHhnJsldWKD3hm5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX5ZLsV8PtqEeL
 3iEAW40lM2vKvfZcvqJLAJVlf1dv2fKQ0zdpdOvQWnbWxuj4IRjVlUSRaI65XejPnZsRZ2yQRDv
 4sELTnW7skUxqBaG5Hikb/bOBJExJkE=
X-Proofpoint-GUID: IvF9bptab7kp6lzixhHhnJsldWKD3hm5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX9gdk9j4TorBt
 h6vRxF0KTHpSkYsOUEadeFbsQeZA57nZ5oDiz+gD2NihRu2X4twjAT+AhfJkvtGUq1SQ5GieVWc
 cf1ZrRm8IB42ihinQB13SzhEAQ3YD4fJ0RQ+1cZl4qv89SkMznAlXHWDBpkT7DaSWWzGY0THGSI
 PxKRoozdLvlfwW+cNl6cZQoPtkTHKAX0bV8OQX/mEtfe9jgsPZ7zEw+3kHPV+kxkFHr3PIhd8/3
 z1QoAYxkizUOJuqhSlQAKve9dNiYXCdkJ3SbdCzqFOxv46AN+nGJDpkdy3lXoWTHEva4I0iVf5s
 pX6+YwhLrdiWcLbqbRCU7b9ovPgVqVHjnL6XWajpKPH4MP6kJp8gQvCLSZvh65zxAtG1WrogtdY
 iHKIFQypZr2BDgjgURbIcVge+hZfh/R4dKJYCsfLh4kYKhjwjnM2HJ9xs4QKxGKInADcbADBtft
 NzMyqvrmfHZ3LUDRsKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050043

The CAM_TOP block in the Nord Titan camera subsystem contains
registers shared by several camera blocks, including the CCU output
mux used to route the CCI I2C ports.

The block is outside of the CCI and CAMSS register ranges, so describe
it as a syscon for its users to reference.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1caca224d8dc7d8a0243acc49c253cccea..077c4037fa0ce4f1b93927579c2c326e7bed73d4 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -109,6 +109,7 @@ properties:
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
               - qcom,msm8960-sps-sic
+              - qcom,nord-titan-cam-top
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos

-- 
2.34.1

