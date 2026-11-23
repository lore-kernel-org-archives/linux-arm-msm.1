Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795427931;
	b=UWi6vp9aX0NXj1DgWqulnKQIg1FLz/ZgjQqTGVAe6YjIVRzgLtVZNJ/hOIo+W6HR4o7A
	 2xXgRnEiPmxB3qTGxsKXOEq++qhc+VV2LF6WFKlalX8RFW6e7fUap6xvrfNnT7h/sfDKj
	 iF65oEjfE3CNW3Kr40c/l783T7IBv+3F0+cOSik7g56cTZUB2wNaTuG0i+fV+8zHV+0JK
	 s8yIFkKgvRWSN4T7ahKvwDKNPNpO2cOzm0OZUsEkVct4hzc6X+E/JzrhUYQSJPhiMYJAi
	 MQf9OcMMWhA6EFm81d7Evh2+d/y6iS90Es0tSbZjIzo8cuJHY2BMDvI/oFMOMh2b9uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s9RoRgSkXuboi2lc6mG/GA8JbDuahoYXjlUXGu6PFjM=;
	b=mN/qK7IlBcqI1lFRzULzmA7xaZ63E0L/WXONGWoEWTQJQ+0SjQLK3vD98wFKVjvlprso
	 Qe7fT2dG30KnSvC+LLE0bnRQwz/EgYZssKCEcA/HYBELeE+itcxwUgZkbVQA2TvYc0327
	 ry9xkLJBTQ+sfOmGDbuxXGpNyj2BHT2sgaitQOIMFj/g7oTCtynX9Zjt4j3cc169fufie
	 Loyt3Okh76E7do464I3CT30Ofin1tFNBJ20m/AuU8SRQYVK36Fzwu+c4mmI+Qk7C3Q/gW
	 CCE+SO+C0x9ppysS/N0Y9n0Mie2Ecf9ZArRK4KRLacz1MEsDeiKadghBn48C00yclRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CGZIPpMV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JPzM/jpa";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DD8606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CGZIPpMV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPzM/jpa
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FoVe2785433
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9RoRgSkXuboi2lc6mG/GA8JbDuahoYXjlUXGu6PFjM=; b=CGZIPpMVGOyTcrwP
	5gU3J0Dd2UGnPH3Dyk0QOyFyzpCse1NqtI0P+qDYbwN/puheETu2fgqPARb3rnPH
	H7ES8ZtAVIuoRokdgmzr0j8jpUvKhu2xxDiMct4i5+vzRz9SDyxhXJ9vWsH8SAg1
	1A2mnqTwwRPAvHw3i2RgnWk0ovFyEgKjb8mIjXw1uV1RAAKdA5SO60SJodIwHQ+c
	EJ5Jx4lgh4DdskFzxnRJnK6DlNlWqV8VTLLRVlY200s23NrbkDZxmwyI70XkyHMe
	HknpuqyzKRPzwqeHl3qT7zIhfpZSAy0CZ7kPg5qAKf13AQx+lrxww1LxQLYpH8vu
	WHuzfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd0u3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:58:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so803172285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 01:58:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795427930; cv=none;
        d=google.com; s=arc-20260327;
        b=S69cGqSdg1KbzyxxMS9AcOvOBiu6OeOHS3GhseYD2uE0B4Wi9J3hJvXx8av8GI8DCH
         fqQHz7Wu2NIA/YaVE1Ea2TEyxViyn8YOXhD7WYVT/DVm7KkA+ZOVZP9HoSqByARMF58c
         HFe3aVLEe41NMyuXuILHlbLgJDPSGpUvd7X2adG3OEEIqQMCkGrtzYG4wz4Qj5nWymSf
         Tz0iGfqI/F4muT51DfOKCRy87hO9a/f6nXa6CjOfXPeupzvoP+CBziCpGFxp1FRY+mUw
         4wOWkSdIeg3vM0aq5hanLZEtl/nHG8macOVTQ6K+Zho3lMCmQT/g9PSoGvN2fL4aaPBJ
         zxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s9RoRgSkXuboi2lc6mG/GA8JbDuahoYXjlUXGu6PFjM=;
        fh=dXqwISAnjXaRRqOZ2WTmfbFkDWwaEI8A4TK0gPrlTTg=;
        b=QEfPudiH18ahdpRBKgSbtqz5de5GsGQGXNUw0blDBffuqQLrr4PTu/l2IOkZKA2RKC
         Q9Drg2MI3aT5yO1VsXGDFrkuEyeXBc/6gWEQyUfgo9vMlozgQkN5Z+IpUKECToluvt2C
         Hqt4k1aQrD9C3CGpg+j/em2YMHpg6U4gkEIMiDhwJeoGkPF8/pv0vdZ0bfZfHXgsZgd1
         iJtcjKtQsuC0ZNg2J8fBDuGgYDClJKW7cGEa0JbenrHqnvNMcErpYt6HmZBrk3rNn5Gj
         hQ4NU5Bvd/0ZgvZiAsjQ0tA5u65er4EuJz8hveF/mhiXCt65zbCfnZc+5zvAumOpW17T
         dVvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795427930; x=1796032730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s9RoRgSkXuboi2lc6mG/GA8JbDuahoYXjlUXGu6PFjM=;
        b=JPzM/jpaOXn8S1a6uVB5rhjjNQUtChxLR9axOhD0Du0kqXOWEeSmzXf2Md6+esK49f
         C2SASqjYF/YLTN1D1SnYFZYbswGsxGyBOAHmDGzR0jxN2qwiETBe96sMKazIez2gtkB8
         mmfxqupg4cf/1ectyyQ9a+dTMTKnjAktXaVGevxoaxv5Bcl+hLeRQM4Wtf8P0IjHsOuG
         LLkSi0Enwq/AUgvIg86pi4Hom/9F1jvROBkPMQEoP+X122GoMqc18hQr1xgM1xoHQNRG
         lRcF+gPuwrf9MmqN8FAgYpv20e0LDVoPJIL+/jz+PH3vNVaQxsuSE/GBVkhamMVL6Hvq
         /aBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427930; x=1796032730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9RoRgSkXuboi2lc6mG/GA8JbDuahoYXjlUXGu6PFjM=;
        b=M0tqkaWff+XtKHlispUZ75dUpGFbtItm7s1fzu3Jky/rTrnBoMbH06sF8z84U6OC2v
         3Ab2YcoVPNVKclp/Kbt4sfh8JjvH0K367h77Stg9gbr5TRARUYf9xHAdPuX9iMFhuXsU
         QREfrJ3TC3OEYMfkhv5Vs6zied0/eKsyY4anDKN1MJuSdNiOu5/fGpju8ZGuAnYUeKWW
         4Z2jhqbODj4Zt34Gt3g0qmm+kilScT2IajR/1Ty529FyzMDudfScKhZVKbqJR1rZqbkG
         LSZDDS7VsfEXuz73qTXASU9Xy5CUEnRGsxgc6WscL560JdnhaHPi2Gp1/e9VJFRcGJ/Z
         qtIg==
