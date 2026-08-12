Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD0A3CB8E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786525094; cv=pass; b=OMqhcKD7IUB7uC9ctpIqdcLr5HY1LG4nh7Fhm94vW8xfS9uIxlhzGmPdnDGHiw6Oyg24A3UhMLFl7UL5yBM1Ces2G5gIMeM03FaSQehPScD1QlDSLllLr8yuVBGQx1IOOHI5tcJSEvfnszHD0FGItcb6DLG1/BgNk+2xWZn+/jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786525094; c=relaxed/simple;
	bh=J0DBJDhPyKi4K64Ojy6y17lBqGHCMu6qO5alVMzFIw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELKzkMWl145TFnPKWJG99ZmGC2P2d8KAT2jBoVysY376UwETdZw1E9C0eVbAiq7O4PlaBCZSA58WVghZIou7mjv8SIPLNlP7yDz8vf3rWwvMkFU9qqhZycgRMlukgD6nx3IUEWR/BNsXoqlOx53lLcTr88Yo9kIc8QWMqnkXVgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GLN4Thzw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grKDoszE; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GLN4Thzw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grKDoszE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YM5n2933880
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nFA0x3tEHcygP6g65ynR4Scuteb+g36sIUIIXpRnoqc=; b=GLN4Thzw5ppeE/wd
	AoM/dI436IbDimGs9DiOG5iPm7qlx7v6S7ZCsWR5VkX6AqY1pmkxpxFieue1OfwE
	uP6toMsp9mFWD4H8oo74JxFN9Uy2fTTcpLx3+PPSNqpAoRyV8on7fVC/V9hGkHEU
	jNl3i7/7rzkLABjCcbrgPjKcje0Byp9mHuIMQ21dnkMxYoMpUj6/sCSoshoJ0mGv
	sEebEGKjtdgAeNtkyZD6m5oYasD9OiE0K57Zn4jMExI5k71q7lRgP8Sfv0tp4RZA
	GkKGzEYPkJUm+7KevEH3JBqjtx7o6eEWMvOhpmg7vQWgQw50tIJngXLdC7yGIGsn
	jqnT/g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrk0y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:58:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso2190263b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 01:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786525091; cv=none;
        d=google.com; s=arc-20260327;
        b=KoJRLyNlFF5pHD/T7B26/h5mWjwCyQyrElgAqdYDfm2glomL/nHnx81fPLWcSntV81
         HmQVbUbkqHSFrRqyEPMFNNZH6Hn5xZTwOHmtwrgq0a4TxaP2GhcnTo4gL+2n4ZOm3gbs
         xKQpPjKwvxPLjomKiMuXrdNrz/ebJajS61N3ezqcgy3NjndZ9Jd3dKAMAMkvk3XGrKmt
         U/luJXnORELM++Cwa66RWTwcIeku8VoPx9aKDqqpxs7f715W9pRhDbzXl20vQAeg6Lvl
         8JtFZ0ISbho/RJuTJz0s2bAPxZSWcQ2iEdnTzYRB+yinI5VN2plhlar2scitENkgScFz
         u4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nFA0x3tEHcygP6g65ynR4Scuteb+g36sIUIIXpRnoqc=;
        fh=AW68fWnondf1C9PYkEFqcj5xCQb+VAf86SoI501piBY=;
        b=Rf2Gl9d5CAFWqQWAKTBqeFTta8p63IZ45GDP201dPNnREcVaEQ1rN8VD1GK4dgEaJ1
         +Iz+gNPAQHNDGxuyuCoG399fqiuG4aXix0Asrk7pNKGxpugJetd6igwnPh62ekN53A+L
         0iGmQCwaaEQbIZKNx/XRyYQtMdy0fMoYXLgLAX05pWYAfaWa2xi9AHpy5WdyNhomlDvj
         1BwE20EPlICA55mNLbyvDrZ1cmTayrQSQtKIakXYQqHVLLr2pePtMfZTK8emQuMr0cOW
         d7NhAOt9sRA3JQoh3bYNLmZq/lqbFk4+U+51XK6Yiafc+SHnVvTzfCSXPTwxGuxysgUc
         wVFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786525091; x=1787129891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nFA0x3tEHcygP6g65ynR4Scuteb+g36sIUIIXpRnoqc=;
        b=grKDoszE4bHmiPL64Y6bp+0dIoBtk18FS4gYbk2RaWfNjKoQgbD5gN7YTKEdfUJSOL
         thFuj6H/U8RRHtEi8X8Pp39QgOo9tilaU3Ejw2VGlOvC+YKU4lMAWtzepYjXupybn620
         b4462p3hpwAZw/KIu8iNAPDX5qZBYARjnvMp4EVp4qrgMX4/ScMr5VtkBNaZYndxMOJq
         +Ur1Eo/EJdUc/Q1NjW6VewWS+iqW3T3sflf6w8MEnziw0h4adAK2q3bfTBCgu5+rwf6Z
         sqRvJYWUNIEF8e/h0D6dQUQJfvbR1A1wSNpP/hI3MJMb+0DzxKcgIQIqAmDi2ZCPRKwd
         tezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786525091; x=1787129891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFA0x3tEHcygP6g65ynR4Scuteb+g36sIUIIXpRnoqc=;
        b=mLFOmsOc9hNywDk7nu/7w5b5X+ZYLpsZEO455ThEapk1DYBLCGTsU8PCENdTWyOOpj
         MPYJWdI9Mlgh/kjjZ/AZ9+GrJBx6G3ygq2WK7mbKz507446w5NuQBQhmcfrGiXjOxKld
         cMNfPHXdLwBQWZxrx5el/ZgA+K38UUrqJ/E6iyS2r9XWAtBWCj5BY+D5KO5Nfn3VXOoK
         gbvVCZe/9rosTKpg6T7bmJhnmM1wDLscJKMWK7CCQqpHQTJ+vLKEJSd2+nYnF9oHEBay
         sOG+a8iBnPZAyA+vj9Gt+v6QHxNFNpWIBsbr8v5FPZWEHGsc1VnYRcnMZRALD/C/gpz/
         eAdg==
