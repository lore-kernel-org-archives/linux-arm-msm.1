Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793006949;
	b=PZlXFsUSX9VmufFWAE1vufzpR7bqB6YFv4jRFx+9T2QFweQE4qEXvwIOjC9zgOKs8DqG
	 57Lf0l8YpV+qgg7dzStJL66+gZkrbHn5lErXFsl1er/iA+tEB2TqWyD2MldxA1TkNlfr4
	 ObdW6Xw4n5gxEQNrKexxykwMLbxK/pgj3rPCYCUEwDOpJKA6sJqjozzA054Ix5dm/hh/C
	 Q4NT9W/VPq2xAbdsvy3FD8jhIq8dW1YUAZ2M5p0BiIs5ZkOdc2ek+pDasl8lcnUaaVkFf
	 /UGFxSwruv8o6DPUeyOQXOt4EXqidXh5MQrcDQIM23CbVFeXkUF0kGFJjHFxWHS4v7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=;
	b=noJJD+dVHz7ZSaw+Cw83xnQ48adjB3a1bg8KUIS0x1P8FW3pq85mZRg+eLhVNyZWtG7t
	 I/c5ODlX4TzWg14dItl9PHTiBlTDFQ0O4gB77XDUxMmYscj6/qn0H92GMrQRGk+oddAE7
	 0SWwQj5DBZtrFnN6gkuisU3YbOiAkQuVkdnV+ZsdbEzMlJU4GMcWRLo048xj4Tk9s2VED
	 +4+YA84Cl4t8vXUc+4HP3bHEkOdrlvyvO9MF42M8t3Tk2Qr5/yh44wlAQUWfujom8U7o+
	 HrtMxIdjVojrzlFColfUmwZ9KpAbrGKTXdWrNUZvzdhMkTVlV5byvbvwNa7cYR3oEqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pp3hQZtO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JIT5cQOh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0580606A324
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0580606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pp3hQZtO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JIT5cQOh
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b4LE2806445
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=; b=Pp3hQZtOo5ZhG4VD
	Eb3Xb8eJwMvxCRPtMHEJpyXTnakxTLarKD+/+Z2Cb+wXYQFrJtfP4KVql1/ywfKL
	jLcoEsfzDgfZhD1OV/fnd+cpXae9vcUEgLQgPyTNnxVMZ7cNVYGFwal0RGh24QWY
	0AnA2YKyLbQhybhWWhSJ3EyNcrLOXpKd8a4NFVte1MPipqH+YfY1143XFtq07ZdG
	aJh4SFdIfy5kB6gAaSMYpGREuLDqQbF6phfALiVerB3Fiyyhww1Ke1rMK+SkJkYE
	joAluke0XrY8kN5yk2QP42xJbVqBOgnvuBn4FQejM2fIn03rpooN65uaTX32Kqe6
	I9J/EQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xns9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:29:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e49a1d3b1so345428485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793006947; cv=none;
        d=google.com; s=arc-20260327;
        b=nLGXMs4WhR4TelN3Y5LxOCS+Y1zo+0R7dQ5F9QcT21MzIoria2LLhyDjO6LdCnAolI
         ghPxalfkilmrPgvVkRnQtH5/zdz7djq5wKzz6MRcsUdb1OlSDgYQK5t6XMB4gB2pNzA6
         4TBPPvmEiMFJC3MM2ZJLGhzepNnpoxyruNbO++WLcStxrIjdM5/jR+g2OPwxb4nheKxj
         eNmRpxGLtO6ibFlhpXkX9kHx9UUgWmcuJOnA7Rs3makTnhOUzUe9ClQ2XykLXHrYu2gq
         5Dgbk+m5W5/c2wsBd53fx++xvCbiwtgDi9HODkjv16wL3II8j8E1rxkhBJnO7TCmD8Ph
         h+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=;
        fh=GvBmBe3tQA2/gTt/ECtN3JoApcnN7s/b8rNyflMYgyM=;
        b=p/hw4EaVc3OaERGv7mDDHNCKRWQ+7X+JBunUZFQbGgR8tcHMuh+ZHSeBHUXpZkXFHV
         35sIXuKrVmZrJTVlTc1Wq+R340/uTiCBRQCh+1nOePfuP8inIM/nKMTAGBSWi/fCCNod
         j3624FsO2oE1lqW8gigfz4rrP85cEvzDos8IIHc4QplEimKtJzHOxBCxX1pyDi+4Bhjy
         dz6sbfxIkcKz65Fxo9IiGdbg6GsV5il2ZTSOeAguhBGA46X7WIg1krBTaRID6ZOzKV/y
         0UGsaU3cRs6706bBJcziTO2F4O/J0/473Bw+F/38aOl5GfQ9JDipcAMWyOt4CHA8Be1G
         aAIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006947; x=1793611747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=;
        b=JIT5cQOhNkfyAyNeXnhv1F3WhTXEzH8KlnKTM/1VQmPtb+e9L/ymd2ijEUD8soK/86
         03j1VfyVDqMybJpFc+UDgQTg0/yDRimIfp33hH/8t7nUtZoyBVnhMY0cEQtUUp22nyqK
         aM9EGGVZRCbRdebp5OULMswJtv6E7rNf0uyxiYeDCTil6bYN9T/0e30lV0PfkpVT8qjA
         y/DQNlG45uKKc+gjmJjZrRhqfjSb+X2IBKuYVMgAd3jm6h+70QyE23d6hUe7XTOuD/cq
         uGWlIX/vVVSN5JKssiqLAIlwaDAilOl/d2AUz5o7ir54FCsJnCcjS/APgrM5ezfQqMhU
         xUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006947; x=1793611747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=;
        b=TIDIlWtvAOARD7e1PXXOrRGV+ZddFuGAPJe3ghxnQxZHmnqt40ARIvaYB8v7ZHVdT9
         GkpTQbldsBMlU4e3pGOVhhG9fVdAazRhN2PFvlDe26FK1ljlTrG1xXzqVwUUf+5RXdGg
         GAWGJMtDyfRgnxYqVLfywMKwx46KHD98xk8YjS1FzYJkqEIqVbJQK0i7A5zft6UStVM9
         gIX33PL05egEGeoMIPXE2ApaaiMQhW+lQdnfcrcQ5Wcf/lCuJVjJBpH8J/ah0wokiMU2
         Z5PPXZ5IXkIt23mNyzuLJP5oKHNiwOpAfGTCuP6JNzWnRuQTVLvO6JViLRzqAqyqs7GH
         z8ag==
