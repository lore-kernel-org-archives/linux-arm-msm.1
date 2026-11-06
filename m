Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793975838;
	b=4IYCtp5q4F4x7ny9y2vkkJq7mfHzVzCroMfO4eZ0q/hwpy7YCzFGP6p+x3mthOX+xJ1G
	 slYuVPxZmJ6UOJWeKsCc6A9R+8tXlkjcFk75yNQdfg3kuXkz0JtDYUAVM6p7HMPzOXTWG
	 XPSK6+xPDNvtKFe/jrhZ+ktGH9yKTPhbJbXhu846fhcWhzAifcrVDybHWFJqNN6wrc79c
	 HIF/1zA/r3/wSyKO8HR7QL9Qr51Dr7jtsJ0pwPWFgH5xOSLXOXrkdK4rJdyZkM3jXCd+F
	 apEuvKKQYCEHFKL08F4hLUrMhgA4cnfVLDGxZ/aHkhO+NfXgHFTX6LrJFLQ4JIJpygw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=;
	b=eue5ZeUU3C/bOngBFvpcFBdVQwNXhctsW9h/PldZD9DcbHPa5to4TPxpNM8ULN4oks7f
	 nKexrWcovICrWeAnZduzbBFo2UDAn/m7hwLSNjeN9Z7JHdQ1QNZpwFdL+AXoXxFlSNsDE
	 TfxkedPMg4eZhnfLt1ON6bKmYspPl2g6J6B1R7ijpdE450aWTBc3qpLVO8W603oTOA86O
	 +dfRxBrPUNxGGiNwjHPFLZWJdHjxcxcHaWxZEQ3q2nazNF2h5g0IeTWxGFBYrCUzvUDoW
	 89nNgDKRWBhrybS9wqJzP5zVICOeFN6jBXjyXis3YawUCS1lfT8DQmphzPNQEGbGpOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oDzUxncx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UVifpZnG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CD4606A32F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 14:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1CD4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oDzUxncx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UVifpZnG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EQ6kC3647683
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 14:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=; b=oD
	zUxncxZqM9j4vcCOndXBF3iIc4/WR1NvKSLy+dBwaYOm4erSCtt7mQL+KFrwYI3z
	70bIWvfQbCccOyYxOcCoKpXLXqaVtbZ8+XgQBGNdyrGdw1450R4r7383q+QOGIR0
	kzNMuT7bcO7muQGmD59w4tTETIoglXoIE98yc4zvFoWh7vohmFc9NGopOXqNOAyA
	XHpkS/ORTc4ycLhJDjiatf4u19cSTI41hyx+6UzGHCreR0moT69Gfqp2yFA2JJuO
	kjGt/kQGHbViURKEabcJ8k8BA6JOzdNjtQ6ZkaD82H6uwGWijD/hVFqq5m6FSZMr
	0whNfEAoKReAM0Fjhgmg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9k4h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 14:37:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b25dc2aa8bso1493766c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 06:37:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793975836; cv=none;
        d=google.com; s=arc-20260327;
        b=bnhxytG6Xe9V+tOEm7l8OBND4kzbZCjhkjl6kJTr/AjwrsZjcP05DwHug8d2lMiHyR
         CLVWtvXCG0WWdqdshRoll9L4wBjl3v4a2kHS8OWw8LY773KNudk8E6wUPYykRS9+X1cz
         ArE8y94Iq5IdbjelsbaZxl7AakuuMlOD6QBsKVSdRRgFypPCDcYgwndb8R+JCzGBRYEJ
         hmSzXvHC1taQYIFWCZjcqMF58JM9NnTSOm0vBhioVWJySACgHG28TptvvDHEshgNDEAP
         H0/2+BtG57TIy8Ct2jpuMc8vmgMVsy8OCbobIlBJY+5fAjV6UZLpfLFMrvo4tY0sMFaC
         kjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=;
        fh=7LyhxsdDJmWnfykUWXm1yMYSjTRSTG05XnUIaJGpqNo=;
        b=dvy5o8LJCanCAYKAJipfwtJ0NMyPR0xwHtOKTY30uU3IoASi0o5dSc3RjxRw1IaBDX
         urpYuFYRAk4j/lfmYGIELw+RIEy6YJ+3MATcua9HtcVMFDxFF1PHnsRC/UV9imip4Csp
         3IeJzcC86QrV3m046ByO30a6Dei9Wge0Zg/5A4R5W8PrA/Azks1zPSV0LtheCDYLjw6k
         GTt2wsII7I98WkUL7eJxOBeOG5kSG6tZyoV7CgSL64KMuktL5a6MtJvZ3Zhui+Y0IaEO
         I+t2DqHY8sZar+de401xJiMVHtO8i5ww9eHQH9ISSrC+r3oNY98snyPGlvIk7wmSd/1a
         LYUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793975836; x=1794580636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=;
        b=UVifpZnGmtn+CUp3hm9K6takq0A13pq7TaZGNjGIJgThvdw0/HdTqjYTGPtnrJi6wk
         tsSCHn5IiHqqsTSoMy+GQA/5nn7eYjdwKoVDBOfwIJRgE238v+cZwfvSlzILthvBJIK1
         v++sNmehgSf4nEsCqnwn3zv/+F/E0lYA3+NLV5z0tFv0hRyrVgskA/K+w9jyLY4o2Zkg
         1h4YGMxBOMhdWHDW9Zvc0w1xwzY/e/OPpiWGx6X+YQGtB45vtinfrRjvIWN79gQ2ARaw
         P4BFWgbgUFLsGC2l1Ys++QSI30aLcYBZ7VBnBp4VG64/Y2z0+HqocJJpuJM+/sVFDYNH
         A0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975836; x=1794580636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=;
        b=LssHBMwoBUqdvWBRjvmrBcEDmG7heksRXObwxSbCwEp8hbufiCZ2V4HvcOEGLmFdbt
         WefwVTixhFViD2aNGVsiWKF5YfNmlX6L9YCy6FrBUVdFjNCDkagoQLh1WrED+psykFJb
         gad18beZJDY9002Ok/S/aFJJgytnG1H7cYeB9ZO5PGYgLn5xBCHuQLSPV624LSufZlBT
         dim87Cxfui8G41TL9lkdJLHEbVO6KNdLrk1x2L4jC0ecvYpMRsvPcNVu/6C5BPF+klQZ
         fbxH7CBcU4Vn7QMQU7TI1+zxw7YtEdDcwZgIe+jpmJ/rc2EbdJZPuMbNh1MWAYS05cGE
         ISmw==
