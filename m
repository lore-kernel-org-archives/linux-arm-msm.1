Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028840;
	b=NbtBVA+C3hZL4w3mxIrDU2312aHVXtoTXvoz+ZoL/j8C5266hJY35NzvP4mSsRW3CxpA
	 3asnHxBIVZBbgKU4Y0NDaSb2QuqdYl9LRmMhnzOdEws0O1AaAV/WLLRGY6TFjMSCzXKFt
	 g9RmP295zQLA19RZyqugqEomLHUHViIzc0fCxhWLuo/7FJKMV7QPPu5i/K26p+7riNj35
	 CLkuIl6qdlU1aiqRxVsYZ9EMKbY7BxbfWVGV/Ok9QTx+Y/sfD6VsQq1c13XGl/7QNsQU4
	 WE0msXpdYuLkqA1jr9Xu3FZDj8rfYY6swevM4zHxP3BonsLoeizykVwtvJpyBA/fJQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=;
	b=yYyuJ15QxTNHWGRZATgsQm9rLLhBy7YqcF8EVXsKO12qLknEk4rAcUwKwdzpfzWgDN0+
	 2zFpho8ZFoAQmTRSsuUaZhmRWPeT3dMwSQKLoV2CWWI04iTjYs0+KPd2SWtGjJdF00YW4
	 8bDBbBkw/ohwCixt1v2m8DOxenY8ewruCB1xsrFLhpWLP30W2Phew6Df9OfyRZILr8BKT
	 jFrHkK77NbOgT4+gIw6hMSrufq25Za09DrPOPXSaG2iNGAvUbHW5s6xfWJdj8dW3IM4eo
	 O3lJ8XNrv8Vr7pcL4BlcqTzOEh0ss1mIR/EcswhdOo2l6gC129kHUxC1/bGY5sBqxTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcS0ih4B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B34kLs7r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BF8606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2BF8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcS0ih4B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B34kLs7r
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEveZj2544116
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=; b=Uc
	S0ih4B0SqyqXAGstgs78uTJ2W7qimh8yCjoJbY09Gm39AV24Ile16ot+enHW4FFm
	9qMmuf6FHur8O9jfG/YMtkMxEAz1IiClXAjROITmWFDsnvmI8tw6nfgct/dmtN9z
	c63Mg4VyG+G/31UCIsG0BKMBk7IEt/zLwMQ/+Wf++9Km8773Q8spidzIzLZMEjwK
	Sbh+9lT/5wawmkzk3TuAEmif2GlDCYa/P8Qdcjgh7TkJmLTCpkZEDNIxwFNJiao3
	92AAAEeutzkreIbsQHsLINmFTDvp/FJ3sBJNB/sQeJ5RgQcq7rMOpOGcAHd2kmcv
	I4q1Lf0XMMwaAaExINsA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smr7vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:33:58 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-702f912301aso3151082eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028838; cv=none;
        d=google.com; s=arc-20260327;
        b=oxt3uCvpbhtOeYZ7Wuk3wHjsXZVH4LzTP9yguUiIWp2jDHTScIEb4sSFYBqOEFObMx
         ZfQ0VJrDXg6jg9fMlUkJorbauZRuOrCggdW8nA8Z/M1nWoP7l9KcHrNb5XJigvZ3Y379
         FMLjdxjFXCAVgsNgcnSnmz55e1dJBqLkeddxI9FLH6qcKDtYOoumP0nzsr/ct1GUqngR
         ln3aTKolNIsLa/dt2smS4kde5X3rkmQw/6wv5lQMVS8zJ1er+Y+iRj36BuicXHnOYH22
         878iEUc2keH0pZbeEwZk2Y6HTkDvmJovh5ms2iPA5+BPnnfPFfYxFWhRfyQe5GA8orGO
         3Uyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=;
        fh=zVwU5mrrdNMLtIGFjw6mpQ97KFNYR2CimH2IhSj6nK8=;
        b=DVfJoSOQTrU8gnQ0UkYPnbZ4ZQZw1ngPyBOZLWA7avs0ozFisNaExM0y2OUSMlXGPA
         KuTrhkjFFXPGkXKlRiW9l/fe+XvNY6Zbn/wSPoSY/bKrf2nmgp2YHHXCZqxzyRmDLP1x
         KoiAlbYknsfKfroFha9ihFCsjDiv+YdT8WpGTY5ELjmBc9gotqN2mexc1Re2oyICx0iT
         v3ABs2GNoM+H1v63DzW87I2dUjmD7RXyXVYpcl2sbgpDF+18WXdMGTW1xQkXzjpPjsFf
         xLZD2oHfnL/B5EPKGqy9606Dsn3y22Eh9AEa7OfWmY/3pUOgw8+tWpVyN0KTY/fZ8wNT
         11JA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028838; x=1793633638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=;
        b=B34kLs7raeLp7H9fv/q/Xoa+KPZgzmUUHoWDCSomDngkfOpZqXoEUtmv2GwimFYhYG
         LrHVZXpHBUrUO4EfqYWKvtXH4/CJHEQJasuqG6A/Klgdj/15IAuo69RkpxmZF9a9D7Nb
         NLGOeLsAz7RrchVrteX9J4v0evSCNKvZH69eDSmu3TPfAdZAaqUI+exT0uZcEFOjTVPJ
         3kePwnNAM0r1LHvUE/u8fGkYxGB5dNXTcE0NccLCcquX9EqPcr5szxl+OXFvMBgyBnyq
         59ZkgrbQ9uL5GN+alKxs0+q6nwsndj27bMeiBQOHKdscs7DTxQXiPSC/fr/+Ip3X94Cu
         SlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028838; x=1793633638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=;
        b=PCZYyhopJfasfoPmne6Sse2FgKasJVS2lrTaqBLVva4AO617lv0lIy/7Swysrm0QwM
         qd2b01WT9WsRO6EivaREO+CqZnFMaFbOUDzS4Y9JgS1oZws1h3RRGlNod9mZQ49yR1dv
         iHR88e5ILhwkcRt3mzkkHl34PujbhajUG6MAECb1XW3f47ZU48lYMRBzUgNuPE8GvOGz
         so36j8EfOXD0DzoVunD3SJuxYstHtpzY3U106TCdnJe6stliqZ7ERHqwmamgjG7SwpoI
         VSn4WiP8lN4qNpkGqcrlJhh0lw0FODMf+BomBJj4Db51JSiXDQ9nuh0GKPPCGxY5zcmB
         YiIw==
