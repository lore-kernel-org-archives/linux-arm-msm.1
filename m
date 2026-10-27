Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793097096;
	b=gtQq3pHfQOETWcPu4UaJfp6YCLAWtMhX3pFlT4u3vQIMFGp3aAIfYTvNpnvCFUo9xKmS
	 z/DLe2ibrka6DrjqtCZLBoarTSAP4KwLrwEfjj+pUG1tyNOt8bSfnnlRjjPEIQu78aBfv
	 bjcrflOBTJhLlGVIKgAaoX9rLYD458AP2J8C7PHGLvT5U/QZQXQH8BV0JyY+5afktjuwx
	 smRp693Qeu3FxQNfdmcTt+SUVKwhPD67R0f1+pUnPOyATvk8vJyrFB1mpcC4Ao4HqocNl
	 HnQtQbYQVZu1VkU0aCKRwZhTooyGTcRSpHN7OKWj5LQ7e0Ggi9SV6fRhljpqnipDXRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Vn4pKcdJpH4mb0SDRmgSSuNabQ9IF5FHcbnz/6As7I8=;
	b=MtEUlWa2Rwf1OisGqpw+Q+v9eyBv9UUpXxMG5OfYGcTc5R12UNTvuRtcs7vhg4fP+VJl
	 asjF0BPsCaY16bc6/guRvuskxIPZeoctlmMwOUU2+JCdqqzdNCG9gu5Nbh9mFcXFwfacw
	 jYRXiKVwjBUnMOeIZQMCtmulM5L94x86RwNf62SfJ3LE/uzjaAJfKUw37xHgv2h4mwr9O
	 1A2+u86moxLsOaK/dp+8a07ladbdSAhR03sqO7p+jaKqSrecRf9lxTfnrIxrBVjkOvCgN
	 nPI/PjRqASQ1TIltpzDUAjY/qclDEkiByU15jKo1nDdhCEnhxd4iuOLw42Z53x2lWeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnGtiMhh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OeCtqmRY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D810606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D810606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnGtiMhh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OeCtqmRY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gLxw2747296
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vn4pKcdJpH4mb0SDRmgSSuNabQ9IF5FHcbnz/6As7I8=; b=WnGtiMhhfsYTl8cu
	sESZNGF9KAb5/H9TX4GjXn2H9xmokH3MmRiFGZVOGWI5dVlPYbKeq7wowygry0E2
	bbvpLEu2Wl7TT0CuDDiCh0sBG5oERy0/TLgAzq6Oi6jhrVgXGtXUUXBbA0QSFp7A
	fQngbtRt8WZb9k3FG2j+KqXN2JnH2ZpSj+cBOM9foKYwx4Fui6+El9/btIoAhxiI
	u1y+cY7zRIcKLgcUFPZ6qpyTaA40S+nJjDEoTkKpMOHNWq7J6drOPD0A/YoYbwhc
	jDozwtJpXKpB1YQF++61E7wXNIuD/0TVmEKsz4LGs/zIWxnvwpk8FeCfvLmNLnJ6
	Ofw7QQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3dajsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:31:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so694338985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 03:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793097094; cv=none;
        d=google.com; s=arc-20260327;
        b=MprXiPHZlvJ0+JTkMCrqr7g6WbbRwfIIkbhpeQmG7Tia2pUL6FMF/ywAT/FalbjiYe
         qJJN9UrhLC2M8s2R8sBz9dw7Via1jpd4BIIiv5hxaX6t5uXz3Dqrg96zkhnUjcdvN8MO
         9NCFqVoCTPZj6SrSukjlUt24G7IFEvrYg0Hl9xDmLSsgdN+OsC5C+ce6PgKjGzntcH/h
         Imkk/3sZ27PoWj9QYg2P6LgmQ1U+OODH2d+EJ/i/eCsMyJcyM9A5lBZfLslxx61CDm3B
         40LTlwZDbUmXfUqYAhEIds6IC5NgWLTdsoCtIPHC3TLwpBTRqU6lsfVxSHJkwrWl362E
         8jqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vn4pKcdJpH4mb0SDRmgSSuNabQ9IF5FHcbnz/6As7I8=;
        fh=FtWJGmHTIQiP27t2xzMLfo/w3qpkwAMXlA9mI+qnop8=;
        b=YFTwa7CLHmYT0Rlm65LUQ3R/kCuWC1Kbprb0Tm0VQgObEJ3WHv3InDckN/jJa0dLKZ
         A/NT2YZHgS7gJuzkYpLOwDSR9TUXF/wxJLEbiDjPUyJCmQbuEiJ3yz7ctCHqVgoZIoZb
         FVMzSaLYBjxBXJQYgfQpn71oK7LBk9MqFBZQvX2enp7YXwcjmMa8s9qU+yjxKjnaIITq
         Yv0Rm6EflXIA/vood4fe5KLloCGDcSyVEySAHDkZxHXnWhNPzK5f4wufzdz8GW7lpZBd
         qmytev1Hmx32WpYpzOnCFFu83ySEmWsMlbYUYR/ojLRA6kp7e3Z94f6GGK9H8ZI1Z0Gs
         fvzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793097094; x=1793701894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vn4pKcdJpH4mb0SDRmgSSuNabQ9IF5FHcbnz/6As7I8=;
        b=OeCtqmRYWGueC6vZg9K0AeSpo2DBtglbgdWvU4HV9dl3wTl39ErWSO/oIPoBmBtueC
         8oaSn5zg/IalQEaHSFzGVSqSSyEiqxxdWri3iNUeMbiLSkKzPAs2hnwXI+Xx6T7zE18t
         fn8C9iOLnzh+MkmdB0Nvr+4nDpvoX9TkQkNARCkZqNfwsN3UaVG21WCerTp9CukeRlKI
         VpMT9yPZuZyvyD8qFHfVGSB5NRXWDwnGtRJKaHV4P5c2cSW5MM4EivBymkVP3mMlVPno
         DTZgwlD0I5faiXvBAWLDXwpRxE02J5jo+Z2Pd4yudizOjGcXwlrih67QH4DOgbYLs4kk
         tB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097094; x=1793701894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vn4pKcdJpH4mb0SDRmgSSuNabQ9IF5FHcbnz/6As7I8=;
        b=qNyi00129HfcRQ7iEzC8JOOM1lfh235N312/mOTaSRQI1B3DTP31V7EMLSy3c0ibgQ
         zol3N+hZYpiVgnJNZx0KdeFOU5ATu4ZT4mYb9/aOUNB8MQBvP53BtfpI0lcvc1JuEX1e
         UvJZooFVbeVgYwOzKCPWCHlobnruc/lwanVkKSnZePpwuljOtaUeo2898iNVSsO23V6C
         X6544+O3XeTvRz6MRVKd+7n0BuDFvm5LOZ2uzep8mA6mBfoi/IgHc0rF9SgRVHbaOVGo
         B2aFtLyrodnu24gkfdXwPBCFVBoILkyvftxp2U/f/9AzSTbcLiUmeUCoXStGqflnEdL2
         twnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzW40Iakf3L9DVPxc3xWSmhF6N8h+6doQCGcBoaM/6bNFRzfWf/IbhhpnwxgTBAIgcTWVEt0FSSSI3PiFYn@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2EzrEp6R/LKMmnebkr2nHuYg8eW5p6MdBTTMwynwHtFjFSYXm
	1RGWtXVBdGhACAAHrj6JwJ+I21A2nD6l+VCenUwtz9F0qwCyk/229PG+U6ocCcR4AXPRLFHJ2L+
	6YGqhqumGWCj29Sjk7ceGA1oyuX9+agYk/qZ1yXjb6ujOvmo51oCDiERJeo+IrRuDmu9b2ClRFO
	Y8b67Mxhdgfn4tB4+RSugtTrqMtwobllZ8sOEW32EOwKw=
