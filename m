Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793050890;
	b=swJuLzTxiydrJWr4l0arYuqaGwaS8HRg2PTF1qjjwatVlCnKSKJrWAD6JFT7hN4XPanq
	 g8tblukv6SklEwijYiSf1trN1lF3YDSliaXRsLakq9YKqGMVdfXvX52Sxel7MvJO7HkRW
	 7RfM3UFzL63LZ/YaFrJ2RZtrw8Gd+P4nYhdt1Uwy8PR5Vy76fh13CFVYKmnJlCahFuI0p
	 5Ooo2Eyo8yBQyPS0DH/pdsG8tjjff4d1xVskf9a/hxWtRMZ/APxmKxQ5WkQqJD4GOJN2/
	 +JvXGWyUx45upOg5luDQXEfXCz7kSdr+YGsOXr86gxpJcImkp+YHsAZ9BUfjQEDip8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lWzxRcNP0EA974T23MJtm9JINdrJZubezdMnSoVs3yE=;
	b=g4rh9ibPs6DbeOiFzEhYDYhUV4OiE9Rf/Uj6ve7s539xVLg6F7/t/pfL5N5oxHjVocMD
	 AxlPPOxRkFFGVeSpPJ9fOuadKPPy5RWF16+oeGcjMu6C/UQBD3bV3JBbvEhd5B1dOrSxC
	 ItaZcb/VmK65BsSZVzjQL956UEiyIJUv0kOT6fOCcW181ZMfxPi27DwYjG4PSjOmqw1/k
	 RIECxpuTbPAjjyMRtBD53enfZ29gXXVlQDis4SBb1WQQ4eddXhAwNiaWrhQqgt1QFxbHw
	 5qdfUh1eMLMICcZbjXzgEZPWaJXmPdcQBcRliSW+4tK2V0DiLi1MOAFv8Yo6+9VYG7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i1HD5ZpP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SQn4dk8f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D7B606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D7B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i1HD5ZpP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SQn4dk8f
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIoLES3055282
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=lWzxRcNP0EA974T23MJtm9JINdrJZubezdMnSoVs3yE=; b=i1
	HD5ZpPQh7FmJTdyM4lPzMiwyHeHp+XFvkKgfZ6OBqDRrW8DkvJyAS4W53OUFw5po
	SLQRtdxZe9ceVunbTWAwpCbVCdRZ5+ZEXFDYHi2QBSQcQF3wCuQjUZp+A7VTcFKE
	RkEG4qqasoRLcidRJ1MyQOAfGSmx2hcqdIeWoFKUDMJBnGiCUcgmcftRNBNFn6RT
	F3OGGURu1bbiK8HzRCawmWw7PI8t1lCB6y/iKFw+L+PdibcWCzkdvp7v2aXEvuB9
	rKrQqm6db2tT0yPshIDh+4OR/b/7kf0oNzsv26OtdjZtCLI+Y8nxaaRoQbgRXm99
	Rm1oZWDVarEmf4Ul9R3Q==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smsk5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 21:41:27 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46dade0d7cdso3357149fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793050887; cv=none;
        d=google.com; s=arc-20260327;
        b=nGSnfiRTCfaoZloWnxEB+ShSD4MHD9d13D2GJkheuZMftO4G6y6ENJisFciQR4Yz8B
         sriLeoedHBD/HmlWwNEnxHRorooMVb/EJhXFamNHvwBqfFG8n+A/5tqz9s8QvixEukcQ
         h0MGwT370Zg0x4iRG+fun6CZ69U/ccWb1KqED7eM43t+mj8XP+t/36BF+scjB8zfXZmz
         C7r2G2Eiwfmv0VORjeV/FP+wKPpVwtXKTqo9d4AU9jB7aUXFI0brZR99AHsgBsmRREW5
         sprEZSi147ip0tiSsLnY1zSpebXgcvr0jGviMJ+EEuGtHHyJaDEGDXQiNk6Xs9WiOoch
         XDoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=lWzxRcNP0EA974T23MJtm9JINdrJZubezdMnSoVs3yE=;
        fh=yfUtvUYJgo5KPzHiw0DEg7o2AtHP6jIf16YqPeMmvsI=;
        b=e+4u54SuAS+TZKVT3LeCyR505XiMCa+N8JSkhSmA+uAHg8HnPCktVt8Ab7Ey0lGeM1
         VQlUzI/SIXcz1u9yaHqd2R04jmS+o/TsusD/Wkv0Plut556ZA9tKQH0Xfub34ZshyUGL
         MN0qaKD9sJpNlaKCHnDEOL8HupasktsC6p/pZ32hpSIIDoSUR1Z8RbU8SghlEFi+xhu3
         Tbcrnrcbc1y27wSyElzHwc7lcgfUbVsl9/uteIjfjgEQu/m4wXYLcjEq/X90L1LlF92x
         aQqhIUZuvgL3UO1UeoLlKoPuK9GRuUnPlNAwvz1KaMTbkYgYyeW5Tc9md2/BkkDKqvBV
         0mdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793050887; x=1793655687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lWzxRcNP0EA974T23MJtm9JINdrJZubezdMnSoVs3yE=;
        b=SQn4dk8fXGvQFIl9Qka6dwTCOzIdPVi+FeQF/m3x582nM598VwpZbH8PVewPtDWJNS
         Lg9sRvF1QbXEx1M180g45CsWizTkmUoBKZnjaquJxgBO3RirkiOvsM5lpy/DcKosWUi3
         TCV9E6F+2hMCtA2HXoxkbK6aMF9IeTlAamqTXeGKQ0tWKY/eNIWB+ahp6Cg/3qJ2zNSs
         x0Ut/LH7e89rmJtseOFoSx8YW6YzKGMcwMOwIrUx2HIQGJVOkFpr3Xo3vFY5ZKS7x9/D
         qfmFt/NVzqWiTfZaFwdHciFI7zcgrtcO60vk+/ZdCnlBfnP2tr3qK/c+GNA6eKZBxRJj
         S7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050887; x=1793655687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lWzxRcNP0EA974T23MJtm9JINdrJZubezdMnSoVs3yE=;
        b=mQgNNEvBCSU76jplr1vduNwOPLgxLTJrl3SP5T/Sh6V3ZJKE2XJeMGBBW2uqURtMrg
         xSlug/r6Nlmfcij9tiiYxOYqOmQzCqFeWt5rCYhtXRcHz/ixXqWf1zCNJe6EKrG5nrC7
         /AkvbXIui0dftb4jvZDTVOtL8zwIG1bj741gme82zWHga3iYKxENzra7zqskqivctFl3
         HtrKDaYn3UQO3R2zdHQtxF59bvFtk2VJolMwh9ur09NB58Wy/RXrbA/Ys7LIVLY1RwIm
         sfhOc9ucARjRsal7bvUjBfubEulzvjYWcqeCFp7FeOGwZU03I3ULrhmlWU/Opro5RYC7
         eLdg==
