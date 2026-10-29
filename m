Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281023;
	b=fDOqswylBcMeCcXlerQQi8mAwt+0IP465ugUM28ChgvJkoWrNkgCorAsK+zsqFc9h/00
	 OMbz14imXNIJMglr+LKNYgOnxX3X65wZFBXcxD4LnbfKV0gjm5fygtEQ45zlYjWq1FEIX
	 0uGnUirqfkiBVDGTHWXjoBOS4xs5dQ2b+RNInfkydd/mnUgxp2h1BtJfCZFXyKHEKFt+h
	 iptzP3Wo8c9+OayjLP0CcF4b9n/IVbj8Ir+65cGJ9R25CG2gH6BOCtnIGkIuIRkDHkP2G
	 PCKliAeGrkR4Qu7q1eD1CAmfLA0Ait239/Fo5SzyvKHO19TZnas31ZApTMu79bWjO7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jxn7SsojnXA5TK+qHLQ9eCfFXNVPdhVIuJ5lM3etGbQ=;
	b=KUp3nOLxe5kLs0bNBjpxRIIHK2hSHadIxgrFUZiOyVdKpee7eBlBr4Q6gNMQ5Pt5wddo
	 52iHcYq59mn+dtqCWCdL3m6lwrIkrU33AGxDsMpJFswyNC/Jn7zssnCB7yWkeelKabMvv
	 4/7PAysxHOrNf89MzuBv7nny8r1uYf00ZD8zKoY61FuOhhcqzYcuyKQaAnc0YZkhvzxXA
	 i8dmB/Ez9+hUDgyLne9cIkT/yrJPiscEZU1xCWP12AnAsocOOMJInsb1NMr0A5gx7Dgdm
	 epueE9W12xvdvlHAtf9fobSS6Y+IGrzkapF4BR5BD9nKRw1/T3H2diTVvKo608ykKdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XKP49g+E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TInvHWKh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DE2606A6D3
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00DE2606A6D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XKP49g+E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TInvHWKh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCeWDG120287
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jxn7SsojnXA5TK+qHLQ9eCfFXNVPdhVIuJ5lM3etGbQ=; b=XKP49g+E1V3HrnjM
	OLz2cPTX2f/an3poZcEYQE8Z+1+pHpYNnk/uG9BOXs7EdPPMigtPBqdxwx6UzsVo
	ftyIOU6RPOaqISQKjkiv+QtFZirtbtzmUwSjgxAhTfNO3PAOm3M6qQrK5hLpsbn2
	0jxfdGWQlqTfaElpWOImtGOPawamcNhZxiZu468zpSNisl7NSbQd+fXRRKzsV+D8
	7f7T1ZgMsCWSUf9VQJF7jswZmu98oK76ja+aPjvB9zXSzrMHmJfvH9ehvvBiMpkA
	8iUULKI20Fu6VpuSeM73jzHpIaj0ommcULuBG8Li6IfUQi1PUBQVtcKq6P2auEFX
	ua7l5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3jjrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:37:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so45223585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793281021; x=1793885821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jxn7SsojnXA5TK+qHLQ9eCfFXNVPdhVIuJ5lM3etGbQ=;
        b=TInvHWKhQemca17g1eepV2jDyc6mKi2+PaP1hyRkXodbfXPBFlBwcxQBkQHiDYxwTT
         2ks8NAcTFbdVSe44A6Yy4r3g9A/55ozHewUBCKHgCTQCqW72SWQeEd4hFWgaFnfuIp48
         aa4sfCTQottotg+WUdg12jf/503efesCspUaQBkPYUQQX10XO2p6XQ8f9IsuMIxVW6As
         8ozT8r9nfD+aAEC/tNAnlIJMS64kITIFLKlAQMU7z3P8KAbt5uc3oTrUEIh23nP45ZIG
         q1DtItPW+iICZLaCrAzl2pjIdFLKMz59A3AkJIFvhLBZh6MRkJOmZUoCxlrELcvekt8y
         JZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281021; x=1793885821;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jxn7SsojnXA5TK+qHLQ9eCfFXNVPdhVIuJ5lM3etGbQ=;
        b=EFvRjNtLHNHCv4aGsfTlHv2JYD9hgSXap57Gcxt264v6yF2a8bNXUbFbLpReQVftD3
         wr4XcqrRrKzQYXTrgi6VygmrZxAJ/SjAVKyy1xobgItcUcS8WbQxO0qBHgG1gHql3GqH
         zJD0Ky8oIJnISe8eE0BykhGa0GI1+kgVne8NXB/MbasQ5OkhJWaPqiAAAMEMalNZmOOF
         +z6WSad7gCnr5BtWzvInczEyEqsrqusRx8yiBZFWpXp7MX4d3XdSofd8WB1S9KX4uPe4
         GcsURODJvlKZbd4X9lTVGBK6fFyv1c/aE6go7RAwvnnSTJvDwPhLlV3aH+6Wv2uiw21m
         vKYg==
