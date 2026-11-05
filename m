Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880302;
	b=ua5oUVFuaJTKFCrjc98FOt29Lw1cf9/SizUYFUyZS2xM45W/m8VrML8now6ZXqCW46y+
	 T7fgU3M3CmMsBKGPGpICNUiMVWDZ8CwltLtteUqa6soit1Y/Yy7czWXN7tWG6ptPhlS4Z
	 LgFUk+9ae8fkVb5OEgDuxQVpVBPltaxN2Ix/WO3TTiVIJeBC4ZD+GyeXUg2LZKfR14qpL
	 P896m26STgZN8aekNL1OyKFXLwL4ZeUtF2hSObK4/3anE3cnEarI01BDiSVFdNMT/N9Dv
	 gXBewbilIzKxSVWWY8LJ056iN6h9pQZ084EXY5u9fU6CSQHpGJ//xzslnpXeknQikLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
	b=4/bi2GJsYSOcAqVo0H+jL7EP/7OSZpgES/8zUORn0h9pBiNEPhjT8QkQi1AHfErQNgUV
	 JsHmAHOYURg5tiJp4SLz1ASZ4M2jlfoUzcdpEHjEMTJ4mthVyJfoIYjnFFvIVCEAEg+CC
	 KD6FYjZ4yJU7BArqMshuvShdg50GGjdev1iAeDDmSVK3KgDFUpIKOzAoKdiY9oEV2mOxl
	 9OegQcpYlbfDtHBAGFqniZsSmGhK3jU3E+L2mZWVIzz+IfyW7xb5Q8tSr1adswh3DxDh1
	 CDudk/qYPKXvezqaqKfWMPwknHa1LcYQ5HgSsYa8ZeIvst4qeer/aC0xFmXoCNFtLhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4jv8heE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqeK6u4b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BBB606A328
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 12:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3BBB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E4jv8heE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqeK6u4b
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5AhvZ91582946
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 12:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=; b=E4jv8heEUFra4Irx
	2LpEY24X//cT4epKu4S0xpuQ2kL7vX7QChcNDd4SpgbJqeNdKyWI70uhpcK45GgG
	7r1F2PjO0bCo3sGRvM2Ut8K6CWSyOknJGwbtZC407BmD6L7i7MnrYy6NZmLat0WD
	QRTvUQdd9Gapuv5R+XW9TnUduCh21r3t27gSSIU4wVkRE1axYYJyLPeuGMScyIBI
	5QYoR9oIKL8OT8Rmto3DfNH2mBe8t28zgYst0BfQuD0ZbCcOUtKESMh2qRHcTeXQ
	civAjC1WRh2sDqqDhLd3dPi9vwXJlWYsSiJCLocxz3O0p/KlAtGjgAAeHTXMsxjQ
	gGO+3A==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraarb4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:05:01 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b597558c4cso2375477b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 04:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880300; cv=none;
        d=google.com; s=arc-20260327;
        b=b8JsKrSL1i0BS/PQyDFRJ832DAV+zkAn0+PmlGqqfXIJLAaz6yWJZdc071f2Y67SRw
         WNf7qpQZyTJtoaAB1d/6IbpROQK3RAzMLYpWo56/OcBfz/zOc7ACoVMN4kELqX022mk3
         QImt9vLyfUHwBvwwCyBjmc3CkE/FMywQpzF7EhUr0ZXUY9K5axEZkt9P9aeFLIrW66xV
         8QvCUIiv5xqYXcABDd/ppH2neHP1DEG9/tdMc6y4r4/kEqrWPXTwsDQmUfFiOIAVw6KC
         7vSym/d9grK+jHPn8BBr6Cm88kQttr8CYfyxKjn3dXjUyhwdJ6dQZk8P6dGWjt1a7gfe
         T1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
        fh=NvM0hfzEUsHq5NM3oUl2ps5XMiZNfHk2OmxRzVSQAbM=;
        b=lnWEtFLL49/7K5jhgYojmutV6RxV39F6M0JVaIrQAfzjrWEMavSfjcjxRuIRC/oQQ/
         cvaaID67e1Rf5fuTCboePe9PcAJcNRRf28kddleuG1UbC/lQ6zHUAjopH+ZTAKs5GB7m
         dBcO9mFl87JAWofVK4EFaDt8topbtZD6qnTYio2iT7Nz08sQxKJXV0yspV0ne/JNiZld
         qmcnjxXSY5TU78v3+luYuyjA8APTjks428T+AlwbiBPvRJB9VY5abyUozHTTXd7T+R6E
         rPOGCx0L5742aKt/uHISH064mtS5tJu2vSVyFpbZmSgTpiyvoOPgHVS6o6hgP//rW3vN
         2mPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793880300; x=1794485100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
        b=KqeK6u4b9wES1D9XLtYAwi1N7O1h1xQ8YegbJvwQ956ZQlvjfeUOtxAclXTs5RzNRl
         /hv8h2wqXL4bj/PX9Hupo11wrGhR3xIQZu8E6br/TYREXTH+k3ooaAeWRfMdRexcUQC5
         2A5zjP5QF2QtX+oQpDBJD7WLE2x4zGHXodmkPOTuOR99JbhPKD9NrRshremKiJKukDee
         flQmdIczu7mCQwlcyUK89ruBAp+VulEK82a9oNG2j2Kt62IbIxELcHvd4vU/n28qRy80
         BLx5jJoX6jFIxr3rtJXV4Q8EQaXqlfr8iGpuFl84CVmD8Xuu8RjJN0wUrTSoD1iWLARU
         40pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880300; x=1794485100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnE+buvxuYs3CT/Hxc5FTa6YKVygIYUeXUvvlay6o60=;
        b=T69L9wDsaEwyaJNDmnWvh2k3ArkRPi98G3YOQ7Viyx8PPEdOp0Le3wGgRW31Vof9v6
         BLbXN7woZGbzt/nR+1MwpxJlF/n5EoRAXiczkOW9lYTs0Fk/hojlcNgoEZJUaVNIYknI
         lCpRLVuH/wQkIj2B+X+a8bwx7EWRl25nPWWr7ZjDdVgGDdJcD7WSP1xyqVn0PMcd9xV+
         P8MMd9bKmCbjae6fxa4zF6vMv98PPpRmNoBb/fW0peZ9bN1onP/MxmZp2y4W38zatI6f
         9JosmYYAJ0kmoECrNK0RT5QukW8mw+tZAeKYS3pyCAOsKFGaYNeroOr6Pv3Kx+YkLp2L
         88sQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/4HmBkZWYN05JAG3W8s1PLx5JKt9L2WzJxIq/9KckO2MpMjUmP6tYu3LuDEF1/ByJKCCxYzfOqjskjkwG@vger.kernel.org
