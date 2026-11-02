Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793610454;
	b=Aro/0Q65nOMylfTKpNH/5hMBNmLCZWVpk1RIvAis1tSvBRwqs4HArUbajIB8WcsgWovf
	 NhiNSlyav3k4tc0LLkpkxir4WFr6uA8FSRCUox1c7aYV+QWa8I0xJVe8olQxDK3S66Uee
	 Dyxeow0Eutup6a7ZjlchQ6wiAQOoV1L9yIVIfBKefVHtAELenm7BqwCl0m/fhWk5LXY6D
	 2UprF8wfVSEaSGzXGYFoj+4wQDqRkJASpxyN5+WlkwiG/D4J9OZzVpxxpqMqBnc5WURXo
	 doFu1WYFWeZfOEmjCGXxZSxeDE5dgkgKnVLZHrzclvzjMino+2ChdP4xSevbSvlcotA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610454;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=;
	b=RXyp2LMLJ+o+gDMBWNjsz4E37DNWQd7+lX+HjilrQT9ZU/jKNDZlK0hzGL4AXGC+nFVT
	 Um8jxldjeD1L02IvNbSuhhpHJ8tvVG1Z0cONoMBaJbKn0j94ziUdruy1YmhEczawz1bTN
	 00/xWGg5EMUZC+9X/aS2uOfNdrRddINlS7PPzAyj1YgvdBBMbA6vyIX2AadUvY7UPWv7j
	 mjieuQWd0oxkX63saFevFsRMLwj489FhNRlaTP8Hu73S2UdvNSJdYdHa8XG7mTQggWH9z
	 falqvbuCppNW3chuNtR4BzEWJKTaMXYtPH5AOcX2H2xD9TQ7or8GS8xu+GqhLMfPGSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SutbqeKr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="C/4p5whp";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644A8606A338
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 644A8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SutbqeKr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C/4p5whp
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24Cdxk1811590
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=; b=SutbqeKr96Cb63qy
	mpgas1pHXMIBIQkUNjYxJVsH2XgpHVqKrcEFUKYs00zCoWPePw1mV2meAKOQnl2i
	PNxjvu48aZlwg/belftXKaA9RuG3CD6gPm8IIqkbUZvaFVP8j5rmy7P09h/Q+w3c
	Z1WQoo0QFU3DdZ+glswTLKHsj6b+o/urn9ANrPK9oRnOGuggIMrSqKlk4wHjrX0a
	tZe7iloNmb5SjHq036uwayL82mbKVRTJvjaZ9rczAnJ8WmIeD2lLxu/KWsntds+A
	Ta+0wk3wtCHYJHueZOYTQCRc7MoJmUlLuW0TrIYkE+Tg0GiqHhlKaydfyFSwrYtL
	GmY7Qg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rh0e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:07:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so499044885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:07:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793610452; cv=none;
        d=google.com; s=arc-20260327;
        b=sA8llCi4AI4kiXyssJ/WvhxJZTholYVWu8rCAic5O/tH0JnvxCKdB0gBAjnOo+i8TY
         Vq/p/wWwOodx/cDHnAhYMvXvaHDSahqswUYWyaSTVqLtguVkkU5JPr/qzm9Spr2PB2CM
         hH1AT/v6nsHl+mtTrRU9NjaN1Iah/TUxbP4bnKVOrKIaZyaLoU/mlFjQsrMDf67IbRux
         tNrKAh3Tnw9+TUYruXMjzKs4sdFTG9QZNrZwr6UHfV5isKLKrURQcq39pMmalsws8QbA
         A2Y8Rg3UktutNCVOQfPmJnKSR3LjvyajGxS+HEkKQNkV9PVQcsqafKITyGdbfiGaO+cs
         dFow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=;
        fh=+V7/Wy8D/wyLpRhn1N7gnmDhujQpV7b+zXt4yyPHiYA=;
        b=OVMQmIDZrmykfYIV2P5/Nd1FTYyTyLV8KQ5efcYaSbp3uHgPtEjCL4aiHb7ec4XiAl
         KK1VAi+v5L0VR2oQyfxNzA3nJBv03aBm8K2+vS6EWCHtej52t1cgLc0xYi0XEa4rLuQ7
         dp50xblKk7J963itcOe+ySrzEljdxr55MjBwN/p+NSEC6a4tNesOp9Ahs1UKE7OEF2v7
         TeNWQCMIIO4kVGIq/6/A7eR21IfBxBhwZ/CQzWkI1JJQE1CPHjlhWlbrHdIlsPpfo5mV
         mF8Mj/gXHmB1d17OuEnoWGGkg8rrfkPCm56CmVWMxcOkFPoZFD5HqTlUEZpgL6tuTbg7
         griw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610452; x=1794215252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=;
        b=C/4p5whpXmi3JW9ueD2TkaAEp3yJ04QK73r+8JrTZh3q45iXKl+7sBjSVCukW3VKLo
         HRSzyIGXXG9knjJMNjr2CmThlpK9DO3coJWifETL8KaItfdiqWjsSIHwALQyGJE34Zsb
         PyOgpvuQPB/B65lWQaFHddbtCsjWv3GsQ9nP8L038p2JXLHPDGXnamsH6N2c1nihd60v
         WMrodVwJDawdztuY980ZXouZJyOZ5L7DHwpamvyl0wWddlkYYXCXBYycwaRe4fAg+Aa9
         A+wsITo5REBKTv4z6Juxz1v9z/78genoj6apIFYGIY/xWDulvQTGTAeJZVcW3HACnzWA
         06BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610452; x=1794215252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SONysu3rtiNT7LYpY3uzOoN07A0fuvG8d4SbPJMEAw8=;
        b=ATQzT03r1mnGFuaZqQxt/vQ5OavcdIALxPaIwWe/OkGSwsJJMnNzcmZYZPhgPOGlQD
         IG+wP8pfNrjDL5kGkUhrmXfoY4twoDppy9Ebv18Rpf/G2RN1thYUyai00GlGB3MJZ8R9
         2c1/O9NXFLa3f7sYNwCD/VR5lHnGfSDf6vFKe1VSYmmHgU4Z3c9yX0SaVUoR5IpQpato
         HwKIEXpSO2YWG0A10Prn4UrDI+FmvEla5HlnxtmcbB42F+I7o/1W04tW1bNFL60hbxqS
         7sdumhvQYLbxxuwGK/jG2q3hKnrj/KpcILDdyfI+c6kEnPqx1bE2A2ddC/+DmOLd4HZv
         zsKg==
