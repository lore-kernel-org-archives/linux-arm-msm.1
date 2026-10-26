Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793025367;
	b=LYzFyDHglIUfPenFcmrqE0q0GKs7tpHUvTrnPYdFPtxou9HZnP6Pae474VQhT51uyyow
	 iuonjdSqqqds2VWROXqW4D21gu1sZ7otb0m+7uE3FH+h188qVcGg01vOIWLgd4nblUAm2
	 SQ6gmcxVXtAvRI9oma3wzfXyAFi6UWNavXQaelk80pHwb7yk0dTskQ4Eb1vfsFk0Mk3MQ
	 lua/pnTOpqC8brRZJLY5anF+lSnK7L098D+8+J8OPEyXbHir/TerDLdrlwg8t3ee6cOb7
	 lTHQpum2s0FZ529LNV7qOEdjhSP2kt2sAhrEHXbZI9OmoNkTH1c44K7e9/i74qhZWlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025367;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=;
	b=Fpjw3OicwoZL5nx+DHWWEqnTlOLDUq6AxJohIqxunBwmF1pxS80jP4RWThpjXYLPBcll
	 6Z0deLjBySRyAgAUauquXhWwA7jd+EJeb1eNKgUe0f96EKUQiSgx7zU/YFxRnrhrAIqUf
	 b8FyKcJkfEu0RkTn6vtkSCuWa3J+aSWzU9NJU37zgoGvTQzI3XjhiquIIb0plRnWasAd/
	 GQE0cmUwBjx8i5y8NDFRIdtiuMQVvkAAkhv6cngYh0JF5ixbOsEG5WajMQ1QdlsISJ+UG
	 sM07dUGXIQjsrD5CFLk8vXOtoZIivNq0K8Yq2Prq3t3nU5m9zivlnLDbff4LeKy+KEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EHGtbtwJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CkAXmMK/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5438606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5438606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EHGtbtwJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CkAXmMK/
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt93w3049885
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=; b=EHGtbtwJtHX656L0
	VCwtg6AIMWk2kc4VhCpy8BWuEiOX4eTg833nYFQPfNAS0e1Hm32ueIZH3vikGd/S
	W0DQPIwix96napKYa+NEzFqVbi0QvIRnGtHR0vIs1O8X3fDf2tDIsgmTPbruSBiT
	7OCgWwybDzHuZIfN3hNKCX9jp8miV7Wyz8tTAX2FrMp73u109AmcLa6QYtqZR6pz
	7njnIOiAJurQ5/eXVE/LXxqZi+DNqIRXWjfztmTEdhzGVBSbnKh/NZZgQrDDhZoV
	AwwhDjvfRY5+ktep083DpFvUAXFsnYomOZdC/jkAsou5Jq+B9sJ0UPAYcI0d7xSG
	zXRc1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddam15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:36:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso734493485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793025360; cv=none;
        d=google.com; s=arc-20260327;
        b=jaX7ttFL2f1bq8qb1Pv0IcEi+uQm8aYCXtWxVP5zl4DZ0pizMY5G7ZgRAwMm+b8P1z
         JuwDPrCVImHLKp5bRS/kh6URNHZL0ZHGIR5+6duAmF8RzKWFpFagssvF4BekmmRzp2Et
         5fu7Mo8CKT9cYXy+govfJn7Ue2dfVar0JZIccgGyt5nN6gXs4+9gFJatnE+e6/NA//0i
         rGSeaNfw1qSGyeT0ngB6Bx9Wk/3QNgrSx5NRWT6HzeWpHA1Hve78PKlYs98YJ6SwdlA9
         J52Z2Wn0jkJrdncnQWhocMoE5sJ6WVKp1KrqCZCqam/ciL/dAySUjwc06TuyLClPuF3E
         KtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=;
        fh=IDr34GU9oiuHTtnZy2gjKoHony30suUToILoArCid94=;
        b=kBPmIOEaf/h50PPrz3Od9AFRjnYFNLHSLmEo2eAmYCLU7wjjwI2R5EO4Iljj//Rd6r
         nfy6aZ7y2ft0MTKCYkxihcvgd5eY0VrVe7rcrU28ZJ3TjzoWe40P2WDU6WPq9P1nthh5
         +E6sCh78PPu+JlOeTaTvElsb/5Kury4TzFmZwB3+aGO3fZFGhSvgxDI4bCOCKi6l5gTy
         bDgCik7mGFRKBV8JBqbW7+Z5E0KAdn9616e6Kks+ZB6zJgsm+5Kp4zKMjpHrYLiDLnyU
         d+3FD+NmuppkF81dUQCCax7X4GuwLZRRrtPlsfT9HlAyz/K/JIccuAlaFZMjoVXvCcxt
         HlBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793025360; x=1793630160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=;
        b=CkAXmMK/gDoEX2QkKcjbi86v9b25SoBtQ+PnErD6dSQ1iFKJNypYKQa/uU1hgPYmu3
         iFVZ9CgVpzGd6a6+Vh5x+cCJBGnVaNXZc7EmCykRznOMZf4+97zU4jlCplAAos54BDD/
         JmUBN0t7C0VLUqdV+vYdMg2A/2oxdmO4WScc8Vpws3wzUw9+SWPrHou542u6cLKKnOwf
         hwtUd3hFcQKa787D2cEfzmOee7cjxs2BjoFP+eW3SaAq7eQMfCiYtyIHVMn27SCad53/
         hsgRndS30VYXm26qtRO56dGJbL25fXn8CvrlHij5mY+S3XOLhtDQnHAkDdie8Rb7xRqm
         l5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025360; x=1793630160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+JRRDApvXRAeSSQCjaG1QiBvyJih1Y3MB4LV83KBHg=;
        b=j8gYLR/0DZ8gDXm3ivgTxotytaIRC06XbaPgQtXkZjiJ5QJfNt+ctOkl9ZqSf1YLE1
         7h90lbblLx9929+8eLteQ0Lp/21D2Pg9yzuw76sPCkDUSHyuxUU5aFLWjhVGyFJnkTmh
         8KiPF2hTQC3TomxmKr/cpNId1JOCZgvYMOYViRVHzuE0JlxNOgtKoH/Z9GK+/BWSqlEk
         Bzlz1VuJDKQnUKJ8OyIDgaUNCIPNlM7Sda1UvRPlb3KgX7hNkAcnFtCJMX/U0A7YTI7X
         8u3uzm8jtvyHyMovR2j8AEszx3lbhS2v4aTqgBFwgmfPeNDtv2VG0+eFDBC4Hp46I3R8
         tnEw==
