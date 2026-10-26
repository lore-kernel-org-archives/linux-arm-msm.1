Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793027044;
	b=Fm3M0ObAXLFO22INCYuNeEaNNh0h7Bk2CVaTEKdUsUFB8Iyv55dtEMLu2jML+cZbA999
	 c0EnxFLNc/sWI7LjX27bMtI9GG/B2uNK6/oxYdL6DennysKggltVf6KmYBm0C6XYDzy3m
	 mgTSh8elWfFzUEP/PgpNs9KE6Nl4wusFal6EZv3xiVqGdIZgq46rVKu4CzRcjvN0EPgPY
	 uJfMZv3HqtkPHCYP/b0Di+DnZSoq25oTPSKgx97xZLlJVNM9gu7MiWiQPYxyB6Eb6Ar1g
	 laD8afK4dFNTCrrUF00GWH5DPFwmMy5HDdduT/ydo51RR77VOw2xPeko84s0mB4vu+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=;
	b=IkWyIUGur2q2DyzFbHSrtrcgR+y7OKeY8rzONUxWnZvRnOm1m+haGdNUVjx2xePfOFk4
	 lJueSCeyFNKfq79gDDfC39PIMN3HXXmSlj3Ay7Ksz3Of0Fhv/sdEFnX9YuafF7Pa6UQLk
	 E0ZT948Yx33JJ+4GRPLHcfOSJPEn6gqKvfIeT84Ox2wBhEcbg6kmZ3X/C9a6XUX5teu8K
	 CwiVSEEOEH2XeS7AKk3T9S40lvYY1VZsW+DzE2ilwzVavJfLU+BqCO+Oc3zYUJ2gkK2QQ
	 p1xl27/5UreG0Viyr5zF2K3dRnEHpT93avjU8xHEF0N8QqaT5wijZceWYjMooIHvF/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LRnrH7Yl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFw1sUL6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5AF606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA5AF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LRnrH7Yl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFw1sUL6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvcP5465831
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=; b=LRnrH7YlLzqodBMg
	yxqpuGzqQq8Q+euwWRdQtyDNcUIySFG8F9zmv8NGcKlOMD7GqO3sLmobBcpusyLw
	hAafzOtoCKGc3IOwRid88cnftNjX8iWgcWa5bZG4iN8BTaXWDU5YpUTdKIrYIsMx
	jz2zp4l4PUROJv6vAScl6Z1PRDIXkXdb24Wjc+u4vTdgHz34IUUDejKb4l/pEUP1
	1qeMgd+zvI7EUGnJHyCi73hU6I8nrI3ZAntX4wQWrQswQCITWakYhGazTQj01boq
	1CpKAT8r40wlBGfd+lROJmLfyQEgQ4WT4ib9U+jqmwArA3y/csapGiGCiVmh9PKe
	HViSeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshptyj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:04:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f62934ef6so414477685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793027042; cv=none;
        d=google.com; s=arc-20260327;
        b=hx3MUrdYfnjSbI5XX7v9mkrfxpBowTeamTC6KXg2eo3IhWa7wi258VzTC7IrkZineT
         Xp4OARF74dXSckBksinekEXekhwRiCe0BfkOClIMM5rIlWA42bg1knadFdZ/Lt+vTBEI
         hWkSlH2C74D936t7OAz3H9L+TE+2+1fmLxv3ipMC0EJMw2Fb/Az0fAeUoVxwmX94FGPG
         yGSIcKyI4lhZ4WXzuT9wV/pGBOYI3/9Vz5IfadFp8dYJxI5k5+f9Y9Z0k41UKJmT0KVA
         O25k449wLbjE+/R3uXsfM2YKCekVikf86k9AYFdME6j7OED2S8SlT9lsAXMc75IVgNG/
         JT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=;
        fh=oR6G6TglnFkEGQwrzj47OlLwTfOaqIaFujNW/Sz+J64=;
        b=KVf1famAk8wRAH1mFoH9vAhAkuPOIBJwRMftGsJyS7CfzTHD8T/mV7hyeiumK0y1Uv
         HzpAALBEx0MTAFq5vbclvutJhWyBf0nVxi5+tXEfogI1RcZps44fwbCh29c3quIcZjDT
         n9QQ3vOV1hMck1VLMmHrExM9aSVJmxCXPZEyOu5Ps/O8CW35ra7NMhus23gjEQ2uc/rE
         XR9LZ8VmQ+AMYazuzFyZqPQNvkM/CLahI5z3N3fihKzLiintra03bV4CHd4hEfnPDlbZ
         Pbid1bY+THTHVTk3KWi/ms9mWSyWemn0zYCfkr2XOg8dg7Ho6ac6H3H1lsoegtkwp3mx
         rjYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027042; x=1793631842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=;
        b=FFw1sUL60zbI0K/HWDTIThcZcM0/RSAAwCI5qTe/8RYQK8JHh/cAKVaxOBiJjy8dLs
         E8F5JQntFHa4UhzVGnXCIV44wTKq22ituYeQ5jFqXI8CuapWcWbxSwirzG1VOsv78H9j
         x79Nl9Nzbvs1LjgnG8ZvE+liYARKtiUFjivzVAOyBZoX+3fczSTmE43kBn6kjW4UBzH9
         G7afRkAUi1Xr8BnmhrKGFNUqfFt6GXKHaPfbJ0vN3coA4+M8X+RPi5za82/QcQoHRgee
         He3halYLlQRFewpMoau8cLKS9A8bZOLgFTLN1gZFzvE/0+biCRkYT4picLADVhmCB23d
         zT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027042; x=1793631842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=;
        b=YKVDQJD6RqDzsZkb3tsstM6VFOTqf8ZCTrcOSVVK7mPggw1UoQt2MJvALF6LN1aTYd
         MQ3vvDn6RRCSK2sqNe3pLgjE8rcCBK/Y1854L16S5e4iIQZZX3QmQ+BPSotnWw4ffYtH
         GVG/INuwP3YwkrhbkaeX8zB7tcQW6steQ9JteNu7Uuc842plgPan7T2GzNrb1gEXOgY3
         NhcffCycmAlk53ddMbux9gQTkN28kV7AdLWIv/8+GR/ukJ7NS8OJEqHGBggTR0cVTbGS
         n2B5pJuv9Taemq1Yg94XxcSUbxHjSNyLxeAAkMAsRJ4e9JvWuZ4ty/YnuvDvSA25FhvE
         DbSw==