X-Forwarded-Encrypted: i=1; AKwUvBw/61VOPhIdKo/YkYMIKs3gvBGAFmiFPRCk91b95YxI36kQkHJAKZDCc96CFFeLYudCxAmtrGxWECLBPsms@vger.kernel.org
X-Gm-Message-State: AFq9FYIkWjO9JOHwVRw3yU+qf9XjYMwv/3Lin+gSy02ArPTZRDne9y8J
	y4VQe8EvfsT3M3QmDKx+osfFPHk0sI5tmfKSr75v7LDgdXYvS3X7qD28mhdonqnNEkQePLyK3id
	2ZIUWTBJj/Gt6Nmt5X9ceyxvE51GvAq9+in8irQC0m2JFmfe6Tqoh9nCZ9NhHG82I6riiCUVg3h
	hxR4ZiHVEWMa2jkQkMcTd8iljhckbtPwc96GP36iKe/TI=
X-Gm-Gg: AYBFou15Wl4kN8mtKQO/wb+7UpZUHg+SF7dmW4UXsjnZpvLk9XYJ8Qzdb+hmxqCP6I6
	pqVe7iHp/TwuAYzB3RrOzqsvIQ6L92fs0aLObA9e5z9KU9OD5pM35V4nQAvPa/MvEAoowvj93fh
	yWU54xJj32KCUxcrx3Kcwk7i6wVViqLuV0E93fNDv/gBE7rX82cXEX6j+mSw==
X-Received: by 2002:a05:6820:1387:b0:70e:78ba:11dc with SMTP id 006d021491bc7-70e78ba2a36mr1241829eaf.17.1793028837877;
        Mon, 26 Oct 2026 08:33:57 -0700 (PDT)
X-Received: by 2002:a05:6820:1387:b0:70e:78ba:11dc with SMTP id
 006d021491bc7-70e78ba2a36mr1241797eaf.17.1793028837444; Mon, 26 Oct 2026
 08:33:57 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
 <CACSVV03M_MzamPN5X=+bmbqOkET2QOJk8O_vQyhnjDGbSTvN2g@mail.gmail.com> <a5667943-3c3a-4bcd-99f4-fe5e487cb6c5@oss.qualcomm.com>
