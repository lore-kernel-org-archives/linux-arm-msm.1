Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45051471D14
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811026; cv=pass; b=boxD9BLIvrHm6Y04Bzh2NvqNyifMyds6qb1kljCJ439cUN8p9YKxerNZHmI/NAZ2RSZ8W2JCDXnLjjPaNGeJNigiVVUDYo1YfJC6+xFg7U6apH9xFkMGOiaqiuDxh42tOm6B2E6oNTsk0TqQLlA171WZv+i2SWsrrFppRkrITwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811026; c=relaxed/simple;
	bh=hlGGDYwymH6mg8D1WDX6uDKt7eM+j3/WsmB9hbKOAzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8TRBI6BnH18mfupkJ8/Ps6T00I28cZNeN5EnEXCVcnoBjKaAghkfypmQy8dYPJqsdXte22mZDrhoOP2IGkpYyCSFbO5Wgu505p521dA/XP31s2DqMZcoUz4apX81NcJ4o/XDbaDkyrR5Lni6vRgQwJRxuX9nprsQjCnMFpxgbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0U5Rj74; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtJHxJkV; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0U5Rj74";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtJHxJkV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qf0n3642623
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8e7ZsseomCptKcwVNGi5wJcqARzu7xwaQuKtNwqprBw=; b=n0U5Rj74LXzfJUj1
	Hb1IpHD/zYmylCIzNjGhWRg+adyRcS5lKro0nlvbeYFhcGOXC3/RQJYKGEMvDnGa
	H4JaDgwXvBkMXZvODTXY8n2wejPhMff9X7BwBZOO+C043Nf7YXnkKEkuOdTXUzrW
	OdN9ho1r2GYPSDXvxwWeWGwH46gxktKPyotyad/Ww+DwK7Zvd/AmpR4G93USDpnq
	NvdUg3zd8eCNNxH4RMdMJiYlXkUivl896rFTpBu3Ep3AufzsshKHWWOfPv6tO6Cn
	upeLtXoO0Puy9XfkxfbgbOhYEqsPyEA1CajM9LnZ4c2gSXaqp0k02R8kCqaUfucw
	xTm/pg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayha3kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:50:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso18160746d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 05:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784811024; cv=none;
        d=google.com; s=arc-20260327;
        b=QVYeRs7HzyPD4WLOzu7Wca9rT/GCOfLk/Foj9ZXFduPDMxWmUA+rmINTruuSEUdhWG
         2WmLLlAUGfxEadYM8bQurowsWVm9TKuUnePNUUkr49gN+XFBOVIBZOcxxyWeZ84rnXaw
         iC+x2mGKD0XrFhojuXZO355vM8XTjPgWccusedGEa7latUlmS2XeVJqUq60Gqd3BgQOz
         3fyYGObyGbu/Vb/XaAvSQ1Txy4MRxBZ+NAVfpZiCDTT+wcjsvlMzwxcdj3lXeXyvfpT9
         QnUX6dXJw3cQrbv6fXt1sfjYY+rR9fDNyz9aN9/QFRK+yfE/LBVn/gVxbSsHsk5j9aWj
         AnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8e7ZsseomCptKcwVNGi5wJcqARzu7xwaQuKtNwqprBw=;
        fh=xM2bq71rpnSWJ0ZxEuQqVNAxdLnTmJor68fzWXe2rSE=;
        b=IQgAn3jyR7JyAKr1YX9EbLKeRqFAHEZVOBqTaSPiRJF5569NGaUAutFg98tH3vdy9x
         HXSirtSlzCX7VXhr4J3CO9xqqY7rOmXkOOSpMnddXieTQ/3khPlSr8FXRIktamSXtuty
         Ii5u97q9AHxSv1EQecrar66A6nlGQPXWSSyPmI6PiOaVCZIKvc9cGOuoCHAkKsdSDwu/
         Mkhf5baz/Vv54f4EeZ5/L+a5OveXPdmT9iwIg6kksBYWc6oFm8FKm+HJpbYemcsf4lcr
         6pjIqgdEJf+g+SV218XCMikizZHFzh7LxzNxyjGQnIFFa3ZoE3bJveTElLTrjoXl2lvI
         VYLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784811024; x=1785415824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8e7ZsseomCptKcwVNGi5wJcqARzu7xwaQuKtNwqprBw=;
        b=EtJHxJkVONKstf1kFoiGbp08fzfvRlCSNa04+TInrAfotkuwg0t1itHHxL/pRrkyU1
         sTrh+NEMycbpLQ3shq5bhmtK28IrztFC29POW3GGYP2m3pFohfGIPaqZIDUl/LeJ0R5L
         hv/prrca4dWClMTEf+HsOynZkjD883NF7UeCyeVCGhbBE+jRrS4FtrkFOPH3AED/cTrM
         dp22fRKCJIIyi4fe25qA/naH4BwYtoFhYk/T1tIErhjU0kxZCvbYLLfSkesB9lAUID2K
         aJuuDqKzljq2Vab1FuuSyUPB0gYdYKmOGNIC9zHRZKuGsDwTsWyvTRsRKh3NLhji8fve
         Ah/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811024; x=1785415824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8e7ZsseomCptKcwVNGi5wJcqARzu7xwaQuKtNwqprBw=;
        b=CaBPcKfKfwzmf3FzKqm0YnGtjMayvtPiKHUPM05ivBGqiciqeUz5GmNMVyOaCadePU
         2FW6Ihn6+hMuGLQvfPXs5AQfxL5v7Mf5iRNgg/VGHAQFL9W3yKGwuzZh+CQJADGEjYrF
         vMcChm2WmEqFS6RnB1ek5ck77ESRrD36OQpeChqRWKim09UVTswHrBr7ifgHeixT9KXO
         1UVi2TmpRBSzNzyUOApFHxqkAfDRK3jqWl1M3VCWtU1P35ddPVDCnU6Y+GcTGpHYnm/q
         7NEt1HmI/pX1znL1B6jIljTsCIvkIcWjHFR9taWcKRoSfKz/I/kzfWGElIwsSrvKbhF9
         6bQw==