X-Forwarded-Encrypted: i=1; AL+hErHbc7LoAUwfbpLJJ73636wzbjsvDBwdm93MqtdZqHL5g9KTKNIhX83NJsgJm5Rdcu8Yzf9WlW/4v4DzdzZa@vger.kernel.org
X-Gm-Message-State: APuU4Z+DN/CuUjEaGglIwF/Xgt2eKxxJ4MnswzhF8qABmrekhNE33lAJ
	+bjva0DR6egMoxsmyKHLgtl9E43MOSqKI96PruiFXEUAFWIyPffJAXD/2jRCZ4bzT4W1DoOWho5
	S8ttAngbAhr7A3ruF/RJ4THYDXZZemDHdqllgOrcB7OeN1737+MH3IOYoCX/IcesH1iBl2BIlJr
	/T4RWreQX7DVboJUdHiFs3rShgM9xZC3ESLImI8mZDMNU=
X-Gm-Gg: AZFdTZfsOdv9nQVx6QWuB/IwOkTV+WtJxK9SSA0vbvR2oP+aY582vCAD3OMp3dK30DD
	zYz9MGiFajaQC9qUQwpCZIB7QUomYbKsEG8Eq9nRLpOTXzHHyKA+ifwIv4qPvZp3w192TiLtrjL
	A/k4hvWCEyfAin3M6XmUJtSkE5/CpFFUShm2QnUl97Q3w3BftwNuXOgc0bu+90jWZb+daXod5ep
	+mx7Gs/x/00RwPjV3s/NttFqwJdTZDJKWgtNJz2rP6CX4wVW2dOf/n9EOWR8yGVy3SwexMDPnEa
