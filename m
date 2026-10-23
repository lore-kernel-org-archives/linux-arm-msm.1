Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792770373;
	b=pxUfZLNeyK/xoeR0W1+hemkmMpsp12iodX7VqKaBhlakd4QZT4RVTuT1apNv4uyKJ+by
	 vYk8aUhJxZ1BD6PDgKPZMyXBiZe+vlV7tVaf+wwwNngxAg0Nl0CimM+S/9eSnbglaSfZy
	 WvRqKSgG958JaT29S6DBiZSo18tIL8FsvYLVjZHlZtlNMNodlcDUVDX1KGE/iwlWw5khf
	 cObZ/MVjkeCQ34fTfDbZJTOFlfoWWNSO9MU7OS6NHCFldxWn1MMnKV4kAaqiG9UxvEvjK
	 Vu7pd5o0lL1CpheU9r5yj8gSvdasErgMzBvCmMng84IlNDbH/WWJNY3M/09WBpGGVaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770373;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=;
	b=By61CShxxIpCbPzeqZvVbk2XYodZAA63mH82DlGmAP9tN10SpsShbOBKjaW2n4/hqpaW
	 lWZhEmDTMHlwel+o+ZZGjM0cnNVV4Xcle0qml1vEOPaDXR/uckcUfpVViFhgalcwzgZ2A
	 mXM5+tSDVx0FVQ3c8BOjjRfSD4mGpEbrkmsa8SsEMy2EzSAxotWPZ/8eLoy4fbDrlDRJM
	 fxN9zckFcP36GOqbHGMKrUFS/vE0zgrwPdqmiBXKcBv7ymshpUQE6CxlBYWPSUYgiTb5W
	 zGLG4OmYS1w52QcgqfCeYodL2kCvxqe/mz5DCRNMjVj1bntBP0t9nEoDJuXDmgURJdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evwdBAOC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WsNwSiDJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EDC606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13EDC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evwdBAOC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WsNwSiDJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5vYB4072850
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=; b=evwdBAOCvpQwwxFN
	ew1VktCEyBUdmDwDJZmymL2RN2I31pn9KEwh5rPGPzMTrmnvAVHP6kNrUPuZNmzp
	qQYuIA6atgpPESI7tVlDfS/m40nRPIlvta26gviZtTK4Aj8O8VIMqJUIAeRgNuAN
	HmU2YU3kdc9j0tZApI53HTOtUgVu5qudG3feTRst1IMb5N7yEymIXZ1BtKyRwC4d
	Kx1iAY/w6lg+y8D5Vguv6DYpFmTiN5CuVeqmSLjhqI4rSiU91hSAX6nS+A8aLKQ3
	qj5mLb6yDE4Lcj3cwoFiu0AbKSOgOWT5fpAqb0VnZace0f0SKCYzP7QzGb75ao1R
	UhX68g==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw0sxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:46:11 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c7f887ac6bso1650477b6e.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792770370; cv=none;
        d=google.com; s=arc-20260327;
        b=VaAPogVN7On17QHpUMfgDZhjyOTJbJx/d7U0TDdpGlSMgBKfF5DRTZ9/RdAYHnxbe7
         b0FCj7LqNzPHqdJ81IOJSSs75LgI3GxlMc92HOr6KCDT+1dXeCy6Q2bezmsdiAPNTeSX
         H3AFKJ9Yae20TNSjb1yhJdBpfAYkqZfDJtsKcW9eLqKzQK32uWvVKmPFuukgKG3q6DIs
         HAefW3ZE6iw5F32FSrwhTv858vhaotFzU870gQgjPAFoHSrLvQfBnr/cFGHUwonK4d/3
         6y/KZczf0RJi4xtNb+Xh5TCOljocI+fgeZUN0MfO5wLW8L6LAEZPQzKHsbtptlY6h9i2
         Ne/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=;
        fh=n+5BBn8CxXFti6cxl0cZwSr1BhFPOcZCksxP0KD6uz0=;
        b=JpD82DehVEvRXQmWJm6HmEUMScVXMVV0AznbuTSji17avBlQ46Q0w9UUvvoO3A+H9j
         HWyz568kNxUe+2qo5ZB85fXRgyiQ9V9j5mcMshD6q3x4+pk6JWFG+yAFFSM1cTKKiJs+
         YArSdclsRQymjN1afJV8C3IFyisktlnqxvfyWHkqJokhHCNL+X7y4VywHMIOFljjtDYX
         gTtWhh971WVNiO66BQINCnBmdAy5EfV2JR0bFqRpUGPMCt3IhLTy7s7Tc7pr7U/YWpW/
         a+42hCBjr89NuEUFkUGehhWzioPVHRyVkl0IcC8GZ6pMA0n/SiozB2XBqzjesRqLoxIn
         nxiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792770370; x=1793375170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=;
        b=WsNwSiDJcSyHxHSjDy1D4vD09OiWpnMB3do/sPIqTr/PmBvqCEu3+E3q3Lf2uHXIC7
         XI3mfeks4v3orUS7lyDzJDjGqmNJSrv6pGa6WhcMl15IPHdSiKHFKx27cbIo0zn7PTGW
         iB5vcv0z+oCgNciDocn3V/1adwWlsA4ZN9bdc/w8F7SwNY55WJGxAdsH5ElVi6RPO/cG
         IhOPc0dgg/hQQhX3r3Lz8QeSlnttg2tTHTmLZ0en9bIXADc1brV47PklyLMBSYXMaihc
         CT524JhAUGrGfW1TAwi74Mr3SFGeEXX3H1cfmV1bLEvwftoraXv2wtO67yuKLFNhZgWE
         E8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770370; x=1793375170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/oZy3r8kmHxYtAFoxOlyC7doeahiTYoTHRRZtl3TiY=;
        b=JsUmjuWJrxo2mBsyu3QPBCV4otYcsRBCni4LXikCfsOS3PG1eOy4Pu/bW7kCcoBT7L
         pWJqzxEV7ryiUmXzyWd/XgFNQ5PkhHB9yMXn5PwhEKKfX8uk1HrYjhGm/DSeFcT71Bw6
         LHYrVNA3e5epqxPRh/ikwO5ew5HpeUNBStIx/V1U8HSRGSKQLKwcWnXVijPrafw/ul+t
         akG8qCnvQ604E493dEln8acIZvaZuEhEsv7JXtSydg3/Qq5MxsvrTHbwRSSO9Mq5HvlT
         pJxhaIGdwlhCdzoQm9Z9NrkamyjvIHmginTCnUoj/WIvlklQ7mftaYmwcD7RqWsFvw1/
         P5jg==
