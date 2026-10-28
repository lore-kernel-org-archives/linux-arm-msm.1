Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793155250;
	b=I0zLwo3WNl3WDt4eqYCvWMbFpnL6nNlUzgYGoDzSZFwx9OAmKa2uNXq++hwFUM0sZhJy
	 rXBlQy8p7WAtOum3epgZaxyKIWk+VRkc/WvhuPeQ7Ke9VGHhUbvrZuML+4xEsPBq2U1/D
	 5pHD9MjpbQh03hqa0WLkhdwM5HmCcC/1VlV4A2u1nix6vCIUoAdTR7sP+qFHxuS0Axb2C
	 2aW4Uy09TRhCaE+020r7wwiIE1Jh8y1W4GfiPQV8YqP1iRoO6LDqgM5yHL8jiBUcqh8rM
	 EYnH6LgY4z3yQLuTwQ5j/H+4gzZFQbGVslRlAY06JORhLKQprRxP3PE3I6q+pGAsQCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155250;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=;
	b=PDP5R/cMQ6zJL9wT7teADNv2f3CB8yOpS8r/6ZvoXIS/OCTWvwcXQFZ9PKrlcCaa8rr+
	 q+q225y7leRCGyW1HPQgJWXTMQxBs6B3uvZo2StR1ZuSGBjNQoLU7OhJjUAmx/qdyTDsn
	 Zj51G27QP7FVynmw1JF+O+cEtG+bzsdFQ8pjaoYCOlqPRy/OHz85y+9xdL+0cync/Nmnp
	 1KtNut8k0qPrariX/zbIiQWq+riD4wdI4F2qRa/tdREMpzNxQ0iDrK2TGTTRiwXKbyJw8
	 404FKl04Fmw9fFu9Td9oOd5yI60PDopNOsN6odQhE/sCU7GdpxFvWibiqakr2qKarwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MP0jeGoj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HNjjMIUL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8043606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 02:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8043606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MP0jeGoj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HNjjMIUL
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0j5uH3780564
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 02:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=; b=MP0jeGojr59swceb
	S29QoMx2oPgTkVTBRpSWG0EljdUAEgQz3Ms/n+K/GyOnZfgFdIwcBI+Pfz8ah73P
	HbNoFuCrRwesYx7sNi9cP1Scj7G+sY5f1nAO9vKv713tjigijZXvFa9iEqqfpell
	Atv7cLbpPx4fwKZxgEfRZrkzI0onxbrOnrCml7JaZ1O+iBzHbQF+nlfJXsudH5h5
	m+83gfcpFtIZjHS2HKLhQ+v5y9oYqdj0IbEhfYDEjh9TEw1SFI1a2FlYEVdLjpA0
	EK7FmTY36QHBJS/EcrfXXLJE04xG3tcyDnH1fVKXoNbFcD8LDLO69JWFqqKkhhDM
	BmH9cg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6724g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 02:40:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88c768886a6so425031b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 19:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793155248; cv=none;
        d=google.com; s=arc-20260327;
        b=inVCr+u3Ej0CbhvxVsN62sC7RgbxAkLsVYEi3AwSuRh7mbVah6ZZSOsv4XhzTxWmD2
         fYPrQVk4ByWzNji+orCWA/ktqQNGqeHuGMSJT9X/5/CmOCDGJh+R0rWvBEsWacm6N6sk
         hsodCf3q5OyNB3b56DK8enFGt302V3QQ8L0Ht3+Vd6oDHkoikPrx+U46wDD54B0PhrF3
         qmUpjsN4mLuSHpbZzXuFhVLFbvD9rLWsOYowwEZbVdkmnQGe7/Cv1soUt8WbUt2lYhPq
         uqCP+wr7hwQLmk7TtPTT1UK6fd8whVInqJBhZKXXJHxhRgm/0NWBqMvYwr6hkSta1WrY
         HceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=;
        fh=yS+QGVK94mJM2OsgJqdY+wANGnUOc6xCuU7r5NT37HY=;
        b=OctldNnZ7Ss5CJR5i+2z6nfMdSWTAyskn7hPHO+/vlyW4SYI7G8aD6YLSWp9fB1Zj+
         bhclGgywSNGQzcvjVOhgC0BEIHUek0PnpHeUzEurVNwJOWOEEHTy3zDRXRZ3bLUW45hr
         K3lYqxkwHmxifIk6ADkrzTiKqIZHorZDwmVfHHktAp8plSd+iN4Ru/i+LTMiWu7Fpurg
         70PkhBxhXV31WY1gvtnxmNboZRvJwzgqECV0GHo+OfVYAEbx0riKaRBt+w8IBVmzpzLK
         xT/wr+DPPSbj9T1Mc986xHRRJ4Per49/z9yskNkYe6LTZHdfUAtOkbUqTOz9V33+535u
         lsxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793155248; x=1793760048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=;
        b=HNjjMIULiyUJ+giAF1chQ8RVnFuhvtHUYiPWm3bVvnAgSjjy6YblwLsMSL+tpGFt9h
         QSjMkUs4JrT1IHSxSK60/Sou//uI9566SUhnF2TR5xtsEagh9r7fuAcWUg8JeG2/qyjd
         qj9BOvmqcpg8DyCV/U2nHIuZBBPW1ptlTSSaADaE6+el+BImpjPWX3WfvwHYftHQKyvM
         NDVs/Zbuu0lK4o4MW6yQnQVwz+jgeVDE0DBKRexyexbVEYuLv/Cd7xw2T8BRSb2a7qj4
         AV45z9JI0N3kwHkgOClRiaOMjxH6fLyKEZg8sTO09gMXViY7riGRRRMJm/pZkR+8cTxn
         PWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155248; x=1793760048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyapIoiDrulIZMwr+P6ZYU1uplgJQ7dquE4RM5kdWJY=;
        b=dyPkUKtbjO/maPQtDW1ah/FIhuIeYBoq9bnyN11GDuMoKTj+zVbZQ2t8Gyv8BZYUfa
         3JVI7d1I5dekfv1c1TNFftlF4Auk99Vdqxpw753PW7XebqZuJOfv9hzXGlAr3XczCk1S
         zzYdEv7Cd4nrCza6BIIjvD4DT3X324/4GnLipqYguFDE8Ap3n41t4VbLhsWVXakcoJRq
         WHa7sBSjT7dIkhx3cm11wfm6VoMC0o0DDnl0A1R1F8En0UghiZQYQ5JHS/0jHA9OLd/d
         0PdIn3JQBullroFhogDYbsbwDylO00Bsa1gxP+vTqPnsD69zS5hC86ksOterpeSz14Ch
         SWFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzBVQxqH24Zoq2ESioWAOTb2jo+ZpvcrzUVJ0nZdkvU8t9/pCdyo1wnJHoiPGGJgQzQbHCvhuFxa6lo4uh@vger.kernel.org
