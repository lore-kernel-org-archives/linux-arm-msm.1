Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B93395AD8
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 01:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785546011; cv=none; b=QjLUfJpgpQIvzpONI3Mna+3B84IxvJaSsXjspZuEHlXreM1E0pk59xZUNkmikM/iuiQ7Ar80gQfPo/cXTkmm0tNFIFCNLmttiGCM5hJRqc+1PIqJl2nBS/sL0Bc8MHPLa13B+myoj4sPVpZCgg2YnG5tGP5MRIhNo6WWtYFnIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785546011; c=relaxed/simple;
	bh=k7IIENyVvsEfARfIatk9sz0DfXh6dweeMavMLiwzvtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gS3K9ujc7y77Pnbj8+9zE03Lqggr7S/Oda/hx3w6MwY5gcC5TQFMLdztPq3he5A7o1cWKlU8SdwzO49K09Mm54DnRcQ4+z+f1zQMYVyB5yxRmBnnvdt/XnKwBLUCBU4zwpZy5nNww5Tu6XLmKp27s3hrbqNEnCuIZIc6CVkQGAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eU3y+TKy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Krrofmlt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eU3y+TKy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Krrofmlt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6710ge2g2630423
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 01:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c42abJTL5cQsi9p9dq0hFd/N
	52pXVYMvGI8d2QNfMHM=; b=eU3y+TKy1B80IuuIFMTxt61+5vy63AIK/wMVwoSI
	qCxYhcxp1GQAzKJum3nL4UV8MIvCmkhjgILavFIdqMivhmFQGadt+PU46M71fkv4
	XmdIUS77XrjnJ/nZjI7bQ0iPn2nNvGJTeVJkSCyVNkWJGJKKOm2AKU+4RIIcswYJ
	hHLJhViUmafKPaO1RhKhi0LMhhAROuVXjzmOofTL/Uc++Br0M9a6NKJ4w6OYJuN4
	Uu8iuZXEmRbt2jftsUFrv07Emslw0cyxepjpo2MuEgyzWkB9ltw2vdsoB68wbTjV
	bS9prd+g6eF9Sljr9nQGEPtLMRje4wmQ3HGT/Uv8rohSnw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs6gf81qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 01:00:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so19539335ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 18:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785546007; x=1786150807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c42abJTL5cQsi9p9dq0hFd/N52pXVYMvGI8d2QNfMHM=;
        b=KrrofmltAmmxktHoUJ3NLYl/79vLtyfOi5Rhbm7rZUdTRsaXJGFR97SIFE7cvwuQ1d
         8CcVdtTXqMSHJo15FtYC6ifUIw/r7vmyVimQDfl92Mig8geiHqgvcOIbKmdSu+v/sSsf
         EmzJhObEosXGJPWQctJzcjsWaV2mqQluRoz2y4JjJuyEZ0Rp1Us9aUxCZR0VOXUuZLQr
         H6F7Cg07DwIYGyh1LaJbRYXdHEWChZK2cGBKgnvACzREvfgnQWST1Pgr7qJu1Qc2KxnL
         k6WW4vg91wuEJoBr65b1gvIArbyaFnm3mCTSoxupJU9H0A1Ix9JfWUj5p+SNqGHA9bZz
         iP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785546007; x=1786150807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c42abJTL5cQsi9p9dq0hFd/N52pXVYMvGI8d2QNfMHM=;
        b=Qfx8DBb0V9a9noM/W7496YODp6q+6mwBzo26GQY5XWTuXX/tmg708lbo1czo2Q06Lm
         3pP8St91IS2Az19eIRHtykjJVtL5hMeQ5nWIIlKeAZDWHoLM0pjUUCwGp9gcVYX6HWh3
         XCusIq+1j5D4aVQIMb9AZ01/P3UVPjWceT/HKAYv2QWXe26VKOIT4rPCJuP5kd64lQWA
         z/KRhfQND01PMgUd1JzYAJC5v0ddECLKYSlUoSLrbz+TPk2YWqBLztINRQ6dWTucsPxZ
         kH4vcIbMuIg8BuLfIJDCuwsJGO23NekID845h7xwLN5cNQTWawx83VOyu8vjyQvpcy0x
         ktgg==
X-Forwarded-Encrypted: i=1; AHgh+RqMB02bMjv7qUmv+QZfu/DU+DqHZOCrQChFsP6Z0VoByfZ7i7tRvsLbMrD69GQepLVeDYCwbw1yPkFbfYg8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx7w0rT0llwRBPyYwyrJATPho5/pBoWPc/drtW23RZXKk63ZK/
	NDa3DovTQMNO0G8qG92MghhPdCffol5yoBN4w7kBHvbysr1nWvjmtWTP0NCPOTrWQD74BP2Vyq4
	TkNhHyfAzHlDwF3SfNj9B4+xdX8JyIgTRoE3up+85mPpftQ1DIrPkVTq6Glct0gm2sx+c
