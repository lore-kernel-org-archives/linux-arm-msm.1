Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792769868;
	b=kuF6+JSi9g3BIq5rsDRiYKrz0Hm2hDu8rDxu/Hn4Pp/W8E/nPXd5B5fuGCusFFwN3py9
	 jnfojIgzZPeDwm4+hHg2iX6GLEsxzuKKZMzq4sapPE6p4tfFNvQftr+9+tdVuST9HLQaD
	 sy98z3ZIwWK4XrCO6iCwuULJlsm8Dp9mY70Hq6m69CCnR7j5yDr/OBpvaEUJMrQdWns8j
	 /xHGCfkBl11Vi2ae5lM7FFS5ymlXLMkBa6UsOr08dQ9VryO6EwPQN5XFm3IcJm3+/Nf13
	 7hzjZeM2TS+fpam2ud8hQ6FvLJjlKrlU9dnQRWGBToujAw0LiGYB0QA8pJpj1kBssUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=;
	b=nbIruoQy1AkW5VT0VxVkZ6XeqRDgwNA1jzq1Zhvqc/wFANNOvemYXH0FAWU89NzF0lhc
	 BSA6bEpgOyhypI3GcfbvC3hy7K+UVFHD0WuDWotvoczPJi3vdNcTwf78XssmLatcRVP6O
	 Wlr6Sam0c3bSQmNbU/setS1aQbm5Fnehq9ExUK3nbPslpd4VhN1+ZsJ4gGr8ci5IZUD2C
	 puFcltPQAz3mQ7Ce4LVYh26jojBgvJJs92gA1cWLAOwj1yaAwDVeDN34GMEkkY0gSv+jM
	 eawf8fA6nn/VXIbCnKRaooq1mnaibUf3sOgDIys2bIUKHsU+RJBzTg5NTAN17o2p5jQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oscOz2za;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P34KoyEp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CAD606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48CAD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oscOz2za;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P34KoyEp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6AvB2974538
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=; b=oscOz2zakSq427/H
	WOVKkqX88uNUFLv9cbB/hvad0/uIStlwDWUeHqEuDg5HekRLKL4ql8nNTfKhlTSa
	fUoR/oyzzbNvx/LNiuX9oFduwnYjt1Zqfr4wOmQH3M6C5QhANs2EWtv5mJV/pHP9
	OzXoGVtjbzanmY410ZBFvhqeOoRjU6eqAITYZVjTyLu1pClzj3WAq0QEreF2tFM6
	sq/wZYYxOFOPo6XQ9DxCetoXdOXZ4DfV1qCjXVku+jG6WoY6f2NVm0vkqfavYDjC
	919P3qvUJFbSCSduomLjh7oW0PJFX8U/Zsz5pv05RIWbvEykpfGq7fDUEDnryxlm
	nTnTfg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw4u4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:37:46 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b26d8d2498so1405596b6e.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792769865; cv=none;
        d=google.com; s=arc-20260327;
        b=A1Wi5TsJT3s0inOTSv1jhF/z7zcIhVWEwzYs8exiwA03nUyi6XMmjrZEQHkXXXA5uX
         5d8cMUS6xVFuvHsXp0dPeM82CN0AwmuzzAvYbjVkBVr/Es8zkk6pMOucY3P/Fttd+Fsx
         ywQHPLkP/+dpivf+HJeetqsXDs+TgW6/hq+vgEQD0Woj7wHUlmNbzDfy3BMTfZnt+yy0
         Yk+pAIaTXo+pW0FOCHhe7GZ7xwdqeQetyWRV6G9q9/OaMsZrtG4t9xkT2haXJ9DCvCeb
         +Ql/86OeP51nWBfg8tzriAuGdb6EKX2eyLz++ChHzY7h+fAieQBzhSy0Ek2rO0v5pa/k
         29iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=;
        fh=Y47L1X6K4Rq5d97e++GNEXZx/gPPjGoRJ1rYb3qhLOg=;
        b=s8PMN8IwVrtYgHWPY0QtmsidEjPWgHcPrScXofu/bI5zMgw80yNzpGjh39lct80eZQ
         hNhJH8gAQKT5nIxkM5P1gZd2/SiEvKVwg4kQONyaT2TWqJM41nD9jGaYal1w1WSawWIB
         Xhkmx/weiBTw2H4XJMMSwQesI0QFk9A2GQluvVxS4XGxl/F2AIL6PireS/BTpyA8XcRW
         vkxNxLScwHy3NEic4/tcGj8RXUlM6OGa1FBjSvhxDdCMKsFe91OFkkkJr6vJ0E/SIZTs
         oq5xu5lfaA8I665VMxrMS/Yy8ND/uYvWUuhH+cEftku8b7SuNpCNSoZrZqzwgVyhpCOu
         dBJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769865; x=1793374665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=;
        b=P34KoyEpcj8qi9nCPpR1VOgOsMcNeP2Bx44QoJERS6Ve31jTerLtTFn9P8AsH818Hk
         AGCHH2twc30JM3uEHK1mspQYdUD6UE3fQpVJZhTCetEd3ySC+/SmLwhbF0lScXQ1y3Yk
         UODEuWVSQpaCNRqsW1xJHL2tGIe6/WDtuQ5HHEDXFSxrjzV/mB00SeXbFolUXQ6Fn7cf
         1iuA/HdsqfQsV/kZThLBNYkT8GsMU9RY6mYzb2OFX8b+J0q0DmDJFJosm5GMPEcjKjUc
         wve1i/qT/AvLu+EJzJisFnxyQpb3oYrTjxfLAuse/izF5B7SndxbXCG9L+LK50N2rSa2
         3uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769865; x=1793374665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=;
        b=sgXuKgTdkEkWp9IDQ9S1MDlgf4OHd051BxSNaEPvu6K1ANi1CUGV/MpH6L8hfxTfWs
         98+wLICZ4uIIbW7xG5SJLetU95RnGLTCmA8BLZSpPtrTsFU5lEPjqx4h4vWiQdogGB6b
         1zjw7X7uP7HCs5AUY6tMKeS8dEBBKYasKIDQZ/AIrS2IaUj/hUkurRtADINrqHmFVCdo
         OmKhczxma2/siwKIxdqInveQ85/2Zw4AAcGwW1wsU5J3zN1ceQ6yd211IcEIceqts/+K
         xJLKcjzyMOKHKWS3M0Uk2JVnqFZ81R0VK2dOtnzwcttcN6RfcG1XiPNIGehLlQ2z/dCf
         TNVg==
