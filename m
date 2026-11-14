Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644354;
	b=FRGE9mQBhtF83nHo45t54T/H/Zijl8Uhuc3HPzgKJaTF6jzNfYOYwX3PuWbHBjaCzQCn
	 dvVj7HldQotuif/f3M1kQeR9UFNERG7dKV3Sa0LZf6EdSxcuTBPieype8VLXX3Xbv28Yq
	 dbPe7Uya3Qv1jdx3k0eXMsxe6lD8vzF8ssQKLQb3J3gzCoy8oC/VulD5aF2XH9LhSLEN+
	 jwvLiC/gPtrB33qVK7bLwBjlfhMq/4UswZ4DzYKpnbsoE1BB1/G1hUL0rMQPalMbsLHdr
	 czDnfKFCZWuwOCG1ljaZBLears5nCxj+7o3kr2sdTNyLKyevpAFOPn6CR9ECz9B/X3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pyx07GG+cQ7r4tHVzwwWnT6ylPidCzpSMdub9ploOvw=;
	b=KFRAMa8giQxlbT/QdU0fTycNtYZNqiViEcbIBU8yaavCVSl1gEhAEjlBvnz4tlAbx/tH
	 2/6ObuGW97DG3gRee6C5bU+MRexOSI8MKE8znoiLBEto0wjnjlygjndFn9MrInTEpb0qO
	 5QIlQEAruXGNChnzYfxlv2sUbslep3rulXvBiR/8otK4nyiDwdE5q1lOezjS2RY+JtJuC
	 La+0t+V1SpJSqsugWc8/4XV99zjsPKJOgBVpFWkvOCZ8slRTwGbRHhuOwtcHoKV1qSsbs
	 DqMoJzfdD50AP5dB1HO7fd+xbie/ueG3ohfDU+WrDwhgXSDXZ6xOK4U3EVLXs5J1OCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aSrq/QuJ";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA8606A327
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87AA8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aSrq/QuJ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e2b1db9bfso202940eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 00:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794644354; x=1795249154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pyx07GG+cQ7r4tHVzwwWnT6ylPidCzpSMdub9ploOvw=;
        b=aSrq/QuJ4Cupok7CN67Na0nW7sMjYue8p431hqYgT0HK11ejjJ4f5VH06C57XJmqFS
         wgyCW3GLkthJFxM0pjzRWR2EevJMOcIu4GlLNLOPvC0M4NcXUBoUQ0OAkjUD1Zsy7AI+
         P5OHmLOu32LXdmNgSU3WXDHv9rsv+pdk5UTeQuBkkVm/aHzjyMuQlN8BGEbqYOXPVNsR
         86fGOQ62s8fDmzE256a2/DonL69m15pJ0ggww4TbYpod+h57UGT4cPU2YjN+j36GYhHd
         V6AKOzmoYONuaUywHzmcxE220kLbyWKGFimE3yOeC6ToJPLDXWSOWH140FojDc3Xl190
         UjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644354; x=1795249154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pyx07GG+cQ7r4tHVzwwWnT6ylPidCzpSMdub9ploOvw=;
        b=o953LT/f3IVbQTFe3sPckxQf+izNGaokiDyIAvDf6X+9uXdJsDf8eve1fhWtcCJkWi
         W2RzBvkMdfYeqS0AypbDLuyUFQZWtBYOn96dSdBTIt9s/+hfgz5bkxxJkqRRfUFO+9wF
         2WISULyhk9IAg9cUf82Lq0oHe5M3j11z23l9p5KW7M8hY14dtbh//+T0og+pziAV5m2q
         Ex3lISDFLlAIm0YwLgWZftACqOUvwE2JndPbQ+m1jgQikFLJEPtRt33edZWUihK7fKiI
         l6HqDH/UESUt8QvXgQGfrYSCHWPFZGttT8Vu/9Fn/dZEQlTMcYQw+hD7bur0wdMUJH/w
         71cA==
