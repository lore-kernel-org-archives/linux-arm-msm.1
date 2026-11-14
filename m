Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794674445;
	b=MZLdAyTFe8ShQenpBDnWOJXN/zNFOEe3nr1ZxblJcvSS8YHiL6cp0sCkkzk0rOHuGzkq
	 8D3Rhgp9yREcD/Vn4kv6smumLsF/doWaERQYUknf2WH86vLelCEv0pSpQ+uVj4cNO2+wW
	 o/lOOJxdybhl9g2V2WSk7SC9bvk60qnaMUcpk3BSTEMy+ZEzrZVOb8tQ9xm8FYiI4S3GJ
	 xAnfaVI32Znz1lQhiuwUtXXU5couAqCbjzV6fufguY9/SMpch/EJ1VWPfc6r8Xg+n17VD
	 y/3JvMLItUAjWfzUotJNqC1MzIzxZAg0hCaqoUYNpO1jssXDZFxuqss9C7hSJO24KZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674445;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bXkHJphoEY20da+45qB+WjPGBGb3UoQAwSXHDIUPxh4=;
	b=Eu7Eho+20Ly/vBmeEheBPcrSi6Zu26tIDtiZOQaVVYKvOs9m0YdGRmM9WWbHcEQzVJZY
	 lN8nnhg7CxTVyjbdUV+tjg0kRbGe1FdMibgCcKj3y5dhhO6tJ4fHcVdYAcDEEcnyrN03n
	 EQcZn3L3ntO4XX2uCJHUCM5bPY6AFgB6E5rAntNsPxAQ5glpKR7c02xUgn4e1wUXBLTVC
	 s4/zpgWp5OICrM51Tg+1TSOmQsNmqdj7IUL4t4VWaXZmyhf6bgA+nzJLcwDPhB4zBiH7J
	 GgvQjcumgcVj4W0AMkKCuzIWzROzBOaQaUPDuyuBVylP79B0pfGSeVhFfNANyZbM1Rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpYXnSkd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEyKBndF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB9F606A329
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 16:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB9F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpYXnSkd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEyKBndF
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkLPL1556292
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 16:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=bXkHJphoEY20da+45qB+WjPGBGb3UoQAwSXHDIUPxh4=; b=fp
	YXnSkdnG4BA4y8XDLRl8x2Co9x2NAPivGl8Owm4IYNiITvILAgSN3/MakeeFTb51
	oQ8ysc9yiMQMzZ6pOGm6khvyUOxdnIydruCt5uqV4NQvj3bpmKyr+kOnzdaUlXKB
	hevt+FA4bZxt2sFFHBKSpKAMO1WBHi30sU/FjKa0QRmwba52oYXcestA+zmoVJft
	Yym1C5/qt8+wUAa/sTnxPbYtcn4CE8g9YUD0UZo6STZrnIOTbUaR5h4Z7ev67KyG
	3CA7GXlrMqCtC3IE49B4siNKjkxkxF1tIYcUo3ePvlp92/FNIZAg6xKIAOZmIsjV
	NCZGFDSvrVLBR78lAFWA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8s65w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 16:40:43 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-86285932977so2804018a34.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:40:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794674443; cv=none;
        d=google.com; s=arc-20260327;
        b=pvNypFwBu+lGiSpgHuuB0r6T4DM8cUSVhXE2Z87j6HOULTwIl748qxHXIW0HB/Cy4w
         pjLPSw8Wtm6wiosnF6q+6sOydJiOL1d0VvF27EGA3Dw7MLZmcrQf6hTiNlBr2E6KvAN4
         /BCtZ1Y6DgBoa231ydARiiGfRwj6ipzi4441Evc2tbAUubC+gkIJn/e0F1Af5D12Iq3t
         Tpz9/aTup+1uN+yVf3zP+d1CUSBZ0jMHai4FeRnvNd5BfOboNMfVWoltAj1g7rFHWf+n
         lsFjH/w4kEKzJ9CEnLW6fkcynetUwNwTRgAHhChUXRVzhVthbJ5nyNsdxGG6CrGCwncT
         WN8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=bXkHJphoEY20da+45qB+WjPGBGb3UoQAwSXHDIUPxh4=;
        fh=Vj2TRir2I+40y+a0xWvPsK+irKBZFDREEmMlevo+1S8=;
        b=ma1IYSGYRZ2AjqknJYBxaQxBiRT17OdUoOlFJlCHxNB0ra7JbCpR2VBO8geVlnStGi
         uMND+I+jLulSnAJ+/MouZ/SXkcgCUQPUmq46/uooGE+MwKTazQcMW1LzF1j5RTzGQUo/
         CnZSf3NE6aBA+2OeB97LxLmfheroyFdwdqXbP1UbGreWLVS95aoqQaY2TvzBscQmbxUV
         96Cim3eCTa0/S2bQWaaULnZRvWMzTupoZYx31SKCiJ9Uivjo9UqkKspRaxNF4KUJZUuW
         +UpESCbyBpXFTRE5wkSBNIm1Ca1uvlJEV1JEzSv8mxeYer0LKAFwM4N3YjshIxrC9Hbz
         uFmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794674443; x=1795279243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bXkHJphoEY20da+45qB+WjPGBGb3UoQAwSXHDIUPxh4=;
        b=PEyKBndFsBRy6cE+pH6wvUPpxLuqOFsAMgUnt6zROwdejjuihiLQYeOlCBoLvqUiHI
         NLrND11V6vM9gjVqZMMrelLjeLmYj1wDFK1X2Ldq0nQ2xT96OQRxjbGywolczIHnudsG
         gmFL+d4iKq1E6nJUbFVW5VRqr841KnY3HZNv7OAtqswQvjb3aE0bqGVngXb2nbyl0Bp0
         TkzLqPI8j0OdDrkDWZfYOm+6gF4C0YC25rElTQE8HWIUck6KdnJEh8KQvUqn10jntAH6
         MlFC7E7/nJQw7wYZxz0PYlY7XVboE5D1FkuogrYeCywEDFY8VSN910NjT0FFbUuLGWJP
         WYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674443; x=1795279243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXkHJphoEY20da+45qB+WjPGBGb3UoQAwSXHDIUPxh4=;
        b=pB+twotfUa5z1GFmxeVk0ezbq0QVddIXjSU6nS1g6BLSPOa8YO0XTn416pzxsiuaF6
         2Rz8h3M5o55lV0kRA12CnHeJtnG7wg95cA5yfOBrUxwhWTTqieJdGVIfQp7Qf2vPlMZs
         bsdKe60JgP4RL58IRyp4/lG4wec0nbzaF3H2kXjmxozi6O/GivZSjSAuhljszG9lQxWn
         d8tJEPvRdjFtCcS2NLG6gpdLGz4FW3GuXk095GZ+NiQ3/0t5e/nzgv18XRMPChx30L94
         yOmy343BNkOT+WMCsHVu4esaMnTxuB7Xxp5IcR5LFP/Pd2zm/QoZV7ZsjEyf3p6M7pux
         qhjA==
