Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670598;
	b=ZzNglk1ls9zEmCEnYWUKT7Kq+mM4ewmfew0Ecl6UBuzM3zuP2PibROq+ZLwbk0OlRKnc
	 oe6EWJdiAsvQ+ek1kCUs/t3vaOzCbYD0sCebw0StpW99wmjaQQObQE37qOXIshEAqNvA9
	 r/sMXzu/jMFq4rpjz117cYXLKIh1+LNqqDlwRiKA2m2i1r2kbIj17jO+T4ZiyJ6SKCH6W
	 n19CDB9KmnMxq20oE7ZlTNuiHOqpy8bFsXeHW8RKCWczTpen9WZCUsbCTPb+j6N9a0MEp
	 kwRc5Xh/TCm9K6rmNJXS/rdnYgxS2+c6PBgHxX7egIJYGB9jhfhYAaYNoKStc2mSRvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dcf1VprQ5tReiauPDZRL2T+Bt75/dPprqyKIItbhiW4=;
	b=MHnrGpXQ0D1m3/Z8maZgVgNWuGMNpptaZzF/deztzcgCVoW9vZwwGPjx6s6JMpL+x1Z5
	 eGpSMMGo2Q5a5zxga3oAxggCIJwe+xrqNYUL5gkpxeGO3vj5T8zlCW6aUPAeZRdWhdAxG
	 +BPhAyfABrT9l/uiuUbostl6xSIqKqaOLJORVdlwgFgISzEuybT8pKvX6DxbLVV39g76E
	 EFo8kfFMPKwuEThiq133Hp4yC1Hk0iq4tefGL5Zm39e9gitU6Lv8icwdxOx6pdqC3j7OQ
	 2Ap0JoiNW0RInjQqEUL4LdkIqy5l8AmxxLHu/+fJc3bvOZjpFFKgUxAcmU3BzoGjU2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLaBAw7w;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAC3606A32D
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AAC3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLaBAw7w
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36ecc11bd26so250092eec.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 07:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794670597; x=1795275397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcf1VprQ5tReiauPDZRL2T+Bt75/dPprqyKIItbhiW4=;
        b=kLaBAw7wyQvWZ1O6H9Z8EVRT4c99eFtSlk56PDSgX/V6PzrRUop9EQDiwhc82HP0Ro
         vZjCaqh3rTP6wYrvWhgrfd1ai4cSFfSfR0e6sPGVmiS+4OMduJvG/HxiCXWz9Ynwxty4
         eXB0yDpJR/j8cHEcV/ihE5tg2mMIDcso6aprXMWAhQGuS4FTxJvWCIeflnTdJ63ZhHNw
         KUgN5CTvm54ELruJCnCxb89I3myrjv/UoP91i5EWajaojOjSS1X8aryBt0VcXgWfsdnj
         yocOp9imlaUMah/UTOksDTx6uWjPD1ClSeF9qf4+8I8L3ALSaUM8Qwv2f5ulRnPcVybA
         BqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670597; x=1795275397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcf1VprQ5tReiauPDZRL2T+Bt75/dPprqyKIItbhiW4=;
        b=Qr4Ck/C0td6xniWntj5p9Z7g73upu5X07mRQA8VYtqqNCOqBLEdZaf6ElyXg2gFnI9
         RE8zZDB9X4v4TD3ND4vhyTu/5+Lyrbb+ZgbdI6Pjwn0KviwcsKfTM4QxswlECIDB5Wix
         osa6hK9mgwpROLEQ5kuqiLSgex5KXDfI2s2ptpevUxg8CYYQ60g9v0ychqPUgEvXQXYS
         OVo/uzT+iMxOsdpRdePlbWKHfLz81epIJnrfDRmhFdvpMTXiBREMIhxXZze8FY+GV24H
         hXychqNxQ2CfktUuGO052nMa7ONGDu7kxRg7MZRUYOgkqSbGK3veRbXXp9VU6rIvv5Ah
         MHag==
X-Forwarded-Encrypted: i=1; AL+hErHsoOP2mhPYhaoKRZ+UsjohiaPY3ItLyZFwJG8Ukdu6DUb+SbB0i07QWIVjvqLjZl0iKHBsjxAHonySeuNP@vger.kernel.org
X-Gm-Message-State: APuU4Z+vbk9vSkDAHQWXnQ+7jlhLT3hCGKu+poLsrZRSfMk05whQDoBN
	WG0oWp2ye5txUDOV8xAwYqx5iPXGLc8ZseACyifOjOcBDIJZdg3hZkbg
