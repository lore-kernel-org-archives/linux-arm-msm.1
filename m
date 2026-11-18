Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033274;
	b=VUbSQuHQ46XVvmqvHRmQApiaJE/NhB6HjS/yaJ5BUE/D9e3j0eW1hi6jrFNwRgIfAQ7U
	 VUOZflH3CsiSQDyjQozTdSGXvyNDHF2JV8NauAyv5C8Fj1QQ0mH2JlAlFvhtjlZFscbdt
	 o/5G0tROStzLJkWtf1CxDX1DfQfADrCDIHkuhr+FKg7rXs7KYPSUsppxxVFecNJBi3qW2
	 fdavRvNclzpTFaUnCcTcBlvSpUJvBpklJy3tX3SUd5TIvuqENYrahchCw7e0PiF480EZ9
	 5aoLsT3PtROFO3WTIbwj8t3g3ZizCvO7XvUpeUUUorZilUzM4rWnPcmu9KXvCJLlHoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
	b=NQ9sXS6sP9dP2IzYkUODouIulml6qQnEBjzHpIVIe3Of8XfwT+uG0kN82Z+rMo9YftIA
	 Bzks0jk/QqutcC7WM+1sR27YJgpYNXoOb3USzXui5c2aNo4RpVn2nGKqCHu+/xwZ1Bx4g
	 CdqqqpQiHndvzlWOWmqTAJUZWTejiYVb82o/LhU4U+m2l3sWSOSkiXecE3kLji1HhvK8I
	 SMvlKnJs6CszFsyxL0yZ2nYVfCwbdYMYO3mrIfwaDBmn2VmoyZCJ30kKV9f3sojf8Xva8
	 wF+CHaosxeRMzQIFGGL0w0pbwOXe8P3CC8+lEZbj72Do6IbWIsKXkq9DWlk6iHfeW5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpAEJXdc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KCJfUviT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCECA606A32F
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 20:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCECA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpAEJXdc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KCJfUviT
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJMUpO1175089
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 20:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=; b=dpAEJXdcPnatspnA
	S07G/YQ2IRII6ORHQHfRa4t6sTEhkDMP8EzaOYLCCYd8MPoJ7T0kqoWsDfrOtmk7
	6HRVGsbhPx4SZZdnzsxpyOtL5cuXMSV+umJcz0xfn8WFdZfa0jLgci+cgiVjv1dX
	uNPiWEqeZgZuZROeXXlT5I5SmOHz03O4hwfL83+9CzAJ4HQyZotN7hm4OpZez4Cm
	41gcZBYfOp3+UKmBo54LFxe951vllosKAzrmMLMrDNPOcm1M5fqAhLCYknC7k9bx
	C7N2U+d/g43036aqxGdaJYnQ9bjtXCRAngwotBRdDQ3P2cTxjx5zR1NZY92q6SZb
	H/MGDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9p0t19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 20:21:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so316972285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795033272; cv=none;
        d=google.com; s=arc-20260327;
        b=dH2CMMCMkh2mgc2nAv18AXxxugouofDX7noTusOuHbo4RVGYT5N6/UEROYTW78+T1U
         Wu95sIusUDxXfI0BmxMO+vKdPqXWtG/VgNc0hPK7pEN4Xb4YP5OLHhleDhsx7Mjg9dtj
         0fKoiqunGZFdQrJ6rmxczy6wOlxRa0tevZz49oSPB5Zt9n2O51SAkbYOUelnnoEwW6Hz
         alAKi55bq8fMZwXN2sK9AKofrklGQ77pxvUBZYElJt8OxhWmBwnpxL59/04OMHKcXpbv
         W2FjN6xKGw970yzGEz6lCLPXOT7RlES3t5NaPGO9uu2TqUGzDp+veLFFDvxpe5/ZL+HD
         7v0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
        fh=nfnXDU0UrHelqlaEt+YNoMN9IqzGmULRhXahf8J5OmA=;
        b=FMXMSyanYzGVZ85y+DsX1EUlZWqsjvHtGtOoU/Nrm69Uw5EzbqVZawJb0giB0STfao
         OLWIolN+ujhPGxHBIkqPV50Yz2JnPR+rUfDWOKTG+S4hzI2dY5I7u2f+j4b7n7z/9kL5
         xbDOdjS8M9ISuvzqY6GP46wcpo0ej3V0Ql0rRmpz97GPZMz2qHjOprgXQ6APionjxcz+
         HR2D0IbU/hi9nHlzbD/R+eWx4CuXxIWtZ/YEVP11m9zMqFVsXLyNDiGs3TWPI6d2BFKB
         rtKtOnLBmBNsi4aODJQiJ085WGuCOqGIQ7FiHOGwPxqsUFFPyq3IsnjhH8qGOyvAVZ6S
         L4KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795033272; x=1795638072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
        b=KCJfUviTRuV0Z7GTWfJz8XO/IdaEFc/kZo7ZFTnhZ/1KdZO7yn8/wBSX339eyWgWSF
         glGlX4CU8lIRL3Hl4kB0HtpSekhmcoHmfiNhCcjenifEds5OwxfvsRSkMlsI0g/7V8nE
         zAQoeSGVX7/oHMJ/l54qXNkkywvWnc7J+j+HHPJOSSOL2lkHcM4UJgTyLh9i5CkPQ4SM
         ZoE9frnyTeBUxy7ppoE0InR7S4C6d372/gp+S6lb9rpeQM31tOlutCjHpd6MI1+okeA/
         YibCvUyoAYFB4JgIg8udrHt0VGmja1RQw4L7EUnWfFsX2dp1w0K6jk+3NCh6ycMYnor9
         8VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033272; x=1795638072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhqPn/ICV8v/KU7lWAnokH2D84rMdKB99wdgjfIsDhg=;
        b=CJ/dSx4WIbBWCykxgRAGZ4nEdD19i4j3aJBCNoXbx2VIqP9Fi0vKxOTQ3NKpPsNu5R
         Y0KYvrGGOj003Am5Q/5C6LwIdXcmIfKb58UEI5Yb8ntKf2Jj0qScwPvDkyz/prhAgDN5
         GsIVw9q6cZKjtSXTPgUJ3TG6DjqREl69QUtkHn34o5sPsO8pgfFD0qynPfo6XLWuNysd
         F6qwaSApPfaTOLWhxZY8l+iqphHZc+HJjTeWSGX6b1K210Od4qPKo0gRHLVt3J6qCSml
         DRZyP9CkeFQF7J0/cObe31BX3/Sco9aEBKm7S/oNG3inNhTPQngA6PBa/ZrcQh4Jhw4Q
         OtDw==
