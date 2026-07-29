Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9782B3BED78
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785362327; cv=none; b=Ql+W/sTePv0Vy18CyjDQO0iHtaiY0GJ8ohlC0TC2AD060NjC8tKd4FFYmM1GlAmOufUx+RGOruTsnXy84fmL41JNtlEa8Nx25XHa5Rf2UKrBARiKo47cfoBi5t5E0c2SlQW9E+KCDjVzRCgqdP6kxm6GYKeyPqcS5LWyeV82fh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785362327; c=relaxed/simple;
	bh=qA0b1NjYq45z22xs3h56x/1iopvGcIIBdMwVFhpANsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4uF6eP5qppVPdh1Wx6riH2yKxuYxTYi3c6dd9J+d0RTyKNqOoSazf2p8uCOo2kOISdtRPeDHKrd/60Gy+mCNnUr2VKUW45e9Uw0U7M0CrYIquEyEQkri6iOLjTWtnFlxmsZh58DbA3F0hMCMzKizInKd1kio0cJlukvvZRLnC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EvXA67bS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqGFjVo9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EvXA67bS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqGFjVo9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TLiM7r042883
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VqWy9eqY0puowDROPV7VBf7D
	CFVRv1JL0+EraPp7HBk=; b=EvXA67bSnMotfF55i2kwy093ZKkQVHMErOngWnzr
	Km3vIJ+aGkblSkDEJARtu51i59o1ibCyC12im3s0I6C/JPzHbV6wmBKn01qcDvyh
	eQ3Lz0XyQn+SfVppznCRhQRMIq5BmLRB3Eo1NFFa+UHDpTc6/qXrVKO6Hg+lBQ73
	kGe+ygZGVoRmGtGHAShtS0ISHlzv3sColxNKaT6a96Xt8+5z1iYb3NJC9Cat8dzW
	G9EDCdEDxAdhJNps0Ay4pebJ6LM+fSSofyBzmqSF2ZT/jc9sKFCiDP6HcEmYM05M
	uC7MY+P2UoySNIEIRQ0O+fxQYjMTt2hiBZ0x1w2tRA2VIg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqspv01gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:58:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso2307766a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785362325; x=1785967125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VqWy9eqY0puowDROPV7VBf7DCFVRv1JL0+EraPp7HBk=;
        b=CqGFjVo9iy1N8N7oEJv3BTHwOkoWodpE3WpUVuyPo6qqzJZuOh3BquAYSGEg4k+af6
         22LpCbxwjfUIGVBkv9UFPRjD4ibKeszF2AXvSeNiCy6wiwN+7XIsOCDGnQLrN5mCQShd
         wwjASSYzjBfZOXiLCArOt6bQjgYrtrCfonQHBG6oOMzpURE5i7AB/ZNgG+iUNPpfEJNg
         i8GE9hNDrq/klyD4ljqHe26KGNDBuBW6stUVmEfSnfI+DSxQKYamfPpWhYPdFVoht8jA
         vqBfhefX04gvJhx7nRHVxgqRKERRo4W5IQ8EVL2Y0bKZb9L1Ug1M5ugfrGcWq2YrX9eG
         gYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785362325; x=1785967125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqWy9eqY0puowDROPV7VBf7DCFVRv1JL0+EraPp7HBk=;
        b=pef499LccOrsihc+ViBEg9FrkvQkM5+KyjK/uadwm3TYJOSAoReVPknSZvYEazN+JY
         x7StLuD0CGbitTmC7co8Y1TIHZc1ZSr0hy17qJ0lc+BRkUi3xqXNM0UKzEydz/YqLtnQ
         H4HXJjRF0Fyx9pJq9RlAGHX+lFljveiHWDhZeKoJbu/FIir4JAgQz+axVNaVvPcXfbgU
         NsQPQnezeblAXnV9Qhv6gkeX7JXsJf7T3KdK7pV4fXO++sK29ogiM4ZXBr7eQWi16q0I
         0qHRkBRUHiEk1WRqN9t2C1L2RPgPQtpg7xrOin9o5NcUJ8vSZ7Ar4GInLD+DxVWRXfjA
         S6ww==