X-Gm-Message-State: AFq9FYKiADGMQWkgE4syPQMDJwI/IPp7aU7Y52vGrwZpN7U81N1EnP/F
	D7nNAJwatAZsVt+WF1Rd8RvdUzDGtp1oox3Pqshu+wnFGyowBnMzKYw1q/bMo6zvMIySB9WFr5q
	Z2xz3U+uiKR3lVChUqWOhz9Sc0R4bvSAmTUDkwW4Xc3B1MDn/waADm1Z1Bf0lQVn7Y/OVzA+wuW
	KUkCXKH+LXvOKT/ysogzh/y9WMGvtHVxgSutKE/jEA8nY=
X-Gm-Gg: AYBFou0CKEHZag45giw8Tz0jOPf3uBNcB8iZfZw0UCpaszwEMqo4VmllqSl5ZPXsUSp
	FzywqgBI4xQtwjJQpbsjPf2ok6y3IYWKPO7TvG8OMhDyuNQjxU1kPw2SicKtAWYnxO3q82SQIeM
	PnAyO6eqeX8DC6tmU5eewhwMW6OhWmrNlK3xQDq77zkDn+nso5KKqhJQZLwg==
X-Received: by 2002:a05:6a21:6001:b0:3dd:a195:fa1d with SMTP id adf61e73a8af0-3e9023e1c1emr828634637.66.1793155247570;
        Tue, 27 Oct 2026 19:40:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:6001:b0:3dd:a195:fa1d with SMTP id
 adf61e73a8af0-3e9023e1c1emr828612637.66.1793155247093; Tue, 27 Oct 2026
 19:40:47 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com> <0dd1f699-6e08-4e9c-bf92-187edf9904c7@oss.qualcomm.com>
