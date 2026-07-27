Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAAB3CAA41
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140704; cv=pass; b=nAAJqf94W4CxgaeVUbFDbhTq8zXh9Wah3VTXtgfypsSE47TJF4equLSUGsZNnP7TXfk7In05MBi1vCKGeROO5/SkQXQRKWz5xBJdJVYnZjpnpVYM+K/E/tPXhB+WwK2HUyBvtJ98e8u43S8RWpG6zDV4SpyDM3G4Mkz7QZZyoXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140704; c=relaxed/simple;
	bh=/szjitr1JF6qSuEGCBNiddM0d5D1/45sj0Iytm86R1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrKC9dh13TFRb+4UJsxEX7RBDHtM+p1qQ/JC83PwmXl9S9o4Gz7mGCx4fZZyU7MwU4BwcOmtYo7T3Yg1BH6V2ERTWkBRcbOI/poi9S8Kwm4QqKrUvMe+GWWzZzmbdRbaCS1CqGF/G4ErbQrzCu6UtHUBwTkfWnXa2aylI1PMlZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jg7+i7/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgaS3dWz; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jg7+i7/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cgaS3dWz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7UAUf3150899
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZKisjWJ4QSIf+LiuWonJcccvvNDHmGQTB1J1wU0www0=; b=jg7+i7/h0/1+dgac
	c/IH+KszMopK6T6ODzBRdn24ovwm/K4QF1gEljMdO6hM4KYTPMnXHyfeTqLFDjKl
	QWVluy8uIU7EAw4+P4X19lWCCs7CsnLWR0avItF165eaNdCgNEsr/YyQTcyfcu4i
	i5nx8h+/oDLiuHJLgUS3fmOFwDOnlYEX+eGAQrDWcltU/G7pAZcuyuz5TlL4D0cn
	4pIGXAwRjWuU90hS1eRHxo0xOLO1uxLyQknnFZPTBhVldV5nS+fEIpVMvwQ6P3gj
	9EHDQ1JGetmKXecvGJ3PlRfshCWxQoXnNg1UoBT4xDaJOPPQ+0v/Lz9f1xRXx/8J
	x4x3vw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g074g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:24:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e62e3459fso252693485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 01:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785140683; cv=none;
        d=google.com; s=arc-20260327;
        b=q7AlOcdg9n8lIdAhOYGK79BYPvcULfVbX4N0HBjZ3vBLJMNvZS9sgUIyYzUjkoyfWG
         GDDhaJZOEQY/jtB5K6iqUlky6JFVbGpRic2bt3JFz8g8pNFFwhd0WJlPlyFieh6NLV8G
         qgEEBMDCLRquhKHaEvZ+fOZUZGGgNvxrK0AxYCSbbSPIQFtLmPwp6hdbiLnDJjsHdP4u
         vw8F8RNd00fki0HZweeTc/Z+YSnUf8Xt7U9NRk/CSB/iyeZtKeQQXG4X8WZn1X9I0KKm
         40JYRnnbKz6WDszuCnrHWUB0nXtqAsnyf0oByU3akth7vu8UxnESlKUD48V751hLpaEY
         ea6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZKisjWJ4QSIf+LiuWonJcccvvNDHmGQTB1J1wU0www0=;
        fh=RDE52/6eYXB89XO3I2J/ktFy6DCMRd2tAc/OEqyEUTQ=;
        b=eFdcWDZZ+xejq0YTdLAdXb+XHT3OoJ2zQv/NNniKDlhMxGbshll3HRMqwrCJSnvOqg
         CvScVh8CESX6C5VAWcdd+i3el7BL+sHIgotqQlIbKE+zq8swyUn6BewWFxWpViNhgJtt
         Xt6PyOBZYzsVvAh4TMq2qdgjdI0Usv4f1qPACXKMbAWOoQTf3hQiQbJrst7JZI9sGTI4
         mgz93NC2cGnqjseMnDQOgCKt8VYSAJtQTcmXjrdLD3XyVVfh74qw9T0XOCSIeuWhdh5u
         qphv8BMAeja2eLaKTHCr9GARqpi0Bggkf1tmiBBtuJMUVIn+4IEWr0bRGmpccw/63KFa
         1U6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785140683; x=1785745483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZKisjWJ4QSIf+LiuWonJcccvvNDHmGQTB1J1wU0www0=;
        b=cgaS3dWzVHyD/gFSNLKEmyJLDmMG8DnyhC6Ttwpw+MIffZM01B012/MxwHdqx+J0M5
         tnFPD157f/a18sKsSmtJJHR2tJn08DYALz1ixSCtOJnzQNEPthaOZcx+W8SxVE7EQH2X
         wAEf14IqNdI3Q8xX/VIxOtYyMsW/whvOtbA6j8VxyIQgJ8V+ZKY3g5Y+jkToOt/vax1S
         mBQyU6GOsw5u7tL9ORH9wC9ULj5Zi8nEwN8KQfEQ6TWJ/hvp1obUIUZEH+3Zn4NzFaUr
         /z5G6CRtMYwRsZ5rps5LuOcGS72ZAkLfaypQWY1z5ymI6JLDfOQsZaTytAB4/9PSXY3m
         0UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140683; x=1785745483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKisjWJ4QSIf+LiuWonJcccvvNDHmGQTB1J1wU0www0=;
        b=OO4Ykw+0vq47mCAqSUVEIUsf04osf4QI18HY2iK0c8lBY0lS1s1P47DP11p/TuQrLH
         bQ6wQZ8zBl4Mey+m7MthdOu7g3j6YXfZLa44JVaHmFDnMwxSktq9zSJm1wGkPgU8yo+y
         Fy19GegabIuxLlgoXTC8UtT4gvNvbmqiQ1ZBFuKgCxIhoItAZ/tw219c7ezWclE+HYCR
         4Q/g+iqhhQxiGEcizITzSP8IEMTPYwSoabYreRfT2PGYiwzZPkToZKuX07nfKD7ZYTQ1
         MMzk/l+R0VNbAJRRPSr1az+Wdh0EtqmWa6gK6eFXk+bqoOJwL+LJr0nXkJob4/pbP/ga
         5RKw==