X-Forwarded-Encrypted: i=1; AL+hErGh7E43/hABU6qYL6PPr3CZ3eObL8M2p1eKx9lQdaH+YWtlRn++Bga1FLm/wahJcmQbChlKFe0tvoo0XlA9@vger.kernel.org
X-Gm-Message-State: APuU4Z8hibHBU0MskoqkARL/BZ92iiEhcT+qJ46yDjkTSEPBiME+5ANp
	OZo7V0mucFIgWbpxlpWc2AMuOfv0odvlrQihRY2PGyjJ6XOp8PPby6cbSQw3XQ2jZMJTalfqLcG
	JnSsUoOe70P5JGHpsMS7LTIOAn0tH4OLd5Vq0KzBv32E2NDTe3Ok3ydAgVSHyhNMzOKrJsrH2xw
	HRQ9pNhMuUA15x7Msd0VaK/qOiMP3GLw/AKeW8M83qzc4=
X-Gm-Gg: AYBFou2ko2wh4UitMOZxxTs3N4ZUu9uW/MB0zwzEdW/GzKQ+pjNY1b0dGU8oNb0TS81
	e/xtdwP8IICjYmDIHf6j1W8WwFOzwkmCNrf4IARF1STDKHPrnccqZUiB0X4N59/ptNOKoXYp46D
	X5TbxyfzA34SNYj/caPMyoYNQ52h+b9Fut1lXlhmVaBjhThXw3Xl7AdgiSrRacg3fuG4ej4tovZ
	d/sixxqIeFT7eqOxL2zpYoCGI3QmTzTbANdSDiwqltRL4jnDG+btxEcbBUF+oeK/BwgWuTau6A=
