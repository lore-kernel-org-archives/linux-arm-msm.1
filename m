Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628349;
	b=OAPsxMbOw9LZRcJ2DZXx9sR1Vg+EDOST2tmlrwnhlIgAvcdflGHszzNUnlMgc36HxS/u
	 Tg4snMyX/1eOjLhimcpIDi7g885g33dLI/D2CfIVkPDXw7eDJwVXj8UKOo/1FJyYvau1B
	 e3MWI7zBihIm3LbjvcV0dF+otX3veSdWY9nhwNbZ37jK0nf8DpEiN0XS6OD8iWv6u7I12
	 2MQz1iygfQCvRj6yOLJHIXTUv8Zjj/RSdh7UW3tIJ/+Vb71C0Vx3Pw7KJN38sAvGtMPXY
	 WTY06u66pz8txsRqbxP6zMFHDqOxc8yrHDoXbJGgJB6Tge/bakD5t9wRcpAszbMfeEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QdycHGg0fUIiKpM46/IUqKDZojkpKRQQ9ApR9IX6+0I=;
	b=hGaHzwcwuzQNpQS2osw4XRzlDww0DQ//rv4651mMzKjMRDlez/Gb3eO2zvN+pAAGMkQF
	 AsBa1lmcL/x3/ZkOtzEV330ntn+4iB21YyH2VF1tcmj3jVSAcDcAZcG3LPEV8sBZQ+M0C
	 /Lclf273jN9BGfpp4r0rvWx8WCt7en6BYs5ie2PE3fapSPqX3dmrpSWrrUOYgeVBEdRvw
	 FyJcX+edZG0Ai2SjoY5RaWoLxqtEo35coQAg2xAQCmTdKq6qHf+Q30JT+LylWxSS2qutR
	 auXKfqihfYikPmUGIwGBCH/KYuvdSYAfvs14DCmoTP7WeQy1KV2Vsnj7MIhpgYBCfBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G4iInmTl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EprWRhW8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF2D606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF2D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G4iInmTl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EprWRhW8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpF7Y3512241
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=QdycHGg0fUIiKpM46/IUqKDZojkpKRQQ9ApR9IX6+0I=; b=G4
	iInmTl27oP0kQNjx9r3lTd36qOUwWh73ZLrrqYbvjtyt1xTO5ANqWItkUMg7Khm0
	+jRyGqqGngtZJBSVNIEfxp3ZjTboIBfryV56FjOQRhABM5OyomY22Ofpz/51JZGQ
	/2JxB2HWrqYrQT5RSdIAcr7N2AIzKpQs8rguNWV+aU7TLSGUGxa/10hgh0khWsI9
	xLFNAN+7ggvB3tSGQ5W85XYDtfsNC5klA9YWXxj3Outc1p6m3P/pw2RSJ0WcT/fY
	LJbwIE8XWn0rycZgRJWo+AakWciCMsqUQALH9cgzta582AxQgGsk7HB9YfXSkYcw
	YUdhGmlLM+9OtktS0O/Q==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrh5d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:05:48 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-702a9029845so2779125eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:05:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793628347; cv=none;
        d=google.com; s=arc-20260327;
        b=KlDNVP8+UpYc/JUF++DXxZxt+TofVeK08u4ytio1jhwykWORNDp8JAO74mcxaq0iQn
         fjs/GGTyWnEG/HLB5aJVUjwIXvVw3AeLn+bsQxMPwy7REqoWLhoecQ9w0tmnxX6TaVfc
         WOdloBu9iImj0vvwp1/TRN/rZgk/vemh+vN4WPAybgFMyPhoQm2B30ik+cgwCiDLl1Hf
         AqTcC7x+KMlU1l/P1FVXjZSiBEquKcXaBBaU1Vv6K1LyBxP6jdOqapAvNbIymKuHcQtg
         ei3q4FpERnYX8ZRSxKtZDQIOCx03ngMRaz0/qI8SP4bajmZY4VkylIGprGB57t7KWSiU
         xVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=QdycHGg0fUIiKpM46/IUqKDZojkpKRQQ9ApR9IX6+0I=;
        fh=GixtiyTizHNrXtLd5QXcHsj/Q/19yCTKCaLvtGFfgOI=;
        b=eZEvhNTlcY8dvXioTAO4Yo36rcy8XxqHcwGkqQdkN/CbjJxd/EglBO09cI0+QLcVeA
         sP7wLrDxDHUTR4PKb6eIAQsmVE3Qh9VnVDGBrhakgXurdPB6t1xGv9vZZ+vrj34Li2hR
         4+1g0sWHZMf9kYp5a0jk1JBCRRZugNTSOHv1i6D19vPiElEcGRfRgkuiT5fGwoAvXvhD
         to4d/HQEyP9xLxVuklbSg9S4IK+ViBusRKlQyETFQWpd/Lvs8bshbClXjznBuodKzTko
         ArixmKKubRcvuyW0Os+t3MBtVPJMWtsL/4kuZg/A7apOkMYrNBOwDiIDVBc/k5I3KaiU
         uV1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793628347; x=1794233147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QdycHGg0fUIiKpM46/IUqKDZojkpKRQQ9ApR9IX6+0I=;
        b=EprWRhW8eXsHOPLvJe+loT2GJwR3eGZhxsqTd8Dk5HNHnNwL2rtVKrFu8/11QY7JEb
         r8VaxuUyBUmYGKp0nEBHEVyGT6fuTKrBWg/wvZXtwyyyJ5GhJTs5RXlKC8GqWYh5vN9w
         qdYRnha9oWJDkzFyIinLJOACjpdbaBMF+k9ZKrifx36bUOhw4gJC3UuaqN8pNTsjRMoQ
         EkBHbxttg3dnXCt4I231Ss8DTLQaLFmQdzqsc+VHxQGvT/J2VhQOo5+ARNgULfXbwA2C
         hGGmv0GOZ+PB27u9toxSVN2JmHWx0yh4YIYpn0sUb7gJ/GXfE360sdM1s0D60iv1VFBT
         +AnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628347; x=1794233147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QdycHGg0fUIiKpM46/IUqKDZojkpKRQQ9ApR9IX6+0I=;
        b=SSGu30l8PMKM6h1E23qKtz7dyhZn2Vo3HS07QKaQlrl7iKjWxaILnJmXdMeZ9U8BoH
         1LOU6VyWwjwd+sMHCdF0c3eMAV9Xz++gL0yknpOxSlnufP2NQmBh9ChVyby8axh3Lk/n
         Z9Mrh7sEthBZ9i1aSJeyL/Pm4DsbcvZtbfMJVoTGyTrXh8ZJ/yhMBzFXb2ACqy9PhW4m
         PWV7JeNU8IPwPC1PbwhTZo4VoVlajMcroZ9/k7OKDVRV4Eo98dC/RGdTtXB67oEijXz+
         ZSqDfnDpH5Hq/hZkW9lqTrEULLfKnaQcdBHmwtzskvDqMfD+/HY3xP3Uy25zXJQfoy1S
         UeDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC0kPP2fYY1msky8SyvDkQ+vgLj6nG7jmLfYaawdnDmyZAHqBRkEj9k9GIqK1Y1+V8yxC5jUMWC0Nf/nke@vger.kernel.org