X-Forwarded-Encrypted: i=1; AKwUvByC5b/Jz7aqPwI9p4XsR3fzTtBu3nryPojEDEKNWYTGSL+14IdjPU+lD2RfS4sxlZ3OYvolAIKrjvUbAvq/@vger.kernel.org
X-Gm-Message-State: AFq9FYKyPkiXWJZ5AsZHLQDPbELYQIDd3AAoGPgNpVT+6Mf8Vwo/D5da
	5EVuC0/U8aGFwYFtiL9ZlZN4ujqkZisQE77KLyNT75VAU2NQj8k6bivR/Gn6At33xtyBn65q5Tj
	Zodu58ZQlNE0L0VeB0VdkypFE7xELeN4g2+l9ON3vdU3Kwehz+tuNfjhmwA1gzy3xl8gzCVdj6I
	pcPxXq6Y5ZwEqE9uZV6On/AQHqehnwjeIDFX4lYIg+1Sn9pnixaj51/R2n
X-Gm-Gg: AYBFou2GPVfllUnAKbia9ViY4DnkMqMX3+Zza3DUjg5Zyz9DvSMfCckC1WIK+X//VfZ
	ErYaFJFbUX4duwrfGoXUzCn2L3wkE+zBGdulqnXbacYs9zCcoCHGfM51qlexKpT2sgzAOKeJLh3
	P5JZ0YFGzBJZju78ZyXTT7Gh/pgW0Beq0DoTTJc3fPqp195YxspAyv99hjena5aY1EgsWG1HS5B
	TJiK51gnAC4k6DXbjWSQSerNsdRsRTUtJYKbVw1dyKzlo1yGIigM/ervgLJcF9as7IIxnciPx9L
X-Received: by 2002:a05:620a:6314:10b0:940:f2d9:5f43 with SMTP id af79cd13be357-940f2d96196mr699038285a.6.1793027041642;
        Mon, 26 Oct 2026 08:04:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6314:10b0:940:f2d9:5f43 with SMTP id
 af79cd13be357-940f2d96196mr699032985a.6.1793027041023; Mon, 26 Oct 2026
 08:04:01 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com> <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:03:49 +0100
X-Gm-Features: AclHuK_TvdBINMSWsq4YF_lka7v-QqzNFebZNni5byyx9B9emy8t2ESfOBOR4AQ
Message-ID: <CAFEp6-3WQyjjFDjUMeVD7QDAK0VNhfD98XFw2YYJ8FZi54yypw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX/bG1cNdVOVGR
 QNxdFje/q0RFZAv0A9JRxvP1UazcaVL+ZQI0/0rU1yL4G1ADkJFMC26BQWtHgcGOt1ayRvZb2y1
 r2j069pg8JdQ5T5w0pBHLPiUsuEZgTA=
