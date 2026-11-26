Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702411;
	b=EqWUYTrUaZPK5sTjm7mvVsRKQBwlLCc6KJXe5kbPU2KyTxDdtfc2mmCpky2KTrXXdv8j
	 jWVO1zgZ4feI92ny+89209j3i16ZjR6b86b4iMPonMn4d2azOVgM5Q4O+dUFCESEIIA/8
	 PF9OE7R6TF4nRBAm103na/8erJLKiPvb7+lyl5O015L5UrA5ldueF/+1105A8ph6NPhtn
	 gHze/vVF27xx4AHLbj5EYUOoKKI0Nt81t4rUw/qkEN3C6oUDJOBjD7Py9OIIq8GLQKbEC
	 INBcuzA1xqL9GaXu/4DmQgjPknmHm0Lcc5Yw8CLNMDGrzSX85b07h2eRQ8lqczssDkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FDJ82FHg+x9YvhW2dNbSMIILPOdbryVsdHA8c0swgyo=;
	b=n9YyYfoI1v+tmxJd9nWGwhjnPzrQ2Skjtg4EX6Vr5iO5JuMwCygwfQuH+7AF6yqW2Kq8
	 wnfLFjvqfnmy+cvW57oO8k1x3B1a2ySaqMyMqJxchRldivK+bY+UPh2TwyDybCf/IhXcR
	 G+olv9Cd5oDwhzA4NILneqZ72LkDPOxbxYwnR4aGsnnSgwA01RIgkHwOUi2XIMxY8MFHo
	 8RR0GC3ihhIgbGwOeKj4nn7JblY8vfDfclbZ07YLXzeslAX/lf1kHFcqz8Mq6j1KxQB52
	 ydaVUqrXSo9XdgocF0KSyTS5KLc/uteUQSbQDO/wRsQQia0BgSMXm5Uoy5RlBXEtrlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLBp88Yd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCgDalJN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDBF606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DDBF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLBp88Yd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCgDalJN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVc4E1275558
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDJ82FHg+x9YvhW2dNbSMIILPOdbryVsdHA8c0swgyo=; b=WLBp88Yd9Isb5HNV
	zaYDUPM66mu8uNKM6YbWhBtBapSGaI2FXbduLvTu04xJ9QoS1N/lLDryZG2C1RrP
	KQBB/olxf/kIxdYTSUbfsUTJuG3r97vjf12ToVD9m3aBbkC2zM4+qpbVd6Wb4zRU
	JIpWu/MaWjQemL9VsDnywAxFs5HJ7H5FghFPC0QqxMxw4gjeLxAq6uaEEjBZcb2r
	bijegpEiX0WWMdaY2rwmiO9jYHL77wLRF8iJzbUn2j0lwsOamXzedr4Gg6Jaio8g
	qS4pm+6gYH1enz3KNJM+sTPwhQW0If3/fX+r+KUKZDAcFMC/Y8nhC+lNrXgJzGtw
	2A5s3A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7sjv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:13:30 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5edc82ecc78so287668e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702409; x=1796307209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDJ82FHg+x9YvhW2dNbSMIILPOdbryVsdHA8c0swgyo=;
        b=FCgDalJNra04DywnziuQbzamN8YoxLVkyHADsHFf2O2xjvnDNbY3qu+NNY0Vga4nbv
         mXTy/F9+hoSVn7Fc+wUxBUGjIglaoy3kA5oBO2jXnTLYluQCnW8MJnujbsYVgTLHuwzW
         hbbt08673beaNFnFc/qR/128WKfs8nnW9NoZ5i1XVrRHS1YDatiNVQPmk3dcCTXzioxg
         tzEBviOQzCZkDPB0y8+LOUyD6tbBl4UjN34DghMWYw2aPLT74TS7iiuQYxdpB0L0im24
         itFC7erYx1Cc/kZECbPhUUWmUVePQ1PCMNwdMG5TOpeuQVf866Z8mZRgjntLkSgR/si6
         8drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702409; x=1796307209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDJ82FHg+x9YvhW2dNbSMIILPOdbryVsdHA8c0swgyo=;
        b=tRja/zrB1EDVcRHY2u05OWt814PZaVARjgj7ep4Y3jFpfIuL6DdwXiuk6jx0RGLdRp
         9I4JbeaBNroKG0trKLSbjSreo7UAGM8AUlzDU/fRGSf1sDOzR2yAPNzOSOOrFuaVSeLR
         0IUDE+4t6CxUqHSquWOy/C8Y2efmAgPwGBaX+Idl5Ln2CEbHacAevbDEBMsqwH9fNnL/
         PEXa+vTv40lfbzGhgXQ02SjK31JzVBm/F/doWc5m7Uf2pvlfWgqHwVCLi65dt2IaYDDi
         YKdF9zvPGYuFpcqOPYRQ3pAv0JBPX/SVillneEfUR+Z2jVFMel4IyKoGHda6RUh9CDKs
         IasQ==
