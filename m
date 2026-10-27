Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793059953;
	b=eXOk5m3bo6mNzgvHN53fEyINss2mODUTLjH9xkGx1u278wYHZfqb4e46qW6HBA/vs7FP
	 AVw5284CgUWofajLKB4tqwYqqFp6EsUNk9vHbKUK7qmKaCOsG9TFhKUVvjUy8GslVJbHC
	 2ZOyOieiDRTOigwLsIAa2DqJ9SGQTCzOuW9iC1uOtLNySoJ0IT97dLm4S3RXIZ46FJSfU
	 x9bzkR0MwKZq3ZE4DcQiNQLleSeBfFH6nEmZbpsxLI4XK6SLgkaCUoBKhNSEyxnpoOcVr
	 GjkJivbpOJrbQL0BPnceYPrHxPaHdFF3AgK1dm0V9GiAT5xu1VjPn/8DDRNtOuDJ2jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793059953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zqeReXp4Fd39rBq122aMUNinDNeLKnGLgDArXJouPzs=;
	b=TVGRRLxzlWk4o2YMRPOYdO00Lyy18bEFNFy9gFy0fH8zxK+zjXvVY0bSs4f7hiJHMPKH
	 gaDnY+YicDC6n/zc3IklhEFR5k3nfLQHKfmC4c2Q7bqBXbkUKz4L4v9fCeWquTjmQIKNi
	 OyeY0DwLB/ACYbHQIOI1ye3aWPTXIS3EM6OCuscXNPZ4YrEL0qgSU4yYSJai+5uua1p22
	 ApnfXl9uHbId3GAFlwSiuA949XCSCcsxz0Bwwns6al2E/+PqRhomyMClZ6vH3KlzobCxt
	 pri1Fe6+ybK77zML3UHvx+P0s0Ui13VgJWyGe9pZQ/72GGyvaFwRPQdLGRIVFH4uYjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f3t8Buh5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h2Z4ZzmB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57C9606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 00:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E57C9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f3t8Buh5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h2Z4ZzmB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QMP3GW337835
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 00:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=zqeReXp4Fd39rBq122aMUNinDNeLKnGLgDArXJouPzs=; b=f3
	t8Buh5czisU4ALk79qlLHCKgOEzhNtNKQH3CYBYtvtryyBc7hSuQA6FAEJ16rR1i
	I56gG6PnC2O/4Pcymx8vCN1ed3fygvFSvOsJfpHkW0aaNohCivXvRfG7s24vJ8Pr
	m7cTg0X3BQie6WOIVZtcg2pm+wis01M6/68XOEiv99j7iE/ECjuqK2PPRf3rv1s4
	wbrTZHv4fESaeRHY0UdC9wBffVm7LFZ1ZAnHu/SGmyMPBUW6tq8GA/oNE8WaXGqe
	3BgBc8y52iStNCq7LQ1XbsOQ4ALsJ5I4MjMH8JMeSzHA5IzQkfIrF6UKL1PKkGkK
	KbXMgC+c2EEiEJMqsLgQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y2umr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 00:12:31 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4574f1cac98so4747054fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 17:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793059951; cv=none;
        d=google.com; s=arc-20260327;
        b=h8qnLutzmLWzanlygO9dQvvKSqohCMwIzU15Kd+tIprl857mOqqm6yCzLqEGZYdD1w
         adojlScCo2sIJT04RFOxqU2cjg1cm6K2DZhJOwhixUWsJPzPaJ/qqHuWVVrrS9HlfK4U
         63Hxq4JSyvJyQHjsGtgzU6kOh8WQyQ6+osbwWOLser4XnoeHnRyJYe0saPyKZWR+F02N
         oolKfuFzpije7iCHfrAXBKTDcAXqYkGkmmxKE8R26tsnzkrDlUEZh8KFk7Davz3QB15M
         3Cuhujir31coCalqZtbN5QsrLqOw8uN/ZcWGw9/b/dxo6/1Np/jkh4L8WCWy8egN37M/
         K7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=zqeReXp4Fd39rBq122aMUNinDNeLKnGLgDArXJouPzs=;
        fh=q7zbcB6p22RQ/FZYaPyx2xXeEIVAyv9ef0ZPDfQzC64=;
        b=rzEYD8ALgGlmgAxbBvo1ZoGD5ZmOVltYAdnP2xqmzHT1B3DPmWfFvFqAwsgU+klg0i
         9/4KpsMs8w4YU4RUt/OPV/d7//4sVyphbBR1zsgo+dgw634XQC9FVc//i9b5xsfxCUPK
         h4RtZZOAU2iBSrOgf1lpzT+0jFdofAGbGYBfGCUub6ifRQ3gFy0yKBaNxvD5+byBLy+p
         amujZ/9TWoKwUsa5aFx8zMU0+OMfnfLwOQC5+BWPMmjJuT4Z5881uqCtag7joceWwNSE
         I75YL2n7RNPUORGITK8H+89qRP3rWBQxkZCVji2VsR40at4yCJS3gawX4sSmWEuk4c1W
         rRUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793059951; x=1793664751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zqeReXp4Fd39rBq122aMUNinDNeLKnGLgDArXJouPzs=;
        b=h2Z4ZzmBE/jVvnEfRJT5BZGeM3HKFmz829NTRh9jPBA9neRQFm2ouaeLeLuRhcg0nu
         rzTKoBYLRZ5YExtRvztx0vgBavlIze4yPbcD/+/UT9KT9SXWkc20Mkj+3MK6W1qgJ74n
         AUBR9dfR8/aWjK09LL4YnMI+xOTlCiO2Jk0azIvKakLON6Ogh7bVQmeQ3FkGlWUHOGmf
         eS2oPH0nzuBwYlwDg7qCXKw0gjShU0n5bKaVf8itY+L0XJg9igsmpaYVIfafOdwgvZYx
         CSHKmpJXN5wNSUYJF3r0Tvp3JD3gIWCiy/dj462hjRyU3wanLXpaf4nSsYGNvoBXQM8H
         G3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793059951; x=1793664751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqeReXp4Fd39rBq122aMUNinDNeLKnGLgDArXJouPzs=;
        b=in6XugUh4Axmwd4o3Pc5ZANT1Q9NYpuJdgHFZpKY40HkDtMLWbiFzUFMWAhz0s0ivo
         8HZrj1oJdq5A7OmWBrngBRKxR7e9F1WPzeqjWe22d/jEybYAzCOzeBV0Z9GcfrosT7UP
         lDbF07ibmgksFpacVnf+LInTBHDk/1Y1J9iyD87/bhdqayQNf+lyKh6s4XXAKkEmcZVU
         gDzWSJj/L3FdrjM2G+e4M3ztOrna+5F38scu6H1AnJ8uMtXORZkxvMz/US6pi3G2Cevg
         jzwnJuAGLb3k/6HHcPB6tEUhKMKfS3KQlPWkV/QQvUUD0+JaPfBPA3w7x4DsFFuS9ncj
         IEzg==
