Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AE1340280
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 14:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788618319; cv=pass; b=CXBdQMH1MhWC8RYbEDHtDPNxF5QUrHcG0SGrBfYiTbj6FoFUANqJK8bvxiqKvXQKiM2idHXPa7n62AGOWyD/d4YGtKSNJhgjQYwNpYHpbvEPTWmVQ60d1Sn2VGwEtYWGaaJkCZHiiao0rvxsgXZ+ollybX4krWwkDiT3PygQtdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788618319; c=relaxed/simple;
	bh=XwtrGNVVSkrislr7dr5hfZ6oGK5Ir0UMOhvhii4U/sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+OREWo8rYSwvPWtsEALuHFxp8ZFIBFQO5LxXXz1alEbDI9uyZE5Gi7VwKDo+oCpXzfgHWYh4rHkWyJmzgHxZWvsoWfq6tjBNaPMb0SzDayp7lIb5Z+SU/uG4r8M/G0rt0/NDwQkISrr0ZlXE76IXj4PEk1RDaQoOd6Nv5OBNpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WxCpvAc1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j70FTvtd; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxCpvAc1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j70FTvtd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685BVQY83378173
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 14:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=TEJoaOLREJ7ky89PpMOiUDudDFY0hbDCRGifOtYnzEo=; b=Wx
	CpvAc1/EgcHJE0//gj/tTwWEghDKBXot8xBahwwzjfqbFVE2DJOtbNuu4hym5oxl
	uErb9o9/OdRG5pN7ql1seLquCPNAvzIskRLXQ7D249BiUiy9a23FiO2vFDTzERr/
	M2YiULV182qVKbJMgTNpiYnQ0zxBRD9HTvDp9lzK0z4GzVV3dbHQwvvb7jB9e/M5
	Lp1E19Hv8x8bnTcRvyJ440FvqQhQS4nw24qKtD49kHc/OKq1R519hbv3ZwgCQNmy
	R6o77YqOI8NHx5q4fdWgO6CyBLsHZaG4TJQqurWvlRH9pJ5Q6Zb8wJAYXJgSJWj2
	BvQWdV4tA2sSko/6RoWw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8sd1kyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 14:25:16 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2f2b8d88fso2522201b6e.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 07:25:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788618315; cv=none;
        d=google.com; s=arc-20260327;
        b=Ov18jRZvVZBCTG/Ip8IJLnIDZNLhK+ScFnJCSyX70/bPnbsG7Y2qYGrUSjcaCPabW/
         /q2mRO/RI/UIYVQm0UrptHNKeyO69+1q7FbTodWOznv5eYdGwUR1T+pTTQRrz0dxZsws
         nLAnK+JQEfPD2fOruxzRmGBsmhMiKDDZPoAQS5B9x4RmKLHGcuNZ0aF81uV4dWrD6jdr
         F9Neukuc8CiXil1fzQT+N0DIUKLiOJ/cNfb3MZls55Pf6AmU6BnqTAdAq5ONbv78Rwag
         U8iJe4m5oDfJncE80DjvkakM1S3Y5KpXgCqyYggHR1xxG9jofup2MXHZ1y5fdXnNrQOl
         skzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=TEJoaOLREJ7ky89PpMOiUDudDFY0hbDCRGifOtYnzEo=;
        fh=wMzjdlvlL+h9G253vjeZ6YbRKdAv0JNsYvIX4fq2/cU=;
        b=Xh98qV6H7I0ZIbdKtBUtjwy/i2sD7+QkspW+Xwm3dtnoOwOgh1iH4jY6skamzthTFc
         ebPdULlQ+RudQYwMZ7RpFwAL9OecIneuJL0dMI7FLVhGpkmO2wXRAHXhBNCa6e6Eyeau
         10wyTVuCD+CkqJrCtGKjJFdFCUR77eqFjMmU6QYvKkGM14oN8Hne23sXomhFTY7AIRCb
         ojtGnMWhDISbrMYx7OWSxuQxL2X0x6rYvF8UsP6w2On72wSDYJHRx8Hk2t2TajY3xda7
         u/zz2XIUAHTrFv0qqD35yruKcihbxw3LySzKOdMYlwAa4nTgQfC6bt4XtNX6i35uUW65
         6t2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788618315; x=1789223115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TEJoaOLREJ7ky89PpMOiUDudDFY0hbDCRGifOtYnzEo=;
        b=j70FTvtdPkBLjVcsiaDQk2drV+J0CjhzU3MDqMtEwdWKd2zeA1stM1YyLJKY7CmuJ0
         QH5JlQtZWpGJVad5zcB8Sbv9k5gnj52b5rp8BXoxPi10KMCD96JsgKI9tc1r12NE+vg9
         pUaZzvZTkdzalnk1/OH1SwAtO4+LsfSDiSA4BGDts50MQdu9TNrLLsZ34f3R9zsMSr53
         jwo85FGZm84xTyDAQcpOKyYcZhCXdkYEOW9/5peFCLF86L/F9Yyx/y5hIObXc8hVKd/1
         JWufK3KKlOMaCbANyBMA6wvxWPV7Ce9nHF6//VwTG0sX12c8VqfD72jXiFpZjED8pN3g
         gX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788618315; x=1789223115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TEJoaOLREJ7ky89PpMOiUDudDFY0hbDCRGifOtYnzEo=;
        b=qd38Pek7Hn1GgmivBCUAUbflYX+kBMBD3WbZYMcGZEGgjShQq9vhXF7pYcVsWLUPz2
         S1vV7K8RBManAoA57wdLj86mNs98P8sdSfYLAzJi6U6elmqJFhbj+t/CncqsracglPUI
         ysX6VOX/KQglvUIqyKW9RH9GG+Ysb31dz6K+sCjcDsbCbqrerzA5LegHByY1HbqLFtDw
         dZG7rhOg6gqD6mNYRMsthV0TBYq1FVtoMzLufkvX5D0fQDNV5V9XE/imEQL7TK2X3Cga
         V2IAWwzRbq8YJyZSOgZBq6A5orcBfr7ATkcVQXAzxMjD5d4utW7FWWTXdJi84z4OjW4L
         3dvw==
