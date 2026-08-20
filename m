Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961FC44AB80
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787233474; cv=none; b=La8WfQwHXyrkvWC4yinTExJU1dUs7T9RGu/lrP1k+Zkrg/9P5Bmo+hFbsTjtSBNEVAC2gKAHDLDBtraFNljHouJHMKrQyoFY9VLVs8BFLX3AVafzfcG1MIJE6ynbBXI0na7Bib1TqcMB1x9Wqbh0BJZElmapFPLbaTN2o7Axkzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787233474; c=relaxed/simple;
	bh=V/MT0h4y0UuCq9bmmF639GPbx8+zDtKLwl4uzqXwhWE=;
	h=From:To:Cc:Subject:Message-ID:Date:MIME-Version:Content-Type; b=EhId7cIWEBs2/aiNKPJPXoRgcXftzRswBEhtdkiEY96RvdUhpc1H39LEorhLFo9mHETqJQwU85Z6odVlC6+NtIK3dDmXHJDsTY+2ruSN6uekcugM8+5dXEJChr34+LbiMYO9lgORwBozNbwK9jwRYBoARfyOObyyppIs1MUX4YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com; spf=pass smtp.mailfrom=ferrisoft.com; dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b=nlNbIg39; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b="nlNbIg39"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a36982a875so3583414a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferrisoft-com.20251104.gappssmtp.com; s=20251104; t=1787233471; x=1787838271; darn=vger.kernel.org;
        h=content-type:mime-version:date:message-id:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gpygo29h7AxRRVUfGlZ5f0maeaHqpMwX6cqMH9s1eBE=;
        b=nlNbIg39pd6AcznSogqeh/5yV1HpdMokV1szy2nFXgwCpjMgBF8gdTHjHIoQXd0RsZ
         nfO1cXiL0UHLZozXdw54uwYRImi05zUXLYAX/pQKEAeWnxkKh+erQp1aUCgbVD/PJFQL
         TQ8zWBws74pbzzSr388uZTq/0Jg4McD8+upTYgcS/j0t7qMkpoIRStj5dw7SFy3RvNTj
         Sn+r39V90mhsIK0qhlIZAC5+clSZncDdI1uKgowXM4Vyd4UB8ghYkohN4TzaYEV9BFxk
         xxb8+NMcoou4oqteZWovv9AEx3MueMsXr/v5aI5XSGYedjc5HZVb9Zxu/YPt5i9JjXOv
         YaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787233471; x=1787838271;
        h=content-type:mime-version:date:message-id:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gpygo29h7AxRRVUfGlZ5f0maeaHqpMwX6cqMH9s1eBE=;
        b=hq1itFSeKKKktycdH6dRKzWQ6DoV6/Rx0kNiIAdDuQBuQsDxjp4SaI5xayqulyZjZv
         gtyj3oFCoXYE/exGmhIcazPvhEzb+/lx5YOWyO9izuumMv+aHupBPXX4BhmFjwoqY7f+
         QDq7XP6x0CVBRXAR2qB0ot0bym/6hEjXmkMv/chm/5pP5JxEzyGzqTxO6Of5X2Ps5u+q
         MmF45UnPX3A4qK75Ljhuu0NGIG/wY0X4JuFs6H32dEWD0bT/6EMXr0O5U192Xium7X8x
         PlIFi6tnYHo8wlCg7zZ3OPVDWBE/H4kpAExTXxpPkoZq9NhnvIVDl89ePN4OUVM+Uwfn
         lqfg==
X-Gm-Message-State: AFuF++lhn1Y8B3NTxGZqyAUGSpvCOxbLou8Bl2V7xFFXPX7kbDMWHRz5
	SRIjx0ZsdYL4jAvhdIe3rAzxah9Jv2CmjdtvKoickjZl5olYMHMDzx+QqC89Nb0H2+xTmgKXYTH
	0T8q5qx3cY2f6Yg==
X-Gm-Gg: AR+sD12P3Sl3IcLWvVbGVzkWkkkUHvc2GKZvrJh02WbxZIIeB/+XTpvI6XzIHMietqb
	0Jyq58UqDBXuIAnNXOBzajlIBN+se4qbc5QnG/Oi9drRSKZjwRmWNe5ScnwKxd9KlN1HxixeztM
	sFNHPWOTen2PHfG571tvlAX9/YhLzKnU1sQqJDihH/ZG5Gx8I5IUn7FHI+736lZOk1ubi9tbN92
	Cmxio7A18+x74zuv+cXOLMsNso9LFKEvKPKio4+REneSBwsjWOgdj3InHntpUYNyPZ84RbaGd1H
	QOusjKiSTtCGZzgc+dx2/d5gsMi9hIt6Mc8RTbRgjN5GXsY6qGuevw70iv84UYYnfeHZ5pRa3Xm
	sWWceB06+4DYGBRlG6585wPfw0HtvV+fC7xIeKkQDn8mrDQQyWvA/bdKe6p0BrVuSyD/QosU3hX
	nn5X2imr2mBWiipD4ihk0Qck2KNTZgbImX1Rt3yVktYTstuDBfpHJZiI2BFd8dLCp8Y1OWrgeDZ
	/Abp4aTtyWPPg==