X-Forwarded-Encrypted: i=1; AKwUvBysSSKhgPdJGKjqzul7MoLMcKLOtZLCOxFijO+O6a4E8ss+ioByy49FLy4k1l/TUUx+Jp2A2JnW53CZXraA@vger.kernel.org
X-Gm-Message-State: AFq9FYIM+6Cxw6SvOgC+Bht+Xkyw6X9/8S88NIPSMyTqzFz2uhbqEQlu
	ibAzdqom0aZJDfwXBBeJAKGgqtk9maXZcjt2IoDlYOxsFiB/a7NftAv+AbHTK3YYAnQopnHF/Ms
	BofERJ8+TEa5jTUFEc2QXbztS2ntyGdCAjGC3wxCXryFwwevFlbYaozUHvEmHCoZVG7Q/DoGx1Q
	z4Kyh/G2IQcko/KnT0uAJDw4VuMLhJKz/IbbYHkit9tXI=
X-Gm-Gg: AYBFou1R/wXc3Fajhk4ymX5MqnhpVa6HPvsxwhUg4pPcwWMkHEyZXX1zCTI19T+PS9q
	FUfLp8hTWEstafkY/HQ3/F1MZOhERtIi7n7ssz8QFFyRCfH4B7UWHP6CeVzFTHQYsIZ7fKqp6D7
	xmAUXvWmtzaUJ+rzgYl0jy/OIA4b8NRvUXcVCvi3y/+eWZETWbxeLf3M1wkA==
