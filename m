Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793887277;
	b=WCUrxDZDWDuVuylMhgrg7elzo+ivA99ypO+Nxi9RlC/LPEq66+fa9lnKGWVU6w4bUu80
	 hB7ulbYEYqLRGbv0L/0IWT26l4C4JqWc/gtJiCST0Ok23CoLqRCkvxIlXaK9zmWafYXkh
	 bFSi37r783U8UAkSnp2OEJSGYLUMbG9PBGJsjeJYWErE6xWMJMm5wLLx1Mcg40BgRXIW6
	 WFlJ6nOwqN2oKWca7qlcYxUTSR51n2vN4W/exR27aWA5aNM//UaNv+Oh5moTEdS5DKjTo
	 118/cFLm9vS/NCGQt0I1rXugI0nFvsK2rSISTsjH/h6XVCFpqjoUtxyB81OmvnbbPQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
	b=Znudpeimciy1r97SjjaYzpMJfUg/f78dGlzSaYG8KBprMkHvaW5yVSjiKQZm3arBjKIp
	 5M50fNLGQ1tCGgojRld00Zd/pc+ZEtRwHG41F+hQTyowI2l5AXyMl9bL9HARD3ouecjoS
	 CkDWcpqWhha/XEFyi6+Gt65UEbRzWdLxSlLe1zfyUOIrfOJcMagd141907oREdPY2nlQO
	 QmeQZTJgrwNlaPyekVJwGF8QrvyTEfVsm2OOhKRjf7yr3c+okaol0VHZ2Dp0Wykx1B+GY
	 nd3NJ8LnrXhojKNwxeh/1sTNaK/W2DIaz5yO980nyQgBGpe6qrM2sZgFJE+IH1bXiCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mir4VC+3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nOVwID;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33071606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 14:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33071606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mir4VC+3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0nOVwID
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tP9h1053280
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 14:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=; b=mir4VC+3wdUaahp5
	ktja868nO4QtXhxgHuGqpHJGfc4y3qefHLIfA/n+XKk+aIfK8svi645NkkLweAsB
	mhzHivfz1lVQdT0kkdLuxCPr+T8t/fZWMEMXrr/YGpvO3bYwy27SClMuzmhh5uZ+
	VjEOByy1YTh2qYsShbTaiUyZP7Oa0OdEmoCZM4IBdaJZh/YK+amMlhVVEDi4agR3
	kvezPwijaoYnX3c7U6dBTN+t47cyN6mcLf5TZlK30+hjp8xZNkLtcElDfUcWhut8
	bzn3BASnyFr7nUuIyMxcPnt6RuzU5QqeSkATlmQf0mt1sHLRvsZGTY3ntbmku362
	ndrceg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq9f91yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 14:01:15 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-54d6281f6dbso1977621b6e.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 06:01:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793887275; cv=none;
        d=google.com; s=arc-20260327;
        b=buZgcwI6zKfDHXMt4wbVExcKONHDNOWzyNj7gfGLTMnTD6PLftMwN4sLSHUoYiskmq
         YbSnxg5RB89amD7O85iW2OPUbNAcQc8X0JULW1V060Dh0iDMGHymOIV6bX6mBDhl/dMr
         Sc7D4pDn6prHsJz2yNxutIZC1ZXsxCGXcGRnt3JMpiNC419vwdwbPRtww+melw9aHyuM
         INIFc30fI/J8TLn34YY9McCvicVkamlEieT+m9Ujl3Aptnqal1edl0Dg+qQ64zmEPk1g
         NLeNrX+i7j76t2d3MyRJGkHq/uQV/pgX7DxAqrtLsswORrBzpjDSVxL/OPhPRm3hH7uo
         zwXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
        fh=aup84vQrqBsKCQv1Ukf/3u/0EG7Cv/bcpNWL/6o9V5E=;
        b=KEWurrMZ8ztdRnunZ3VNmiUf03Ztg1pia1g1cPzS+0m60dIS+S7K2MedBvjG6reT8L
         vThVMqI6vPADzfB3j9DF2Smxm+ddaov+TR6zE6w+0qOYa+U6gv5vz5tzTO5CmhFuS2UA
         pBXiMzY7x5wh5OKVTz7cr8BneudJZUH3tSwuB7a0ZJYCy5GJMCWPVai089k68umxo6rS
         GkNaTP2V2Eev6a1Hn4HP5gJlQn/P4g1jTQOathY4EBj/Krd7LTUZILmh9uufBF4nkgen
         NsOUYdcoZOfsC65+2K8hEAWWyhCBWxOn2k9qIJP21683nUWy5K4wbxBVVfAW4hG/VkD1
         ekkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793887275; x=1794492075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
        b=M0nOVwIDG7jODMT+nQkr/TPC8EkB/nasV2CIwBGyY4jSYU5vwmQQhLJesQh4BpO4xn
         ByKd5GG/EKVb9xOrS8QfrTi1s/VkiO4XN0ckZQ5NkwfOUfmiRaV5lGoXq1FQxOBeR4Ch
         Bb4TO6mOVzv2OPHtDmYvXph0ua2eL0MudhdyP/iQl8aosWa3GRaaaIzo91LWlWTiRiSJ
         q7kaOLacFA34DHBBeGuoDcWcQ1UOWYH0rOoxD+rOZtM5fB8troYwp0qN4u5MPIk1X6qU
         E5XkkMgIxZNj6alGq7HdlfWVL0q7riFSimK14x7XQt0CvMsCWPBaIAjFiZwD1EbZLSAZ
         TvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887275; x=1794492075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyfoRLOpQ0Pv8FfbhV0tQzNI/xObjFjyJa50AzI8c34=;
        b=U6wqlX0U+SSlw47y5qSUWZGC3z9e/qWS25/L3spGwA8qU85cze9z8eKMFjaFZ3v/Vx
         xFFBxxsAF9tt10CboGidwXuc0HmDbDJRckt/FyyZ34m7rlu9IZjuwzwxqIBTaZtlB434
         NV/rRIsl0BZWxWPpBpQZEAs5XFbYdNNl0F814Y8epYGC+9fyoaJctpnV5hY3fPiraY8H
         y+Hp5UheVu67HlWMV2+A7wPd8PUwxfnhSWaHGtdvBp4IzvY36eBqMLg3ZnseHldoGs2F
         RhiVmBrwpyqxVBcR5QHFuwx9VYs6VR7noT6m9EXfh9NgDAhJDL+ZDTqtXL6O5lxqXC8l
         ZS+g==