X-Forwarded-Encrypted: i=1; AKwUvBwOyFVJYL8a3+3E00RXBMzRqYB0DfxIrt30NRSf6kedKGEdeHT0pfEuJ30kGsci+/yEUEiyBp2tLdKcQ4Az@vger.kernel.org
X-Gm-Message-State: AFq9FYIgex7TevMksNNZOAanufhke0vzmck+sI2raUmY6XdaKDxuJ8af
	GF5bhHOKs2g0oquD19sGrHa6ZnfADEPoN2mCU42W71L2UVwTgbh4Vtru9ZWWRqLyGxPeoyXGU8H
	bsmFj0EN4xa9hpI7kCExB8kEQi7KS/sum+uZ7Z8T5/6G19v+6sG7BP4+I55XKZ6g/h6FLtWwhNp
	K8XT4Mei0Tr36/bli5z1MepzNcAv1sFBB8khV1a8gbkjg=
X-Gm-Gg: AYBFou2S5EW/LL63qQld7oW9c5VJA1wgT17PWSBXFvIPFqelkTM2OUYo8N7gC/aR6im
	nDXvWc+ZQ2g1OACXnjCaMZBVcbzPQCjr5LclE99cXvjQ9FVTedwLlZZH2FVRWoUnqKgEwWmU54s
	B5uxXJZTh72KdVFxlAcRcobatfmv2dDIbxzS0MHPvQ9AL5TQ6br12r5D2t/lK0bIQCS1Y/1rVcy
	nFlFtEC9hb/pWK5I+f3IpuP+0MvgVEXAsnir40rUFwodiCq0nUV1WzPV+M3D3bZOUXEQF71WnGa
X-Received: by 2002:a05:620a:6314:10b0:940:f2d9:5f43 with SMTP id af79cd13be357-940f2d96196mr581359285a.6.1793006946743;
        Mon, 26 Oct 2026 02:29:06 -0700 (PDT)
X-Received: by 2002:a05:620a:6314:10b0:940:f2d9:5f43 with SMTP id
 af79cd13be357-940f2d96196mr581357485a.6.1793006946328; Mon, 26 Oct 2026
 02:29:06 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:28:55 +0100
X-Gm-Features: AclHuK-H3z-Kwbr7ajvKaP987banPeBc1O1PjrjsKicOkU5pIukO3QkXQMIr7Fo
Message-ID: <CAFEp6-0tby5B7hUTEyvkWVnNsOLXnEomTDt4d6xgGtF_3X2hsQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: qcom: camss: clamp VFE clock rates to the
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
X-Proofpoint-GUID: aFF1xB5bufNS8Dqsb61mTC4tkCSl4_Y-
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adf1d63 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=vVGVp6KvjHsgx-TnZO8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX7+5jqPtlM/TV
 aIX05TcYQ6QTg1CSyWzmJKfjDsQYRCoOBgRRfcxP6oAAqwRxK4MeEhn2nrgeNrx+qv7Eck6xz+X
 MY9Xi41Bi6EGB2PcA1syDwHAnEQzmgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX5zZp2ucjREAi
 SA8TD2z+lrwTlGEha4R9FD0Bg1d1QOdVODdzTPyy5ofLjk3S11Hlp53gD3tD+qqe5ylwb3Oc03I
 tXrL64ghe3sfexAsEQp9/1dpbcPzLECPCgcFyI+7hpmjDCW6pKdT6RcYpcQQc9wad1ozU7yPSu/
 +IJSRe1rH82T5AusH165Gv74bWy94VWJCMuHgkeZoSK69AS5e40Wk/zd9ew69Az6Ae6VnmMyMU7
 HWFZ/KBms3bYAFb/cCYc7Jul9zbIykEMZdj7qQn+fC/TaSLjPsqWA/jW3T7y9lKBT/8gbewy3gn
 lq7TWopNk0RcKO7F5LxbJoC7e7ysiTknWCSYDUtqTdQ2ZJWs4RsAynbEnjFseTizUwMobdIsNG/
 3r3aPVelzPyM0mR0xaeGcnGLb2Zlig2S8dvaXN5EI4o1Z7y9zL474T42s8NYl6Ui5ceNOLZJozN
 XOj+NZaXWLwxbgXCjxQ==
X-Proofpoint-ORIG-GUID: aFF1xB5bufNS8Dqsb61mTC4tkCSl4_Y-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260037

On Sat, Oct 24, 2026 at 11:40=E2=80=AFAM Atanas Filipov
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
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
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

But are we still comparing the pixel rate against potentially
non-pixel clocks here, such as AXI?

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