X-Received: by 2002:a05:6870:3909:b0:499:6b20:13df with SMTP id 586e51a60fabf-4a83f4aedd0mr4807243fac.30.1793059950528;
        Mon, 26 Oct 2026 17:12:30 -0700 (PDT)
X-Received: by 2002:a05:6870:3909:b0:499:6b20:13df with SMTP id
 586e51a60fabf-4a83f4aedd0mr4807230fac.30.1793059950061; Mon, 26 Oct 2026
 17:12:30 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
 <FZvwtKTpIxRNzjzcqFf6bTw12mNTJvJZmg6j9lmi8MehHBt91NogIW8oQd5yFHN5DSL8yIWL8p_b1cJPAJC57ZFkoe2BOAh_Y3kwph5SV_A=@pm.me>
 <CACSVV02x=GDTH40C57B1Eg8_CfmCgDGD_BE4f1auwFf=3eQNCg@mail.gmail.com> <HWs63_U2peTA6inCaYP8yY8D5MkYQ_f3KzN9-WXHzURewlVA-7MMJwkLffTUASri-OqRHtp0PI8PFdyUku_7PGxBaEyUbHda176jExmf2bo=@pm.me>
In-Reply-To: <HWs63_U2peTA6inCaYP8yY8D5MkYQ_f3KzN9-WXHzURewlVA-7MMJwkLffTUASri-OqRHtp0PI8PFdyUku_7PGxBaEyUbHda176jExmf2bo=@pm.me>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:12:18 -0700
X-Gm-Features: AclHuK_C5BV37gJkzA48Qc3yl4-u75Nn6bHK14ds3fgZdhSTNmho3RjLsLpW9E4
Message-ID: <CACSVV03k1EkZA1NxG9xRG48WVPuXOT9W7x3oFxfTiKZNp-40SQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] drm/msm/a8xx: GPU state capture support
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAwMCBTYWx0ZWRfXy9HWm3Yvotzl
 QL12J1Xq8vPmYUEmQr3+rMM2U/evELVscGKgITAWlRMo7No36juHlyfhfUeDbPJIpM0nDohrVbz
 hVlOMEr5AhdW2pcBA1kW0xuDT++pEwI=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adfec6f cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=oZfsDU2LrdIIkRBWPnYA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAwMCBTYWx0ZWRfXzoxhgbmPFkBK
 Ml3hdWLFvfspRvv592MLJo+8zhWBWU7XWf1GVSksCoEsgsu9unu37cBTQkq5JEKJ2iNeuuUjQCl
 LaLV5MPo1o5v90PBTJUpaNqvXBNGLV9twjigfU4foUci3iCnDv1WM3MfEch1zExlGlRQFgn3sW2
 Yn/8MgJa2tDiQbmm74ePpCF7OfmbKBIGbVVNwdrP+UK9k1Qw+VFwUEjiPnHBSTIqdd2IqlB4XxW
 AtnJoytcWOv1bunKWO4JnifSVDVNbhJAaoVMcpNGE9A65pteRtOFGrPYMBXlsPe2S50mABHx47r
 xavsYMjN9hcJA8IrsbG6f87PihugJo9+NLiGpkPALiSvihwnCGCENLIxz2a7II0G/X4LhIfy3PC
 PyLVwId2pNL3AG2Ytv3kgwrmGKzSEE55TYNTkRsxI3HURs7OCrE1FxsHHzW4xILoHvmFYUl9nyS
 ynTG+JJQHrmO7FqhM/g==