X-Gm-Message-State: APuU4Z+T+9//tuyT/0rCP5MtxW0HY6o52d0yZ+2vEqs01Tc9pLdXkJiV
	93ILjtnBQQAVqz7O78PJ3Pyh2GIuGhLgOzL3Z/CIkDJUior/5+WbCkyKtlEuTP78KIlwFReiLvs
	nPEJRRo6u5CWb8KIgSf/7xjcBtKRdbrthA/hasjJ5alLddcf3onzJRY0+NHxkA9fMZig/GFXbL9
	tDi/i/ywK+MxxJWNqz6/8s++DzxciW3MkJ+1dAKSsUtWY=
X-Gm-Gg: AYBFou3Pd88S0pnCJ+rJxEucAGnCv9EhaaFYavtmri27Ob8x6XhHG9JdJk/ST+C3DNh
	TJ4kzQWDSHlOz/uWrHiM+D0K65KgrXu80TFfxdI2oMII410tKy4gak4n4T5ZIDdagFTY5SUEotD
	tHqKHgRgkitK3zNCNHKtzd/XykjUUP3hLO+R2yvHl8y3SGDhc/l/px4FzCCCSb+sqyEbOgzjagy
	NlO0Q3xHQgCToQciJaPh27PN6tTQdgIIMkSoI2dESx+FufpUlS4IAdrMQDFULzGVM7nmp4/hXE=
