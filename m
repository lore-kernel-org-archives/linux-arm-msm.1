Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028644;
	b=vtljVfd5GxBskq3g1Xj0o3oRst56gV/FX1tFLZHzZgeordSFaR+u5NasVsLN8+H8NiMI
	 tAw0AZi+dDFdQ1N1a8AxCrDdPxrxJwKFXz6yPZseOVKAVSywLt0GRsT1DgerTDTdmiydJ
	 HT2Tu++x2ZsYX3u4Nq9w3f4wL8lp8qRY5aDZZ1spcKdXhzx4HxXqTf5AnN6ILUlRb/pHd
	 HQX9MyJAfdmNtSB6W6kWl2PdrZoAFYU2f0Ban9H1u/oaFAJXx4gGr6D/o493LLcZpJObs
	 SEL90XmSsSiDeHX+n6shgvsZL0kcCaHpY7ZbtO8GOhbNaMklGcMyV1vixMif5wO1Ocg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aNEN/0vWce/15eUz14WckhE2l2ohDRpHNcQP7Q+mdfo=;
	b=ZQZJZvVOh9MR4mrgGQYeHcDNdfnaD9XDytzk8sbnqNKyxH+8IjzAad4JAc7X3egTi6CC
	 4JHjJ39ouZcYw4NV57etdBYE/V9uZ+U+tKgPNE0WM8f9A/adC9jLYjT3/bTiyvxJhSPmG
	 dd+CvIc4EG1P4yTLorMLHdaYI1kMlcvP5xjyMcjVIUnkeIIbA1cYNiYc1VA5LDJ142jis
	 s0j0C6jcsmnqdCKKrHnw9w4Fh1h2nq/HK0xbyah3V7iOLovmBi2552HmW1iiZbeFEtIKm
	 9shH7TZdGHgckDHvCEtqMJHOk06OT1FicaFIC48OCS4NthJZN8TK4wZKkFQxiyc2syA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSpW+L2W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YSQSmC1/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897D3606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 897D3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSpW+L2W;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YSQSmC1/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvhtR4168062
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aNEN/0vWce/15eUz14WckhE2l2ohDRpHNcQP7Q+mdfo=; b=eSpW+L2W+Csp5WUY
	GvxBySkIFVAQMZDJu9L5LzxKEJW4zA6tUbyUJ30PNCJh7eFycvg5q4yjUoI/K74O
	s4bnSEYpe809dALsn3T5v/PlZsUrCJOZI+O5/CsnItZZOQvcOims7eMpT6O780dA
	oEWEFAxUo1ftvTTDWDHldVpRFns1GAIp0xuChWsQRFPVuHSZtqegzef0LKDxlFFM
	uwWWjUr7Ar0+hnxUJCQQmCTC/bbaBBqIcZyp/7HnJM4qYnKAF2Bo7bDiyjbSW9HC
	lMNG/NVva6MDU83MQbjG8IJpZmu2Za7iKWE8WTOC072qK2y4eF2x1rlhkHkVdSni
	kkm0Qg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf17y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:30:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9909853d264so157429241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028642; x=1793633442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNEN/0vWce/15eUz14WckhE2l2ohDRpHNcQP7Q+mdfo=;
        b=YSQSmC1/aVZEr0mLJLTjKEGRXHvlRpLLlLDUzycoVCnchazAiHIYLdJvIjKX+D5PXh
         Tk+bFGdE5eNm3XbfmKLeE79hIPkPCKeSjhlG7Ikg1J4qI6k2fhCDYfNI/RDZV3WteawM
         hltETlPiaUmbQJvf0B6LT+y5p7XBzr5k3wckh4i8NduNfQqkLPGo46mrRbC6GuBD0YBG
         8Y4bOAa/nnb73w6CTSXM+s2hWlS71V2lM1l5q26lTqnMmzLGYR+6cd5+TPtlkhlLZcnI
         ErLAFpa+ine96EwdxNRRrQY3HEeT/68R29o54kDHuJ+t/iwng8YpIIFU/w+qEP4Ithie
         ITuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028642; x=1793633442;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNEN/0vWce/15eUz14WckhE2l2ohDRpHNcQP7Q+mdfo=;
        b=BswtaZFC+HddCdnf1YAhKmihzP4R27UqgN9YWdNmeXDm12LJBkkNX3wWb8QsgIOP7L
         agaCxqN7qeG+N4hlSxxLWkHdc0hSUMTPY34/bmrVdNS9YAi6AwQ8/29+lvaUuUy8XBEJ
         kBm+RQXlmT5BW77l9/ogRzUKVNTbsjONDyq5zIGsKFERgXST6UUWWww7+pAy5fZjMgaf
         HO8FyaztOm1ZkeWoiBig2d+z6OR/yrS5der4EDGMxRvSch+MPwyX0j5+rUyayzVOQjOP
         dPKI3OsAUqwAwnRGmADnit6eKsev/nktuztGKL3ioSt5X9ZzGUVqw/w+7XMQXpdt/Emu
         qiIA==
X-Forwarded-Encrypted: i=1; AKwUvBwIlnUOiwT0B/geTG+hvek4qDse14EQ2ZLwGXW1aZ4/SlemzuBUiUH61VdJ0/QLQaYH+/sWPZ8BJ5G2Nu7a@vger.kernel.org
X-Gm-Message-State: AFq9FYI92XZExyyCD3eYNLlSL9ijo4rgDS7OVXJzcZ4AKyLynULtSF/E
	8THTbiIXPY7PkTAnCkI4XYfEgrZKQuT0qoMbw5uyJf0fxtX1kp6EI4nHcxl50Cj3DuUjYDs6Ghl
	HXLKMqTq5SzaXhc/Z6f39C8zx/Q1aX0JbQ3evYTa9BdymKWzyDe3GE5SDj1vFqy2zn/Yk
