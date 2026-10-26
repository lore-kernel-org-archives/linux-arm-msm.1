Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793025562;
	b=Rr6hlsGob5laqXGICyIFuW5QjkSRj37r7dzk1KvXUEvFGukPeDNWeFtY7hLHJzr2gzBZ
	 fdkPwJ37hmPWeY5+qunABjmxR9uOu5jBj0rvWAuDQSqaHdBx0bS5O7zegStKnNjZe6ahv
	 ZO5WLsEV3FLNwQ8sHrl2DUcoWDlTZg59dZ/DQN/a9bmbnachA73c7Nb4UW76hUTsFp5fQ
	 rzUuyxbwNiGgCZYP7mcY3gNMzAzz0YAIhzOpMAnE7AVr8CiF5q4rLKElAl0pbiRiGDZF6
	 LA1nK3u+qLoTMSW5BvDWxUWHweelDFt7XK7gQGhtRCmoDWnXpmIXttNAN36h8FmEH9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cG+5ZJDH6WTFQd7f8Ue0mRhz7/NIdNLfzYpxPElRQvk=;
	b=OnW7r+/4sUS79OKQ/UPsnPRCWg1ketHJ6lU2jGTb8X3lZbiVzp/TbE7INkqsOAYP1R4r
	 eyEQA4MmVmRW6aoRIqAvqTLqFvJFkvwGxpykXir59R0jx4EG/E6qGBd22LnCns5/Q6iCw
	 jMxpBMjlFu552iUlTCtJtZI+4PgBcW8Xyz0nl+WDoEwAO5WhDHd5Yc+JuLjTb05O0Jads
	 sMEjN/uQ+V+GqpMNNDBIcZIyte7e7ByRAgVcMTBhC2S3VnuBXEBFksB2ojFBzfqiI5WNE
	 L7RUiUx9JVWPIl+368PcKAIQe5Ljy9M5oWjXfMtIRjI8dTxRzIrdTCpuKBacK8rwz/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TufGs7rO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HHsgg6+m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD60F606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD60F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TufGs7rO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HHsgg6+m
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEb9YM2498299
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=cG+5ZJDH6WTFQd7f8Ue0mRhz7/NIdNLfzYpxPElRQvk=; b=Tu
	fGs7rOZCp6A1hqyc2qJ5uLRkEggOlKOGyyqM6/4kD9/ZasENiARjpeDx2YoA9IzY
	qAyNvqEaUCs0cZTWD/ztIOS37mpskD3xpy6CsJqZi2HTmE11ZITZN/81SU8OoY0X
	BEUEBffdJErskTqDZV75oSXbjrF1njOX4GPojLLFj1RGbOSpQ8DRpxwU0ynd4IL2
	KkQGJEyXU4q9gbm7COSXQzxVjq4rOwhFNJAq86LCvWS0Fo8AgOhlddMKXz2JEwzK
	Q1PTuBvQFRHsgpN4SafjC02VlFmPIQ3e3S1zxwFh9/bkO9myXP8joEDyhJCCBL4I
	UzMoh/fy01o75ZtD2c5Q==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smr0ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:39:20 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-83f6f9096baso4535316a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793025560; cv=none;
        d=google.com; s=arc-20260327;
        b=F6BOQOoep+qIjUDzWZwaI7u4+dDPkMUhWKmUwKxJz3jpByGIs2gkZX8XASjOLoxARL
         RSaSiL0fRF9TKKDfR4G1BInUrJGprbMHbdgutHYcJZOv1GEQ2zZm1cNT6NMSSsZVDM4+
         VIyZGBn+OUsZXsB6WXTUZC9jRJUGoINHNbJ/2Up7fmVugm4XLOKj4u2JO30oUgstEv0D
         m/lxhLL5F96H79jOpwf2mAwvj5GdKQxzvxRAiwnPY5mNHOtaFJIkXNWo5kOgr1WhL6h0
         IgkqxXW9SHhUVUfXCO0BbU3gN2NZlr3ZJEyp9Zb3y6TBo++sQ5NVcdZ9XeIAwglxMJsG
         bFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=cG+5ZJDH6WTFQd7f8Ue0mRhz7/NIdNLfzYpxPElRQvk=;
        fh=z98Zt0D6PVki6w4x5FhZw67ckgN/kZNSpwcrJ7C+9jo=;
        b=XV75atSjQeqz9QXK31ohi48ZjfhKeDOTfbBq83+2U3TBp/OncuKSxCQsHCRbmT9z2n
         z3hBTBnUOMxUlmq1BkcIhSeFeaR6w/0CYynZRFbseN7/wm2tbzZfvCndyahRscoPNDVA
         x8b2tUvOya6rPwC4ANM0US2Z5ax4yOgWUWh8uFRxqZUxuPS+g/jcNq8CF02cmP90bu9E
         eTMFmoTAtBspKnvNKSlB2MV37DQcOwmhSLae8KrtXXXfQGxIgS9rRec7ipx6Of62NNJR
         sGemSCw9/fn9dB2opF5C4Ln2zrFbbOgPYTdawhmvjD8RTPfRsNWezvrsQQJAuGPEQi88
         akPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793025560; x=1793630360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cG+5ZJDH6WTFQd7f8Ue0mRhz7/NIdNLfzYpxPElRQvk=;
        b=HHsgg6+m85J7EsdN8nHt7o5kZjYfSqOi4PpnlzIk36Bs/pQ5Kg/+sLimLWLweTU6uE
         LYu3muy0jn4Qk4P93TTfy8bVeUhXQLqnZrILrOQ5SzNCbV4EbMtniFloxj1L67W9G9dL
         0WaGkUxoxUs6rFlBPu0tKyS9JDkwR8XeZ0vC9qfRcYxFPQINM/dxbzaXOU3Gm6IpVpCG
         9VeEbJF/4U85EWwC63MrxXSnlPgkXufjgbhUy/RYIHZFTnWEpUhr40umx9URLPRHtOvt
         zRopu3bZt/I62qPpmthQi1yKPZs7uTI5bWDFr0CFKFilpad2we98kxtcWEHxS8vmp2P+
         z7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025560; x=1793630360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cG+5ZJDH6WTFQd7f8Ue0mRhz7/NIdNLfzYpxPElRQvk=;
        b=JyS/GPvVpQfL6zFzBY2fBzK/GSIjsseDeeSKu3ZJUeUDAYX48OJd5rkqOghaAgFs8y
         xS4p3HJDu5bvmxBosdFSDimr06yZHiRKLc+Yo9etRrWhOUXNxedtExFiOmymirsEKjSz
         G258k/GiZ7yEk7oXblx0rTpZLWkGCFEo/vkbEomIjpdfB+2rC6j3b4SvzGaPoM/fe4g7
         zWbtmfQ1A4urgiCaxnUwl7sKX85zkTjxwvXNyW/XOW3+WtUzpQTTx4mlx4un5RYXRYEx
         cybACEnsxgsgK6Bf85PSgyjaFv2TuceZpoXbrq1kVI8Yayv5+asUdi8nRC4WddTqjLKJ
         3E5g==
