Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448332;
	b=MgLgegu0yCXUpEKTYERH0/RrW4QCrO9RMgmuUKGxQC8n7w5k/ZldyQmnIlyqHCdZq21g
	 GQ96EVq2fpwXl6G01bCXtk8DQQrjD3UqJpsccv4d7YlLn3TuVcGmLHx6/Tpy8tFrCc/OB
	 BIEf1/u/mmqgo4FiYwaDtcS5g6O8yxTCBEiocBVsZXcJewRyq+z79Nt5ZhUIe6r47I5PG
	 nOl3OmGlsalYgT/Y6XwsWOT2+Qoh418LwI1XbP9ULmNEwEMJ6fsqmCaZg+azrVA9yADS2
	 +x7tXFJsy1Vq6kixqrL5iMsvIrqaPH0cXhVZvaISBo7Qad0tpGY9GmKxyi6RibXBG2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gCVuzChl+qO4tFfIRRaq7R9WsSlLoWjA/ThFeM3Nkpk=;
	b=3VVqOJGO8HHGxLqX1Qrh3WvbEnKiY795ese09pbgbuiduZ8yjE5W+KO+uuxeCE4rpIeZ
	 4QBVR4s7Iip6uQPBVO7omrWwdEOg+32bf59T0CtkrHpSWE+/xUIL+t3a8kXvDChw8SXYh
	 pChoKlfBgnv4yTkyrYtnDhLc1m3Mj8U+B0l4HMYbTE78803UcIpnp7QefGn6WI36nL9Qh
	 R89sYGGimrCev5vrFRkFVWSTzjKw5cjSb3AAllO774i7IH+/D+6CwMW8HppVOw6ZbkNDW
	 sc6ky9jLJHBu9otrY4tk6RIZ9A2z6hw8DUZnRIN3IGJ8n0hU8my5c1QSN9oj7S3LM9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hoOxe6cf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xtv1pA4w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25FC606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A25FC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hoOxe6cf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xtv1pA4w
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKtu03329289
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=gCVuzChl+qO4tFfIRRaq7R9WsSlLoWjA/ThFeM3Nkpk=; b=ho
	Oxe6cfARPCtlTyBaxNA5wTR5sD9+yw7sTOHRGuQ4gBjc5TvQ8/0cpPgW3nD4fUUk
	Jx4uyallOivIXXTB+WjarpzXqeAf5JMp4hvj9vB8lywcWB3q+4nPrSf3ACbvH7ud
	JW6D91HYQxxrX4Gue9XK/AlIkFwH+UNErv5llqB4ZKG0apW/e7tVqucz/Img1Vvb
	Zc3fQXxI3Xs19uXfW160vYEbA3hK29BNsnVKRq/utJs43vnjCmS4brXnh3vCUyvm
	/jAoRmKSuBJfJhQCyUv+dh3a9I/Ads8A/btgqP5v2X1lwWSK/EnL1wjdrGWgoxJC
	ixZEmRVFB7YQ03HuVqAQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd24qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:38:50 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4574f1cac98so3780641fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:38:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795448330; cv=none;
        d=google.com; s=arc-20260327;
        b=T2StSiIRevbVbdtPlYMMlRsEFgHTedJKRdXTKzHQ7Ka5EKYtcMvRCKk1HlaMnnnsyn
         nWH3Xt6ZWQ7hcy7GOQnAgN9w5WzaGThx0FrC4Z1hWOiSleqVRlct0mlSfF+Zk1TWFknd
         HyxwczpiwQ5Hr7pWv3c/mfUABFipU6+YguQvi5qhKmSGG2iGfGkMHtH8+ig9ZGTXvGdI
         FVyVR7V54VgwH8c2ntjHQrtzESEmNXxHKmMC96uXQGQ5T4ButAHHfOT4cmJH1b1yEkOg
         JZ+zbNLDKUSuQRoqLfqjvU+UactrIeKEfb+Sc4r4Gld37bmSudYafhyQ5o/r5Z8aE3vx
         Swbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=gCVuzChl+qO4tFfIRRaq7R9WsSlLoWjA/ThFeM3Nkpk=;
        fh=tKE5x+bRXv8ibcCM8QLVg7RXW8XhPB4x16vv1DEII1A=;
        b=Ymn3KRABdTnPCvMOGhNDfmEOghMCE4JIBd9DcZDjY8LWmXOtiDaUb6KhwFY7SuDMPj
         b4NoXpho/mxDtMFnL1m2CJmeJL8RQRruRWlKSkXBgLTdTDZEL1W6EJkQk36RyOzCKH57
         gHlTN1rvbViUpw2N3AyR7RWMxMMuIbXGvPNH/vYVnh60kpkIZjy1YyM1OdEEcduqQlTX
         KfnLSZjyLcv0SGPTi4gsZO/pvJFFe/nBvq+khTkUWvP5ty5YXRBUCm3yJ9Xszq3TOrM1
         CUQd4caBn37ivC8XfEev8aSZpQYSIouXPk1JfMu5iuQPGU125Uzud4QRYtkWnkQJzulG
         /g5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448330; x=1796053130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gCVuzChl+qO4tFfIRRaq7R9WsSlLoWjA/ThFeM3Nkpk=;
        b=Xtv1pA4wT4mWyK0zHxXaebMOCTBOYxn65ythntIka/ZhIWvChx8FXB81GCapchZJtW
         xk+jZTE8Mt02PBcrzLK/yQtipnmoXjjp7CUXxcAp7AJ40XuSsX/yqreOygvH82a4i+n9
         sAer10BvmU6GKPgQfcl6lJoFyW6CMWj4KRu0ZQHctdRm7K3Om+pNZFVMxupdBrB+m772
         XqSS21+DEXtA8YQ/V76DauA6zcthX9mP0kcuITw6pRI9VIBeE9BRg4kQTnEtxdmzZKC9
         wwUtQPoSPrb53UoYt7dXe98bBY0lBU3M99x7wQ5iQ9G8ZX/7YGYvagIeYn1CqiclWBeX
         ZNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448330; x=1796053130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCVuzChl+qO4tFfIRRaq7R9WsSlLoWjA/ThFeM3Nkpk=;
        b=Yrv5EExrl6HV0s2pmFFfsGKzABjwCySSKwXIwOX70q4X5ySY+uaY1nw5FoGyW8Qq43
         3k/uc6qhoyz5fszPw7WcSAQbyR4cWF5HPKXZWvsHinsF7um2JUAgtYP0h9jPDp2Da0Mv
         l9w4Zl/F4DjNjzGd5tu/ctg1CMNDPlKeJIGKa9tq+dJ+WpwCWydMHQOq7kBmFo9QcML+
         xCgzsPNCFdQOUAZ3ia9ib5mRr2yt0tzsCnfjh07EwLBz5I4vSdx2n3tZecpw2tauk63+
         fvsEc6vYh4OSxSQMC6KYuUCFlEEF/Dcr6MlKqN8S3D1RqtUYeyKpZa5ytaGjB8gJoCGR
         QWeA==