X-Forwarded-Encrypted: i=1; AL+hErH8QUM8kxV1YMxpewBMqOqbFET9qOp5XlTYh9EYg4Sx+RvK9Jp1x3FbLLCrLQGFhi9PT5LyzlIlcYZJ6Dof@vger.kernel.org
X-Gm-Message-State: APuU4Z8/1BTDyHpnXdxGkN7Onkw8PC9to9NgYi72Hv4wr3sfqBcS35cj
	4VnzOi37Gef6XRCDOYY2vPcY0tOUlkIyLdp+7TwExbxgHHMblrRJQCyZL0hrUREjOv0=
X-Gm-Gg: AYBFou3Trl0HKGqXktM6O8Y3Cv6cQlOfwVLwosLCSkLlvD8BhPhHqoipJeDZBVBCqUW
	agqeLnToQl8V8JpTjbP76JFO6VyTRkYmCEYL6DaNYQJeQNv8l/ciBaEHkqmCkQyO63a6PEh/LgK
	sk7KtjyeDJeIPbO1buDgFPtVXmwBN3IawuyfjJIuWSJiLVWPJO22CTwq5Q/zAPrfAvAM6KnA4e/
	/cE7bGHJWOpTTajLeE4FfjDxP3KBr6xaNb6NTU2/sS59JtuJxq43yDWB/0mPGiiu6WYmmim4KAQ
	a4h4cmBcSps0q3PCVcJSbOQdxqIUCxKj/oSFDyTJDARw9/hpXTT3KilGekIVLGX4cnwpFc3QE89
	pI4EM/xjCn70u1XfSrHUavnngAqSdQWQEYRQ6PDRzde5j/Z3OcIkCMZByteSpFPfud0byUIpU8j
	GMZzTcHYK5LePDzBb3L7eC86J1uSGbsApPhahNzM5Fo6vB3OMHfDICA6ITRKLSA9DZjZzNMqWMF
	a5B55ZhUlzs3jZ/UTCIKUk0hYHYYHLao6pE64+qBo8/9CxI3eV0HOVAn23ANR8Pye0W2liuo0t/
	FAYPassAwtegH1Mdd8GEK8XDgpUqrnAn6K/ABMDRWs6Fdyv2CxnAdVu6q2nwVGfVgo+ZMYQFvpb
	7r2R9CVVxYSdJjCCj7sETucuu
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr8926328eec.1.1794644353569;
        Sat, 14 Nov 2026 00:19:13 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm14008333eec.3.2026.11.14.00.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:19:13 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Antonino Maniscalco <antomani103@gmail.com>,
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
Subject: [PATCH v2 0/3] drm/msm: Fix VM_BIND job, queue and entity lifetimes
Date: Sat, 14 Nov 2026 17:18:59 +0900
Message-ID: <20261114081902.1669-1-arpe1618@gmail.com>
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

Patch 1 makes a VM_BIND job that is freed without having run apply its
queued unmaps before it drops the references that keep the unmapped
pages alive, release its BO pins, and mark the VM unusable, as the VM
no longer matches its pgtables. Patch 2 destroys the VM_BIND entity
when its queue is closed, instead of on the final put, which can come
after the VM's scheduler has been torn down. Patch 3 puts the queue
last in msm_vma_job_free(), as the queue may hold the last reference to
the VM.

Changes in v2:
- New patch 1, for an issue that Sashiko reported on v1 patch 1, which
  that patch makes easier to hit.
- Patch 2: changelog refers to patch 1.

v1: https://lore.kernel.org/r/20261114062541.2001-1-arpe1618@gmail.com

Jiwoo Kim (3):
  drm/msm: Release the pins and ops of a VM_BIND job that never ran
  drm/msm: Destroy the VM_BIND entity when its queue is closed
  drm/msm: Put the VM_BIND queue last in msm_vma_job_free()

 drivers/gpu/drm/msm/msm_gem_vma.c     | 77 +++++++++++++++++++++------
 drivers/gpu/drm/msm/msm_gpu.h         |  6 +++
 drivers/gpu/drm/msm/msm_submitqueue.c | 50 ++++++++++++-----
 3 files changed, 102 insertions(+), 31 deletions(-)


base-commit: 1e59855738454b14021b64115f0090eafc7526ae
-- 
2.43.0

