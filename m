Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794218230;
	b=clRRk0SYUTQvXW+yakTTwnYRt/r2K0YYFgW78+Shvwc7Zi3fq/V9gKzQgEj9v5/VVyND
	 TwlUYPTp1LYw6x/9HWO/2l3IMIg9KcGvY56mR/pQS8v/H5c8VSDZ3kWZIOWOl2bMN+Dce
	 ILgd4kYZjsBRp2ESxYfccBvm+sjuvxmum2qayu1nAaX8ql7bhxjeHS/mz/P2jKcP5OEOl
	 88vIzGUbxyTTQnBD4DRrf4dA51EkJXp+5uIBgJBUEJCJKzGsizBYkVoJlPCJUjV5/T/A4
	 4MsolRaKovIUki3A/axPfxYibAM5yvJ5i1dWHq8YFFQBgpy23jzQ7OgC422Pjrjl00A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218230;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=;
	b=TRD1ECdnFYd/QqjSLaabfu2ZUHPhQVi5X9v3x/RcfOV0DTdMm+Nij0izeW1Yp3TCxqEE
	 cV2srZBt0ELBhqYzxuGE20C8LOjncMa1ZK/1U4bWfnhxr4lNHgDyHjesvWzmFZCoWhkkC
	 ksLOu1NTQqjdauTm5oFz+oQnHrfchant1X1MdShrKnbWtZACTFHo1pGbQSqRtbWbQYd/D
	 99+FTjBzzOlfOqny9DVY5xPcMyjeltEujCm9KhZ7ozNng8B5KTl8xRw0lL6uKgQs45f/K
	 3sqpceSh+y9p9DUI464MdfjKhUjBan803ZcJFHGb0nw7D+z1J8kO6xZ4rsKNfqz8EYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPtuRtDG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YI1HO/W0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C8C606A332
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C8C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPtuRtDG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YI1HO/W0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99un0m3600515
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=; b=VPtuRtDGzb65NmL9
	VLFYDA8OJXcH+ENvRFYSyLXanv3GGUHa6d2HQwcygrFRERVAO9cViv+KuiQjXEI7
	Y9JV6pDfIUcEaKQyOfwoXWnS4i/1R7LzOipuMBeoi0sDOnF8FBLKPN5RJFJdy+T7
	ZTuHdkJ6IQR7NjuVAu+k6tTTs74qHb4VugMtJTk1mU+i0TyZnmlrBi1n3xPST6KR
	Y7xPWEutPUwjd1Bs8Ubuw1s9V1WxlLo7foE6vAj+Q5n+288tGGYId5ioLDgBmPmW
	g271xOtcdtEJJKWV0yzBDc+63+m976m0oSTPCkR32u/2QXI1mkFR02l5qXLM2TRG
	l6cbvQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua588e3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:57:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so135944085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:57:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794218228; cv=none;
        d=google.com; s=arc-20260327;
        b=dJHi5j3vOOSjUTMxa2IzZfgQNCdFRG9zsG9NsjlCpEd4sy8PltQfBVyHPPmtq2hUVr
         +Z0RdDsT7Rvw/LShS7hJsOu3Hei4icLEvLHT4qIxASC47mF194ZaHs8oe2nJhcmbNGDE
         +M/HjlwP6fqtMIp8WhHYXXKj6pqtsLmcgEi4Y8egHd3MMC9QeGf5fxmqHy/FvRHxJfqK
         ggQym2o44QtQ+EHsha4elxPzowoaZQ/JX9vmTUCEWxe/7co5lK8KtIlmllXVQVsji2PK
         p99MuIJBDGNJq72QfjGbaBNzhXKSzrcakwcQpv2bXfEFETpf8fYzW0WOQ0jlIDSa0l0s
         gBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=;
        fh=H68PMhSkgyFuII+BYzwoemPVPdpkSd3oBalAZtwRUsU=;
        b=GUGng1LKvcQwHkMW4KmgGU8M/Pr5lqSUcm7Yj4iD2GjqA++XPfNDUuKakkt8UlX4L2
         kfH6/0mmPipeZaIzNDuq5rmbPKVMFPZFXkitqCgd5sJ4Ny6CQTuoaUw67eAYj3h5M6to
         tGANKcxZRZikMYruo26Npw0EVx377Cfml0hWyAoiCxe232bSu4kcGWRh8S+UXf8TWPsB
         LZ2LLtTtxExRekQW2lVge7dXYF8wRFSPGQ42wXEttAH70peNwU05eg7VV6djA/ojueaM
         D/jPAYm6HP8BqQRyvNXLBLHuA1IGN3fx0lMf0bVkMli8jpIO74l60DSLbaZc64Q9rX43
         F23w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218228; x=1794823028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=;
        b=YI1HO/W0EQLWyHzVs0t1ZJ5qJNb5kcxeU7uNuwCe5segq//c1E5N5oPqoV9dNtfp8L
         93zZqfkERMPSE7DzbD/ZdVK7suWGRfpt+ihpAv6AQVXNu+vIdZOghnBK6qwcKDcmVtXg
         rB2Tf2TOANlYphZejtHgq7gyORN34BqEaSeeSoDkCy9zYy/lRkOfBTT7vjFeyjKl++8d
         xdK4O8XvvLNtywna6hkjsLv8YBjgSrLT5/qVykPiTAyQbrHSSRrhxeBYePzgzwtmExnS
         5oj0D3sY3dWR+/Ut1a+eWJQbW7jVad0yZ47QeCXJE8PESRx7ONc+jLMfceOKCi8dfdn0
         FupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218228; x=1794823028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=;
        b=rYMzLIQgukcXk8w2dMmL5C7+y4MTEpYaGen5YKv9HmRKnoBosaNiggBochLhoAFQHo
         RHDON/iKgcxIV6geZyvhkYibYOCvol70/rO7nJkfDnN4PQbuQof10xpD1QSDIhkBM8Qq
         XS/5/QQWj/QJchQDuYqx3fnKyx9bbg6uKhHHFwncSIgB5pIOIzQr3iyWEcX1pY2Az/8c
         VcYG5Qgg2URMzAHXc+rQeHQPQCKIrx3XjPsHKqi6rgCt4gMsiu9D9WNtqqp8T3nj2zXG
         DAzGEQg5npTKF3B8HqC0yD09frX5ItVS1er6oA/o+/IaacmYlvgB2fY5MNX8H3unVt+R
         RScw==
