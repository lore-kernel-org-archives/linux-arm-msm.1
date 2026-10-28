Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793197199;
	b=ld+yZgKezm6quNstvmFI8vYDBqX0wIw9bG0qDbOCWnZIZ8Hot1awwjmYtxrO5aRirGF/
	 Vul9NBGmUnq3pPOc+mlP/BqTFzIKP8txpuUAfS+TtqrJlpgRNIwUQPOP02Nz6s/y1jVKs
	 E5WB/nL62UeT2dP0eHakeSxcv7Gx14vxXCaHk0ww6WejNSfzGzN+5pAsbXxWJ/4qHzAJn
	 m6usCN7vJPSQYtXmX0G8awAAxELN4jR81qI8WG7j2pFmmHB6nSo5gyUgz+7T2f2jw9MP1
	 jlBxPzsSwar3ThTyMDduh5+nQDLYgKyI4NruPYxYHLfK0JBmGi4RaVW++kuTMWm0JXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=;
	b=hEE8+Uz+QRKMudCXyNLwOqwOnbquGYmBAE7fTidSxrHHGUjmgM3zGz8VmNG8ld5T/EHa
	 E6buuY74t4XGzPzR7mAhW2uSKzzQ0aMpiUAGZEleRKIVJStT1F8Rxbr8fvZ5ug7HnHR1q
	 AJHgOSK23fNWLmthnSikOBiGYk+8fBo43GP/uC69zlaW0SVDLsb01GN4cPQWYOMMcaw/E
	 X6bYUxi2xgkqylr6GozLFiUHibiiL6S0gPj57Ib+IMHZFlj+7YhKyiI1MmtN10caceNsK
	 jDNUT4vuHTi63GsVJjwXVHSMOW5+7InYtEnyYVdDP98c06oSdkcdM/iMG4YUtnwDdiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XyW708ld;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGcjTesz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76085606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76085606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XyW708ld;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGcjTesz
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDI9FS718174
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=; b=XyW708ld3LtIxMLr
	pGg+XwKvx5S0CKMqGYZHMb3V9qIkQWuvgBlglaV3UsiCfBhSlO+BuPX7mlZRWVjW
	c3fek6v6x2cWIyTT04fw3ObhqkSdAEh41dcHvCOjqSbGAsfL4r9cteX7rZtkB4jd
	WmF3lqCQpqX1WrWFbltBzmTS9t9GpB2eWQkcLQaeLvt9EbHA0oiaXhJYmzugyGrj
	RY8FljuUFWljOLVLqBc+EH8cOwKDZpkK4npctZAxuCqb1wQYE1xSmZrDTyC+aZgk
	kP0wLrip1QK93OKTR/45CYRXwxNvlp2U3XTt00mHCb+O7TmmAudCh5g6Vew42sS2
	yRg0fA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjg8cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:19:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c0f73807eso14490776d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793197198; cv=none;
        d=google.com; s=arc-20260327;
        b=P3jLhPjPIDqqVNkjcXyP8wPhPl5OSN5KEpnfny9/Da9dpPfllbAVYPCzzII4ybp52/
         HTUbChsTbWTOHHvt87DUWN7+azXZsEra5d5Xy4zrpDQ8Xr0SsYDzyziKhjHFz96/igVE
         xE0zvfmQ0syjIziAcQPl5cMG3V181Ubh6EHdIGkFtKLvnN6eh8UGhRgV44yl3j0KJ/R+
         PebplKp1xJHbWzr/p6ZhvPF+Z6AUk2PArFN2umPV/bZKaDQrqcSnlKfNPxYhpfAWiOiA
         fni6yz3f3g6HD6BARQZ29b//ZJyQep4s3U1ICbcPUzcRoZUEZfDAuNWW7Cs46o3cXvN5
         I5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=;
        fh=SHzzXyT0FiS8d7gDSyf0+hUmiGk84B5N1S8kkiOUUR0=;
        b=DXWmDyxfvjXa4yclmHW5PQYJomJqLY5ZekZGnNbDfHHbbzknQZhhDrN988UUf7otX5
         4uQ8MLFRcZ2tGgpFqmxU8VD/vL2sxDwrTVm6LbWk798OzELV41S8AClyEOExxeQ5+K0A
         lzfFAYgHffBkprpQgKxq5CCtuoHiT/cZN6v8/apS4O2BGy9KEM/w+RpQFZMZlwRzonm+
         RkmemaHMvZvs6fwdYuN8McYb/QfBUmw3RRwa53+Cx/QruqSRwO5qAZZKGnStAtrJmARs
         iLRk0LHXij2abIGRP7URKuHYBD9P827iRwrGPJHQQLE2cv/+aZuvLTcIa9UK28TqpHh3
         7/zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197198; x=1793801998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=;
        b=RGcjTeszMwuhmSkMektefCJNwOTY2v51QGfxsRPAw0NHifXwLcQBUE8nVzFFPcWiKE
         078ymGmuYOep38t3kM4tz+SEAc3+UAc8ZyIs2F+ymzpY39KFX0iK8tOzebVubmEJRuXj
         0VBuwhnbhGlQZ09Z+KH8cSQn3G5wJ2LqM6Q8wsKvm6hUdJ7pvrz6jD+JUneMzQ5ZUgpa
         hAE/fL4buhgXyt0SxGYnx31iYKZNTXVrwQHiJIZOS8YTO20Q8nzfM13ADAm76p1i/Q7j
         J8O7cDSqSHGW6qy2NJ8Srw3AzgwKjDN7XB0lhkkxS4qX6SHRQv/4evnkyInAhquXVNm5
         +dHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197198; x=1793801998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=;
        b=xEgIMyZefsoWDHtjb3oGQeka9BtOiCH9HfJyy06LPrA8CgOC4UgEZPOXRr+S3Itnhg
         QhiefQ+CRVWk2SEH6oy+jaZm+G+a4qhXsJ4idEdMTnt5KLy8KJb6gDs5ktU+L+OjVjXg
         9/xy8rEuGtVgBX8o3GgxOyYgXX6cp8LaH7WEkblooM+5t3y4PUfPKfApUTa0VXQVIAS9
         JTkfIpx6zcGP3SnSr2+jZS0ZBlKozmRst3oTfZKszL3LmjHpPfnSb9l3PRWjT/OMQoI3
         /fHOWwnZCjCDn/Eep93YjIJwaBLSlPawyDM0u6HfkP1WHQmtzwsxEumhQmJSEWC00SR8
         8CtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLSiZI75Sgbrxzq6fBe7YJ4LhG2q8yB6mo6NmiRlbmSlNJA4IixQ2AoKq5ZkMEz6azPKjL9/qPdPfrnhhY@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3iDj/0swoR82p9li7Fuxu28UfIQ4wBWsY5wEc0B/XJPBUO3f0
	NGeqAtnqGjfL+YZIhwrpCqGOXRSZpFwuVjGPVPjaymppWtcJphI9LPH60K2pk/1fpD/wPWMYEo8
	n8fHCMonJOLg5kEqzkM8VwJ8G3a+iwwa6HAXeQEiyLpTObmXWk1LfsBrxCJ5AiMQPrM+5/r0IuJ
	1oDpqI3hyv1aSfRsOM0mCvDkN8iMQxka8KOYcbP2hsf+M=