X-Forwarded-Encrypted: i=1; AKwUvBzOF0ZK96n9Rtq8+/9bwrv023+hHuw8D9gKx9dq4bhGoYS5B3DUnGToFyQ/+aMdcubFg3Fe8pwRyWYqEi71@vger.kernel.org
X-Gm-Message-State: AFq9FYJM37LUsB8p/OpzD66kyRQADhqZaQkJScPBbZbSk/6zXhHgTSCV
	VHMzlEfOyvRiv16VOJ3soEdIvApkO7oMcCqDNU+7XwRNfZ1DXFuk/vxH8GIdUyhHaShghtJb0Jr
	tx21pD8v7l0r7ze9fBG/KfgW3HP/oW36CjSV0h3VOvJJKJHVCXlGMveIYlXwSdX2zxDFi
X-Gm-Gg: AYBFou0vfy7xhpF8D6NNwfv4NNPPCHgSdA5A1vuRNloZsZb7GxQHI0C8Vq6ci73pxBh
	GN1UROBKPjOrvtlj3w2SPwpZX8wV++sI4anSrikg91dPxn/Xc/vr2Pdpnn2uQHFGji/rEat3kwv
	W8QrvfFZnfpPq2+dQnlxu8l6qKnNgnYfzUK9QC3PrHilTtOUbeZEzG8fdVcRfiZpBzQ2tF/Py6I
	tQwdFKNCDgYWA1wL4UcjPoIuqg1nJo7TL1IOi8jphS5NVcRqJNDDEm6Uz83SHf0/bpK4VSOZBb0
	899VbDXN4u27MBpwpu7J+ZA3vyNxEw1tKL/HANme9lZxOIBRh46B7d8ETQLD09B4XGEUB7ccycT
	I8JuFRLCttwNdlpWB0fQ5czwnXXL6sgNUgNvicM+VeaZIlacQHHZO8XWc6FsYPz4s1wscZc8=
X-Received: by 2002:a05:620a:a8cc:10b0:93c:61e0:81ff with SMTP id af79cd13be357-944089b232dmr755694385a.1.1793281021233;
        Thu, 29 Oct 2026 06:37:01 -0700 (PDT)
X-Received: by 2002:a05:620a:a8cc:10b0:93c:61e0:81ff with SMTP id af79cd13be357-944089b232dmr755689185a.1.1793281020725;
        Thu, 29 Oct 2026 06:37:00 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a50c434asm416606766b.5.2026.10.29.06.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 06:36:59 -0700 (PDT)
Message-ID: <5ffe4da4-b5c2-4e24-9418-1edeec777932@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:36:56 +0100
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
To: Alice Ryhl <aliceryhl@google.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot
 <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
 <auMWZyxtC1d_BUgN@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <auMWZyxtC1d_BUgN@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX1fYW/2bZmpPo
 ZtTE8rT+XaolMmKkcN/etDMsPTCLTOrTjLLA9tj82AU/1g4DAXE1rkWr4Nwry3Mdw9awOIZXT0e
 jJlgUYdifzxLLYgXASbddV3P3y9L3lo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX1etHnP0XywYD
 IokjiNYN77uSisbKTzAf21CRLtRXaW1ppIigkjQ8c710HxLkjQTlLY4Wg1Cv5wT/ACZQlZKqVs9
 izlRtAY5KvS7QZMQoRdqHsrvCMZiyo6WVtTj1+yqLaHro2M2Pk0n9lRk8qv8LRBEvlViN5BzIjW
 3jqcyRni5KdzxbniesHkahRsnkqCHL8iueL/Sw2A8JRoz6Ez8EZOeWZ9EZzHFn9ZI6s2jMXyRMD
 x+UQjm8cvzwdel4VvUWE9tgrO677Qe1x6K3eTO5YxZJHSktIukoWqctjQ/KRjbyZQ31PXu6Y/bV
 8noIvd8AeVOhz/KDkEGJPwArZEM5l+oFEJLKDT4BJUxiPPaGvoZreny8iS6pBiYZcfOfqAkgSki
 Vk4LvhyXjmr67isY8ugWI7lSpdBXul3V7txGFZEjDWMp1FRjfv96JHhRWFs8dBV85bt/VykaJ6O
 jdFlKmkFzgiFokW7jXw==
X-Proofpoint-ORIG-GUID: nV6qO4goRDtgmG3KzaU9AwKe8IjmTFk1
X-Proofpoint-GUID: nV6qO4goRDtgmG3KzaU9AwKe8IjmTFk1
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae34bfe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Y42vabP1fUe4KHNzalkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290053

On 10/29/26 10:48 AM, Alice Ryhl wrote:
> On Mon, Oct 26, 2026 at 12:40:02PM +0100, Konrad Dybcio wrote:
>> +#[no_mangle]
> 
> If you use the #[export] macro instead, then it has the same effect
> as #[no_mangle], but it verifies at build-time that the signature
> matches what's in the header file.
> 
> See for comparison:
> drivers/gpu/drm/drm_panic_helper_qr.rs

Nice, thanks!

Konrad