X-Forwarded-Encrypted: i=1; AL+hErFZtfgbS+ked2G9hmsW6aG4JIMQr4RFkTZIgQN++RdS3MOBKFyEzBK5PSJ9v19/jDlbPI3wzT6OOX/2Ec3E@vger.kernel.org
X-Gm-Message-State: APuU4Z/LBH4DP4bQDgyhdeLdyqslpiP4kDLnq92I/5T+endMmk8OmKtz
	pmSwTdFEt71GG8tv+8F//kep/hkzCbX3LXAV2w2fOTspqbMfjiRPeSJbK9pEcJ+juxHtNDZeDMi
	bXFEQUgnAVBg6ngidPjP38vAQR6Hp95T0USk9onmIaGWvecibS8aS+tr8K3+/RiqShx1xElL/rv
	tXL1+RhjoWmeXBAcwhaY7Ri7nQErq1nyCqgg0F5YThTng=
X-Gm-Gg: AZFdTZfyqggjrezxVDri/WPsaOl65M1xnyiN4S4efEPmJNuKzSFZFAPCVv1AbcxY3Dp
	w85N9qe2gN1wr4nJbDy4N8QoirqaS5zMPGuPqxYPNOe+M7NzgszmPnTmkWo3VORp91B9UV2RBr9
	njy3293xXNp0Nfi1wmy0wF7i6SHJkmYdqdrvaTVNyye0qiSRpYPxjeGEYzPgxlDo23i7Yp/Xh9c
	hf6jq3wKRIaKZpO21rJzA==
