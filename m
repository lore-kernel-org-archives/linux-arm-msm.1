Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793288814;
	b=0HXHuyBixmKcPDUF//AQn95F+7mFjjKbu17RAsSPdToSrVLkJFduXvkTH6ixUFqXiLXb
	 yDn4AJ7z+hrCkvmZ0AgtA+20WjqpgiECuKRJbkot1hgt3Hf7Q9DfJ0b2DRFUgZUj9qGSA
	 rLXa+UkYBweCpbzCFNuHmuhl0d84AJTlm12vnEZVer2re/CIYox3UBV8DK9V8dx28OKsT
	 AYQr34u5WWGvSwhl3PICfHweu7ioDHFZMRSTC9gpYwZ4lrk4MSHShfU5TJZv/SoH2VVas
	 0NhfEtogQLDTaXR+PqkLCAz/u3FwbGk2MRyuFm2fvdXn3WpSsBOvy/dDlnF6WQoXeIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=;
	b=WJqmT+46vG2nXzViOevvh1spvagd0E/vs0dWaV8uC4dKJ3+BgwTDx8k2cUbsPzXYMQNI
	 EO+ev9Bd5GhbPni7mmYa5za1I+nnSm1ySy88Xs1ZsJNxS46yvHRnc2UVFDmR3NbtnouYH
	 4/vNsMSrbddeZH51iq7XoaRzNrGIYV3mU779mMTRkEf/ZETfhhO1bYFwFB1npPFLUdO97
	 blTb2I99hEvwRn8qbaRi9SPRpbvlbMXsZkLHyEPuZBrQDyipGh2lkBf1iuhibQUHvxd0O
	 HdXw0RuCfQQ2HYAqUm40WAvH06REUUNxOQwGdIuMexgbQq4UpYLEYqnTH6/gCRdPvJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVsOp0qL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I0kEtLQZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDA2606A324
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 15:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEDA2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVsOp0qL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I0kEtLQZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe2043943857
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 15:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=; b=LVsOp0qLhcYVcsik
	p9Vh8cqrpVhZ25bJ6bZCNQ4+y29Pji8XE03dp7QH865xOaxNjXUOg7vqhG8OO5pg
	QFIap1Z6F74gPfv6TL90/UOm4J4E+etmyCZlQJOS/idUSFj6zGiYjYV2HiE5/bOz
	3Sl2tZNzkRlvKjigaMP4AY81t7Nd4/Gz6IsCWSxJK5WVFx6hL4VRYqT8/86K8dJ3
	iGXAzmfKNbP0R5tWfZUh9+xQ6EJwnymeJydZK3j3bOOfFb6IwcsC87BmZ9L/s99w
	v1Y1c8EiZ/wFgMsuFasuVhz4MIpUngOFHfISM2tX+5JLZouy1LieV176OOF0UVEJ
	wN+bnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fhbyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 15:46:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so405901285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793288812; cv=none;
        d=google.com; s=arc-20260327;
        b=oMnMDKCjwXCKOKT3uNwbGKA22Mx8oG0NPF48nOKb4Ju9p6oAKisFLB9g3hWJt5LVy8
         tPlbQODBeQPi3UHdByLv87l81LsJ71J1Qvb0yRe9Af/TglYhLVHTlo8V0ffLTEWrbx0N
         EwiBCCuII4K0fvatCI4WlNOoVCNl4D0HMqP3jzjtO0qLUwMEvRqXMvtxFrsVeaJbSEnJ
         Ev3F99moa6GqMzLcAGOLs+UD4x2WF5yaC42zVZ+7RUuqL150uDcEG3HWhLBdWPNyFx0x
         2ohSzOESSfqMOdDc6NdtNGQKD58q7g416HqnkM3zn1JfOEGSse+9tG0B0YMahYAw9chd
         cwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=;
        fh=OmhmVXjOzLMTpjQTP67fIyFSy7+GSXb7VNmgP0zNkmI=;
        b=hKyTVlXtcUZK4VvC0n0K2B4n+k1/G7CurBYhOv7PDvcoZXtxk4TD5O6LgpqRorxala
         qrdeeMPLSTx1r6XEHnKaWk/17gvzOQmwh5tWtwxJ4/dlpqW4U2Ul6hZjfz3+iqQhVC8U
         USDv5QleBJ3x+kPgXQUuRomIEAGecYgGwVjetJ11GeWekqOQ9c9VZqPN+mP6iSqLAN0J
         pVgEV3NbnhbG+A1p+8+eSqSr6xzDM0XM4tlQ29yGwTXRUvgmuHha14OJvnjHCivWhi+D
         cG1KJVDwx/OVsaRXyTBQaLJDOXTLhEx3J6abIJ5PdRVNV1ap1F/R2DigBjGsjoRK0cix
         pUfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793288812; x=1793893612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=;
        b=I0kEtLQZ5FWySmkoeXx0IjZhmDaiQZm9UIp4C2TF+/dPMcqgvtBuz7I+g/8pEfYn0F
         D/Lday1v6JXM4l3MBkcgLJTIMcp8jkUtnzdod3S+zXDr/JldwSb7JDbR7th4tDW/PI+r
         aNk9IVj5Ghe0ivs8i0E3bwdIr2IPtzBHn3qejZ+IICHe39JJgIDOAgMplqRFRauXqqdk
         TFufWRom815JPyadNASzzddMDlJ1f2Hsu+5mb3Chpfw9lWIP6DuVylpUHHGPpOPgPEUF
         aeS9LOj4EdsWUpOHwuACqUzWuhjUzVTbIxrq/Nd5hI7zFc2jAZJTn13asD0SHyT6OwKq
         a/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288812; x=1793893612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5k7ep/bgn3vdewOJj/rsgNI+AnmG6o0USKHcFo6h2g=;
        b=iXagpZo+wk27hol82Xfw6eVFaP7aoNSYZfZh45UD5MgRIXpyYvOq0jivrZgns1hOQ6
         TEznTyPIMCnJYI5WMDKc5y5+0WUT57rKNTwj2a8/+/o1qJyMAkMh59Tjw/VP8L1vzq3d
         1hZD4wnBmIEBDrtT+zKSLEOojv3/w8izhvPRCZnHBknb385wryffSsO2xn6CI0bNQrf+
         B4kq1A/d4g0BEMzpLrA0SD0p5vU0R/5EVVM4igf5yufXtuVWSCTIOgjo6t1KW0enZAbS
         ESTuX2P6WhutcIN+ubRj2T5ZqCVplWtDhYljLiJO46htvI0G3swdYBcG9WwWjBD3dgzp
         gNng==
