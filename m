Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92352353A70
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 12:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130659; cv=none; b=jG0pJRwzBh9Hy/Vb2aCvxM3yzpCGhRTaRd3PF7R4KxUiX3V8/HO2BIYzPFNojbVLOXnWyG7hwBrmoeunWNNHRp/QutZKnnkku1MNjdpkcwciIRE57rgcjLw9tJvjaUsmHaI/9H7BVJ5PxTPTMl+83jYa8p2pYd/eTzhw7GL0spc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130659; c=relaxed/simple;
	bh=Iw8u2HFgGqDAoQrrT9wzoBb0ozZH/XWjDz6cYa9Fox4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLp+1Vr3Mc/iZxkee3h8x758+oYo9Ema/qdTRrLGPM9Jc5a2o6heMCMvjO/eJI9iQfKM3WZNe8z79GFv/6Lwa8lx3Xm3L9aHTiXS0GKamgGJnSTHt7eNrTum8IzJdqVCEe48dYJxgP+nsfBZQbfko6sOppxE+b3U697W1OrcP9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjK7fcb6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKiQYTbD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjK7fcb6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKiQYTbD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BAqEVT4105344
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 12:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hs3C87rUc37Br7hDul2xSyhF
	h9hB6GXOl4E84myixsI=; b=NjK7fcb6JPtbo5k6auGunh1/s6S8cSB7/2xfUCb0
	geBR6XfxyIyAv/YgcP8Y+c9tuKr9gYAo3B6JafTG8Heot7v1jkoHq+1UeI5/8ix4
	uIuXBf3NIewBEGLANgLEDH4Iv91nN3YQ4OrelX0svTbAYm0QAF7onmGlMv1xOTv2
	pqTqXF1qOaUn2TSkn2Zx+Zy+UlzWsOMcW6qV/pxCY0hCDp6ut9jyKGe+oY6sv/Jx
	mJYOXFPLWKjH6vg1XX2p8L37maNfpKt26iRisfXiPNpqJvnAdB1w7P207DHsAOw9
	m9cW25yCDc132GIie1OvaXAGaotgkwZaoA4TdtHSVtUrIw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg1wm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 12:44:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d904f64a30so1511455ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 05:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789130655; x=1789735455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hs3C87rUc37Br7hDul2xSyhFh9hB6GXOl4E84myixsI=;
        b=fKiQYTbDKQfAi0S23XtJQ4AeV/Q42iA9GSeFDLieoavnkmfTPp0d5k5tawdaSIUc46
         E0V0yRBcCBXN9TjyVdkZEW3BAawVbG8PaSvbDO3XxkauzwfhLakBf44BbteZmIoczD0G
         pTyO+m0aRlQPpLg9Uw8aaacI56stDtWi9YuxC3CJzxDfOCtYrNo9iJwOpEdcGXwW9To1
         rGy8VvkgtxGn6YHFULweROYK+I5StwYfL90IDASdz0EVXy11u3Vf26RwHVeI5aJ/E8bW
         Y7Yq3lWv2rCpYZO8FU8bAW2OBjHRkerW9oAk+CddqHgp4WntOzM6EQiZVKUGkMYXY4u0
         hWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130655; x=1789735455;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hs3C87rUc37Br7hDul2xSyhFh9hB6GXOl4E84myixsI=;
        b=oLTejJFJLaC6Sql6l0wcSnlGcFcldm3iJWfsuv1h28/qExAfUMbd83wimIoUcKE2yU
         LDRvWHDTpkkk5OkLYaMont0ADvr/8XN1lQjjN1OivelFwehl+p3aDRENQ12dBSRVq9aM
         djCc91NKXYBBsDXuZO+RJwM7ow9sLlpHcar5C9GErjD5EPpVxHth94ji8SfwjzocPg35
         1inv+Nq4IBjdZyyFDs04Bdbww38EORf2ccIy+7OJv3w8y/nMgccZxFAYhKTPYmidY7fD
         PIQWvnSW818jlclZehsKkSRxjC4HHqjGRgwADkKBMvT4lFTBMJ+m9jgd5q+bX8iAXuGk
         /ZHA==