X-Forwarded-Encrypted: i=1; AKwUvBz7ZHJqoFAeqqU6cD19GJMJDI4PoV3o8DyW1hJs1dFtlZHHEbqmIJtUkoWD5wuX55X9hfUywbHNQQSCZwVa@vger.kernel.org
X-Gm-Message-State: AFq9FYIh5czts/dwmjCZJ6PTE1RTeFaPiGZhmZKRpHU/ruFy61Nb3KYd
	va2226JgVAp+HNpyZtPNAOvXCkd6l78xKydT5nsTnCbVN5x1Xt7BI116TmOUu655i7cbynxQWPn
	ibGTnIi79f8c/SLfLqlsLOq8HTVn5/S3g9StuLdL/hf1qASZMIY588TeDLnKbHwZZX2ZW4T0u0p
	CxEWwUVXNOkHgodgJ7lZ4rIPq7tszkjUSr6byXRlFIumw=
X-Gm-Gg: AYBFou3P3VmKz2srxlpt21r/Y9bGtoClx/ry1o+2K9VN9bOYzchlGKQmcvMQhveEptB
	XOHXokoNkqXF+8VdN78+4m2qSBBQ3LwBLqrxipfnUDp5kFTA3NLxcJnRUPzeqQVJtrvd4F0aZp9
	9qzIAAH9YyOWbK0wxC284yfQEyQN/f1di9fXyRqcP7ew3I00DfE+A1NDDYCDb8j7NhMjpbATyeF
	bTgJgxLZD/9oyreXQyVmszu2vV9u7k24SPnNZf7UFuOgnUL78gnBy4ksjlekqTv8JmjbIym26A=