X-Forwarded-Encrypted: i=1; AKwUvByGAsG0LyqNUgW6D8MH2oe8ZPYW3DupKfdVTtNlNFujg3+JsZTw2xfHN+2s+MUFQI+0XejC/tMHR2xqZCz2@vger.kernel.org
X-Gm-Message-State: AFq9FYJBqSKKeBnGfBvH10zTmHsjXGUW1gAp0YkXP6uO98yFRJVfQAcd
	qOXAxfc7I+T5nD2AIHNVNdd0Z6Rm1NvuFNiQAGsstYv81ySLeYfh0LCG0qe+evSVzG1rQJ40zpA
	oM18mGb5Dt8ZiYvuDBXQd3QE5epoo3FF73pHFk7aJfHQp8sBLFG7NhDwy+mHwohjEeUyCpT6mcE
	xEPLGQrM9jp/vtkKGCA+k3bO87vx1RXV5bO1H7PCjyjdA=
X-Gm-Gg: AYBFou1z3ygDU/Q71xK5nZBbsqdROh5+8iNCKRkAivPjNWe0oj1D05vaEHe18E/+tEH
	xWXBoOEaoMBjq5ekalWPIHbWvIN3gZFtpeFY3oGgVlXQqfFwgNYCL1vDKPjVrjzGbgQ3WKetnOP
	nXtKvdzqRRo9iFbya5UqNsRpbNbf9Ctb7mUht20BQyFHyP8SbxadCAnuxBh3R77QbPftnoaVIu5
	OVhlTK67Y2kq1HoOl5R4CSCHT28GX8YLYsUNh4NTy4Kz7ar0HVKCKOctReoxqBsN4mZlGWCIsTG
X-Received: by 2002:a05:620a:1a20:b0:93e:592d:f5a2 with SMTP id af79cd13be357-944089303camr914161485a.11.1793288811684;
        Thu, 29 Oct 2026 08:46:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93e:592d:f5a2 with SMTP id
 af79cd13be357-944089303camr914156085a.11.1793288810985; Thu, 29 Oct 2026
 08:46:50 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org> <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
In-Reply-To: <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:46:40 +0100
X-Gm-Features: AclHuK_dWimsnhoH0_XzQl8ZjHm1ns8Wq8ivGHA1U2MkUrMeF4i5qln3flFwdlc
Message-ID: <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF driving
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfX2kcGhyfaPj2L
 qKtLu/Yj/BGcaQMs+A8wcz78Um8n3mQEu0/A9Oxxr/0Pb4XWfisoq4WweLD+aQ3tC0k97ULm0PK
 9OhqBeCYHR45CWQ/n6lZ7LKPgeFGgllk/N4OaCblJBKbgLtJk+dcTP98wvybXfp19DsqQZtWGdh
 kKseoYRKE6oAYsdDOv4CW99JXlX0v7ysw96t7OXOYdru1hcHUSlcRr5vHmLCiYkbZDSnCp3rdZx
 e6fRvj6EHYr/P4wpZs9HgsAY4sSV+Xl4P8wxDdVovBcTx0BTIdhhh4VMRlTsfW5Za8e+lP6bYKl
 t1NC5xNNUYmvYGKKKdie4vCIscewYk4EDaR+DpmU73eKnVMgSBtjm7nH/NMBr9QSwbv1y0b5Ep9
 bGOcXBZcZEVgYLWUyyWp1GQqkLZlVT26FWGYx9qU5HGM1Ld9f6gsO8gSR3lJxXillNXSWXngt1p
 KzA5RYJdrd13GJKggmQ==