X-Forwarded-Encrypted: i=1; AKwUvBysrRFJ1QoZuiC171H9fz8VaI0NuwsTJvsUQ3Qh3I6gI5opk+O6gYy+g2QJ6ouVNiU2IKizr3ahIKkJcpu0@vger.kernel.org
X-Gm-Message-State: AFuF++mkmZDBF31S/AZk9MN/0u4EmrVvpZ3rbDF9+yzizYxkncTrwlD6
	HikuDJetC0eqyLWYRONITRYHCFqmRZvIKNtmMr+M79QtGQNoq3yzHipWFIrQe9lmkxxvOs7cxfZ
	MQvEvWSGkQXsVswTVFxSw711k65soJLfXajEYaF+0u52iHYhPLDObcCWsg9inOV+NOADN
X-Gm-Gg: AYBFou0ba7bDILk/gUniFVA0oftxYkvCoetZd+q72XBAUE8L/CpmfWfB3kmoOGzeNF9
	x0/fAvFu123HGCCrks8/sOWEZNaMWbWlq013HYKM8JJYajIA5gzAgzpRgGv87btuFPryZj09lbE
	cDids8OAY8PfKDekunK0ZxGOoFKyd6pmVXGpG7rpZv9wXrqWWPfwbPPE7JH2B6jg1pCEsY6BRFO
	KbwGBkE8M7+y42GADXDpuYiEWT0QEzT1MyHkoKGNDiboFyl7/llAJ0+kKGlAynTzFFL6AVOrlEj
	zXS52ZB1HV3NDjqMxrk/sb63z14+Ewyx5/P/j4vN1Zw0vUWOme5YJtxKlwMNdMFqLosIf8zPA/K
	Xu0SXYwWkgbAK2BQCseB0F/0t9vsHelkJUWHDBKlY3hqn2ktJE4iLpfMhYkPZrrxaCzOPCe41gc
	QnsF982AAXIX5lgcFfVLQd
X-Received: by 2002:a17:902:ce12:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2dd29e0eb11mr52067485ad.0.1789130654992;
        Fri, 11 Sep 2026 05:44:14 -0700 (PDT)
X-Received: by 2002:a17:902:ce12:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2dd29e0eb11mr52067185ad.0.1789130654445;
        Fri, 11 Sep 2026 05:44:14 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd3f0faf19sm3636485ad.12.2026.09.11.05.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:44:13 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:14:04 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Archit Taneja <architt@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
        venkata.valluru@oss.qualcomm.com,
        Naman S Thaker <namathak@qti.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm: split DPU core IRQ handler under
 CONFIG_PREEMPT_RT
Message-ID: <aqP3lDjzzsbFNly5@hu-vishsain-blr.qualcomm.com>
References: <20260909-drm-mis-next-split-irq-v1-1-89bc9c512c53@oss.qualcomm.com>
 <20260910064723.pbZP3vic@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910064723.pbZP3vic@linutronix.de>
X-Proofpoint-ORIG-GUID: SjjZ4bpoA3-L0nBRq1exDzQI4f6vGtQR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE3NyBTYWx0ZWRfXyTnybWkP+hYs
 4stM62CjsDRzC3bInxW21VuLswhBZ7ttcCpIxJbYI0gUn1J/3F9V/xQHJ9zc1T3nP2Rhg66Ook6
 70uGnR5YzYy+731cQaI5fidhuNMy6Kc=
X-Proofpoint-GUID: SjjZ4bpoA3-L0nBRq1exDzQI4f6vGtQR
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3f79f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=p8fm3qIaiwJ8G5vN5j0A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE3NyBTYWx0ZWRfX45ZFmj5OFsWl
 FHCcwywBRSukRdtCIfIqVEULjYS3LPbGCt8jVMKiKfIR1w8/vhZh47fu8teDRTY9ApF/5MI7usM
 nj2eU+6Qz2ISsLnxtxkIgAtHGuuKn8HTdy1UfwPUCcjZa9KwmHM+eh5hCZc5Y6xxCOTg9qtT84E
 gRvq09SNoXhHv/V1JurUigfIbMQm2TBBKs0j+ILf606p02uaA3Ybsyjh+GMtSMv+l2+1E8fB9o/
 pP3yvMACFk0ilRLPGKt6iziA25qbmnIf+dxK7P/YPkAsluWUTl4Ls6Imj08HBPYZ2XkDnWOraaI
 b8gNBCFJ+p1ElHdyGBImmcYd1OGJzWYLXL2aoQrPC2tCNOLxnWMXWcHSmV5D6My0rQFoxK45HGo
 DWsUF+oc0csCj6O+R0E5M89CyMnXyQ7KQz/VsclPzF1aoHn7stv4h1T/6VJPht0iPNjy+U47a63
 pDshhAXiN9gvyIo4twA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110177