X-Forwarded-Encrypted: i=1; AKwUvBwmjFBI5SrrrN7zdAmA3NUUmJg3LHI9HogL5c4vIrhYrPBgmsuiZVpcD2UrmMsJXOkS+1mrI5UHF1Rh6syK@vger.kernel.org
X-Gm-Message-State: AFq9FYJTo5mreB9ZI81TArarcylA7NfNKMR/YGeLuInksHDU1Uahl5Ob
	eUd3ww7ZL4xlELMOlPSS1BcjMkLxOjbhIUiO3fIYu35hvGQngkvdxev5qw7UCnKp77QeSf1Rc+W
	lxz1NOx0M8mpHQBIyw7vElsQBn0WKV4E2pXBEETHF+f+DfiBMQ3sIm9RpFXwGoTA+cyGRj4FmHO
	2nhQyxiwoJ8h7yvRftbJXxohDRPhWls8v4DTvP6Z4KNmc=
X-Gm-Gg: AYBFou1Pq3HMs9Piun/mLFC/QsD9FU8p+I7Rp/RRfhRPaR2fTnXT7Q3to0ojKun5fJ/
	BbQCPjdlVnjUn1GK1GbBPASdp+eZBGVNy58+Mw+lMfvP5lEhqrP8KsJjHlkn88l+Uj6bP5tE2rX
	TClPnZzs6wxhx/lUzSbWuonTiyDa3xk71oGjh0hNCdzzMsyFuNvxyP/sPoU7RAnUv8tDJX6X+T9
	aMuR0IDUe2/hQbqc3d3jio2Wgb3uXxg1M0Vgp/Ms9iYft5/aQGuWutybyQ3sEszGaAHESOL9sw=
X-Received: by 2002:a05:6808:470c:b0:4f8:4a95:9969 with SMTP id 5614622812f47-55be85f894bmr1777808b6e.15.1792769865314;
        Fri, 23 Oct 2026 08:37:45 -0700 (PDT)
X-Received: by 2002:a05:6808:470c:b0:4f8:4a95:9969 with SMTP id
 5614622812f47-55be85f894bmr1777788b6e.15.1792769864900; Fri, 23 Oct 2026
 08:37:44 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:37:33 +0200