X-Forwarded-Encrypted: i=1; AKwUvBxOAdallCSKvW4cCGD0uKP75Y/VEKPhy9BkpP2dqRMaoSKTYglC3y3V23PLY/IskEpXbM2BYC1Ol5PduWGi@vger.kernel.org
X-Gm-Message-State: AFq9FYJwI61HBsBwz5h4AOQsshb+z59+htySrMVCMrt5mQqgdHwaBc+P
	TRWfvtn45phbwzjKBBRwiMUxDPXxY3htwcc83HfUMgyVs9XL5PsXYRcTVQRZdJlGxQcloj80fS5
	SC2RUD5Ip7ACDYY5J5qgQdeVj5tQUig5pCvCB2P5qO4wSBOkp2DLLGZ+GcX8P3yi/Sv9SmUvVXh
	3mZWg2VLc0PvRe1v3vORNw8dDVIUy8wyYWNjPVHK/A9N0=
X-Gm-Gg: AYBFou15TTlpt+++QdcImVJ01AgXl7z7nUdnDL337LP5z/cwFTiYKI64YEOvxOcY8SG
	V7NDKCrdjPU0gIbW90UEZE/y9urhOENmrELLpm0YDOrMI5UgpPBUEFp706dYu43lgXmINPAYKd1
	Y8rWoSKLR8N+68so4q0BXKVRcfrRbFDrK7MJp6mTmzbNK9wlIM8M1tZVOKwA==
X-Received: by 2002:a05:6870:a2c9:b0:491:8695:3323 with SMTP id 586e51a60fabf-4a83f5338fdmr4761492fac.24.1793050887089;
        Mon, 26 Oct 2026 14:41:27 -0700 (PDT)
