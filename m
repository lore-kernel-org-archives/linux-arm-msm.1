Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBBB44CAC6
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 11:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014743; cv=none; b=N5q007fnW9adfuruCHDD+gQ48v1L+eCK1Ak6OvEEEMMZZYTzSsxYzHRajD9s5xBq2M2bztaZLVks4r2Io0InBIWVhl5aN2HTzTuAp5n4W/ZgYne6k+tagT744vjmWHA6i2bfDd3wPtHXcnZq1LfZT+Djz335HB898Cw8ZV7i9GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014743; c=relaxed/simple;
	bh=SA5xKkr4k4JH8W3UibIRq0ITHBL+VJeNdLdPDMEmYsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1g/DmCpvbCs3n9iRiwwbpaBqEJ5B2GVN89pBPXqhtqHKeVQCkDvKXvQt59rZAEdJMf35+CGiCuSboQjZM3lppz47syaUdMs/HGIstecfhhWbauXLNSQvECfZIUfujM0N1u94MnxLUvnMynLz7ted8V/IKDwwUqfT1UCNhik8S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+6r2Uq2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNzXeIt2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+6r2Uq2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNzXeIt2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nhfF1228148
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 11:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	07eeDzTXVKd4op1zvdG1+PXG44SaYTB3kcWlWrEVtcg=; b=X+6r2Uq2ezM5+1YO
	T2TaA74lLPGOU74tYAEX69R7ao4L2C/Fqo6bN41qsQMevj+DRysFWDSJw4m7DzhL
	BF5h8Wy3o0hsU559V3kL8PZ0lHknz/w8mnXxHgNb9Wz4DJh4sWEt11hTHzLHwOfk
	BjY4KUYpWAI+rXu5WzEA802Z/PQc0kSXWNVDGLwFNmDzOvukW3hUdxQExeWx40Yd
	hE5+t/7Zs+hV+r0QNCXL5eYH5JhRxLiq8hJP8FeLe9by2BrGDwLdoehn4I8sgDGw
	7rHwvwZwdqp9Duvx4bJZxnxeqb6FsuFf4Sl3ke+viICvML0y4UOhLo2CQOb19Puj
	x6Bjfg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqdugjn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 11:12:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab041eced3so3064881a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786014737; x=1786619537; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=07eeDzTXVKd4op1zvdG1+PXG44SaYTB3kcWlWrEVtcg=;
        b=GNzXeIt2KsHRmwH2FOgLy1uTEBAw3EFf3bheWGfH0ujhe4AGVA8ArJKzCwrXWcVHfQ
         +ay/1RDoMtL0BneUWRMp2gHiE9RXZwSR8HC3Bmlkpqvf/AEalLMdEnXGGzL9gW6MfvBS
         oVWgTTiiX1xh9vxoKKy5bfvKbK12j9ETuAbqhpVDKJHvaNJZVceu2eZvZtlwCN0znUUm
         9ezJq/NN6eX7NJWyRuSfdZIB5DiFibKbRr0gcMhaNGZDq40fqyK74mAZmal2w09Ie03n
         TcdsH+IqovJRMUzFbZbW6U6tl2cuKBUffdJ/JKQi91RPgnFTIZigJ91icoSq/0hIkie/
         uISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786014737; x=1786619537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=07eeDzTXVKd4op1zvdG1+PXG44SaYTB3kcWlWrEVtcg=;
        b=lTC+GMeGkqiq2O0yjaqh9CAfkkg1YPlApnPoqWMyyt3VaU3r8FmvP6JOjwYcnwXtJY
         JFm3RSONG7WFFuSWXPUI91CHvlE2vHS41rhWXTCcTQqeRoumtCFSQs7+mcKbPrH1ZTVI
         3h8ZTBpW6pSfXuidRpa9oijP6eesRdtxb+xLR5UBpghaPi67/0p6HLteD0+w5NVWyyNH
         Fb/lUs18JAG0xxG2ILJ8k/D9Bqgb7E6HJ+uv7OyOyHnxYjQ+ESgrnVZH7hUZzCpHztAz
         fFrYjLO5VP0VNUoZquB1S5VN9H/otX0SrxW0QLtIByiK7agzj3CtXMk6gVzdQcgz6wue
         LI9w==