X-Forwarded-Encrypted: i=1; AKwUvByyATHZUGiQ228kM4HZFnPcKTmJOBLNso4oOmpnZ229LL25zOtfZlJ/yuucn//mEMHFjMFrWeix3qvjeKAv@vger.kernel.org
X-Gm-Message-State: APuU4Z+W9UZaYkvAwpkNYuJWE/GzXA88O8UwZLLNu0Cn0GNF595vdeFp
	jCAjWWFUaPbnszgnq7XCxtRgmxsyHb1Y/A2UH97VpL6uKHTyMzFXS7trrP83EPkHM8Wtf0WXAm2
	Jq9janw+R3+fu9AWyxah3/Q9HKigJNH5qszrf+1cr19uBu2JV+1iL0bqT3L616YBJ5kh6sNYMpZ
	sidDtlftRBoWFdIW+v+O9BVcwenF6ynbs3uRuD/C3iaqY=
X-Gm-Gg: AYBFou0hIxtf4TkpHBX4VMElfXYAw1gIpJRyWyM3IIOTW24njFVC3xZ7CVR1QPfhOM1
	vkxj3ZEH8zJjIAm0pNwlOUBJmb8Y5prDzkBl0AFsiuDQUktHZl8IdXZpDRJYB5ciAKKD54DhpTh
	/O4W0EQP8N4GSqexFJLvrIT5efM1GFPEYcddEmDgo5ycWAFVBXYQ6Ps6v34ekg8DWVbWF8G6fN/
	blFWI+Bbi0mWvWUHWMh8g==