In-Reply-To: <a5667943-3c3a-4bcd-99f4-fe5e487cb6c5@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 08:33:44 -0700
X-Gm-Features: AclHuK_qyCyqkMau4o0U6eEvxC80Yve9tJ1hV1jdwuEzcVPxGyIcGYsybUyrLPI
Message-ID: <CACSVV016mJk+oLotAUKeXr4a9FHn=cfPcWrxdfrwRxmC4S4wqw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/msm: move VM_BIND op validation to Rust
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: I4PgfaBM9Y3qqjYl6e0C11L6f_8NFi86
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6adf72e6 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=9rG3V10fu7yUYHM-WnoA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: I4PgfaBM9Y3qqjYl6e0C11L6f_8NFi86
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX8e0y5jJHliOW
 7FB6nzht0yM1XijT+hAzWCJVaP1qvZLc6qykpy6R+0rlaEsXq6FYcS7NsgT4dM/m8bNzpo8QKIp
 sZO53LTyo2qxT+NTcaHJWhRAjqCwUQc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfXxR9Aw0lr8RKw
 KuVh72s+9XJ0Hxm/X3qAQBKYQTO2PVrh5MdUcZvlQohSWiwZQ2jvTgOFsQmbThsY9vkHV3/l2wZ
 JA2zmYMH+L7R/U2OUZSHGYqICppe8zZHs3NPNVhxMknJumPjZ7Hnm8XG72HW6bP75bJ5N8BLxTT
 udz0lDpY2NPJmzvZaAIPeU236EdBFj0IM+PfZTcMAgdA9hE73zlwJ2YabkZZhBVh6hcfO5ptEZT
 z+pwRyl8LC2T0S1dWW8HbGuK+ndGTbrHEm26isLWgb8KzzzoNCvwJOBXxHdVOj/RuT1h8XQ+pqZ
 Slut6uiWLbKRnYf860QNFqnZMpdKbLpsaUYUqammRk4NGi5g1XWH7zS4ef36MUs/IaAROzq0dGX
 VuEqn/+gCOwL7DNcG0HqNdSqeWPTHJZ0fbVjbUmUjXgigURJbOabCYFsIu6lsfkNXQ6gOG10AhL
 ilr17j/w9imP+Q5d7Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260061

On Mon, Oct 26, 2026 at 8:30=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/26/26 4:26 PM, Rob Clark wrote:
> > On Mon, Oct 26, 2026 at 4:40=E2=80=AFAM Konrad Dybcio <konradybcio@kern=
el.org> wrote:
> >>
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Much of the VM handling code is a headache to read and maintain.
> >> There's a soup of mixed-signedness/size types which need to be compare=
d
> >> and added and getting that wrong in C is very easy.
> >>
> >> The "(range + obj_offset) > obj->size" check could wrap for a large
> >> obj_offset, which let an out-of-range map be accepted and then mapped
> >> as nothing. Oxidize it and use checked_add() to fix that.
> >>
> >> This commit is a "get the foot in the door" type change to make sure
> >> that folks building kernels for Qualcomm SoCs have their Rust setup
> >> ready. It may/should be extended to the wider mm code once the
> >> appropriate abstractions are finalized.
> >>
> >> Worth noting, the C UERR() macro expands to dev_dbg() and the Rust
> >> implementation for that currently doesn't support dynamic_debug.
> >>
> >> The DRM_BRIDGE dependency is dropped because including RUST exposed
> >> some spaghetti dependencies ending at DEBUGFS and it's enabled anyway.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >> (if this is rejected we may just patch the C code).
> >>
> >> Notably, this will regress some ancient configurations:
> >> -- arch/arm/Kconfig
> >>     select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
> >
> > Side note, I'm ok w/ drm/msm (or at least the gpu part) depending on
> > CPU_LITTLE_ENDIAN.  The combination of BE CPU and LE GPU would be a
> > mess.  I'll actively ignore bug reports, patches, etc related to BE.
> > So please, no BE!
>
> arm64 is free of it now!
>
> 134b0fbc5c24 ("arm64: Kbuild: Remove vestigial big-endian support")

And there was much rejoicing :-)

BR,
-R
