Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3E33D667D
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008473; cv=none; b=qDDXJNfxS02SfupB6dM2riRcQ+21rL8DA/16RgCOVSQ2VL/JBtvtIlAG1t/6PbKx8I0vaFryAWTBrJ9I8fgCL1LYIlP4jgpL8hFOc+Bw2OWFpFUaFa7Tjycgk5DN2JVxszOZoVo8+Fvcj2IVNtd05ubGAsLuSe6JbOAzjriEhJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008473; c=relaxed/simple;
	bh=NCZMflmLwF5X4s1FvySaPS2r1Lz+qFEvz71GBRo/aPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ZwXAqtVrDI0Wp/nXJOf3wGlht6k3cYHW0biPYbsayRY6Gy6xDdqJcWBSodwybUx5WlSJPlCmCy6lGGYFD19okfPHxlcgf08oJK8D+hVuwb+HTxiNpXZYDh5TABtfLx4qQBK9yW4ctM7MUndTxDjC98XNuqU4GtkbmbVmGwGlZfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FcgX6daG; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FcgX6daG"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260806092743euoutp02430a24410f0bbd669b45b1e98837767a~JLTwLk1KT3243832438euoutp027
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 09:27:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260806092743euoutp02430a24410f0bbd669b45b1e98837767a~JLTwLk1KT3243832438euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1786008463;
	bh=Z4uUA35lNdQ+48oEk/A8GHX3inB3s7Ggd6N+WSjqvfA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=FcgX6daGtyx2Dg1WpxbmPfntFFNE98djq97yGDflelYAEGXi1kCJc3duEJAUSJxvB
	 yfTDQ0ueprH8j9R+keBurp9GtPr1yVgIJywcC6r5Rt3Nd4noiZmicOMH6S/ginBdGk
	 jNPF736WtkMqZAFFWq8+VBxfIGbtBEc9/8/RN4ms=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260806092742eucas1p1b946452d9f0f714b27cad67cd5590c21~JLTv0fBx60558605586eucas1p1H;
	Thu,  6 Aug 2026 09:27:42 +0000 (GMT)
Received: from [106.120.50.46] (unknown [106.120.50.46]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260806092741eusmtip2202e508bd6e485b05fd920404f109171~JLTuL71PK2688526885eusmtip2e;
	Thu,  6 Aug 2026 09:27:40 +0000 (GMT)
Message-ID: <5ea74dd3-7471-4c7c-9242-c2005312b1ab@samsung.com>
Date: Thu, 6 Aug 2026 11:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 3/3] firmware: qcom: scm: Fix tzmem state on probe
 retry
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Bartosz
	Golaszewski <brgl@kernel.org>, Guru Das Srinagesh <linux@gurudas.dev>, Sibi
	Sankar <sibi.sankar@oss.qualcomm.com>, Elliot Berman
	<quic_eberman@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz
	Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260724094939.613844-4-mukesh.ojha@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260806092742eucas1p1b946452d9f0f714b27cad67cd5590c21
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260806092742eucas1p1b946452d9f0f714b27cad67cd5590c21
X-EPHeader: CA
X-CMS-RootMailID: 20260806092742eucas1p1b946452d9f0f714b27cad67cd5590c21
References: <20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com>
	<20260724094939.613844-4-mukesh.ojha@oss.qualcomm.com>
	<CGME20260806092742eucas1p1b946452d9f0f714b27cad67cd5590c21@eucas1p1.samsung.com>

