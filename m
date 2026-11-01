Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793559577;
	b=u3yMuhhzpzvxwqYCYnjdnbxd3em/j0JxGxOB59byvXh6pMJPPsisqcPPI3QRMsK66c3E
	 a+3Miy+6X8G3Hr3+qiXOVQuvWwdS+7AEZRRj40ymzy88V40IW7rPzq3a53SwFYMO078Gt
	 LE3bcNzqAkJrdBI0kImM43HXOPZ3ofRvxDD+qm/uystVSZLpZNbGgXtDVKh+yeOFiMSsr
	 r2niISzNXkQ2uAv1nUJtF5OMGeVE2GKHcp4beqjDJQrcnEQ4QQlq3CX996+0kQ8EIMED5
	 SU3alUTSxFuJjfhdmyYfq5LXKIut7Fdn0jnXjAKM9DZWIXlGLES5tpIMjd3MGK2umXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8kTeAGzekm/MJUppeDHNBzSirJscu8UDoZqPjNsLkRE=;
	b=km+1B4PTp5yXXcHfSdi/35l7h7Lp1+U6DKyhwTUWVfSWzyu89q1nI3zMjudH/4UVQ2C/
	 mkqnz03JMQQJfhFgDG4LoLz7baEgFAJL6RV/EKO/aYqcdqp6TiUHDTdKVtrNZ2HcJ/xz1
	 3PPiha6ENCYQqAr1BChwbJ9wUI++YKltfd9qnsG2cevWfDdCWwipfajuEX2SYIcn84VPA
	 QQU3jpXgPMzsTpy7choik8vZoQ8oo0n7HFcPg6S7JsynOvPOkkJwNFQiKpNt8H+Ab3GN0
	 /t3Ue4Hk/vuAaYXPAombivuo9vcyT6dLzrbdF8oGAqAfXA0m9HVLd3vv+LP3jCe1PCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SAmfCABj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SeKfTpZm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C284A606A325
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 18:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C284A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SAmfCABj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SeKfTpZm
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQQ5k1413781
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 18:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8kTeAGzekm/MJUppeDHNBzSirJscu8UDoZqPjNsLkRE=; b=SAmfCABjNQFoKphV
	DZwIecNBfi8PYDTr3vAhvoLFxDFDTtK47A4iihTcrhvOU6RUlIb75niU40uP4kKL
	SewEiMx8hh738FzyxDQwMVK9APwWL+sF9oIzi7Ahnq5qZy7Da4roq7XvouEn/Ai2
	EWxVEfOoeWZP8uWUIrNvMGtcjSVS6P4tuwO4wMSLY5bnS8rhg7E6Ylgx98IK1nvm
	zK639rkoUhB3I2K1F4r+PDX18499zzInxgGH+/RQxNzvIrF6TvwaKF+Mw958ltcp
	SXYwROjk2AFhTvuj3kQcM/Z55LwVA8e/80B6HFJMdSWa2M76OgnQuTU+8QUdIUXO
	Dnt4lQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2v173-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 18:59:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b8c60c550so66344676d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 10:59:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793559575; cv=none;
        d=google.com; s=arc-20260327;
        b=W7BWoehiVAqzBljItT0yjOi7/ID7+EiPO/QtJ/ARCnf1YPnDhvhjOPhdZOGt3tvyQm
         6TaLcB9DxvnsyqDrVJlYPEPMedpOZuNcJvFdEH4XO3HJuAOV/FGRUItg9nONZLeLgvEs
         hGfT2I6gV35rPkRUwBybYjLKvix5TTUQ8Gy0Z6edd1VSmSRQBcu0/vV2N796KMnN95al
         Nl58RYjD+Z2KcaHmPpdkKDj2RfiE0WDjAOZFH/x+D9C/A1KLZ/G5Rsv8fdcTQikNyQv5
         NohMJhVWhpaxaV1a1XGuYa0x44WqEC6OIkegtitgtkNn8ks8I2ZGvvw6Z6AX/BPahK60
         LhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8kTeAGzekm/MJUppeDHNBzSirJscu8UDoZqPjNsLkRE=;
        fh=aN+cMBpaiyGcjKu+8P8WwHeK95sIMrq4MLOXJl4X95I=;
        b=IAHpcecHAmVQSZjbYoCJMZLOkb/G+JatgT1kL6kDjYdaOSp/erUXDidnMCFV05DAdn
         TzCNZUsmTWweCP1OrH1PGMMJ/2bBQORx8qqzvQ7vRizrQgydJLxspEDMKcMd/rSgtIpq
         AF9WwEibaNGDbyZMKeyKs61lFG+nM8PoUvLFTfU8YCSyeEezPZXD1N6kj5rMzqe0UbFQ
         XLqecEv6ABKoiTNA0SLLdQPJ/hWkI4sTOjhbtjCOPvJ0y9+DzwBGiRjhQwh7k7sK84KB
         C9zt9W+Prvte3jZPsUnjQc2VfRLt8fHL+h4IbzD99MTT59uPMcp1xtgQ4cBk99Up11Hq
         3Mpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793559575; x=1794164375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8kTeAGzekm/MJUppeDHNBzSirJscu8UDoZqPjNsLkRE=;
        b=SeKfTpZmnD1EUY9d45HnJXozHdeS3MHwgJVNqo0+mfMtphR9H3dS5xC7G2yToLfrkk
         q6S49GXAvxmifL8AwYe5OM0yrnqErhZ5azVeVK3oMiUk2Vcoy5/HqpysLxbgGa4+Zb/r
         T4Fh52To1zPG0koVdcoIn9CUmSdut5wg9f6DTGio2g1SnUWvsYZSi/nC4F5or1IIXp8b
         GTh4Wqd4ZlakqqvuuagHqBqp7nHQux0g9i84Wc88cpwFYRqX4mW4ET0jzbotN/EYDJ5w
         YYsOOoqhVhU55myn30IRmnAZBZx6SoiRIw/eb80lNNk+1Cup3D6YPYOtKhFQGYZbndcH
         e+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559575; x=1794164375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8kTeAGzekm/MJUppeDHNBzSirJscu8UDoZqPjNsLkRE=;
        b=lVBSGUQ2je3Bw3jmFlTq/Qc5J92z9PmqZwDpu+Y0wHZAUwpWNySDzE63Pw8hPLH6OX
         ZupgGbLUKtS/3VShHcE7MOBkr5ACoLbi4ixTKUkMelKwHuFAjEo06LtKyaE3awDTgUeh
         5dAwSSNt4Mw7CAG+HB6buXY9IGIpCOBqiFO4GV4wowkVamWcvGSxEvY7wktUteGb4GsN
         tsXYp0DCEKkw0cweGYcvpJXDLxUKAY0NX8YgZD1w/FHUY+NdQyo/rtC+A8a6pzz9cdZO
         zOvS5ErkQ1tSvDaeGiEH3pCnvIVQAjaDjZTjLXVO9tTpP496Y0ktB9Xxr3Ax5IOqjdsY
         P65Q==