X-Received: by 2002:a05:6870:a2c9:b0:491:8695:3323 with SMTP id
 586e51a60fabf-4a83f5338fdmr4761476fac.24.1793050886681; Mon, 26 Oct 2026
 14:41:26 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <9671164f87138a0caf5c69b66129bbd6faf932f8.1793044688.git.bvanassche@acm.org>
In-Reply-To: <9671164f87138a0caf5c69b66129bbd6faf932f8.1793044688.git.bvanassche@acm.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:41:15 -0700
X-Gm-Features: AclHuK_7zT2IvHbHTNDkSXUCFvxh-cTVSQ0IQQuP8eK-pbBj0w4a_pzyD7ZWFRw
Message-ID: <CACSVV03Vjjd7AV3WrrpxbDgHAjWAUrru8GnJQK7HLwSSzQ=XAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix a lock leak in msm_ioctl_gem_info_set_metadata()
To: Bart Van Assche <bvanassche@acm.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yuan Chen <chenyuan@kylinos.cn>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: I02lEX6HNYMypqlZ3oGvxrcex1fZ--2r
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6adfc907 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N54-gffFAAAA:8
 a=058b4stj7-OAlbUbkHcA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: I02lEX6HNYMypqlZ3oGvxrcex1fZ--2r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NiBTYWx0ZWRfX+5+iUa9mn6yQ
 IWg3ljXY1FGEVcTzadH/5sGx0DHFNnA4VuBs5p8D4Ae69RL+JI/GdsrBzyz2JxRskBa/5ux7lrM
 fYAgrBqVngdO/aT07zYxweuPexnA/v8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NiBTYWx0ZWRfX+d+GQNDj71y0
 2tdlrNhx0+Uz8FvKBVjprVqKU1HggGvXXGOnTnZZgWAj6NZ8h1Y4Q0bNM1/BRwbXTVtH7I4W6by
 KmysvV6hz/9rsci4X22Pw7HSAOJkh1TBuJhi8nriOCf5N/FdaMpcStqYmmpMQo2iZKwjJdvnEtF
 oziQzBLnHnzgWqAllZIfrHYg61K9oD0yhc8yEADRVRvq2iQwjb4nojKDAcUBsJQ3EH7Uc6XQxEm
 YNP/W3IQfkDueYJWELFrmwD1Zr3rFd6JjYfpqdkM1oh0YNGT+36Xl2RaWOZ4blMyE7fjv5/qMZ5
 4Ns/0kShQbjA3WJe8zTSboVv4Q2x3MtZj9d2b6kT6mrQhuA74iQGIeCHPJ0jhQ0KsHW8WrZCgU5
 KgDbpgTtayFjHIvu7xkED15drisL0MSGmli5IS5BjUlr4oXEIP1mw3pr/jhh5Rjh7sncfG8AIE8
 xHipyQBHCguf+IwyA5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260086

On Mon, Oct 26, 2026 at 12:58=E2=80=AFPM Bart Van Assche <bvanassche@acm.or=
g> wrote:
>
> If krealloc() fails, msm_ioctl_gem_info_set_metadata() returns without
> unlocking the GEM object. Fix this by jumping to a new label that
> unlocks the GEM object before the buffer is freed. This bug has been
> detected by the Clang thread-safety analyzer.
>
> Fixes: 1c8c354098ea ("drm/msm: Add error handling for krealloc in metadat=
a setup")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

You nerd-sniped me into:
https://lore.kernel.org/all/20261026213701.22126-1-robin.clark@oss.qualcomm=
.com/

(but I'll take your patch for -fixes and rebase mine on top)

BR,
-R

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index 5e8f3ce26b32..7ab808322be6 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -571,13 +571,14 @@ static int msm_ioctl_gem_info_set_metadata(struct d=
rm_gem_object *obj,
>                 krealloc(msm_obj->metadata, metadata_size, GFP_KERNEL);
>         if (!new_metadata) {
>                 ret =3D -ENOMEM;
> -               goto out;
> +               goto unlock;
>         }
>
>         msm_obj->metadata =3D new_metadata;
>         msm_obj->metadata_size =3D metadata_size;
>         memcpy(msm_obj->metadata, buf, metadata_size);
>
> +unlock:
>         msm_gem_unlock(obj);
>
>  out:
