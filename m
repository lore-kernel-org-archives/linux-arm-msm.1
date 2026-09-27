Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204B93B71A1
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 17:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790529233; cv=pass; b=chg2+NzMco94D1l0l6wgOYtx1Z3a5DDmEF8lzokTY6Rv5e/+KU+M3JBStd1YfszGlzFLjxfysvPKhsdKi2xMX+0lJ00dS8Vr6qFSBSjCXDOtWDUsqttNUU38EK88QQIzymzquo02lwhTjDdL19L5RjYGICtAkMEyMHeh2UrzSJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790529233; c=relaxed/simple;
	bh=qhpeV6xC393HUUEe3bBoDSZ+AUrlQUeME4qIGHFCF2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/MikQy+RYdglHQWX6IuEyLtUOIDd6eA/6vuLeWGs/pIbnw6YmccxWqGSQud0WN16E5l9ZpxSigrEViE2wP40H4jdDGkd+y+Q8XN1yIJxQ9GJcmW90zcMtVNJy2BFtIe6iSOIpmNNHBPvyefoYskzPq7YLOuiERtoXXoKq+fzFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLyDTyic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3IVc+Mm; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLyDTyic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3IVc+Mm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68R1JRII1475150
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 17:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VB3Pq/tX2cY81/H0fpS3ys8Gxm8NGlgIcdjzVRBuiEo=; b=WLyDTyic/e7d1S4p
	teiHEFWbEdelZHTmpBvFNeUM2WcWX/PTsRbb2mnkeZIK7ZoTrQsZpKlsgFgv+UC/
	Cm96VL7uCQBY6kB8mLSZTX4zvkZc1fDeaFjz7nJk2+fTc17BJXwIhWvzw5yB8e8W
	oE4lVcHINm0zKqYfwCMfZ+sV44fee6lEhp5cZ44BQWGyFDLG+V3jIUPyIPEOcTJm
	WcT+vSJc50LM1feCWNsbcUwWHY3fQVL8JL9K9uy48b0A8UuWIiB9HE0ifkK4fLF9
	AUZEs79GB4USOOc6mhHsrcJ6BBna7MHdavdGrNc8yZ9TnK4iLJUGE/B9h8yjgvmE
	vC886g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx693beej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 17:13:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a8e3cc28e6so1961986137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 10:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790529230; cv=none;
        d=google.com; s=arc-20260327;
        b=CR/zoYPWg8Bq0TE/O5kJ/u/NARIma7MvITccZUwu1S1W0ZodmyYtE6CFwfBxQn9FzQ
         UlaQwnea2ShYBkDUuDr+cNIwxtFV1e8FFQU0rV++GCqTAj5fNQbcqhZxRoAhnyNnyOG4
         ZsXetv+w7jexKksL/kpHU8Hioc+a1/oidpbO/BnBjx6orXHaeYj/aWYsa0EpSycXdxzY
         9D5zSIi6pKyqRDV5Hiej4wDFpddyvt+Vaylp7ITHdO+6ihXAj3kVzgU85Q27RmFe9Saf
         eifQfbIcOhmA0PS31UwBvCZeaIkJDpGIqNtkBpnSzelOElYra3OA73BS62l5jDkKC21n
         CWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VB3Pq/tX2cY81/H0fpS3ys8Gxm8NGlgIcdjzVRBuiEo=;
        fh=fGCSNsr3QF1PTEtN0sMA9aEUi/J3eS/BZAojI8+jmTA=;
        b=C/Q/PQU9Gh79FletNiOpF1/47v2Y8B6APcATKHbw46NbT9ySzmacWc8zcXja1xEUoj
         NcuLwWsPBcobNcPJeXBanMmWjNAlZRrAbutBHcBjw3kKVoRkkno7gBmPAI2/F9f8QqPF
         Tf3SRGgt585xEMKzrucBU8kVc9lQ9/X2zYhuUJYtiOCrLBDWDLdiiFBT44EFM6p+7p6H
         /kU/gLQAmagmOU+9d8QnpNQFmyRJ5g47c/EYNbwIlaIqSlhwjj7VvvuuiAW5jmvKvOCL
         tu+zDXWUVLUB67Nnk6hYwxh4lMqhSEfN3Kci7UkXwKoH3uNVhHRGm7wjc79RIonCjvsf
         oPtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790529230; x=1791134030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VB3Pq/tX2cY81/H0fpS3ys8Gxm8NGlgIcdjzVRBuiEo=;
        b=N3IVc+MmJwXQ/LJiVaDuskd4h2UIuFKxfYPNdojpmNtTQRcmds8nxka1oteD0UWPfz
         ZZE6FtIi/kGwWVcepwUD9jq/PW8333Tp5U2BK3+Xi1mwzNMupnwsqGqMzjdpeU2OCxDz
         fJadiEjfr0ZRx0OAHfYFdXCMrUkEJ8GK5IbGbQdg7wv22vEnONtdj9LG7mtaHiMdduMN
         gIWF+tNTlkSOqwNplDLmKMu2WOsI7wp1RPuhYslFMZNmjAA08wh1WnUCayogzDvFQ1xW
         zjXXrIm6bmW0zuPaLMwXtymF5bZrakBZuGjwDRmwP2rrDKPeGKKMpsqn2Bao4k/QO4lE
         dutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790529230; x=1791134030;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VB3Pq/tX2cY81/H0fpS3ys8Gxm8NGlgIcdjzVRBuiEo=;
        b=2XNl8w12ryg/kzzOYu81AoVGV+kZNeBkeO4W8q93xhRBGKNrK9KHdp387JDVKFqze5
         +Jlp1AEZBZCh8UT6To3tPuU0YJqbzfLCpcQsjnlNvXJyoGP2ULHOTPmsCHYpTy/9o0/j
         aAlyyLpyD9Y3JSMKYD2HOhqUdwfa8BnCnhKtyIlQFECXPZWSuE6PiSq53CFlZYWm3k0T
         q14GVKIPElMrKafrBdfEZ4H9jzDfiww3CzJJE9az9xA8cOj0d2xlqGONxNHKB7QQKiYN
         MamXd+LACVUdzKOTTKjoMxDS8oJpOncB4UXG8N/zZCpx9vS1wrB5irbI1TrhoCCWXo+r
         AAwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhsHbxfr5fp6PjwLtM13SE4kbdlOXNNMwReyMvlnSGQ++pf7pccmCl1T5PCjfUs/oDaGG0Nhp1divol2Yt@vger.kernel.org