X-Forwarded-Encrypted: i=1; AHgh+RqjluBXLVbnSgxaA+7wZStC/tLxYbCAbesIba0mIY4qcg+YB8UnCp6uPejmoRvIpWMXJ+LU+07LDhedIqAw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz31eYC8aBGMy+6ua+1uUKA/LGtNW6d7mJH5O++3X69+5cc89OA
	1jYZ881zknuYZWQeGPM865XMvQEAmB3x/+YyjXV9nC1kzsJArbyivXLQvli3Jw/DJvDedJhfwO0
	ohl7g1qQHwXWbD2ah6p97ihRF2PEP2yx+ZA6c5PvnBH4FLwM5q86FtpjyqSg2F+99rSrp
X-Gm-Gg: AR+sD10y4neorzNP65Cf0552q1GhFeIhuKJSqBfCbWHrPbS/zdHB2xFpnYTWsx0DIYG
	QYzdHy3X0NW+ZFG0OZbxT9OyPgPO7wTULlmXPrZ6hMC9c/RHUAZf8xpvE0Z9D8935EBdLBbBbqT
	Yx2rmGoFHO/tEddheHz3NKVyyz6zwGp3OzCOqtmpWZLput26RucJLrEC2h9em72nIozAvYHJQu+
	7mIswTcQ0W/IJcBTnFUGIjRQEwofk+Ot1XzjWYKxXYYb5DHIDPgfSOmF4jY8pqJHuqvHgi8IpVa
	j+EL/8j6FnGQGYfNC+5GImfi0vmvrA457tBrFqrV9ZyvYpw0sV5DkCsBky2SuPTyxY2H9Dlctx8
	V/HsHvMJLKr08UvJUys8bdcQvFxE=
X-Received: by 2002:a05:6a21:9985:b0:3c3:bbe6:95c9 with SMTP id adf61e73a8af0-3cb85e72ec2mr15471019637.16.1786014736915;
        Thu, 06 Aug 2026 04:12:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:9985:b0:3c3:bbe6:95c9 with SMTP id adf61e73a8af0-3cb85e72ec2mr15470931637.16.1786014736284;
        Thu, 06 Aug 2026 04:12:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867d7e4csm27992133eec.31.2026.08.06.04.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:12:15 -0700 (PDT)
Date: Thu, 6 Aug 2026 16:42:09 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] firmware: qcom: scm: Fix tzmem state on probe
 retry
Message-ID: <20260806111209.eijwcaoiutjvblk4@hu-mojha-hyd.qualcomm.com>
References: <20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com>
 <20260724094939.613844-4-mukesh.ojha@oss.qualcomm.com>
 <CGME20260806092742eucas1p1b946452d9f0f714b27cad67cd5590c21@eucas1p1.samsung.com>
 <5ea74dd3-7471-4c7c-9242-c2005312b1ab@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ea74dd3-7471-4c7c-9242-c2005312b1ab@samsung.com>
X-Proofpoint-GUID: _6X79Qgb2n3wK1jpZsPi4uNbpjtdz_Rp
X-Proofpoint-ORIG-GUID: _6X79Qgb2n3wK1jpZsPi4uNbpjtdz_Rp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4OCBTYWx0ZWRfX0MvrAUip42YO
 9+8oENg4Yhdj0gk7puso9eoFBq5ciQZZ/RCHa0P/5UNbYGcvmQhKlBo/G9uHqy2hXyaG5EuLqWF
 +QyUhyPsd/PnYFpSC0M36egaszptk9eZsSC8REkbmmJ9oQgSi+8KuYLD5Id9P8iiCALaz7z+n2k
 smSiKRwWf9Z40QQZ4QivpvRH8QANfX/Gtt4mhPTbdlwh8Fz/90NsSPIXedsnGUadoLRDE5JsT+R
 QGw7sm3ex3YirQnKKM+kXR6IiHRIY5OOHQc0uNrkAk07EVdjyqJyabfl9ct4MCMs+FJV+SUXdRi
 BGccIGrGZloGrhZqw8KV1GPefD7fVyz0IdEMQt0/WpHKfMRm5bsAg4T9L9g7nuv2OD4ImGM0g8I
 b7ocX96iE0WfVIt9UifSUTVcsylvJ4jvUOXYjbuhrKEQ2Hq3K2tpTqdFeGk85I7dFmY1LRe75/p
 q1gvSPMG4bhGuA+JKwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4OCBTYWx0ZWRfX4C1AOPPX2N9U
 cYIiEREae62X6aP3bYVhbJHv5V+U5dSqFZZztQ7E9o+ddOzaTkDkL04OZ0BRLdGFQNkfOpQAuwn
 GaatrzQNj54czEFXqPc//h4AuYcwjYg=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a746c11 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Jpntq_2DsLf-gPNxgnUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060088