X-Proofpoint-GUID: 0710RN0OVZv_zMBEXeDFbW2creoEZvhw
X-Proofpoint-ORIG-GUID: 0710RN0OVZv_zMBEXeDFbW2creoEZvhw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270000

On Mon, Oct 26, 2026 at 5:03=E2=80=AFPM Alexander Koskovich <akoskovich@pm.=
me> wrote:
>
>
> On Monday, October 26th, 2026 at 7:32 PM, Rob Clark <rob.clark@oss.qualco=
mm.com> wrote:
>
> > On Mon, Oct 26, 2026 at 4:06=E2=80=AFPM Alexander Koskovich <akoskovich=
@pm.me> wrote:
> > >
> > > On Wednesday, October 21st, 2026 at 4:54 PM, Rob Clark <robin.clark@o=
ss.qualcomm.com> wrote:
> > > >
> > > > I'd appreciate tested-by's on Hawi, Maili, Milos, and Pakala, since=
 I
> > > > don't have these devices at-hand to test myself.  In particular, do
> > > > things look fine after the switch to generated nonctx regs.  To tes=
t
> > > > devcoredump, you can use the msm_recovery test in igt.. or just:
> > > >
> > > >   cat /sys/kernel/debug/dri/*/gpu > /dev/null
> > > >
> > >
> > > Tested this series on Milos, series as is works fine for initial boot=
, navigating
> > > around GNOME & apps etc, but when I run 'cat /sys/kernel/debug/dri/*/=
gpu', run
> > > into an oops.
> > >
> > > That is resolved after removing 0x20400-0x20487 from milos_gmucx_regi=
sters,
> > > and removing 0x0f000-0x0f002 from milos_cp_cp_pipe_none_registers. No=
t sure
> > > if access to these is restricted by TZ or something isn't configured =
right?
> > > These ranges don't seem to be described downstream in adreno_gen8_3_0=
_snapshot.h.
> >
> > Thanks, yeah, there seems to be some things blocked by
> > tz/hyp/something, which are not blocked on glymur/el2.  I'll have a v3
> > soon, but still chasing down some of these details.
> >
> > >
> > > After that 'cat /sys/kernel/debug/dri/*/gpu' works and I get a dump, =
did observe these errors in dmesg after though:
> > >
> > > [   42.891106] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891142] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891157] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891171] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891184] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891198] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891211] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891224] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891237] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   42.891250] platform 3d6c000.gmu: GMU fence error: 0x0
> > > [   43.640122] ------------[ cut here ]------------
> > > [   43.640137] msm_dpu ae01000.display-controller: [drm] crashdumper =
timed out: status=3D5c00bd00 (-110)
> > > [   43.640222] WARNING: drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c:1=
15 at CD_RUN+0x20c/0x594 [msm], CPU#3: cat/1929
> > > [   43.640419] Modules linked in: rfcomm q6apm_dai q6prm_clocks q6apm=
_lpass_dais snd_q6dsp_common q6prm algif_hash algif_skcipher bnep snd_q6apm=
 panel_raydium_rm69220 fastrpc qcom_pd_mapper ath11k_ahb ath11k mac80211 hc=
i_uart btqca bluetooth qcom_iris cfg80211 ecdh_generic msm ledtrig_pattern =
videobuf2_dma_contig ecc v4l2_mem2mem drm_dp_aux_bus videobuf2_memops qcom_=
q6v5_pas ocmem qcom_pil_info videobuf2_v4l2 pwrseq_qcom_wcn gpu_sched ipa p=
wrseq_core qmi_tmd focaltech_ft3683g qcom_q6v5 drm_gpuvm videobuf2_common d=
rm_exec rfkill drm_display_helper ubwc_config cec qcom_common mdt_loader li=
barc4 nft_reject_inet nf_reject_ipv6 nf_reject_ipv4 nft_reject nft_ct nf_co=
nntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables uhid fuse usb_f_ncm u_ether=
 spi_geni_qcom evdev libcomposite