X-Forwarded-Encrypted: i=1; AHgh+RqkDU2qaw0HeZQ5cQLA1hQ38n0uuWeK37RZMwp0ObOrfSnewDIVgM0j/ajr0/Ojjf6YfLfjJb4r1vlMOM7i@vger.kernel.org
X-Gm-Message-State: AOJu0YwOFevt/LAJBJxopEOEunn6CO0qvUAPUZnvZ5v3CUSQVEHIpPHb
	jz38pRrk4P0A77diemn1n396ch05Q0Z0DAuWBCrchB3+bF9NSlhq7cVg8TEZ7zmVDV9J7+6U95e
	JCRdvERLAF6MhPZReGYoV1sOrfNCUpNO6xSaV7WPXNO428JwilWUwoTN3JA3ffiZmvCVLmQoGOc
	4L9Fpzu/pupI857xUZZQPjvb1KIFtWzJIXJ/C4JffcPAw=
X-Gm-Gg: AR+sD12zkfqrxHk5VdLk0FcpXFPgRFAGwkzWc1iBRPpq1FEVwcRml4JmtKX5tA9Qv9o
	z6SXkVk+dVTdXoOiRdHXv1N8HgnnQEs+pwUH3qufg+hA+7GYLZWeb/CSKnOcGyEqCco6LwqwhvM
	tJ60mPy06SqJ+RJRtXUgvbgOjw+u73uJgDLQJQlpNPi6JDV922ZFdzmdf9pIGW2sY9uEyYKxRVC
	tLRMai4aSkQi24Qyw==
