Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794959333;
	b=S6+ZhaA+RI/TJ5zIWYmPkZyPnNuSN5O10OritA76TQPYFCkdRbm4SUUKRWMuzYK7CkKj
	 ZGOM5uwaRTFQnsEPa/xewJZ3dkqVw22RSF8UE1bngyBZi9yBpYDMIp2iYrvPCIBxV1tVU
	 yx8UCXHQ4Ne6oMjAvPTjT54Qz6EcKnDi1WkY7N8VFkFXMOUvSj/p0jF9OyxfHkdDsBVwX
	 9CnoRUoPMsC6waZNmPiT41kmqwTbSsrs2DHe74mv8MmaGEhalA2y37l4ESFIxJie9px+C
	 OXJjx6Sd0iv3z1XnddDVLB9SpgduM+7sebkTPn5yGgil98wNuMNLxxpu5jE8mAGZpVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959333;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MaHtinZD1wk7Bum6txGTdaRyK+bUzqzEC5csqnjEg9U=;
	b=qvgu6b3pdRXyvcNsqWdFJsZnGPUD7kDAjz282wjCZLMETEUPAYmmUZfqNsfcsiJ/zqDb
	 3pmPX8ccFD3RwaJzPzH3HszKvvsEaDo+Xt8qvlVj4KdwuVjSuEzdkOACssWgicZSr7CB+
	 QS55EczVHgbmPn3X5B9lkMdJD9wxIFTAVOPA6eqmhFJc3IthyHtN1IN0MOxAlRnytw48u
	 A+wjoYkZP4iv89OxrY32/8ZP7dmlf8iusKpX2XMShM/9XOt5YqI0MIdO2cwEvxUsc6bfg
	 GwYEN/axg8tYr1jJAd6wtxSIu+NMbEOEKMa2AkAzynXd7KcRwnq2ihF42acZh1mm3hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l9Yt0Xwt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hsMChUgp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB6A606A330
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB6A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l9Yt0Xwt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hsMChUgp
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMfad11887489
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=MaHtinZD1wk7Bum6txGTdaRyK+bUzqzEC5csqnjEg9U=; b=l9
	Yt0XwtTEg/JH+OmVRiqxMbLtJPe0XUm/k84+9qGFxBtGd6xCfQEHy629pzUNKkID
	Eo7PS1boWeTJY+wPsWLqO/mvzC5V2nciKCTdNjex+ROcG1yTJveyEN0YoEJW+nLB
	o0A1kvKabeZ1zQBhzozMJLlnH37Js5MGACX0vu/IDXm5NI8LsOXd4YUJTIgVPB/C
	89Onpq3arIrhkXPz+B9ndHoF5Ku/LgUEC06PylpdQrcbeRdIlBxUTn8uwwVTQJVC
	HZFsFPCBn5Z2zc9MW0+Y3rlopV7rTHbbM6noAHkWlyUslQcJpG6vqVoumerUy2Vh
	QVyyl5FuAtFhO5PZvdWw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvar86h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:48:52 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-71b16de75bbso325207eaf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:48:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794959332; cv=none;
        d=google.com; s=arc-20260327;
        b=H7JL71QEn0JwM65rQ7VyQyT/nL3+8LOvIQ+zEg0o6+5c0/pZ/OGKO8LMGkNgvmPrN4
         +7Udmao0LAZjIAynvcjIweD7hZDRhByPrqAdK9rEAxcDyaz9JRErn5X1Xau+yA6A+kYn
         e1aHJuezrbsdim6cREPHuuH+wZmrR+vIbSv2U8vPMVEdpTgMaQu8/kuLwP6o8yuUMrSs
         HhDTTXD2JC/TnDyIkSCwmpGQNf1793/X90ZXvHQpl/WNOYgPp+9gLQ8D6w+1V1EberoV
         h2+57SrdaG6Sa9O+znmR3ddPZ2h1myFu3YfE5m/K+Ks92iF9UmubWH2xbEFWmd+ExqL8
         ZpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=MaHtinZD1wk7Bum6txGTdaRyK+bUzqzEC5csqnjEg9U=;
        fh=bdVNjGysMgdwnEbzMA0RrFHhum3R33oFb5HFk1EsLWE=;
        b=M6H+fQ6cPSV5eicpilIjZkdi6pvtX2lt3Ur0ecCLMnsY8692OXYP/pLtsA0yDJ4XUu
         HCN+wJ2E+3qiUXgZC2+zrgAVxi2gRv6LuknwkDhe6YaPZ0+FrSV2GOMCcfvGQ5cd5dTy
         pBRIPx0FvkrwkzVQn8YFOrI6WkFbvblemTaFL03gQvlADNvyLvbIO85hZNGsxO6tNlJJ
         lRjjhmoOn1yPZmvjUoaSvNJe9Z1LzHVRjLevmn3iX6Uj8zNyBAzCKpGvdipoX5InS912
         112kuEdwEvU93YCinSeTPgY4UGDjFH9dXe6r6rJwd6+Qd57XMK/MaFz7jcRQtmXh7fWF
         i/Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794959332; x=1795564132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MaHtinZD1wk7Bum6txGTdaRyK+bUzqzEC5csqnjEg9U=;
        b=hsMChUgp4Jxb5VVzdu+IWr7zmvjoYaSLL4xSJYYsvTOzL1L+8M7jyov1yjSRKD7HFO
         c39yoYIJTTyhUWQmL1TiVOK9LsL265gUxbFOGTGWnF3A7J1yD6EHmT6TuHEzcQWpfefI
         03CT6PCdqRYnN7Fn2CpUELJ8hsdloOAHwQ0hB3oRDTcjOCOfeg/47Xq4EptsV2pkw9aF
         EWYN9IBQFg+DsGX9g8mhCCj64t8Sg8fjVNSdKW+KyAgyBIGDNOqmdV2wlFLAo13V7lg5
         QZHm+vke0HC3TSZXfeuiPNupAl43Kv6c37KTSc/Mh8W2bCdl2MuLCM7gGxsgu5c1y+cB
         XNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794959332; x=1795564132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MaHtinZD1wk7Bum6txGTdaRyK+bUzqzEC5csqnjEg9U=;
        b=zRoGAQ3G2rHOzUp+CXSXiY2kd1N5sZM2sh9C5+XPkQkJJFV8XYon8t6yt1QBHzYUAw
         cGggswX6Somnkj6H61ORL488/RMO1yfnpcUIa6XieGgCihGrrfrgERqdA5i58UNBHo9I
         rLc/ERopEJZBKlutm9jTMCQtm4f3nKUQdx5RkP/2Ki6uQk3tgvpn55r4DO6/4dze4Uw+
         iWYm612tXuRtsYxm0vxSNx/Ev/KYGpA35hYCWl8dkQiktpQxGYwthbFS1RRevaS3Q7Q1
         lRQMKr44U5vnkVsBVzzQrrCGCY0plFsUFZC328E/5T4S8jkSMaISvTEVhdRY3tOEsXG1
         U3Tg==
