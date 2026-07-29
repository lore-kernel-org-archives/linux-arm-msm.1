Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351FB3AAF7B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339606; cv=none; b=LRF4oJqSDNSDYZKkJ4KEspTxCHiX10GlOsno07nIuwbk4FnEAgouEAhS4PpHJGLEy1sOuv+XVs6qR2I7GFYbf4WYKTdv2+XHpotqM6A4+0dfhm+/W8XMqK+aF9yR39EH5NJnV7Wz8uQNYDwBU/t2McC8z7HS5EP8QrX7yX3pPSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339606; c=relaxed/simple;
	bh=sLEj0DEYQILFQbpEt2OYOUuE4ZC9Gnd/GDqKxRJFH8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIQl+LliotfL2+wmVO2p9/P4fef0K1sqz+YxL6GGoUVBZnseb8w5vYs/vo64G1r9kSG8PsTdWglD9tnPKyGrocafWu50EIK99C0NhzPmLgiAORUHdcyoIrQobRphkXGBd8wQVyYRgKBQpx1XWu3ZdIlgKh6q9vGEsg4Dk+mEJqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKhwwqCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMJI3q5e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKhwwqCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMJI3q5e"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2sU32397047
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9SBsJFrqume2aqb0uRjijPZX
	7OxNXfNL3XcOWC66BLQ=; b=CKhwwqCDKZI236HuzGNeh9kZ3G2DqnIE53P3GT13
	NC5kg0rUZr+Qt0SvyewEXRFLCJ6VMwws6573dGRCSJFrQNBB+TwyH9gAbZ9GftfI
	koK9699slV4Vxqmb7xCnefpWrQnI+5h89tMPuQl56AK6rOYYLhaXsP/xNE9nUYWU
	fyjUXryLbV8S+5XMHv8+9jDarnQRzGQptXItG4YYqd97KBM0f2FP7bV42FQJq3KF
	cfTCtha5TqbVwo3JTUhh0mS3vTGmbqIk/b38T7xX3QvErXms0GmVs5laam1tf9Dw
	4IV+i9T9un7j0WDkLbAVwHDCujKZ7j3tA6hF2TaypPr/7w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgr696nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:40:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so10606401cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785339603; x=1785944403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9SBsJFrqume2aqb0uRjijPZX7OxNXfNL3XcOWC66BLQ=;
        b=BMJI3q5exroxpjY3VxRxxmma6OXmYFMf+FrNPT2X2V3kEoMFuUHG591Xj0jd0kWSuR
         b13jY3qGAENVy2lxC+IfaDi58ZakGc8IQocq7AmrgkqOI3sjkwig20szNtNqciM+BrRy
         9pl1gevbjc3P9nSmbQAw+Ld0+Tw/eb3eTMCjxgme7BxlUd/x1S9oiC7Bx6O6+zP5CewR
         o/5EGeTyT60Ia4xjcAsvOWufO3B/dj0LfvesDonAB7SMFViKAqT40/xmp2SleUYc3gSH
         2c2m4ejOm+uMMxb6OgxtQe//UoZYhVAWhEvoX40d65NBTyEb8ZMG7NQu7cRf55OvtVu/
         m6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339603; x=1785944403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SBsJFrqume2aqb0uRjijPZX7OxNXfNL3XcOWC66BLQ=;
        b=iKW1VAi+H3mi85BxnCWEWNNN1wHzXBXt6jZ0JqDeti/Xw2Mw6g/TGRez+7d71cbCJR
         1Tngv7J77j7yQXE1Kegjf/5twNgudS4JbuH4aSJbMxk73lgpJ2/SxDyj7hex0Qqgd2wF
         VnpAkVEJEQoyhCjl1pwkENAp90vOGNc73F0kbign4vzZMDjv4yRN7Q00Jm45zzhhjcuW
         qbNf4WKnQvo8MLDqmKpk5A/KP9R2pE0mWemskRrf3ORvwncrDvljZKaYmwFPj7FM64J1
         c4fTQG6EEStvNIaSDr+zP5kCDgw3ZAxhaPhklSwYe7sxRV3fLKdQxdmq39VBg6yAC/g8
         j/XQ==
