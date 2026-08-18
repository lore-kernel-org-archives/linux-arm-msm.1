Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF63E123C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053790; cv=none; b=YhummyTIwY1EisPihZCS1/pgEQfSdjqWwEfzyoZKG758JrDmOEj6WCYqMHZuWWL36oys8LvEGTJcZI1rB0fqzWaFefT+7ZUHOyuuRBb/7qJT0OUGhpFMYIjgZk/eqLXN1WlPhwkfdWbjHIxcatg8EoZAccLvfJSvd+8mALzPvdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053790; c=relaxed/simple;
	bh=+ncQunOLg+3adZ0fkUL0uOcEX2puEMXSJ5hYj2pUepg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pwseu8ouGr3u1Xrj848UZJidG9+2F4jl/uejUijHkj7tO1/7xVvO9xmjERNzE3ewA3KPf0R4iRElXkqrq+LIWSYePDz8WdFm6r7XC0kgMwBVQzhs+OPDmHkSp/Jv/21sn3Jn2R+hCDsG5rXnnc/pCIG+cH7mOG5nCeErx2O4zWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bt3DM2bP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9/uae2y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bt3DM2bP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9/uae2y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABZ7o3979094
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mte7UDgA0j4yBE+BWfugup4BEZ9nzYYERy5lNYvEDMA=; b=Bt3DM2bP1qDZrz1+
	0Br//RWsPBc8mCMO1oeuVkNTd5Akce1FT/U5vJ6oTp7HNMS29U3RkuyVN48KqK++
	+ONaeO+pgGpGAWnm8OSQ44vUeZU97P815tnuf4tkhhidhIR1ZRpO/yTX3PY7vOVf
	STTGVmAf3tI3+9Ot6slcgsLmXWQAUNvxNRosi/6lxs7PhWIpwE/f7YwHMOKTLNH5
	ZMb6L+dqYv2s+nCNUkThjjHWggryIdTU0DMbdtfCnHY8DQpz6PBv3//+I36INbgW
	KRfABgI/C5NZ+p0AoZXGYSFULn3k2dE9AWycTV4IqogFzvwRmHlXOwvX9srfSBM6
	HcEBIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpt98g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:49:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9e97b626so5561391cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787053786; x=1787658586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mte7UDgA0j4yBE+BWfugup4BEZ9nzYYERy5lNYvEDMA=;
        b=K9/uae2yhk6Vb2zu+ET1CoZJZZcXC1WG8F2OPFnC8yci+8ngIy6S4K7LZw8imWHAj4
         m+gU9yeZC70yAxVP4jq/FrbmDi7S8r3Os0mcobqYeIbpeCeJmOa2bd+f9rK44c12bQf4
         6+/aU9E8kRx6hjTd/Fu2D38BvndufVk0nDKIIBQLLD1E0OiuqnvIGy/oM/N++kPoTy1Z
         /+PQzGQEv4eHVWlpvNOH+DmqmFSbW9cEGshEmfaq3nrXs7ekhDhgfOlLVAQ7uJbFhaev
         jSh5MCls00IiZu9e4q9ejKDAFZ5uAMotlmRnHWjNllsvCH9spUu96tkqTnEDcTq7MxK+
         eIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053786; x=1787658586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mte7UDgA0j4yBE+BWfugup4BEZ9nzYYERy5lNYvEDMA=;
        b=MeKIuuZETI/NXoxC+MQalcMemAcuS3vkLD6wvEQGKQy1Eq0zyDoprY+idaX11Xx4E8
         MaFF/bMi8JTKzHoTyEEIKnhbPrbjoFmnRcJpSESji5yNBwae9Rkex33eVqlNnM9ZjArI
         SeSM8aUN9S7hsF7zR8TQXrDXEwKKfe8GwGe8zgzr2p8d5TeCyE8vGV2lNKtym2Xj75yl
         KKhJbQu6+osyC9sFIh9PVWR2gVQxon4o/x44zrbh7DHOoT6EYbtnZiIY8rMoKoNoV7d5
         ZmNdSfwiQZ3XrmiHBsxhbs+5dz9p8rX3m7AZQpOa/e65hsEIw7CeJJYoaRU0ejt2LIKF
         E/hA==