X-Gm-Message-State: AFq9FYLWSZJJyedqHYUZH7v8qKpzR/aoG1xj4Q6DtRDrPPLxnEascfcJ
	6FYS6VkmeELnZFKppHjNO7pMFLTFRnLmhaTxs1gs5QqBePQ7uhRNSncptcxA/47PDN6HQKgNK7o
	alj8vDTqmTM4vrf9RatRsTm3ygG5anlCOH+DnbHzafuq7MsTsSYl+NZipb3njZ7KfAvm2IqBrnV
	6AK9ppYLEtp7T1ajBii9jVEcD5amVweVHEzWAP4E/AAD0=
X-Gm-Gg: AYBFou2QxglY2Lbo27A/2V0s8HIbmdA+oYduOV2L2zgj4/Ug553WJyv5aTSMGdObDDM
	byGz1tCoryW6UU+icoMgxKzuy90wlcN2B3VJGgs2jJPTaj+q3Qu4N3W5sOc1krrG4+Akh0a6yom
	SNKoO/q23YQpvkRb9hegQswGLEWuN1lchh23rnuFpF8Ft4GuS0NuTQ3iylppQ=
X-Received: by 2002:a05:6102:3f47:b0:798:24e8:23f4 with SMTP id ada2fe7eead31-7af1cfa46e2mr3316281137.7.1790529230245;
        Sun, 27 Sep 2026 10:13:50 -0700 (PDT)
