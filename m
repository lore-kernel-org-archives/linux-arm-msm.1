Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793714349;
	b=DbcJNPpJlNMu8cvRDuuIkYz5Af5R1Rj+plHSuAP67Sh6oEk/EVX5CjZHAcevNshfBb98
	 nEdvXToWtRpjkgnISHUrHSE1UPBEpI22lw7QaPmKklB0/u6dCQhSMcJERKPEE+LhKyETR
	 53IoOzfucddWPgD/GLVZIkQ5Bj0H//RvhxtBYopsHMTCLaRpiSnIDuq3MnShQwcctLBVW
	 qdGBqaHmH4l6egjsXdpvFY17lQ8bhrfaff9Lzu1CPyHc2y6N1rS6y5Il0zXQF3pU91mqM
	 zXOiYy4PIVgqw4qE2iN5hliKJsd3Ihi5MyMF2b5ej1BKWvsqPBMVZ9hvmyfjyR1VYKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=u90xeG6/S0yuMe7vObs+gJMuK1wiVaVYhBCszGbd01w=;
	b=ig/Q7aczV8lae1ProV6CjqqRCyKCtTHqOHF0pOQCi7dBtrUsurA1VjlJmrwBTLcVJn0q
	 xDM3NLXVzcElvrG71U0a4xI1eZ/ZEJ7e9d9FdPCUxHYY/XgxCJOGpo+7e+te/4O7pFfHM
	 DmMiyhFQYhKwRSY4HbCRLarpL7hkn8MrxKC0eNekJplr0+DYhGOt3XcwsJODcwdbEq9BW
	 7LCSYFo8kY09eCXbgwM+RvAcJdSz0ao9r8tIUkxV6hR/IAb4i3iQr43mYJ+x5vKDuReZX
	 Hp/wHzxPiZSN3xEUyXcTUhMdvQqsVp+VAahANHC2L6iGMBu2+T1eS1GNx9u4hprP+Ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGxC1mwP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fevYvbuV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28381606D801
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28381606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGxC1mwP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fevYvbuV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZ9uZ2651032
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 13:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=u90xeG6/S0yuMe7vObs+gJMuK1wiVaVYhBCszGbd01w=; b=iG
	xC1mwPptWpdT1D6vcWOrJT7YGbwYWQ16/+X/ZgA8NlyLZrknojkAvk56J5TtjwN4
	R03mflmufRMrN0D9uBf3UWl/2DpOp+fCWgqxTG7hIACsCWJLN+KFalD9KPfFrCUA
	gJY7ayiDA5zzx/hOdwJv3S+nGXuSCR4phizUb6BGgtjJcb+GugZRuzaU/GGei9MQ
	KvCepF4IfDGf1M9qsIBGtz2V+kNsymzqdGwuMdTZ6M4F1fyO1jfjqYQtE7+woGQK
	Hjjs+ovy5jEPVdGGQYFRg8uYc1OGCRyhQAOn9kX5NR9OhUrJuFlBHMi3nXiEJTW7
	6n6vTAKO+h622dolteng==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r4243-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 13:59:08 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso8062477c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:59:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793714347; cv=none;
        d=google.com; s=arc-20260327;
        b=oHXFh0+3m40ImwlKbDbhtfbW3H56z3nAHvWkUZemGU6WYW/2dg3bV7ZpW0yvMemZd0
         tczrV9qlRxI5FILsb8LDTpeI+9uTkuP8nftIpK6T99/Juc3Njf+/nyRBkWLctOvRxIpx
         6Tdcsui69Ln6CVRsYqrJHiz8Ihoum+eiC/larnPEQ6IpN5XSCHQlTU2fSB7D8UMl+uw5
         seonDaOAh9pZ0i8OkeKieVsPFzfuAGI5aMIfAjmxrd4A2f/3x8lbkc6MohyaXcGsS4Ke
         8kPC9iWe9GudtpCjrE6mcX1OtWgR36qWb0WsvNUiQVzlgmm5r5KWQHNNh5kwcO+qaLZg
         wFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=u90xeG6/S0yuMe7vObs+gJMuK1wiVaVYhBCszGbd01w=;
        fh=W5HOmCIH928ld+IGA+9kxtjVTFVJQCD+3Ms4KeybDr0=;
        b=UlLsYhstA0K1LSjSTZQaai128sY9NFMlorqNcqzbqODNuoVyrjkO+fMpGjdiC1Oz3m
         kIBB4xjfV4Sd/GhOz90nM02GkQ61V0YxPHXrbPvNbiyg1HDHVO9mv+ID56cUInSHAFe4
         jTIZq53GQkENkqY8X4Ilm7Twp3pyaFBjD/d35HMDhdnmfK6sorY4YXn11mDYINBWacCq
         wWBVxv0yZ36bBoimACGwomSCzIvEbWv09O8/Q9CaOARLOmkXg3RRflqniFf6AbUSQnjg
         C8eP898fcJLX/d3VxoZwqJd2T6wIqXEfz/jmhxLIzRVCPHRlfZw4nabrLgfwW40k5kIH
         iqqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714347; x=1794319147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u90xeG6/S0yuMe7vObs+gJMuK1wiVaVYhBCszGbd01w=;
        b=fevYvbuVMJ3gyVcUzz0g7R5tKITJDauycMQ46jrhwTKFoIn3VtxolCT4c/RGljRGhI
         aognUkMj1bvelrAKNAGswoIi9gIIdT6Fod5OCU5EucusX9FkwQHFdGuDPc8VGba7EOqZ
         XtUaU1XGJw08qHmMZvV/n3T9ZuLZWs3hJFdwy+L54LPYhVfFLTrjdIzMIV2apMwlL7Oi
         rMRsd1bJ6YxjOC/Ox/7ywUf8QNCohUeNAhM27Iz8MEn315lu1z7XvLtK4GkwR+jQYOQk
         VV18eSVt4oJistkplp+g03qrBvB02ykKK2qrAg/G73CK4AZl8poTTjIgUWrsxvaXpB7a
         mZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714347; x=1794319147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u90xeG6/S0yuMe7vObs+gJMuK1wiVaVYhBCszGbd01w=;
        b=dYViIDFMoyF8DVRr3N+SJHji59Uq/eFsF4jEHIyhL8CgUi7i3zVAvemjQQ9g5DksLR
         KvVssPqhpzaRzoSdndstBp1j+AGj0cADQsVZTRo64mgN2qdD5dPidVmihApOdJR0iS4Y
         V7L/BbH8e5X60miOnVJZPHhw9l6RgRn+FFpOQfQgXSHH94mcqnVeCALPyNCGGCKtnWCT
         sK1nLBSDyonEVwl4VJR6rj02VvnvGAmPkev5+I3B3s1ePIvnMg9V4WRtQEyJYh8q6uoG
         Yk0Gxv12dPkXpRbwOqM+TZC7fXSf3kxDNHMYafthx0za/YOaw+FYLFJ1KZH+gcLMTn43
         bUJA==