X-Gm-Gg: AR+sD11kDqHaguaeiYGCoUiLh+seKVwuLKVHDWEgt8Qeorf70mouRlBRiitWPK5ucmF
	kREIi/+v21Y5PCmJmtqZ2N78hjE44izGxk0QF5eezS9SJcFMSiOESrdsC9zlRoqbYUW8HZYjSka
	OVpHkmDoFRcJMJheLIlbHvBv0fcnugJjMvMWoRHtr6C+sYzRdy+sJxzd2j9Ao1JMxeoakNE3Q5d
	pvZVYe/8QPSIpDqN81vKj5fVXg4V07qcbC1kX6eoycN1eaAwYNxMkw6TLtxDOiyQZfQa27Pg58V
	K8GYLjBo1EUyS4zOJ9P0pvLCyrm/Z2+TEuoawzK6EE+DzXbwJr68oF09FqkwPsB9D11DDxM4kID
	5y3LYoxhwgi8FCfSoivn5NnGyCl5A9tXEgAtzGUgRtbQ=
X-Received: by 2002:a05:6a21:6f07:b0:3c3:93ce:663 with SMTP id adf61e73a8af0-3c92a5e1612mr1614629637.26.1785546007301;
        Fri, 31 Jul 2026 18:00:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f07:b0:3c3:93ce:663 with SMTP id adf61e73a8af0-3c92a5e1612mr1614605637.26.1785546006831;
        Fri, 31 Jul 2026 18:00:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm15804960eec.19.2026.07.31.18.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 18:00:06 -0700 (PDT)
Date: Sat, 1 Aug 2026 09:00:01 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5: Ignore stale handover IRQ
 delivered on attach
Message-ID: <am1FEXJkgoZ0yCiv@QCOM-aGQu4IUr3Y>
References: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
 <20260731025655.2642860-3-shengchao.guo@oss.qualcomm.com>
 <amxf7MODINj26a4m@linaro.org>
 <amyc3MTsuCBg82WH@QCOM-aGQu4IUr3Y>
 <amyhh8lNMT9rgK_X@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amyhh8lNMT9rgK_X@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAwNCBTYWx0ZWRfX0jIy8d+HAVrP
 4z0RgmATAmOyV6vno1C2bIfza9+CqH8eTJO4jhgdi1f04lcTij9+Nyvbwna1Nek06svfDJcMOzh
 ivSA2B7Bkg5Zr5UFJdzLNsjmdmQYn4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAwNCBTYWx0ZWRfX3EETzh92dMQw
 Lx+bISw+GopgfOHvu6qLQ5IuqE8GdDCgV2107LEtmwKJYGHeI9zbO3tvg62eRRsOAvr6SBPIQQX
 /qjaziyA+Qvd4WDYRZP9Rnrvrn6+SJa/cZcwv+xb9fC3IIehhZrlrJPvVajNgxjhvEPEz5d2jke
 +albe6WOAHSA7553JA6ttbJixCvxvn381mXGWEGGRV5EQK0+9odWN9ksz0HVTpAeihSekDskeR6
 oC4y81NTm4PLs3dePfZvq8xkF6Uk87iXLmebFQvxlRFa596wJbGy2oaC4F/Xe1xHDpyHy2pHuUN
 PLEvPEM+3Gzq0ymbNC5HNY/4ER1Cak6c13toxJFsXJVRAY7LluMHddKQ9l6IuiNLFCzl1mLTWzL
 Ud2+nwLY1uE/ovKvy1zlwbFGraX+EnD86xAlgXRmsHdqdjckqaGwlTVh9VgNv3f+pMPPqCW9PXp
 U/ESDfGVXnIXN5cSzAw==
X-Proofpoint-ORIG-GUID: 8qMX6K99SRlMu3_e1w1QOnyUBINWOuwh
X-Authority-Analysis: v=2.4 cv=O7oJeh9W c=1 sm=1 tr=0 ts=6a6d4518 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CrmoIpH0fVBdSVDkB_AA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 8qMX6K99SRlMu3_e1w1QOnyUBINWOuwh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010004

