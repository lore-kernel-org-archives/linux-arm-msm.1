Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7867F136351
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789836486; cv=none; b=KrGY+HPHrPtXxcOBUujpgB+LDB6cmyBAv9Sj1GUgJEj2u0dxfq69ZtFnTmAojvW0eacGddXPaw/L7xD5Il+wYV86Uxn+47UGgGcfLnmEMwjR7IVEjK0aYqscUrqAkJWbCgwc0VX+QoMIGlcOF0mervqO1VQpDsTtuegOLAYIIw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789836486; c=relaxed/simple;
	bh=fnl3dUkFs7+q+6V0hzx11cv+IRpZStzDEBWzl1dyy5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7i4GllzDsFc0jN6YEQ85z0qLL6ftLI8qGu7h5PftwsNFfkLY6t5OhfGHs34ikHhSonv3PTUSVhAFFZvevWvu7tBGsxyvt8EBdgOHpkRU1Dj76Gdzw2E1vLBxv4wCbDiHGe0jc1c3j6aPiVNryIc4W51+yZF3BQZfdeqTbLd21o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1EWFl7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXQyoA4n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1EWFl7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXQyoA4n"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JGK2c54141908
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 16:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnl3dUkFs7+q+6V0hzx11cv+IRpZStzDEBWzl1dyy5I=; b=E1EWFl7Q6/J2VyWq
	DV7F1RuXslQyuP4A1UIyYVpQNh9R+kSVKDustTRYbeWCAcdz+K9P14RIvyqUbkVZ
	ObrAS/PEWVs2kVZ13x6bJ3Ce+q1d6mleR34YUgdRQ016lR+Rwep9UzQ2BAmLOsDD
	yYtnFaa24c4z2iM0+vu28m6QPB/IfmzMn/pfPT/Oup3y4LKkZ9kLPvyckn3SJDvB
	5TfdktayQyjFJ/JsyJr2bFdpg8iI7BYVLTsUxZjO//O9QmbeBUgu0RHcyqaXN+ve
	oSjqlRsL9pzAfFfC3quP1ZrTbUiYfLnSWOf6GIxfk2ZRPAH2rdLHqHbp1AOJL/Yv
	x0GQ8w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnsn9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 16:48:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a74698972so2098288b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 09:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789836483; x=1790441283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnl3dUkFs7+q+6V0hzx11cv+IRpZStzDEBWzl1dyy5I=;
        b=BXQyoA4n7hZn+Ack72QoXEcB50EkG0KeXsDww5HwjtLLeEMoubMN/oQtvT9dZPzF24
         aK9yZs2+0GfhHSVNIV87fv/g0EDCo4CMZifVya5kZepBGZJUfbirWwgPGzjesLwlXdcK
         Os8ywcV1u5bM/qfkZlLX9E9JM+4o+1QH8dMV/OiK1bQaguOWOWmMDheSn3T2KSi2K9eG
         AgFMoAiGpi0km6ws0c18B3YtnUMZIKUNwkhb/QhjWz5XY89KT6RUel0DsUat5keIvGiI
         SItUxg22g2SzV8zFEEngpn9mr8G5T4ce5lp1PLQHdpVMcRaJhf718w7XGhPVRqUpJIIr
         SoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789836483; x=1790441283;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnl3dUkFs7+q+6V0hzx11cv+IRpZStzDEBWzl1dyy5I=;
        b=w4FaGKMip7Qe2Oi0YX6NeS6go+vcnJkdnUnaPcZOGTsCpLk/uCIaUSgswFqMX6NwdF
         h6Py4araDU+xiaJ9sgkv+2JUzz6R1khNIsHjHTclTJ7nyc/9W+zzb69jz9l5xphX+n/R
         JzKt5h0ott6sb2JcaBInkCXKkw9tyLSSv5CR9jAljmMTulZ4tBuWjj8JT84tmwQ6OfoB
         4IewEUHhy4WbDFXIWTJhNawvweWJKvEog0rgH5hA598PvT5Q7/z6nhFobgS2PSSpJs3F
         mpA5wzTTfrmRj5xtJ/ywU+eJQKRYF031giRH5HvQp7Rr4LzFdtVD2ChRiSnpOzNqX0MF
         Q/Eg==
X-Forwarded-Encrypted: i=1; AKwUvBw3M+U8Idzd4par4eXabGmK/tT8FdJ5ANR9S0amomwcr5CxKNuIK1uF8Dtri3KWR+0C20skIt0bUp2vC6kP@vger.kernel.org
X-Gm-Message-State: AFuF++nD7wG3so9sniFJ/8jZ0ia0r3XpF7FKXz7b2W7tOF0xm8Nw3ldj
	nt1fL2izaPUpYYHDnINwx9MUt9+xzQGBFVSw6/V5i5bbHv6ZsLQUPrEQ2lt4/z2fxDVXcICr+QX
	zGPCSK0CGQiAxqGKzvqCBjU31mvoCkw9zlntSpYpj/1BGRD3MTMBeS2YB2890s3aAG4TQ