X-Forwarded-Encrypted: i=1; AHgh+RoeTSBFE1vPEk2uilglNoicW52RusdjWX7s3z7kPe/aEOaADfo6gdpLxZ6/H11/okwy70GsNOwk1/ZbCyfu@vger.kernel.org
X-Gm-Message-State: AOJu0YyG43dKK0MF2Q7PXfW7tsN0fIYBzLxmr4Ci6EpwBiomnNazzoi4
	pcpj1Tjwj7Q86wH7k/ps4qqURwEEsKzVgW+ldiTbu6Xu0DDCAFH3BN6C8lJF3kDL3krT1WysaTS
	rhkJkuZtVSif7vuaYg78yLiRbiW2zE7h9AvClBEPgIkDKVfpa4Q8uPiAjz8LbLQqrhUS1R+/zRo
	ubQdTJ47cVxYYXfZ1c0GDeAo95x7VXoSqz1ekXANv3ieZmuauitaOQL1s4
X-Gm-Gg: AR+sD12lb5coUplb15mnDHbvM6Zsz6muoFr8KHE87moxYd7SS0dS0k18fL8GgOjRCi5
	D4MptuYV+pCx7bq2YMHMzJxDfrdKdopbleWvt9xOyxHkorCymcKPw5mAsf2emf+Q/c16HEGCt4w
	anFPF6MKYpBGPym0Oe65AQZ+jCFpIpMFgSL30Jk1hKTWvNkQznksFzj2LuAtbTIk8i5JhvHZ4NA
	glINl33EQMum4junz/Vr1gOSa1NE64ixxzG9uU6PiMQDUlzu5icR+zfVpHkqWG/P/flfmoa93M=
X-Received: by 2002:a05:620a:4726:b0:930:f7ee:2cf5 with SMTP id af79cd13be357-93103b22fe2mr283340485a.66.1784811023502;
        Thu, 23 Jul 2026 05:50:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4726:b0:930:f7ee:2cf5 with SMTP id
 af79cd13be357-93103b22fe2mr283336185a.66.1784811022869; Thu, 23 Jul 2026
 05:50:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:50:11 +0200
X-Gm-Features: AUfX_mwF21VL9ibLPXKd6XDb1LktyT-nN-Sq53-IY29arpzrGXEA5oSTVWM1quc
Message-ID: <CAFEp6-2KX+iVPNaTHHRC+QYvn7b7iowPtd3ysgpKFhEdaY9AfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: qcom: camss: Add "gcc_axi_hf" to 8775p VFE
 lite clock lists
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a620e10 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=idSoneugJW-k1LHGf6cA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 38yVa5kiHzUul_Fou5kdu_2qoa2TCSX3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX/tAoB6I1WXjy
 AKOHFUFf/RRl9oxWPEgcfBcFs6Wz5exEaFOQrAikMHD/qFq6iAxaugTctuAYwuvUgXgIp6vLxBy
 xHUGrobJuGRSAhshIvJ/rCKiRUUHMYyYrpIpEC4hCdjn75iRLwwxfTnvKO8HT3HUCDNpRQHpQ+f
 TGoXk/nQLJ2puRNLDN90AJMAMnyozbg7DkjaPSFIQCq6/UTm4STyWeUwFVTxs27IzOzPWTl/ERA
 tTtG6GfG9lt5ymOyXbc3Tk5ANOy9b7d6lStIZTkcNHzVNnGVVJJWFxrTQCZ1BofW5qdvgG9j03v
 OP8UpKAZ3H53KFNV7n7oNWswNaqcGUkM9UYV9jDxf+HdDw4DHM+S4VCXVgzQTVWrrX38UH4p0S3
 FSlHDTtThKpM8db8RHc8XuL/LFRa19VqvD41ih1qj9w7/Jr3q/JvI9oIGINqsvuJ34PLpYzkGtW
 q2VRlssxdxfxpb0ZIBw==