X-Forwarded-Encrypted: i=1; AL+hErGXqBbKrRxTcV6KtMcYO0Wlce5tqRNexgte/7r6vJYt+R6HVPCGySu25C2enO57ucukQTDbK92gvCp2h7IJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+vEo//VvQDmUEeOlNVzlysDqxuy1TITbZVH7cwAawi7ckzE/OW
	mg9D6j4lAgPGLrYqhtb3iJC/B6DyBa67/RcljsD2lwd5i1pSEuFSk/R0BweET/Mbq96QHkY2DkJ
	lvk4hSCsoEbApy/Hzi/Ptc8CyFY4+/we5Yp8hCHOqCvaXBYbmwTwadcYBxaXbGffUpVyTPeJlnD
	+bdGN/Kp3T4gu7/2ztNMylndnPlW2tjY16iFdaKv7Ckds=
X-Gm-Gg: AYBFou3CzCv2tViQ9pq1ZaHB28LEIiVFGnriDrVsZ9Sq2hvcAAqgRGWXo2TIjMoSSKu
	wqFeCSFYM9mhNHcXaRpxVf50zubuKOxM2qeExtuhPDP4UMMewDLesCyngrsyoN0t0d3u+25GOdQ
	5Jx2X8HKGYipN6wHoxLDjpNg/kMaWnbEFC5PCMUWjmVQYDJ70ewFbBJ4WcwXkGrYM38vPDPlzz6
	XpGHt7KAdb+SN8dw4TlL1g4X+pdIk6FPlxiU39Kk2sm7CHU3Zr0i4IrOJhoV98oik99S84ten0=
X-Received: by 2002:a05:620a:2401:20b0:947:84da:8458 with SMTP id af79cd13be357-94784da9342mr336039585a.83.1794218228428;
        Mon, 09 Nov 2026 01:57:08 -0800 (PST)
X-Received: by 2002:a05:620a:2401:20b0:947:84da:8458 with SMTP id
 af79cd13be357-94784da9342mr336037885a.83.1794218227882; Mon, 09 Nov 2026
 01:57:07 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org> <20261107-v4l2-frame-sync-v3-8-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-8-e5bf7073a35d@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:56:56 +0100
