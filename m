Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676684;
	b=4d4DRG5xPn4YaFA6LFI0OoQvfagXrxb/eisDzw2im7sa2tVlaanSPMEnqPyERhT6SVEO
	 D2iuYE5YcgxE/+A7GLRwnMflJqwa81Hxcg9x63DWw2215x4drEIM8bleiBsDwg4YkLdxy
	 LEh9cxkvtGbv3wSqczM+8AOK5syKw5cPMV5e+nhknFw7VP7u4b7LeUe8Xwip5ZyNpkMti
	 PEi+oW7YfZgXJYF4Lwx0Hn32vqYREK50o5/D72ZHd5hsQ1kgSrbeawd7oBJoq0z1rcFLy
	 2vJK3ku3jO77NQPbNl9QLco/VN+6dW3Nm34vRiZR+JYwPIqw42PcezPr+jbgQG3yV2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4oitWDULEpM5/hVJgOh4m6V8xx8F+2jtGn7i+dhJCug=;
	b=pwm8cnp/dws8z1nWqoH8v/kRorsz4aGBUvJ5LcJurRzse6rzpFnP1npAz4eTji5j/BBy
	 ZOhqLOhJuB1WKiqHpoXSn7RS78Sbo77a+bpwqRUWerbF3Gt926NZj/pUNWRlwJ+Dbthxw
	 v5t/jQIXjlFLGpy5Mqs/YgRKFIBh2KfZPf3cpD9PM4tO0GUuKWkjTHWAr5U6P30RdIK2/
	 oqIhHvSUFeNUj+1ggwhyZqEgCYJP646vEYJ603HoUQXtL0Z0rqIALhkPtTrlUcFKGtGXS
	 evbf3CJ/cWz1YUMV9pmIgRn3/tSlOileST5LwQ/mu2tqj4EZHBPNTDWY64/md/P9Rjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2k+eOVc;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0FA606A32E
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 17:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA0FA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2k+eOVc
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3719e3cb82bso238975eec.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 09:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676683; x=1795281483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4oitWDULEpM5/hVJgOh4m6V8xx8F+2jtGn7i+dhJCug=;
        b=x2k+eOVcWWpWa41soCkeaG6S026AO2WsFJYKuEs7HgWebL5NSNXyC31aGYhAU7LPE8
         /r/YsukGwxg3tZRhDFsq8FBJaHXWB2U/bLBfAoFL3bz4JhkM0RSZtPK+u69RlNovgttj
         JexaM4FsV13GVIOZ/qs2llY0e7q4dvIneCAvCAo+p9k4ppCo16MDykba4uKdOrVBnZXP
         fgCo2737+LnJX26/EMqrMJwgm0+JxI9u3/mMFEo5KYXebYniNWHU+RDspke34o8GNl5L
         r0/OmtxgwoK2CA90ZfD61JjiUX3nuuVmlPXZVmlgNGuLh9uewlm72rjjodNoeuT/ji/Q
         Chlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676683; x=1795281483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4oitWDULEpM5/hVJgOh4m6V8xx8F+2jtGn7i+dhJCug=;
        b=k2b3B03I8n3eGJVXEwa67m2zLtYxmwX1+cd9ZgdMMhtjbxRsZ+de3lNmPy/RDakOj9
         YGdGvwuNZmzFfk36A/OucOnJLtP9BfXH7vdmOd0Rs5PnqK7gtJdorj1gy0HLqQduBB1h
         TPfFdwVpbneFF3xkclFCLy4zKLtQmbK/+zjKADYDlVMWyYAJLQQ5z3BtvcdJO2jO0V/b
         SmQXH5V7SCZgeRi8dgjTmP0ehf1XPeqWc0zL1FLXnzsCQncjeRW8IzOHygt44L2ZB7Cd
         x2Y/y82UKCh1gsdVH9KaLVuZ74rkFVzIEKFKEy5tLSdUyfyo0CPLxQgYh23MSAdCC3lh
         dCLg==
X-Forwarded-Encrypted: i=1; AL+hErFTwhnhO/GcqlzSOKtW3fAh8rqDywo7oBxNYzglLIfoZfD0J+QzOr2Y42vVTg3Z5Ni1CCOK6IzJZrkj7zWr@vger.kernel.org
X-Gm-Message-State: APuU4Z86u7cViA+afon1pXTzcEDKejkqlL3rUqRc/DdetOnOfoFnpKcw
	48SkxyWXQFOWNjfcYwdDLC0AGDxcB67ZJaD93IinX14Vh6anlVgOZxqe