X-Forwarded-Encrypted: i=1; AKwUvBw9I0OX/PKQc65/oGMbVd3tCbqg3zy6SLJbXMy6H5IuHfCd3OR8dteMUUVsIKGkw4NHHJ8qvOzZdw6EPu2Z@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ku6ggRNedLjyIQvihGP0+QvZWY+LRGMfIhGcoHLTaFKUhcW5N
	6rXugVu6pM9cXByjAOgqkka+bxVuQca3d69kKtiH2XNSh3STj9fSjl2wCaRKMLCmKehfqL8Fteu
	LcsT5HPQ7/KiGIi2zvC8wGs5n/tdkBvu2XXeCsTYGg+YsxWjqf/Jri/ao24L2qYTKqDxYhHsK4u
	QKnWh11w3NSyhG6Po8+kXY9YjnypSwoGBKKttNfORmv64=
X-Gm-Gg: AYBFou2cPYhpkQrP7g+dYO57DDIAB0l/LtGGamy7sBQdFLKxp/l/OqviiF7Z4/6fTJs
	OpiqGCNu/YkDDd/PKpIqV/MbKI1Hi8XLaY4KM2yAfxi9lFwyasBYrzIYi5oLG+gEkpyawYYsppc
	EXvgFOgIIVshIGu4X/gDQ4UHhmCuho2IgWD2RbrWQhr/GmGIaUkoSyJUrIaEAx0kHa0oumwCVkH
	M4Q62Vu6kvabiYZfsK8uJoLpLNbKwm2M152IuX8J+qD2X3HE36PvxpzTFpElzNA5tpY4F3KGG8=
X-Received: by 2002:a05:6808:3509:b0:50a:f56d:a6f1 with SMTP id 5614622812f47-5640dc1b211mr13019227b6e.10.1793887275158;
        Thu, 05 Nov 2026 06:01:15 -0800 (PST)
