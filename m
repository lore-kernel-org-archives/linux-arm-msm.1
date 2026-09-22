Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C91A53F690
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078627; cv=none; b=h95Cpo+HRJLcuUrzHS1kzmDUT97yimCt14Uq6QKn2Xm0+sB0GIT4YEg5qfewjjnsBgNU6KA5NLrSjlZG40LtdgORdL6dCvB3oN+yT3ncb8OO/BNgjTyG+sl8uRNpb74spFMEFy8w22DddSSDNDYxi9AfmyN2KvzHu+7Ujjq1tvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078627; c=relaxed/simple;
	bh=SZCXlrQAryWhTDqNuUadzwglBxE2aUkKuezLoH0aDRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ND9WsOYPf9CWWnbGnxRETA+7Dbr6wjb5F+cKG1rzpW9iUZU390n8swq4YAHsHSSaWqJULCal9zypm1ZIOvGXvaI45RQdwLnyOukkf+TZlo3ELP6b+W1mgh/3wiEmQLXZaT7r44Vb/oK7lhcj/FNgAodObRpgkAdBw5ZCcWgYyFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGIYyFF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BgAdJlHE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGIYyFF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BgAdJlHE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPkmN134559
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7a776RgZFeskGxVekBSZFf3BASD5Wked69cTCRkftEw=; b=XGIYyFF6dsfvo/OU
	YLl/mPQe/Z9bzqgu4v0+bXeQ0CJd2miuxkagDmzl/TfuBjcBy+Z99sOY+bjtFM5s
	Lbz/Xf8mxKHyTBYtmHvGxKhXrUx/caCOuqMVt25HIuZi4BRXhfJNEJc8IaBov7f6
	uFc9CRghMAdywstpZ2eb7qfZzN5U4FwdssqDJn8/WJrw/tYhtzS1RtvHax5dLoos
	e5kf0/CR/KcjLZYmg1lmRnzL/rjR8PlQfNOMkB5tzOamiqPsj8J9uyZUIAQLA9Y6
	/HKqC/4/pcFVBFvPj1ujY9lRgKL5EUQTccV1ODfAnsJ2TaAXDs48gejNjzDgrUP0
	arvSqA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj9s04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 12:03:44 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46788f14fe6so170074fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 05:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790078624; x=1790683424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a776RgZFeskGxVekBSZFf3BASD5Wked69cTCRkftEw=;
        b=BgAdJlHEET0Zey4poWZlccsZ6t9o3sp2Hx6+OcU9SiQDPxiD1gHWTwG7Nv2Z9ciNFb
         /E/3UHlUU5lcLzqrrAY14RLj+BNGNE4zpy88eWg0G5a7WJ1Nw43M32FH7zVGI7GAObbu
         XZE0sqMBscy7WPt6AxAG0VlyO4H4a1kqMQCCQL+toQil+CWSHA6w9igeZzbZKSBW1Z1h
         U0IHDzEhjVYUMSMwtxStcoyGa25r+RAf5VF6gkUIYJMFBkAm8SH4V0DxC4FnA9lPG8R7
         nPfxK9fpHajBBO13JHqC9bgCO0zBKQYwA5ZNKSwY0/eU4U6ZO0Rl01FJRlsN0g+xm7i7
         ObbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078624; x=1790683424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7a776RgZFeskGxVekBSZFf3BASD5Wked69cTCRkftEw=;
        b=1+rmo93JOsSlsGubr3o3D6XpWCUe8XKnjW8RESyCUItPHFalE6dHwgQx8NPpb+9LkT
         1vrxvt7j48moNgIjN5fX38vvgtvEJoITDh2qpqcseKumfS0bg5P835yjFWrqVl010cnS
         sPQvWBMhHeR89iBi4smDE6ImySV/zZ4YcNa2MNYim1hlb+pYqKxvpnd25IQJp4PGDh59
         c3jdt/90z8TFfCBzqz6Vrd78d3D4p+GkbftFziH9ZtKSlB0lvL1p676EFGn6g4k6rXFv
         9QSJw8KfDAnWKzg4bxKrptjP6XM3n2Zj1+pn60/632Z2wGa68hqmpF/CX+Y8pP3xXMsa
         Hquw==
X-Gm-Message-State: AFuF++lRNf4jK3Wpka6lG8eBo4EN8VFp1AM3efX5MsQANuuQ1nuQwi80
	T+o2AUoALMVaFvG4mUNyrSxSL/Y9ZGev3jpOKYjipI1wfoCvqKFPjEpzSh3zt7w6+dKkaO5NZEN
	RMy26LWRkN+8MPKnQiAFmOOEwCHQmit2UHIc96F+P6nVr9ofWOkegGtk0boafDBhmqx5T
