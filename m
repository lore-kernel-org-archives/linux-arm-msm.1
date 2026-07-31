Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C3B3D954C
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 13:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502953; cv=none; b=lBtOTsY1IynzS9Ws365pTc4zLx9ciGtIACpy3lJ3byP0FAt0sZQPrMm1Ads0aDev6jM8JoK/K+7n5vnwZRCtS2xOQlahnDk7CSc+X9UunH8WmY55jaVHisalW2tEAqxiwP2VCTbknKqABuKdY+oFlWu7ZSIFz1NroQmPC8pDLn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502953; c=relaxed/simple;
	bh=/VPicFvwqV3PSVa791yCxMtyqTa/S3HZd0klqQkMpiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERRPDOkzl6t+k3eFd71vEDLVroKXOMunaniegyzqDmzt2oYXUG0z6h5IjAuKXm4pIe3V4eS4W72QXudyE90lHk3OrAnbQTR0uQ/bx7K07Cvjn8dd4FIlMlWsm/7MqVy6K9fut5PZUtazu2uhvyAG5KDI68iu43mL+Ht2kSQpurs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Joc5h5Ra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NEjobKlN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Joc5h5Ra";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NEjobKlN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBa1N83742200
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 13:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RbHVJKnoJBfoVpSGbz5JOoAG
	1iCGRO07TfeCjHQsqyU=; b=Joc5h5RaWbLIUvb4MG1Z5Qjg+jFsQkKG9Qk5A/4J
	ogmIIIzwmohg4Jmb3HYfLZ1qOVpB688Jdmn1EL/GZmWdTdvjyRXhWf51VnNK2srQ
	deQ2D4OnVbNMSyByYnrvqi9NxSJkh7nQSNL0KtLuVrv0CXzNUzbfUPGUoGvcw58P
	fhci6jCWXeIi5TrKkayxymSzOMq25318YuR5XCNJoqk0Dc4cZlw71sURCNf9QRHD
	EzzGl1TkUhHRNOVO40qji2sLWm24NEQaC1zsyIGqxproan7dX2cKfgyLTKo1vRW6
	Y8VJxmZXPrqIQ7YlafrKpCtr+snywc6/nIPnwmtLuziM0g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtyqgb2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 13:02:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb711c88f2eso514331a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785502948; x=1786107748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RbHVJKnoJBfoVpSGbz5JOoAG1iCGRO07TfeCjHQsqyU=;
        b=NEjobKlN0JAogr15N6McTcDFUZDo6lO5XL7Ak+luPK7FeraiEG4xBYawSM+Uadu2F0
         rhJv4vp9Hiitiu12sxbuFAi5lPK4eVIPWSDQXYYAQIeoSPqxWXtGncIbfHBknHJ65+s9
         /vD9zwtSODjdSbQ2T3uT2GP2r4xmZdjrNSJ8xTfLoV5jht0RaMaF4PjXDAMUAG77Ybbs
         U3wZGJ4ef4FQUhWIMVLrmaNoPIQFL1rnQ2smSZHjClJhBC64zX+6hbtRhEkNbTmJ0ttv
         cTRdyiQMyzGAbhNcg/djvrJRdZ9G/FhEJdhTX8NN3ZNmo4Mp53W47Lhsi25r69VRb3M8
         rFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502948; x=1786107748;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbHVJKnoJBfoVpSGbz5JOoAG1iCGRO07TfeCjHQsqyU=;
        b=KNhbIl8Ve5nfw0pnpDkHecTzpWpRYrwGWyoNqtR5wYjeXQLya23uA4HHRW33p9VAMP
         95AENpo2qdh37x6bgplDjVCqBVRAQ5VHhxsERMe09fGluV5XPqyKN6f4WYnKsbdA6rPN
         ReuM8bA+BLQP+67HsqWPRPst/hZYPNeAFRHkwn7T3AuYUEuXBneQnbxRXVXq/n3BVNx0
         d0ENfEAmqoRnaqZkZ0DWm9mXApnPDxHED7hmREZC6Jesor9ppMWPpyYw8Ju9g+WuxAzK
         mzQMZASO5e/bDLg2UjN3SoTjpCuqygY4+am7nUmkqfoxrP0YCYGoMLO16jVI3WyMA5Ql
         N7Rg==