X-Forwarded-Encrypted: i=1; AHgh+RqSz05ztZjS14m5O+NQ5YRza8HfMTxYRi7PQkTvM472HpeG2pDVc4qNsSJWH7s7o6/5uXE7bW9w8f9cm7+W@vger.kernel.org
X-Gm-Message-State: AOJu0YwbS3t43YvdrDo0oP//prfCuGKqA20dXR6tde07r24GW9vb/Zt/
	IpjxYRRgH+u8xH0s4JQvtihvCAGy8fXpWr5fw4V5m4oARAHmL0r7AXhA9RwZVH7KMmf4oum1OEy
	wU7U1mkbwyA0yku/ZpRzzJoCban6j1KG51WsBGa4gIaeIuIozzevc5PI6GgwbN8SW/nscKsbL33
	V3puLdljAN3oHBUyI2rDu6674mo1X97Vd5rbq+bfXvFaU=
X-Gm-Gg: AR+sD12PEJOzo9lvfkJKKUmcECPD8jiSjEefjeI5Re18f0WYGaR9cta8zAeclJx0xEz
	gFSYPiEqYz8DmVnJPMO2sBM3pzzWr98fMunkUY9//Qj7IG90v8QKZ7LMyC5FU+LTBAcVFKsrkPJ
	67eNRMtIh6Sw+btsr9RYvYrV8DhnaauWurhMj5ebucsID+wW7Gqy9mDvaaJLGTSbPLJWIv38Zlh
	lf5sXs75rFQK6XbuqFGt4fnisRooNQ4JI5bXpp/kDsdfAu03X3N4jCC0NTzYpMEqjbaiz2o4+Y=
X-Received: by 2002:a05:620a:8081:b0:92e:d01b:de5e with SMTP id af79cd13be357-932df726607mr772540285a.51.1785140683516;
        Mon, 27 Jul 2026 01:24:43 -0700 (PDT)
X-Received: by 2002:a05:620a:8081:b0:92e:d01b:de5e with SMTP id
 af79cd13be357-932df726607mr772538785a.51.1785140683104; Mon, 27 Jul 2026
 01:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
 <20260724-monza-leds-v7-2-0125a3bfea98@oss.qualcomm.com> <20260727-mellow-iguana-of-drizzle-ebcced@quoll>