X-Received: by 2002:a05:6a20:3d1c:b0:3c4:1916:9d44 with SMTP id adf61e73a8af0-3cc3f913cbfmr3419270637.16.1786525091124;
        Wed, 12 Aug 2026 01:58:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d1c:b0:3c4:1916:9d44 with SMTP id
 adf61e73a8af0-3cc3f913cbfmr3419211637.16.1786525090708; Wed, 12 Aug 2026
 01:58:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
 <d5d64ea3-9c6f-41f5-adc4-9923381d732b@oss.qualcomm.com>
In-Reply-To: <d5d64ea3-9c6f-41f5-adc4-9923381d732b@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:57:59 +0200
X-Gm-Features: AUfX_myh6JDkLkJD-gnKUbWgAMFmmHbyR3eCYV8kAAVu1iWiCFaF1Y5_s5Z16ro
Message-ID: <CAPx+jO_-1tZfZcjae9shyWcKPsj0fM1SvRzC9_JVOvJr--EeuA@mail.gmail.com>
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from scmi_pd_set_perf_state()
 on state 0
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: OE6xu03Dj4585uRckoFq30upkYD1dWo4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3MSBTYWx0ZWRfX36S8+Ud3RINv
 LD3YV6UcJXx6PGafijDu+oCr6/RfZzIAGCqYpVyz1Q72wyTyEhiGUjl9LEB3M7dBVAXjwlMF6h0
 BqinMBCWNaxG6dmQAGfGOM5i/PIUXTQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3MSBTYWx0ZWRfX4Ec0ERkHDsPO
 68mXpMY0X1n8jQh3YmoOXKqXxskCKVHRV4I7Z19pdxIBcmA8hKs987nucrBWXogutgFzgGxMiWr
 evdE8PzFjteZYikUh2OmHzSeQsfDE5+YyAysO5CG6PeRMGTyC/JcMG6kDFF6c1ulxcm11z2UpVA
 oxJBp6EggRDslbeKmcb6w8+7iSzhxN5KLEYNiYjeWTSlwTnTXn8RkFJHKFzwmYLabCTDXL2QsJs
 OqG7b5Dgk4F9jrhLyCKs2rGaaPS7kLKECBb4NQf4tmL8qkKu7/9bFsX3ZwNpQc8x3v2/+dT3nB2
 3DpgUvIcDT81hQVyUkvsksMRdlMKTVzJTcf/RfLbwmUDKidmrMjNYfAB/N1xip5yUTZ26142+eb
 gpKBImnhFRMQ5fjztNNGK62cIHrIKm6MQmNawEga41W5niBhHd/SkQuGLJ1IuOJOY6z6gEE5ooX
 KsI0DCixnexFgQ914Lg==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7c35a3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=4tH4gHCIEoDemCCG4kIA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: OE6xu03Dj4585uRckoFq30upkYD1dWo4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120071

On Wed, Aug 12, 2026 at 9:24=E2=80=AFAM Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
>
>
>
> On 8/5/2026 1:27 AM, Praveen Talari wrote:
> [...]
>
> > ---
> >   drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain=
/arm/scmi_perf_domain.c
> > index 3693423459c9..e390f902a444 100644
> > --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> > +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> > @@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genp=
d, unsigned int state)
> >               return 0;
> >
> >       if (!state)
> > -             return -EINVAL;
> > +             return 0;
>
> Won't this cause an issue to other drivers ? how are they going to take
> action based on changed return value ?

I think it's rather the opposite. With the current returned value
(-EINVAL) the driver doesn't really know what to do. It tried to drop
its vote, but that failed - so what can it do?

Moreover, from genpd point of view, this fixes a real bug as the
aggregation for the performance state becomes incorrect during runtime
suspend/resume.

>
> Remove Acked-by due to this till i give back.
> >
> >       ret =3D pd->perf_ops->level_set(pd->ph, pd->domain_id, state, fal=
se);
> >       if (ret)
> >
>

Kind regards
Uffe
