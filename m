Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20025353A81
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784818041; cv=none; b=nhUY3xPbSnB9B6MMgZmR0iZwhdmprzuawvr/bHDsP4MhLDP7cS3SnjANTygipQmD6l4FSCxxQT+0jSg7e9Ti59zTV4My+cK+3HFLnAUvuU1dwihH7sdNrh7sSG/Hxd45LhlIlBeF/EkcfJIR5G5OXbbEkUhEI836ia7c8B4TZUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784818041; c=relaxed/simple;
	bh=OWAq9jSxasHlzR2LpKP+JfM5pGc9vmlK182/yx84e5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2Dr7oYXLUUPK7vr4LlbpM3aE4S7zm0z2i8VguPM0ahMQwELSf054ocisJd9MkNoIcuiuKQ6oSo/Df7/MW0dGNIys/bZDeZkCY0119EOzlatxs2ZnIO2Xi/SS0EokxpRPCwuSnZpyr7ikYjKpsqDNS0QQKkb+BVtXwPyZPHVmnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYogIpqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gc/ul0zN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYogIpqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gc/ul0zN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvKIs1030425
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 14:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sJFl/rWIG+3PwS5O855pyaCF
	IRlIDPx3F1eQXzJb6rY=; b=KYogIpqkeSNo3S0tmPkWYonseYfMq2howRuz2wLB
	k0fWKoP7E5ro5Dd3rOkK42def7nxyKXbiFEAhvnHS5qJOF0fjC7K2w2umOPFlETu
	Wr+KgiKU5z104tGVJwGw5lEsndG6x8zJ7/vUEfkoCL4UoTkL1dH8Mn3/oNCOVMK7
	ZMvyE7M3XVUDTU9CbUnfZUbIfeSDXBtQtOVeEGEV1NZdWpXGwziXIgmhufWN0gH8
	cRcf7NUH349palNvWcZxKxGwc8oV584bA5rzRhKYCb7pzQ21y6ZFwxlZuKff1fwH
	7iAl8tYQhjnCnFpcnfmm04Oz5nKL9ZE6jVgiJAV1ZhV+Cg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xvpey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 14:47:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso677553b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784818038; x=1785422838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sJFl/rWIG+3PwS5O855pyaCFIRlIDPx3F1eQXzJb6rY=;
        b=gc/ul0zNLowdBUiJ24Ba7bALNKie1TcmMNlVuL03FdTO7h0MRJaiCqwmq6rIo5OCVb
         3By7CT625xr/Fd2DqCppqkRl0vQqSaAnYQhXmNgw20mWpPqt3ptq6aUm4a/IArUJXdK8
         eLAHeAg1QcUGVsuZ07ET017x2rB7dcIG700fD2PeGGYQTBgQAzrWQ/4YOjP8KgA1xsSh
         q+3AuB2xbeU1JLEl7XrK7hS9hNW0RV+7jnQGwfbcNYq1KmNAezClc7T/mVOfEDTeNWfj
         g5QZ+gUUEFJ57oI9tWSIX8Cdh9I8qDfd9t9gKvoyULzbtm2+Zfj2sadNdbZU7HHDklFb
         3UJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784818038; x=1785422838;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJFl/rWIG+3PwS5O855pyaCFIRlIDPx3F1eQXzJb6rY=;
        b=YZNW0VVwpXdbk0AyJraTUFVBw3gogT/unqB2ztP8LiD8lrfjyJu+fSQdpH4wo++d/+
         4V5loprso+tLOz2BrF9PRmrcDdJVpltckVAawmdveU03UGn782+1eM4pQ2uDI+TkeEHO
         MjkseyThfXbwyjYSnkzHyaWOJQyTbgOI0+P1GYUeYMeDI/pHRO4Vm2l/y+hGT1uCd38l
         aaOFhqJvNG4UrjFmwRQG9IHA6y/jAEeEk70LLw86Y07DiJ3KrUEObzZPALaNRqI5fbs4
         x4Yr6ep0Gy8MvL1Ffzf/PzyXGdNSvv2pLuOjQvbTpjGfwqkmnu/4gkoaNlViQ3bURysg
         eOoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpU7VS4rIYcZxrqNCN7JGqwT1Fqcd370SQpLsP5/Bdwss3zgn+SbODKWLvy8LtO2f+wMyGlCcP/K8LVD9R9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbb5u+oKXeSeRnLk5XlneNoywpeCa2tSvCiV5irXf42+N29VFh
	pmrBXslWbLIbjjMDUZ1LweALVgezpuuKjs9RSydxIQRyMfzyRX+RySx4MSYKVI4H2c2c3WPPExs
	x9mW+KLB6aoqFvcrBRXbCypJfVSLfVRQlo9DvYX+mPQVr89/+mxTBilyHNSVO5RmAbL9K3BBj3y
	Cc
