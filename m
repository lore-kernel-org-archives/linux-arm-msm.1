Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795377879;
	b=Iz9e/CWeW+bJue7geWa8ZW0A0DtTMX9xC/Gx6+bZoiPra16RLADNYxUrRfO8MtcA93bT
	 KDaH30hjIX3SCyhSt3sG8qfDuIZ8Dk3hS9pRBWtpYktqhk5JRhi1c1FzkTw7fLMzLX5y3
	 hAXmlT3qzXIl6Vt9U4hTMC3hARQF+Nb7iCTjsqq6XnpuyREGj1UF8Pfkc6Wl5dLm3Fksh
	 qrprxAsJJf2b5IPWuMyvtJ3IW5cpLctUg/gGUlR9pC30zv7BMU738EbkPc8k6vRw+eKZF
	 Xbc9up6VwQN/doAQEO4EYHoCLdwCUlgCFPRlqD5dmXULeGYxhcoYQR10slgLiiq70gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=;
	b=TEOsDlrR4KQQkXwDQLSwlRy66kAEIEviG1/OfKLDwaEC+HzrWoKEqxXvDl7Vws+Wv7VN
	 UYqOpqsYr98XCHW1iKFFdCHVqt9cnEDxXt+UTbnlbO46gH048ZEE7/qZ/7BsnbB42XYPX
	 QLm3CogEjLr5UBoHAoS5pQ2kEQg26hwUPus2eIBgMYCD1BHyDXHUxKUBBk3PCA46IZyjc
	 x+cLxGPHgxYuiSGHtEIqofppyCvBZz5UVaVKy9hJOBReRHcf1zCpaWqu3nsg70eoeJwUM
	 R3TR07abmudlEEiAwUok/zk3IZ7zGm0Hyh2FYtms3egqpmmA29PTWUGVjsBwG4DNNvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cdiIEb00;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LB4lqMI4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F28606A31E
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 20:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F28606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cdiIEb00;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LB4lqMI4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVxVg3629927
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 20:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=; b=cdiIEb00v5kWagL6
	eUwVvRPDz7im7ZtvWbpO6np93uS+Tj6CgtuPzHT0uXaS9aAppi2+6C7VpSjbRThb
	viw0mCz5onFIhhm/NoCGQOqDOzbNh3ZyANUYz60/gvsdIRoJoDNvZW8qiMJMFjbk
	IK7y12qFmmrO5l/dMoVL62bM5Sw5CXS7gKWXwx5Kp+NRwgnCrdoB96sQIBR3ir5A
	jBVzUuTaPqAhdZ3rXAyJHc0ggNfLvEVIkDlU2dAewu59uPBxpBeNMlOuNvAsqMZf
	ylCpli4icCzd6I4npM/MFkoEIt8WRsqjtY9oxanAoMuW+24YPR291Q2H1oVUTCWA
	BCoUQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgc7mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 20:04:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so444785685a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 12:04:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377876; cv=none;
        d=google.com; s=arc-20260327;
        b=NooZxjvbSzAE/Tb3v+mZ6frwPxdQ5s7xW+39yHIDRZTVwXe0w12FV801fnY/1pf0rG
         lneg1dui1/vPWAr4MDdQP3s4H8C8w3O6EszXJENwbHYht1rcRJHcg5PGpDgxxZS8Vkye
         OvTk+Y9RYleALcKAEFANG4mRdqUj34Q+OH+13bWoIWFHKcNKs9PqIU8j8RX84o8lpdyo
         ajO60Wos4EoN9xL9t7vTeQj4b0TJQTNNpbMyADzpDe7i5KYh8JK4y8+SC1v8l4uSY+bU
         22pUuQNG9tq1yPVRfXG43yC2549HtTrT9WA4hoVLK069ihX6ANtyCEhuPSHtUH6t3XXp
         IYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=;
        fh=YJ4k8eSkHRLWzubMmWvCHahez6i0n93HoM4hDochKEU=;
        b=L9b31ZzfiyI/druDMApAbRg5JVpXyWwlsbtTQIPxZLnx8QHCRtoQJ0PR3INbxNx0Uu
         J33jpNsQWDWf8L3hIrib2h/xJd8GfZTzuUg/gTOaDJ269Mt8aeK8xWLNYumYTA/nf+CV
         k2EtzVfUdNFqRv0q7dEqcEb6OKDG5M0rAqCQ34YbkUpyLryq/humxXQFdfmNDZMjov5b
         OhYwP76uEqsMcwGWYLM+Ss0IcIzpq493GBo474aXraGTiY+svLULwJVpPgxgwA+h+z15
         Td1R4RqRajw9yXxjC4vDmdQNHhCU4J3uDyH6HF2g/icdu4p8qRacjifhwZlkz4zqo6N/
         DYyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795377876; x=1795982676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=;
        b=LB4lqMI4yntPsxt+YZJAe7MvQboR47G3/2H8Q5gTMXmlMKohkJIH/QzKS4DqKNoU3w
         h6InpvLoMTJxh7lrfvQus6zK0i+AFiY1cMSpmtK6WlpUa2Kt9twYVgmGPE+OEui6F7hO
         9D5O7E4Ov23pyiS0Jomv29FFxPP6RiqZVuszaDe8MpL5eR4fsEM8nF8kVrfplK155x1W
         MNqXorBxFIkrCGYjRAXWps2Xodh3WqfRZO0+/TDMYUwlxfO7rSjePOhIL93D/lnnn+wa
         ktIKpb2mr7Xj6lLsbXPPN/H7hfxHHGadW1+OCvcixdHZqHadnBsqhQQnO6jn01SBP1CL
         HAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377876; x=1795982676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=;
        b=kUJ7eaxdSSmQebV/lj4eqT6UtK0tR/5ywfSrKtREgVl0PUUpohr68DEDievll6KfTt
         03vLotXQyf+EufVT1lEgOQ1bGWSFKDpXErzf9R172cMP3b4diODLpBfFhh9m2ZMVlcRs
         KHrOqVUCwb537gosvmaXLvG3K5jEhAE2pX3N3mBDrnVt+WQzh1MuXQQ4ZVZL09zJMTPY
         656z5MiOgsmK0/tZbT1eYDVDRJYwaB5VuWnnun5HnSqR95GYm2HGy5d9Shtw08fMhMpt
         Kc5kdInYU/5AGud1SsdybP0niA9KEjul/0tppaWwkmwXiPwTkRTqEIqoNPvtfqnIj/j+
         bgBQ==