X-Forwarded-Encrypted: i=1; AHgh+RoU7rZ/NKAvfHzba4bFx4qyAes8gWpUYNposGwh7+W6ub6K7e0EGWwAlBfVnMfxZ0fKm4s4XFoKnrfnE6mn@vger.kernel.org
X-Gm-Message-State: AOJu0YypNeb76aH6mBvbc2KbknGTOeJ1XeTourC1nNZf4H0+l3aemrQG
	EAbZJ5Vwx+RN/gjABRWWnHnR+2I2D0IDcXJ32rZUwf9KKN1+zERLnMY6kyVazW7T8HNKmxyBpKW
	SvSHSDS9lbvyZNRmqOkncQtf2OTJAYTMfmWNIG+1C/k5jgjtuKm8KyrevkygmOJlDVtjj
X-Gm-Gg: AR+sD13XC9lBvT5sWmlYwUVgZIwELyvLuaQUfngHzBw9Eg2fRlf7Vo1HX4dNgQtEbJt
	7kTiw4VKK10+K25+tCyFWsKpn2pUEFNx5GCTM1zEn2vIWtBxUxmEDHu8UKVv8yB3mh9Wh6tWF9n
	bnFCXpwBCZmnYLkx3eR51wk+/5+zzu3Ii4q6me2Lb8BYp/D6eYI9db2z3Gaw37A4BQkOoNci6zl
	UVUi8Lr/Z9KM57c0GQcjFBgxg6GP4p1oyoTS63JPO5dlk5evG9RQpYdeLoiJhkblNX4ivK6M9cZ
	ObXz9999zxqcZ4S8Bez90Ao68L/ILPz27tM2XpMPBKoAVvFbG2eyOtP6apzd2UwybblT1153xRK
	JdeKQhBtpe/9kG6U=
X-Received: by 2002:a05:622a:180a:b0:51c:1bb9:137f with SMTP id d75a77b69052e-529d6fea697mr63643261cf.24.1785339603067;
        Wed, 29 Jul 2026 08:40:03 -0700 (PDT)
X-Received: by 2002:a05:622a:180a:b0:51c:1bb9:137f with SMTP id d75a77b69052e-529d6fea697mr63641991cf.24.1785339601365;
        Wed, 29 Jul 2026 08:40:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45c297dsm157031645e9.7.2026.07.29.08.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:40:00 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:39:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
Message-ID: <vznsfyt3pxlz5p656r7yeuglky7qlquv5yl2r36aby6jwidluy@b2xujn7o5i33>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
 <20260728-topic-usb4phy-v2-4-5d9dd5149ec7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-topic-usb4phy-v2-4-5d9dd5149ec7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX1b8i8/r/fra1
 NiWHybRU06lGL77TGjKMYmTrQLaP92QS2sK/QM7G3EcEETbhlcY5FpjBMaB6kz7zTQCkf/XVNCA
 G3NGAEUradaLVztld32yCRLDWEXAZtZKQquErnQdxP4OdNPJklUcTA8DSewtEArUUmG3kevwa+7
 +uROCxM4ltZ8Ce/ccl+20aw2Pa+pkZiCeIOGzGAeQt8pasV1up9YhKs9X0fFVUChmy7R1XiywWJ
 Fou9VCdQ7m2fjQhCb2lZ7c1omXUEUlcrVNBfkIHGIHlJKYqeStM67qaftLT84ecfiiHWKMngti8
 3kcStjGhpJfHeT8KX3oya1f8u3xxIlOCyRxTBIYrxFErq2ahYsGp5dbtCcqsScROkLzVPBz4I+u
 RbwQnRkvvvjyN/0k5VXn4lAIJHLTQodwZkr0zb0hySwrRGCeUxWInKBzUuhOOiC71UeZOF58IlQ
 Id/bKZRuYuSsEOe948g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX2wmCJMSgY2Xa
 9x8O0EoLFouf7QF7FW1XmIxJKivYBX2AZJ6Q9VyaGVQEV1jbnvkSQE+xCxtlB+uWfX7yQ7qPCzM
 gINK8Wman2x8sKULxLrITaLenwbMap8=
X-Authority-Analysis: v=2.4 cv=Cv2PtH4D c=1 sm=1 tr=0 ts=6a6a1ed4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UsAkPbjk_MlyJrJ9_ZwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: NH0cgvCweOQOE54xK6fUiaBvaMBbkLJt
X-Proofpoint-GUID: NH0cgvCweOQOE54xK6fUiaBvaMBbkLJt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290125

On 26-07-28 12:10:15, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add the offsets and configuration tables to support USB4 and
> Thunderbolt 3 operation on the USB4-capable PHYs found on Hamoa chips.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
