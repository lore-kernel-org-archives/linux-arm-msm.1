Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384384;
	b=TA18n1WeXjMixonEOsLdY8R1I/AoM8WydiyVxMKPO/wrYpaBmxW9pQASv24TG0Eofn0R
	 Ef/tWQ7bbZWCdATTjTzro32hgzf+lySXAVLfGf2UlbQCGZd4IetYsX5xCTXyzVcaOmTYU
	 MZjgyDXJXWibFYDIC8cQESQXWdoijP2SBU3hC/trksKrutQzfcMntggMzhiFvDmBr+cod
	 rBpuoPn4q5guMaAEOzfhn2I4bd87uvlF8dVPq4gqYC3wdv/EZzIO28vDO+tYtLscorm6e
	 lfA2C7OMetuLGD+2zy28VCA/MOYloPkFzpvUD4f8qABNqzJYzyHIDRduF03Zv6Hut1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3LLEGJE7y5aPT+HnIU6J6m7BGoZ7itZoJV528pdc6LI=;
	b=zdmpGUvSo911px5KWd+y2VC4qJ6ceFgspTFgFkLpF3iJGIVTLiJD9L95LEJy7dVGUM70
	 s/hSnJNLI0PljO4Ci+WxVqySO+P5u5eA+G9gfndgH+sx0SpHMfiIVIdPXVSJ7wi7a52/b
	 +zf6FvkuiV00mnSxGIVllsAz/Xpqr/dody/qUfbXlhI1fiIs9aCrnuQUyQh2J/E3qPcar
	 d2kO9WIYgrofmjwLLvTHN+4Lwt/dVdccrB4E46m44MOUJFgc9ak7cPvAT6bU1jlcjP01F
	 88Kug0dNiS7VtVbli5wSrOktWPiS3Hwk4MnRPftphVlC7WvMJnh8Qe3cSyEnVm5j2ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="XOr/XTuf";
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8B7606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC8B7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XOr/XTuf
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so3837385a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 00:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384382; x=1794989182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LLEGJE7y5aPT+HnIU6J6m7BGoZ7itZoJV528pdc6LI=;
        b=XOr/XTuf2hjhRt8gr0qA5ciW4P0vBeNtytOcrtNb5UFFdgaB/aPz/qPwoZPDgHmsbJ
         SbjWob8qSY4CZzSfyu3yKR33lNugUfqFVpJXb1jh5tuiHU8looKN2p85UFa4KLMl8Ihm
         YK/t1+bs9AJH0xg/0WtXIzWVE0vtrNCp0VlMtcsvzTJHDvgHAMa33lmloXgYMSnFxJ3u
         coqJfccvnYI6SGVWlbKM92w3O7aERbZgYYsX3lepw59CftBlb+nBZea2DBJwTuLkiY5F
         XSw5IM6AiPJex/ruOBZeOCgJUwSZ/gafsOjTfC1+t/jDJShhzzr8m2DUf1mJjjG+dzVD
         vynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384382; x=1794989182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LLEGJE7y5aPT+HnIU6J6m7BGoZ7itZoJV528pdc6LI=;
        b=JXm2eybPbmVfU0RdzT76+TxfMtIwXdr/IYNxdRCoCma5VBWQiKJwwTw+X2jBSemjqO
         XwF3bmkSO2n7qSG6jsk7tnQq9SJPSPksvOglLbSWNu05jnfZmMO8WhowLnF4MhxhBf7w
         jBGahat8msnhHlc7vRCYK5ALNajlpyVl37RpJDqGMRFUIU5XIvNLrZJ27SDDhJhkYdtH
         fPOzSxydRp9RLfL1GyOF2obYR5V75EnhnEOtvUw4NZQ3yNooWlMazLBAk8AvX0ZXhdex
         6msgvxlHgsY9uUn9owqDjqsszH2pzIRBz1mGjZYwS7ZlgmtoED00U5Ea+Kyq5TFVjSQW
         EKpw==
X-Forwarded-Encrypted: i=1; AL+hErE97YgdCxz6PngM98PRyfglEiIyz4zC9+BfOCCkL5JVz88mJk93KiW28abkqgxHrZcO/7auocCYRj4uuFBN@vger.kernel.org
X-Gm-Message-State: APuU4Z8Na32XiroppdEcT9BzNMynp7voETJvdpjwwjMoBP3hwSNUbVc4
	/qPg+OWW+1Ut1ySvxMdriBX1G2v5QNTB0pcdWON9ytoU1GQGDuXjelsOtUgjMFaxJg==