X-Gm-Gg: AYBFou1dOqwevoRnzH7dQWKwG6TRPyenDyTGYfomQizdi9T65j1K7R4W7IAqS/coQWS
	LnamCX1cD1S3/IMWOc3IGc/uSEJAsg0I2WRTNexWtip2v5L4drkaxBg+Vp1yLSfI96yv3g04tCO
	nz9kEXg79g0mNyqcbcY+EqML6NWZV0pf3Kb0YbKoR9hH3auFldf+Xuw1+vNvqFWa7QI9261z7M1
	CH7xVNfE6ugLkLDwHO9H7zp+VPEss1EThwXtTfeebCRnq1dIBV+MvvhKqXf79g3wxaqURa8lpbL
	DXRLN1Q3iH7OM4VBrhUZesEPNYZn
X-Received: by 2002:a05:620a:4444:b0:93f:2b65:f47 with SMTP id af79cd13be357-940ef8fce6amr1393811585a.25.1793097094420;
        Tue, 27 Oct 2026 03:31:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4444:b0:93f:2b65:f47 with SMTP id
 af79cd13be357-940ef8fce6amr1393808285a.25.1793097093915; Tue, 27 Oct 2026
 03:31:33 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023163057.775917-1-vz@kernel.org> <20261023163057.775917-5-vz@kernel.org>
 <CAFEp6-03Kqxya74Cd+hgueZ0D4xAcYNOx_R1sNqdMu2JrMBynw@mail.gmail.com>
 <378094fb-5f7f-42c6-a91f-158e2083a6cb@kernel.org> <CAFEp6-3XTotgkOKRACGLT91wUw30CgFB=44RtHnXfA6cOF7bVA@mail.gmail.com>
 <0d25a732-ccd5-4a7b-9809-93e67899b4e7@kernel.org>