X-Forwarded-Encrypted: i=1; AKwUvByjrgI3mlI3/M5WPEra4Ogk0aGbmto0kWWLgu4VGcXWn5Z8bBnJvBzqPSiB6SPvZ2OlIQ5M2FO91AB1M+LN@vger.kernel.org
X-Gm-Message-State: AFq9FYKL/Xq31qIHTZsUzLz6KC3hBzLKcQ4GOADMTkivgxBH60hXeigp
	yWKNRjZqvGBu7OLT6jr2wS5qL2+8mj6H01s5EEKj2lUzTJj0LzLJamlmNyndb4jiuPlsjDom3WQ
	MVX45/Qio6mC++7ga3SCY/DUTZwc/QzDUnHq39E8FiMhDfNsmYH56q+jMWvG2Q1ExQ0lLyt4SeJ
	lJtqaSGvLSamaR0uaC+kL9dWdg2HwlJHpAgUwt/v6B1SU=
X-Gm-Gg: AYBFou04ylt/P0yhWLfgQXxr0jQYlqLVX1TOzEtgywyAYbJFt6oYDdGEY3ijd2iKCZg
	ncXznvHq9JYUHwwcLm2/izvruLTLERlhky4PTeUZz6G3ODIOO+DBwyrsHGvsHBEVWjcyl9F8KVS
	2z13s4n4W/4EcftVOWfcOrLslxTamGNIbXWK3Zl0Or3wU2LWUUPqRgUhhZz8Pr/yDvW4a/zRkP7
	z9Vw/3YgH0NrwF5QKl4pOTHEk4aFPOzEq8D3f4dPBLfeTYDJD6FakSG3JL0D8EoNlUhyEceRIk=
X-Received: by 2002:a05:620a:72cd:10b0:945:ae36:d318 with SMTP id af79cd13be357-945ae36d4c9mr443313885a.61.1793610452528;
        Mon, 02 Nov 2026 01:07:32 -0800 (PST)