X-Proofpoint-GUID: T4pXPo2qPQtB4uLS3ttsL8JXa5qnJPNu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2MSBTYWx0ZWRfX1IL6B0uAb4a6
 iqDwqyadtmohT18JJ48yAhpTtyVaaWEtSIqMjv/wIXbLAgy4bgcRBKLEKgUirk3pplOw79UznyI
 aX+5xSew6nKlRjuXLslpg1FVSzTjjYo=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae36a6c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qRbGgoc3eL5JOgqkpqAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: T4pXPo2qPQtB4uLS3ttsL8JXa5qnJPNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290061

On Thu, Oct 29, 2026 at 4:43=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> On Thu, Oct 29, 2026 at 10:55=E2=80=AFAM <bryan.odonoghue@linaro.org> wro=
te:
> >
> > From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Add in silicon enabling code to generate SOF and trigger the routine wh=
ich
> > produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour=
.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 ++++++++++++++=
++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driv=
ers/media/platform/qcom/camss/camss-csid-gen3.c
> > index 0fdbf75fb27db..6a538d825f78b 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> > @@ -34,6 +34,7 @@
> >  #define                CSID_RUP_AUP_RDI(rdi)           ((BIT(4) | BIT(=
20)) << (rdi))
> >
> >  #define CSID_TOP_IRQ_STATUS            0x7C
> > +#define                TOP_IRQ_RDI(rdi)                BIT(8 + (rdi))
> >  #define                 TOP_IRQ_STATUS_RESET_DONE      BIT(0)
> >
> >  #define CSID_TOP_IRQ_MASK              0x80
> > @@ -58,6 +59,9 @@
> >  #define CSID_CSI2_RDIN_IRQ_STATUS(rdi) (0xEC + 0x10 * (rdi))
> >  #define                RUP_DONE_IRQ_STATUS             BIT(23)
> >
> > +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)   (0xF0 + 0x10 * (rdi))
> > +#define                INFO_INPUT_SOF_IRQ              BIT(12)
> > +
> >  #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)  (0xF4 + 0x10 * (rdi))
> >  #define CSID_CSI2_RDIN_IRQ_SET(rdi)    (0xF8 + 0x10 * (rdi))
> >
> > @@ -219,6 +223,25 @@ static void __csid_configure_rdi_stream(struct csi=
d_device *csid, u8 enable, u8
> >         writel(val, csid->base + CSID_RDI_CFG0(port));
> >  }
> >
> > +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enab=
le, u8 rdi)
> > +{
> > +       u32 val =3D 0;
> > +
> > +       if (enable)
> > +               val =3D INFO_INPUT_SOF_IRQ;
> > +
> > +       writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> > +
> > +       val =3D readl(csid->base + CSID_TOP_IRQ_MASK);
> > +
> > +       if (enable)
> > +               val |=3D TOP_IRQ_RDI(rdi);
> > +       else
> > +               val &=3D ~TOP_IRQ_RDI(rdi);
> > +
> > +       writel(val, csid->base + CSID_TOP_IRQ_MASK);
> > +}
> > +
> >  static void csid_configure_stream(struct csid_device *csid, u8 enable)
> >  {
> >         u8 i;
> > @@ -230,6 +253,7 @@ static void csid_configure_stream(struct csid_devic=
e *csid, u8 enable)
> >                 if (csid->phy.en_vc & BIT(i)) {
> >                         __csid_configure_rdi_stream(csid, enable, i, 0)=
;
> >                         __csid_configure_rx(csid, &csid->phy, 0);
> > +                       __csid_configure_rdi_irq(csid, enable, i);
>
> Is this something that should also be tied to frame_sync_en?
>
> Also, just thinking out loud, are there cases where we'd want to
> toggle this dynamically at runtime based on any V4L2 configuration or
> pipeline path? For example, should it be enabled for the pixel path
> but disabled for RDI?

Obviously, if userspace subscribes to the related framesync event, we
should enable it regardless.

>
> I'm asking because one of the appreciated strengths of CAMSS is its
> relatively low-latency and lightweight capture path. As we add more
> features, it may be worth preserving that characteristic where
> possible. Not saying this particular feature has a meaningful latency
> or compute cost, but more as a general design consideration.
>
> Regards,
> Loic
>
> >                         __csid_ctrl_rdi(csid, enable, i);
> >                 }
> >  }
> > @@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
> >                         val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_S=
TATUS(i));
> >                         writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLE=
AR(i));
> >
> > +                       if (val & INFO_INPUT_SOF_IRQ)
> > +                               csid_sof_event(csid, i);
> > +
> >                         if (val & RUP_DONE_IRQ_STATUS)
> >                                 /* clear the reg update bit */
> >                                 csid_subdev_reg_update(csid, i, true);
> >
> > --
> > 2.56.0
> >