X-Gm-Message-State: AFq9FYJodCoJXXtWtkx4sKNTY35vHCZMXjVGf2giIqwuWJQjD4R8SuVp
	ND2jIz63hLHIzM9+bhCq7BXXNp790e0XIRl8zDBTeO/yrg72hjKi1LhMBmM0v8Zrt129kdUhm6l
	RJfgz5BCSubOYwtofuU+VxeWGsfM0vPT46kXqrdzkzGnBLIbuKgRh1zkQ1pmM+tQrJxz18mcaDN
	/TD8MBQuBQNVXE4g0GlyBTel8dhWflPvN0Ule7b1q+ALg=
X-Gm-Gg: AYBFou3vB/yMCQYupwbdnOhFGfNYy3rYpYvgLjHIdyKm6kGZzQbDWLBqOLF+H8XOLLd
	XifcmbkGToiNLtIvOoD7pEv0qJlkZPgrLX/W9E5K2WEYBKi0fcXKuSp1avovYVtyFmYbdBbJ0yC
	IjPmNF/ZHgL51CMg8Lh9IBFy5uuiC02DZVCLvmatt6NO/GSnvNwV9fJrNivw==
X-Received: by 2002:a05:6820:708c:10b0:6da:453d:7cdf with SMTP id 006d021491bc7-714f2a30724mr3699771eaf.57.1793628347194;
        Mon, 02 Nov 2026 06:05:47 -0800 (PST)
X-Received: by 2002:a05:6820:708c:10b0:6da:453d:7cdf with SMTP id
 006d021491bc7-714f2a30724mr3699745eaf.57.1793628346684; Mon, 02 Nov 2026
 06:05:46 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101175553.53746-1-nicoangelodelacruz@gmail.com> <20261101180508.66598-1-nicoangelodelacruz@gmail.com>