X-Gm-Gg: AYBFou21PEUjP1W4abW1jGo0YrTFjHCr+RzDYtYcMAaGwbO9OmuVJVeo73xozVmLprG
	rr/HO06I+euGOyAwxay/PKkgItCrgriQ/crhKtv/PH2IuGNex3NRMGPKb/8FuH/MAuEieSTLutV
	5sUOWka2hhMF8ulistBiZN6id1WXDNDu12B+YbIB2P6BE6Do+XZsq1Bs7devw+r4f6Pb7LIKnRq
	UXg0f1vzOv70rST1pRfVF8CXRa/jkDaof+pd/mw5gCWGiJv1X0XXKkvENpCv2Pbln8Dtur7TfuN
	zasDhSPBi4njWccenEYxXs4mY61KFJsDKiTJOAbyTzauQxEk5wKOPF3tooWnS9SwgcQGsz2+sC+
	o4vTk5aihSYQNLJXik4+G6H4iieLUBGcZS0WqLmMchTxug2iJGHDeNv+P1KD3N4aVyuSCz600/x
	kHw+uRpQk4FsUmAb4fpE5y8egSykCAZpWOrETlZv9FhFPatpwJ9eY67ipS6+XWbrJJ5rQ0dS2U2
	ge3Lc5BcBuAZ4SuLEN4FyuPb2qEXr+llEW7JzFCxPh99DnuctbovdN81QHR6hkRNZdNX+o8A42g
	QVU+NubzYKH9iaWuSs+aA28jGPu/BAGfbn88e4dr1P7Aip840tkSsc5YSG00qaZIARDGOIB/MUL
	kZXo=
X-Received: by 2002:a05:7300:c00e:20b0:35e:d21c:f33e with SMTP id 5a478bee46e88-379651ecb3emr9803831eec.1.1794676682696;
        Sat, 14 Nov 2026 09:18:02 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm19492548eec.28.2026.11.14.09.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:18:02 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm/msm: Fix VM_BIND job, queue and entity lifetimes
Date: Sun, 15 Nov 2026 02:17:52 +0900
Message-ID: <20261114171752.972-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACSVV00ZppfBKwsHJ+NBYBB7a2f3g1O=6J4Gt1m_A74fudZQoQ@mail.gmail.com>
References: <CACSVV00ZppfBKwsHJ+NBYBB7a2f3g1O=6J4Gt1m_A74fudZQoQ@mail.gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Nov 14, 2026 at 8:40 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> Oh, right.  We should probably just update last_fence for VM_BIND in
> the same way.  (Ie. using dma_fence_unwrap_merge() to deal with the
> case that the current last_fence is on a different timeline.)  I
> overlooked that.

Will do in v4.

> I think if last_fence is also accounting for VM_BIND jobs, this should
> ensure that all VM_BIND jobs are also finished.

It covers their fences, but not the free of a killed job:
drm_sched_entity_kill_jobs_work() signals the finished fence and only
then calls free_job(), which can drop the last reference to the queue
after msm_gem_vm_close() has torn the scheduler down.
msm_submitqueue_destroy() then calls drm_sched_entity_destroy(), whose
flush reads entity->rq->sched from the run queue that drm_sched_fini()
freed. Jobs that ran are freed before drm_sched_fini(), by the
scheduler or in drm_sched_stop(). So I'd keep patch 2 on top of the
last_fence change.

> Yes, userspace must use fences/syncobjs to synchronize VM_BINDs if it
> is using multiple VM_BIND queues with overlapping updates.  An error
> would mark the vm unuseable, and the kernel will stop accepting
> SUBMITs and VM_BINDs.  But maybe we should also handle errors in the
> UNMAP path as well, as that also indicates that userspace is doing
> something wrong?

Yes, I'll do that, but it only catches an unmap that finds part of its
range unmapped, not one that runs while the range still holds the PTEs
of an older mapping, e.g. one whose own unmap is still queued on a
third queue. The early unmap then succeeds. If the map runs next,
before the third queue's unmap, its PTEs belong to no VMA, so nothing
keeps the BO alive for them until that unmap removes them, and none of
the three ops fails.

So instead of making unmaps wait for maps, in v4 I'd also track
whether the map of a VMA has been applied, and mark the VM unusable
when its unmap runs first. The jobs of a VM run one at a time on
vm->sched, but v3 patch 1 applies the unmaps of a killed job from the
kill worker, and msm_vma_job_run() reads vm->unusable before taking
mmu_lock, so a map waiting for the lock would still be applied. The
check has to move under the lock, and the flag has to be set before
the unmap path drops the lock.

This is all from reading the code; I haven't reproduced it.

Thanks,
Jiwoo Kim