X-Forwarded-Encrypted: i=1; AL+hErF6FiWmXnGaIktECZclwIo6+3yRJenAD8Vq9KF+IHqwYSMUWBd8QiBPwxhiv5uu6GDmNKIk/x9xRNY+MYB5@vger.kernel.org
X-Gm-Message-State: APuU4Z+ekm/0oLGfFLs+TtJZwM7oWLrtuv8PH9gT1lXKcjqYVpkKKsGs
	nCrfrU0YzxWSjEGT3O78ERk/Q3CEFe1hBe2kLQTb07bmuWNtdDFSGJEHlCbJao2w1xZntWqRAuy
	F/TohcmJJNlRUZZfeNT+qD47Qoic5qNZec/7hgbP0HxfyYEAxonNwAlp6oEnHyKL4dOmpsrURS7
	NxS5DQBHw2l/XQcHwinsq7I9fgN81H7vGF4BjZazB7Wk2VzAQEOilLnw==
X-Gm-Gg: AYBFou1pnSsvxJiOoCZ6bjLtwzzqkEFHChyPjNG1Zal2NwOIZrLSPPNX+VQ6GNVpgUl
	bQUPSuVcKUpZZMhjNy/2GFgmiakESi4HAf8LZIG4D0377+e1VQWfnvI8IG141orhalYCZj9dRd5
	SpPTTU/Xibw3ybp343ZhIclE9jdpbZT3FRq17q6aLhRO1oYOmkK4IC48HFjI+u8vx+cWIh4GkdI
	8tC2al9BoXRlRXLU/zZjw==
X-Received: by 2002:a05:6820:7090:20b0:71a:eea9:8173 with SMTP id 006d021491bc7-71b1877ef1amr514927eaf.85.1794959331885;
        Tue, 17 Nov 2026 15:48:51 -0800 (PST)