In-Reply-To: <0dd1f699-6e08-4e9c-bf92-187edf9904c7@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 10:40:35 +0800
X-Gm-Features: AclHuK9R4i_-p9NyTVXeDuSZ-1inIa2D1mlRB5RBblU7VSo9hG-gWj7dTK6LuCw
Message-ID: <CAFkd8hsBqFQcXi66wWsZhRt7Sm29jVL0vZ1aW=NR3kwjtcsQUg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM formats
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ULflRydpl1IciFxQZTXCWnP35WlckFfD
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae160b0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=1tmr-2Z58gs6IC_Pm1AA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAxMCBTYWx0ZWRfXyzbh/vD7Y3W3
 JOE1+gNQNG2Z9ptx/Q6cELIJpgPLZHdZhvYpekKBEHXeXijifsa9MpHw7mvWPxfB8PzR0/FGT/w
 jmjEQ+MubkmGIGdzCDK972GrM/ULLUU=
X-Proofpoint-GUID: ULflRydpl1IciFxQZTXCWnP35WlckFfD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAxMCBTYWx0ZWRfX7nhP182pcjXH
 JJcwtc+aD40hk1xuCc4Ey+j1T09mdSkSrM8Ae6I+gpgm3iBBHYT0fsV9CHbG4Bfja+HhL9YbJSI
 2plGmEFv5T1YNJ9bs5T52fcUDmrI0mHHJA+lwkj+6oB5z6BbZMhFHr1dZjYU+av9hw4A31yoRVs
 tvXQiTUI9eR/1x8KnBg7Xdmn90dxhKTjLI+rS4o8J6zdiLaHpMaxT1nyUQ65O+IHv9DYcR+5mv7
 U6S+b0N7p2neuF8FKTdn96fj/Ic3T+no3AN4H8tgR2my1mCmEbnOBdfvhNId4oQRPWXnVo4Lvm7
 K3ttf5DLIWb5zapQ2tqpvt4EA4uwW2Db7iLJBgv99WXro45EM1hx8tMeRarGedGgF8+Hfov7sUU
 O9fbD549Lxs0sxIrd/FQjApSF51tXebrgBpFr3jb66UJOVJiAGKte7z3kX+6pbmJDr8XXUOWBei
 +EFcK/6lyPXqdxw83LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280010

On Tue, Oct 27, 2026 at 9:47=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> On 10/26/26 8:25 AM, Zhangfei Gao wrote:
> > AudioReach currently rejects PCM streams with more than four channels i=
n
> > the PCM and shared-memory media format paths.
> bit more context would help, why you need it now?

Sure

>
> >
> > Reuse q6dsp_map_channels() to support multichannel PCM formats.
> >
> > Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> > ---
> >
> > v2: reuse q6dsp_map_channels
> >
> >  sound/soc/qcom/qdsp6/audioreach.c       | 26 -------------------------
> >  sound/soc/qcom/qdsp6/audioreach.h       |  1 -
> >  sound/soc/qcom/qdsp6/q6apm-dai.c        | 12 +++++++++---
> >  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  9 +++++++--
> >  4 files changed, 16 insertions(+), 32 deletions(-)
> >
> > diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/a=
udioreach.c
> > index d2dc5d37bccf..33161523c7da 100644
> > --- a/sound/soc/qcom/qdsp6/audioreach.c
> > +++ b/sound/soc/qcom/qdsp6/audioreach.c
> > @@ -306,22 +306,6 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, u=
int32_t opcode, uint32_t token
> >  }
> >  EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
> >
> > -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channe=
ls)
> > -{
> > -     if (num_channels =3D=3D 1) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -     } else if (num_channels =3D=3D 2) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -     } else if (num_channels =3D=3D 4) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -             ch_map[2] =3D  PCM_CHANNEL_LS;
> > -             ch_map[3] =3D  PCM_CHANNEL_RS;
> > -     }
> > -}
> > -EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
> > -
> while you at this, please remove AR_PCM_MAX_NUM_CHANNEL too.

Good idea,
Will reuse PCM_MAX_NUM_CHANNEL to replace AR_PCM_MAX_NUM_CHANNEL
>
> Other than that it looks good to me.
>
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>

Thanks
