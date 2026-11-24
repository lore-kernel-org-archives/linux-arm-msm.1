Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504149;
	b=ujHVoPnla1uvI5uuLSzh51Sb2MrWsBqXiubLtmnPMZe7jOnDUpIFt/RDR07HdwXWW6sQ
	 y3jVh9TP4ot5zdFOfOtfb0PX9K5rTt904q40X7kR3e3xpKEwJWsr1Z0TBqoqZE1g1Whlv
	 aJiaJte4jqK2BNrR6zCPK3a5oygmt4ALqqblzFCrrD+YICBcvLIGiohOPWWsDBbA9y4E1
	 UwF385U4ofG4fy3skozOXB9S5CFix7u6c7iffXr0H66J/KOUMgPz3qfRPdEATgwXXTRJb
	 Rxbw1WhaERsybZOCukmLsC1JLePMldTadhp98ZyE4e0EtOveP9/41/s3syOZst4P8XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6m/b+6EX5RsyAmAEcClGX0keL9p9C/iJZdE5iiUnz7Q=;
	b=XARlMGwPY6x1IWDdiUdDZ5Ix5RzqrGu44rs28Rr8OwFD8PzwmUXVJcvnZw3/poLQ/THy
	 cI+q7fM7VpP6ZU1POsH8cegWI2jvarnzxr0AlSjrbCQwkuQlDAq3qdr+mVAj+0gNnarOJ
	 0TtcuAEP4MCINKfr5m5qfS45Ot1W9bzIZuFFw1hjHm9CJQ23uVk6mL6Hb4IoPGPKk4qte
	 /F2l/MWTfb6tIoi+Y267R9hCLtM2Px3sy47NYX4WKy1JhzXRShhGN4Fo5N+zNfCbXZdLQ
	 DecWQjZ/N950iJuSXBN6kusEU3ME+jp9lGbkV0QStTT3742spN1NO9qssQxcgaSZVHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Es+jGl55;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3XoN3HP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD212606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD212606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Es+jGl55;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3XoN3HP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k0dW4128835
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6m/b+6EX5RsyAmAEcClGX0ke
	L9p9C/iJZdE5iiUnz7Q=; b=Es+jGl55u/Y+FucGIWCESP8ct6s3yNJ/zp/NNboH
	/sI0dDIgFmULXbq0SVrA/9vOUwXUqXiVJ9xz5iSPaCZR4f0btOjYplM9nzmqS5Jz
	JoXcfxLCyh3u/YqRu849pCTaBCzjLtN5qfOapRtDYw+VwlRic1NVXT8qSFq+AeeY
	FW/kZUAVB9To+OIR0fGF8DSo9w3aHa7wBVI8X44kolu9PS6V/LJI08DzOUGImLeC
	iL6GZlaAhLT7SMmVpkQi8cEvEUrm1bWgOF+FGhP06SfOc6Toco9UFd42Od+qmZWb
	D76cPA9Pq29B4lBJ3mwNjO9c91OKLc7IKqeRd2aWN0Bsaw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt1bdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:09:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869accaac2so2393136eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 23:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795504147; x=1796108947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6m/b+6EX5RsyAmAEcClGX0keL9p9C/iJZdE5iiUnz7Q=;
        b=A3XoN3HPD+kamuUaZGz4t1o36/CesDYq2jH2mAsTpKkM5cAsBJoXaIljmjEaAh7UdM
         eGertYYnBEyAjLsgSmRFGV9OAtN1I/4hsyqXPsfnJMiN5LuhFzk2KLtywCGTrk696IVR
         ipdD0nY87eaQVZLS/VIuGELxqWjHkRxbkEF2qDEIwrAT21y3akCs6KgfiwcklISFnAMm
         PW3E2eScofKVMQrel7l/0Ogf11B6fFJyRm5t+KR+uucb4P3+AW24GTVtcvZiuMg/iRRk
         O/LkDFOmlf6ytuj+xYYnS10P+rRHOQVSkfjjpUR96HTF+1aDs31XUkXKA5eeIcfwRjmk
         SHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504147; x=1796108947;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m/b+6EX5RsyAmAEcClGX0keL9p9C/iJZdE5iiUnz7Q=;
        b=fCf27YKqcsKoGgNyOiCxljW1WZeIM8fHGio+xuZVB/dyzAQvxpIeZDSWy28ZD9xhlA
         cKxOiy2vUOMS/1IwM1/aDYW2MsWQoOjwgTQ/PLdvZgA9/7msAHjqpeCg7vyKY9aRmf7i
         wFpAooctYHNUsIkYnp8BEhmYmiNAePoQ5S4kapa6fDZIM7k0DGR8IsdH6/2MqHRBg4z7
         lvVHmr7QfJwgcLjLaKi2LhDxzGaRpXsayL9Yy04MSfyYC2eH4ylpwRRWTvEgaYysEPUE
         V3lGhNkiDOkJPy0b4demK5xbZnoMEl2YY2ijhaItOAkUOextsEgRlhw/ZrZFH9RbJk/U
         r6tA==