X-Forwarded-Encrypted: i=1; AKwUvBx5gGJqr7nIxt1qfA76rCkkJ+f8dLFanm4OhgP15/sItdoZvWuvku39YuDbI6iCwovRihpy5zlzZpSTD1+x@vger.kernel.org
X-Gm-Message-State: AFq9FYIFbo8w8pDFpXa5ZGlZryOX8tAwRQutO3X2Ml/uY32yd/gLkiLq
	1rLno4K6d7g/AjDxQ6Cy4/Slw5eildV5O1Ln7LW1ZplJwqaCixtL6gRScGEcDL4+Zh/m8qX9A7D
	04fD76vNL4yxUIn9cVlvI3uhKCG5u++ghJf3+3BseAJxVTKyDQwBs9Gqk5ECBrEAXEkT434ssSa
	5ULyxiWLUJ1ALujRauX2OfCHnhIlBiTgRjEoAgsIxBk3M=
X-Gm-Gg: AYBFou2AIqi7eAHup8VjboTSfleMvdf0iWzcbE/sPsl39lRbevPybuyJmp9Y5tZukQo
	QeFR2PwwsF4USLpiKHYxE4O6pT00OiyU4937NyXrijShCrUTaLD5h0DiRf2JIQJFBkzBWET2jf9
	9OYi/C5MoCSF+vYXZKFSIlilOn8GZx5Uesxl/IZSqmIffNAhBJxT9IDd93Yg==
X-Received: by 2002:a05:6870:326f:b0:46a:fcd5:256b with SMTP id 586e51a60fabf-4a83f40a990mr4068919fac.10.1793025559617;
        Mon, 26 Oct 2026 07:39:19 -0700 (PDT)
X-Received: by 2002:a05:6870:326f:b0:46a:fcd5:256b with SMTP id
 586e51a60fabf-4a83f40a990mr4068877fac.10.1793025559024; Mon, 26 Oct 2026
 07:39:19 -0700 (PDT)
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
Date: Mon, 26 Oct 2026 07:39:07 -0700
X-Gm-Features: AclHuK9moS-wK0T0Ay7yI6-qb5zwTR6wsc5zXKwz1o08nyGnkulQq8j7YSMoXE8
Message-ID: <CACSVV01LdgUEAG+xyhWRoWe5Y=N7KztU1p4kQyzeW_KeWWAA1w@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: YC9UrvKgWuQN2b6_LRd3q8xnZBlhiW6I
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6adf6618 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SuwJAg6KbAu1AtQxkoUA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: YC9UrvKgWuQN2b6_LRd3q8xnZBlhiW6I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX4eYzOjPgF3ds
 sUXLfi73ftQGv7d4R0zSVqX5ySjsJ+rU4XtkAFSgt4o1of7LxqTRYg193dl0WGfppkfvPtmTQnj
 cXzPX0Pgv7BV+Pki910S280SKzLoktg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX3BgVNj99t+Rt
 XXX+RqYCra7s75OI8+QdlJWF/87khjge/xGcd6mCjGEYcjWwkk3cLa+xcz/VSsa3D2c3tatfNs3
 C+Dsv4m7MRfZGsRU5puXHKu7QG9UJCKTxjqtjpUcU6fudlxVKUdDhSs8eVJdDnw0T81AvVud3PZ
 QN1VynNaWr2e33F/By/SM67MGSxwL8/Bg2NRzg25GOEruWyVqt24rQXolqrmR+N+FeLsnRBkGSF
 ceG7jxLGsTfYy4gRb3L6I3q0xsVbH9IR5niO8hTJT2FpT6KSYI+8FikGiUSa5ffJJpygIWCDNiw
 tO/GXwNLdu2Kz9uxU25gnr17tcwGYxn7ZQBk/Z2SK/Dhl3T7HkN5dnhjBn2MKfKCzH4YXVI6CjM
 xVOmsjfd7r/E89CeWMy0w0/Jwq91yopVA8Pn2ilucGQ+eoyaS9XxU0LGzoE7WoeNJlqQ3VfiQl6
 mIY2BzoNeN2w+kArj5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260058

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

I think the ioctl surface area is a sensible place to start using
rust.. but seems like this patch could instead be a 1-ish line patch
to use check_add_overflow() here?

Big picture, I'm a bit more interested in the
goto-error-unwind-spagatti-monstors.  Even there, just using more
cleanup.h would be an improvement.

BR,
-R

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