On Thu, Sep 10, 2026 at 08:47:23AM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-09-09 14:22:16 [+0530], vishnu.saini@oss.qualcomm.com wrote:
> > From: Naman S Thaker <namathak@qti.qualcomm.com>
> > 
> > On a PREEMPT_RT kernel, dpu_core_irq() runs as a true hardirq handler,
> 
> *why* is this the case. The code you replaces adds some ifdefs around
> request_irq() with 0 as flags. This does not make it run has hardirq.
You are right, the statement is incorrect, i will update the commit msg.
On RT kernel, the dpu_core_irq() runs in threaded context by default.
This behavior is changed in the commit by calling devm_request_threaded_irq with
IRQ_ONESHOT flag only for RT kernel using the ifdefs.

The irq is now split into two parts for RT,
1: primary handler which does not use sleeping locks, and
2: secondary threaded handler which can use sleepable locks.
For normal kernels, the request_irq() with 0 flag is still used as-is.

 
> > but it dispatches per-encoder callbacks that take sleepable locks
> > (spinlock_t becomes an rt_mutex on RT, and some DRM-core locks reached
> > through vblank/CRC/writeback handling are sleepable as well). Sleeping
> > inside a hardirq handler is not allowed and eventually crashes the
> > display, which is what happens after running GLMark2 for a while.
> 
> That is correct. That is the irq handler are threaded by default and
> only non-threaded if explicitly requested.
> 
> I suggest to stick with non-threaded by default.
> There is only one request_threaded_irq() as far as I can tell and this
> msm_dp_display_request_irq():
> 
> |         rc = devm_request_threaded_irq(&pdev->dev, dp->irq,
> |                                        msm_dp_display_irq_handler,
> |                                        msm_dp_display_irq_thread,
> |                                        IRQ_TYPE_LEVEL_HIGH,
> |                                        "dp_display_isr", dp);
> 
> and its primary handler will be threaded on PREEMPT_RT, too. So you end
> up with two threads here.
You are correct about the primary handler in msm_dp_display_request_irq() being threaded.
But the request_threaded_irq function in msm_dp_display_request_irq() is not modified in this commit.
The issue fixed by the current commit relates to msm_mdss_irq crash stack below.

[  152.108462] Call trace:
[  152.108465]  show_stack+0x18/0x30 (C)
[  152.108477]  dump_stack_lvl+0x60/0x80
[  152.108484]  dump_stack+0x18/0x24
[  152.108489]  __report_bad_irq+0x4c/0xec
[  152.108496]  note_interrupt+0x340/0x394
[  152.108502]  handle_irq_event+0x94/0xa0
[  152.108508]  handle_level_irq+0xd8/0x16c
[  152.108513]  handle_irq_desc+0x34/0x5c
[  152.108518]  generic_handle_domain_irq+0x1c/0x28
[  152.108522]  msm_mdss_irq+0x68/0x144 [msm]
[  152.108654]  handle_irq_desc+0x34/0x5c
[  152.108660]  generic_handle_domain_irq+0x1c/0x28
[  152.108664]  gic_handle_irq+0x4c/0x140
[  152.108669]  call_on_irq_stack+0x30/0x48
[  152.108673]  do_interrupt_handler+0x80/0x84
[  152.108678]  el1_interrupt+0x38/0x58
[  152.108685]  el1h_64_irq_handler+0x18/0x24
[  152.108690]  el1h_64_irq+0x70/0x74
[  152.108694]  __schedule+0x6c/0xc9c (P)
[  152.108701]  schedule_idle+0x20/0x40
[  152.108705]  do_idle+0x17c/0x2c0
[  152.108710]  cpu_startup_entry+0x38/0x40
[  152.108714]  rest_init+0xd8/0xe0
[  152.108719]  console_on_rootfs+0x0/0x6c
[  152.108726]  __primary_switched+0x88/0x90
[  152.108732] handlers:
[  152.108734] [<000000000cabe59c>] irq_default_primary_handler threaded [<00000000779fd542>] msm_irq [msm]
[  152.108859] Disabling IRQ #246

> Sebastian