X-Forwarded-Encrypted: i=1; AKwUvByOfkExEquYCulBrLlXtJQH9E9qfr5FV0k30h9opWAHSgPF0G++8hoqyT6mSPJpzJPYTyVHXUAvXapKjhLz@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/PTiBhMATsEDqGUMf4WVGEjqBi5ixRNSCsmjTglWQOwZKOYaD
	/dQgd+CpRUCs+fO6vzj+EOpDAJm9TThwoo4PAiQXQcu8yA3Xe1L234G0cplP7pT61/cig0svGmh
	NynWzlfGX/DwFyqwf2TXiyc0pakH98yvzae60ILebQB+DdsqeRh7bzyglJMwuyWKFxld7Vyv020
	spjZhSkhLxXK8dRCQZtKC20lc+Lhvm80apOXC4bNKDA5M=
X-Gm-Gg: AYBFou1nOYOhT7algVaTomwzg8kWA2TegtYrr5vUZRwNvozlTR+YGpgj5wa8KrsKO3u
	kSsmoGsyhXEKiv4T2XB0Sc+70NzK5Xyi4ExLB6Kmo+wl0zZGe1KhXNL6CQL7JVfyOAIeLrkfIJP
	dZwDs4bg7JK/589EKuQQGPmqKajQC57tZ/6yoqDYYtdxeuWVt/uKgw/vQ3Hx343xg8CKH7+CgBa
	JbHv1xFcq7xwDbNnCFtPBI/t8QyVc/nnwAfqidcYy8lgfJXWmZuGNZe6v13/tnOvuF+8lTz/soI