In-Reply-To: <0d25a732-ccd5-4a7b-9809-93e67899b4e7@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:31:21 +0100
X-Gm-Features: AclHuK-yJKxj98HRE0igMAKWG_vr97ZSpokaUXsIJ2z8z0rJILNsgN0-4gJfnBY
Message-ID: <CAFEp6-1fAAfG+dMsS+bK4KDjX795OXhWBSrkWZKzM4P9r7+m1g@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm8450: Add CAMSS device tree node
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MSBTYWx0ZWRfX4vURzWeVhXUS
 TvtMUSQPyPBwx85MSpgfkB+oDWBY9nPn4RQc+H2PhDYtDl6KIhnIc8yN14m/j5TY+PsGXGiciWA
 efm7RV/cQeYgMv9UJqHfmIKK85nh6KQ=
X-Proofpoint-GUID: 6Qt5lH_kruOoQQhU2K3-MHZTF0Pxl8Tw
X-Proofpoint-ORIG-GUID: 6Qt5lH_kruOoQQhU2K3-MHZTF0Pxl8Tw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MSBTYWx0ZWRfX6wk1Za0JLO+d
 x45obrCusJ5uSTK13J0ihc1p7pSX9f2rpR3I6PvYJrFBISXUljoZIAvRTNF8TydE//kgqxGjdv8
 p1ktvAUPcUAoBXgqfMVqUQ+oMJbpRHVDizt3Baf7a7Vy+h0+mri+16zDBSOzFSTt6sTdcgMeTWY
 VSIuCM7ycc2a2bZsqeT6aQUgapxBMUHMUeSlPCIMM139+fxgymUHSoYa97lKGYN3yl0+KVez7RG
 2KlyVADxJH55GqAZwp2BAH4yQFa9sI3ZvDUnXSpVeIjt8PIkQn3jahpVZkVKOnkK/aYgF5GjHmd
 Ztw8wR7vkgfQ+iw7IgBKkKA3uyjrglCfl1cPzchDAtkE86gCM2yLXQxyXpkQz9lYtiUQ5mNIeOK
 MtI04NS9IyoNRLjFXqpQvkhb/qtLwfZiXujuPpn5Tl7lMlT4manQl4FwVGovxztVadK3/qypl2G
 Z0R19Am2519i7mkxgCg==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae07d87 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=b2IhrCKv5-cLQgD9YOsA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270041

Hi Vlad,


On Tue, Oct 27, 2026 at 10:54=E2=80=AFAM Vladimir Zapolskiy <vz@kernel.org>=
 wrote:
