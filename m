Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201332;
	b=pvICh/uwNELdhobRysgU66kNcV20fQprxitYfiiQLcR3LplVCFj2NAOoXZBowvkNgDW2
	 6NgOx+3RBOD9jsR4wzlN4hOnfyemO/SM5VIbIuCOP9heyjSD5g99UfdKYGt8wX/j0WszJ
	 +f+v6exn9PTWbTnlrnEHBEAc6BBSC/8JoZ9nCYy6IVIBIp5q9H0W+Y80tgFgnoJY3o7DY
	 nPf2kTOCFA6qmXemKBbNMQapd9RXZHm9B4HK3LcJFoJSUvIqxzEWFWJvp2CsL6BAU/HqD
	 RF+97P7qOgUsTi+aZY53imbL+fi0NNiJFAS/aS7CDDOqYowzXRF+V+X/m77dFB6q2tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vt+LWj4JTxLvmvfKCHSS+whi9VdAbkeinOtI411OZBc=;
	b=YDc2KvVaB1XSuCBa45W044nwRAGfDsEWXPsO+JKDx7B22Xo2ehXllfaxU6HHgBIP1Dk1
	 LllvFfaqvIdO9XWtZJ5ZtADgxcgkt2IW04oE14rlwjDWtnY1dW0rXoqG3zQ8aHlNiH9MB
	 GtSvyANVLvqngVJ5SjUbVNFuRKHDsTjeYkJzqyLAt12h6isvDmwMRH2ow2BP9BtELzI7B
	 9kb89EYhCSLaN+E+M0Lw/mIskbH7PQH0FVqEmF7sbz+c6tKpkKcBCGfOWt4BF3XSkIVC4
	 H8SjsexmDHQCt3n65ci0urfm3K5ouKoMtla9RH/fh5cWXM8R2UAcqxIcJJtmuuWAszw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lS1rxH4g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYCADI2V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE169606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE169606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lS1rxH4g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYCADI2V
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA0xO2542999
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vt+LWj4JTxLvmvfKCHSS+whi
	9VdAbkeinOtI411OZBc=; b=lS1rxH4gd8sa+mABPrYZM2XB4BKBJaRx5545SSpY
	9qvU8eTk8yRkisoa1vBwzUjS0DKYUC7ZbPmdW+U8oK/Jtwb20aV7bSGtI9NafViI
	hNoq4YalpC4qqgl8Va6coTYBmm0Z6hEPAG0ONkQOAuNzqsT/rcolJqvLb7ywJ0qV
	hYiReKE+glOqBl4W7Es6wpIKly6Y4Mh72klLHAKizGWjvBFrYTDBQyTln8Tbqst3
	7VVSVkKxy7afwQHsfICjmeMe38Lx2zI+js8MJhWWWCtuh/9oviygJRE0UyRXFBhk
	6lukfQp5woYMvlfh/6YmO6REeQensQ64ifs9mVYzoLJvFA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehr33f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:28:51 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so280946241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201330; x=1793806130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vt+LWj4JTxLvmvfKCHSS+whi9VdAbkeinOtI411OZBc=;
        b=MYCADI2VqnH6blFMNO8Ahn2dr3fg59JUDBOe464BsrzKo+xwCsFR2y9OyBrq+Z+uAx
         dGL+UqvvSymPUJm6DulHh4mrycNLlUwPb0eNgnerQs21duxhQJwLBE2rZkQ/rTWbhTxh
         yEEHdbtzyuuMv/jzKCGXIY5ciHFJ2c3ovdzBzIwnqwwFwtZ6Wcc7Tbcnjcf7Ys2Dv/0K
         osYX6G8sft3auJuPXsbrtWpBJFCiv+XO9qfgoWoFYRulIRTBKa6oak76r1QfUhfKSZwg
         v5wzPkVgfY4T1Q6O4V5MI1LniM2Tz6wHlH4V1GjzYjsSxLw3Y0TR6cTvDMyjF6yw7sC0
         2A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201330; x=1793806130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vt+LWj4JTxLvmvfKCHSS+whi9VdAbkeinOtI411OZBc=;
        b=KJW8cPZTP28PFBZOQFOpwzVsnv01qC9GmkBEiJo+xQWXO86C8j4fyqxQIYHpYMA9zR
         77LTGcjisaGD3zJoqfd6iEtrjpxPiQ2/hD7KyC2OSi42IHsge5J6SKSYI1Ja+Jxr0Ilm
         JxXx8FUmRNQpC1ZH3AmjOGA0Dj68d1VW0lxRM1YuplecqxCgna5GClxKwMfN2QayPqrN
         UPgUbNd8soVuW9cmSARlMjzT6YDqzV3hGNlcoHoZcU7VrkVc55xtkeqOJYtgwKhWE73U
         PbKeNj9YwH32JeH0zYIDECylpjIvnO7iQB+xjkHhT0YxKU2EOqufkY51e2vL0a1fweQP
         iasg==