X-Received: by 2002:a05:620a:72cd:10b0:945:ae36:d318 with SMTP id
 af79cd13be357-945ae36d4c9mr443310485a.61.1793610452047; Mon, 02 Nov 2026
 01:07:32 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org> <20261031112203.545319-5-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261031112203.545319-5-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:07:21 +0100
X-Gm-Features: AclHuK8qwpJ4t97NQfYBs_D9ps5xva1LbxOD8GCWXYj_2Vf6LGgnzwQQZn9XolQ
Message-ID: <CAFEp6-1Z1_DivMsaZbX=00tbG-xw5ntqAoe0QKyM4iA8SrfGbQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] media: qcom: camss: tpg: Support TPG hardware version 2.2.0
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: jkzd4Vrn_sBh_xzWCqKOj_9XSBAGalFZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX2yH0XiS+1XPx
 sS0L4Gf70k/yMO8pVYxrgixpw1Wh+pPdJA4bA2FQhWdoAERFdfY/b5uX8T6abwkmxW98p2so1Wf
 LkvsSKrbc92dwndy6uYmdsGgAEoVdiCWR5BA9341YkgHnuLSU9YgAyPnXGBhn+0woP23TFyT4Qq
 7UFdNZ8dZd5tp6ABuvRSXg/clT9QDavrmhgPen9lTrQVqtiVD4Ssiz6wRGq596W1e34iqwOi4X5
 1/g9assDt4pxWYNXO7Ft1csJ4Vc5nwg1EVW4H5addfvMr1wLDmIB8kOkXt1TPkzRdBd7lYVZ9E3
 8Z4D7k/ccI5i5MWPe1pjQj2t2Qeox/AcajmFP48dEs6MjzMVbQNL0HDgkLD06kLkvm1y4TIQ1/e
 r7nKzxsMg+wgi5Touxdkj/SCdSqdnrjZREqWbfZYl20XhCuhNRl59cVvH/RjZl6iVHJ1ehynEwo
 oGe1RnrWcXCzBqvO2+g==
X-Proofpoint-GUID: jkzd4Vrn_sBh_xzWCqKOj_9XSBAGalFZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX4jumswXIcTBi
 kWIRZIdIU49hVFrjUTmCa+hcjxGsK0hXcWgeQIPsgJ4xojivuGbE6+7St8QYq7Dp+0s4KK+Y1Mo
 GdfaEnN7MiCLhk5jD3DRqD3RQOueKwU=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae852d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XBxIerWLAjSjZTh_gn0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On Sat, Oct 31, 2026 at 12:22=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Qualcomm SM8650 CAMSS TPG blocks version 2.2.0 have no test enable bit in
> TPG_CTRL register, test pattern generation is started by a test enable
> command written to TPG_CTRL_CMD register, which is also used to reset
> the TPG. This is the same programming model as the one of TPG hardware
> version 2.3.0 and 2.4.0, hence lower the hardware version down to 2.2.0.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers=
/media/platform/qcom/camss/camss-tpg-gen1.c
> index cabbb2638cf3..a83f9a80c2b6 100644
> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> @@ -22,6 +22,7 @@
>
>  #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
>  #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
> +#define TPG_HW_VER_2_2_0                TPG_HW_VER(2, 2, 0)
>  #define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
>
>  #define TPG_HW_STATUS          0x4
> @@ -170,7 +171,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
>         val =3D FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
>               FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
>
> -       if (tpg->hw_version < TPG_HW_VER_2_4_0) {
> +       if (tpg->hw_version < TPG_HW_VER_2_2_0) {
>                 val |=3D FIELD_PREP(TPG_CTRL_TEST_EN, 1);
>                 writel(val, tpg->base + TPG_CTRL);
>         } else {
> @@ -183,7 +184,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
>
>  static int tpg_reset(struct tpg_device *tpg)
>  {
> -       if (tpg->hw_version < TPG_HW_VER_2_4_0)
> +       if (tpg->hw_version < TPG_HW_VER_2_2_0)
>                 writel(0, tpg->base + TPG_CTRL);
>
>         writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
> --
> 2.53.0
>