X-Forwarded-Encrypted: i=1; AKwUvBzJN/nIDScb64oH/czAyWNgjLqUBRikJY0RoJS11tRo2ug7FiBKiRO8FsQRDfp3b/BGQnf+4Y8IRhHORGoS@vger.kernel.org
X-Gm-Message-State: AFuF++koJ6KHAkNSbe8Le5v/R+undngkU7v6APXlBF12AQZoASViXpJN
	twYS4Z9M/6/u+WcQ72LPoS4fQ+JIH/vbcdXWTPe9IyG87Mbc7u2OSJuRaShSgnp3LYRT+r507m9
	xRP2Fu+sUtrcS2b/6jIo9S9cDbLqdzg0eYDW42dIp21tiwwuAvqXCZFzey4KgXWsxzcc4dm8LPu
	KDXsDwsYGbUDTjibZD0R0lTEcam/T8cBoM70hU0mpi3kjHUjU9CuY=
X-Gm-Gg: AYBFou2DrdEhpqlyPwzDe4ymyxLDeG3n0xy4TckZkAZA1BBJhTQKS7cu8jX3LqxohHy
	pw764IFJdC0+tbYduxWgXWN77DwXY4KzV7jRbr7UUk7udFP4pAP6xl+rJFQIMIPyHDdst6+PW68
	P4xsn9vDr/pv68AzSOhEUsLOKPMd02hCFq37aRUHTTpT0p/w/ueoYekR7a
X-Received: by 2002:a05:6808:1395:b0:4b2:67f1:11d7 with SMTP id 5614622812f47-4b9636b626fmr12210907b6e.17.1788618314879;
        Sat, 05 Sep 2026 07:25:14 -0700 (PDT)
X-Received: by 2002:a05:6808:1395:b0:4b2:67f1:11d7 with SMTP id
 5614622812f47-4b9636b626fmr12210863b6e.17.1788618314341; Sat, 05 Sep 2026
 07:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820154428.1278@ferrisoft.com> <30d4a7b4-1f1b-4589-b132-2115cab98b71@oss.qualcomm.com>
 <20260905085428.reply-a8xx-fmax@ferrisoft.com>