X-Received: by 2002:a05:6808:6f8d:b0:4eb:d5da:bf21 with SMTP id 5614622812f47-5640e09d416mr12461358b6e.65.1793880300209;
        Thu, 05 Nov 2026 04:05:00 -0800 (PST)
X-Received: by 2002:a05:6808:6f8d:b0:4eb:d5da:bf21 with SMTP id
 5614622812f47-5640e09d416mr12461323b6e.65.1793880299813; Thu, 05 Nov 2026
 04:04:59 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org> <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
In-Reply-To: <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:04:47 +0100
X-Gm-Features: AclHuK9rhmN1T5uyjSFVpg_P5DvGeB0710y7iKzLARDbFg21rI25jjD--irSqx8
Message-ID: <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfXxneMXBiPUpjc
 3d5ndyJ3ysW7JyiH0I8KZy1anUjHq1PeGehqSLncjd3LUnZRlP+f+1E1oTovxS6fBsgXYN2fj4x
 DdjAnR444BEXweEJySwjBCW6T0Dr+TU=
X-Proofpoint-ORIG-GUID: KYVRJzsPzPY09gHf8nihanouwcnSwNMJ
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec70ed cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=gMKTrDL_i4-E7wsZRbUA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0OCBTYWx0ZWRfXzoYYitv7LZR/
 0vd6eVlyzvpbQV3VSqySC47uQEIh8GWOzdiMCUXimBFp4kFJItC6vhBIERv5v5AMypuLZGQJcWG
 zryj1T3UPhSznDz8hUE8hAWkOwgy23bKnpC1+r+E41PoAfRpniFNFb7WrS0snXWCzDekTEqTnxm
 8YcswgQJsvKFHbRahRlUrWhJhmv6uZMRofuO/NPendmNnY6TFinvy2m4YPRUK8J/YgUzCQafSMh
 lRNnTQgelOwGnQqltbmCE4NY9z9IlyfyatDRTRvaXFGXm3aPQE/mYgHOg/z8q+2ONniVcSvNTvY
 f7HY3/OihGVOvB4zf1VjF2sSXdRuhEgdpaki8qIuQzzlsGlv3EZuzsCjiikiGTfQ3waWIrIVGBQ
 CEzUmR3+Y6ktyw6NhFRhS5RkKSjUZhZ2oaKoN7gK9adm1HlcDQbjUjDVw/uAYOxpndsiMlHcYFf
 89WtaRG/1bdxR3xZUhw==
X-Proofpoint-GUID: KYVRJzsPzPY09gHf8nihanouwcnSwNMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050048

On Thu, Nov 5, 2026 at 11:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/11/2026 10:53, Loic Poulain wrote:
> > So some chipsets share the same IP blocks, with some block/phy
> > instances disabled. As a result, we need to decide whether we're
> > numbering based on active instances or on the actual hardware instance
> > index/offset. If we use active-instance numbering, then yes, it should
> > be @2 (CSIPHY4 being the third active instance). Alternatively, if the
> > port numbering is intended to reflect the hardware instance offset,
> > matching the register prop, then @4 would be more appropriate. It also
> > has the advantage of directly identifying the underlying hardware
> > instance, without requiring any additional driver-side mapping. In any
> > case, @3 is incorrect.
> >
> > That said, since the bindings have already been merged in its current
> > form, we'll need to preserve backward compatibility when addressing
> > this.
>
> This is the input port to camss, so how is it called in camss, not the
> csi phy?

The CSIPHYs are connected to the CAMSS input ports, which can then be
multiplexed and routed to different CSIDs. The mux identifies its PHY
inputs using the hardware PHY IDs, so the CSIPHY4 is identified as the
CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
connected.

Regards,
Loic