X-Received: by 2002:a05:7022:1201:b0:144:fb42:52 with SMTP id a92af1059eb24-1b25d31e166mr2771678c88.28.1793975836173;
        Fri, 06 Nov 2026 06:37:16 -0800 (PST)
X-Received: by 2002:a05:7022:1201:b0:144:fb42:52 with SMTP id
 a92af1059eb24-1b25d31e166mr2771610c88.28.1793975835251; Fri, 06 Nov 2026
 06:37:15 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com> <20261106-ubwc-format-docs-v2-2-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-2-82949f88f030@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 06:37:03 -0800
X-Gm-Features: AclHuK-nYIdYytSxiDZGvmJ75_P0qcwPygnczJxVB0uKsMZiJo7oTk6OLzODjmg
Message-ID: <CACSVV01xGvudO4yjFeWzp8zk6wtOaHsEj=sJ=0E_7=wvKfhcdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] drm/msm: separate compressed P010 and P030 (TP10)
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: E-mAu-c87mh0DF7HOMDM30oP_O-v5N0U
X-Proofpoint-GUID: E-mAu-c87mh0DF7HOMDM30oP_O-v5N0U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OCBTYWx0ZWRfX1R4YKa9Hgkql
 Bihoy4h/ZktPoI8zbQAE79VvWcz8O2BLqXmtDrTrTzxKU9oXt215M0IkmnqmLeNhBf5LbZHrMJg
 s8xVHzS+5Gwez3KiF5OLVTl79Fw3gEc=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aede61d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=PWnpOtEoW80h80myw98A:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OCBTYWx0ZWRfX2a5PwEqV3Hfj
 bbpyAGsmZqYl4mk0gKxm/f70mqwZZ3TT4kJO0FvhSfvAYd7ln69pRyiDU8Lcd26TvWhzYsiGk2H
 lt2u93/kElKO+1pSaHKTYf87Y6DqEwDrd/hh+2eVnLMT62SjpZ+xFizsktqQKQ4a5e4mYb1Q9pC
 6RJ7iNCn73DvW9qT6BYSwDkFvI3JhsHQh9ij7oSCHx4bD0ljP+tapmGXhnhXOAo7tHZePgfycrI
 6rl2RHOFB7AttjhW9dXvNSoy8Jx2NmoUaCWFWv7+k8Cx3OZAhHZ0uFLDxYvXqpomPiBjXo18zD3
 IvsWlJLqc53KRKDZnp2tHnvXqDjaJQiNVmipqhNXOe9ewNJcGLvBlKGP1WAvUcpci5GVVEJY+UN
 f0YxzeG9pKxoXCgA6T/V9T9tUWGM8XZU5dcQK8sAWe+OaBGGcnDBCIUfYK59QKNIkQG00wjxikZ
 IiSrW6ZJpADIC2jfKKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060058

On Fri, Nov 6, 2026 at 5:44=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The UBWC entry for DRM_FORMAT_P010 is set up for P030 (TP10), three
> 10-bit samples in each 32-bit word, the layout the video decoders
> produce for QC10C. It doesn't match P010: compressed P010, as the GPU
> writes it, keeps 16-bit samples and is scanned out as garbage.
>
> Use DRM_FORMAT_P030 for that entry, compressed only, as the SSPP can't
> fetch linear P030, and give P010 its own UBWC entry with 16-bit samples.
>
> This changes what compressed P010 means. Nothing is known to depend on
> the old meaning: Mesa and minigbm never allocate it, the vendor stack
> uses its own modifier bits, and the only user found is a draft
> GStreamer merge request.
>
> Fixes: f07c9946cc1a ("drm/msm/dpu: Add support for P010 format")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