>
> On 10/27/26 11:07, Loic Poulain wrote:
> > On Mon, Oct 26, 2026 at 11:39=E2=80=AFPM Vladimir Zapolskiy <vz@kernel.=
org> wrote:
> >>
> >> Hi Loic.
> >>
> >> On 10/26/26 18:32, Loic Poulain wrote:
> >>> On Fri, Oct 23, 2026 at 6:31=E2=80=AFPM Vladimir Zapolskiy <vz@kernel=
.org> wrote:
> >>>>
> >>>> Add Qualcomm Waipio CAMSS device tree node to the platform dtsi file=
,
> >>>> the CAMSS input ports are connected to output ports of CSIPHY device=
s.
> >>>>
> >>>> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> >>>> ---
> >>>>    arch/arm64/boot/dts/qcom/sm8450.dtsi | 167 ++++++++++++++++++++++=
+++++
> >>>>    1 file changed, 167 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/=
dts/qcom/sm8450.dtsi
> >>>> index babf1a4196a1..7f5b0501a23e 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> >>>> @@ -3310,6 +3310,167 @@ cci1_i2c1: i2c-bus@1 {
> >>>>                           };
> >>>>                   };
> >>>>
> >>>> +               camss: isp@acb6000 {
> >>>> +                       compatible =3D "qcom,waipio-camss";
> >>>> +                       reg =3D <0 0xacb6000 0 0x1000>,
> >>>> +                             <0 0xacb7000 0 0x1000>,
> >>>> +                             <0 0xacb9000 0 0x1000>,
> >>>> +                             <0 0xacbb000 0 0x1000>,
> >>>> +                             <0 0xacc6000 0 0x1000>,
> >>>> +                             <0 0xacca000 0 0x1000>,
> >>>> +                             <0 0xacf6000 0 0x1000>,
> >>>> +                             <0 0xacf7000 0 0x1000>,
> >>>> +                             <0 0xacf8000 0 0x1000>,
> >>>> +                             <0 0xac62000 0 0x3000>,
> >>>> +                             <0 0xac71000 0 0x3000>,
> >>>> +                             <0 0xac80000 0 0x3000>,
> >>>> +                             <0 0xacc7000 0 0x2000>,
> >>>> +                             <0 0xaccb000 0 0x2000>;
> >>>> +                       reg-names =3D "csid_wrapper",
> >>>> +                                   "csid0",
> >>>> +                                   "csid1",
> >>>> +                                   "csid2",
> >>>> +                                   "csid_lite0",
> >>>> +                                   "csid_lite1",
> >>>> +                                   "tpg0",
> >>>> +                                   "tpg1",
> >>>> +                                   "tpg2",
> >>>> +                                   "vfe0",
> >>>> +                                   "vfe1",
> >>>> +                                   "vfe2",
> >>>> +                                   "vfe_lite0",
> >>>> +                                   "vfe_lite1";
> >>>
> >>> Is there a camss "top" register to describe here? e.g. to retrieve th=
e
> >>> CAMSS hardware version.
> >>
> >> I'm not aware of anything like that. What is "CAMSS hardware version"?
> >>
> >> CAMSS embraces various blocks, there are CSID and VFE, full and lite
> >> IPs, and all these components do export their versions individually.
> >
> > I mean, CAMSS usually has a top-level register block (often top or
> > cpas_top) that contains the Titan/Spectra version information, along
> > with various global configuration and mux registers.
>
> On SM8450 there is "cpas_top" register <0xac13000 0x1000> (not in the
> series), I believe you reference to it.
>
> Is CPAS a natural part of CAMSS? Can it be modelled differently, e.g.
> as a separate device/driver, like it was done with JPEG or CSIPHY?
>
> I see that there are only SM6150 and SM6350 platforms mention this
> register, to capture and process frames on SM8450 there is no need
> to program CPAS.
>
> Note, that even SM6150 and SM6350 platforms do not use this register,
> it makes it redundant.
>
> > In particular, exposing this block could be useful for reporting the
> > Spectra version to userspace, for example through libcamera.
>
> It could be so, but adding dead code is an anti-pattern in software desig=
n.
>
> > Moreover, if the goal is to describe the CAMSS hardware exhaustively
> > in DT, this block should probably be represented as well. Whether it
>
> Here I oppose such a goal as impractical, the set goal is to get working
> camera on the platform with the minimum of irreversible changes. It was
> proven multiple times in the past, that "an exhaustive description"
> equals to "the totally broken description", and brings nothing valuable
> but irrecoverable ethernal problems to overcome.
>
> > belongs in this specific binding is open for discussion, but my
> > inclination is that it does.
>
> This register is not needed to get CAMSS up to the functionally
> working stage, which is represented by the series.

CAMSS already supports reading the hardware version from such
top-level register blocks and exposing it through the media framework.
While this is not strictly required, it will likely become useful to
libcamera in the future.

> I believe someone may create a new fancy CPAS device driver or so, and
> the new device driver will utilize the "cpas_top" register and other
> CPAS resources in a better way, the register shall not be nailed to
> the CAMSS preliminarly.

Well, yes, we could certainly model it as a syscon node, especially
now that CAMSS is no longer the monolithic block it used to be.

Regards,
Loic