X-Received: by 2002:a05:6870:160f:b0:49a:84fb:a67e with SMTP id 586e51a60fabf-4bc81aa22e7mr11083139fac.19.1795448329808;
        Mon, 23 Nov 2026 07:38:49 -0800 (PST)
X-Received: by 2002:a05:6870:160f:b0:49a:84fb:a67e with SMTP id
 586e51a60fabf-4bc81aa22e7mr11083108fac.19.1795448329302; Mon, 23 Nov 2026
 07:38:49 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com> <20261031-b4-adreno-timestamp-v2-1-0836856b228f@oss.qualcomm.com>
In-Reply-To: <20261031-b4-adreno-timestamp-v2-1-0836856b228f@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 07:38:38 -0800
X-Gm-Features: Aa3M54r2MCQoQ3PqXzI3hpH_qsmTUYcXPDHzocmgon31QcuLcq7PZJCcVO3KLFk
Message-ID: <CACSVV02JZe-i2gBS0ShiGBaH61MNYEtn8RxsM+sZe4NY7jHFzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/msm: share a page of kernel state with the GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: -bcQ7KBNFp9Kuxms5a2zV6cnG8SztDlk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX0/UenV1wv5uN
 whS1kL4cqFEpHBik7mYjajdaezGWVPA2l6NLgFoUV6cGYFnOYCu43SfFLiECcgBiKvPl29cbyCr
 V23coAwbkXXczp/izwB4ueSctOiJ9M3iaafCQQ2i5aS3w8ODFvZAwnPNi0suPlDgimkZntXKasw
 uESOqG/l/LHm4VmiOWVjHtz1TR0EHDRNDaP3u1Ufu0+HnCs4Eqr7qH/dNiO9RtQEODJ91j/mCqV
 dHjOX9dX83my2Z+l79DGSQVsULSXGAvCyVPgk4VMJSS9CXgoNe/QS223R37Q3qlxYYwyOhWp5EY
 uLUOivEYAKV1oNty2XVyw08t1VraVU7PlggnasUFo4UCe21w1MEJO1kL4A2bFvvSuxMPhJjTYe+
 /TY0Hb7GXuBB8AF60RQKzCVcAnwnObMmJbhO/qKFnpJ2icyJSnSptY1N4rJ3xR+wz+xmYAqcWI3
 w6+lj7tmCISd5hCi6RA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX5DnqfUcdgqVB
 X2fn+o0Mhd+RC9LI7eUdikXMgoJl5DG/rJnsucIQAX/vQlEFBYB9jpRasznnlj9PgFr+O65xyc5
 GEO2zxg0rl3FO6+qzNd5FrNy3h+VHZA=
X-Proofpoint-GUID: -bcQ7KBNFp9Kuxms5a2zV6cnG8SztDlk
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b045e0a cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=Sjt1sVUzr0hdpTIL:21 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=uvoR58hokDgp53dTwF4A:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230062