X-Gm-Features: AclHuK98d0P5yH7QJpyoncKDu7si33RmQoO6a8dZ5w8x9_6qeviYUDBD5TuqCZo
Message-ID: <CAFEp6-2rPeLXwo2uRDm+xTW_MRMcwM1BsbE0hLU9+S_kGdgOxA@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: qcom: camss: sm8250: do not set VFE core clock
 rates from CSID
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: hH8Z5A__N8emuwDyseYn6_4GgxTlWMT9
X-Proofpoint-ORIG-GUID: hH8Z5A__N8emuwDyseYn6_4GgxTlWMT9
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb7f4a cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=u2ZE8GkQQ5s483KH7DcA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MSBTYWx0ZWRfXwEWfob3XCv1V
 kvYjcywQozuZGEdxnfefXPGzakxMynsuCbRWMIrW4ozHPQhyYiHS/XqJICCdpop6UQrR8H0fR4N
 r106gxIlVGkdsM5vDu5ez1VSwEgqYIY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MSBTYWx0ZWRfX7V9ISxvb661n
 M79wsA19irzDK4+Hm/kkcPPDh6rKE4cGQpglWV1oYMIqaXBWjOpQsaqLs+nH+HeaWgvZ9QW1YHX
 hOhC552UsSuYA7fTvHvXEJn+brizXpe+7fUUXwQUqAFTxpiGQOBbQ64ltlF1LQDgSVBrMDTQfn6
 9E59ZjKWjffS1jw2Dr2zs/F6/DdeQV7HPAzryboCVGfhcsivRWCqNJS0HXBYq6eNbaD0brcKsbQ
 di0W6zIliZxCBnUDLg/gPMBJiksQ+7Y5ptWuBeG0/6VfKIu2qhaeGVwu4q5A7eBjDxCh45YuJA3
 z2S18QxyrnbtT6DGO6pDD10de9tcZiIGlNADW1C0sjePs1BV+fMWZcN4CJq7zoM8LrxFOu1GALO
 2FrFmU8Oik/123Pg8Q2rU3lySUY5147CMRezyuOxd403PVi7jgMxwiGUPCYjNs6DtMWqYagFncV
 x4sLs9laXf8ZmYwcjTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230061

On Fri, Oct 23, 2026 at 5:29=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The SM8250 CSID resources list clock levels for the VFE core clocks and
> for the shared VFE Lite core clock. CSID power on runs after the VFE is
> powered on and sets these clocks to their lowest level, overriding the
> rate selected by the VFE from the pixel rate and lowering the shared
> VFE Lite clock under a running VFE Lite.
>
> The VFE core clocks are set by the VFE. Drop their levels from the CSID
> resources so that CSID only enables them.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a..7fe12049b78a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2052,7 +2052,7 @@ static const struct camss_subdev_resources csid_res=
_8250[] =3D {
>                 .clock =3D { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_a=
reg", "vfe0_ahb" },
>                 .clock_rate =3D { { 400000000 },
>                                 { 400000000 },
> -                               { 350000000, 475000000, 576000000, 720000=
000 },
> +                               { 0 },
>                                 { 100000000, 200000000, 300000000, 400000=
000 },
>                                 { 0 } },
>                 .reg =3D { "csid0" },
> @@ -2069,7 +2069,7 @@ static const struct camss_subdev_resources csid_res=
_8250[] =3D {
>                 .clock =3D { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_a=
reg", "vfe1_ahb" },
>                 .clock_rate =3D { { 400000000 },
>                                 { 400000000 },
> -                               { 350000000, 475000000, 576000000, 720000=
000 },
> +                               { 0 },
>                                 { 100000000, 200000000, 300000000, 400000=
000 },
>                                 { 0 } },
>                 .reg =3D { "csid1" },
> @@ -2086,7 +2086,7 @@ static const struct camss_subdev_resources csid_res=
_8250[] =3D {
>                 .clock =3D { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_li=
te",  "vfe_lite_ahb" },
>                 .clock_rate =3D { { 400000000 },
>                                 { 400000000 },
> -                               { 400000000, 480000000 },
> +                               { 0 },
>                                 { 0 } },
>                 .reg =3D { "csid2" },
>                 .interrupt =3D { "csid2" },
> @@ -2103,7 +2103,7 @@ static const struct camss_subdev_resources csid_res=
_8250[] =3D {
>                 .clock =3D { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_li=
te",  "vfe_lite_ahb" },
>                 .clock_rate =3D { { 400000000 },
>                                 { 400000000 },
> -                               { 400000000, 480000000 },
> +                               { 0 },
>                                 { 0 } },
>                 .reg =3D { "csid3" },
>                 .interrupt =3D { "csid3" },
> --
> 2.34.1
>