X-Gm-Gg: AR+sD12bOlp2idTtwWmm+jZEe3ukg6gXA+UIkGXBKn6glwSdov375kGXPrCjEyu8LqL
	WIKbiBtkeBu117QpOxcnEiEet2nAGBORnmqV8+gA+MAJTuyDYYNpFzZmcFy4+GWUb+c4L95wE+6
	6ojEbFXvj1I6kvhURuonpRCOXru902YQEMeKJ+AOfeINJTGMc4soTMiuqRlpVv1AU03vOrwtJTk
	RH7NQJX27DFtk8olU1BO+hkY3hyAC+WSznhsDXhG4daE9sPsxOnFBZ0ObUnlOBbrdZuVrYj2d4Q
	Ttt0sfh7a+Kk+s7TTdjn9P4yiKn5bEi/iZ2nglxqXSQWv6IaRnUG0hJJuSD7+uAwz/w+o7oRfAY
	Kp/dwEoL4nswPVRoeROLo20ENa1c=
X-Received: by 2002:a05:6a21:730b:b0:3b5:6b5a:4f31 with SMTP id adf61e73a8af0-3c44cb53186mr3448205637.27.1784818038378;
        Thu, 23 Jul 2026 07:47:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:730b:b0:3b5:6b5a:4f31 with SMTP id adf61e73a8af0-3c44cb53186mr3447843637.27.1784818033004;
        Thu, 23 Jul 2026 07:47:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df097e0sm21090074eec.17.2026.07.23.07.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:47:12 -0700 (PDT)
Date: Thu, 23 Jul 2026 20:17:06 +0530
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
Message-ID: <20260723144706.cep5sltjt3bnfldr@hu-mojha-hyd.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: MgYyjyBv5GgghY2XfKz0l2cXoZhI3Rv9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE0NiBTYWx0ZWRfX1guJ1fdr3BC5
 oHDo8/cTbpDjeum8wEDcXu24UlkrAiu3Jd5tCkTVXsIQm4WB7NmpqoabJs6r5agW8mOpmVs4YLV
 903dTTN9zwcr1wSwzq9syETO2ZIFC5k=
X-Proofpoint-GUID: MgYyjyBv5GgghY2XfKz0l2cXoZhI3Rv9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE0NiBTYWx0ZWRfX8VeQddUjM/Gs
 rLIrE7i3Hjpoir9jiRtfrB5tUiUh0TzfHGH1RqC9BZOU5/O0RUuDCwCTVgMbFKpaP1yiuWCBKlW
 rH1456bBBZ5snIXp2a/A6ERPZ6Eggwaua3Fkbu08NQeOcCzZPk2RfFuMBQ4EuBNZ8VNp9y56WMh
 TactPp5cDT6/6YxmfV88cKySnu15ChyfDBs/GWJCefsYgrBNaoilHaGC9+T1cxlZfBRSAjoK9Fw
 bAdKlQl/7gHQE/u5x0Ah238BJl6YqvUpLr+kixYvDah5ogUUyay7J0PUrX3WFEtUkdMuLYA/f5q
 g+vQDbjIJU9iEXwQ94bSvcdLDnJRRBSZXQnvi8QNE4GZaIx418p3NPHiFYUwbDsgrnwr4GpgEED
 JSAqYgGzHpWqBruxe7F+LdTBBzxIFr+XJ/FvnXDvhewEVaRZqMlWz1J5GAd3KIEsx+poAokgQoN
 9BiSscOJOuaL/wR/Xkg==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a622977 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=55bvNncFIk5IGNmgMasA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230146