On Sat, Oct 31, 2026 at 9:12=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Some state the kernel keeps has to be applied to values the GPU produces
> by itself, the first case being the always-on counter that restarts
> across a GPU power collapse. A GET_PARAM can't carry it, as command
> streams need the value at the time they execute.
>
> Allocate one page in the global GPU address space, read-only to the GPU
> and not privileged, so the command streams of every context can read
> it, and report its address. Start it with a flags word so that fields
> appended later can be announced.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
>  drivers/gpu/drm/msm/msm_gpu.c           | 15 +++++++++++++++
>  drivers/gpu/drm/msm/msm_gpu.h           |  5 +++++
>  include/uapi/drm/msm_drm.h              |  9 +++++++++
>  4 files changed, 32 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index dadfe4c69438..0adf56fb9563 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -404,6 +404,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_=
context *ctx,
>                         return 0;
>                 }
>                 return -EINVAL;
> +       case MSM_PARAM_VDSO_IOVA:
> +               *value =3D gpu->vdso_iova;
> +               return 0;
>         case MSM_PARAM_PRIORITIES:
>                 *value =3D gpu->nr_rings * NR_SCHED_PRIORITIES;
>                 return 0;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index 0c2c35636251..747cd90e329a 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -989,6 +989,19 @@ int msm_gpu_init(struct drm_device *drm, struct plat=
form_device *pdev,
>
>         msm_gem_object_set_name(gpu->memptrs_bo, "memptrs");
>
> +       gpu->vdso =3D msm_gem_kernel_new(drm, PAGE_SIZE,
> +               MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->vm, &gpu->vdso_bo,
> +               &gpu->vdso_iova);
> +
> +       if (IS_ERR(gpu->vdso)) {
> +               ret =3D PTR_ERR(gpu->vdso);
> +               gpu->vdso =3D NULL;
> +               DRM_DEV_ERROR(drm->dev, "could not allocate vdso: %d\n", =
ret);
> +               goto fail;
> +       }
> +
> +       msm_gem_object_set_name(gpu->vdso_bo, "vdso");
> +
>         if (nr_rings > ARRAY_SIZE(gpu->rb)) {
>                 DRM_DEV_INFO_ONCE(drm->dev, "Only creating %zu ringbuffer=
s\n",
>                         ARRAY_SIZE(gpu->rb));
> @@ -1033,6 +1046,7 @@ int msm_gpu_init(struct drm_device *drm, struct pla=
tform_device *pdev,
>                 gpu->rb[i] =3D NULL;
>         }
>
> +       msm_gem_kernel_put(gpu->vdso_bo, gpu->vm);
>         msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
>
>         platform_set_drvdata(pdev, NULL);
> @@ -1050,6 +1064,7 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>                 gpu->rb[i] =3D NULL;
>         }
>
> +       msm_gem_kernel_put(gpu->vdso_bo, gpu->vm);
>         msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
>
>         if (!IS_ERR_OR_NULL(gpu->vm)) {
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.=
h
> index d27d54bdb7a7..f78f3bc62977 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -252,6 +252,11 @@ struct msm_gpu {
>
>         struct drm_gem_object *memptrs_bo;
>
> +       /* page of kernel state shared read-only with the GPU: */
> +       struct drm_gem_object *vdso_bo;
> +       struct drm_msm_vdso *vdso;
> +       uint64_t vdso_iova;
> +
>         struct msm_gpu_devfreq devfreq;
>
>         uint32_t suspend_count;
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index 3d363f12f66a..f8bf48fdc339 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -118,6 +118,7 @@ struct drm_msm_timespec {
>   */
>  #define MSM_PARAM_EN_VM_BIND 0x16  /* WO, once */
>  #define MSM_PARAM_AQE       0x17  /* RO */
> +#define MSM_PARAM_VDSO_IOVA  0x18  /* RO: GPU address of struct drm_msm_=
vdso */
>
>  /* For backwards compat.  The original support for preemption was based =
on
>   * a single ring per priority level so # of priority levels equals the #
> @@ -127,6 +128,14 @@ struct drm_msm_timespec {
>   */
>  #define MSM_PARAM_NR_RINGS   MSM_PARAM_PRIORITIES
>
> +/* A page of kernel state that the GPU can read, at MSM_PARAM_VDSO_IOVA,=
 for
> + * command streams to use.  New fields are only ever appended, and the k=
ernel
> + * sets a bit in @flags for each one that needs announcing.
> + */
> +struct drm_msm_vdso {
> +       __u64 flags;

I like the VDSO idea, but we should probably have a
MSM_PARAM_VDSO_FLAGS, or something along those lines, for easier UMD
access (ie. without having to start out by doing a SUBMIT just to read
back the flags)

BR,
-R

> +};
> +
>  struct drm_msm_param {
>         __u32 pipe;           /* in, MSM_PIPE_x */
>         __u32 param;          /* in, MSM_PARAM_x */
>
> --
> 2.47.3
>