X-Forwarded-Encrypted: i=1; AKwUvByH1LXjBMPYPGf9CxO6g5IBJvx2SGfuFBvDaWEgerdY5C9RpbKdvVz4CJTmAxi/vlC6eDdwuC/Asqp5AM9u@vger.kernel.org
X-Gm-Message-State: AFq9FYI3zl1+uxPKTgBt61m4Rz2QYPgAmnkdBu20c8FW1RyeqcRRvUL3
	FwefpseTMyQo2lUjrv3giCei7upAoAsTkubm9ElisPUdPOEMuQvbc3NupesRpU1ZxHoUH+PI2OR
	Dp+9rm7wzIzl2qOo83en1I4FXRBvyxo0icTwSWc0PwUSWVExvSLB+j2ikOs0E/MX6SVUd
X-Gm-Gg: AYBFou0cZLyA8P+lkgvDFxXEOHZh2naKUN9dVuiuYaYedzDPupITaOqfDmgRaAQm7Qa
	rVCWOb270PAF6Q1FbYVRcYYFUFKTBNeKm5zB+lD9Nz97DDThPV3dmAD1Jeea4d5FbsnNBYq1W9O
	EfA3FVX2CvzOX3t/7fN/PzJpdFVwToMx/JyFTZdl676MJP3tr9aGJw6jO1E4Cw3XBtQL46eFFbp
	OASl9cGTXKtv0VYVqVusfOKI8G0H6nrSmC6t0VASZXxrWE2Ge3jjpo4TOqexRsip0KSjNMhW62J
	hvL5F8XItnSVDgOHwSIzGhbyJZQ6YpxU4M6lvmXc2Vjm3IFAkM0Kq0eqycLE7owEHt4f1dafPKg
	K99cipsgZsCCPMgm3rn6h4N0tZvvdodbv1xxtJ7cpohbmefYB9gkWgK2wMXkFc+OmFg==
X-Received: by 2002:a05:6102:3ed4:b0:7cc:285d:4df8 with SMTP id ada2fe7eead31-7d03a574a3cmr1443062137.12.1793201329894;
        Wed, 28 Oct 2026 08:28:49 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed4:b0:7cc:285d:4df8 with SMTP id ada2fe7eead31-7d03a574a3cmr1443045137.12.1793201329366;
        Wed, 28 Oct 2026 08:28:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm27880107f8f.55.2026.10.28.08.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:28:48 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:28:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v23 13/15] arm64: dts: qcom: kaanapali: Add CCI
 controller nodes
Message-ID: <qnxjvwd7phkvxe2gft53i5utnddjfkjyljvisx5wfd2epqh774@4jxv7jqlubs3>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-13-95f250b18612@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-kaanapali-camss-v23-13-95f250b18612@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sallfMHKEZ4bqRplO3fh-r2yJXClne6e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX2v7QXdQd0hdu
 8hx4X+2PXKb50IJ99aqPUyB+xC67GGVMpbDmr1c7Pgx+aVdvhx6cVPMKRwOhM1xH2YXPKpqOrYE
 W0SGoc0iuDxTzIiT+A2fWVTm24rx9TrB/ee0BZKc1JJecQJxRWWH18fnzJoI8DIq25eOVOCB0RO
 FrBbgNDpGinUcqYgjCbI8tY6kMtsPMry0cEi+ISqgjmV0r9dPtXz5NusEhAcT1rW7ivjaoXDeOk
 6Tz7Lypc4YC/Vw+igIPQwjkJKOdoKubRmJTHAK+9MKkhSm0RdYb/M07+XdCZ6Z03ANm1FGjKU9+
 T+/uJVvzJwBZi5eIqpiiKrSAi1Hl7aM2GEGDYtiMcpdZ6sNebnc6zFoa/IzCf8rqY7Tg6pdR3fY
 a5vgAbXhnkqY9nI5YFIsZUFis0+c0QHniKKYq/JSK2mDjijLuzsBusqMYkmt0ltFIlJcyujgRyS
 VlessCUMlxlZCasaVJA==
X-Proofpoint-GUID: sallfMHKEZ4bqRplO3fh-r2yJXClne6e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX56iMvODxLSIq
 MfaL8fbse+LnMqK8Wsdmrbo80nkj+AJQAA8W5jzG2jjXQI1pktbZqt960utCnpDGDPuQ7kaVnnW
 2h7rOtedGyyGj3BxD4ryw5uT3Ogq4DE=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae214b3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ew9RC34E4BSkZ0FC_vUA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:47, Hangxiang Ma wrote:
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.
> 
> The first bus has two CCI bus master pinouts:
> cci_i2c_sda0 = gpio109
> cci_i2c_scl0 = gpio110
> 
> cci_i2c_sda1 = gpio111
> cci_i2c_scl1 = gpio112
> 
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda3 = gpio113
> cci_i2c_scl3 = gpio114
> 
> cci_i2c_sda4 = gpio107
> cci_i2c_scl4 = gpio160
> 
> The third bus has two CCI bus master pinouts:
> cci_i2c_sda5 = gpio108
> cci_i2c_scl5 = gpio149
> 
> cci_i2c_sda6 = gpio115
> cci_i2c_scl6 = gpio116
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