In-Reply-To: <20260727-mellow-iguana-of-drizzle-ebcced@quoll>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:24:32 +0200
X-Gm-Features: AUfX_myV0_Wl_14C6MR4VP26q2WPb3N04NR3JSuL1c_UODALCQ3qxRW1JtxJA8Q
Message-ID: <CAFEp6-1Rciv1qqsYeHLnxKPKXos+hP3FUkgRjXzrTzHDA5cMDg@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a6715da cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=1AaZgIuxyIDxt6-OCucA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA4MiBTYWx0ZWRfXxeXU/CtjIlvC
 oTpUYAS04ujs3g+Sr5nbTv8//F9yxKXT46K+Ji3+mCH6CeyDO0uAy7C95e2Toti2pnvlUiYrYnq
 GttduB5Z3cyHPkVsdD5vnwX3mV2E+oA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA4MiBTYWx0ZWRfX5h70iaavsPLT
 DZqAj6f/ntQBfz2d60Z88F7B7fxV0LNIPTgTngkN8K4EL8b7dJ4HXD+GRzapQOYypKsoLMkBl1A
 zyFYVLe3qBRq9zf3UHrBwkXwmiCKfqTRzCUFagov4f+Ju4KTaMb4+4Hp26sLY3dss4IUjK60i2E
 ZT0kgDucXjyztuJERBu4Itfm/nHKmu/p8e/NUd8F7kdKf1Dy45iXgv2ezFIwEe1+/7nW2ub3ySR
 8LSGZL4eNGz10X9VDRQ7MiJ8GjDyGpwxBQ2q0IwQAVptHVVg3woJeifsrYrdHbp/44zsOAeigyg
 W33394ChlebK7w18keQ/QMCwdERjRrE/g/WMVPR7Dv/X4KCFNZ7DqUw9Q7g5VGL9NnaF8Vwot7S
 JKiYMLVeA1lG5gsO8emlSJv5iMSCzj58KPUJjM2P8q4QRtnXRqO4UjAox+mTYaI0785/mg/onNN
 KD39035MeXLh5hdi7GQ==
X-Proofpoint-GUID: f2RDIdyNS1C9JTvr5mcpK86AWKrPvt6A
X-Proofpoint-ORIG-GUID: f2RDIdyNS1C9JTvr5mcpK86AWKrPvt6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270082

Hi Krzysztof,

On Mon, Jul 27, 2026 at 8:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Jul 24, 2026 at 09:48:16AM +0200, Loic Poulain wrote:
> >      then:
> >        patternProperties:
> > -        "^led@[0-9a-f]+$":
> > +        "^.*led@[0-9a-f]$":
> >            properties:
> >              reg:
> >                maximum: 3
> > +        "^multi-led@[0-9a-f]$":
> > +          patternProperties:
> > +            "^led@[0-9a-f]$":
> > +              properties:
> > +                reg:
> > +                  maximum: 3
> >    - if:
> >        properties:
> >          compatible:
> > @@ -96,10 +136,16 @@ allOf:
> >                - nxp,pca9634
> >      then:
> >        patternProperties:
> > -        "^led@[0-9a-f]+$":
> > +        "^.*led@[0-9a-f]$":
>
> Why changing this? multi-led is below, so maybe you wanted to combine
> both?

Yes, I wanted to combine them so that both multi-led@ and led@ nodes
have their reg property checked by this filter, while the multi-led@
filter below only checks the reg property of its led@ subnodes, though
it may not very clear and also too permissive?
>
> >            properties:
> >              reg:
> >                maximum: 7
> > +        "^multi-led@[0-9a-f]$":
> > +          patternProperties:
> > +            "^led@[0-9a-f]$":
> > +              properties:
> > +                reg:
> > +                  maximum: 7
> >
> >  additionalProperties: false
> >
> > @@ -143,4 +189,50 @@ examples:
> >          };
> >      };
> >
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        led-controller@62 {
> > +            compatible =3D "nxp,pca9633";
> > +            reg =3D <0x62>;
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            /* Three channels controlling one RGB LED */
> > +            multi-led@0 {
> > +                    reg =3D <0>;
>
> Messed indentation.

ack.

> > +                    color =3D <LED_COLOR_ID_RGB>;
> > +                    function =3D LED_FUNCTION_STATUS;
> > +                    #address-cells =3D <1>;
> > +                    #size-cells =3D <0>;
> > +
> > +                    led@0 {
> > +                            reg =3D <0>;
> > +                            color =3D <LED_COLOR_ID_RED>;
> > +                    };
> > +
> > +                    led@1 {
> > +                            reg =3D <1>;
> > +                            color =3D <LED_COLOR_ID_GREEN>;
> > +                    };
> > +
> > +                    led@2 {
> > +                            reg =3D <2>;
> > +                            color =3D <LED_COLOR_ID_BLUE>;
> > +                    };
> > +            };
> > +
> > +            /* Remaining channel used as a plain white LED */
> > +            led@3 {
> > +                    reg =3D <3>;
> > +                    color =3D <LED_COLOR_ID_WHITE>;
> > +                    function =3D LED_FUNCTION_STATUS;
> > +            };
> > +        };
> > +    };
> > +
> >  ...
> >
> > --
> > 2.34.1
> >