X-Received: by 2002:a05:6808:3509:b0:50a:f56d:a6f1 with SMTP id
 5614622812f47-5640dc1b211mr13019186b6e.10.1793887274640; Thu, 05 Nov 2026
 06:01:14 -0800 (PST)
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
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org> <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
In-Reply-To: <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:01:02 +0100
X-Gm-Features: AclHuK-b0A4Gh4xuvf-RvkEJ0Ayhot6Y1dIQBdbhsTwiCiM18Z5of_94siqhfkU
Message-ID: <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX91IIUKREv9At
 WGb07M7OOdIzXv7soJj8gGxmFUskGNEN29UkUPF3FsIwn+EMJw8ahrXGqLzEHheQUNCBO92kbbQ
 0QXRdzAa8dQ4mCCNms/c7c9+BP+5Jp9wmhdbcoHP2xs/7/Ia7lyy1Je5n+gwyFj+08OHAU/dqC7
 6AKrXgTIxbl3BFZnKggksyGGOjyk0kPUnXQB+gzm/Ww1BchUc8pcwC7yhCmiuAnbpLi11PcQRch
 v6Ug2PNZtzPREkUDE9yEQjzPylqZG72hBX+8flLqWfysHv9J0oqCCr4/tDIYJVR3K3DnQBNsooT
 bpMIOG94R287oWpqbsf98SGPXfJ6ZoX+E5ySYJnraMtaTY3/i1T8fZPxsIGsegGua6BY0eXz/6a
 CcQVlgsPjtu2nejLdM4mSrMRtLo0JlzobmzgqFt1CiJcy3x56KJgfszfvd5DcBnYIG7etsVikE4
 12Q7CYbRLPAWxmqPVpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX+RNgUWu3c/T+
 RX7gtsCg0wmH/oChNGfSh3ThPJcS00B4lfKG5FER/KrUV0zw78Y9k2OYTBtTE5TO/Txn2/H8TOA
 x8nb0GKQjfVFXDwl+aUo96W5XVmFD7M=
X-Authority-Analysis: v=2.4 cv=Vdhir1p9 c=1 sm=1 tr=0 ts=6aec8c2b cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=5UNgDV9Nf9xsrLWpgpcA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: RJN3536XExoXhHFdjJ-hx4AR7M1tPL1z
X-Proofpoint-GUID: RJN3536XExoXhHFdjJ-hx4AR7M1tPL1z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050055

On Thu, Nov 5, 2026 at 2:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/11/2026 13:04, Loic Poulain wrote:
> > On Thu, Nov 5, 2026 at 11:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 05/11/2026 10:53, Loic Poulain wrote:
> >>> So some chipsets share the same IP blocks, with some block/phy
> >>> instances disabled. As a result, we need to decide whether we're
> >>> numbering based on active instances or on the actual hardware instanc=
e
> >>> index/offset. If we use active-instance numbering, then yes, it shoul=
d
> >>> be @2 (CSIPHY4 being the third active instance). Alternatively, if th=
e
> >>> port numbering is intended to reflect the hardware instance offset,
> >>> matching the register prop, then @4 would be more appropriate. It als=
o
> >>> has the advantage of directly identifying the underlying hardware
> >>> instance, without requiring any additional driver-side mapping. In an=
y
> >>> case, @3 is incorrect.
> >>>
> >>> That said, since the bindings have already been merged in its current
> >>> form, we'll need to preserve backward compatibility when addressing
> >>> this.
> >>
> >> This is the input port to camss, so how is it called in camss, not the
> >> csi phy?
> >
> > The CSIPHYs are connected to the CAMSS input ports, which can then be
> > multiplexed and routed to different CSIDs. The mux identifies its PHY
> > inputs using the hardware PHY IDs, so the CSIPHY4 is identified as the
> > CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
> > connected.
>
> I could not find that information in Glymur HPG, but maybe I looked
> wrong. CSID Wrapper lists CSID 0-2, not 0, 1 and 4, but again maybe I am
> looking at wrong device description/interface...

Yes, there are three CSIDs (CSID0-2) and two CSID_LITEs
(CSID_LITE0-1). These blocks select the PHY source to be routed by
programming their PHY ID (PHY ID =3D PHY index + 1), as defined by the
PHY_NUM_SEL field in CSI2_RX_CFG0.

If the CAMSS port ID matches the PHY index, the port ID can be used
directly as a routing reference, which keeps the implementation
straightforward.

Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
makes sense. In that case, the driver would simply maintain an
internal mapping table, for example mapping DT/logical ports { 0, 1, 2
} to PHY indices { 0, 1, 4 }. As long as we establish and document the
convention, either approach should work fine.

Today, the Glymur bindings define DT ports { 0, 1, 3 } to map to PHY
indices { 0, 1, 4 }. One could argue that this is already an
established convention, as it is documented in the bindings. However,
it is somewhat confusing.

Regards,
Loic
