Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F47155198D
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879080; cv=pass; b=KbY3cYWQdeP3IOH4ZnsSEOo7Ux8jkZBHgjCXFACon0l7ey6iaFRx/kZyqWcP9Uh8TZRoZEP47FpligERspRUvlCR4Wt9znpnotGuZCUFXu+2tO7RhzN8rDiqezSIzTYzqb1DQ9r1jJAcEL7eneoDuLY0+2PcqIpD43X+v6DzEG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879080; c=relaxed/simple;
	bh=/jR7Rwopgs7l3OagfV3+qDefGzA7KmXlsVjovFHL59A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWvzmbDQR+kefMDMhaGRqGugS0VYyS+KfQ1i3xTkCO2nDwsFqBsPrQ+ottYacDmISupFOVHeV4PggyoVZEPanZu2PzYj4mkKcpnbiS6CKRSxzzKi4uyQXYlpqKv+N5kWhrcBIXAL1X3QidQ1wIZtY5Df32druo06EA5KOhCHgiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mk0HbjE8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i14hp3Rs; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mk0HbjE8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i14hp3Rs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ej80Q2770947
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 14:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=XoTk3qooOHe0cDF5Pvym6RNpK9/DQBvlzZmOWCAvRS0=; b=Mk
	0HbjE8oCx5M+xQXmdGUO7rwOhnAmK/xbe/aPcsPgNPzfxl24ZCe14/I57BnVLsE8
	noFbHwmCzdXp0L2RbbSWNZo8eV6m0ykWPvnomEfxIbPB4lkpXxAlPIy6Qhin0c1d
	ESiWE2O3oPd1b2GT/mr2CWikjxv8tCQ+hCZgs14Fhryy3HlR0ztEnTmvwU6aiu6p
	JCxbn1jo7gn+lF8ZT483Ltu9sIwHhdNh3NUCj76bInt4Ki1XTmSlGdA4ayoil73e
	RbuQxBdmsDMwEjyGIhcosRtWsACgj5Y4B75K9xHsOBUBMeLxgqYUb51Z/nbYaXnz
	Bfwz+n9fa2bEpqY00V9w==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvuj5jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 14:51:02 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-451d80641efso7505163fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788879061; cv=none;
        d=google.com; s=arc-20260327;
        b=c8apNk1aEk/S/a0dHvuJXjIoT1N6VKBaswi2yFphwKDqFXsgzGV1rEYspYnBFDLZFb
         zdJt3wsGbtshHcKlnk3f1+jzvR9Ng8QkeSoU+auUDYt5g1gRSIC1i39Gb5t7wfX7IxCG
         fmCFOuwK2pDhQGpzN2XbK1MgpdrVgo57/8adFF9Hvc/NVs5g/jL8WgBI1QtydydJCN/a
         xdP9ZAmOksBZFssyXbhjSvc7yIcU1As3bmqj721CIx8h0DGxdDbnFuIu63TRf80Eqlx+
         /wMHSeExlajFPqBr44/+DeNNoGVEnES8e76imWBHPYrvLU+8RouNmx6ZHBqpTl+yrIFF
         +WSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=XoTk3qooOHe0cDF5Pvym6RNpK9/DQBvlzZmOWCAvRS0=;
        fh=47XINpElLcfF6p1lt/zyvdYmQ9j+BJZ3iTbK1vM27f4=;
        b=OoYPNs7ak8jyPjO4lM/y/MO9Kd8MizaR7T81/Gbh0X0mGMzW+BW8MnWeysUWCuxrrL
         78m0NcKl0xLTgkPL9uAvmTGmyRhYG6b01L+TpAwHdEpKJ2QFAnR7Z2kslibgizt81Ux+
         f2NSjKkUIoO15eKzoK7YiolS+VnC13ShjUrrt4uo57l1TpQAVc5EiiMVYpPM6McOJ/6j
         qokUjXqnAnSJdM6pMmv50HWiM0iqRLDmnaGbYrpS0qLfwFXSjGrHT0dw5ABUofhnkGeM
         ZiXWGHkNvcikESm5OWkxGgkgCkbNsIo8YcQa7KboLGPoXdeGtmZu9p5Ei0gxH94VYzkn
         hacg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879061; x=1789483861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XoTk3qooOHe0cDF5Pvym6RNpK9/DQBvlzZmOWCAvRS0=;
        b=i14hp3Rs1WPqUOkiKG+fg3tyRQ+kbzwv4Vv6wEd+TZK+nimzB1RR2s7aSYrKXy9sD2
         5r1em3FTu1f1jQhtvM3C74Vtk6nXkCoBvNohqQZoF+byLyRbAgm102UTMsgQRDNrUw0p
         7xONBlBn42vPFB6+/IkbwKC22y3eCObeKkcPwY4EP8bfEWTA0324Z5aKTvTQEBsMB5tI
         gyRv6XK4kkI9sFWAyvyndfRerEGrAAPCwjkFh8yZe54FSXiijr3fzdS7PiAxuB58mcV0
         84hyYFXLhwL4/AxDu2aCtKKH54yFm4ZAu0NqJZcWVhQfnbx5vBybfUrrkFEfjxYWgKjw
         s5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879061; x=1789483861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoTk3qooOHe0cDF5Pvym6RNpK9/DQBvlzZmOWCAvRS0=;
        b=pThfibpMo7MHH3Zcnd+rDhFGmGnuZy/0N/I7WrRTZteSlxnCtZI/zyeMmM9+rRe7oF
         1okxhxoiwznG4zw9jMMDYqcgjWb/FFJVe8DiWvNTM/lHQ6KK1Gv8BqHy2cnVQ/nxUNYQ
         W/lnHZ0g/j+WtPZr5Oq6POq7E6HtkIHuV/Qf9On5taKjnfk3Za/fSS+6SeSPMfLjSib7
         A5MXGwq1FXYltKx0F0sAgaSxSrcIiWRfJA+Z7pGrpm8fSZ1vmLxyzqu8zaZhVVp0Z9Ir
         1lNf1sc3wVjh6cmvQzNzdAsS0PVEEaPK14KAOWrAzLTXyRMsMBJTpx8WnWROcYyNyec8
         q/KQ==