X-Gm-Gg: AYBFou3CT1E3RWvfFy2LZkWpk7gW5yZW7yKCFFvBxPRfx9W/BggIsr3esekshFbmvNV
	YttByY71oIkXKhh2anoNZrusiCvb3K5DuYQnR0dZdNPvQJD5HLkXcFDnYrZYlmx0O1Kuqp+cVJn
	GohJNpRNfmN/eH1pz4c2gx9VYK4eMHI0unE6YI03mIrunC1Vbi5BPmsHtogTTLx81PNJL2YKfij
	/YkLh3Iiy29O1zSG9nkd/KXOhKCR9W6ZEi7rUqB4Pc2/ALSc8VgcwGNOLl4jDi5RjXN/Pr4g/uT
	MInsH4+o0pAX7tz3BuLad4YLmUKDR7hS//40zcilx4dTm6ufoeWFXMEGb0hEE1Pe1UxVo6VkVZZ
	6T4AKqviI0zQ9ibyCu+HeXpFZsq87Bdiv05qujzRsu32M9BS+n2ba78QD+Wpf4/J1pbUks8k+sy
	cpCDAtP94ywwSjWYn8hd71zjrZmokNsAa6PIk4SaKZlkGbrX44giv2YeYnZmKcoPSBVwOPnNWnk
	DJMBFO+mlSxA/lHUkrhFp+Fv7QRGgbL28BasSU8nPLrogXa3rEdAQKWklm1Jol1uveUQnZfn8cy
	h5y8/1UZJ16ig/hM0Vnf6rxRWWqIE8/Th3TpssshMB65R8aBOCu6HkQ8ZPI1a6mL/FMXr7QHgMA
	QPGc=
X-Received: by 2002:a05:693c:20cd:10b0:36a:13fd:b5c with SMTP id 5a478bee46e88-379652f16f8mr8568423eec.2.1794670596552;
        Sat, 14 Nov 2026 07:36:36 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm17527126eec.0.2026.11.14.07.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:36:35 -0800 (PST)
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
Date: Sun, 15 Nov 2026 00:36:22 +0900
Message-ID: <20261114153622.148125-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACSVV02fCwbFXVjE+XHCo68xMxYUHovJ9ZHRYd98L74N1T14Hw@mail.gmail.com>
References: <CACSVV02fCwbFXVjE+XHCo68xMxYUHovJ9ZHRYd98L74N1T14Hw@mail.gmail.com>
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

On Sat, Nov 14, 2026 at 7:03 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> msm_gem_vm_close() waits on vm->last_fence which will be signaled
> after msm_vma_job_run() returns.

vm->last_fence only collects the fences of GEM_SUBMIT jobs, in
submit_attach_object_fences(). VM_BIND jobs don't add theirs, so
msm_gem_vm_close() waits for a VM_BIND job only if a submit depends
on it.

> My expectation is that if thread A is in midst of a VM_BIND ioctl,
> perhaps not having created/updated last_fence yet, while thread B is
> racing it closing the device fd, that file_operations::release will be
> called after thread A's ioctl call returns.  Is this not the case?

It is the case. (The vm_bind_closed check in patch 2 is only for
MSM_SUBMITQUEUE_CLOSE, which can race with a VM_BIND ioctl on the same
queue in another thread.)

The problem is a job that the ioctl has already pushed and that is
still waiting for its in-fence, e.g. one from another device or
drm_file, when the file is released:

- If the queue was closed with MSM_SUBMITQUEUE_CLOSE first,
  msm_submitqueue_close() no longer sees it, and nothing waits for the
  job. Otherwise drm_sched_entity_flush() waits at most
  MAX_WAIT_SCHED_ENTITY_Q_EMPTY for an exiting task, and kills the
  remaining jobs only on SIGKILL. Either way, the job's reference
  keeps the queue, and so the entity in it, alive.
- msm_gem_vm_close() then calls drm_sched_fini() on vm->sched, which
  frees the run queue that the entity still points to.
- When the in-fence signals, drm_sched_entity_wakeup(), which the
  scheduler registered on it, uses entity->rq->sched;
  drm_sched_entity_kill() leaves that callback in place. A killed job
  is freed then too, and the final put of the queue calls
  drm_sched_entity_destroy(), whose flush reads entity->rq->sched
  again.

Patch 2 destroys a VM_BIND queue's entity when the queue is closed,
by MSM_SUBMITQUEUE_CLOSE or on file close, so always before
msm_gem_vm_close() tears the scheduler down.

This comes from code review (see the note in the patches), and I have
not reproduced it.

v3 is at
https://lore.kernel.org/r/20261114141851.134290-1-arpe1618@gmail.com
and its patch 2 is unchanged from v2.

Separately, Sashiko's review of v3 found an ordering problem that
predates this series: the VM_BIND queues of a VM update the VM's VMAs
at ioctl time, but their pgtable updates are not ordered across
queues, so an unmap can reach the pgtables before the map it undoes.
That does not need a queue to be closed, but v3 patch 1 adds another
way to get there: the unmaps it applies when freeing a killed job are
not ordered against other queues either. (Its other point, that a
killed job's fence signals before those unmaps are applied, I'll
address in v4 as well.)

For v4 I would make a job that unmaps a VMA wait for the job that maps
it. The other way round, a map that overtakes an unmap of the same
range fails or gets undone, which breaks that VM but doesn't leave
freed pages mapped. Ordering all VM_BIND jobs of a VM would be
simpler, but turnip uses one VM_BIND queue per device plus one per
Vulkan queue. Would that be the right direction?

Thanks,
Jiwoo Kim