In-Reply-To: <20260905085428.reply-a8xx-fmax@ferrisoft.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 5 Sep 2026 07:25:03 -0700
X-Gm-Features: AcwNN1VGjYKCaVAdjVj_CV9ZUwDN_wxCLN7sg_J_x04ObDxcG-lql5Xlet69y0g
Message-ID: <CACSVV00EV+QoaCiQVBRm8E6ScBA_orQrhHPFBCTTQ9A89SS8EQ@mail.gmail.com>
Subject: Re: drm/msm: unrecoverable a8xx hang-recovery loop on Glymur ("cx
 gdsc didn't collapse"); killing the offending client does not stop the loop
To: Greg Ociepka <greg@ferrisoft.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 19Z0tobZIfFE0f2N9XAty6nHUI6tqrUv
X-Proofpoint-ORIG-GUID: 19Z0tobZIfFE0f2N9XAty6nHUI6tqrUv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE1OCBTYWx0ZWRfXy1dxcdiP2S36
 cX5Nm5sTuVyXCf4iDFf6XmQ+SZW4ZnJlHXw2zfwm2asIcRbSr2Z4yDPZiG+wJZCoqY+XwzdwjWb
 utXz/0NKtSWWoBqhJs4UjWw9mcS8ih0=
X-Authority-Analysis: v=2.4 cv=dfmwG3Xe c=1 sm=1 tr=0 ts=6a9c264c cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=zXLAmZJP3ypUEzgl:21 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=a8UEx8NLAAAA:8 a=saP2t_mShj24_FTDOHQA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22 a=-yeuc7zBjbfZT8aiaP-D:22
 a=-OPlMFtxszdMq-1ZrUoe:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE1OCBTYWx0ZWRfX7BTd6UDcGMwp
 qrVtdqS57pKQ/2TnQi861IYYFoi0WCcFwfmxUOg9g2u2DYrExofab7X5Eox1MnFNJe5ywrUBzVz
 98T0FYzUMuigHhma636HXS3DRayA7utVJF2zZPFDS65gq53Irm5uGAe8XIBg3/ya6UFsg0xvjiM
 l8z2Uq2lLCqg30H6FCjurYWsK0jyTlE32oEgMJwLcBbu99DH9YfYMB+76a0TtGnEHXFbwZUzR7s
 6j2YLr5EBGHtmtF5tAmIw6wxJFXBViD2CNHpQuBC+BqWvTwdiYxTD99eVsL+sPdSzN4y+4B7JpC
 TnvdMl5r1viia0a9W6I7RnKM1F7ChpWe5Paeln7U5+4+q0/CuEVKbhs+A1nTRyaDLhfdKldyXOj
 lCgzCCVkPkhILD5rbHZ2WJt7LaecorfIXRQ1J6TPmcDA41U0u7VCJuY+w5gy0njzx/1db3QIDaB
 jf5XAQh4499t/Joa4BQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050158

On Fri, Sep 4, 2026 at 11:54=E2=80=AFPM Greg Ociepka <greg@ferrisoft.com> w=
rote:
>
> On Fri, 4 Sep 2026 04:29:16 +0530, Akhil P Oommen wrote:
> > On 8/20/2026 7:14 PM, Greg Ociepka wrote:
> [...]
> >> We are happy to test patches, run instrumented builds, and provide
> >> full journals or devcoredumps - the machine reproduces this every
> >> couple of days under normal desktop use.
> >
> > Does your tree have these fixes:
> > https://lore.kernel.org/lkml/06489359-1b96-43ad-a065-bfb9bee51a10@linar=
o.org/t/#u
>
> Yes, all six of them. I checked each patch of that series against
> linux-next (cgit):
>
>   d9108bfdb746 drm/msm/a6xx: Fix stale rpmh votes after suspend
>   b303e1d52811 drm/msm: Recover HW before retire hung submit
>   fc7ccbc6174b drm/msm/a6xx: Fix A663 GPUCC register list for state captu=
re
>   d052d0358fb8 drm/msm/a6xx: Fix A621 GPUCC register list for state captu=
re
>   bc024d325e98 drm/msm/a6xx: Fix IRQ storm during msm_recovery test
>   40b793714ad8 drm/msm: Fix task_struct reference leak in recover_worker
>
> All of them are already in next-20260730, which is the tree the report
> (and the four incidents in it) came from, and they are in
> next-20260831 as well, which this machine has been running since the
> evening of Sep 3 (7.3.0-rc1-next-20260831, with the same local
> platform patches as described in the report, still nothing anywhere
> near the GPU, GMU, GDSC or clock paths, plus one unrelated
> fs/buffer.c fix).
>
> So the loop reproduced with these fixes in place.
>
> For completeness, the timeline since the report:
>
> - After the report I started running thunderbird, the most frequent
>   "offending task" of the earlier incidents, with
>   LIBGL_ALWAYS_SOFTWARE=3D1 (llvmpipe) as a user-space mitigation.
> - The last incident on the next-20260730 tree was on Aug 30, 12:10
>   CEST: 689 "hangcheck recover" cycles in one boot, with a different
>   client as the trigger, so the mitigation did not prevent it.
> - Since the switch to next-20260831 on the evening of Sep 3 there has
>   been no incident, but against a historical rate of one every few
>   days that short a window does not mean anything yet.
>
> > Also, could you try limiting the Fmax to < 1Ghz?
>
> Yes. The OPP table as the kernel sees it here (available_frequencies)
> is 310, 410, 572, 760, 820, 915, 1070, 1185, 1350, 1550, 1700 and
> 1850 MHz, and max_freq is at 1850000000 as I write this, i.e. the
> full range. I will cap it at 915 MHz, the highest step below 1 GHz,
> through devfreq at runtime:
>
>   echo 915000000 > /sys/class/devfreq/3d00000.gpu/max_freq
>
> and keep the machine at that setting under normal use. It is a sysfs
> setting, so there is an uncapped window after every boot until it is
> re-applied; I will log that window per boot and check any incident
> against it, since onset correlated with session restores in the
> earlier incidents. Given the historical rate I would like to give it
> at least two weeks before concluding anything, and I will report
> either way: at the first incident under the cap (with the journal and
> trans_stat, reset when the cap went on, so you can see devfreq never
> asked for anything above it), or after the observation window if it
> stays clean. One caveat: this stacks on top of the kernel bump, so a
> clean run would not tell the two apart on its own; if it stays clean
> I can go back to the full range on next-20260831 to separate them.
>
> On Thu, 3 Sep 2026 13:16:47 +0200, Konrad Dybcio wrote:
> > On 8/21/26 3:35 PM, Rob Clark wrote:
> [...]
> >> Fwiw, the kernel I've been using: [1]..  but that doesn't have the a16
> >> dts. I need to move forward to something newer, hopefully I'll get to
> >> that today.  We'll see if I start seeing this issue.  Or maybe
> >> something x2e vs x2ee is different regarding pmic/supplies?
> >>
> >> My device doesn't have the highest OPP (1.85ghz), which I think your
> >> device does.  We might be still missing some power related features
> >> that are (more?) needed at higher freq's, or maybe I have a more lucky
> >> piece of silicon?  Akhil would know more about this.  You might try
> >> removing the highest OPP in gpu_opp_table (in glymur.dtsi) to see if
> >> that improves stability?  (Repeat until it is stable if you have the
> >> same issues w/ 1.7ghz.)
> >
> > Greg, have you tried this?
>
> Not yet, and sorry for the late answer on this. We have not run the
> machine with the top OPP(s) removed from the DT for any meaningful
> period, so there is no data point from that side; what we did instead
> is the mitigation and the kernel bump described above. Rob's guess is
> right: this is the X2 Elite Extreme part (UX3607OA), it does have the
> 1.85 GHz OPP, and it is currently running with the full range
> (max_freq 1850000000, see above). Mesa here is still 26.1.5, the same
> as in the report, so it has not been a variable in any of this.
>
> Rather than removing OPPs from the DT one at a time, I will start with
> Akhil's Fmax < 1 GHz test via the runtime cap above, which is
> reversible without a rebuild and is also the most direct test of Rob's
> "power related features that are (more?) needed at higher freq's"
> theory. It is not quite the same thing as dropping the OPP (the GMU
> still gets the full table, the GPU just never gets asked for the top
> levels), so if the capped run stays clean, walking the cap back up, or
> dropping just the top OPP from the DT as Rob suggested, is the natural
> next step to find where it starts failing.
>
> On the x2e vs x2ee question: I have no insight into PMIC or supply
> differences between the two parts. If there is anything worth dumping
> from this machine on that front (regulator state, the level table the
> GMU is given, ...), tell me what and I will collect it.
>
> The offer stands: at the next incident I will grab the devcoredump of
> the first crash state in the loop, before it expires, together with
> the full journal of that boot, and I can run instrumented builds or
> debug patches on top of next-20260831.

Devcoredump is, unfortunately, not fully wired up for gen8, so
unfortunately it won't be too useful.  But this does smell a bit power
related so I expect lower OPPs would be more stable.

BR,
-R