X-Forwarded-Encrypted: i=1; AHgh+RoyAB8gcLxhPqJPy9DKZni0B9d4LyWXY5ZErnEjRlk22om9SRaZPUrBmLE9JAJrv4g3zLTxZkXX8wM7nzLQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyfNeOMr6/gUsuipA/ekt10m9pkF/hMYSD/Ej/1YdQV5s8wzeX8
	kFSeJyV2Qb6Wb+ky3K9NYD9qygnEK2P9ae4fSvcYc2sdBSt+r/7Vn2a1rcY9T6CT+PX0uzDahSH
	5F05G5M9ZnTi3vENR6dF5SaccPVD+z0YoZzV4FFTSyTOaqiX3+NzNvLNNxQrVxYeJ0SyG
X-Gm-Gg: AR+sD10/Tv4kLMKKMTnLhOyTktw6Y3+bYGY/1iZDj2+0quN/hDv9Yf4Uq4iSULrD0k2
	I9a/gOCWuA1oXNwegOkcPDwUFFjWwggiUmqJ2qTCj5wxNj07l40hTfQHJIEI/r927rMyPC6XuwK
	KgCZFL9rr1reDaYcRl7Z/rL/MrL1cj+pUK7sK04rkfK4sCbF4yuEHE5Yw++pzP3iRSHzvJkx3Mk
	IaQfPP4pVbyHe9IxCmQBubvrrQzFTtE2GZ/JWwQP4hFbWhcMoVPkG1I2uvDzJwILorWjv2Gv0gV
	bLJii7pGoAO9tOm/nxfLHFiCJzAXgqpm4nt6emEARlBukFPdFSX8mR2u9HAsyIOIshYg9vxIphV
	Lwry44ordsMsCXfHmMcg/Nn+1w5946Q==
X-Received: by 2002:a17:90b:540b:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38f9bd12dc6mr30935a91.6.1785362325027;
        Wed, 29 Jul 2026 14:58:45 -0700 (PDT)
X-Received: by 2002:a17:90b:540b:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38f9bd12dc6mr30909a91.6.1785362324582;
        Wed, 29 Jul 2026 14:58:44 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d37368sm24483029eec.22.2026.07.29.14.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:58:44 -0700 (PDT)
Date: Thu, 30 Jul 2026 03:28:39 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <j2tncckz6mex4q7yqkw2prpi5yml7sdka2etlmnf3knyamvfun@pizpb76ilcsw>
References: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
 <20260720-b4-read-rpmh-v5-v5-3-cb93fb95f565@oss.qualcomm.com>
 <da299944-0093-4d1a-b092-f7857b101199@sirena.org.uk>
 <gaigrfpfunsqwuxf24uonw4mrkdse4ap3cywi2eg2qdyfgfzsd@hk6zghfqnkty>
 <amNfHiL2W-uLlPjY@sirena.co.uk>
 <e25dsbpp3chldtoh2awrtxfxkju3jevphn5pcoqvfehibwg2nr@yj5pfelpti63>
 <bc461376-292d-4550-8518-3b84eb4fc602@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc461376-292d-4550-8518-3b84eb4fc602@sirena.org.uk>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE2NiBTYWx0ZWRfX7wXHCvfOAUCR
 EKpz2M0bsTn0PTXnMmU1SZmaTYTeUPNH0v4QmuINdEtfEb7PTQXngQukL+pL2KJNKyWo/H/N+z/
 SNo2+YJxsFbbEAFcFh2MXgBSQs7THaU=