On 24.07.2026 11:49, Mukesh Ojha wrote:
> qcom_tzmem_enable() returns -EBUSY if called a second time, but this
> causes probe retries to fail permanently if a later step in
> qcom_scm_probe() defers after qcom_tzmem_enable() has already succeeded.
>
> Use DO_ONCE() to ensure qcom_tzmem_init() runs exactly once across all
> calls in a thread-safe manner. qcom_tzmem_dev is set on every call since
> probe retries use the same device pointer. The result of the first
> initialisation is cached and returned to every subsequent caller.
>
> Fixes: 40289e35ca52 ("firmware: qcom: scm: enable the TZ mem allocator")
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> index 0635cbeacfc8..0fd9581275f1 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -15,6 +15,7 @@
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/mm.h>
> +#include <linux/once.h>
>  #include <linux/radix-tree.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> @@ -507,14 +508,18 @@ phys_addr_t qcom_tzmem_to_phys(void *vaddr)
>  }
>  EXPORT_SYMBOL_GPL(qcom_tzmem_to_phys);
>  
> +static void qcom_tzmem_do_init(int *result)
> +{
> +	*result = qcom_tzmem_init();
> +}
> +
>  int qcom_tzmem_enable(struct device *dev)
>  {
> -	if (qcom_tzmem_dev)
> -		return -EBUSY;
> +	static int result;
>  
>  	qcom_tzmem_dev = dev;
> -
> -	return qcom_tzmem_init();
> +	DO_ONCE(qcom_tzmem_do_init, &result);
One should use DO_ONCE_SLEEPABLE() here, otherwise it triggers a warning during
boot on some on my test systems. Here is a log captured with
CONFIG_DEBUG_ATOMIC_SLEEP=y on recent linux-next releases, where this patch is
applied as commit 9941fe8a04f3 ("firmware: qcom: scm: Fix tzmem state on probe
retry"):

qcom_scm: convention: smc arm 64
BUG: sleeping function called from invalid context at drivers/firmware/qcom/qcom_scm.c:334
in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 49, name: kworker/u16:2
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
locks held by kworker/u16:2/49: 4, last CPU#3:
 #0: ffff000000032140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x6b4/0x840
 #1: ffff800080563d90 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1fc/0x840
 #2: ffff00000036f938 (&dev->mutex){....}-{4:4}, at: __device_attach+0x3c/0x190
 #3: ffffa83e89fe4af0 (once_lock){....}-{3:3}, at: __do_once_start+0x2c/0x74
irq event stamp: 80794
hardirqs last  enabled at (80793): [<ffffa83e87faa600>] _raw_spin_unlock_irqrestore+0x6c/0x70
hardirqs last disabled at (80794): [<ffffa83e87fa9a6c>] _raw_spin_lock_irqsave+0x84/0x88
softirqs last  enabled at (80780): [<ffffa83e86ccc050>] handle_softirqs+0x5dc/0x5f4
softirqs last disabled at (80755): [<ffffa83e86c10700>] __do_softirq+0x14/0x20
CPU: 3 UID: 0 PID: 49 Comm: kworker/u16:2 Not tainted 7.2.0-rc6-next-20260805+ #13357 PREEMPT
Hardware name: Arduino UnoQ (DT)
Workqueue: events_unbound deferred_probe_work_func
Call trace:
 show_stack+0x18/0x24 (C)
 dump_stack_lvl+0x8c/0xcc
 dump_stack+0x18/0x24
 __might_resched+0x148/0x24c
 __might_sleep+0x48/0x7c
 qcom_scm_call+0x30/0xc0
 __qcom_scm_is_call_available+0x98/0x100
 qcom_scm_shm_bridge_enable+0x60/0xbc
 qcom_tzmem_enable+0xf8/0x118
 qcom_scm_probe+0x2d0/0x680
 platform_probe+0x5c/0x9c
 really_probe+0xbc/0x29c
 __driver_probe_device+0x16c/0x19c
 driver_probe_device+0xb8/0x118
 __device_attach_driver+0xb8/0x118
 bus_for_each_drv+0x88/0xe8
 __device_attach+0xa0/0x190
 device_initial_probe+0x50/0x54
 bus_probe_device+0x38/0xa8
 deferred_probe_work_func+0x8c/0xc8
 process_one_work+0x24c/0x840
 worker_thread+0x1bc/0x368
 kthread+0x134/0x140
 ret_from_fork+0x10/0x20

=============================
[ BUG: Invalid wait context ]
7.2.0-rc6-next-20260805+ #13357 Tainted: G        W
-----------------------------
kworker/u16:2/49 is trying to lock:
ffffa83e8a485e38 (qcom_scm_lock){....}-{4:4}, at: __scm_smc_do+0x70/0x488
other info that might help us debug this:
context-{5:5}
locks held by kworker/u16:2/49: 4, last CPU#3:
 #0: ffff000000032140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x6b4/0x840
 #1: ffff800080563d90 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1fc/0x840
 #2: ffff00000036f938 (&dev->mutex){....}-{4:4}, at: __device_attach+0x3c/0x190
 #3: ffffa83e89fe4af0 (once_lock){....}-{3:3}, at: __do_once_start+0x2c/0x74
stack backtrace:
CPU: 3 UID: 0 PID: 49 Comm: kworker/u16:2 Tainted: G        W           7.2.0-rc6-next-20260805+ #13357 PREEMPT
Tainted: [W]=WARN
Hardware name: Arduino UnoQ (DT)
Workqueue: events_unbound deferred_probe_work_func
Call trace:
 show_stack+0x18/0x24 (C)
 dump_stack_lvl+0x8c/0xcc
 dump_stack+0x18/0x24
 __lock_acquire+0x928/0x1f90
 lock_acquire+0x2b8/0x3ec
 __mutex_lock+0xbc/0x860
 mutex_lock_nested+0x24/0x30
 __scm_smc_do+0x70/0x488
 __scm_smc_call+0xd4/0x444
 qcom_scm_call+0x64/0xc0
 __qcom_scm_is_call_available+0x98/0x100
 qcom_scm_shm_bridge_enable+0x60/0xbc
 qcom_tzmem_enable+0xf8/0x118
 qcom_scm_probe+0x2d0/0x680
 platform_probe+0x5c/0x9c
 really_probe+0xbc/0x29c
 __driver_probe_device+0x16c/0x19c
 driver_probe_device+0xb8/0x118
 __device_attach_driver+0xb8/0x118
 bus_for_each_drv+0x88/0xe8
 __device_attach+0xa0/0x190
 device_initial_probe+0x50/0x54
 bus_probe_device+0x38/0xa8
 deferred_probe_work_func+0x8c/0xc8
 process_one_work+0x24c/0x840
 worker_thread+0x1bc/0x368
 kthread+0x134/0x140
 ret_from_fork+0x10/0x20
qcom_scm firmware:scm: qseecom: found qseecom with version 0x1402000
qcom_scm firmware:scm: qseecom: untested machine, skipping


> +	return result;
>  }
>  EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