X-Forwarded-Encrypted: i=1; AL+hErHz0ej+FK72zPWLQcodGwHs5PT9apntWdWnZ9pv4eUePjLcltyYm9k5R9Y3RF58FubwdRoOLP03N5empRAx@vger.kernel.org
X-Gm-Message-State: APuU4Z/JKypnjC1TQeShs9yDAs5BVFvUZXWfPOXi99d2GOEjBPENW2Ck
	rqxmM4Y09zUUbb4xBQN9Q4bXd4x4SgsyVz5VBI6QsUcQrQu23hqD9fGCM5KZ1ZVpPG+UlM/O2g0
	7iUIF/RAdvaDQlQHijNaoV+hPDr6J9tqEPLqlvKv5P4oYRjruUCN/YTA8f/Wh7dIyLtzFGB+v3/
	vXGdRwNWUOVx8qe89JDa6F128QTIDvp3Td8HEwUUpgmWg=
X-Gm-Gg: AYBFou1hwvDBhnTHMVJKr6oPtlYdze31yoQ8zzDQSKhDw6GfKhNCZNXdk6++fuPxkMx
	wk03dnYxs64F18x+lx2+Gvu3wHHet20rRBDCHken2cZnb7UlJzyiWtH4Hs+adELnSkOJQBtUk3D
	twhd29OZVDczOuxAFxw/+/j9jQttxha0A693aWXsHK6GaC+/VM6OnLN9lX4PMy0wYg2bzGELP0i
	HC8QaEASKoDX/48/RMFLQ==
