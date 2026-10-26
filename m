Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028395;
	b=3eChkVpr+D0paTTFicYivjbmyQfSV85aQBsXAYU/wOjGndagV+ueUaFBgAeoysReu2g9
	 klolEfAk6c4fYH3RlFNmBSrA7uBCnLdChfDzBGkASMYalffWfJZAq8FsdcVnrfZkYDNOE
	 p3n1WrY3qEzKkrNbSiHyY9sTEqoSSe1dle9EQKA9oGM9Ag/oPglsnZkDGSwS5dG1UISf6
	 5X0McSx0waOo4lWcBUyxPVpem+IaLlMhcMceJErtu0EMBDys+2XH4pI/++e8O9VoeVM0Q
	 CSiAPG/awFBV1KhYfC+h4jocdBB0HM4AW1Umz6Ry8OpNpwuemVTT3IlI4IRuEbGow/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZSbSdfxGzCD7LDy75RT+TlWivDjhKh11W0IRGV9azFo=;
	b=TsNP35n1ALweOr/FqOxdccP5k+30sXIDy1zjf4Y0a3FwueQamgMEJuSrQpVneXTeZtv3
	 TFeKLpM7iexfvNPynRljmCStcIme2xx2K5Ks4SCsd+0D/U4jM3MZKGzS6ASraACgAYpY5
	 6m7IqfL7UEy5KfaJeRXXd1oWeMM1o8YM1SPNaOXBd47TxFS46HYqs7tOCYgQoC84/M0sw
	 kTpGUYg2kV5LcNNyL0a+kxCO5i3OnvUJWc1zf5Y+D91ToaeTkcYyBK9yLjWxbZNFO+qYl
	 i4P7foKlinAo4U1s3w7YW3RWL7JRHcr5wMr8JWb806TVz4G1qvpQXvPz6CYIQttC9Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R9+wKlxq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NvEsTX1n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F5A606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F5A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R9+wKlxq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NvEsTX1n
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvcLC465835
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ZSbSdfxGzCD7LDy75RT+TlWivDjhKh11W0IRGV9azFo=; b=R9
	+wKlxqx3yyUK3kge6txMns4lng7slia9jyzR7MvqQ5adescsYwshaCf/NhQXUTUe
	J7SMCF7IrtTXaJMOw+/nkZLiNvErwVJAbpV9VgW4B293i8H25W9Kvt5T4pNBZ48Y
	tMvKNKVE9abMTGIB1ho9T/hLvhisuHH5BIHFlcERLu74BTJrJbnyBG/d/w94tg6+
	D1fdPSGQ2ykGGOFfe+aofq0Z7Uyk/71SPfEzv/chPqh4xj0Doa1TVD8LZhdMfpvm
	bHaR+AC1OPQ9ExDOQ5gp/tZtMk4yqCoou1FCAyEIEy9LqQtPvJC3UASMMGYdUZN7
	JZaWoei2CoaJNPx/DLNw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpu2se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:26:34 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-702a9029845so3623205eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028393; cv=none;
        d=google.com; s=arc-20260327;
        b=bKrv/PJulyPbNE80BG6If4cWT9O0dj+NMzFYNdtCpTYnTMTDeuM7wIyZBcEzBxazsw
         HErYuiXHkS4DPTrm5iHuqImxtikqztplD8Z2qKH0gsudgrZx9gycboHdBfDH3TogthVF
         pXTC5pFg/oLeYiFNcKueM9XBuscCPYqxvwQXb8A8yXzsKWALLvWirtiANTOw0XLfXXTZ
         36QeEECD2XXh8IIgeK7JAwZ1q3d1z3kjfuzxXH4jJv5yVSJ/CToqYx770KHmudqegPi5
         RqICqJPdcY6JqCS9rXw8G4mTGGI1Z4MRB9FEDkZNz3b2u71aJOf2KFfCd/9gnL6PQ59S
         w85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=ZSbSdfxGzCD7LDy75RT+TlWivDjhKh11W0IRGV9azFo=;
        fh=M2LwY17AHovvOXfjsmmRkv+/tlqiADrGkIQ7CqT/ALY=;
        b=odEByWDo8lcPigZpkXNSvObOt/GMREqy7DThAjqPdy2HnKhTO7MnXWvqucWuBGsDmr
         1Hci8KYwc/dIzmhEjAuTFSmXDX2bf6KkGv3oc/yWdTTEDAdX7Z/vvpO05sv8KsX1Hnm5
         Fs1WaHQB57ZNNQ5/wX3Lr7pHtmU5e9rpXXyNwQKgtjTmEXnI9/F3QuXK83O8+H05JAsk
         gS69zH5Mx0L4j/ywYMw5fW+yfGdfSW+PgdH8RnVp9Pf7UD20BYeKiqQu0ZJUj3zrFGEA
         Yc6Gay8XysdQvWTCserea4/Tj9GghUmilU9/ChYYH25VO+CiPJ399nP3eExvF/6QNjlV
         hOMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028393; x=1793633193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZSbSdfxGzCD7LDy75RT+TlWivDjhKh11W0IRGV9azFo=;
        b=NvEsTX1n9TgbSMaoCM3HfL+tWiws5mG0aqcjkF9LWUoe0qgFwYIIms9XrnMWixc70T
         UFjWMJYiCIyIQsvzgfPd/7Kp0Y0Zph6Bus5ino8BgFZhCwepHACKXWdLjHMRJOkgLGJJ
         YATsjesxIA1MJ1WhZz2EndrWV4Y3214OsDE0lSlKVHzHwZ6n7v2g+IKtZ69o8/f2w9Nl
         kkeH0mde8ly/SJzwmlLe4TLHxbiim5/sjRO9ieRF1hu5kaDag7309uTd2ubJTxUsGsv3
         2+IpSQY6ToEFN+e0Yh1LmczeWzVbtmnhYkw0qefq5Y/ybgl/OaMSD0EPUrVvWHoRkwCG
         /SLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028393; x=1793633193;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSbSdfxGzCD7LDy75RT+TlWivDjhKh11W0IRGV9azFo=;
        b=WdOxD6n2u7ZdL6LTP3G8P/POipjcBYFzkR1+lDgE/Lkcon7Bg0sUFvuPiQUAYxIdKz
         3rMf15Rph1yFHWG2Xv7UARI22ciPFYXU9YgtOhFSFdDFzsicPCL1eCKt2UgEt/0aQhRQ
         3VSka7C7ObhQ/6UyBApRrGCwOa/x7t+Zy3nQiGr4hQ/J/hNc+ckBh/nrKZ1iaR5Pm6Wt
         Ptg1gut1BLZRrUtaditJ+wAyBpEvHBSzc9G1IEIVRGXDKJBkDOdocDRZnRboqmMAxJwa
         QiI1mviDAr6BPHdDb6UBzxfNtK9YeIfY59W3bS5DTF027r4fiy+lhPjGOm5RV5KqFa2D
         cwzg==
