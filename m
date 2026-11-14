Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665944;
	b=16eWu9xRhjQgRfdT22OgS5+fGcU7LrpEUSWLIuhy43cAVhE9gCGbHYovWXNyPILaacS6
	 M2/GaSk8bcxjpshn2iokQIoqzwGPTtKQI7TxtKEpqL3YVCgEl5EukubvhbHB4OKvRR4Yr
	 4wtsODf8T/2uQB7dJ9OwTBkw/SQpiu3Vyh/ycdFWYUTHSIx6c/L7Ap0OMM6kVQdYYSP2M
	 qsuSo8pUNTTdIkwalVgqpZHjlZ+K/bK1BnyphOtmTuMb8zYsq5ri+JPDN1g9NbWmPSgsw
	 9KSHpGQFDEJNzN00Ey57j7vujSWypSbctAyCz5ghaR1zqNAri5cJ7Ah2PPu02ALKXBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=994O5G9ZxUQ8jqNBdTBnXMOuXg5Iwc5e9f/ldhdma60=;
	b=PnO8LHv1LIFUJLYRhrOeERtvgcf7ni30Q32o6CwvG4rt+vVRT0ZFXAOQuAGOsNoXR0HQ
	 58hMHDfaCutbg73yIzaYwL5De6H74Q7ZrFf1gS4aoayxoNHVyJHD0bv682HuzsIn6vSga
	 vd6ipLqLIA54ExDrC+LJSAzzUzjjoe92zK+6t+ygc8aXZYVdQ49e7FsihONfWJEpsFLnJ
	 rPCg+ytGaSKf6l1yonS+E3E7KCScDnz9KOfLgp0a7Aw6WgYxRExhOoYLpEVIbnAsurNLu
	 C4mwYC6D0uYocdMpIuhh84XWEfGMoUGkHr67VxNad9Gf+P7wxMRc0z6U3NNlILh10Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="U/UIVKlY";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D312D606A332
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 14:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D312D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U/UIVKlY
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3719e3cb82bso228723eec.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 06:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794665943; x=1795270743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=994O5G9ZxUQ8jqNBdTBnXMOuXg5Iwc5e9f/ldhdma60=;
        b=U/UIVKlYNtUJHaFeYSNk1Squ9DtUOMUNBXdocSmtTNj3Rh8h2BTlPE023tj183unzW
         6rk73stKj5FvDnaZsppNJ9tBZS7Gx8wAgNd0R7kTSE4yXgLBYi/4V8IZP1vINPyc0Ixk
         byUHLZUWhxbwe5kOoRV6Hh0Jon41ww9LO97285jbq0ZSNshA8tYyd7HNDyi1spBFf5x7
         c5XrIarqjsLqUU8nU7V5Xz26PL1+5FrLzjRD55NgdkwW3IgFGkVc8DTedWn9Vx66GYr8
         F96fSBLB9mekI/6Q7p6I3gzZCo/VgzyqGat0jF4onF4ELPVN2nuzwIn6YaNE9g+05VcD
         GiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794665943; x=1795270743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=994O5G9ZxUQ8jqNBdTBnXMOuXg5Iwc5e9f/ldhdma60=;
        b=y0y1H4FeePIWSub/1GAvHZwmV7S75nDq7jZi6hU5ll9rPMY1F3FZNv/5Rphk2g4bc0
         8Us5RUtPU+/2Fpb96+lKnnv6Om64+BG6Ginr4FLalGAzn+7y3dPWiABX9A/9aKZIhxfK
         6I4i2F4P17CurXC0fz5j03BZVE7z8N2j0QY8x3n46MgF4A2J4dJMk6kWwTYBrk5oNDvd
         M1SOeED55UUPJXQsOJv+rf6h90yb05EYYwlMAvmcL1eeVaEGdbqq3Gnm+VwU9N4zRiD/
         DPnEhvNUiEwy9HwwiKkNKypQLBohS9xmvXGAsSkB+tCWKmh/AiUCIe/LWl8+EQuV8g5A
         pO9g==
X-Forwarded-Encrypted: i=1; AL+hErFpaUvXXHOhyZa73ZCZcbxK8fTibr05LroRYQkNjQCc/ENTldjdlpsc2IF0Z4PsUoREC00H0nBk8btmXCfF@vger.kernel.org
X-Gm-Message-State: APuU4Z+enxu88pRsM05vbNHaKYF0BZQw2dQctBG3EUg8qH3BMVYE0jFL
	r9q0uODpX94+OQaktV3QVt5oba1w6btFinB6NbNQmfw+8ImsmAZsb74g