X-Forwarded-Encrypted: i=1; AL+hErEWaIQhq1k22HqE/zl7Nz8HjdzQGbBOXhx5zYeXiC4cOYrL/xekRWUyMdkOI9Ix+w0S77loO+IcZfIF6JVo@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cs9/8Eytd/qTqubMY6MXQzQjFBt6BwFGxEpb8tnhmWENavCj7
	1Tl/3L0UEAEHDdaPD7ggM95vcyG/GlxdJHh0EUloCTPHXGPXCZWTMHsbKJXi7RriFfFkPq5kmaW
	+MdygcJ+bbVoElPD593vc1VbB24aiqo0HF5j3Rk3WJo2tDj01EhOWGCseWD/ZQgTJ5B7c2uPmD8
	+TbnxhwBaJ8r6h8XGQ2b0Iir6vDxdEixHzmC0UEBGE3v4=
X-Gm-Gg: AZFdTZdcAX4DvSSgnz5NtN8ioadYt70dzUREiGlvbi8cipOT6bibRiU7kNwTXAoEabm
	l+nbMT5ed2OrB6B17HPfI8o2ONAqbWOSg/GEcSr+5Kr/4SYX1ZcSkK0ZxCWfgSwOcIdHR/CfriN
	DVjB+S9sVt/LtxnQiQQ8uBBnzoI08Xe6nl0HvhMweQ0YBu2ANZP53AfJQ3DbgEe1O6s9nZoUSNF
	cXgrwwuaQfQg1yp5acubfKy2Wb+V0v8qm7Vp//dknrKaC3O1k8M0cYxqPL0Bz+CmmGLLV7UtfON