X-Gm-Gg: AYBFou2qoswWWh7k2E+FRcH3LJ0umHEHJpIaRyumZSKI8JdCW5lWaD9ajRWWJbWxyol
	Wtt+NRjNQDpZdT8gkWJdR/PzkuphENqn3/fhhZwPyY2POeR/T1aG8a6BTevDpw8wdSd71Dnnshj
	TSo+9P3scIu8bgeDNqnd3Bp6o0FrvhA48UxbODPoJi9DJ/FxtfuAJPnIQDkv7I/npUXYp0ojaS+
	N4rosNk2LqUbNFvlQFT7tEOfN9EiG1ll+HN+XMgdosQlTv6ASAlNK0yFgK+lckOCb/Rsk7YmsnY
	8PxMeBNcr6I+TDVBNHSXa1CHh2ZkUoOvhxRhprQA7dP8c9L5iJM7bLK3qjchhTx8XfoZNZpuhox
	7NZFlVj+ZIyai5rGFze1bBg==
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr2249032e0c.5.1793028641713;
        Mon, 26 Oct 2026 08:30:41 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr2248969e0c.5.1793028641198;
        Mon, 26 Oct 2026 08:30:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd79eb05sm333500666b.79.2026.10.26.08.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:30:40 -0700 (PDT)
Message-ID: <a5667943-3c3a-4bcd-99f4-fe5e487cb6c5@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:30:36 +0100
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
Subject: Re: [PATCH RFC] drm/msm: move VM_BIND op validation to Rust
To: rob.clark@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot
 <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
 <CACSVV03M_MzamPN5X=+bmbqOkET2QOJk8O_vQyhnjDGbSTvN2g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV03M_MzamPN5X=+bmbqOkET2QOJk8O_vQyhnjDGbSTvN2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX4KT3yagOEIwK
 oFpSClmfX2ZK6nmzCA4PmJPL8BEt//C6WXLpB6ih3p10T/QWTjk3UlUh7ZwCHfjHiGF2q2ji8Nc
 bL3sOgMi1uzd7m4Amr9tvISC7rz1Oqs=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf7222 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=obMtVcPMbQgr-G-mzi0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: BvRyVvEADDgsYHjd2xcnJZIVQ536FGl7
X-Proofpoint-ORIG-GUID: BvRyVvEADDgsYHjd2xcnJZIVQ536FGl7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfXwCwwz+4H5kFM
 QFI/zTGDOyaPVgIn1+jgJs7pus15WxUJsnWUyLhrJc8YrbPSuNAMVLIv0j0S1UiraoBsarPCwUB
 M3HPi+7aMGdXaYgn2SMpB4H5l0fC6kiG0reKnhu1cNL08aI3xcfjl4nViTvuyXEQk0Ee9mbWqfm
 LpT+u87HooBhuDofumFTP0fj9M9ghGnon855V0Bu+cksXQGeUBwH1zUgWXgqLls5Ue+QZpbUt/v
 Xid7vRkMO5+3jGC5tUs+ROOiyhEZNOgOAH+c/tpZjUM33oEAXFHVtE/TQeZ8RwF2hZ2fCpeRSdD
 ojd/fXhKHQ6FABQE3jBUh5mhW7Dlh2EOGMVAq8tbT3pGebNYGu8prIaz3U5/7x0qQ3gEao+q05p
 LhvbRw2h8pCgU6gES+JOY8d579IORklLYdRGLu/WJWDLAnrAheYFdeXaSDqM79tqukHEm2BXJnf
 fXrwiK+wxR1Hixvv18w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260061

On 10/26/26 4:26 PM, Rob Clark wrote:
> On Mon, Oct 26, 2026 at 4:40 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Much of the VM handling code is a headache to read and maintain.
>> There's a soup of mixed-signedness/size types which need to be compared
>> and added and getting that wrong in C is very easy.
>>
>> The "(range + obj_offset) > obj->size" check could wrap for a large
>> obj_offset, which let an out-of-range map be accepted and then mapped
>> as nothing. Oxidize it and use checked_add() to fix that.
>>
>> This commit is a "get the foot in the door" type change to make sure
>> that folks building kernels for Qualcomm SoCs have their Rust setup
>> ready. It may/should be extended to the wider mm code once the
>> appropriate abstractions are finalized.
>>
>> Worth noting, the C UERR() macro expands to dev_dbg() and the Rust
>> implementation for that currently doesn't support dynamic_debug.
>>
>> The DRM_BRIDGE dependency is dropped because including RUST exposed
>> some spaghetti dependencies ending at DEBUGFS and it's enabled anyway.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>> (if this is rejected we may just patch the C code).
>>
>> Notably, this will regress some ancient configurations:
>> -- arch/arm/Kconfig
>>     select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
> 
> Side note, I'm ok w/ drm/msm (or at least the gpu part) depending on
> CPU_LITTLE_ENDIAN.  The combination of BE CPU and LE GPU would be a
> mess.  I'll actively ignore bug reports, patches, etc related to BE.
> So please, no BE!

arm64 is free of it now!

134b0fbc5c24 ("arm64: Kbuild: Remove vestigial big-endian support")

Konrad