X-Forwarded-Encrypted: i=1; AL+hErHHcQOqFFO5BSPhZRvT6C4FsVBSa1187gibFuksO3+Ca8Uy/N6joABDGTk/oO7/6WXLMJ3BH4yZMjGHIkh+@vger.kernel.org
X-Gm-Message-State: APuU4Z+8Wf1HJIv6mfupCvwE7JI7Svm5sz4p1jWApxvM1Dwb2trfKjk2
	Ttqp96iQYqJi/wchRz6Xw1nwNS3xwCwRaXB5+YT5bv7hfm4kRHVBHaavOohgBro3eFJ58rafBY3
	9Bw345nLTZs16mhuUMBNS+Jf6Q76T5lJJnEgG845FQrb4FREb9wEfm+7is/3eq/yv8PZI
X-Gm-Gg: AZFdTZdgekX/5nVcLMXwKBBqwsKwK2JOa/cH2NKULoiA+slafZbrGKorkVjf67WEGMA
	LDGQyy8W+498+gK536kynBw3B+wd65Oi+17v80T/2byKm1FOyXZteuB2Wry3VAOU8UpSvc7fPtD
	HEz38RtjYliHxOIyfW1uSEubGZIppgrcO/cUjcOn0wd+S/q2PbYO9E46dUrcbizWuZOW9mdcNp0
	nkgofbuQyXm7acUOAX3GljRoccqxu6osU/x0Cl6BJky7xB9OPmw+G1+SJNsIxHdL6u3NP5cnxpR
	RWLOKAxd6C4bwZxuDgp4d8nArnGB2KnXAs+RU9N46kUaXUAhHZCbN68qZe/tA5xC3c04umYoSVg
	mpfN7kIMTgHvo/So5051Qi8+etYuDDYJsOBHTodpdDHIBIXwiPibmOEHRMYRk75nIZbjyLQU=
X-Received: by 2002:a05:6122:25d0:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ee8ad0fde5mr14137673e0c.0.1795702409586;
        Thu, 26 Nov 2026 06:13:29 -0800 (PST)
X-Received: by 2002:a05:6122:25d0:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ee8ad0fde5mr14137637e0c.0.1795702409150;
        Thu, 26 Nov 2026 06:13:29 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm9124759a12.13.2026.11.26.06.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:13:28 -0800 (PST)
Message-ID: <cc092fdb-67f7-4261-b450-d3bcbc16bfe7@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:13:25 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] arm64: dts: qcom: qcm6490-idp: Fix the panel
 reset GPIO polarity
To: Vladimir Zapolskiy <vz@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20261126134508.320700-1-vz@kernel.org>
 <20261126134508.320700-10-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126134508.320700-10-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfXy9xORQOX7luJ
 0i2nc7FP7wWuZrGOhMcJ7ljldp8uHeHBQgfM30LWCs7uxfQ8QoPzmqIB7MGCVKemmwEUfPHD+q3
 VuYojJ/N4msYLsGzj6Nu5BkZr/wGYz4=
X-Proofpoint-GUID: ZKAn594wGoB63Ps-QWKfL8WyXpMgJu8F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX2+YzCTswFKn2
 wmpTOEJFlsgssuBSQTDkGdpgjtxEU3h4citXxK78QOz+9CVo1I35E9swEy4Wp7OMB5RnLv8mYK/
 mW/YjGyNNjUQGuLiUOMvpq7lPEaVthsotEtGMKr/rinf71ioqE/ztaPYE5jDvvI4Bpe1aqazb/e
 CofRn2brc+Kua+aw+51kRjR07YRA9eGu7MjDK+NZHSZV+5rX3N/yqkUFw9W0Bl93Bj27m8fWHJ7
 w4A+fXg20XbfzfGS8bXC5COZfPwOsaV6SfFtbOfgSOC3/G/MjseGUcWqR6vgca9FhcpABlIdycw
 bPjEoQST9WnTDMA5vppkDikqOdAdb7HVlA57R6qmUE9DMpSLrTv1CMtvMUHNkr3O9GTQ75i+vSz
 6sdxZAJJRvDQ48gw1ZlWvMokuTC7/tDqtHvvo8B2tN/lSbK8gxKhgfDvhDFojqf+kcsIBQjTGnR
 ESPZYv2fktJ67SDDP5Q==
X-Proofpoint-ORIG-GUID: ZKAn594wGoB63Ps-QWKfL8WyXpMgJu8F
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b083e8a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=guKfAgVxrzOWnIkQY5wA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260055

On 11/26/26 2:45 PM, Vladimir Zapolskiy wrote:
> The RESET_N pin of the NT36672E panel is an active low signal, however
> the panel reset GPIO is described as active high to match the inverted
> reset signal polarity, which was assumed by the panel driver.
> 
> Now the polarity of the panel reset GPIO is enforced by the gpiolib-of
> quirk, so describe the panel reset GPIO as active low to match hardware.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