X-Received: by 2002:a05:620a:17ab:b0:949:7f50:29d7 with SMTP id af79cd13be357-949ba9555cdmr1583914785a.25.1795377876425;
        Sun, 22 Nov 2026 12:04:36 -0800 (PST)
X-Received: by 2002:a05:620a:17ab:b0:949:7f50:29d7 with SMTP id
 af79cd13be357-949ba9555cdmr1583910685a.25.1795377875985; Sun, 22 Nov 2026
 12:04:35 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org> <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 21:04:25 +0100
X-Gm-Features: Aa3M54qUzr4tb0KxbdidEOr8hL9CXGm0SM5knxBXQMkR5xBalOtIALTCOaJIY4E
Message-ID: <CAFEp6-0p+m7gV=qk=UtD_E5haV2H=KJbmkXvH4P3_C9YhwJYFQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe: Eliminate ever expanding
 src_pad_code switch logic
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX2UF/Qh/tFbb5
 iDaPmc9GK76PVFTL+2XO9ibf2IyS409Qeo/PmhNyntkplfNAUuVtOv/qzXwFmYBEFqdeejDSEeZ
 Y8Jft7qBzlrWWeROpCMupt4TQMoZ+BaeukgnixAc5ZxNHAhHRRg6QvFcNCUof1dRUyBh09AbaPJ
 iPByYO7/jKb6XKaYYqphbC/gK2+YKzSTWXz4Wf7kMyHbDftje2IB2uaW476+Bfm+w78CCC+syLQ
 k9StBs9cvsydif4fE+KDaPkVpLoZFToW8QX+5Zl8h+XaeZWR3YDO1FAF8YcVB7iddknf23W0Obz
 AHpC3MdvrnqTuWCN3Ts+daCQEj7IdvlYIHQeOtOUKXXWvt2dy4vSY+4A1wKKg9eCU/H1RLTDi/w
 j+ofwSpuXI1Y510VFdqQye4o3MSqjUS2ApYT6FDb4a2t0T9ttNRgzoMqSsMPaA+QjRVAdboOJ11
 MtYoY0wwSvQNbc7Cfqw==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b034ad5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=z14PLRylv3i5yIR1d5AA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfXwL3pZucKSlDF
 hv0fatDM/xB+LZkGlHOdfQ7ZPIwwua+M5ATHPk21OARHOKBSc3oeIOEZtjA7uSaCEer7lpa0AoN
 7POo3g8qrnzndE7Xdo/IqH0jCeQqpjs=
X-Proofpoint-GUID: AEEKrolxEa97llw7chRUyxKchraPHLLo
X-Proofpoint-ORIG-GUID: AEEKrolxEa97llw7chRUyxKchraPHLLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220079

On Sun, Nov 22, 2026 at 3:11=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Every time we add a SoC the src_pad_code switch statement is expanded. Th=
is
> expansion has continued to the point where there are more SoCs listed for
> what used to be the exceptional state, than the reverse.
>
> Invert the logic. The exception to the rule is the old SoC set there's no
> purpose in expanding this switch continuously.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index f9bd2367671f6..10ad862ff5010 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -340,21 +340,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u=
32 sink_code,
>                         return sink_code;
>                 }
>                 break;
> -       case CAMSS_660:
> -       case CAMSS_2290:
> -       case CAMSS_6150:
> -       case CAMSS_6350:
> -       case CAMSS_7280:
> -       case CAMSS_8x96:
> -       case CAMSS_8250:
> -       case CAMSS_8280XP:
> -       case CAMSS_8300:
> -       case CAMSS_845:
> -       case CAMSS_8550:
> -       case CAMSS_8650:
> -       case CAMSS_8775P:
> -       case CAMSS_KAANAPALI:
> -       case CAMSS_X1E80100:
> +       default:
>                 switch (sink_code) {
>                 case MEDIA_BUS_FMT_YUYV8_1X16:
>                 {
> @@ -415,10 +401,6 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u=
32 sink_code,
>                         return sink_code;
>                 }
>                 break;
> -       default:
> -               WARN(1, "Unsupported HW version: %x\n",
> -                    vfe->camss->res->version);
> -               break;
>         }
>         return 0;
>  }
>
> --
> 2.56.0
>