X-Gm-Gg: AYBFou2wwcuOclFiPBI3esb1x3EgBJg9f2W9Z6KAagqjyOlxGC6MJBIgLRmiqaXUKRv
	uNcja1Ec6Nu4SK7r0SEzumGQguy0FH1MdX2zTfpE5kJrcnzkvgryp52HT9zMyts0Gd08crmYRVz
	l+UmGOdJiEQuS3RM+RvMr+gVef/Xa628RMRZEZzgAX/+qeQn0r2xKATlX43TBvUlyRGKCkHu4uP
	ix5AZeY3jPnA1Pq9r8++8gONWpFPajry5yatleJ3WeAVocUEvBfBqc5LVMoCWGdL2OAacXi5lIY
	I0h0z9yLQx0UqSF6fVhbC/ZUyh2Ne3zVI2xN1YjlJaReXwhebHBMnqkE9ND6wk+VaGZQz+zSChj
	P7W717jZK1Pmnm3ERR+ai1vrZ/px53hwFR7K3VKrUyLQhOt0/djTnuRkD/rmP1cu4fFoBEx10jg
	r41x6EbTW6WaXrjnj3efNQAvzzGF53zaYkeFL+dkCafWjM1uPA+vcHL9o5FhbfDbkJMbxoKmd1P
	CsZo8s1stPCLfKpwnFo5EyCzmEIfHmjLWNVud2ShewU7swmEm/sPvmm1HjArs32ELCoLiZ1fPY6
	IlN4jCjTZmYy+hBTtwgSsxyz1fxvLz9tSUCQDBQrLqdlUeQw0syGgUqvfF4Al8xm9jlP8/LGD7l
	FQVw=
X-Received: by 2002:a05:7022:158e:b0:183:d275:cf76 with SMTP id a92af1059eb24-1b5030dcb27mr9272048c88.2.1794665942684;
        Sat, 14 Nov 2026 06:19:02 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm14745032c88.13.2026.11.14.06.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:19:02 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Julius Bairaktaris <julius@bairaktaris.de>,
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
Subject: [PATCH v3 0/3] drm/msm: Fix VM_BIND job, queue and entity lifetimes
Date: Sat, 14 Nov 2026 23:18:48 +0900
Message-ID: <20261114141851.134290-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
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

These fix what happens to VM_BIND jobs, queues and entities when the
file or a VM_BIND queue is closed while jobs are still pending.

Patch 1 makes a VM_BIND job that the scheduler kills before it runs
apply its queued unmaps before it drops the references that keep the
unmapped pages alive, release its BO pins, and mark the VM unusable,
as the VM no longer matches its pgtables. Patch 2 destroys the VM_BIND
entity when its queue is closed, instead of on the final put, which can
come after the VM's scheduler has been torn down. Patch 3 puts the
queue last when a job is freed, as the queue may hold the last
reference to the VM.

Changes in v3:
- Patch 1: only apply the queued ops of a job that the scheduler frees
  after killing it, once its dependencies and the previous job of its
  entity are done. The error path of msm_ioctl_vm_bind() frees the job
  right away, so v2 could apply its unmaps too early and out of order
  (Sashiko). That path is left as it is in mainline, and the title now
  says which jobs the patch is about.
- Patch 3: rebased on patch 1, title adjusted.

Changes in v2:
- New patch 1, for an issue that Sashiko reported on v1 patch 1, which
  that patch makes easier to hit.
- Patch 2: changelog refers to patch 1.

v2: https://lore.kernel.org/r/20261114081902.1669-1-arpe1618@gmail.com
v1: https://lore.kernel.org/r/20261114062541.2001-1-arpe1618@gmail.com

Jiwoo Kim (3):
  drm/msm: Release the pins and ops of a killed VM_BIND job
  drm/msm: Destroy the VM_BIND entity when its queue is closed
  drm/msm: Put the VM_BIND queue last when freeing a VM_BIND job

 drivers/gpu/drm/msm/msm_gem_vma.c     | 99 +++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_gpu.h         |  6 ++
 drivers/gpu/drm/msm/msm_submitqueue.c | 50 ++++++++++----
 3 files changed, 128 insertions(+), 27 deletions(-)


base-commit: 1e59855738454b14021b64115f0090eafc7526ae
-- 
2.43.0