X-Received: by 2002:a05:6820:1394:b0:715:453:c6e2 with SMTP id 006d021491bc7-71ab4fbfbebmr3860143eaf.33.1794674443092;
        Sat, 14 Nov 2026 08:40:43 -0800 (PST)
X-Received: by 2002:a05:6820:1394:b0:715:453:c6e2 with SMTP id
 006d021491bc7-71ab4fbfbebmr3860118eaf.33.1794674442621; Sat, 14 Nov 2026
 08:40:42 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CACSVV02fCwbFXVjE+XHCo68xMxYUHovJ9ZHRYd98L74N1T14Hw@mail.gmail.com>
 <20261114153622.148125-1-arpe1618@gmail.com>
In-Reply-To: <20261114153622.148125-1-arpe1618@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 08:40:31 -0800
X-Gm-Features: AclHuK8v6yocAMov5_kcb3jEgrVHdGlRUdiYk4AGEpFJ8mzDlgn5asj4NprUyOQ
Message-ID: <CACSVV00ZppfBKwsHJ+NBYBB7a2f3g1O=6J4Gt1m_A74fudZQoQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/msm: Fix VM_BIND job, queue and entity lifetimes
To: Jiwoo Kim <arpe1618@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af88f0b cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=2g9MNY1Fx1-Z8oZBzW0A:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2NiBTYWx0ZWRfX3MFd+H0Z7FPj
 /5kKFwtqmBW31VmDpr8/k1Pxc42skyucyxpzp9x5TliVa6kpozzH7wnEu2DOo8n3u8tgnscOEiW
 Ha4nDxEPGQn3XYG6V7AJbkA08uwgfPg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2NiBTYWx0ZWRfXy/QDAyuQMnZ3
 7EXQHjOR7r1BcwF0/YIN1xjdIp9IaTNlbzg2uW16JB/jJY/+s3DKm6JxJhhuQetzpD5EkHQZH06
 hj3s3VI+6F3Dtk6lZfJGuafDYp1K7If7oFzzVRMJP89Z1jAKUkbToP4z/ND5uQMWMqDaf9Fz8E/
 sCilb41brcgbAZQZC2vBclhiwrNTQ8AnP8eI+s/spiW3EmgthpQWXJkiTZJkmrJ1jXpzspxyWM5
 t8pCyfdMy9tvLdtZjMe5GytWAq5oTl9PWgHNV9tuLVdjVxFS73hYTmqRDhR6sZ4iXZv0IlPtXx6
 qU9aY/0uwXRwIvy5fHpbrPpg0ZM9AdSm+snq6uDSxq3ZU0uJ1MjW8PnTn0qBzNobx6ZFxSTPANL
 3BHVWGq6WYafeBIlSOXOhnt5zjnWsrDyuHVSvINTMm0waVtupy7hZaIwv5BSRgnn9sDnxv8lpW1
 yBADjHEbsiV7CPMlR2g==
X-Proofpoint-ORIG-GUID: qjaR3VjhkRsk00IoQFSGeZ5cN2NaABfb
X-Proofpoint-GUID: qjaR3VjhkRsk00IoQFSGeZ5cN2NaABfb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140066

On Sat, Nov 14, 2026 at 7:36=E2=80=AFAM Jiwoo Kim <arpe1618@gmail.com> wrot=
e:
>
> On Sat, Nov 14, 2026 at 7:03 AM Rob Clark <rob.clark@oss.qualcomm.com> wr=
ote:
> > msm_gem_vm_close() waits on vm->last_fence which will be signaled
> > after msm_vma_job_run() returns.
>
> vm->last_fence only collects the fences of GEM_SUBMIT jobs, in
> submit_attach_object_fences(). VM_BIND jobs don't add theirs, so
> msm_gem_vm_close() waits for a VM_BIND job only if a submit depends
> on it.

