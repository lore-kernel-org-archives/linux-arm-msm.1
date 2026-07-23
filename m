Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4F73A450C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784819996; cv=none; b=dz61w0pYeoso6eC4uZGLmnWy8eRxxKiFV72B9HeumZ9HvU29MpDim/THzpKOPNhMNFu9HKnRhWqFS5fqK65w7cjThqZX+fhQptVZuhQsTvmRZiSr9wUEVxm3m8FPJJa0kXssY1oLRjCFhjgESJ1GsIByt9BZuLHB7mOvyKkrUlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784819996; c=relaxed/simple;
	bh=DhirjnDyfEHMWK9sz4NLw0EyGIEC/jBMjPW9TQY3cnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gk722yXgYR+flc8rOp/FV1PXwVPqn8vZ0k3Edl5YJaId8c/buE0z5VO2slIsQlpk49UsmAz5VvdFuXm6schNxYVy9Zto9t6TJ05gO5wPEdk38cHchclwdJcpnD4wzUBPaeZLHhVoR5bZ+1RgHGgzA1iPQbEK16AaEIDAlCHDni4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3H8xK61; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCUjqi1O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3H8xK61";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCUjqi1O"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NF5XAT1326222
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iwSRzW5NkAl0ul52AfkdBu58
	IEroDg9DV9ARsQ4NtkQ=; b=Y3H8xK61yl2yxonXIJAWLpqisOrPbFxhGyGQCDn4
	7RWdYZ1jdSpzBYTDxJT5N2IqMw3zdx6jNskfNCIIUOzMe++j4B0qNw04w0TY6lrP
	maOFnn3aXWl80vK08m4JVcDGP6Fml/PGG0cixHcpVbd3bOOfUyjEorg95aCoKcO+
	VzGp1+buzs64l6pNe/WUfT8dpXRqr15SXwIM3G07yJYdt+WcA8E3h3DS1BXw7rrO
	vS+WhFI9OPGR6oLgZ7mDJ2Yu3XUSiXmoukHPTRrcgA7VdKzC5quTeNICXQkWvwT4
	MrFS5xDmIHa28hl2iXpxb6GjOE8uxUXf85xv8up46A7tEg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a0567-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:19:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so672204b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784819988; x=1785424788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iwSRzW5NkAl0ul52AfkdBu58IEroDg9DV9ARsQ4NtkQ=;
        b=eCUjqi1OdCj5vuiutfX280P7KUVBrrDZiLX4D7qKaztEUigRJEE8EJKN51J4pNfeuA
         aQTL5kFj+lMAqEM1BG1XRMpHtCeZE521gLITIvjmifUdVFKC34HhBD5JLQBFf6uvEfE2
         F6HZV/6glcUniQgjLk19sZmKYVsDhxLIa9OF8uWwo8NT1l/16JMBhz5DZCV7iOkb5AFb
         qXVeLBJ806ex7g2UPkbWkS1FpRYpeVldFJFYNj1N/I5qlIgKpNTnlbZ6Dt9GJjkTYONJ
         4wt0eb6fBOMdTPoQXlsV9Sw3h+hffHQvW9ZMxAoC1ovv6qv469BDOaxTIquHWBqMzWZ/
         YlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819988; x=1785424788;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwSRzW5NkAl0ul52AfkdBu58IEroDg9DV9ARsQ4NtkQ=;
        b=JxIqxVwamKCH2cJRkhbHEDz6XN74UdTZ0cPYOHPwu8exvw1naCBh/N2D05NnKL2Qb9
         oPVsZDZU/2j1og7QcjsIOTP6EDYftD0gQgtJRFLgnEsq7slPsA/wfcPVKhtAGNNnfy0r
         2XjcxwJNJPSbOoRnaL881BmhFdwZ0WgNJnQYSxweA7ja7eh25v0083xvtc/8mHX3SKrd
         TRDcpKV24wqXT1tPOpt7nU92oloOiXwtm9guf4RAmRtfL8GCXGuYl0ve6ofmgcZw7ctT
         ojC0VqFc3jJiwR3llJUYDUKxd12R0l6zuKsM7PZIGflk8nlBu3lZFnn2q1jqsy4uJ2W6
         FDjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpse35ZVA78RFNwSZjDxUzry7vNg04P9XsKP9gH/Z4GaqNhN+71R2MWKo0MgrS/tDuWdOrZOO6BOFpM/sYy@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf6gL6tzXpc8jShKAQvPQrMzcA7RvsozZEbM9tIih683h3Gxue
	/Q7M6+nyQnZ8irGqhMDgh/uwnhBIQVlQiqyRwMN7AWDUbh2KpKMszQyKGXeyD215qoWRo9Afkjd
	vC+nJ5DhUP6hNbnM/1qXn5SXkufXAnq9T7jqbFalS5XkVIdiPZiacXc3Lt8vg7DggVGwk