X-Gm-Gg: AYBFou30f67QDk54d8EKbdD6RJhXQinOmgde0GEGqcdVlOO8joOhGmToV5aWUeqWp17
	GIgX0A77MDONXgboWLGT5UQ4QH1io3WKJ65j4S/dclDbTDMz+9MKpL7aBJfzFX5WnAVD3N+OR2D
	nk2SkrzVYK2hbK78JYMOsS8F/7ivIdvQtt4Lr3fEUmtN7GlsWrJgIZlv0xvbm32pksChZbwZIqm
	69Qtz0M2r1lJ6TdeJlcuHU1TTN1p+rFBh98r574cSK5vJH9GprNZK+RBrAE2hPX97QqGse7qtQ5
	APlBIhTLR5RI5KnPnTI6lrd+sNUafVDnuV0ueMD9dNuGmVCEZgozGM7r4RMMg25JKpdQtSsrJFr
	g9g6F8OGBcHtEaf+NPB22Cg==
X-Received: by 2002:a4a:e205:0:b0:6c7:76c8:1a6d with SMTP id 006d021491bc7-6ca971e9d72mr10228098eaf.0.1790078623728;
        Tue, 22 Sep 2026 05:03:43 -0700 (PDT)
X-Received: by 2002:a4a:e205:0:b0:6c7:76c8:1a6d with SMTP id 006d021491bc7-6ca971e9d72mr10228055eaf.0.1790078623189;
        Tue, 22 Sep 2026 05:03:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9f1895ddsm54692066b.9.2026.09.22.05.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:03:42 -0700 (PDT)
Message-ID: <69636cb8-5867-42db-a8fb-aa8b2d9301e2@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:03:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add
 the embedded controller
To: Oleg Keri <okerixx@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <20260921144953.15113-1-okerixx@gmail.com>
 <20260921144953.15113-4-okerixx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921144953.15113-4-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hCIEZgWfpYagyc5MToI1IJANUE0Zk8hm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3NCBTYWx0ZWRfXxVbVzscrNau0
 6oVA7wT3vHltJy0Uyy0WyW3E6Yl+jisyZxkuqHLyAq8FpFKz8uPJ0Wg2bNtm4IMUz5S1993M6YX
 0ph92bvMP78wWa9wzh0G12j3Jd7gtj6HTUG3lFNVyqVZPBZJQElwDrKmKupAvyNiV5zQ74mzlmz
 aymeGmj6NMwbZCmUCFPNH6KBHLJvBS3i7mTTYlU4TDPrgvnJGIrxPEzOM3pK5G8s/Kk8Pxbgq7x
 N4n/wFL3pq45EKmaF7ohgmkID668DeDoR6HD1lGknh8wF/1ZHcUxjbpK4N35lciYi56XyQfC3Hw
 O1lcSDCGRdErDBvgHKDKiC9mQdLLc1m/zBjmotITiv0LRgQlgOfIwyPGBYpsGAW+ZxW1mZOO3ju
 SLYvvK+mzLZiavJj2ahOPDzQQU4NbOmQ9WLI/XvbR1W20AzoMCxdH6EkuO9yzQp9PRfTSoHboU5
 sP5nbGM2P1izVewWWTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3NCBTYWx0ZWRfX7P5l0PN4dECj
 nyFYAb9YOSLGovWTI83Nyu01c7DH1o4HvTa2mGNDYIHT8qpcHeH3cGLg7FZcBhc6u2wq4dIm1UT
 m+Q2ZBwanS4e+sRr4c+IK2kywaPBlgg=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab26ea0 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cXQzEVsWzZF_LJZYrIMA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: hCIEZgWfpYagyc5MToI1IJANUE0Zk8hm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220174

On 9/21/26 4:49 PM, Oleg Keri wrote:
> Describe the Compal embedded controller on I2C at address 0x70. It
> provides the board thermistors, the battery cell voltages and the CPU fan
> speed, and drives the keyboard backlight. Its interrupt line is TLMM
> gpio66, falling edge, for which the file already carries a pin state.
> 
> That state leaves the pin without a bias. gpio66 has no external pull
> and floats when the EC is not driving it, which shows up as a steady
> stream of spurious edges; the vendor ACPI tables describe the same pin
> as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