X-Forwarded-Encrypted: i=1; AKwUvBwXtnF+rIJoEKqKDlDcfSop1YpFnkKGA5f3thNNbv+MtWi64GiJAojQ96bATDnIGwx08HCFgsuHKUguFodr@vger.kernel.org
X-Gm-Message-State: AFq9FYLKNo2foDfo4GpgDiAIGM3M6ZxfX6HNY//SSG7nNlftLf55T6GJ
	9ICMdvzwBvkmrLDBGwpeeBfBDX76ztR6zt/K3UDRUf3dy7uuJLSKwoGeSUn3433tJOvoez1syPy
	fNDS8Q3aVFCzdlQqmGElNo3fT+Iy1P+RVSITJmdRA20Z3rrit1Z+dvD+utwKowZOstr2fHw+i6w
	Yx6J1zrEYFwAwI0MJw6TK3/6tLXzTkO7pnatYv13JFnBo=
X-Gm-Gg: AYBFou02RLjq+NufP7fJBq9WCeoFDlFFkaxAaz6XyiawFz6ZLHLFTv+12IBrGY2zWB1
	72+95kJfYOVOR3LYFpGapFe5mxsFEK0IpXb190Vj6dDtHLSSMe/IcYFuyhkXUQy6d//oUetBzAu
	y7tOe297nJ9a98QIbAy194lGh9n+kGg41Qcei4VnT6TK1gGClKqjVHZY/Iug==
X-Received: by 2002:a05:6820:f025:b0:70c:b3c9:e426 with SMTP id 006d021491bc7-70cb3c9e70emr2392454eaf.17.1793028393039;
        Mon, 26 Oct 2026 08:26:33 -0700 (PDT)