X-Received: by 2002:a05:6102:3f47:b0:798:24e8:23f4 with SMTP id
 ada2fe7eead31-7af1cfa46e2mr3316275137.7.1790529229806; Sun, 27 Sep 2026
 10:13:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806051915.2234481-1-pravinku@quicinc.com>
 <CAPd7Qn3QYyrzBFFjB4+M9Je7uykYgxHiM+vh-mNVJ16QaoPkJA@mail.gmail.com> <2140e7f2-d329-4726-b593-72e935fca4f4@amd.com>
In-Reply-To: <2140e7f2-d329-4726-b593-72e935fca4f4@amd.com>
From: Pravin Kumar Ravi <pravin.ravi@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 10:13:37 -0700
X-Gm-Features: AclHuK8PwoThA0mV-kKOw3eDm5hmBFXr8MOx4tYGbb0EL6wStiYs_DNf1J_IlbI
Message-ID: <CAPd7Qn3ecF7+TBp4xDUoukVaDCjLjcDjVg+BndhqPN89i=4dUQ@mail.gmail.com>
Subject: Re: [RFC] Synx: A global synchronization framework
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-accel@vger.kernel.org, sumit.semwal@linaro.org,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        konrad.dybcio@oss.qualcomm.com, faith@gfxstrand.net, simona@ffwll.ch,
        simona.vetter@ffwll.ch, airlied@gmail.com, matthew.brost@intel.com,
        srinivasan.shanmugam@amd.com, rob.clark@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA2OCBTYWx0ZWRfXz+dcoh5jrH0+
 aeuUlPo6/GcJ+L0CM4O85p+ImrAfDsehKwrPKwWf5disEKXwlcbX6u5YDS2HvDLyAgq+OSq6Jnu
 gdKbs0qRTs+ggBX4GncgZNx6WFwIb2E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA2OCBTYWx0ZWRfX/C1Xqk7GX77z
 EP9L80Y07DLKrtJkG2uT8vfeW3E01iD1mR7mjQF0QsJLVHtjkDVr5enNg+gtz5AswN7mjGqsuKh
 rBhz/s14H5DIypTt3ZwlqcM95e167277H1lz5KXHvQ9C8zSXzQjCkVNtqsQU3tjLKRUYrfoDvjG
 Rcwv43L4TJvyZOOqD34L2/LF6PTqWCMKgORS/UcaxN/djrLcUCWRMI+IhQVPXkDx5aXnaesm/PV
 1H+qehzMQaaThqzP81F2+m9IwShJk7VovwM6nR3yFkCnYuM8LHlK6E39nJSuIeyGze660zOSUpZ
 0qIdLis2EniOsHtc4vgjN6Wdq6LsrKFkdRANcvkdD5d+u6IiPwI19HiiDUVCxuIRCbJmPzTPuze
 hzWZZSHGNiShex3YhlYAcnySZu+6EKVI9GGNrx9DJz4QvMPQ7Yvy/gg6Ju46EM9jPMUYaKWED6n
 Ca/qyxSlbMteGY6bhdg==
X-Proofpoint-GUID: 2urN0OOv2mxQF6KtC7iYGMffiuLQv54L
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6ab94ecf cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=zd2uoN0lAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=X73fn1zfpKsA7NX-Z3gA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 2urN0OOv2mxQF6KtC7iYGMffiuLQv54L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270068

On Tue, Aug 25, 2026 at 5:13=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Hi Ravi,
>
> Essentially you can have two different modes of operation:
>
> 1. Preallocate resources on work submission to the HW. This is what the d=
ma_fence framework implements.
>
> The restriction here is that you don't have any dependency to userspace o=
r other device drivers, e.g. no page faulting, waiting for memory values et=
c...
>
> Background is that the core memory management depends so hard on the exec=
ution properties of the dma_fence that none of those advanced features are =
possible without breaking core assumptions.
>
> Inter device operation is only allowed if the device drivers "know" about=
 each other, for example between rendering and displaying pipelines.