X-Proofpoint-GUID: XHXdX5MELnqNTSeXdA4ydmPD2AvtuJgL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX41bTl4bTqGmy
 7UJAIDNmI8gaFNQ9Y8M2Q7FPnYNpe5eIgKlSHk5qJKocWBSwwLsVHo7Aqu6h2R9lyENrqooARAc
 jVMaPOX0sXel6AFFX9SxAAtbDtdVUoTi2mnAhKgdPkvazpe10XJAF/J7aUBxvkjeLa1WOLi5d8B
 QZISPjSPYYL6U+y5w0aC3n/ZTAg2A4sZUCp7jJF/OuDRdTxPaBVybrbvPmAxJJbRZ9VQGAyAvDS
 L/ahUEf0TLI0CWeFAtR1vuanTM2OVHdsRb0XQ5AEFyipBl0X3SrTU4UwSwYIvFmhbOQPnqPKMcl
 qlq6Vz8e8ZmLkHp4+hSlGNsURbchMvN0Frvj2Mki1UOJ4PaGvzcdceSa4Mk0H2Jh1dRcT2uc/2Z
 T7JhppAxYLQjkKyGN2XWVnea7+nzg31ASz3HCgVoGTKgck544F6dk8QKEL3FNJ//Afoe6h0tiZl
 tRpLRJhSIYnNnZKARsQ==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf6be2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=xfkO0-JmZNjxaItLvQwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XHXdX5MELnqNTSeXdA4ydmPD2AvtuJgL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260059

On Mon, Oct 26, 2026 at 2:37=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The VFE fails to power on when the pixel rate exceeds the highest rate
> listed for any of its clocks. The rate tables of the VFE clocks are
> independent and need not have the same number of levels, so a clock
> with a lower top rate than the VFE core clock, such as the SC7280
> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> still supports.
>
> Clamp each clock to its highest listed rate instead, and warn that the
> pixel rate exceeds it when the clock lists more than one rate. Take the
> clamp into account when another line powers on an already running VFE,
> so that a clock running at its highest rate does not reject the
> request.

Again, we retrieve the pixel clock to derive the required VFE **core**
clock rate. If the VFE cannot sustain that rate, failing here seems
like the correct and sane behavior.

What I don't agree with is applying the same logic to other clock
domains, such as AXI/CAMNOC clocks. Their frequency is not directly
tied to the pixel clock, but rather to the aggregated bandwidth
requirements of all active clients and data paths. As such, deriving
their rate from the pixel clock requirement feels inaccurate and, in
my opinion, is an abuse of the existing logic.

So I think the implementation should either handle or delegate to
separate functions depending on the clock type:
- Set the VFE core clock based on the pixel clock requirements
(typically vfe_clk_rate >=3D pixel_rate).
- For all other clocks (like camnoc_axi), and until we have proper
aggregation or voting support, a simpler and safer approach would be
to select the highest available frequency.

Mixing fundamentally different clocks under the same rate calculation
does not seem conceptually correct to me.

Regards,
Loic

>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 59be37f83df3..359b5942df89 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -996,15 +996,13 @@ static int vfe_set_clock_rates(struct vfe_device *v=
fe)
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
>                         long rate;
>
> -                       for (j =3D 0; j < clock->nfreqs; j++)
> +                       for (j =3D 0; j < clock->nfreqs - 1; j++)
>                                 if (min_rate < clock->freq[j])
>                                         break;
>
> -                       if (j =3D=3D clock->nfreqs) {
> -                               dev_err(dev,
> -                                       "Pixel clock is too high for VFE"=
);
> -                               return -EINVAL;
> -                       }
> +                       if (clock->nfreqs > 1 && min_rate >=3D clock->fre=
q[j])
> +                               dev_warn(dev, "Pixel clock is too high fo=
r VFE clock %s\n",
> +                                        clock->name);
>
>                         /* if sensor pixel clock is not available */
>                         /* set highest possible VFE clock rate */
> @@ -1046,9 +1044,15 @@ static int vfe_check_clock_rates(struct vfe_device=
 *vfe)
>
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
>                         unsigned long rate;
> +                       long max_rate;
> +
> +                       /* A clock already at its highest rate cannot go =
higher */
> +                       max_rate =3D clk_round_rate(clock->clk, clock->fr=
eq[clock->nfreqs - 1]);
> +                       if (max_rate < 0)
> +                               return max_rate;
>
>                         rate =3D clk_get_rate(clock->clk);
> -                       if (rate < min_rate)
> +                       if (rate < min_t(u64, min_rate, max_rate))
>                                 return -EBUSY;
>                 }
>         }
> --
> 2.34.1
>