X-Forwarded-Encrypted: i=1; AKwUvBxEq9r8LmIyYKT9Fo8gd+f92vsdEpucuLQlqLvEKdjcI007Zio6oEQ0AE30nnXjM88cdSTC2WMjB4mpE6Ml@vger.kernel.org
X-Gm-Message-State: APuU4Z+HdO1u8QGUT6oJylF1eHRev63/MViMVTU6DrpGeuo6E/CuHPns
	IX3QdMsXBTF/AxZPkcJ8uDt8zTcjBxlVemmFNvGwvOm11BkBfQLZ0XboV36U4ZbLPSF8W3vswGr
	ytVjBdfiRVx/qnQ1SWNX/IHplJSAsfkuTz52fgoEAmNJQQBA9k/21Y7Dlr93IFk17OnSJ+VpAQq
	xmOjK+bRRkaOAu1dfGRaJiNf4ltncHh9NOE6xDTPkWsqs=
X-Gm-Gg: AYBFou1AfGyE7GMJFJ23JMO4DaAUEhGtG/olSI6N9mGIqLD2I2r7C6hm+yeqiIRxmon
	DWUjmRqh5Hw/cu9lV43zOX/tqUj+9vyZVwJSXdhbhuMmCWkw80IFDOB0fDq68oQ2TtCIbjJ9Azk
	06zTDpTaQAkznPEkntGwgqhDBBwQBnT88bzTEy945fnI0Le19+pyhnMPLvfQ==
X-Received: by 2002:a05:701b:260c:b0:1ac:9ecb:acee with SMTP id a92af1059eb24-1ac9ecbb353mr16682673c88.39.1793714346765;
        Tue, 03 Nov 2026 05:59:06 -0800 (PST)
X-Received: by 2002:a05:701b:260c:b0:1ac:9ecb:acee with SMTP id
 a92af1059eb24-1ac9ecbb353mr16682661c88.39.1793714346238; Tue, 03 Nov 2026
 05:59:06 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-4-robin.clark@oss.qualcomm.com> <a4151c32-bac2-40ec-86f3-59d4dbfaae62@oss.qualcomm.com>