X-Gm-Features: AclHuK9j9RAwJKTKzev9RbLG7mY1UiDABvkGjeRinbRp40Cik4QzcPP6hAY-YhQ
Message-ID: <CAFEp6-0t_r7yH3hGRFH6amgfNUK7sTMe68HXQ2WEuUffHMQF2A@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] media: qcom: camss: Switch on frame_sync_en
 logic for csid-gen3.
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOSBTYWx0ZWRfX0JSXgf/qY7W1
 27/zDMowMqAlmFyvxV3v54JcaFxe4Hu7LifLXh7qd2zzn9xznfGDuxcBJLXTmVU0/RhgHvx5mFo
 aeoEpXkPn7yBj+4pPO56+TT/LudNGhdWslQBVjLgyZw2T5K/AGRpjPPJ72B3enTHG2t5/6PqHF/
 k3sdDgHSbVgodcuwnvcXsuBXceQeTwOTA0IlEIy/NrToJzZJBWWwsDjp0Gz6lYlwpIPpLvy/SNf
 PsGg/4DUhYZ/XSDVuuh6pPFhAI2nNKAZDrKqjOauIWqCPttU3vC8Q4VHRRbAEnOqJX3ZminsoJ1
 sKsaYdKoB2huGin57WS9ezw2gPp13h42Wi57yvXb9Vm5NzBLG1imhlHp5LS4T9kNEP/y+g7FvwI
 JXNw71b+aFeyZORr+x2jz3gEWGFQcawWFwzFGKsNu5GePJv0egURpBmJKv3Q5dTLPChCP8wGAvH
 MmTR9xXh/HzgDtBgaLQ==
X-Proofpoint-ORIG-GUID: qXW7HkIe_7bmJNlEaxTIOxDe90d9J_3Q
X-Proofpoint-GUID: qXW7HkIe_7bmJNlEaxTIOxDe90d9J_3Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOSBTYWx0ZWRfX/qKj9VxFc5P6
 V7kM6YywvEQNJhH0GyTTmEmhjBiZuOF5j2qsYapkb+jJH8FvK4AJRdxbiUg1lQz3CruGLQ6HXQy
 9xwEeXFnskb+eqetbH/5Reh3EV1eXz4=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af198f5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XzkgqCU9wlH7P1zULpYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090039

On Sat, Nov 7, 2026 at 2:02=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Switch frame_sync_en to true to track and consume SOF/EOF data.
>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8650-hdk
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

I would have preferred this to be defined directly in the
corresponding CSID implementations rather than in the resource
descriptors, so that the component implementing frame synchronization
is also the one advertising support for it. In other words, something
along the lines of a csid_hw_ops.features flag or a dedicated
csid_hw_ops.has_frame_sync callback/field. That said, this is more of
a design preference than a blocking concern for me, so:

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 52bb19f5fbf3b..b7821019241d7 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3120,6 +3120,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid0" },
>                 .interrupt =3D { "csid0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3135,6 +3136,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid1" },
>                 .interrupt =3D { "csid1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3150,6 +3152,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid2" },
>                 .interrupt =3D { "csid2" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3165,6 +3168,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid_lite0" },
>                 .interrupt =3D { "csid_lite0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3180,6 +3184,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid_lite1" },
>                 .interrupt =3D { "csid_lite1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3433,6 +3438,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid0" },
>                 .interrupt =3D { "csid0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .formats =3D &csid_formats_gen2,
> @@ -3447,6 +3453,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid1" },
>                 .interrupt =3D { "csid1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .formats =3D &csid_formats_gen2,
> @@ -3461,6 +3468,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid2" },
>                 .interrupt =3D { "csid2" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .formats =3D &csid_formats_gen2,
> @@ -3476,6 +3484,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid_lite0" },
>                 .interrupt =3D { "csid_lite0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3492,6 +3501,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid_lite1" },
>                 .interrupt =3D { "csid_lite1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3790,6 +3800,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid0" },
>                 .interrupt =3D { "csid0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3807,6 +3818,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid1" },
>                 .interrupt =3D { "csid1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3825,6 +3837,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite0" },
>                 .interrupt =3D { "csid_lite0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3842,6 +3855,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite1" },
>                 .interrupt =3D { "csid_lite1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3859,6 +3873,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite2" },
>                 .interrupt =3D { "csid_lite2" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3876,6 +3891,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite3" },
>                 .interrupt =3D { "csid_lite3" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3893,6 +3909,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite4" },
>                 .interrupt =3D { "csid_lite4" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>
> --
> 2.56.0
>