X-Received: by 2002:a05:620a:40cb:b0:93e:c12c:f11b with SMTP id af79cd13be357-940ef94ce57mr983804785a.71.1793025359824;
        Mon, 26 Oct 2026 07:35:59 -0700 (PDT)
X-Received: by 2002:a05:620a:40cb:b0:93e:c12c:f11b with SMTP id
 af79cd13be357-940ef94ce57mr983798485a.71.1793025359283; Mon, 26 Oct 2026
 07:35:59 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com> <20261026133726.3249235-5-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261026133726.3249235-5-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:35:48 +0100
X-Gm-Features: AclHuK-WgnrBpFbnFE8ORrtoTXmqjFg3GlSY6-dUL4UNW227jGN0ErEq6Mww1OE
Message-ID: <CAFEp6-29k2AoJq1+Rv8a3GE8Da1sZ4E9-RUd4ez-EwOajx0RTA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] media: qcom: camss: share VFE clock sources by the
 highest rate
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: MSAobX03Nz3LDR-LW1IERUgJaberw599
X-Proofpoint-GUID: MSAobX03Nz3LDR-LW1IERUgJaberw599
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX75oRq/mct2WC
 1nIv5k9+DWiUYCiGsgLORKrCi8gH4dx0QxRW4IjTqrBVLX9h/RQunJIVqy+BlEZxL/7VNz78yZK
 SliffLRc4GJKUYQ9zgXV9YHUd4xEmMoOkKu764tjgeT/CJ4wK8+J3aAYn3FzijHx94TikYFGWUp
 qMwsnrtuc0zk7Hy77YqSt0obfkmMam42FB2bnK6dOoDmfwT0Gm0nzsLAGSDPc9gAIY7tcCFGtBY
 yH7XnyvR0eQrW1fPmg1X+e8/JKEHkrIa51vI7goBwmM7rqxZ1pPEr/8HjxiqYBUioNah991U/YK
 As8HSSawAF25/A/JD42ptdyJcaC+7vz1ZO79/AQbGSYAGtqx70sFnku8lIiX1UBB+64k8L0kNiX
 /LHAuEviInTCxobNKaDSPp94X8DX3g7AyyYfkfKtpU0z9w3Tetx5cos39Diz6rMogpW6Ul6zQvi
 JmpUofLiSoQh9fSUwTQ==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf6550 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=cFAwxtyTOyGjYM3jHOcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OCBTYWx0ZWRfX1G+whbm4dkCK
 oDdGNd5YIrHvR6t1Dix0kMWq/R98oW+30KOKv8FzqQaLLif4VDmUShGAmsihhvuEGecV6SumwZf
 OAsQmDDosxhF5sygVYOn2C9xVCEDx2c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260058

On Mon, Oct 26, 2026 at 2:37=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> Clocks of different VFEs can be fed by one clock source, and each VFE
> sets such a source to the rate it needs. A VFE started later at a lower
> rate then lowers the source under a VFE that is still running.
>
> For example, on SM8250 the two VFE Lite share one core clock source,
> which the VFE sets to 400 or 480 MHz from the pixel rate. With VFE Lite
> 0 streaming the CSID test pattern at 480 MHz, starting an imx577 stream
> on VFE Lite 1 sets the shared source to 400 MHz under the running VFE
> Lite 0.
>
> Request the VFE clock rates as minimums with clk_set_rate_range(), so
> that a shared clock runs at the highest minimum of its running VFEs.
> On power off the VFE drops its minimum and sets the clock to its lowest
> listed rate within the remaining minimums.
>
> Rate ranges are enabled through the vfe_clock_ranges resource flag, so
> far only on SM8250.

Why? I think it would make sense to use it unconditionally.

