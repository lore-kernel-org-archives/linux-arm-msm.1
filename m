Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26929469835
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053832; cv=none; b=M4FPaPt87rumllrz+u8ku4cU+ZhG6/JfZAXxTcvrWVLRfP+3Boo4nkwdPaa9kJptmU/AnGpluBDn48MgiP7N8ovyfcVidAMApylzmBm5//gQbMXCDXRqul4FD2MSCLzVE2EMOVNROBSgbVHdByLE5pF6QkNWwsHaMpOdFQQK/os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053832; c=relaxed/simple;
	bh=kqMgyjlZy37WZDYVadqnRsGo+CDsIryLtrrmBvu9aGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gc5/lzE87FT+Pw69mdlPk6GidXP8ok5NBOBjRIvbSPekzk829FWs3v0GzQaqP/MGVvlo9ofkziDxCwql7PDQ/yVCjraoJ6Yk7ALDa7u+WvrSXw06G3ZR9Gtk0B6NzN5ju+ksOdl7G8F+A+0o/f+1uhQi36aIzBr3VDXN2CipdfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GT94uP5F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XntwuY2w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GT94uP5F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XntwuY2w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABf5T581402
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YI75CANUnv9CmAm1KpPbTLntPhs3IAB736oHOTFVSXM=; b=GT94uP5FMkl9oeZI
	rlXPmEkRCl4JlIrWsRbNg0OzapVUz2UXRn+ypmBc1Xexy2O/E3mjbMBQbMQh31bb
	Fzy4Z4u0D8OJ5G7Jpx4FPvns4Dsopdyf1QfCuLsiltwL/fvCt3piLkqJYCcyfPCQ
	vm04ReWddmU+ZbgvCypei7xBG8suqMSDi0xuwbR8p4u/U45ksha1tKlBT4eSKDAq
	OekqW54jPiJa90IXObMuZPp9z3hLjK3fzjU/RX8mXJxz4fvj8IYQ6lTaP0Sk7etL
	o18WUaSpciHLAtRYpnDZcIX/10vbP3629iZKscetLQGO+SzJOInoYTVhy/7X1jBO
	+aLe6w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fbaa0wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 11:50:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so5171571cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787053829; x=1787658629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YI75CANUnv9CmAm1KpPbTLntPhs3IAB736oHOTFVSXM=;
        b=XntwuY2w4vKKH0dZUUoR0CrdHCUjMtA0LjpBpylq54cug+tROIbzP8duk/qx0pLg4S
         5oCvYqr0sPyKzq2SDoFz4yzBJkz6WqbfUA7viJRBqIWI6anT1qlno8TvGP7zbfDAO6yz
         5ayRvWF6Qo43986znC0+9wzXLZpwxYZjiVNYZ5IZVlSxNRjaLHdKVFO97AQkAS0DeFC3
         CQAvizamADQIrrcuGkIqZohn1Zeb3G/KyBJ13hpoRvRi/GWRtgwW68+Ip3CBQyhl/TmU
         35NvY5uAcpagW9x141PeU0KsWriuverpJxKynts0ChXhyeY1r6MLkLgahhNbDqJ9usqt
         pSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053829; x=1787658629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YI75CANUnv9CmAm1KpPbTLntPhs3IAB736oHOTFVSXM=;
        b=jhE9iQ0Wc1UVspcki7pLqBkQqXLs0Jx03DlWkCQXXncJa74CTzYaII0+hoUFsa8HXS
         eqDNpyut3sfwScISDvb+JQQxKBjL+qW3qYRsWX/093N5x0WY1C/DyfQm0rJ71FtMFaNT
         7mXETajF7DqyQALJB4iiKGKUlQz/d/M8MRHRAPejkVNVTIhrYOhyRcZQGag2t/STawlu
         VwnvIFqJ9YL7xq2/IeMczlV2NOD2b7tCEneemFGdxqPF9pigFnXc2UP9v1sewZu1M5mB
         tlBWRQ9AVrvpRc1lWz4N74F49YKC5argVk9ZsHpwIRnLbvIgPHbvUz5hublp2crQJGO5
         2xXQ==
X-Gm-Message-State: AOJu0Yxu85MBk6Yyljw6smrZk1SiG1FHwK5NCnXs0G+6zRLPM8qseJBO
	q8N3LTX8NV5TjWALmTnHl3bkwJpKOU4rTWrwCKdJVJoMYtXDveEigpFxFa3u/lnvEDet56jC1S1
	5vpmIH7kyj7OBRyIKNIsgzUyV1XBaiZMI9FfI0ZwRw8e5AXqlxcqdfUa4yo8BbNv50uiO