Oh, right.  We should probably just update last_fence for VM_BIND in
the same way.  (Ie. using dma_fence_unwrap_merge() to deal with the
case that the current last_fence is on a different timeline.)  I
overlooked that.

> > My expectation is that if thread A is in midst of a VM_BIND ioctl,
> > perhaps not having created/updated last_fence yet, while thread B is
> > racing it closing the device fd, that file_operations::release will be
> > called after thread A's ioctl call returns.  Is this not the case?
>
> It is the case. (The vm_bind_closed check in patch 2 is only for
> MSM_SUBMITQUEUE_CLOSE, which can race with a VM_BIND ioctl on the same
> queue in another thread.)
>
> The problem is a job that the ioctl has already pushed and that is
> still waiting for its in-fence, e.g. one from another device or
> drm_file, when the file is released:
>
> - If the queue was closed with MSM_SUBMITQUEUE_CLOSE first,
>   msm_submitqueue_close() no longer sees it, and nothing waits for the
>   job. Otherwise drm_sched_entity_flush() waits at most
>   MAX_WAIT_SCHED_ENTITY_Q_EMPTY for an exiting task, and kills the
>   remaining jobs only on SIGKILL. Either way, the job's reference
>   keeps the queue, and so the entity in it, alive.
> - msm_gem_vm_close() then calls drm_sched_fini() on vm->sched, which
>   frees the run queue that the entity still points to.
> - When the in-fence signals, drm_sched_entity_wakeup(), which the
>   scheduler registered on it, uses entity->rq->sched;
>   drm_sched_entity_kill() leaves that callback in place. A killed job
>   is freed then too, and the final put of the queue calls
>   drm_sched_entity_destroy(), whose flush reads entity->rq->sched
>   again.

I think if last_fence is also accounting for VM_BIND jobs, this should
ensure that all VM_BIND jobs are also finished.

> Patch 2 destroys a VM_BIND queue's entity when the queue is closed,
> by MSM_SUBMITQUEUE_CLOSE or on file close, so always before
> msm_gem_vm_close() tears the scheduler down.
>
> This comes from code review (see the note in the patches), and I have
> not reproduced it.
>
> v3 is at
> https://lore.kernel.org/r/20261114141851.134290-1-arpe1618@gmail.com
> and its patch 2 is unchanged from v2.
>
> Separately, Sashiko's review of v3 found an ordering problem that
> predates this series: the VM_BIND queues of a VM update the VM's VMAs
> at ioctl time, but their pgtable updates are not ordered across
> queues, so an unmap can reach the pgtables before the map it undoes.
> That does not need a queue to be closed, but v3 patch 1 adds another
> way to get there: the unmaps it applies when freeing a killed job are
> not ordered against other queues either. (Its other point, that a
> killed job's fence signals before those unmaps are applied, I'll
> address in v4 as well.)

Yes, userspace must use fences/syncobjs to synchronize VM_BINDs if it
is using multiple VM_BIND queues with overlapping updates.  An error
would mark the vm unuseable, and the kernel will stop accepting
SUBMITs and VM_BINDs.  But maybe we should also handle errors in the
UNMAP path as well, as that also indicates that userspace is doing
something wrong?

Userspace shouldn't be allowed to cause the kernel to do something bad
(use-after-free, freeing pages that are still mapped, etc).  But it is
perfectly fine to let userspace shoot its own foot, for example
triggering an SMMU fault due to pages unmapped while the GPU is still
accessing them.

BR,
-R

> For v4 I would make a job that unmaps a VMA wait for the job that maps
> it. The other way round, a map that overtakes an unmap of the same
> range fails or gets undone, which breaks that VM but doesn't leave
> freed pages mapped. Ordering all VM_BIND jobs of a VM would be
> simpler, but turnip uses one VM_BIND queue per device plus one per
> Vulkan queue. Would that be the right direction?
>
> Thanks,
> Jiwoo Kim