>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 45 +++++++++++++++++--
>  drivers/media/platform/qcom/camss/camss.c     |  1 +
>  drivers/media/platform/qcom/camss/camss.h     |  1 +
>  3 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 359b5942df89..30504e614e4b 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1016,7 +1016,10 @@ static int vfe_set_clock_rates(struct vfe_device *=
vfe)
>                                 return -EINVAL;
>                         }
>
> -                       ret =3D clk_set_rate(clock->clk, rate);
> +                       if (vfe->camss->res->vfe_clock_ranges)
> +                               ret =3D clk_set_rate_range(clock->clk, cl=
ock->freq[j], ULONG_MAX);
> +                       else
> +                               ret =3D clk_set_rate(clock->clk, rate);
>                         if (ret < 0) {
>                                 dev_err(dev, "clk set rate failed: %d\n",=
 ret);
>                                 return ret;
> @@ -1060,6 +1063,37 @@ static int vfe_check_clock_rates(struct vfe_device=
 *vfe)
>         return 0;
>  }
>
> +/*
> + * vfe_release_clock_rates - Release the minimum clock rates of VFE modu=
le
> + * @vfe: VFE device
> + *
> + * Drop the minimum rate requested by the VFE from each of its clocks an=
d set
> + * the clock to its lowest level, or to the highest minimum rate still
> + * requested by the other users of the clock.
> + */
> +static void vfe_release_clock_rates(struct vfe_device *vfe)
> +{
> +       int i;
> +
> +       if (!vfe->camss->res->vfe_clock_ranges)
> +               return;
> +
> +       for (i =3D 0; i < vfe->nclocks; i++) {
> +               struct camss_clock *clock =3D &vfe->clock[i];
> +               long rate;
> +
> +               if (!vfe_match_clock_names(vfe, clock) || !vfe_check_cloc=
k_levels(clock))
> +                       continue;
> +
> +               clk_drop_range(clock->clk);
> +
> +               /* Round first, so that the rate respects the other users=
' ranges */
> +               rate =3D clk_round_rate(clock->clk, clock->freq[0]);
> +               if (rate > 0)
> +                       clk_set_rate(clock->clk, rate);
> +       }
> +}
> +
>  /*
>   * vfe_get - Power up and reset VFE module
>   * @vfe: VFE Device
> @@ -1083,12 +1117,12 @@ int vfe_get(struct vfe_device *vfe)
>
>                 ret =3D vfe_set_clock_rates(vfe);
>                 if (ret < 0)
> -                       goto error_pm_runtime_get;
> +                       goto error_release_rates;
>
>                 ret =3D camss_enable_clocks(vfe->nclocks, vfe->clock,
>                                           vfe->camss->dev);
>                 if (ret < 0)
> -                       goto error_pm_runtime_get;
> +                       goto error_release_rates;
>
>                 ret =3D vfe_reset(vfe);
>                 if (ret < 0)
> @@ -1113,7 +1147,9 @@ int vfe_get(struct vfe_device *vfe)
>  error_reset:
>         camss_disable_clocks(vfe->nclocks, vfe->clock);
>
> -error_pm_runtime_get:
> +error_release_rates:
> +       vfe_release_clock_rates(vfe);
> +
>         pm_runtime_put_sync(vfe->camss->dev);
>  error_domain_off:
>         vfe->res->hw_ops->pm_domain_off(vfe);
> @@ -1141,6 +1177,7 @@ void vfe_put(struct vfe_device *vfe)
>                         vfe->res->hw_ops->vfe_halt(vfe);
>                 }
>                 camss_disable_clocks(vfe->nclocks, vfe->clock);
> +               vfe_release_clock_rates(vfe);
>                 pm_runtime_put_sync(vfe->camss->dev);
>                 vfe->res->hw_ops->pm_domain_off(vfe);
>         }
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 7fe12049b78a..80eab898611d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5736,6 +5736,7 @@ static const struct camss_resources sm8250_resource=
s =3D {
>         .csiphy_num =3D ARRAY_SIZE(csiphy_res_8250),
>         .csid_num =3D ARRAY_SIZE(csid_res_8250),
>         .vfe_num =3D ARRAY_SIZE(vfe_res_8250),
> +       .vfe_clock_ranges =3D true,
>  };
>
>  static const struct camss_resources sc8280xp_resources =3D {
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 7dc2fd9f03e0..bffff5b6bfbe 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -120,6 +120,7 @@ struct camss_resources {
>         const unsigned int tpg_num;
>         const unsigned int csid_num;
>         const unsigned int vfe_num;
> +       const bool vfe_clock_ranges;
>  };
>
>  struct camss {
> --
> 2.34.1
>