In-Reply-To: <a4151c32-bac2-40ec-86f3-59d4dbfaae62@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 05:58:54 -0800
X-Gm-Features: AclHuK9kb5ZKwTYoNlq61wHUgD5ZG0TonX0oq6CE970XUEKeSRMrykv6fVdNHLo
Message-ID: <CACSVV02mTpCPZ-JtyYrsTEsRXKyS3zuxTehx=c91NbxgQSdpUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: VPU-4-BCpCfBP-A9FLkzLIuh4A_oeZQU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfXxZYqm3Iee0e/
 H40UyIhxMIbhm+azkisH+FgjXDWhMizuKT7Log619v9TX0UnEQIWFS7rOCzCtmQosf6ze/HrjVX
 YD55bP9CDdl5iz5xWvkVJ0+2TAyvp6c3l2cn9CrhSuyBBwTjGTbvlF/t6YlUh5on5SOnMIKONpt
 4wD+AFdA1DMOM4jBE2B/O+3TS9Q5d0MM/gXNxwy09ZVNNLdtPI65YA8aKCyhqa+enRMpX4iYieS
 b1jsmaKuA/PFmPG342Jv8qqPsiuUx1DVvFZPukMsh7xfXZ4XxgQwV3vFgb8GLaGOybhNher/L8Q
 c0Q7eJy3WOEaFw0VpVGQH5zH9rFv5T27rs5tUHAKikPpLyPkjwTNayxEqQr7sK54iY/jRPYYonG
 66zPaPWZwb63+PT6oiXtIEf3dSFJMit3cgLRUQEUS4eaXDeSV82kX5iP0n679omHhbxRK1NsEE/
 4ImD4QL22icPitdDcNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX6raexpyCYyR7
 bBH4WRmp06+MHLvSplf45o1P2VIQNNFXS4WfeLHrKXOvDui6/5SLEl+hbZSlvWDfFpAb+5C8zSv
 rCLgGQT1psykYWWYBaX7fSwClUxyDOw=
X-Proofpoint-GUID: VPU-4-BCpCfBP-A9FLkzLIuh4A_oeZQU
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9e8ac cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=dQossMmbW6WhV1w7_6cA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030055

On Tue, Nov 3, 2026 at 3:28=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/2/26 8:00 PM, Rob Clark wrote:
> > We need to move the gpu lock around a bit for the next patch.  Use
> > scoped_guard/etc so we don't have to make the error path handling more
> > complicated.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
> >  1 file changed, 12 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/ms=
m_debugfs.c
> > index f12701e286ec..aa59b28a3392 100644
> > --- a/drivers/gpu/drm/msm/msm_debugfs.c
> > +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> > @@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, struct=
 file *file)
> >       struct drm_device *dev =3D inode->i_private;
> >       struct msm_drm_private *priv =3D dev->dev_private;
> >       struct msm_gpu *gpu =3D priv->gpu;
> > -     struct msm_gpu_show_priv *show_priv;
> >       int ret;
> >
> >       if (!gpu || !gpu->funcs->gpu_state_get)
> >               return -ENODEV;
> >
> > -     show_priv =3D kmalloc_obj(*show_priv);
> > +     struct msm_gpu_show_priv *show_priv __free(kfree)
> > +             =3D kmalloc_obj(*show_priv);
> >       if (!show_priv)
> >               return -ENOMEM;
> >
> > -     ret =3D mutex_lock_interruptible(&gpu->lock);
> > -     if (ret)
> > -             goto free_priv;
> > -
> > -     pm_runtime_get_sync(&gpu->pdev->dev);
> > -     msm_gpu_hw_init(gpu);
> > -     show_priv->state =3D gpu->funcs->gpu_state_get(gpu);
> > -     pm_runtime_put_sync(&gpu->pdev->dev);
> > -
> > -     mutex_unlock(&gpu->lock);
> > +     scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
> > +             scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock)=
 {
> > +                     msm_gpu_hw_init(gpu);
> > +                     show_priv->state =3D gpu->funcs->gpu_state_get(gp=
u);
> > +             }
>
> My clanker tells me we can't grab the PM reference before a mutex,
> as the recovery mechanism depends on the rpm count being appropriate
> to let it drop it (and kill gx this way)

Yeah, but we also can't do it in the other order, or more specifically
disabling ifpc needs to come before gpu lock or it can deadlock with
recovery.. but ifpc disable needs to be after runpm get.

Re-working that ordering was the whole of introducing cleanup.h, to
avoid the error path with mutex_lock_interruptible() after taking
runpm

I guess if you are hammering on debugfs while crashing the gpu, maybe
the first recovery fails, and then a subsequent one eventually
succeeds.

BR,
-R