X-Proofpoint-GUID: 38yVa5kiHzUul_Fou5kdu_2qoa2TCSX3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNiBTYWx0ZWRfX+4N+LJykPxHA
 +n3xVYiZcUi5uJDKY13OCyVO73hrGlW7u/7KkBwUjjq0hMM9yKiEH5oUVErfXmHvEgS8epViDEE
 XdX8dqJEsP3IrsJbNxYTIGQzmkxeTos=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230126

On Thu, Jul 23, 2026 at 1:09=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> The "gcc_axi_hf" clock is correctly listed in the clock list of the
> 8775p 2 main VFE-s, but it is missing from all the VFE-lite clock lists,
> causing these to not work on platforms where the firmware allows turning
> off "gcc_axi_hf".
>
> Add the missing "gcc_axi_hf" to fix the VFE-lite blocks not working on
> these platforms.
>
> Fixes: 924f45e58b1fe ("media: qcom: camss: Add missing clocks for VFE lit=
e on sa8775p")
> Cc: stable@vger.kernel.org
> Suggested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v2:
> - Also update clock_rate lists
> - Add missing Fixes: tag
> ---
>  drivers/media/platform/qcom/camss/camss.c | 25 ++++++++++++++---------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d..68491b16d647 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4037,10 +4037,11 @@ static const struct camss_subdev_resources vfe_re=
s_8775p[] =3D {
>         /* VFE2 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
> -                          "vfe_lite_csid", "vfe_lite_cphy_rx",
> +               .clock =3D { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
> +                          "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cph=
y_rx",
>                            "vfe_lite", "camnoc_axi"},
>                 .clock_rate =3D {
> +                       { 0 },
>                         { 0 },
>                         { 0 },
>                         { 300000000, 400000000, 400000000, 400000000 },
> @@ -4062,10 +4063,11 @@ static const struct camss_subdev_resources vfe_re=
s_8775p[] =3D {
>         /* VFE3 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
> -                          "vfe_lite_csid", "vfe_lite_cphy_rx",
> +               .clock =3D { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
> +                          "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cph=
y_rx",
>                            "vfe_lite", "camnoc_axi"},
>                 .clock_rate =3D {
> +                       { 0 },
>                         { 0 },
>                         { 0 },
>                         { 300000000, 400000000, 400000000, 400000000 },
> @@ -4087,10 +4089,11 @@ static const struct camss_subdev_resources vfe_re=
s_8775p[] =3D {
>         /* VFE4 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
> -                          "vfe_lite_csid", "vfe_lite_cphy_rx",
> +               .clock =3D { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
> +                          "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cph=
y_rx",
>                            "vfe_lite", "camnoc_axi"},
>                 .clock_rate =3D {
> +                       { 0 },
>                         { 0 },
>                         { 0 },
>                         { 300000000, 400000000, 400000000, 400000000 },
> @@ -4112,10 +4115,11 @@ static const struct camss_subdev_resources vfe_re=
s_8775p[] =3D {
>         /* VFE5 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
> -                          "vfe_lite_csid", "vfe_lite_cphy_rx",
> +               .clock =3D { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
> +                          "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cph=
y_rx",
>                            "vfe_lite", "camnoc_axi"},
>                 .clock_rate =3D {
> +                       { 0 },
>                         { 0 },
>                         { 0 },
>                         { 300000000, 400000000, 400000000, 400000000 },
> @@ -4137,10 +4141,11 @@ static const struct camss_subdev_resources vfe_re=
s_8775p[] =3D {
>         /* VFE6 (lite) */
>         {
>                 .regulators =3D {},
> -               .clock =3D { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
> -                          "vfe_lite_csid", "vfe_lite_cphy_rx",
> +               .clock =3D { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
> +                          "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cph=
y_rx",
>                            "vfe_lite", "camnoc_axi"},
>                 .clock_rate =3D {
> +                       { 0 },
>                         { 0 },
>                         { 0 },
>                         { 300000000, 400000000, 400000000, 400000000 },
> --
> 2.55.0
>