X-Forwarded-Encrypted: i=1; AL+hErFlM28gtlUH5fx2v7MFtXIvIXQSwdLGI1f5WNgbNr8Ctk1f1gkJeWzMbZrLEvMqq6t40cqSiJWLUSqKUsnN@vger.kernel.org
X-Gm-Message-State: APuU4Z++1ROV4kUmsOhpMSoe2uMVEA4cwQMr+gJh9hC9JkZlzLe8QZrp
	H/sMzFc4bMOnUxJ5j+GTNzmNqaIMKLFwfVhKaOaFmiD+j8zxb0Goh/wrXua0SqHo4/SScsVKwaP
	xXAMALxVx4sJ/waFAgpbSeA1w9H0ird22a8hdZSBFH0SuqmtOHVM1YN0IPO2zhlaTLM8I
X-Gm-Gg: AZFdTZep4mie9XlMOBiZmeg2hvaJgk2s5/JaObPF7VEk3LB0+1c6kwWt/mIt1JinXgE
	c2Iztn8J25XW4MvzOC7RgnkYCy3NaqSf8dSzlQbNbATShGtfNVDs4tH8ekxpo9qRgBwgUGR8ojT
	0Z0y4f3KXQzLUro4+VwycUYR7ZD9+Bi8/4T/xL/H/On3vdCptXsXGG36NA0UXrRhDOjCmkYPgge
	8jYiYR23PpnNCfEiRMYYPprtNQTVNMFW3qNWs8jzDDY3Cb/Y6iF7fP8hxP6YCbt11v6s2zLaYoG
	5R29vTo5+Vwg1NhHQKMXBHfe4KpdAMYgYLsI8yBwRYiMpeqPcp1aldPJ9gSCx7sp2l1nQ64xyOq
	dtPqmAt/VaOqntonh6CwYeX4LZNVPdV9IUEdbxq1Qgjh1PZJMip0bfIwpQAPX7wjbASUZgvUaq1
	iiUsCEUxzZYFjCiyQCFym61YQ=
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7abb with SMTP id 5a478bee46e88-3860bd889c6mr13390008eec.11.1795504146915;
        Mon, 23 Nov 2026 23:09:06 -0800 (PST)
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7abb with SMTP id 5a478bee46e88-3860bd889c6mr13389985eec.11.1795504146344;
        Mon, 23 Nov 2026 23:09:06 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm148263eec.17.2026.11.23.23.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:09:05 -0800 (PST)
Date: Mon, 23 Nov 2026 23:09:03 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>,
        Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jack Pham <jack.pham@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH v2] iommu: Hold group references across bus_iommu_probe()
Message-ID: <awU4DyS7irT1a-nu@hu-petche-lv.qualcomm.com>
References: <20261112110747.1903321-1-peter.chen@oss.qualcomm.com>
 <179520803625.1164516.5819106673711321760.b4-review@b4>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179520803625.1164516.5819106673711321760.b4-review@b4>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyOCBTYWx0ZWRfXz2TlgtWs9UPe
 mDOPlS7aMLZfd7IFsrL/w16iLYOltJDi8u0l31KwPlF50vf6oPiqIDaHlune8NOvdkpQ1Da4rjW
 ywi0fo+78JLAOcxwesOTbo/Tfkl7vBs=
X-Proofpoint-GUID: EdksBEp07WZH2rXzJCxChUFoI4Qx9qbx
X-Proofpoint-ORIG-GUID: EdksBEp07WZH2rXzJCxChUFoI4Qx9qbx
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b053813 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Es69j4hciQkVgYzS4lQA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyOCBTYWx0ZWRfX23JIBY1uxtKk
 E29K2sFB/1lmU8+U9owVOnX4EalVkXVqyLz+aNnOVQz3mJMb/q9q6YwDYTfD9rPCNIeXbhH0UGM
 JzJQyQJgtMwXUb1QjKj/xuXxqqBe7NaGnnw0bGiPObPxL69MGd/1dLeoRr+lPzGiH72nSOcRGLF
 xR+g8kGJ9ZA/V4IVlqUojziYLq1kt/gAlPviKTbSd45H3WuOogJwBKzWWYqzfJDObFbwisn+wHp
 rL7UMqvMFVd4NKjxRwfVcySqxEbmgzFn3QyqvFv/5SCXir7Yl+R6EB8pTTExHOQE5fpKjSrESwr
 OjGmrYSR5RIYDvxJxSlwh0Sq3hxRnaH/nZzf3wZ/x/8+iVuHeVgRCEiGNcaW/pN+pQQ0vG5Ou91
 AXxyICZ65iKr82j3D+kHv/f87mhZG6P4b5gdpbjs0lmDzgdA6FxL+iOUVzgY5wZRqniItPemHOv
 JiA8zHg4PAMP+e+Ey5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240028