In-Reply-To: <20261101180508.66598-1-nicoangelodelacruz@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 06:05:35 -0800
X-Gm-Features: AclHuK_tAlZOM671p6g-xOcfl-LxahyVIOmGtH-YZjrNdgYN2eW-woSkdRiVpCs
Message-ID: <CACSVV00Gv8V=V-gdwMqsvaE63Wxmw29aTS0wpX1jjegzJU6mhQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/a8xx: add a memory-only GPU crash state
To: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae898bc cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8 a=pGLkceISAAAA:8
 a=dnCqE_r5BN6qDrZ5i3wA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Mlms0l7dlswpYzdKhxBo81CM2W7HBvbS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NiBTYWx0ZWRfX2bRNWJIcYvV6
 HJsKR1ba39tQwaOyJSDqw0x4Jxpq6oU/O8LVRuMkOTfNQDqLlCdx5+5SvVl6WuQQv/3jIoM8J0v
 +0i5SwJoXgfo/nw9Txfnl8pqwM3mtXA=
X-Proofpoint-ORIG-GUID: Mlms0l7dlswpYzdKhxBo81CM2W7HBvbS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NiBTYWx0ZWRfXwDGZRg42cR++
 TMjDB4gntlWHxYIKlDQqQ35EeNoXcf4CKK52zmyLvmAfhrao5vWdwy75S0gPtO6WzcD8xzTxJNu
 VBED1gmseFU9UQisBGnyVxZ7KH2Xxi/mfCcnDFfqEJ3EpDkllvKtDGkuPH/ZGH2HrVrM7oJjwGB
 qgSzPMbFcHVz1ZM+CEuMuq2zI7/6O5whmO1p2ouRDVllSVQsczOpEwihnqeZtiOBFpOulzX0iJN
 bl7/pebwYjLYx+Uj9iHdM31scDJZmMKpgVXukqEeBMAm2YIqRp2KXE2pv9uIcKjI4QPL5g5vG01
 Dy4mjSZqgZIHRrwSblj/GtuuEraxCZeeoJFiKtIrgQscP5J5L7YiyRo5503kWFRMY/RXntq3yKz
 gYUGr2lf/CGBjzg70QKFLUK+t5Zw/M4VrMCp1BSj2w9BtBnkefCy0SZ+GMZkfp60EBpb3xRwIxA
 Ad+9xs/bH6K/Avggrtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020056

On Sun, Nov 1, 2026 at 10:05=E2=80=AFAM Nico Angelo Dela Cruz
<nicoangelodelacruz@gmail.com> wrote:
>
> a8xx had no gpu_state_get callback, so no devcoredump was ever
> produced when the GPU hung or faulted.
>
> Add a8xx_gpu_state_get(), a memory-only snapshot: the generic Adreno
> state from adreno_gpu_state_get() (ring buffer contents and fences,
> with rptr read from the hw_apriv shadow rather than a register), the
> GMU log/HFI/debug buffers and the HFI queue history. No register is
> read, because the GMU may be wedged and GX powered off when this runs
> from the recover worker or the SMMU fault path. As a result a8xx
> dumps always report "gpu-initialized: 0", as a6xx/a7xx dumps do when
> GX is off.
>
> The shared part moves out of a6xx_gpu_state_get() into
> a6xx_gpu_state_get_gmu(), which also runs adreno_gpu_state_get().
> It is a pure move except for a new gmu_regs parameter that gates
> a6xx_get_gmu_registers(); a6xx/a7xx pass true, so their output is
> unchanged. Reviewed with git diff --color-moved=3Ddimmed-zebra: apart
> from the moved lines, the new code is the helper's signature, the
> "if (gmu_regs)" check, the locals the helper needs, and the call.
>
> Tested on an Adreno 830: IGT msm_recovery gpu-fault (6 of 6 runs) and
> natural GPU hangs produce dumps with the ringbuffer, gmu-log, gmu-hfi
> and queue-history sections; capture takes 1.1 to 4.0 ms.
>
> a6xx/a7xx: build and pure-move review only, Tested-by welcome.

If you are interested in a8xx gpu devcoredump support, may I suggest:

   https://patchwork.freedesktop.org/series/176505/

I'm still looking for someone who has a830 who can test it

BR,
-R