X-Forwarded-Encrypted: i=1; AKwUvByalIesLfmX5iDsu3ohN9hgzHn8zPV2g5JEBW/wYW8vicFfC5E9ibDX13n+YzXv1RfJQFGhC6fGiwABlOVC@vger.kernel.org
X-Gm-Message-State: AFuF++mUyroW4ZfBVSxvr4t5rrhyskfZXCFOGdWIU6Pzbvgx5T+Otbf2
	gL26JopS2Qou/DtraPE2fDx8+XcpKtFiSSosMmeh3nDDRbznlzUhDm0N7TTGTInO33h9LTGlVUc
	30M8vhBYggh6ux/uwJIha1fiWjgoq+MVI4STyiGDC/pq41iP3gFfXKP352ez7KwTkzBp84fwcCy
	UI5SjK3Q0+/Z/PGFa2hoJm2iIaqAs4JTiMAYGzZUW40yQ=
X-Gm-Gg: AYBFou2Q0cFYdqV+O7c2TS24WNjn6eQiwG3rgZvVPQpLC9XI8epMhS3n3YukG1OJ5I8
	UwotX8IPnBpbScHy+CC3nMRUf4ix7RP8grBQ0x3lo+/EeH3NB4CfbGFg59Kp6S1U26rMGL8ANZe
	L72rWA1eaFjaN5ug47NIFh8Nn2D7udE/vwZ9wmW0OehdKgwcsjv1Aajn/R
X-Received: by 2002:a05:6870:9124:b0:45e:d529:40ba with SMTP id 586e51a60fabf-4755158f2f5mr19089683fac.4.1788879061180;
        Tue, 08 Sep 2026 07:51:01 -0700 (PDT)
X-Received: by 2002:a05:6870:9124:b0:45e:d529:40ba with SMTP id
 586e51a60fabf-4755158f2f5mr19089618fac.4.1788879060667; Tue, 08 Sep 2026
 07:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
 <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com> <fl5uoffoh3gyod3f6jxgze33ut4jj4ttmgivtyoa5oykbt2aqp@rkktjz4yh4ll>