X-Received: by 2002:a05:6820:f025:b0:70c:b3c9:e426 with SMTP id
 006d021491bc7-70cb3c9e70emr2392424eaf.17.1793028392529; Mon, 26 Oct 2026
 08:26:32 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
In-Reply-To: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 08:26:21 -0700
X-Gm-Features: AclHuK9xjFfobxYMIbqsUtosZXmXjpwnpF60fd4rFY6glZ9mMn0xxUjVmWKugR8
Message-ID: <CACSVV03M_MzamPN5X=+bmbqOkET2QOJk8O_vQyhnjDGbSTvN2g@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/msm: move VM_BIND op validation to Rust
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX/yjve1WDhq0V
 K/trCJoJwuPj5sdk75IDW/uLqmLj9WU21ALb0GoJGceiLSTT39H77CPrGTE5yyZysinOrY+elqS
 Rk8a5Jz9sNzMLhrRjo7Q5fXsXvJqCOI=
X-Proofpoint-GUID: N_2_NdV0T6BIc9m7jTGkX5lvt2PxWpXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX+DTRQ4koGMm1
 RGMNao6ej645CilPXpCO3Fiy9s6AATeIyopbkDjUA2n3phFOyEtuWZMLlopVAYiByF3wK1Bp9nQ
 WBXs7hdvckfyRicJtBwd7sqW6BzLu6Qi996zDgugd5PxwfrWangVBx0LWK4cvTQAeXTeb8lnB4j
 F0plWP9iWokuk7DuHHQuV47jhrhb7JMHpvQ6P1YVcJtcodc9wHWK58y57HME8cntYdmoSE0VJgc
 Dosx/fOjVQTxyUFO6reewljq8HpT2AVMmsnMm9NHcbNFg+d93SAQ3w5DxPy01IoQv6i9I+Hfh7O
 Qcv1YxGDk+iPWDIhUcVMCOKUms0Ru/TqzGAvsfVlNvJVQHKJsi6+3JnJ/0As5nFkNHtPENes43f
 uM6/K+ciByyS4zEQl69RujwBBLUkhqfyBsX4SdlF0xxlNi/i8gYttKr3c0eyHvrau0ky62XskkE
 W95p58mkPa2ee6sq5SA==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf712a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IotmcVCifouJJa9mDPAA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: N_2_NdV0T6BIc9m7jTGkX5lvt2PxWpXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260061

On Mon, Oct 26, 2026 at 4:40=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Much of the VM handling code is a headache to read and maintain.
> There's a soup of mixed-signedness/size types which need to be compared
> and added and getting that wrong in C is very easy.
>
> The "(range + obj_offset) > obj->size" check could wrap for a large
> obj_offset, which let an out-of-range map be accepted and then mapped
> as nothing. Oxidize it and use checked_add() to fix that.
>
> This commit is a "get the foot in the door" type change to make sure
> that folks building kernels for Qualcomm SoCs have their Rust setup
> ready. It may/should be extended to the wider mm code once the
> appropriate abstractions are finalized.
>
> Worth noting, the C UERR() macro expands to dev_dbg() and the Rust
> implementation for that currently doesn't support dynamic_debug.
>
> The DRM_BRIDGE dependency is dropped because including RUST exposed
> some spaghetti dependencies ending at DEBUGFS and it's enabled anyway.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> (if this is rejected we may just patch the C code).
>
> Notably, this will regress some ancient configurations:
> -- arch/arm/Kconfig
>     select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN

Side note, I'm ok w/ drm/msm (or at least the gpu part) depending on
CPU_LITTLE_ENDIAN.  The combination of BE CPU and LE GPU would be a
mess.  I'll actively ignore bug reports, patches, etc related to BE.
So please, no BE!

The !KASAN bit is more worrying.  But AFAIK the intersection between
things that can support VM_BIND and armv7 is the empty set.

BR,
-R