X-Forwarded-Encrypted: i=1; AKwUvBwNV4ru3vzkCBr3JkwbPl5LRa0GHUx1z2WSBKlXEw4+IOYxv+VsgwZkOYVVnK59sAga71pRFpjmB4ofgMEb@vger.kernel.org
X-Gm-Message-State: AFq9FYJBius0F27N08JdQT8NAPl/LyTVO+k9B0gRpevB8K6MLAH7QdJO
	FtruCYPaLiRFIApgPPE+qt4E/S/3YlvnAp2P/r8SYi7wnLIEb9oPB5mQBiRnbNRfwiAgqyAUnc6
	NuEij6IXnxwrS3HXrsF2MWNmTAwTOCHUptaiWMc/9oWJjMiN2PReEUe/LPi5YGErXO+Pd1TggEk
	Z2lJ/EisBiEvr4I5pkNbesYhU64CXljvY31TKxWeBQanI=
X-Gm-Gg: AYBFou2/gcZfYk8pIpSIDrvt2X/XxlsMyBjj7zM/bH17PB74iQEUo1GlAjR1N5+Z0jv
	wYjGF4hTIUqMMklhLIG5wciMDiyIlgTDNGV/1cICH8en8VKLZRwR3EvxZJR4MtXrQ4eMuEKdv79
	ZTkAQaGqCR8nV0DEltodDFWhmsPKA8mY6erfwmd8/1j/hFzYCWxeocIo6pWYXv8dF42cjl206yl
	Dc/abZHrBMlN5Ifd//AUZgJxIDK8RCmVT0QzsCRDbcc30JbJwuzR45iggU46xUBjO3mxLrwRJC0
	WqPc2SQ5rx1EyWA3zK16Dilxx80k