X-Forwarded-Encrypted: i=1; AHgh+Rpjz++Z8hAuIBAFanyZnFyjGP6sfCxwSkm8Qoz/f2ZMFTcYVyR9ePQCE5CJKBK3/YZ9nadBBrHaj9h5JPkK@vger.kernel.org
X-Gm-Message-State: AOJu0YwdZJSrmynuh6zbsYi77oyWR8Ps8klczqhhENcGZYYxOVQ0xK+4
	PNKgK7dii1SRn9aPa6MTmm+ltIHmwFycsP5YWdVCnNfaq3K5abL+8zwl4kEoWpw5/gdm9I/VHAr
	lMhronojflJGIBXMmLXzc3oy/RLSUXQ7L+8pw2a4vAcqxOkeQNXXR0WP4lPIXb3l9lCoC
X-Gm-Gg: AR+sD13fWewD7vicdFdD4j9qCov49fB3+3HCi16Yu41F4nAhD/hk+gh9ovfRV+F6qGG
	hA5vu3PUPGwcGF3GicoEXw9T52CzA1q7tTMZvtQ+3WrrbxniBMeumiKPemB3tzyeGqauin7IDlI
	p1Sy8qbYwfJWoB/3FDyUbFd6vd6d/YINbXnJM2vjDiuqKdo947yHhUXr83lhFrprHl5F1acpfTD
	uz7BoZEOmiyEbPCV8MKbjSDPLDxs9iRzWZkG5f3FtDb9d65+dUwzM0SbKtAsyOVNHkzq1/oEytb
	J7d89mPMtNu7IziEDuHP+5nAja3nAg93MiqZ7qGspp9ypQ1WluHAB5PEuzi7+b9EYWXhQubWt3T
	v8QS2MblfV7/UqJ3qUVhxjC0NR0MrVzCsEH0NsXlfxGA=
X-Received: by 2002:a05:6a20:7f9c:b0:3c4:3112:45 with SMTP id adf61e73a8af0-3c91b063143mr2120308637.1.1785502947596;
        Fri, 31 Jul 2026 06:02:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f9c:b0:3c4:3112:45 with SMTP id adf61e73a8af0-3c91b063143mr2120172637.1.1785502946332;
        Fri, 31 Jul 2026 06:02:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5c7sm6826247eec.5.2026.07.31.06.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:02:25 -0700 (PDT)
Date: Fri, 31 Jul 2026 21:02:20 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5: Ignore stale handover IRQ
 delivered on attach
Message-ID: <amyc3MTsuCBg82WH@QCOM-aGQu4IUr3Y>
References: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
 <20260731025655.2642860-3-shengchao.guo@oss.qualcomm.com>
 <amxf7MODINj26a4m@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amxf7MODINj26a4m@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5OCBTYWx0ZWRfX6B8rkD8qv21A
 dL46G9kJiubXhVu+Zsk47YocXW9I66DKnAzk9p4wYXgT7ilAaeOncKkLeqB9ZJV0e1+bWpw8DuF
 O2REsv7JdpSR5kgJbUirVTJcdeBdiASQhZDZw7gklbcDxqi8wjliAAhYISoawVaT1dAiUQCv4gj
 DyiU/zlmu5VkoMJPniWGvovcAz/0D+m9j7Bhj8ugZ0xYmUOjLB4HSBVf+8Lso4we7L2byk8ZexB
 6yPWlPypZmSH5sxRi+1vBSFmtUN4MUdJPcUBdNE3F4e3ECCWmpLTkZyxVOC2Odx8M+46Z4E2Q+4
 xthay4WhL5vOE86Lz3BwHE/DPasoT1y3lmRIjehMfhpeASFVCoxu67iyJsc9T5iipLzMqnDKco8
 VFlqzjTykE3dJnq1JaQ0KH/ArS7yk/tc6reoDQFlpqjgceVk/KLHkBrofkYCGyj+tg9iDB4hcx9
 +22Gv4B54e8jYpQBnlw==
X-Proofpoint-ORIG-GUID: DY4G47slUWDQpbHJ6GFwZLXPAh6TZfhW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5OCBTYWx0ZWRfX73bfamJvjIpZ
 G+B0pqyZsZQJIZQmq9CQPZyN8az8yp6bSPjQUyefm/epMqYRQeeepYj0hjVPcwf5lRnk6HinPbH
 xyv+cwy8fRoLUvPM793WpaBUeBFjW6g=
X-Authority-Analysis: v=2.4 cv=YaGNIQRf c=1 sm=1 tr=0 ts=6a6c9ce4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dpTBv4f86fTnYSg34-kA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: DY4G47slUWDQpbHJ6GFwZLXPAh6TZfhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310098