X-Gm-Gg: AYBFou27GP6z4gZ4PVVKhkoUjhubvVtPZi6Ndyhz5xs/t9ZKdBz2siuUPXJhIzeI8Ru
	oDezTZXlfIyvACch9ldn+uaxBSf4vAjlGukSh2nuaj0dnFyMSRO+3ynncjtMEb1HwlbQvCoKdiE
	2uMKGld2nOfIrtIy9wD21smuTe3Uz3GxFfwy1jlTLkTRXiw76616Qj5855noEXWu16R5X5G59Fs
	Imyk3udDsRiD9hepYgN3t50HE3ZLxQq8dBYgxb7g0+jJTHmEHN8WdsrKSZq9ppLpiRJ0btY6FE=
X-Received: by 2002:a05:620a:458b:b0:93f:237c:1019 with SMTP id af79cd13be357-94408d08e5bmr375732085a.62.1793197197452;
        Wed, 28 Oct 2026 07:19:57 -0700 (PDT)
X-Received: by 2002:a05:620a:458b:b0:93f:237c:1019 with SMTP id
 af79cd13be357-94408d08e5bmr375725285a.62.1793197196764; Wed, 28 Oct 2026
 07:19:56 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com> <20261028132403.3505037-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-2-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:19:45 +0100
X-Gm-Features: AclHuK8kkq0Gqe5D0rM_tGuX-UB3ViZblls9exEieIKoK6z36eZPswD3Pd1PIYk
Message-ID: <CAFEp6-3-B3ub9giiSu5G_jJtDxv=D6+kxWqRao91GgjyumAp=A@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] media: qcom: camss: factor out the VFE minimum
 clock rate
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX4kDh2eev71b2
 1rWrlW3GXtVOaW+QWIpT4qW8+S2NY0D6G1/wbdwFCxrUuYaw+G45Sy/g7ejGX68A8ZMIJoy1Kpx
 4AdbqVqnh1zAsJ3wkvMy5tw77Q7DCh0FtroI8LEHoGlZICYlvrU3YsRYJVLknocpymtGP0+HQmO
 Vzwr1zMhFP/07TXgJiBtMbc7tG6uyOW4v5RU9Cygy+SacmIAWynq4kEo/FWOwn96YDYfHZyGiJE
 r9ZaHK8sJpDL8JM0lhVsLNaRps6DYXeSkVLoYegXNjcpKQ6fapwe0vzJ1lQOAkbEnz85mTzf8xk
 uu4D6DRbgONx7E/o0ZWSMbse/QledchKQ/EKhqQctywkxvpIOOETUnN96Frhy2AQh1acl+7L21v
 iS8UZKUynAa7nmS5K11W/Rb9sDhRhxougvzGfRefq5aXpLeOgBnZhJwBxLT58kJscctTRdMuKJU
 SX+VJxyyLeu88jxitng==