>
> But we have intentionally rejected any approach of generalizing device to=
 device signaling in a framework because it makes dma_fence practically a r=
ecipe for trouble and we have more than enough evidence to confirm this now=
.
>
>
> 2. On demand resource allocation using PCIe functionalities like IOMMUv2/=
ATC/ATS/PRI or device specific page fault handling.
>
> The point is that you can do things like generating commands on the fly, =
long running jobs, device to device signaling etc...
>
> The only restriction is that you can't create a dma_fence with this as ou=
tput, you can only consume them as input to the operation.
>
> There was also an absolutely great presentation on the topic from Faith o=
n LPC a few years ago.
>
> Regards,
> Christian.
>

Christian and I discussed offline whether a fixed, kernel-controlled
pipeline could support this safely. The contracts and enforcement remain
open, and input from others working on these use cases would be welcome.

Mode 1 (preallocated): The kernel must guarantee completion or safe
termination so resources can be reclaimed when subsystems stop making
progress. Arbitrary cross-device dependencies can break that guarantee.
We discussed restricting the allowed pipelines as one possible approach,
but still need to figure out how to enforce the dependencies and recover
resources when a stage hangs.

Mode 2 (on-demand): Standalone signaling is fine but very few accelerators
fall under this category.


(Bringing Rob's September 27 reply from the parallel thread
CACSVV00oBPN=3Drw1yVBjNm2TMHuQ+3iv84jKP4djQcnKRxcvWCQ@mail.gmail.com/)
Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> So I'm just starting to think a bit about this, since it will be
> potentially relevant when we implement fwsched for adreno..
>
> Do we really need anything more than some sort of dma_fence signaling
> extension?  Ie. signaling on the CPU remains exactly the same as
> today, anything waiting on the CPU would see no change.  But if both
> exporter and importer support the same extension, that can be used to
> extract extra information to pass to fw.
>
> The fw might observe the fence getting signaled with lower latency,
> but that's fine, there isn't really any guarantee (other than timeline
> ordering) about the order that multiple waiters observe that the fence
> is signaled.  We've just pushed one of the waiters down to firmware,
> that is all.  Ie. something like
>
>    rcu_read_lock();
>    if (fence->ops->signaling_ext &&
> do_I_understand_this(fence->ops->signaling_ext)) {
>       fence->ops->get_magic_signaling_foo(fence, &magic);
>       ... pass magic to fw ...
>    } else {
>       ... same as before ...
>    }
>    rcu_read_unlock();
>
> If either the importer or exporter don't understand the same signaling
> extension, everything works as before.  For ex, external eGPU/dGPU
> sharing with say the on-chip ISP.  But if both do support it, the
> signaling extension provides a way to extract whatever magic thing is
> needed to do the wait in fw.
>
> BR,
> -R
>

Hi Rob,
For operations that already satisfy the dma_fence completion contract,
this looks worth exploring.

Christian, does this fit the case you described about known drivers,
provided the participating drivers preserve the resource-lifetime
and recovery guarantees?

Rob, could we have the shared signaling mechanism in an independent
and generic synx_global.c layer? dma-fence can tap into this
layer for the signaling extension you mentioned.

The reason for keeping this layer independent is that we have clients
who use reusable synx objects (signal same handle multiple times)
which don't interop with dma-fence. And we continue to get more feature
requirements from performance-critical clients around reusable objects
with timelines. Assuming this is where global synchronization is headed,
these clients should be able to tap into reusability via a route other than
dma-fence.

For existing dma-fence operations, your extension could expose the
information firmware needs for its wait, preserving CPU signaling
and the fallback you described. Other clients could use the synx
global layer under a separately defined resource-management contract.
Would such layering address your use case while also supporting
clients that need reusable remote synchronization?

Thanks,
Pravin