On Thu, Aug 06, 2026 at 11:27:39AM +0200, Marek Szyprowski wrote:
> On 24.07.2026 11:49, Mukesh Ojha wrote:
> > qcom_tzmem_enable() returns -EBUSY if called a second time, but this
> > causes probe retries to fail permanently if a later step in
> > qcom_scm_probe() defers after qcom_tzmem_enable() has already succeeded.
> >
> > Use DO_ONCE() to ensure qcom_tzmem_init() runs exactly once across all
> > calls in a thread-safe manner. qcom_tzmem_dev is set on every call since
> > probe retries use the same device pointer. The result of the first
> > initialisation is cached and returned to every subsequent caller.
> >
> > Fixes: 40289e35ca52 ("firmware: qcom: scm: enable the TZ mem allocator")
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_tzmem.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> > index 0635cbeacfc8..0fd9581275f1 100644
> > --- a/drivers/firmware/qcom/qcom_tzmem.c
> > +++ b/drivers/firmware/qcom/qcom_tzmem.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/list.h>
> >  #include <linux/mm.h>
> > +#include <linux/once.h>
> >  #include <linux/radix-tree.h>
> >  #include <linux/slab.h>
> >  #include <linux/spinlock.h>
> > @@ -507,14 +508,18 @@ phys_addr_t qcom_tzmem_to_phys(void *vaddr)
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_tzmem_to_phys);
> >  
> > +static void qcom_tzmem_do_init(int *result)
> > +{
> > +	*result = qcom_tzmem_init();
> > +}
> > +
> >  int qcom_tzmem_enable(struct device *dev)
> >  {
> > -	if (qcom_tzmem_dev)
> > -		return -EBUSY;
> > +	static int result;
> >  
> >  	qcom_tzmem_dev = dev;
> > -
> > -	return qcom_tzmem_init();
> > +	DO_ONCE(qcom_tzmem_do_init, &result);
> One should use DO_ONCE_SLEEPABLE() here, otherwise it triggers a warning during
> boot on some on my test systems. Here is a log captured with
> CONFIG_DEBUG_ATOMIC_SLEEP=y on recent linux-next releases, where this patch is
> applied as commit 9941fe8a04f3 ("firmware: qcom: scm: Fix tzmem state on probe
> retry"):

Thanks for reporting; I will spin a fix..and yes DO_ONCE_SLEEPABLE() is the right one.

> 
> qcom_scm: convention: smc arm 64
> BUG: sleeping function called from invalid context at drivers/firmware/qcom/qcom_scm.c:334
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 49, name: kworker/u16:2
> preempt_count: 1, expected: 0
> RCU nest depth: 0, expected: 0
> locks held by kworker/u16:2/49: 4, last CPU#3:
>  #0: ffff000000032140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x6b4/0x840
>  #1: ffff800080563d90 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1fc/0x840
>  #2: ffff00000036f938 (&dev->mutex){....}-{4:4}, at: __device_attach+0x3c/0x190
>  #3: ffffa83e89fe4af0 (once_lock){....}-{3:3}, at: __do_once_start+0x2c/0x74
> irq event stamp: 80794
> hardirqs last  enabled at (80793): [<ffffa83e87faa600>] _raw_spin_unlock_irqrestore+0x6c/0x70
> hardirqs last disabled at (80794): [<ffffa83e87fa9a6c>] _raw_spin_lock_irqsave+0x84/0x88
> softirqs last  enabled at (80780): [<ffffa83e86ccc050>] handle_softirqs+0x5dc/0x5f4
> softirqs last disabled at (80755): [<ffffa83e86c10700>] __do_softirq+0x14/0x20
> CPU: 3 UID: 0 PID: 49 Comm: kworker/u16:2 Not tainted 7.2.0-rc6-next-20260805+ #13357 PREEMPT
> Hardware name: Arduino UnoQ (DT)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>  show_stack+0x18/0x24 (C)
>  dump_stack_lvl+0x8c/0xcc
>  dump_stack+0x18/0x24
>  __might_resched+0x148/0x24c
>  __might_sleep+0x48/0x7c
>  qcom_scm_call+0x30/0xc0
>  __qcom_scm_is_call_available+0x98/0x100
>  qcom_scm_shm_bridge_enable+0x60/0xbc
>  qcom_tzmem_enable+0xf8/0x118
>  qcom_scm_probe+0x2d0/0x680
>  platform_probe+0x5c/0x9c
>  really_probe+0xbc/0x29c
>  __driver_probe_device+0x16c/0x19c
>  driver_probe_device+0xb8/0x118
>  __device_attach_driver+0xb8/0x118
>  bus_for_each_drv+0x88/0xe8
>  __device_attach+0xa0/0x190
>  device_initial_probe+0x50/0x54
>  bus_probe_device+0x38/0xa8
>  deferred_probe_work_func+0x8c/0xc8
>  process_one_work+0x24c/0x840
>  worker_thread+0x1bc/0x368
>  kthread+0x134/0x140
>  ret_from_fork+0x10/0x20
> 
> =============================
> [ BUG: Invalid wait context ]
> 7.2.0-rc6-next-20260805+ #13357 Tainted: G        W
> -----------------------------
> kworker/u16:2/49 is trying to lock:
> ffffa83e8a485e38 (qcom_scm_lock){....}-{4:4}, at: __scm_smc_do+0x70/0x488
> other info that might help us debug this:
> context-{5:5}
> locks held by kworker/u16:2/49: 4, last CPU#3:
>  #0: ffff000000032140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x6b4/0x840
>  #1: ffff800080563d90 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1fc/0x840
>  #2: ffff00000036f938 (&dev->mutex){....}-{4:4}, at: __device_attach+0x3c/0x190
>  #3: ffffa83e89fe4af0 (once_lock){....}-{3:3}, at: __do_once_start+0x2c/0x74
> stack backtrace:
> CPU: 3 UID: 0 PID: 49 Comm: kworker/u16:2 Tainted: G        W           7.2.0-rc6-next-20260805+ #13357 PREEMPT
> Tainted: [W]=WARN
> Hardware name: Arduino UnoQ (DT)
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>  show_stack+0x18/0x24 (C)
>  dump_stack_lvl+0x8c/0xcc
>  dump_stack+0x18/0x24
>  __lock_acquire+0x928/0x1f90
>  lock_acquire+0x2b8/0x3ec
>  __mutex_lock+0xbc/0x860
>  mutex_lock_nested+0x24/0x30
>  __scm_smc_do+0x70/0x488
>  __scm_smc_call+0xd4/0x444
>  qcom_scm_call+0x64/0xc0
>  __qcom_scm_is_call_available+0x98/0x100
>  qcom_scm_shm_bridge_enable+0x60/0xbc
>  qcom_tzmem_enable+0xf8/0x118
>  qcom_scm_probe+0x2d0/0x680
>  platform_probe+0x5c/0x9c
>  really_probe+0xbc/0x29c
>  __driver_probe_device+0x16c/0x19c
>  driver_probe_device+0xb8/0x118
>  __device_attach_driver+0xb8/0x118
>  bus_for_each_drv+0x88/0xe8
>  __device_attach+0xa0/0x190
>  device_initial_probe+0x50/0x54
>  bus_probe_device+0x38/0xa8
>  deferred_probe_work_func+0x8c/0xc8
>  process_one_work+0x24c/0x840
>  worker_thread+0x1bc/0x368
>  kthread+0x134/0x140
>  ret_from_fork+0x10/0x20
> qcom_scm firmware:scm: qseecom: found qseecom with version 0x1402000
> qcom_scm firmware:scm: qseecom: untested machine, skipping
> 
> 
> > +	return result;
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
> >  
> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

-- 
-Mukesh Ojha