On 26-11-20 16:53:56, Jason Gunthorpe wrote:
> > [ ... 9 lines skipped ... ]
> > This is the "iommu_bus_notifier() being triggered during
> > bus_iommu_probe()" case that commit da33e87bd2bf ("iommu: Handle yet
> > another race around registration") left open. The sequence is:
> > 
> >   CPU0 (driver's of_platform_populate / of_platform_depopulate() path)
> >   CPU1 (arm_smmu_device_probe() -> iommu_device_register())
> > 
> >   CPU0                                CPU1
> >   of_platform_device_create(T)
> >                                       bus_iommu_probe()
> >                                         __iommu_probe_device(T)
> >                                           allocates group X,
> >                                           queues X on group_list
> >   platform_device_unregister(T)
> >     iommu_bus_notifier()
> >       __iommu_group_remove_device(T)
> >         iommu_group_put(X) -> kfree(X)
> >                                         list_del_init(&X->entry)
> >                                           <- use-after-free
> 
> This seems odd, like shouldn't something outside the iommu subsystem
> be serializing these two things? If some driver is calling
> of_platform_device_create() and racing it with
> platform_device_unregister() it is broken, IMHO.
> 
> Can you explain more how this arises in the first place?


Hi Jason,

Thanks for reviewing.

It is not one driver racing create against unregister. It is the usual
glue/core pattern: the parent populates the child, and if the child is
not bound (due to IOMMU is not ready at this case) yet, it depopulates
and retries later. That runs at the same time as an unrelated IOMMU
instance registering.

We hit it on a Qualcomm SoC (Android 6.18 kernel), with a DT like this:

	usb@a600000 {				/* glue */
		compatible = "qcom,...";
		...
		usb@a600000 {			/* dwc3 core */
			compatible = "snps,dwc3";
			iommus = <&apps_smmu 0x40 0x0>;
		};
	};

The glue driver does what upstream dwc3-imx8mp.c does in
dwc3_imx8mp_probe():

	of_platform_populate(node, NULL, NULL, dev);
	pdev = of_find_device_by_node(dwc3_np);
	dwc = platform_get_drvdata(pdev);
	if (!dwc) {
		/* core probe deferred, e.g. its SMMU is not there yet */
		ret = -EPROBE_DEFER;
		goto depopulate;	/* -> platform_device_unregister() */
	}

The dwc3 core probe defers because apps_smmu has not registered yet,
so the glue depopulates the child. Meanwhile the SMMU driver probes
from the deferred probe work and calls iommu_device_register():

  glue (kworker)                         SMMU probe (deferred_probe_work)
  --------------                         --------------------------------
  of_platform_populate()
    device_add(T)  /* dwc3 core */
    T's probe -> -EPROBE_DEFER
                                         iommu_device_register()
                                           bus_iommu_probe(platform)
                                             __iommu_probe_device(T)
                                               dma_configure replay finds
                                               the SMMU, allocates group G,
                                               adds G to group_list
  platform_get_drvdata(T) == NULL
  of_platform_depopulate()
    platform_device_unregister(T)
      BUS_NOTIFY_REMOVED_DEVICE
        iommu_release_device(T)
          last ref on G dropped, G freed
                                             list_for_each_entry_safe(G...)
                                               mutex_lock(&G->mutex) <- UAF

The two sides only share the platform bus. Neither driver knows about
the other, so I don't see a lock outside the IOMMU core that could
order them. The glue does not know the SMMU is in the middle of
registering, and the SMMU driver has no relationship to the USB
device. Device add/remove can happen at any time while
bus_for_each_dev() runs, and that is why the core has
iommu_bus_notifier(). Commit da33e87bd2bf already handles this
notifier running during bus_iommu_probe(). This patch closes the
remaining hole, where a group on the on-stack list loses its last
device and gets freed.

I will put this real-world scenario into the commit message for v3.

> 
> > @@ -1951,6 +1955,18 @@ static void iommu_group_do_probe_finalize(struct device *dev)
> >  		ops->probe_finalize(dev);
> >  }
> >  
> > +static void iommu_group_list_put(struct list_head *group_list)
> > +{
> > +	struct iommu_group *group, *next;
> > +
> > +	list_for_each_entry_safe(group, next, group_list, entry) {
> > +		mutex_lock(&group->mutex);
> > +		list_del_init(&group->entry);
> > +		mutex_unlock(&group->mutex);
> > +		iommu_group_put(group);
> 
> What is the mutex for? The group_list is a stack head so what are we
> protecting list del against?
> 

Yes, the list head is on the stack, but group->entry is in the
shared group. "Is group->entry empty" is the de-dup flag that
__iommu_probe_device() tests and sets under group->mutex:

	if (list_empty(&group->entry))
		list_add_tail(&group->entry, group_list);

bus_iommu_probe() can run concurrently for different IOMMU instances,
since only the per-device probe is serialised by
iommu_probe_device_lock. So the unlink and re-init is done under
group->mutex to make it atomic with respect to that check-and-add,
the same as the existing loop in bus_iommu_probe().

It is only on the error path, the cost is little, so I'd prefer to
keep it. If you think that concurrency can't happen in practice,
I'm fine dropping it in v3.

-- 

Thanks,
Peter Chen