X-Gm-Message-State: AOJu0Yz87RM5s45xcOpVu/HyUJqPDyv1L78ouv8sMZrXuOLPkcZ75Azp
	2LoKFbYSt8M490izqp9tXqx+1eE0FT1dyzEIuNTterrYydpK/41DxqfskpvEABnvroZlKzlZpRp
	iq+d+MYSdMs5QNkbJlHyKGPNu2VGKQhnNvnnV+Wn6Adq0h/hH7nPzcSMYEFA7epcmcZNA
X-Gm-Gg: AR+sD13/XHCxtGRe8TFGV3K/Z88A1Ld8Fs4M/U15zZwczV4tNMRRlAsda9qZ6yQE9GE
	BxU7RKxVyq/TioyKioDAk2PuT62M1adaIq5U2exRrV5SuRVFcEv012g/kUGpzHfy43lQd1kR6vD
	xj83qssrex3anz+2vbzWYKII3gsyIra3PeaaM0795kQsznsmq+Z7G52Ti05NQn1j7J4ks/ffpJ5
	ASA772k6qQET450cXr/ndL0b+rxFcFD0pVL5jMb0QC9JvMtBjDyHiNglZpTR/kwTrro5p/ku86X
	32BcPE+Rtw0j5JBbKVR4j5IKfpStYswDGa8wUlJ0/xv+IskakfsoCWKYykyXTt52c0yWKM5HDhs
	zuJqq3Am0UxqBZd+iZO9LyQfS
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr157037811cf.1.1787053786442;
        Tue, 18 Aug 2026 04:49:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr157037461cf.1.1787053786062;
        Tue, 18 Aug 2026 04:49:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d851767dsm1761795a12.5.2026.08.18.04.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:49:44 -0700 (PDT)
Message-ID: <2a11fedc-94a5-4709-871d-c63c46d0106d@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:49:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7325-nothing-spacewar: Add ath11k
 calibration-variant
To: Danila Tikhonov <danila@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Eugene Lepshy <fekz115@gmail.com>,
        Vasiliy Doylov <neko@altlinux.org>,
        Achill Gilgenast <achill@achill.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260802133203.259734-1-danila@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260802133203.259734-1-danila@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d7v0Y1Wk5sEWBS1D-pH6MwhaVtCDwWWj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfX+ip1UwqY2c0N
 QjsswPRFWzvyWydXm04b1BDq1n0Igt/zxAZuknQM/SaiOvN7gsU63Y1eqcnBsdbS1faOPATHAwC
 AdzUjx56NToImQI/5dsdZptt1jxHDsVz3HQM+QUXdpa3WIBuR89YDAhiL523PT7OwR2jaGZEY5C
 KagQwuFDiCH4vB8ba2m1BfrsN5MRSvMMiVznSUuxQviOfMpjtzWV5BjQH7weCbkJq7b5fG1iE6n
 9WUXAePQWOgtBkSALOPHdwtasnvVH/AASLuSX+2MptWYeuxN3JeNAHAInC0mEZUFMgwTF/UdP6b
 TXDSuNusX4gkxS4SJYFbFOJ0sDFrw7ufRb/e+wYcpKYRORfjg8kz3PoLbW+RcA/SjJdpGQlKI4W
 1L2P4ZV6KrTFwsKOchTv4oavHK418I5ipMna/0531HTBuoE1R8dkBVzjgwwgw3f7n8iTfQhmBYC
 r5rp8ojGd47if5IlmJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfXyD4lZLn36nCd
 INFeBZf+VfdwuzB/FthJLLMLDZ2HNBEyHmK2xO7OzuY0nFnus6Yiamavm2/rnP/IecEbhaF5brP
 oxcDxDvNw0ZckS4IPv+ZYXiR4JRTDlY=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a8446db cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OuZLqq7tAAAA:8 a=HtY2ukNJyi2W4sjfIL4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: d7v0Y1Wk5sEWBS1D-pH6MwhaVtCDwWWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180087

On 8/2/26 3:32 PM, Danila Tikhonov wrote:
> The Nothing Phone (1) has its own calibration files for the WCN6750 used
> with the ath11k driver. Add the calibration variant name to the DTS so
> that the appropriate calibration files can be loaded from
> linux-firmware.
> 
> Nothing capitalizes its codenames, so the capitalization is intentional.
> 
> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> index 1e78a42062c7..85811b5de4af 100644
> --- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> @@ -1546,5 +1546,7 @@ &venus {
>  };
>  
>  &wifi {
> +	qcom,calibration-variant = "Nothing_Spacewar";

Have you submitted that variant to the atheros mailing list?

Konrad