On Thu, Jul 23, 2026 at 03:52:28AM +0000, Bjorn Andersson wrote:
> There's no synchronization between rproc_crash_handler_work() and
> rproc_del(), as such it's possible for a driver to be removed while
> crash-handler work is scheduled, or even executing - resulting in
> use-after-free issues.
> 
> To avoid this the scheduled work need to be cancelled and synchronized
> against before the removal proceeds.
> 
> In order to ensure that this doesn't race with the reporting, and
> thereby scheduling new work, a "deleting" flag is introduced. This is
> similar to the RPROC_DELETE state that was introduced to ensure that
> "start" didn't race with rproc_del(), but the existing mechanism can not
> be used as it's valid to call rproc_report_crash() in atomic context -
> and the "state" is protected by a mutex.
> 
> In the event that work is cancelled the pm_stay_awake() is left
> unbalanced and need to be unrolled.
> 
> The blocking and cancelling of crash-handler work prior to the actual
> rproc_shutdown() call does have the explicit side-effect that crashes
> resulting from the shutdown process will not enter the crash-handling
> path, and as such will not generate devcoredumps etc. Due to the
> existing mutual exclusion between these code paths there's no concrete
> reduction in functionality, but further work would be needed to handle
> this case.
> 
> Assisted-by: OpenCode:GPT-5.5
> Fixes: 8afd519c3470 ("remoteproc: add rproc_report_crash function to notify rproc crashes")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/remoteproc/remoteproc_core.c  | 42 +++++++++++++++++++++++++++--------
>  drivers/remoteproc/remoteproc_sysfs.c |  1 -
>  include/linux/remoteproc.h            | 13 ++++++-----
>  3 files changed, 41 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 3cd4570513c2..899d2058bc45 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1851,6 +1851,11 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>  
> +	if (READ_ONCE(rproc->deleting)) {
> +		ret = -ENODEV;
> +		goto unlock_mutex;
> +	}
> +
>  	/* State could have changed before we got the mutex */
>  	if (rproc->state != RPROC_CRASHED)
>  		goto unlock_mutex;
> @@ -1883,6 +1888,11 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  
>  	mutex_lock(&rproc->lock);
>  
> +	if (READ_ONCE(rproc->deleting)) {
> +		mutex_unlock(&rproc->lock);
> +		goto out;
> +	}
> +
>  	if (rproc->state == RPROC_CRASHED) {
>  		/* handle only the first crash detected */
>  		mutex_unlock(&rproc->lock);
> @@ -1938,9 +1948,9 @@ int rproc_boot(struct rproc *rproc)
>  		return ret;
>  	}
>  
> -	if (rproc->state == RPROC_DELETED) {
> +	if (READ_ONCE(rproc->deleting)) {
>  		ret = -ENODEV;
> -		dev_err(dev, "can't boot deleted rproc %s\n", rproc->name);
> +		dev_err(dev, "can't boot deleting rproc %s\n", rproc->name);
>  		goto unlock_mutex;
>  	}
>  
> @@ -2533,8 +2543,9 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	INIT_LIST_HEAD(&rproc->subdevs);
>  	INIT_LIST_HEAD(&rproc->dump_segments);
>  
> -	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
>  	INIT_WORK(&rproc->attach_work, rproc_attach_work);
> +	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
> +	spin_lock_init(&rproc->crash_handler_lock);
>  
>  	rproc->state = RPROC_OFFLINE;
>  
> @@ -2598,16 +2609,21 @@ EXPORT_SYMBOL(rproc_put);
>   */
>  int rproc_del(struct rproc *rproc)
>  {
> +	unsigned long flags;
> +
>  	if (!rproc)
>  		return -EINVAL;
>  
> +	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
> +	WRITE_ONCE(rproc->deleting, true);
> +	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> +
> +	if (cancel_work_sync(&rproc->crash_handler))
> +		pm_relax(rproc->dev.parent);
> +
>  	/* TODO: make sure this works with rproc->power > 1 */
>  	rproc_shutdown(rproc);
>  
> -	mutex_lock(&rproc->lock);
> -	rproc->state = RPROC_DELETED;
> -	mutex_unlock(&rproc->lock);
> -
>  	rproc_delete_debug_dir(rproc);
>  
>  	/* the rproc is downref'ed as soon as it's removed from the klist */
> @@ -2719,18 +2735,26 @@ EXPORT_SYMBOL(rproc_get_by_child);
>   */
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>  {
> +	unsigned long flags;
> +
>  	if (!rproc) {
>  		pr_err("NULL rproc pointer\n");
>  		return;
>  	}
>  
> +	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
> +	if (READ_ONCE(rproc->deleting)) {
> +		spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> +		return;
> +	}
> +
>  	/* Prevent suspend while the remoteproc is being recovered */
>  	pm_stay_awake(rproc->dev.parent);
> +	queue_work(rproc_recovery_wq, &rproc->crash_handler);

Do we really need this inside the spinlock ?

> +	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
>  
>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>  		rproc->name, rproc_crash_to_string(type));
> -
> -	queue_work(rproc_recovery_wq, &rproc->crash_handler);
>  }
>  EXPORT_SYMBOL(rproc_report_crash);
>  
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 138e752c5e4e..925b0cdbe577 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -168,7 +168,6 @@ static const char * const rproc_state_string[] = {
>  	[RPROC_SUSPENDED]	= "suspended",
>  	[RPROC_RUNNING]		= "running",
>  	[RPROC_CRASHED]		= "crashed",
> -	[RPROC_DELETED]		= "deleted",
>  	[RPROC_ATTACHED]	= "attached",
>  	[RPROC_DETACHED]	= "detached",
>  	[RPROC_LAST]		= "invalid",
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 17ed75a11e15..ef711a5b1a7f 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -37,6 +37,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/mutex.h>
> +#include <linux/spinlock.h>
>  #include <linux/virtio.h>
>  #include <linux/cdev.h>
>  #include <linux/completion.h>
> @@ -145,7 +146,6 @@ struct rproc_ops {
>   *			a message.
>   * @RPROC_RUNNING:	device is up and running
>   * @RPROC_CRASHED:	device has crashed; need to start recovery
> - * @RPROC_DELETED:	device is deleted
>   * @RPROC_ATTACHED:	device has been booted by another entity and the core
>   *			has attached to it
>   * @RPROC_DETACHED:	device has been booted by another entity and waiting
> @@ -163,10 +163,9 @@ enum rproc_state {
>  	RPROC_SUSPENDED	= 1,
>  	RPROC_RUNNING	= 2,
>  	RPROC_CRASHED	= 3,
> -	RPROC_DELETED	= 4,
> -	RPROC_ATTACHED	= 5,
> -	RPROC_DETACHED	= 6,
> -	RPROC_LAST	= 7,
> +	RPROC_ATTACHED	= 4,
> +	RPROC_DETACHED	= 5,
> +	RPROC_LAST	= 6,
>  };
>  
>  /**
> @@ -261,6 +260,8 @@ enum rproc_features {
>   * @index: index of this rproc device
>   * @attach_work: workqueue for attaching rproc
>   * @crash_handler: workqueue for handling a crash
> + * @crash_handler_lock: serializes crash handler queueing and deletion
> + * @deleting: remoteproc deletion has begun
>   * @crash_cnt: crash counter
>   * @recovery_disabled: flag that state if recovery was disabled
>   * @max_notifyid: largest allocated notify id.
> @@ -305,6 +306,8 @@ struct rproc {
>  	int index;
>  	struct work_struct attach_work;
>  	struct work_struct crash_handler;
> +	spinlock_t crash_handler_lock;
> +	bool deleting;
>  	unsigned int crash_cnt;
>  	bool recovery_disabled;
>  	int max_notifyid;
> 
> -- 
> 2.53.0
> 

-- 
-Mukesh Ojha