X-Received: by 2002:a05:6820:7090:20b0:71a:eea9:8173 with SMTP id
 006d021491bc7-71b1877ef1amr514912eaf.85.1794959331427; Tue, 17 Nov 2026
 15:48:51 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
 <20261111-a3xx-fix-me-v1-1-d81f50f1ba1e@oss.qualcomm.com> <079897df-fa2c-4ba0-bd45-7b357783b0a8@oss.qualcomm.com>
In-Reply-To: <079897df-fa2c-4ba0-bd45-7b357783b0a8@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 15:48:39 -0800
X-Gm-Features: AclHuK_gQ7TVoqme6UT0Bozf3_qr3rMIt2eYSB4MEtmBZmpM37PScfWEwT5xtvM
Message-ID: <CACSVV00s1MbvVp0NXRXEqPMu6Fh0FTzto7TGSKgfOb9pkp9tmA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/a3xx: report CP protected mode faults
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afce7e4 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=C0sjHUWUpF4vuSjdFmsA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: f0VpVjDXAKqmKlk1gXMg-Hb20g_eqZr7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5NCBTYWx0ZWRfX3hahNdQdCa0M
 PDb/UQw+ExMoTF6eUujENY7rQyZzSHjQilgIZqiTlIcOyFGDxXjL1iR8VAly2e8DDyRR4K3Q6Sr
 6Y3/uWvwl84nBJoXknSlWbAQxmIf0PPFieI7GFLPxU403UBakWtS9P+ToTyaPREFmgXmA7qf3Kd
 1x5CmggsgmEb+ahDl5XkCyOWwJgV+JU+INYB0P4Lb6ZIIfZGg15KlYNeXlvN2DnoB37RIiq4TYE
 6uALsAiUsDA2lhkkaqQc/Pb9RQn6WB/s2wpdBta55IDkoSRFMQy13UIyoq5dH6lCtaT0E8+/8qZ
 uWlKtgiNIuCTXC1zchWFk/OV7t55yR6tDbrEnL2ijWJVuTk+kegkmGoNNWSOqfJ/GmHleg51IpN
 OwnPCjNgWO+zc0Fudgn+WA4iVWN73/96Tzq6/Jgt3/jWedsH/+V2ZXkfA6H7dJcXoabErOlnkje
 /tX6MhD6EXK91Jewnhg==
X-Proofpoint-ORIG-GUID: f0VpVjDXAKqmKlk1gXMg-Hb20g_eqZr7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5NCBTYWx0ZWRfXx7KqCx+eWj5p
 MTgTjuRVfdiJz3zz6bvxSMIBYG5EQoCkZkT0Uip9Tr0vBB5GZM8D+SI0695OEokNe26lay3DQnz
 KjF4xnJ+C4d7NQ0eGyYCrsuk2f93MyY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170094

On Tue, Nov 17, 2026 at 7:53=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
>
> On 11-Nov-26 14:05, Dmitry Baryshkov wrote:
> > a3xx_irq() acks every interrupt without looking at it, so a write to a
> > protected register shows up only as a hangcheck timeout with no hint of
> > which register was hit. Print the faulting address the way a4xx and a5x=
x
> > already do.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a3xx_gpu.c
> > index 160d302e16a3..7e03b7305493 100644
> > --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> > @@ -419,7 +419,14 @@ static irqreturn_t a3xx_irq(struct msm_gpu *gpu)
> >       status =3D gpu_read(gpu, REG_A3XX_RBBM_INT_0_STATUS);
> >       DBG("%s: %08x", gpu->name, status);
> >
> > -     // TODO
> > +     if (status & A3XX_INT0_CP_REG_PROTECT_FAULT) {
> > +             u32 val =3D gpu_read(gpu, REG_A3XX_CP_PROTECT_STATUS);
> > +
> > +             dev_err_ratelimited(gpu->dev->dev,
> > +                     "CP | protected mode error | %s | addr=3D0x%8.8X =
| status=3D0x%8.8X\n",
> > +                     val & (1 << 24) ? "WRITE" : "READ",
> > +                     (val & 0xFFFFF) >> 2, val);
>
> I would really like BIT/GENMASK here..

Have a look at how it is done here, to keep it all tied back to
register defn xml:

https://patchwork.freedesktop.org/patch/768455/?series=3D178338&rev=3D1

BR,
-R