> Signed-off-by: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  7 +++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 47 ++++++++++++++++-----
>  3 files changed, 45 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 92e8c8abb..0f4b0af0a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2918,9 +2918,16 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs =3D {
>                 .active_ring =3D a6xx_active_ring,
>                 .irq =3D a8xx_irq,
>                 .destroy =3D a6xx_destroy,
> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> +               .show =3D a6xx_show,
> +#endif
>                 .gpu_busy =3D a8xx_gpu_busy,
>                 .gpu_get_freq =3D a6xx_gmu_get_freq,
>                 .gpu_set_freq =3D a6xx_gpu_set_freq,
> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> +               .gpu_state_get =3D a8xx_gpu_state_get,
> +               .gpu_state_put =3D a6xx_gpu_state_put,
> +#endif
>                 .create_vm =3D a6xx_create_vm,
>                 .create_private_vm =3D a6xx_create_private_vm,
>                 .get_rptr =3D a6xx_get_rptr,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index 79912a33e..03432abf9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -338,6 +338,7 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_st=
ate *state,
>                 struct drm_printer *p);
>
>  struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
> +struct msm_gpu_state *a8xx_gpu_state_get(struct msm_gpu *gpu);
>  int a6xx_gpu_state_put(struct msm_gpu_state *state);
>
>  void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, =
bool gx_off);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu_state.c
> index 26c17861c..a3751358a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1629,25 +1629,19 @@ static void a7xx_get_indexed_registers(struct msm=
_gpu *gpu,
>         return;
>  }
>
> -struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
> +static void a6xx_gpu_state_get_gmu(struct msm_gpu *gpu,
> +                                  struct a6xx_gpu_state *a6xx_state, boo=
l gmu_regs)
>  {
> -       struct a6xx_crashdumper _dumper =3D { 0 }, *dumper =3D NULL;
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
>         struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> -       struct a6xx_gpu_state *a6xx_state =3D kzalloc_obj(*a6xx_state);
> -       bool stalled;
> -
> -       if (!a6xx_state)
> -               return ERR_PTR(-ENOMEM);
> -
> -       INIT_LIST_HEAD(&a6xx_state->objs);
>
>         /* Get the generic state from the adreno core */
>         adreno_gpu_state_get(gpu, &a6xx_state->base);
>
>         if (!adreno_has_gmu_wrapper(adreno_gpu) &&
>             !adreno_has_rgmu(adreno_gpu)) {
> -               a6xx_get_gmu_registers(gpu, a6xx_state);
> +               if (gmu_regs)
> +                       a6xx_get_gmu_registers(gpu, a6xx_state);
>
>                 a6xx_state->gmu_log =3D a6xx_snapshot_gmu_bo(a6xx_state, =
&a6xx_gpu->gmu.log);
>                 a6xx_state->gmu_hfi =3D a6xx_snapshot_gmu_bo(a6xx_state, =
&a6xx_gpu->gmu.hfi);
> @@ -1655,6 +1649,21 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct ms=
m_gpu *gpu)
>
>                 a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
>         }
> +}
> +
> +struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
> +{
> +       struct a6xx_crashdumper _dumper =3D { 0 }, *dumper =3D NULL;
> +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +       struct a6xx_gpu_state *a6xx_state =3D kzalloc_obj(*a6xx_state);
> +       bool stalled;
> +
> +       if (!a6xx_state)
> +               return ERR_PTR(-ENOMEM);
> +
> +       INIT_LIST_HEAD(&a6xx_state->objs);
> +
> +       a6xx_gpu_state_get_gmu(gpu, a6xx_state, true);
>
>         /* If GX isn't on the rest of the data isn't going to be accessib=
le */
>         if (!adreno_gpu->funcs->gx_is_on(adreno_gpu))
> @@ -1714,6 +1723,24 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct ms=
m_gpu *gpu)
>         return  &a6xx_state->base;
>  }
>
> +/*
> + * Memory-only snapshot for a8xx: no register is read, as the GMU may be
> + * wedged and GX powered off by the time this runs.
> + */
> +struct msm_gpu_state *a8xx_gpu_state_get(struct msm_gpu *gpu)
> +{
> +       struct a6xx_gpu_state *a6xx_state =3D kzalloc_obj(*a6xx_state);
> +
> +       if (!a6xx_state)
> +               return ERR_PTR(-ENOMEM);
> +
> +       INIT_LIST_HEAD(&a6xx_state->objs);
> +
> +       a6xx_gpu_state_get_gmu(gpu, a6xx_state, false);
> +
> +       return &a6xx_state->base;
> +}
> +
>  static void a6xx_gpu_state_destroy(struct kref *kref)
>  {
>         struct a6xx_state_memobj *obj, *tmp;
> --
> 2.53.0
>