X-Proofpoint-GUID: meQK6YKMVntXR3NCgo4IuTI5KcXlKjxz
X-Proofpoint-ORIG-GUID: meQK6YKMVntXR3NCgo4IuTI5KcXlKjxz
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae2048e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=4dG2s3dy74NheT9wN7EA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX11APIZZAcuEE
 NQCDnUW8U3gY7dukscIejFfqDD6jVmhZnZPyVXygcKTzwiTd0JY+fli+jlrX/5/zYUg1a1Bdjut
 yX+D7LlG2SCTQPjPd9oMRM1a9YzaVqU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280057

On Wed, Oct 28, 2026 at 2:24=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> vfe_set_clock_rates() and vfe_check_clock_rates() both compute the
> minimum clock rate needed by the VFE lines from their pixel rates,
> inside the loop over the VFE clocks. The result is the same for every
> clock.
>
> Move the computation into vfe_get_min_clock_rate() and call it once
> per VFE, so that the clock loops only select and check rates. No
> functional change.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 108 ++++++++----------
>  1 file changed, 46 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..59be37f83df3 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -935,52 +935,66 @@ static bool vfe_check_clock_levels(struct camss_clo=
ck *clock)
>  }
>
>  /*
> - * vfe_set_clock_rates - Calculate and set clock rates on VFE module
> + * vfe_get_min_clock_rate - Get the minimum VFE clock rate for its lines
>   * @vfe: VFE device
>   *
> - * Return 0 on success or a negative error code otherwise
> + * Return the highest rate needed by the VFE lines for their pixel rates=
,
> + * including the clock margin, or 0 if no pixel rate is available
>   */
> -static int vfe_set_clock_rates(struct vfe_device *vfe)
> +static u64 vfe_get_min_clock_rate(struct vfe_device *vfe)
>  {
> -       struct device *dev =3D vfe->camss->dev;
>         u64 pixel_clock[VFE_LINE_NUM_MAX];
> -       int i, j;
> -       int ret;
> +       u64 min_rate =3D 0;
> +       int i;
>
>         for (i =3D VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
> -               ret =3D camss_get_pixel_clock(&vfe->line[i].subdev.entity=
,
> -                                           &pixel_clock[i]);
> -               if (ret)
> +               if (camss_get_pixel_clock(&vfe->line[i].subdev.entity,
> +                                         &pixel_clock[i]))
>                         pixel_clock[i] =3D 0;
>         }
>
> -       for (i =3D 0; i < vfe->nclocks; i++) {
> -               struct camss_clock *clock =3D &vfe->clock[i];
> +       for (i =3D VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
> +               u32 tmp;
> +               u8 bpp;
>
> -               if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
> -                       u64 min_rate =3D 0;
> -                       long rate;
> +               if (i =3D=3D VFE_LINE_PIX) {
> +                       tmp =3D pixel_clock[i];
> +               } else {
> +                       struct vfe_line *l =3D &vfe->line[i];
>
> -                       for (j =3D VFE_LINE_RDI0; j < vfe->res->line_num;=
 j++) {
> -                               u32 tmp;
> -                               u8 bpp;
> +                       bpp =3D camss_format_get_bpp(l->formats,
> +                                                  l->nformats,
> +                                                  l->fmt[MSM_VFE_PAD_SIN=
K].code);
> +                       tmp =3D pixel_clock[i] * bpp / 64;
> +               }
>
> -                               if (j =3D=3D VFE_LINE_PIX) {
> -                                       tmp =3D pixel_clock[j];
> -                               } else {
> -                                       struct vfe_line *l =3D &vfe->line=
[j];
> +               if (min_rate < tmp)
> +                       min_rate =3D tmp;
> +       }
>
> -                                       bpp =3D camss_format_get_bpp(l->f=
ormats,
> -                                                                  l->nfo=
rmats,
> -                                                                  l->fmt=
[MSM_VFE_PAD_SINK].code);
> -                                       tmp =3D pixel_clock[j] * bpp / 64=
;
> -                               }
> +       camss_add_clock_margin(&min_rate);
>
> -                               if (min_rate < tmp)
> -                                       min_rate =3D tmp;
> -                       }
> +       return min_rate;
> +}
>
> -                       camss_add_clock_margin(&min_rate);
> +/*
> + * vfe_set_clock_rates - Calculate and set clock rates on VFE module
> + * @vfe: VFE device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int vfe_set_clock_rates(struct vfe_device *vfe)
> +{
> +       struct device *dev =3D vfe->camss->dev;
> +       u64 min_rate =3D vfe_get_min_clock_rate(vfe);
> +       int i, j;
> +       int ret;
> +
> +       for (i =3D 0; i < vfe->nclocks; i++) {
> +               struct camss_clock *clock =3D &vfe->clock[i];
> +
> +               if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
> +                       long rate;
>
>                         for (j =3D 0; j < clock->nfreqs; j++)
>                                 if (min_rate < clock->freq[j])
> @@ -1024,45 +1038,15 @@ static int vfe_set_clock_rates(struct vfe_device =
*vfe)
>   */
>  static int vfe_check_clock_rates(struct vfe_device *vfe)
>  {
> -       u64 pixel_clock[VFE_LINE_NUM_MAX];
> -       int i, j;
> -       int ret;
> -
> -       for (i =3D VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
> -               ret =3D camss_get_pixel_clock(&vfe->line[i].subdev.entity=
,
> -                                           &pixel_clock[i]);
> -               if (ret)
> -                       pixel_clock[i] =3D 0;
> -       }
> +       u64 min_rate =3D vfe_get_min_clock_rate(vfe);
> +       int i;
>
>         for (i =3D 0; i < vfe->nclocks; i++) {
>                 struct camss_clock *clock =3D &vfe->clock[i];
>
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
> -                       u64 min_rate =3D 0;
>                         unsigned long rate;
>
> -                       for (j =3D VFE_LINE_RDI0; j < vfe->res->line_num;=
 j++) {
> -                               u32 tmp;
> -                               u8 bpp;
> -
> -                               if (j =3D=3D VFE_LINE_PIX) {
> -                                       tmp =3D pixel_clock[j];
> -                               } else {
> -                                       struct vfe_line *l =3D &vfe->line=
[j];
> -
> -                                       bpp =3D camss_format_get_bpp(l->f=
ormats,
> -                                                                  l->nfo=
rmats,
> -                                                                  l->fmt=
[MSM_VFE_PAD_SINK].code);
> -                                       tmp =3D pixel_clock[j] * bpp / 64=
;
> -                               }
> -
> -                               if (min_rate < tmp)
> -                                       min_rate =3D tmp;
> -                       }
> -
> -                       camss_add_clock_margin(&min_rate);
> -
>                         rate =3D clk_get_rate(clock->clk);
>                         if (rate < min_rate)
>                                 return -EBUSY;
> --
> 2.34.1
>