This one, in particular, we should pick for -fixes

BR,
-R

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  4 +++-
>  drivers/gpu/drm/msm/disp/mdp_format.c          | 13 +++++++++----
>  3 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 107150a8553f..f755c0d57abe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -173,6 +173,7 @@ static const uint32_t plane_formats_yuv[] =3D {
>         DRM_FORMAT_BGRX4444,
>
>         DRM_FORMAT_P010,
> +       DRM_FORMAT_P030,
>         DRM_FORMAT_NV12,
>         DRM_FORMAT_NV21,
>         DRM_FORMAT_NV16,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_plane.c
> index 1a471cdf767b..09146023d13e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -68,6 +68,7 @@ static const uint32_t qcom_compressed_supported_formats=
[] =3D {
>
>         DRM_FORMAT_NV12,
>         DRM_FORMAT_P010,
> +       DRM_FORMAT_P030,
>  };
>
>  /*
> @@ -1779,8 +1780,9 @@ static bool dpu_plane_format_mod_supported(struct d=
rm_plane *plane,
>         struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
>         bool has_no_ubwc =3D (dpu_kms->mdss->ubwc_enc_version =3D=3D 0);
>
> +       /* the SSPP can only fetch P030 compressed */
>         if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR)
> -               return true;
> +               return format !=3D DRM_FORMAT_P030;
>
>         if (modifier =3D=3D DRM_FORMAT_MOD_QCOM_COMPRESSED && !has_no_ubw=
c)
>                 return dpu_find_format(format, qcom_compressed_supported_=
formats,
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/=
disp/mdp_format.c
> index 33da569eae5e..2712a73e5783 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -298,8 +298,7 @@ static struct csc_cfg csc_convert[CSC_MAX] =3D {
>         .unpack_count =3D 2,                                             =
   \
>         .bpp =3D 2,                                                      =
   \
>         .fetch_mode =3D MDP_FETCH_UBWC,                                  =
   \
> -       .flags =3D MSM_FORMAT_FLAG_UNPACK_TIGHT |                        =
   \
> -                MSM_FORMAT_FLAG_YUV |                                   =
 \
> +       .flags =3D MSM_FORMAT_FLAG_YUV |                                 =
   \
>                  MSM_FORMAT_FLAG_COMPRESSED | flg,                       =
 \
>         .num_planes =3D 4,                                               =
   \
>         .tile_height =3D th                                              =
   \
> @@ -606,13 +605,19 @@ static const struct msm_format mdp_formats_ubwc[] =
=3D {
>         PSEUDO_YUV_FMT_TILED(NV12,
>                 BPC8, BPC8, BPC8,
>                 C1_B_Cb, C2_R_Cr,
> -               CHROMA_420, 0,
> +               CHROMA_420, MSM_FORMAT_FLAG_UNPACK_TIGHT,
>                 MDP_TILE_HEIGHT_NV12),
>
> +       PSEUDO_YUV_FMT_TILED(P030,
> +               BPC8, BPC8, BPC8,
> +               C1_B_Cb, C2_R_Cr,
> +               CHROMA_420, MSM_FORMAT_FLAG_UNPACK_TIGHT | MSM_FORMAT_FLA=
G_DX,
> +               MDP_TILE_HEIGHT_UBWC),
> +
>         PSEUDO_YUV_FMT_TILED(P010,
>                 BPC8, BPC8, BPC8,
>                 C1_B_Cb, C2_R_Cr,
> -               CHROMA_420, MSM_FORMAT_FLAG_DX,
> +               CHROMA_420, MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | MSM_FORMAT=
_FLAG_DX,
>                 MDP_TILE_HEIGHT_UBWC),
>  };
>
>
> --
> 2.47.3
>