> > > [   43.640750] CPU: 3 UID: 0 PID: 1929 Comm: cat Tainted: G S        =
           7.3.0-next-20261026 #3 PREEMPT(full)
> > > [   43.640763] Tainted: [S]=3DCPU_OUT_OF_SPEC
> > > [   43.640770] Hardware name: Nothing Phone (3a) (DT)
> > > [   43.640778] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS =
BTYPE=3D--)
> > > [   43.640787] pc : CD_RUN+0x20c/0x594 [msm]
> > > [   43.640972] lr : CD_RUN+0x208/0x594 [msm]
> > > [   43.641155] sp : ffff8000891c3990
> > > [   43.641161] x29: ffff8000891c3990 x28: ffffc3ee34aef850 x27: ffff0=
00809253000
> > > [   43.641180] x26: 0000000000000001 x25: 0000000000000001 x24: 00000=
00000000020
> > > [   43.641198] x23: 0000000000000000 x22: 0000000000000000 x21: 00000=
00000002114
> > > [   43.641216] x20: 0000000a28796b5c x19: ffff000813d7f000 x18: ffff8=
000891ad078
> > > [   43.641233] x17: 3a74756f2064656d x16: 6974207265706d75 x15: 64687=
3617263205d
> > > [   43.641250] x14: 3fffffffffffefff x13: 0000000000000003 x12: ffffc=
3ee5c6649c0
> > > [   43.641267] x11: 3fffffffffffefff x10: 0000000000000003 x9 : 9e145=
38c77bb2600
> > > [   43.641284] x8 : 9e14538c77bb2600 x7 : 2e30303031306561 x6 : 20757=
0645f6d736d
> > > [   43.641301] x5 : ffffc3ee5cb061bf x4 : 0000000000000345 x3 : 00000=
00000000000
> > > [   43.641318] x2 : 0000000000000000 x1 : ffff8000891c3790 x0 : 00000=
000ffffff92
> > > [   43.641336] Call trace:
> > > [   43.641343]  CD_RUN+0x20c/0x594 [msm] (P)
> > > [   43.641530]  a8xx_gpu_state_get+0xdc4/0x2698 [msm]
> > > [   43.641714]  msm_gpu_open+0xc0/0x134 [msm]
> > > [   43.641898]  full_proxy_open_regular+0xe0/0x1e8
> > > [   43.641913]  do_dentry_open+0x154/0x4d8
> > > [   43.641927]  vfs_open_consume+0x40/0x114
> > > [   43.641939]  path_openat+0x440/0x6a0
> > > [   43.641950]  do_file_open+0xdc/0x198
> > > [   43.641960]  do_sys_openat2+0x88/0x118
> > > [   43.641972]  __arm64_sys_openat+0x78/0xac
> > > [   43.641985]  invoke_syscall+0x6c/0x12c
> > > [   43.641997]  el0_svc_common+0x98/0xf0
> > > [   43.642007]  do_el0_svc+0x28/0x38
> > > [   43.642016]  el0_svc+0x4c/0x1ac
> > > [   43.642031]  el0t_64_sync_handler+0x6c/0xe4
> > > [   43.642043]  el0t_64_sync+0x1a0/0x1a4
> > > [   43.642056] ---[ end trace 0000000000000000 ]---
> >
> > Hmm, not sure about this, other than maybe whatever is causing GMU
> > fence errors is also causing the timeout?
> >
> > If you run something that keeps the gpu active (or disable ifpc), does
> > that help?
>
> Keeping GPU active doesn't seem to matter, get the fence errors either wa=
y.
> Though, if I disable IFPC then they go away.

Ok, yeah, it looks like we never updated the debugfs path for IFPC..
I'll fix this for v3..

BR,
-R