>
> Smoke-tested on Glymur
> ---
>  drivers/gpu/drm/msm/Kconfig        |   2 +-
>  drivers/gpu/drm/msm/Makefile       |   1 +
>  drivers/gpu/drm/msm/msm_gem_vma.c  |  66 +++------------
>  drivers/gpu/drm/msm/msm_vm_bind.h  |  16 ++++
>  drivers/gpu/drm/msm/msm_vm_bind.rs | 160 +++++++++++++++++++++++++++++++=
++++++
>  rust/uapi/uapi_helper.h            |   1 +
>  6 files changed, 188 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index ed1c4775d1e9..f5c4749f8e95 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -3,6 +3,7 @@
>  config DRM_MSM
>         tristate "MSM DRM"
>         depends on DRM
> +       depends on RUST
>         depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>         depends on COMMON_CLK
>         depends on IOMMU_SUPPORT
> @@ -63,7 +64,6 @@ config DRM_MSM_VALIDATE_XML
>  config DRM_MSM_KMS
>         def_bool n
>         depends on DRM_MSM
> -       select DRM_BRIDGE
>         select DRM_BRIDGE_CONNECTOR
>         select DRM_CLIENT_SELECTION
>         select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 1e246616f83f..826759a820a0 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -129,6 +129,7 @@ msm-y +=3D \
>         msm_ringbuffer.o \
>         msm_submitqueue.o \
>         msm_syncobj.o \
> +       msm_vm_bind.o \
>         msm_gpu_tracepoints.o \
>
>  msm-$(CONFIG_DRM_MSM_KMS) +=3D \
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index f687a629629d..3c453b034e8f 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -14,6 +14,7 @@
>  #include "msm_gpu.h"
>  #include "msm_mmu.h"
>  #include "msm_syncobj.h"
> +#include "msm_vm_bind.h"
>
>  #define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, =
##__VA_ARGS__)
>
> @@ -981,23 +982,12 @@ vm_bind_job_create(struct drm_device *dev, struct d=
rm_file *file, struct drm_gpu
>         return job;
>  }
>
> -static bool invalid_alignment(uint64_t addr)
> -{
> -       /*
> -        * Technically this is about GPU alignment, not CPU alignment.  B=
ut
> -        * I've not seen any qcom SoC where the SMMU does not support the
> -        * CPU's smallest page size.
> -        */
> -       return !PAGE_ALIGNED(addr);
> -}
> -
>  static int
>  lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *=
op)
>  {
>         struct drm_device *dev =3D job->vm->drm;
>         struct msm_drm_private *priv =3D dev->dev_private;
>         int i =3D job->nr_ops++;
> -       int ret =3D 0;
>
>         job->ops[i].op =3D op->op;
>         job->ops[i].handle =3D op->handle;
> @@ -1006,48 +996,11 @@ lookup_op(struct msm_vm_bind_job *job, const struc=
t drm_msm_vm_bind_op *op)
>         job->ops[i].range =3D op->range;
>         job->ops[i].flags =3D op->flags;
>
> -       if (op->flags & ~MSM_VM_BIND_OP_FLAGS)
> -               ret =3D UERR(EINVAL, dev, "invalid flags: %x\n", op->flag=
s);
> -
> -       if (invalid_alignment(op->iova))
> -               ret =3D UERR(EINVAL, dev, "invalid address: %016llx\n", o=
p->iova);
> -
> -       if (invalid_alignment(op->obj_offset))
> -               ret =3D UERR(EINVAL, dev, "invalid bo_offset: %016llx\n",=
 op->obj_offset);
> -
> -       if (invalid_alignment(op->range))
> -               ret =3D UERR(EINVAL, dev, "invalid range: %016llx\n", op-=
>range);
> -
> -       if (!drm_gpuvm_range_valid(job->vm, op->iova, op->range))
> -               ret =3D UERR(EINVAL, dev, "invalid range: %016llx, %016ll=
x\n", op->iova, op->range);
> -
> -       /*
> -        * MAP must specify a valid handle.  But the handle MBZ for
> -        * UNMAP or MAP_NULL.
> -        */
> -       if (op->op =3D=3D MSM_VM_BIND_OP_MAP) {
> -               if (!op->handle)
> -                       ret =3D UERR(EINVAL, dev, "invalid handle\n");
> -       } else if (op->handle) {
> -               ret =3D UERR(EINVAL, dev, "handle must be zero\n");
> -       }
> -
> -       switch (op->op) {
> -       case MSM_VM_BIND_OP_MAP:
> -       case MSM_VM_BIND_OP_MAP_NULL:
> -       case MSM_VM_BIND_OP_UNMAP:
> -               break;
> -       default:
> -               ret =3D UERR(EINVAL, dev, "invalid op: %u\n", op->op);
> -               break;
> -       }
> -
> -       if ((op->op =3D=3D MSM_VM_BIND_OP_MAP_NULL) &&
> -           !adreno_smmu_has_prr(priv->gpu)) {
> -               ret =3D UERR(EINVAL, dev, "PRR not supported\n");
> -       }
> -
> -       return ret;
> +       return msm_vm_bind_check_op(dev->dev, op->op, op->handle, op->obj=
_offset,
> +                                   op->iova, op->range, op->flags, PAGE_=
SIZE,
> +                                   drm_gpuvm_range_valid(job->vm, op->io=
va, op->range),
> +                                   op->op =3D=3D MSM_VM_BIND_OP_MAP_NULL=
 &&
> +                                   adreno_smmu_has_prr(priv->gpu));
>  }
>
>  /*
> @@ -1118,11 +1071,10 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *jo=
b, struct drm_msm_vm_bind *args
>                 op->obj =3D obj;
>                 cnt++;
>
> -               if ((op->range + op->obj_offset) > obj->size) {
> -                       ret =3D UERR(EINVAL, dev, "invalid range: %016llx=
 + %016llx > %016zx\n",
> -                                  op->range, op->obj_offset, obj->size);
> +               ret =3D msm_vm_bind_check_bo_range(dev->dev, op->obj_offs=
et, op->range,
> +                                                obj->size);
> +               if (ret)
>                         goto out_unlock;
> -               }
>         }
>
>         *nr_bos =3D cnt;
> diff --git a/drivers/gpu/drm/msm/msm_vm_bind.h b/drivers/gpu/drm/msm/msm_=
vm_bind.h
> new file mode 100644
> index 000000000000..e8aa6adb9181
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_vm_bind.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __MSM_VM_BIND_H__
> +#define __MSM_VM_BIND_H__
> +
> +#include <linux/types.h>
> +
> +struct device;
> +
> +int msm_vm_bind_check_op(struct device *dev, u32 op, u32 handle,
> +                        u64 obj_offset, u64 iova, u64 range, u32 flags,
> +                        u64 page_size, bool range_valid, bool prr_suppor=
ted);
> +int msm_vm_bind_check_bo_range(struct device *dev, u64 obj_offset, u64 r=
ange,
> +                              u64 obj_size);
> +
> +#endif /* __MSM_VM_BIND_H__ */
> diff --git a/drivers/gpu/drm/msm/msm_vm_bind.rs b/drivers/gpu/drm/msm/msm=
_vm_bind.rs
> new file mode 100644
> index 000000000000..164208e0a1b4
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_vm_bind.rs
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//! VM_BIND operation validation for the MSM driver.
> +
> +use kernel::{
> +    bindings,
> +    device::Device,
> +    error::code::EINVAL,
> +    prelude::*,
> +    uapi, //
> +};
> +
> +/// Validates a single VM_BIND operation.
> +///
> +/// Returns 0 if the operation is valid. Otherwise logs the reason and r=
eturns
> +/// `-EINVAL`.
> +///
> +/// `page_size` is the granularity that `iova`, `obj_offset` and `range`=
 must be
> +/// aligned to. It is the GPU's alignment rather than the CPU's, but no =
known qcom
> +/// SMMU lacks support for the CPU's smallest page size.
> +/// `range_valid` is the result of `drm_gpuvm_range_valid()` for this op=
eration.
> +/// `prr_supported` is only consulted for `MSM_VM_BIND_OP_MAP_NULL`.
> +///
> +/// # Safety
> +///
> +/// `dev` must point to a live `struct device`.
> +#[no_mangle]
> +pub unsafe extern "C" fn msm_vm_bind_check_op(
> +    dev: *mut bindings::device,
> +    op: u32,
> +    handle: u32,
> +    obj_offset: u64,
> +    iova: u64,
> +    range: u64,
> +    flags: u32,
> +    page_size: u64,
> +    range_valid: bool,
> +    prr_supported: bool,
> +) -> c_int {
> +    // SAFETY: The caller guarantees that `dev` is a live `struct device=
`.
> +    let dev: &Device =3D unsafe { Device::from_raw(dev) };
> +
> +    match check_op(
> +        dev,
> +        op,
> +        handle,
> +        obj_offset,
> +        iova,
> +        range,
> +        flags,
> +        page_size,
> +        range_valid,
> +        prr_supported,
> +    ) {
> +        Ok(()) =3D> 0,
> +        Err(e) =3D> e.to_errno(),
> +    }
> +}
> +
> +fn check_op(
> +    dev: &Device,
> +    op: u32,
> +    handle: u32,
> +    obj_offset: u64,
> +    iova: u64,
> +    range: u64,
> +    flags: u32,
> +    page_size: u64,
> +    range_valid: bool,
> +    prr_supported: bool,
> +) -> Result {
> +    let aligned =3D |addr: u64| page_size.is_power_of_two() && (addr & (=
page_size - 1)) =3D=3D 0;
> +
> +    if flags & !uapi::MSM_VM_BIND_OP_FLAGS !=3D 0 {
> +        dev_dbg!(dev, "invalid flags: {:x}\n", flags);
> +        return Err(EINVAL);
> +    }
> +
> +    if !aligned(iova) {
> +        dev_dbg!(dev, "invalid address: {:016x}\n", iova);
> +        return Err(EINVAL);
> +    }
> +
> +    if !aligned(obj_offset) {
> +        dev_dbg!(dev, "invalid bo_offset: {:016x}\n", obj_offset);
> +        return Err(EINVAL);
> +    }
> +
> +    if !aligned(range) {
> +        dev_dbg!(dev, "invalid range: {:016x}\n", range);
> +        return Err(EINVAL);
> +    }
> +
> +    if !range_valid {
> +        dev_dbg!(dev, "invalid range: {:016x}, {:016x}\n", iova, range);
> +        return Err(EINVAL);
> +    }
> +
> +    // MAP must name a handle; UNMAP and MAP_NULL must not.
> +    match op {
> +        uapi::MSM_VM_BIND_OP_MAP =3D> {
> +            if handle =3D=3D 0 {
> +                dev_dbg!(dev, "invalid handle\n");
> +                return Err(EINVAL);
> +            }
> +        }
> +        uapi::MSM_VM_BIND_OP_UNMAP | uapi::MSM_VM_BIND_OP_MAP_NULL =3D> =
{
> +            if handle !=3D 0 {
> +                dev_dbg!(dev, "handle must be zero\n");
> +                return Err(EINVAL);
> +            }
> +        }
> +        _ =3D> {
> +            dev_dbg!(dev, "invalid op: {}\n", op);
> +            return Err(EINVAL);
> +        }
> +    }
> +
> +    if op =3D=3D uapi::MSM_VM_BIND_OP_MAP_NULL && !prr_supported {
> +        dev_dbg!(dev, "PRR not supported\n");
> +        return Err(EINVAL);
> +    }
> +
> +    Ok(())
> +}
> +
> +/// Checks that `[obj_offset, obj_offset + range)` lies within an object=
 of
> +/// `obj_size` bytes.
> +///
> +/// Returns 0 if it does. Otherwise logs the reason and returns `-EINVAL=
`.
> +///
> +/// # Safety
> +///
> +/// `dev` must point to a live `struct device`.
> +#[no_mangle]
> +pub unsafe extern "C" fn msm_vm_bind_check_bo_range(
> +    dev: *mut bindings::device,
> +    obj_offset: u64,
> +    range: u64,
> +    obj_size: u64,
> +) -> c_int {
> +    // SAFETY: The caller guarantees that `dev` is a live `struct device=
`.
> +    let dev: &Device =3D unsafe { Device::from_raw(dev) };
> +
> +    let fits =3D obj_offset
> +        .checked_add(range)
> +        .is_some_and(|end| end <=3D obj_size);
> +
> +    if fits {
> +        return 0;
> +    }
> +
> +    dev_dbg!(
> +        dev,
> +        "invalid range: {:016x} + {:016x} > {:016x}\n",
> +        range,
> +        obj_offset,
> +        obj_size
> +    );
> +    EINVAL.to_errno()
> +}
> diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
> index 489748ef642c..38741220270a 100644
> --- a/rust/uapi/uapi_helper.h
> +++ b/rust/uapi/uapi_helper.h
> @@ -7,6 +7,7 @@
>   */
>
>  #include <uapi/drm/drm.h>
> +#include <uapi/drm/msm_drm.h>
>  #include <uapi/drm/nova_drm.h>
>  #include <uapi/drm/panthor_drm.h>
>  #include <uapi/linux/android/binder.h>
>
> ---
> base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
> change-id: 20261026-topic-vm_bind_rs-5551b8014396
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