X-Gm-Gg: AR+sD10M7cBSBifcOnWK8wAVU+gRd901IAty+zbb6gwVXjWnwr4cf8y1GeA0+Qg9arg
	RMjw3Z+NV7utG8Sd5XGXa3mgYjNzXibwWPw993tk/RiuJ7ciZS/JYDkeZNzdaHAJB0Vj5KaVQjl
	TxtBljCOYrAxVCWGGiw+VXomqlNsq+AfMzmoRwIS8B3eOZGJTB+luW90Rbc4VtS9O0wtPt9YKBV
	C4ZvBueHOGPaEYq0ujX6FT+GI7FoXKoQ/Zx32Xb49AzkS0QsAfqbcVSFCFiPqpQwsU3NVcRRO6Y
	wPkjvfcbk1Q2ri3KIkokyRhV9ydosFb8t+GWE9OdB3fJ2VVm2I4xOfnBt3aaarKe4EJvCl6P1gI
	fi1XYbyDHPFHIJMz7csKa47Sp
X-Received: by 2002:a05:622a:1787:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52d854b8b9dmr256287781cf.4.1787053829382;
        Tue, 18 Aug 2026 04:50:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1787:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52d854b8b9dmr256287351cf.4.1787053828985;
        Tue, 18 Aug 2026 04:50:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe7b86esm170051166b.1.2026.08.18.04.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:50:28 -0700 (PDT)
Message-ID: <286f9938-1cd7-4015-8971-1f6f4e23dbff@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:50:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: qcom: rpmh-internal: fix kernel-doc issues in
 rpmh-internal.h
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260802-b4b4-rpmh-kdoc-v1-0-0f5026293d9a@oss.qualcomm.com>
 <20260802-b4b4-rpmh-kdoc-v1-1-0f5026293d9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260802-b4b4-rpmh-kdoc-v1-1-0f5026293d9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfX2QhkEENtZxHv
 WXEjUc/A7xxdge5WuGX4Ljtqif9b3/FEUwN8X8ZMcAvDbHe2AbqI5DkYo4XZMxpWdlt7pc+jnOc
 xcCyGZ5OggCwJV09DZaFmCg38igr6F4=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a844706 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JsEN5u44QsUbvw9GR8QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: RG5K7-Hd4943HWrIIHh4KVxNaJCRAOSJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NyBTYWx0ZWRfX3GmTaNNjcQRB
 eqlm8dQkL+/vzKFy47Z8nC8jvgvxccxJMEreCBznOECfN8bgguD6RHk7RWqsOvUPP6XuyEJBnLJ
 6EAd+akzLqC+6oM5Tvu0DiD/syq07WG3dxLoYtkhh41IrNnwmivj8vPIE/SyY+SgpgLIQwuRq8q
 Emab1f9nEVKQguTPFsPtxJ6QhilVmw1FvNu9iic+yFodallixib3PNG3DcRJdNzJN/dQ3yhqCBY
 OWHXM+yKZyv96GsSp5wf9EcP0+w0j+4DhgpcjoR24adZwlrj6V6CtO37sRBZfb5qkHZZV9oAwdi
 AQYrAQGvKZkf+f1F9ZtEHncRKgRlXcolHP6iIAKhWl2uBzKuMn/8gg681TvUNmVGumDX8vVrUVm
 NzyGMPQYAyegIR2+UsDJ/rY7omuBaA0JGYAi8a6FmnlV0cYTSLlapLX83+n4iGPlYMk9TIHhZga
 kR0QKJFDiDNAwdcQGrA==
X-Proofpoint-GUID: RG5K7-Hd4943HWrIIHh4KVxNaJCRAOSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180087

On 8/2/26 3:28 PM, Maulik Shah wrote:
> kernel-doc emits two warnings for rpmh-internal.h:
> 
>   Warning: drivers/soc/qcom/rpmh-internal.h:136 struct member 'ver' not described in 'rsc_drv'
>   Warning: drivers/soc/qcom/rpmh-internal.h:136 struct member 'regs' not described in 'rsc_drv'
> 
> Fix them by adding @ver and @regs entries to the struct rsc_drv
> documentation.
> 
> While at it, add a missing kernel-doc block for struct rsc_ver, and
> update the remaining struct kernel-doc comments (struct tcs_group,
> struct rpmh_request, struct rpmh_ctrlr, struct rsc_drv) to use the
> 'struct name -' format documented in
> Documentation/doc-guide/kernel-doc.rst.
> 
> No functional impact.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