X-Authority-Analysis: v=2.4 cv=HMrz0Itv c=1 sm=1 tr=0 ts=6a6a7795 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ne3m7yMffpSDnRU9SVgA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ZO2oq9mtkCadrVW1wRnvY5i1kaX729TH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE2NiBTYWx0ZWRfX8If5IkAq4oj8
 fZaoUuWmsTxYAEDya9lzSdgNnR8hp1NFRatD7x7r4lEuVXOYkUplMQszZOkvzIOVVeeOPZCuCFI
 T07UTODUrSwojUIDNmEOklAgS9lQSxsRB/+ugRxFOG3Q0VHBlLbUe/kXgKn9pb/hjn/3eDbH3WB
 5FK9VXvajXYqkeuqfpX0SPOoPtKdiI8YmpzKVuQ01T81QTmSqNaDea4gdqEntvnbgyItQ/K1FiA
 u74MlSx+mAuJfmwnrDbsHFOZZJreuOcR2K9fEoCbNweONv6C6eK/7MPYOzx4aGtYTQ1jLE9mt0e
 gniNbnMJBIHPOuLycFTBFGdbnqKLJrQCNM3UI97rZB6ZffQah4nVTqkVMx/k5MkCp0k8OmKmNFr
 mH6ukYZuGSlOtBYXPbJNFADx7TZiJH6PDWaHPJnizU7SrxIb2aqB6KKxxDUKb9P8QVTxUpMcB7h
 8fo8xFinEYC8ZZwZ4lA==
X-Proofpoint-GUID: ZO2oq9mtkCadrVW1wRnvY5i1kaX729TH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290166

On Wed, Jul 29, 2026 at 09:04:47PM +0100, Mark Brown wrote:
> On Thu, Jul 30, 2026 at 01:11:36AM +0530, Kamal Wadhwa wrote:
> > On Fri, Jul 24, 2026 at 01:48:30PM +0100, Mark Brown wrote:
> 
> > > No, that's not the point.  A get_status() operation needs to return the
> > > actual hardware status *now*, not a cached value from some random time
> > > in the past and not something that was written by the driver.
> 
> > I can drop it. But I seek your guidance on how should i implement logic
> > to HOLD the enable/voltage/mode for the regulators which are turned ON by
> > bootloader.
> 
> You could cache the values currently written to the control interface?

We can cache it, but i was planning to add change in core,
which will require get_status() or something similar i think.

> 
> > I was planning to use get_status() (in a subsequent patch series) to check if
> > the rail was left ON by bootloader at the regulator registration stage, and
> > use that criteria to decide if we need to hold the voltage/mode/enable state
> > or not.
> 
> That's logic that should be implemented in the core rather than driver
> specific, this is an issue that affects everything - we just mostly get
> away with it since we don't start touching things until drivers do so.
> It's a real problem, just tough to solve.

yes yes, it needs to be fixed in core.

> 
> > Besides this, since the sync_state() cannot be used.. i was thinking if holding
> > the voltage/mode/enable till regulator_late_cleanup(). is that ok?
> 
> Consider what happens if something really needs a voltage raising to
> enumerate - if you ignore it then the hardware might be in for a bad
> time.

May be we can allow the up-ing of voltage/mode to go through? but cache the
lowering requests for voltage/mode and apply them in regulator_late_cleanup()
so we are sure that there is more then sufficient power during this sensitive
phase. will that work?

> 
> > > > So, shall I read the HW MODE/BYPSS/ENABLE value in every get_status() call?
> 
> > > If they reflect values that might be dynamically updated by the
> > > hardware, yes.  If they are just control registers that the hardware
> > > will not update autonomously they are not suitable for a get_status()
> > > operation.
> 
> > It not will autonomously update, but it may be updated by the APPS bootloader.
> > I guess, that still would make it unsuitable to be used in get_status() ?
> 
> Will the bootloader be running at the same time as the kernel, I really
> mean "by something else" rather than "autonomously" - usually that's the
> device itself (eg, reporting that a regulator was shut down due to over
> current) but it could be something else I guess.

Ok, so is there something similar to get_status() that i can use to pass on the
info to core (from the driver) that regulator state was ON at bootloader stage?

Regards,
Kamal