X-Received: by 2002:a05:6808:c1a6:b0:4ec:77df:f4b1 with SMTP id 5614622812f47-55be836805dmr1796780b6e.25.1792770370277;
        Fri, 23 Oct 2026 08:46:10 -0700 (PDT)
X-Received: by 2002:a05:6808:c1a6:b0:4ec:77df:f4b1 with SMTP id
 5614622812f47-55be836805dmr1796757b6e.25.1792770369786; Fri, 23 Oct 2026
 08:46:09 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:45:56 +0200
X-Gm-Features: AclHuK9Xw89HwOv4R7obEy-u5Yu2BoCinp6XB8olJrV-htK4CS6bpM5IbHuaQqk
Message-ID: <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the
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
X-Proofpoint-ORIG-GUID: q4nzjmHFA8x73W6vGEqrg4xR11wLAOXB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MSBTYWx0ZWRfX94UhtSe/bIQR
 CTyaX1baojq9DvcnoXa8jPUN0orQ3shCbQ69fGrmqIu21JJNKmliEHuoGoAW6h6aMile8sCIISz
 ZCAT4q3K63vZgTUp2Zxed64zvqoRlTk=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb8143 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=vVGVp6KvjHsgx-TnZO8A:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: q4nzjmHFA8x73W6vGEqrg4xR11wLAOXB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MSBTYWx0ZWRfX2m7b8cdnzxNf
 +oRSOG3m2dQZsMP3jj6dmf4nlExSS8ebjBEcVDk+OsXQmcoRVrsaATR40hnvfQzmGbUfTOUpnd8
 NqE9vh83wlt9rV648mHQxZexTqhT1Fi9DokMx0zRqRzP5fo67RpxjpNevozX4LaXGzOEflaJ0Mt
 7hTGCZ/1DQVZu96IxrvqpFwW45Ggh5JVi6c3SirciMHIjbC/LUYWw9i+UZDPSiV654cOnbCncLx
 9HJTNNWq8b69wY7NFQkUcLEaekHfGJEUZ0bjcsYySjQgbDjQiKi96WNiKEM7MdC1axmvugpjyO1
 RqZ47ho+Mc16b2EQ62bcPkxkVgwheaz9UaZ41MeoUMKPX1lp7wAGi8enzEjHWCAEGp6xcLLyzLp
 5BU5v3iVxAudTYjRt2NVu4FlxGxy4dHTF7ALlN3iL3fRZDlPl86wjAcICuOCkkufF7kA8A8bVdc
 3i0ndU3iRvHXoX/wUgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230061

On Fri, Oct 23, 2026 at 5:29=E2=80=AFPM Atanas Filipov
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

IMO, this function has become a bit messy. We should split the core
clock selection into a dedicated helper, as it is directly tied to the
pixel rate. The AXI clock scaling/selection should be handled
separately, potentially through the interconnect (ICC) framework (when
available).

Regards,
Loic

>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..87096095b1eb 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -982,15 +982,13 @@ static int vfe_set_clock_rates(struct vfe_device *v=
fe)
>
>                         camss_add_clock_margin(&min_rate);
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
> @@ -1041,6 +1039,7 @@ static int vfe_check_clock_rates(struct vfe_device =
*vfe)
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
>                         u64 min_rate =3D 0;
>                         unsigned long rate;
> +                       long max_rate;
>
>                         for (j =3D VFE_LINE_RDI0; j < vfe->res->line_num;=
 j++) {
>                                 u32 tmp;
> @@ -1063,6 +1062,13 @@ static int vfe_check_clock_rates(struct vfe_device=
 *vfe)
>
>                         camss_add_clock_margin(&min_rate);
>
> +                       /* A clock already at its highest rate cannot go =
higher */
> +                       max_rate =3D clk_round_rate(clock->clk, clock->fr=
eq[clock->nfreqs - 1]);
> +                       if (max_rate < 0)
> +                               return max_rate;
> +
> +                       min_rate =3D min_t(u64, min_rate, max_rate);
> +
>                         rate =3D clk_get_rate(clock->clk);
>                         if (rate < min_rate)
>                                 return -EBUSY;
> --
> 2.34.1
>