In-Reply-To: <fl5uoffoh3gyod3f6jxgze33ut4jj4ttmgivtyoa5oykbt2aqp@rkktjz4yh4ll>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 07:50:49 -0700
X-Gm-Features: AcwNN1XMi8Pi6r5G72nQXPV504KYen-57fgrLczceh4tvG6Q5zpbewONJu0ggJA
Message-ID: <CACSVV03ShOw8D8d-5gDPYdzH3_Hp7EMz2CdfA3x08pCKAtw57g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6aa020d6 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=gJJ0UDS9VYZS2QgkKrkA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: buqRJmM3fJ-Iha86585O_wV4i6-pbVwV
X-Proofpoint-ORIG-GUID: buqRJmM3fJ-Iha86585O_wV4i6-pbVwV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1OCBTYWx0ZWRfX4O5v4in/pBPU
 bW0+gdeo+q3KZ+PHO3B1w6L1yWYYnQpY0d7Q4vzqM8BiRIE3G2l1X2fj8uNYMarupP/ukAqtWkg
 yTqaH7SUVSgn/sI69HY7UZvE6LwadFrWedimqFWQdYk+c5c03kWVTQLb0lZPazXUbGpHzh4C6Aq
 J0Pyj/wN4k1wmFzJ1JI5GOsBxhCdKADCj4GJR/FLIveV4fU8Mq3G7iwXTFwb0Xt/zjrxH+1z8o9
 7UCCh9e49mlcplJqPV1J4u9QrqBaPAYZ5bMR8PeHTTAzQh6kZ0tRQLQJUaThq3RYL64e6CFV1uy
 szqBpiyki1c4th8T2o7Y2psRg98YjJfqkVX20duK+CcXCqTblsJuk74M8xn5Et23VQVj2jI4FZn
 VIhYfYyxym5IA7z3BpAfSIHABcdA5my97dnv2+xQF+ObyEe9hwiLuUgFUX9KD2IbPO9y/HfBdVu
 pVcyVzDAPbwCEKSQaEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1OCBTYWx0ZWRfX9YIEQMa6A+me
 4zCBQMcB3AgxHRn2Mdolnw5HGAYvXF8Kqo3+Djwm7bmHpcoJo9MtdAA21xGi362J4w8Yf626O0H
 F/K/xrAq2YrfKmss8YGj+qV8mmdtOwc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080158

On Tue, Sep 8, 2026 at 4:41=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Sep 07, 2026 at 04:20:43PM -0700, Rob Clark wrote:
> > On Thu, Aug 27, 2026 at 9:07=E2=80=AFPM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> > >
> > > On Thu, Aug 27, 2026 at 7:13=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU po=
wer
> > > > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts fr=
om
> > > > zero whenever the GPU is powered up again and the timestamp reporte=
d to
> > > > userspace jumps backwards. On an a702 six reads three seconds apart=
 all
> > > > land in the 500..1200 tick range, stepping backwards twice, and on =
an
> > > > a530 the OpenCL device timer conformance test fails because
> > > > clGetDeviceAndHostTimer() returns an end time below the start time.
> > > >
> > > > Save the counter in the suspend path of the affected generations, w=
hile
> > > > the GPU is still powered, and add the accumulated ticks to the valu=
e
> > > > reported to userspace.
> > >
> > > This is useless because the entire point of clGetDeviceAndHostTimer()
> > > (and the similar thing in Vulkan) is to match what the GPU itself
> > > returns, and now you've broken that by adding an offset.
> >
> > Just to clarify, the timestamp needs to match what UMD reads directly
> > from hw in various different ways (timestamp queries, shader_clock,
> > etc)..
> >
> > If we can _restore_ the value (ie. write the hw reg) on resume, that
> > would be ok.. but it doesn't look possible.
>
> Yes, a quick check shows that all relevant registers are write-ignore.
>
> > Otherwise I guess we need
> > some scheme where an offset value is stored in memory somewhere, and
> > some coordination with userspace to add the offset in various
> > different paths.  But the kernel shouldn't be adding the offset to
> > what it returns to userspace itself.
>
> Ack, thanks for the explanation. I tried to match what kgsl was doing.
> It reads the GPU timers directly from the GPU, but for the CPU timers it
> reads the value from KGSL driver which accumulates the offset.
>
> If I understand you correctly, we need to export the offset to the
> userspace via some extra page (like vdso) and let Mesa read it. Correct?

Yeah, it doesn't look like there is an existing GPU_READONLY && !APRIV
BO we could re-use, so I think we need to create a new global (TTBR1)
"vdso" BO which is read-only to the GPU but otherwise accessible to
IB1+, along w/ MSM_PARAM_VDSO for UMD to query the address of this BO.
(And update msm_mapping test in igt to validate that it is read-only.)

(I'm not married to the name "vdso" but not creative enough this
morning to think of something better)

I'm a bit curious if kgsl handles this differently.. maybe there is
something I'm missing.  But somehow timestamps need to agree between
what is read on the GPU and what is read on CPU.

BR,
-R


> --
> With best wishes
> Dmitry