X-Gm-Gg: AR+sD12W52wey/rYPQofFlLFBEySyW1SrfLuI898VQSNRelmNU/OssOwvY3Q9a+5DqR
	npbrmtD5K+v0kBkXX6mtaGLaaPkOvDu4tNauS/vlGh1raKy2it90fU/+V+v8xqy5FJk+VaklZdM
	9epwUBEtWUgJKxcDMLomgMDOrUbryev7yakm3r5ewkpR/xOBYlBmyjL/3HJ7vWkNy36tpusYFnX
	dpWluL4VB0kDfExiyRabkGwFjjuvN54pCuHZjPbPUaz0YLt+oA40E7R5ewG86zGLyBYcEzeyLGn
	EDif7S6qGave3B1AxaQ9mYeARo5Rmf0zExwS673S9Zs0TSomZ30IDV2z00VbhKn4zkISYEPnRsT
	ToU4MprjFwXBUwkM9jWkaaqd8IYU=
X-Received: by 2002:a05:6300:2209:b0:3a8:800:bdf4 with SMTP id adf61e73a8af0-3c44ccd0ca1mr3409924637.33.1784819988256;
        Thu, 23 Jul 2026 08:19:48 -0700 (PDT)
X-Received: by 2002:a05:6300:2209:b0:3a8:800:bdf4 with SMTP id adf61e73a8af0-3c44ccd0ca1mr3409883637.33.1784819987657;
        Thu, 23 Jul 2026 08:19:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc6162csm20590143eec.7.2026.07.23.08.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:19:47 -0700 (PDT)
Date: Thu, 23 Jul 2026 20:49:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: Prevent crash handling to race with
 rproc_del()
Message-ID: <20260723151940.mv2thrqejazjhxqc@hu-mojha-hyd.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
 <20260723144706.cep5sltjt3bnfldr@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723144706.cep5sltjt3bnfldr@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE0OCBTYWx0ZWRfX2VGIcfl1XR5Q
 O7d1BQudWPmiGIfMUIPpFee9h/CDiFLBkX4HrjmMx5C30URnPUj8sS14DE2V6ts0oWFLTrkGiAK
 4GPQk9z4P8NZq3jokZJE18pG4rjoTdxVQ+VGOUuHrgGsD6RqKnHzDcaJEOOuWSvdhSeEU6YJXDm
 JxTuPY5yykgPZS/0HWD2wjGlOoqMBQDqMmoMYBUy9LaKWfhWmjWyWRtkcN4KXls66teOyMxrAtL
 xgcvh0Mv6+eyD73xA67NY90Nhedbbf8q+EEl2ptyYPVmWgyvx6ghOaTIljds+FdyP9vBVroUrFC
 FMbAhyIL3wLnSai0x6NY0KY15LIrT6q+H940ecwHuVAthSSGpACGFdIY18dfct46MUvWh5EC9R1
 iv+REZ4n+RPjtOzhr3k8oE5RRhCGc4M9/ap8sDrOBxfSgWjaICYZORvyDrawLyvGwGNvzq0OvsW
 w6W+u/hmwLRkigl2zzg==
X-Proofpoint-ORIG-GUID: wdvWeAcELHTsASEo8stG5GH-YG7kg4I6
X-Proofpoint-GUID: wdvWeAcELHTsASEo8stG5GH-YG7kg4I6
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a623115 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7BOyevuOlVOqE0S8HRoA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE0OCBTYWx0ZWRfX1qZgullFL/96
 1QBm21mzewfCP5R7gCAP31i6CNoxfpai/rKCSuluPTcA895iBbOgKlxIIeAW7H0uJY/EBXiSz5E
 asOWmEwHCsOy81+YEJNsi234zSfAFQ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230148