X-Gm-Gg: AYBFou0HERUwTVjounUFGj2hYkOK18JYnakmKPiJt60N1tkDnfaYKZeYokJAxTCjv/B
	GDHi4i6nsdksxEJ17MpAp7o53g5y07cPrQGDPxTFl0uBquIRdW97WLesuRg+JFhae/tTnbuMwgi
	FRHDjlSXNlpBPO1eYYFN+0w1XYLxuKS896DZXaQ+a9U4JM/g+OKj9FXLzWmF49x33VVUYKFAr82
	tGEirSrENC9cZ2KkF0mSvOeySAy/ZMLvdNAUxSTsCdQu5B7ainqghCDN3ycShIocZzdXtOi5/a6
	/7Mxi7xLPiSLUV1tNDrEtU1IPp0wc3esnumSTO70WmEwlgEqKJPq52W93SInjGri1lBNnPUBxAK
	e/PYoj6d6UZpdK1QW1BbPG2/EaeChfqA=
X-Received: by 2002:a05:6a20:6a28:b0:3d3:adbf:7782 with SMTP id adf61e73a8af0-3dd8c41a46cmr9475636637.23.1789836483420;
        Sat, 19 Sep 2026 09:48:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a28:b0:3d3:adbf:7782 with SMTP id adf61e73a8af0-3dd8c41a46cmr9475613637.23.1789836483017;
        Sat, 19 Sep 2026 09:48:03 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.227.249])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bf843sm11231739c88.8.2026.09.19.09.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 09:48:02 -0700 (PDT)
Message-ID: <2ef85ab0-0efd-4a4c-bca2-370bedb36f8c@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 22:17:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 9/9] arm64: defconfig: Enable CAMSS OPE driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
 <20260915-camss-isp-ope-v7-9-77b13d131d3d@oss.qualcomm.com>
 <20260917-modern-corgi-of-memory-6d9082@quoll>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260917-modern-corgi-of-memory-6d9082@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aaebcc4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ISK6p04Y8w1qFYbiysbuaQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=AGB_TLOESQuI93QLNYYA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDI0NCBTYWx0ZWRfX4SSjxcN8H/nb
 VzeBGCWHjY1LIrA7HcGAxCIjLL7E8AtrDsXl9qxr9bidIgoxL/P5fDLIC23zuxz4C25bSVJjSsi
 wpkO90BMNtx5UH87sPixOflhQiyI2og=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDI0NCBTYWx0ZWRfXysuc1/EZR1iE
 iyBbxPOFFNLfcuUSd0FTi8zBoC5SQWd7HqMm6cfCF+IYyJuJBeyEfmrlxbwCn/IK/a9wxhQYyD8
 o4WsfcKfAeYHCxnEE/O2YeFadzzTV5L8+7wUzCKMDXiLEAykDtDV/zkWFBPXN1wnr2zLgyiuQuX
 bAu3IWC8Bba2Or8FMHiVlVvl3XCi3MmS2FbxxD0JjlBvR42EJB9E53luKZtgi30xeVDa6nsoLR1
 Du9ZtG5/7OEPZAJzzDdjH7No8Y9nh8qr0NiuqMiJ9oWslAkac3oRW/gxnWW8HZ5BFN9gQeGU/C3
 MGKP2hS54pX5F8yANDAfNdIw58cuG0epd3smd6pCZLfvMIf+MIz/hTIlB7R2kfqGq7fyzCOTf3Z
 IZqh/lYy+ilRCKeqeKui2Jt64+YW8pyVHX/zgFN7Wm+CfJUxT0bGmrpluvex3MZtMHQSGRHL8pe
 LVUHNn+WhYMigbNX+Hg==
X-Proofpoint-ORIG-GUID: KebmKnfU0RuoeE6rNrDm12KCYgIGhAx_
X-Proofpoint-GUID: KebmKnfU0RuoeE6rNrDm12KCYgIGhAx_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190244



On 17-09-2026 15:30, Krzysztof Kozlowski wrote:
>> Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Offline Processing Engine
>> driver for Agatti and Shikra platforms (e.g. Arduino UNO Q).
> Unfortunately same comment as usually... Samsung Agatti? How anyone
> outside Qualcomm can figure that out?

Ack, will address in next ver.

---
Regards,
Nihal Kumar Gupta