X-Received: by 2002:a05:620a:2b92:b0:93f:3e45:a419 with SMTP id af79cd13be357-949995b362fmr665351285a.38.1795033271745;
        Wed, 18 Nov 2026 12:21:11 -0800 (PST)
X-Received: by 2002:a05:620a:2b92:b0:93f:3e45:a419 with SMTP id
 af79cd13be357-949995b362fmr665343785a.38.1795033270937; Wed, 18 Nov 2026
 12:21:10 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:20:59 +0100
X-Gm-Features: AclHuK-LczRUNo-ZjKC-18fa_PbQ7l34X57L0f_tADLZJQVkzCFWJzXtV3xPheA
Message-ID: <CAFEp6-0sYs0mEm+4E_zEgXcSjoYKwtW_YJSa601gb=717Gec4A@mail.gmail.com>
Subject: Re: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
To: arapaille@atlr-engineering.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: DSOr72ZKpYWpsTVg8kJ1tqm-DqDMfFBD
X-Authority-Analysis: v=2.4 cv=LooHWXdc c=1 sm=1 tr=0 ts=6afe08b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8
 a=cZ8Ya61OWEQOVQFXRIkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX99enW7N++do0
 7EVuUpkJKjj1KwA09Vx105kd3+Qirw8Jpvg53R7zxI8FOwW9XZs91W2vPwTXSgY8PWSbshJBc93
 e407Vcvp28RKUEwI8nLy3hgrtIFOEuSdFA1GTFV/GcRSKIxrHdo1xaDYpfYXRo7a3WYF3OuALZR
 Ny1iPKS8V9z+nBG5EP10JQWgQkaZOPz8TDn9K7GPo3mBpTsdWDQps9ju8wTr9CByuvHwIm0tB+E
 Y/AzQeotPyY+fvpdxz939aZ90LXi3gkN0m81hT2WKrvkeuh0HOoyW0xsh2dHsk2aN+mZ6qRy6sq
 N07gJYDWins2bYJf2A8u2AETY8PgvY2O89ZkPJFfqYFQjUXZUX+IKaGW9bFiMFMabkjug1DSqwQ
 T5xHOS2TXC/vhN2aKeQRUslnEFme+HINsEnnKV79rrIKaxdxO43sU5m5dELoTTNqe1Z4wUirfzg
 Qd/bcSjCqOymercPaEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfXyDnF4fRv9PU6
 KETrc3b4UvkW1Tyl9E+t0TVwBRDw6swXtdF+ZB3Qt5uG28aUNuqkspLvrlC1u2hC+RXCOSR5kkk
 yoratFrkXuEVqOD4qCDvEqw7dd3vlcc=
X-Proofpoint-GUID: DSOr72ZKpYWpsTVg8kJ1tqm-DqDMfFBD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077

On Wed, Nov 18, 2026 at 3:58=E2=80=AFPM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> Forcing IRQF_TRIGGER_HIGH over the DT type makes the re-probe after a WCN=
SS
> restart fail ("type mismatch, failed to map hwirq"). Rely on the DT, as
> commit 1ee6c5abebd3 ("ath10k: do not enforce interrupt trigger type") did=
.

Can you explain why it fails? Is the fix at the right layer here?

>
> Fixes: 8e84c2582169 ("wcn36xx: mac80211 driver for Qualcomm WCN3660/WCN36=
80 hardware")
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  drivers/net/wireless/ath/wcn36xx/dxe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireles=
s/ath/wcn36xx/dxe.c
> index 801f1218ef..7852f71368 100644
> --- a/drivers/net/wireless/ath/wcn36xx/dxe.c
> +++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
> @@ -552,14 +552,14 @@ static int wcn36xx_dxe_request_irqs(struct wcn36xx =
*wcn)
>  {
>         int ret;
>
> -       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete,
> -                         IRQF_TRIGGER_HIGH, "wcn36xx_tx", wcn);
> +       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete, 0,
> +                         "wcn36xx_tx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc tx irq\n");
>                 goto out_err;
>         }
>
> -       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, IRQF_TRIGG=
ER_HIGH,
> +       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, 0,
>                           "wcn36xx_rx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc rx irq\n");
>
> --
> 2.43.0
>
>