On Thu, Jul 23, 2026 at 08:17:06PM +0530, Mukesh Ojha wrote:
> On Thu, Jul 23, 2026 at 03:52:28AM +0000, Bjorn Andersson wrote:
> > There's no synchronization between rproc_crash_handler_work() and
> > rproc_del(), as such it's possible for a driver to be removed while
> > crash-handler work is scheduled, or even executing - resulting in
> > use-after-free issues.
> > 
> > To avoid this the scheduled work need to be cancelled and synchronized
> > against before the removal proceeds.
> > 
> > In order to ensure that this doesn't race with the reporting, and
> > thereby scheduling new work, a "deleting" flag is introduced. This is
> > similar to the RPROC_DELETE state that was introduced to ensure that
> > "start" didn't race with rproc_del(), but the existing mechanism can not
> > be used as it's valid to call rproc_report_crash() in atomic context -
> > and the "state" is protected by a mutex.
> > 
> > In the event that work is cancelled the pm_stay_awake() is left
> > unbalanced and need to be unrolled.
> > 
> > The blocking and cancelling of crash-handler work prior to the actual
> > rproc_shutdown() call does have the explicit side-effect that crashes
> > resulting from the shutdown process will not enter the crash-handling
> > path, and as such will not generate devcoredumps etc. Due to the
> > existing mutual exclusion between these code paths there's no concrete
> > reduction in functionality, but further work would be needed to handle
> > this case.
> > 
> > Assisted-by: OpenCode:GPT-5.5
> > Fixes: 8afd519c3470 ("remoteproc: add rproc_report_crash function to notify rproc crashes")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c  | 42 +++++++++++++++++++++++++++--------
> >  drivers/remoteproc/remoteproc_sysfs.c |  1 -
> >  include/linux/remoteproc.h            | 13 ++++++-----
> >  3 files changed, 41 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 3cd4570513c2..899d2058bc45 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1851,6 +1851,11 @@ int rproc_trigger_recovery(struct rproc *rproc)
> >  	if (ret)
> >  		return ret;
> >  
> > +	if (READ_ONCE(rproc->deleting)) {
> > +		ret = -ENODEV;
> > +		goto unlock_mutex;
> > +	}
> > +
> >  	/* State could have changed before we got the mutex */
> >  	if (rproc->state != RPROC_CRASHED)
> >  		goto unlock_mutex;
> > @@ -1883,6 +1888,11 @@ static void rproc_crash_handler_work(struct work_struct *work)
> >  
> >  	mutex_lock(&rproc->lock);
> >  
> > +	if (READ_ONCE(rproc->deleting)) {
> > +		mutex_unlock(&rproc->lock);
> > +		goto out;
> > +	}
> > +
> >  	if (rproc->state == RPROC_CRASHED) {
> >  		/* handle only the first crash detected */
> >  		mutex_unlock(&rproc->lock);
> > @@ -1938,9 +1948,9 @@ int rproc_boot(struct rproc *rproc)
> >  		return ret;
> >  	}
> >  
> > -	if (rproc->state == RPROC_DELETED) {
> > +	if (READ_ONCE(rproc->deleting)) {
> >  		ret = -ENODEV;
> > -		dev_err(dev, "can't boot deleted rproc %s\n", rproc->name);
> > +		dev_err(dev, "can't boot deleting rproc %s\n", rproc->name);
> >  		goto unlock_mutex;
> >  	}
> >  
> > @@ -2533,8 +2543,9 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >  	INIT_LIST_HEAD(&rproc->subdevs);
> >  	INIT_LIST_HEAD(&rproc->dump_segments);
> >  
> > -	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
> >  	INIT_WORK(&rproc->attach_work, rproc_attach_work);
> > +	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
> > +	spin_lock_init(&rproc->crash_handler_lock);
> >  
> >  	rproc->state = RPROC_OFFLINE;
> >  
> > @@ -2598,16 +2609,21 @@ EXPORT_SYMBOL(rproc_put);
> >   */
> >  int rproc_del(struct rproc *rproc)
> >  {
> > +	unsigned long flags;
> > +
> >  	if (!rproc)
> >  		return -EINVAL;
> >  
> > +	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
> > +	WRITE_ONCE(rproc->deleting, true);
> > +	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> > +
> > +	if (cancel_work_sync(&rproc->crash_handler))
> > +		pm_relax(rproc->dev.parent);
> > +
> >  	/* TODO: make sure this works with rproc->power > 1 */
> >  	rproc_shutdown(rproc);
> >  
> > -	mutex_lock(&rproc->lock);
> > -	rproc->state = RPROC_DELETED;
> > -	mutex_unlock(&rproc->lock);
> > -
> >  	rproc_delete_debug_dir(rproc);
> >  
> >  	/* the rproc is downref'ed as soon as it's removed from the klist */
> > @@ -2719,18 +2735,26 @@ EXPORT_SYMBOL(rproc_get_by_child);
> >   */
> >  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
> >  {
> > +	unsigned long flags;
> > +
> >  	if (!rproc) {
> >  		pr_err("NULL rproc pointer\n");
> >  		return;
> >  	}
> >  
> > +	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
> > +	if (READ_ONCE(rproc->deleting)) {
> > +		spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> > +		return;
> > +	}
> > +
> >  	/* Prevent suspend while the remoteproc is being recovered */
> >  	pm_stay_awake(rproc->dev.parent);
> > +	queue_work(rproc_recovery_wq, &rproc->crash_handler);
> 
> Do we really need this inside the spinlock ?

Ignore this, as this may be needed to get it cancelled from the other
path.

> 
> > +	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> >  
> >  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
> >  		rproc->name, rproc_crash_to_string(type));
> > -
> > -	queue_work(rproc_recovery_wq, &rproc->crash_handler);
> >  }
> >  EXPORT_SYMBOL(rproc_report_crash);
> >  
> > diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> > index 138e752c5e4e..925b0cdbe577 100644
> > --- a/drivers/remoteproc/remoteproc_sysfs.c
> > +++ b/drivers/remoteproc/remoteproc_sysfs.c
> > @@ -168,7 +168,6 @@ static const char * const rproc_state_string[] = {
> >  	[RPROC_SUSPENDED]	= "suspended",
> >  	[RPROC_RUNNING]		= "running",
> >  	[RPROC_CRASHED]		= "crashed",
> > -	[RPROC_DELETED]		= "deleted",
> >  	[RPROC_ATTACHED]	= "attached",
> >  	[RPROC_DETACHED]	= "detached",
> >  	[RPROC_LAST]		= "invalid",
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 17ed75a11e15..ef711a5b1a7f 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -37,6 +37,7 @@
> >  
> >  #include <linux/types.h>
> >  #include <linux/mutex.h>
> > +#include <linux/spinlock.h>
> >  #include <linux/virtio.h>
> >  #include <linux/cdev.h>
> >  #include <linux/completion.h>
> > @@ -145,7 +146,6 @@ struct rproc_ops {
> >   *			a message.
> >   * @RPROC_RUNNING:	device is up and running
> >   * @RPROC_CRASHED:	device has crashed; need to start recovery
> > - * @RPROC_DELETED:	device is deleted
> >   * @RPROC_ATTACHED:	device has been booted by another entity and the core
> >   *			has attached to it
> >   * @RPROC_DETACHED:	device has been booted by another entity and waiting
> > @@ -163,10 +163,9 @@ enum rproc_state {
> >  	RPROC_SUSPENDED	= 1,
> >  	RPROC_RUNNING	= 2,
> >  	RPROC_CRASHED	= 3,
> > -	RPROC_DELETED	= 4,
> > -	RPROC_ATTACHED	= 5,
> > -	RPROC_DETACHED	= 6,
> > -	RPROC_LAST	= 7,
> > +	RPROC_ATTACHED	= 4,
> > +	RPROC_DETACHED	= 5,
> > +	RPROC_LAST	= 6,
> >  };
> >  
> >  /**
> > @@ -261,6 +260,8 @@ enum rproc_features {
> >   * @index: index of this rproc device
> >   * @attach_work: workqueue for attaching rproc
> >   * @crash_handler: workqueue for handling a crash
> > + * @crash_handler_lock: serializes crash handler queueing and deletion
> > + * @deleting: remoteproc deletion has begun
> >   * @crash_cnt: crash counter
> >   * @recovery_disabled: flag that state if recovery was disabled
> >   * @max_notifyid: largest allocated notify id.
> > @@ -305,6 +306,8 @@ struct rproc {
> >  	int index;
> >  	struct work_struct attach_work;
> >  	struct work_struct crash_handler;
> > +	spinlock_t crash_handler_lock;
> > +	bool deleting;
> >  	unsigned int crash_cnt;
> >  	bool recovery_disabled;
> >  	int max_notifyid;
> > 
> > -- 
> > 2.53.0
> > 
> 
> -- 
> -Mukesh Ojha

-- 
-Mukesh Ojha