X-Received: by 2002:a05:620a:808d:b0:93e:e531:b78d with SMTP id af79cd13be357-944214cb80amr1355911085a.7.1793559574833;
        Sun, 01 Nov 2026 10:59:34 -0800 (PST)
X-Received: by 2002:a05:620a:808d:b0:93e:e531:b78d with SMTP id
 af79cd13be357-944214cb80amr1355909085a.7.1793559574364; Sun, 01 Nov 2026
 10:59:34 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101030902.1387122-1-shengchao.guo@oss.qualcomm.com> <20261101173256.5ad42925@jic23-hlaptop>
In-Reply-To: <20261101173256.5ad42925@jic23-hlaptop>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 1 Nov 2026 19:59:23 +0100
X-Gm-Features: AclHuK_y-XxcZzWJ7IkifUD6NDu71IxST9CH5U17suAkwJv0PiDsP7l0eUD4YmM
Message-ID: <CAFEp6-27XLrb56XpnnSLxkRXzQzugvXPzsDt_OshR5EmhC8Kzw@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: qcom-spmi-adc5-gen3: Reuse IIO device ID for
 ADC_TM aux device
To: Jonathan Cameron <jic23@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: J3dyOKNLeDnes1gN0oP23sFS11kUeBUo
X-Proofpoint-ORIG-GUID: J3dyOKNLeDnes1gN0oP23sFS11kUeBUo
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae78c17 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hw_--xrD18hxE5MXGX4A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfX9yYnKAJtqs1s
 GkM1xV6LNuDbVz5Dc8KwyXFZwioAzfHIn4/7c3vh9P0FVnvWj7oqkWxRA3TxErxZWDx9IulOvt1
 pBp6H6NRv7xmUDmt18qAXvRpdEmpWAw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NSBTYWx0ZWRfXxTxOf2suDmhJ
 BZJdYT33AyvNsCnj/8e26qXqhwDm3oZwpVaV8EndFOrrUcKQJ6B0Q7UB4X2K4zTdkeQQCvCf2Ru
 8peBuWE2vqsyjtlPA5IRk/S6jjoSUrVobi3PSstWhTFt2N1R7wx3tFfJud2xz46lJ6GLi+kdFiI
 LAlntdtCBBCbetJ80QxOmrCmaczfVobscdl/LU6G/OJog9rl9wLXHbBjnO6CqymiL+pkzazao8o
 jAbWBl5n9wbpyFEQWD0jDAUIMFNVtZNDkmHiifHCRDUB77M9noZjQG7/cDH00FqPouBHXzu02ax
 h7Qpy2NZOqAl+AhZu73Up/bpYgqRZSxauYkZHdRQwpFElyPRatfq2KA4NWhRpok+KhcXzFbd4SE
 +/vkAm8Of2SDi85ZFRXQ7oHzJ5SHE2Ui9jY2rW2FWBxQaJHpzmwuq/ABd5RjlSUm8Jxyws9r/1B
 p19BjeHgZCDehpfDMdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010075