X-Received: by 2002:a05:620a:460b:b0:93e:d364:c9fe with SMTP id af79cd13be357-949ba9e35a5mr2044448185a.40.1795427929645;
        Mon, 23 Nov 2026 01:58:49 -0800 (PST)
X-Received: by 2002:a05:620a:460b:b0:93e:d364:c9fe with SMTP id
 af79cd13be357-949ba9e35a5mr2044446085a.40.1795427929103; Mon, 23 Nov 2026
 01:58:49 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com> <20261122-camss-fixes-v1-1-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-1-9df4deb87ea2@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:58:38 +0100
X-Gm-Features: Aa3M54pjB5RmCKSYefwLSyicJ-gt5ipfcqA9X3DS5T2YdO6q68sWSibjlfXkpLE
Message-ID: <CAFEp6-3dHDoXPLGxHRQYHWjhd8dsBT3LMTNkw6NVE8N6FPPETg@mail.gmail.com>
Subject: Re: [PATCH 1/5] media: qcom: camss: vfe-17x: check status1 for RDI
 SOF interrupts
To: robertijtsma@gmail.com
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: NXt-T8ev7TwUhSfSTitAdtI99KoSDe2V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfX3YyvdzKGh/gL
 7NmMUFqmjyNFdLoR7kUFvVG7oyTRB2hLnZiPV0H6JIuL8LSfuk9wplEX6YujCFhxI/m/jqLZXCr
 kniY+46/1NrRrITfM0YYe0vrl3sRl7WDR+SJ4Yy7pAnI4WbzEq8yW7s1raNIAcrcpp3WSYGrEtF
 Ag55Oq1FIFvF9hMq1xHiCQsHEGWaw3hDtbcQI0aq1n61whTt1nskgIm4RZj1z5EvDQD+PDMN7Kn
 SZjZbv3uVO/YGrlnjCgEd4BBratdzP1PJjrX7UcImi9xIiGO1Y9+lvwFHTTF8/XagABCT7vMhNi
 OlgL3o+yqKkAceWP3+5Y4JQvVYn9u89x7REo5BYJGkIhB7+qU1oApnpxL8Nru6Wdafhdtf1hEHa
 h7R/+12CaCWkwm87Y/XRroSWhPEueWQgf6Q7lTgHPSEf6QIdjdeGnJIZyAjmfsBF+0AtJZoF+fl
 PrgRYwUgnF+Km7DQwgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfX5kI2yWrcaFWz
 KKAm8jxThmZU+GyKSVWjYaFKyuydss0PfP9bAdlG3YefnkegDyXggzhN/ZHzybKfMqrZoukZ/EJ
 gQ3vvRlq4cQaJiMrwNxEdoOCIAyKLuI=
X-Proofpoint-GUID: NXt-T8ev7TwUhSfSTitAdtI99KoSDe2V
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b040e5a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=sKMnfqkBbl02sVv2kPMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230039

On Sun, Nov 22, 2026 at 2:36=E2=80=AFPM Robert Ijtsma via B4 Relay
<devnull+robertijtsma.gmail.com@kernel.org> wrote:
>
> From: Robert Ijtsma <robertijtsma@gmail.com>
>
> In vfe_isr(), STATUS_1_RDI_SOF(i) is a bitmask for VFE_IRQ_STATUS_1
> (status1), not VFE_IRQ_STATUS_0 (status0). Checking status0 instead
> tests the unrelated STATUS_0_IMAGE_COMPOSITE_DONE bits (27..30).
>
> Check status1 against STATUS_1_RDI_SOF(i) as intended.
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version =
Titan 170")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>

The related 'sof' callback is a no-op for vfe_170. Bryan, I guess it's
ok to not consider it for stable/fix.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-vfe-17x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/=
media/platform/qcom/camss/camss-vfe-17x.c
> index 62c2405..502a0d4 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -356,7 +356,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>                         vfe->isr_ops.reg_update(vfe, i);
>
>         for (i =3D VFE_LINE_RDI0; i < vfe->res->line_num; i++)
> -               if (status0 & STATUS_1_RDI_SOF(i))
> +               if (status1 & STATUS_1_RDI_SOF(i))
>                         vfe->isr_ops.sof(vfe, i);
>
>         for (i =3D 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)
>
> --
> 2.56.0
>
>