On Fri, Jul 31, 2026 at 03:22:15PM +0200, Stephan Gerhold wrote:
> On Fri, Jul 31, 2026 at 09:02:20PM +0800, Shawn Guo wrote:
> > On Fri, Jul 31, 2026 at 10:42:20AM +0200, Stephan Gerhold wrote:
> > > On Fri, Jul 31, 2026 at 10:56:54AM +0800, Shawn Guo wrote:
> > > > Commit bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> > > > dropped the check that ignored a handover interrupt after handover
> > > > had already been issued, relying instead on disabling the IRQ after
> > > > its first delivery to make it one-shot.
> > > > 
> > > > That is not sufficient for qcom_pas_attach(): when attaching to a
> > > > remote processor that was already booted by the bootloader, handover
> > > > has already happened out-of-band, before this driver ever probed.
> > > > qcom_pas_attach() sets handover_issued = true and unmasks the
> > > > handover IRQ to keep the enable/disable tracking consistent, but the
> > > > transition that signals handover is latched at the interrupt
> > > > controller while masked, so unmasking still delivers that one IRQ.
> > > > 
> > > > Since this driver instance never ran qcom_pas_start() for that boot,
> > > > it never took the proxy power-domain/clock/regulator votes that
> > > > q6v5->handover() releases. Running the handover callback for this
> > > > stale, already-accounted-for signal disables those votes without a
> > > > matching enable, producing:
> > > > 
> > > >   genpd genpd:0:4c00000.remoteproc: Runtime PM usage count underflow!
> > > >   genpd genpd:1:4c00000.remoteproc: Runtime PM usage count underflow!
> > > > 
> > > > Restore the early-return when handover_issued is already set, so a
> > > > stale IRQ delivered on attach is dropped after being disabled instead
> > > > of re-running the handover callback.
> > > > 
> > > > Fixes: bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> > > > Assisted-by: Claude:claude-sonnet-5
> > > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > > > ---
> > > >  drivers/remoteproc/qcom_q6v5.c | 17 +++++++++++++++--
> > > >  1 file changed, 15 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> > > > index 10fa38f264c8..e715083846aa 100644
> > > > --- a/drivers/remoteproc/qcom_q6v5.c
> > > > +++ b/drivers/remoteproc/qcom_q6v5.c
> > > > @@ -210,10 +210,23 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
> > > >  {
> > > >  	struct qcom_q6v5 *q6v5 = data;
> > > >  
> > > > -	q6v5->handover_issued = true;
> > > > -
> > > >  	qcom_q6v5_handover_irq_disable(q6v5, false);
> > > >  
> > > > +	/*
> > > > +	 * When attaching to an already-running remote processor,
> > > > +	 * handover_issued is set before the IRQ is unmasked, since the
> > > > +	 * handover already happened out-of-band, before this driver probed.
> > > > +	 * The transition that signals it is latched at the interrupt
> > > > +	 * controller while masked, so unmasking still delivers this one
> > > > +	 * IRQ. Ignore it: this driver instance never enabled the resources
> > > > +	 * (proxy PDs, clocks, etc.) that the handover callback would tear
> > > > +	 * down.
> > > > +	 */
> > > > +	if (q6v5->handover_issued)
> > > > +		return IRQ_HANDLED;
> > > > +
> > > 
> > > The goal of Abel's patch was to have the handover interrupt unmasked
> > > only when needed. If you just bail out here and do nothing then there
> > > was no need to unmask it in the first place. Can you just drop enabling
> > > the handover IRQ in qcom_pas_attach()?
> > 
> > Hi Stephen,
> > 
> > Thanks for the comment!
> > 
> > Although it seems working in my limited testing, I'm not sure it's
> > entirely safe to drop the handover IRQ enable in qcom_pas_attach().
> > 
> > The handover IRQ is requested with IRQF_TRIGGER_RISING. When we attach
> > to a remote processor the bootloader already booted, that rising edge
> > happened while the IRQ was masked. Masking doesn't prevent the edge
> > from being latched at the interrupt controller -- it just defers
> > delivery. The pending bit sits there until the IRQ is unmasked and
> > actually taken; unmasking alone doesn't clear it.
> > 
> > If qcom_pas_attach() never unmasks the IRQ, that stale pending edge
> > doesn't go away -- it just waits for the next unmask, which is the
> > next real qcom_q6v5_prepare() (i.e. the next stop/start cycle). But by
> > then handover_issued has already been reset to false for that new
> > boot (qcom_q6v5_prepare() does this before re-enabling the IRQ), so
> > the stale edge would be indistinguishable from a genuine handover for
> > the new cycle. It could run q6v5->handover() and tear down proxy
> > PDs/clocks/interconnect immediately on prepare, before the firmware
> > for that cycle has even signaled ready.
> > 
> > So the enable_irq() in attach() isn't dead weight -- it's there to
> > deliberately unmask and flush that stale latched edge right away,
> > while handover_issued is still true from attach(), so the IRQ fires
> > once, gets caught by the one-shot ISR, is dropped harmlessly (because
> > handover_issued is already set), and the IRQ ends up masked again.
> > Removing the enable would just defer the spurious handover to a later
> > and more damaging point instead of eliminating it.
> > 
> > If you agree with the theory above, I can follow up with a comment
> > update in q6v5_handover_interrupt() to make this rationale explicit,
> > so it's clear that the attach-time enable exists to flush the latched
> > edge.
> > 
> 
> It's a fair point (that I also considered before writing my original
> comment), but I think it does not apply here.
> 
> There is no real interrupt controller for the SMP2P interrupts, all the
> handling happens in software inside drivers/soc/qcom/smp2p.c. The driver
> does not implement any latching. If the interrupt is masked, the bit in
> entry->irq_enabled is not set and qcom_smp2p_notify_in() simply skips
> signaling the event.

You are right! I will send v2 to just drop handover IRQ enable in
qcom_pas_attach().

Thank you for pushing on this, Stephen!

Shawn