X-Received: by 2002:a05:6402:2403:b0:6a3:e813:8457 with SMTP id 4fb4d7f45d1cf-6a4032f9c61mr9541576a12.12.1787233470427;
        Thu, 20 Aug 2026 06:44:30 -0700 (PDT)
Received: from mail-0004.txt (45-11-61-69.ip4.greenlan.pl. [45.11.61.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c3491sm2182899a12.10.2026.08.20.06.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:44:29 -0700 (PDT)
From: Greg Ociepka <greg@ferrisoft.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: drm/msm: unrecoverable a8xx hang-recovery loop on Glymur ("cx gdsc didn't collapse"); killing the offending client does not stop the loop
Message-ID: <20260820154428.1278@ferrisoft.com>
Date: Thu, 20 Aug 2026 15:44:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi,

On an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite Extreme "Glymur", Adreno GPU, chip id 0x44070041) we are hitting an unrecoverable GPU recovery loop that, once triggered, can only be cleared by a full reboot.

Environment:
- kernel: linux-next next-20260730, plus a handful of local patches for this laptop (USB wakeup-source/dma-coherent DTS, CPU thermal trips, an eDP link-training retry tweak and a DP debug-print ratelimit); none of them touch the GPU, GMU, GDSC or GPU clock paths
- Mesa 26.1.5 (freedreno, a8xx)
- GMU firmware v5.2.38 (qcom/gen80100_gmu.bin) and gen80100_sqe.fw from linux-firmware
- niri (smithay-based Wayland compositor), ordinary desktop clients

Symptom: a regular client (rotating across sessions: chromium, firefox, Xwayland, thunderbird) eventually triggers a GPU fault. From that point recovery loops at roughly 1 Hz; every iteration logs:

  adreno 3d00000.gpu: [drm:a8xx_irq [msm]] *ERROR* gpu fault ring 2 fence 28f9c status 00880005 gfx_status 00880004
  adreno 3d00000.gpu: [drm:a8xx_irq [msm]] *ERROR* BR: status 00880004 rb 0002/0078 ib1 0000000000000000/0000 ib2 0000000000000000/0000 ib3 0000000000000000/0000
  adreno 3d00000.gpu: [drm:a8xx_irq [msm]] *ERROR* BV: status 00880004 rb 0000/0078 ib1 0000000000000000/0000 ib2 0000000000000000/0000 ib3 0000000000000000/0000
  msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 44070041: hangcheck recover!
  msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 44070041: offending task: <client>
  adreno 3d00000.gpu: [drm:a8xx_recover [msm]] *ERROR* cx gdsc didn't collapse

Observations across four separate incidents (2026-08-09 to 2026-08-20; longest 60+ minutes; worst measured rate 161 recover cycles in 5 minutes):

1. The reported offending client differs between incidents and can change within a single incident.
2. Killing the offending client does not stop the loop. We verified this explicitly: after SIGTERM-ing the reported victim the loop continued at an unchanged rate within seconds, and the next client that submitted work became the new "offending task". The corrupted state evidently survives in hardware/firmware rather than in the client.
3. The loop never converges on its own; only a full reboot restores the GPU. While it runs, the victim's surface stays black and the whole desktop degrades, since every recovery stalls the GPU.
4. Onset correlates with many clients creating GPU contexts in parallel, e.g. right after a session restore spawns half a dozen applications at once.

Since every iteration reports "cx gdsc didn't collapse", the recovery path apparently never succeeds in power-cycling the GPU, which would explain why the fault state persists across recovery attempts. Two questions this raises:

- Is the CX GDSC on Glymur shared with, or kept up by, other consumers (the display path, for instance) so that it cannot collapse while the panel is active - which would make this recovery flow structurally ineffective on this SoC?
- Or does gen8/GMU require a different stop/reset sequence before the collapse is attempted?

We are happy to test patches, run instrumented builds, and provide full journals or devcoredumps - the machine reproduces this every couple of days under normal desktop use.

Thanks,
Greg Ociepka