On Fri, Jul 31, 2026 at 10:42:20AM +0200, Stephan Gerhold wrote:
> On Fri, Jul 31, 2026 at 10:56:54AM +0800, Shawn Guo wrote:
> > Commit bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> > dropped the check that ignored a handover interrupt after handover
> > had already been issued, relying instead on disabling the IRQ after
> > its first delivery to make it one-shot.
> > 
> > That is not sufficient for qcom_pas_attach(): when attaching to a
> > remote processor that was already booted by the bootloader, handover
> > has already happened out-of-band, before this driver ever probed.
> > qcom_pas_attach() sets handover_issued = true and unmasks the
> > handover IRQ to keep the enable/disable tracking consistent, but the
> > transition that signals handover is latched at the interrupt
> > controller while masked, so unmasking still delivers that one IRQ.
> > 
> > Since this driver instance never ran qcom_pas_start() for that boot,
> > it never took the proxy power-domain/clock/regulator votes that
> > q6v5->handover() releases. Running the handover callback for this
> > stale, already-accounted-for signal disables those votes without a
> > matching enable, producing:
> > 
> >   genpd genpd:0:4c00000.remoteproc: Runtime PM usage count underflow!
> >   genpd genpd:1:4c00000.remoteproc: Runtime PM usage count underflow!
> > 
> > Restore the early-return when handover_issued is already set, so a
> > stale IRQ delivered on attach is dropped after being disabled instead
> > of re-running the handover callback.
> > 
> > Fixes: bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> > Assisted-by: Claude:claude-sonnet-5
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5.c | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> > index 10fa38f264c8..e715083846aa 100644
> > --- a/drivers/remoteproc/qcom_q6v5.c
> > +++ b/drivers/remoteproc/qcom_q6v5.c
> > @@ -210,10 +210,23 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
> >  {
> >  	struct qcom_q6v5 *q6v5 = data;
> >  
> > -	q6v5->handover_issued = true;
> > -
> >  	qcom_q6v5_handover_irq_disable(q6v5, false);
> >  
> > +	/*
> > +	 * When attaching to an already-running remote processor,
> > +	 * handover_issued is set before the IRQ is unmasked, since the
> > +	 * handover already happened out-of-band, before this driver probed.
> > +	 * The transition that signals it is latched at the interrupt
> > +	 * controller while masked, so unmasking still delivers this one
> > +	 * IRQ. Ignore it: this driver instance never enabled the resources
> > +	 * (proxy PDs, clocks, etc.) that the handover callback would tear
> > +	 * down.
> > +	 */
> > +	if (q6v5->handover_issued)
> > +		return IRQ_HANDLED;
> > +
> 
> The goal of Abel's patch was to have the handover interrupt unmasked
> only when needed. If you just bail out here and do nothing then there
> was no need to unmask it in the first place. Can you just drop enabling
> the handover IRQ in qcom_pas_attach()?

Hi Stephen,

Thanks for the comment!

Although it seems working in my limited testing, I'm not sure it's
entirely safe to drop the handover IRQ enable in qcom_pas_attach().

The handover IRQ is requested with IRQF_TRIGGER_RISING. When we attach
to a remote processor the bootloader already booted, that rising edge
happened while the IRQ was masked. Masking doesn't prevent the edge
from being latched at the interrupt controller -- it just defers
delivery. The pending bit sits there until the IRQ is unmasked and
actually taken; unmasking alone doesn't clear it.

If qcom_pas_attach() never unmasks the IRQ, that stale pending edge
doesn't go away -- it just waits for the next unmask, which is the
next real qcom_q6v5_prepare() (i.e. the next stop/start cycle). But by
then handover_issued has already been reset to false for that new
boot (qcom_q6v5_prepare() does this before re-enabling the IRQ), so
the stale edge would be indistinguishable from a genuine handover for
the new cycle. It could run q6v5->handover() and tear down proxy
PDs/clocks/interconnect immediately on prepare, before the firmware
for that cycle has even signaled ready.

So the enable_irq() in attach() isn't dead weight -- it's there to
deliberately unmask and flush that stale latched edge right away,
while handover_issued is still true from attach(), so the IRQ fires
once, gets caught by the one-shot ISR, is dropped harmlessly (because
handover_issued is already set), and the IRQ ends up masked again.
Removing the enable would just defer the spurious handover to a later
and more damaging point instead of eliminating it.

If you agree with the theory above, I can follow up with a comment
update in q6v5_handover_interrupt() to make this rationale explicit,
so it's clear that the attach-time enable exists to flush the latched
edge.

Shawn