Hi Jonathan,

On Sun, Nov 1, 2026 at 6:33=E2=80=AFPM Jonathan Cameron <jic23@kernel.org> =
wrote:
>
> On Sun,  1 Nov 2026 11:09:02 +0800
> Shawn Guo <shengchao.guo@oss.qualcomm.com> wrote:
>
> > From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >
> > adc5_gen3_add_aux_tm_device() never sets the auxiliary device id, so
> > every ADC5 Gen3 instance with at least one qcom,adc-tm channel tries
> > to register the same device name. With ADC_TM channels on more than
> > one PMIC, the second instance to probe fails:
> >
> >   sysfs: cannot create duplicate filename '/bus/auxiliary/devices/qcom_=
spmi_adc5_gen3.adc5_tm_gen3.0'
> >   ...
> >   auxiliary qcom_spmi_adc5_gen3.adc5_tm_gen3.0: adding auxiliary device=
 failed!: -17
> >   qcom-spmi-adc5-gen3 c400000.spmi:pmic@8:adc@7200: error -EEXIST: Fail=
ed to add auxiliary TM device
> >
> > The ADC probe then fails as a whole, so that PMIC loses both its IIO
> > channels and its thermal zones. This shows up on Nord, which has
> > thermistor channels on two PMAU0102 PMICs.
> >
> > Each ADC instance already has a unique IIO device ID. Use it as the
> > auxiliary device id instead of allocating one from a separate driver-wi=
de
> > IDA, which removes the custom ID allocation and release handling. The
> > ADC_TM driver matches on the device name only, so the instance number
> > does not affect binding.
> >
> > Fixes: baff45179e90 ("iio: adc: Add support for QCOM PMIC5 Gen3 ADC")
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>
> Applied.  Given the slightly odd nature of this series, Loic can you conf=
irm
> you are fine with having the authorship + Sign off.   Given alternative
> would have been Shawn having that and Shawn sent this, the attribution
> seems fine to me - but best to check!

Yes I'm fine with this, thanks for the squash Shawn!

Regards,
Loic

>
> Thanks,
>
> Jonathan
>
> > ---
> > This is the squashed version as requsted by Jonathan at:
> > https://lore.kernel.org/all/20261101020047.66034613@jic23-hlaptop/
> >
> >  drivers/iio/adc/qcom-spmi-adc5-gen3.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qc=
om-spmi-adc5-gen3.c
> > index c68c6c5f6aca..a23eb5c9096d 100644
> > --- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> > +++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> > @@ -610,7 +610,7 @@ static void adc5_gen3_delete_aux(void *data)
> >
> >  static void adc5_gen3_aux_device_release(struct device *dev) {}
> >
> > -static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
> > +static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc, int id)
> >  {
> >       struct tm5_aux_dev_wrapper *aux_device;
> >       int i, ret, i_tm =3D 0;
> > @@ -620,6 +620,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_=
chip *adc)
> >               return -ENOMEM;
> >
> >       aux_device->aux_dev.name =3D "adc5_tm_gen3";
> > +     aux_device->aux_dev.id =3D id;
> >       aux_device->aux_dev.dev.parent =3D adc->dev;
> >       aux_device->aux_dev.dev.release =3D adc5_gen3_aux_device_release;
> >
> > @@ -799,7 +800,7 @@ static int adc5_gen3_probe(struct platform_device *=
pdev)
> >               return ret;
> >
> >       if (adc->n_tm_channels > 0) {
> > -             ret =3D adc5_gen3_add_aux_tm_device(adc);
> > +             ret =3D adc5_gen3_add_aux_tm_device(adc, iio_device_id(in=
dio_dev));
> >               if (ret)
> >                       dev_err_probe(dev, ret,
> >                                     "Failed to add auxiliary TM device\=
n");
>