X-Gm-Gg: AYBFou0FxiIxZEeSw6EnRu8+QJE2XQNnUdWY3Vg1e9e1StvgUXZHK+2SJ1xamAOEym7
	9GeObdMSXWPG4OyTmeyra+0y4rMnE43f6VYzImJVKql3SEAccV2IaIhI2oSZ7GOtX5rTts2JdRZ
	nzFeGW3KpSTH+ASZdWrZ7WMfTX2XzLU9oRj6pCEVnStn7pDGbkDlwZC00t3FK15Ger5Q1qM9FJy
	FBZH9thAHWWLCji/57gi9ZePOykYDvj/h3oLiq9MZudvZcjOI9ILWOS/DmoavmrHpjehM8LbhNT
	x4Yj59d2M1C2SV4PQmEoAbHtF/q9XeAjQjGVCUE9x3Snf1Ks1jR9cIJXXaauw85Z0TFuKc8g3mA
	upcHEsufLgKjTbmo/sjRAUfMhs9aNG3eJKe3hMThaCEYzCyD8RQwHiLC7ms9SxBsPfQBpJrzzed
	bnzx49w1G/DchLF1zNFff4y7iP0Yg2z/YG8Ja7CHk3WGBWb9u0AefiJzOpycOfkkp240lGw6Zcm
	XVp3p/9KqsoE8Qu/MY7i3rUafQ6tYggvuSwA4crKof14hRNqRXwWWY4FuKsviGeQH4L9Z9AvvWr
	rum06tlZPIdrMClloUY2wnLWgmitCBOfnNAtsUAg9JInmnJwmv1bk1B9VVAyuJB7BZ95rj2yI5o
	4G2APLdOY4XhCCwtH4nRcxbV55fSzk2+2Z0GSctLBUMQKIsVuyZ9wpTnAPDAo8OBSKY9hdIs05J
	dZafrC4StzVsLl/SZzZQbkMRbCJ8hnWiSzXDwTjNJYurxfpoTUZ75T4++jDcevqnmmN4XrJzqkc
	umOptv5wK27GUa1Y5puwVIGRSOkAmKbjhnhYRxXgKlveWYSYe9pY6DAYm7qGCZ81PS/o4GlNh4/
	YZvaLmsblvGXvOasqeA=
X-Received: by 2002:a05:6402:a646:b0:6b1:8818:1090 with SMTP id 4fb4d7f45d1cf-6b7773f30d0mr845593a12.22.1794384381940;
        Wed, 11 Nov 2026 00:06:21 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75790875dsm2075683a12.34.2026.11.11.00.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:21 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: Keep objects of queued VM_BIND unmaps busy
Date: Wed, 11 Nov 2026 09:06:19 +0100
Message-ID: <20261111080619.244138-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

A VM_BIND UNMAP closes the VMA when the ioctl runs, but the pgtable
entries stay until the bind job runs vm_unmap_op(), and the job can wait
on a caller-supplied in-fence for as long as the caller likes. In that
window the unmapped object holds neither a pin nor the job fence:
vm_bind_job_pin_objects() and vm_bind_job_attach_fences() only cover the
objects named in the userspace ops, and an UNMAP op names none. The
shrinker then sees an idle object and purges or evicts it, and
put_iova_spaces() no longer finds the closed VMA, so the GPU keeps a
mapping of pages that are freed and reused. The unmap half of a remap
and a MAP that replaces a mapping take the same path.

Reserve a fence slot on the object when an UNMAP op is queued, and add
the job fence to it along with the fences of the mapped objects, so the
shrinker treats the object as busy until the job has run.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write this patch.

 drivers/gpu/drm/msm/msm_gem_vma.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 8b702422030af..d12df7e42fce8 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -473,7 +473,17 @@ struct op_arg {
 static int
 vm_op_enqueue(struct op_arg *arg, struct msm_vm_op _op)
 {
-	struct msm_vm_op *op = kmalloc_obj(*op);
+	struct msm_vm_op *op;
+
+	/* Slot for the job fence, see vm_bind_job_attach_fences(): */
+	if (_op.op == MSM_VM_OP_UNMAP && _op.obj) {
+		int ret = dma_resv_reserve_fences(_op.obj->resv, 1);
+
+		if (ret)
+			return ret;
+	}
+
+	op = kmalloc_obj(*op);
 	if (!op)
 		return -ENOMEM;
 
@@ -1419,6 +1429,8 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
 static void
 vm_bind_job_attach_fences(struct msm_vm_bind_job *job)
 {
+	struct msm_vm_op *op;
+
 	for (unsigned i = 0; i < job->nr_ops; i++) {
 		struct drm_gem_object *obj = job->ops[i].obj;
 
@@ -1428,6 +1440,17 @@ vm_bind_job_attach_fences(struct msm_vm_bind_job *job)
 		dma_resv_add_fence(obj->resv, job->fence,
 				   DMA_RESV_USAGE_KERNEL);
 	}
+
+	/*
+	 * The VMAs of unmapped objects are already closed, so the shrinker
+	 * no longer sees the mapping.  Keep the objects busy until the job
+	 * has removed it from the pgtables.
+	 */
+	list_for_each_entry(op, &job->vm_ops, node) {
+		if (op->op == MSM_VM_OP_UNMAP && op->obj)
+			dma_resv_add_fence(op->obj->resv, job->fence,
+					   DMA_RESV_USAGE_KERNEL);
+	}
 }
 
 int

base-commit: 1e59855738454b14021b64115f0090eafc7526ae
-- 
2.53.0

