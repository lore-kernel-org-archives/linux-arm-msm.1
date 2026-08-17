Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430BE312832
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942072; cv=none; b=IpGXsvc+gHYfR5bSGMyB82WrvU0VnKunLCJWmgAcvA9C2FZjqbbxc/2Qchl6tR/WJp+LYkiRv70CVRUCZMltAGlcFlnbhYxAxZqFugESm2PQZFU/TzUQp0w6MewMMfSx2cogcPzFaKLJKwu/7ZOC7uUQ3TQSVi4s64nazUTjlXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942072; c=relaxed/simple;
	bh=pSvOsInxh8EH2EMExoQXhAHkIqdMPnDbFkbn0T7agyM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X6Ab3KFgf/l3eeGuc1JjE1d/kvX8k6hDajuKGjY5VrjAai54bpx7I5L1mBrOt95rYgF4KvK4Fau5NMjicQ5Wmt78BZbQjcLqgiHP8s6bB8R4rdVlFH69andJ8Gz/iqpdE/ScnFchLXJfeuF+dMyzFeS58NL8rn9LMs2RZj2HdBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E52ctQkJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTEqDxu7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E52ctQkJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTEqDxu7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCgbF4126914
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bv6RXnd/xN3Tr4kmDCgZ6d
	g24P64zmM53DHRIeiofXI=; b=E52ctQkJjqrzvO1eCezn8QS42lrNyqUdoMlVhf
	sfp2lt9jggAj9cx59MUodvRCGp2m/vK+CeiWDwqBqHhQsAN8dCxmo4ar+BC/yLcj
	xTiR33pLX+gXlN7eN8u450Q9UOs9naWDiOj3P2yoih8dIe7Uf7H+Ej7h7VAcUtjR
	pAt7ABi3GwSxjORKlojhPTOkO5JH228L+5qGrYJ5m2KtSJ0KPYjyqvQvP2yyS6zI
	+UedFzzh+Xu1zNlM3CnZFhUyHrMhH774zMPV9lQRgqRTZiZ5wEtjl1bS4upfvFps
	fOYF2WFcBoUTfX5ZKC3atnTu9+XHM7lwMLIOyaVEhHH/Mt5Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g322qaudv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:47:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so2549783b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 21:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942067; x=1787546867; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bv6RXnd/xN3Tr4kmDCgZ6dg24P64zmM53DHRIeiofXI=;
        b=QTEqDxu7Aat4msi5EQv+fvCtFzwP0Nsf6YuyMbbu6juvY2PpSYCfto6GEKNK41/AR3
         bktDJ9m3rIGhaTRex2z2LNhTsiF98VAQw895aoPgjXmoUrds0DvQRi+t3wH5FvYCkbKc
         1LCBa5RfBnE4y7HdFgoeqHVPyMOF+NSNjO1FXWE7Q9IodzFDKqtUlrs192xyHUE5UXSq
         n2IhQvqaIzaofWf3fJhaJd77o5G+DVc7VTyQKQuXL/JqER+/cOeyU6mltzYq3FwgcgVj
         p2VKMlYByy3tbtXbh8WzuAqH04m5b64ACAsr2TMHBrL6w6Xu7YhPLp+L1GIOJEQNlYWo
         DPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942067; x=1787546867;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bv6RXnd/xN3Tr4kmDCgZ6dg24P64zmM53DHRIeiofXI=;
        b=LwAre2eL0rnQoGZvDJxRzzhFMqle6Yf9+0cfBQZGc9ZHy3q7okdPSq1aEUmwZqf1aL
         oXSLekO2fxvbNEqQtGD4ks/ZSzuockAGGdV7VxlZLqOUjG25q5t0C6UCyIrPOUWF2W2P
         hRVOiGA9Eoj/7uHvMs6+5RgTVoRSMPUm4Twlvjg31ZwP7nkolcomZxYSfj2nmwgovpuM
         gYdlTZhjL+AUWGeoQxXpTX+joAMMRxx4uy4jjMGd5rnqrRuPlIqTv1HSaTBDXDtNgg/5
         nTBNRkHaBdFttCGYHaFkKd6onsw9eznQvjIFMqgQ4Qndut0B2wq56d2ly8qkBCro0xy1
         xsKQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFUfTRS5/ZXsGzLMki+PbskpXm7OVDB0bZMTxJjtfle8qgcf3WzISXu0UfVMbr9oJhYMXO4qwlMnXPGIB7@vger.kernel.org
X-Gm-Message-State: AOJu0YzuyIW3y4H74YBx9A4MCfcC/olKFOKLnVgvruQIgX8/dPfcEME6
	UG9UUd7KlGve7yY0aKEk5mkWNd2z3wGHniFIw9n4mHsiXBstj20AS638TgRwLe4mEQ3iTWB1tgN
	PMeCsHZlql1FRLasG0EW+H9uYPikuSkCkZoBVwlPnh7Vem/02jg4Mf0SjPHCFWCjRMnK9
X-Gm-Gg: AR+sD10AAskM3HEagzr1kOBiPzZGB+HD+cC7exe2WnCAmGzEwLZTgadGasu66B1YSh2
	dTNPWHXKr4nmtMgz1l35fjKvkxuue0r5ZnEKbKAHxpyFEHTlLVXR9EGUMQPeIEMCBZvG09yC5ut
	ynxpSfE1BN8x8B8VwiuQP4Q651RMMWjWMWoT1j++xs2x4Er1j6RLh4dl4RnXx11zyNRlVlpcAB7
	Kne66SFQBTIokB1oRlojeIFoBwOb0GcWA0c7AROAkW/hDeGJHbM/jl3eGv4ED/Y6Sjl0VthcYlh
	/hUsG0WD+vaSy3GAgRn9VKutAfquS/wycw+TYDSMNJoolznq6/HQS7Ie26Rre9LwkyhnMqSvyjJ
	/llZ7QG8xSNRMw6L82CPwdVb7V71CX7PT
X-Received: by 2002:a05:6a00:808a:b0:848:2a69:97be with SMTP id d2e1a72fcca58-84fdc77ab7dmr16849385b3a.10.1786942067338;
        Sun, 16 Aug 2026 21:47:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:808a:b0:848:2a69:97be with SMTP id d2e1a72fcca58-84fdc77ab7dmr16849343b3a.10.1786942066782;
        Sun, 16 Aug 2026 21:47:46 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:47:46 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
Date: Mon, 17 Aug 2026 10:17:35 +0530
Message-Id: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGeSgmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nz3cKURN0yI11zi1SjFMM0QwNTI0sloOKCotS0zAqwQdGxtbUAJDp
 geVgAAAA=
X-Change-ID: 20260817-qda-v2-78e2d1f10529
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942057; l=11071;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=pSvOsInxh8EH2EMExoQXhAHkIqdMPnDbFkbn0T7agyM=;
 b=sl7L+r8raghBMVP5VPZDI8wp+mUlZZLp1/l1FU7MFfXtMwamDB2fghfjYR0T71jwla4+uNlX8
 4rAv7nNCPp3CHtL9Zyp60j0psxfHIG7avE3pCr0iw3mF81rbT6z1A/2
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfXxyA6/kMhbSZi
 8vRvy3QzegNLu95H/wzX1Z6ruMehHmroRObrhAyzgMfEmmmwpK0f/FGV/ajliIIZxmh85NipkAC
 KHEdxDoj2HuAhL4T3us5Vatl7ypwag8=
X-Proofpoint-GUID: 9re0zCpmzBYnv26rRkW0s33Y7ZrU1Z7H
X-Authority-Analysis: v=2.4 cv=C5PZDwP+ c=1 sm=1 tr=0 ts=6a829274 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=D19gQVrFAAAA:8
 a=rBnY21l43NVlWRrruRIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfXzMJZmwmkbGqL
 ShBhoYhd1gNX7bF56bUw+hdLyKKJx515LuJwnsTne6YohAvEz1I90qBdUtzdMFco3uGi9NRSd4h
 A1OPykv7YbfPtnQXtmdd52rqBuYvbJgbaNXOizQ+lX92sNaqJ8qRGtZOx/61HdQ3bWcm2wFCaXn
 5rJ+/M/7J0FPTBE0SfEwArctiGgeeVD5WbGNB8KueOzhyWZqiNZwEtVck7PfnA12mu685mWsAoM
 QB+E+ZVqefXFYgpRyLYbjY47J+n0ukuPMvX1/Q0Tu+zIIw9jo3gvDPpREtHI6l/qRG5NC9atdS8
 XlTe1OJiXAFbLDkiKRrEJTJ7t66GGdpU9laIfJ6MUf2fYPEa/WLRmO6en31EQfmMfmhamsDF3tA
 b0UPYj84zVjDeUSUkCCejGbhDDgZbLkECD2SEch5/i8y/mZ4/DQFRN0ada2XbDrgb6ibwD66yek
 INwdS4f3OHrzxidYxDw==
X-Proofpoint-ORIG-GUID: 9re0zCpmzBYnv26rRkW0s33Y7ZrU1Z7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170033

This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
a DRM-based accelerator driver for Qualcomm DSPs. The driver provides a
standardized interface for offloading computational tasks to DSPs found
on Qualcomm SoCs, supporting all DSP domains.

The QDA driver implements the FastRPC protocol over the DRM accel
subsystem. It uses the same device-tree node structure as the existing
fastrpc driver in drivers/misc/. The approach for binding the QDA driver
to device-tree nodes while coexisting with the fastrpc driver is an open
item described below.

v1: https://lore.kernel.org/all/20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com/
RFC: https://lore.kernel.org/dri-devel/20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com/T/

Changes since v1
================

The v1 review raised two architectural objections and one correctness
issue; all three are resolved in v2:

* Christian König (dma-buf maintainer) pointed out that the imported-
  buffer path silently assumed the IOMMU maps every buffer as a single
  contiguous range, which is not guaranteed. v2 walks the scatterlist
  and cleanly rejects non-contiguous imports; contiguous imports (e.g.
  CMA DMA-buf heap) are accepted. (patch 11)

* Dmitry Baryshkov objected to three different buffer-passing formats
  in the invoke IOCTL (DMA-BUF fd, direct/inline, DMA handle). v2
  passes only GEM handles; userspace imports any fd to a GEM handle
  with DRM_IOCTL_PRIME_FD_TO_HANDLE before invoking. Packing and
  overlap handling are left to userspace. (patch 12)

* The memory manager (patch 07) used a fixed 16-entry array without
  justification and leaked the device descriptor on teardown. v2
  allocates the array from the DT context-bank count (as Dmitry
  suggested) and frees it correctly.

User-space staging branch
=========================
https://github.com/qualcomm/fastrpc/tree/accel/staging

Key Features
============

* Standard DRM accelerator interface via /dev/accel/accelN
* GEM-based buffer management with DMA-BUF import (PRIME)
* IOMMU-based memory isolation using per-process context banks
* FastRPC protocol implementation for DSP communication
* RPMsg transport layer for reliable message passing
* Support for all DSP domains (ADSP, CDSP, SDSP, GDSP)
* DRM IOCTL interface for DSP session management, buffer allocation,
  and remote procedure invocation

Architecture
============

1. DRM Accelerator Framework Integration
   The driver registers as a DRM accel device, exposing a standard
   /dev/accel/accelN character device node. This provides established
   DRM infrastructure for device management, file operations, and
   IOCTL dispatch.

2. Memory Management
   Buffers are managed as GEM objects with PRIME support for DMA-BUF
   import. This enables buffer sharing with other DRM drivers (GPU,
   camera, video) using standard kernel mechanisms. Only contiguous
   imports are accepted; the driver verifies contiguity at import time
   rather than assuming it.

3. IOMMU Context Bank Management
   IOMMU context banks (CBs) are represented as proper struct device
   instances on a custom virtual bus (qda-compute-cb). Each CB device
   is registered with the IOMMU subsystem and receives its own IOMMU
   domain, enabling per-session address space isolation. The custom
   bus was introduced because IOMMU context banks are synthetic
   constructs — not real platform devices — and to ensure CB device
   lifetime is strictly subordinate to the parent QDA device.
   See also: https://lore.kernel.org/all/245d602f-3037-4ae3-9af9-d98f37258aae@oss.qualcomm.com/

4. Memory Manager Architecture
   The memory manager maintains a registry of IOMMU devices in an
   array sized to the number of context banks described in the device
   tree, and coordinates per-process device assignment with reference-
   counted lifetime management. The DMA-coherent backend allocates
   buffers with SID-prefixed DMA addresses for DSP firmware
   compatibility.

5. Transport Layer
   RPMsg communication is handled in a dedicated transport layer
   (qda_rpmsg.c), separate from the core DRM driver logic.

6. Code Organization
   The driver is organized across multiple files (~4800 lines total):
   * qda_drv.c:            Core driver and DRM integration
   * qda_rpmsg.c:          RPMsg transport layer
   * qda_cb.c:             Context bank device management
   * qda_compute_bus.c:    Custom virtual bus for CB devices
   * qda_gem.c:            GEM object management
   * qda_prime.c:          DMA-BUF import (PRIME)
   * qda_memory_manager.c: IOMMU device registry and allocation
   * qda_memory_dma.c:     DMA-coherent allocation backend
   * qda_fastrpc.c:        FastRPC protocol implementation
   * qda_ioctl.c:          IOCTL dispatch

7. UAPI Design
   The driver exposes DRM-style IOCTLs defined in
   include/uapi/drm/qda_accel.h, following DRM UAPI conventions
   (__u32/__u64 types, C++ guard, GPL-2.0-only WITH Linux-syscall-note).
   Buffer arguments are identified by GEM handles; the driver never
   accepts DMA-BUF fds directly in any IOCTL.

Patch Series Organization
==========================

Patch 01:      MAINTAINERS entry
Patch 02:      Driver documentation (Documentation/accel/qda/)
Patches 03-04: Core driver skeleton and compute bus
Patch 05:      iommu: Register qda-compute-cb bus with IOMMU subsystem
Patches 06-07: CB device enumeration and memory manager
Patch 08:      QUERY IOCTL and UAPI header
Patches 09-11: GEM buffer management and PRIME import
Patches 12-15: FastRPC protocol (invoke, session create/release,
               map/unmap)

Open Items
===========

1. Device-Tree Compatible String
   The QDA driver uses the same device-tree node structure and
   properties as the existing fastrpc driver in drivers/misc/. A
   mechanism is needed to allow the QDA driver to bind to its device
   node independently of the fastrpc driver.

   The intended coexistence model is: platforms that require the
   complete fastrpc feature set continue to use "qcom,fastrpc"; new
   platforms where QDA's feature set is sufficient use a QDA-specific
   compatible string. New feature development is directed toward QDA.

   The options under consideration are:

   a) Add a new "qcom,qda" compatible string to the existing
      qcom,fastrpc.yaml binding, since the DT node structure and
      properties are identical.

   b) Introduce a separate qcom,qda.yaml binding that references or
      inherits the fastrpc binding properties.

   Seeking guidance from DT binding maintainers on the preferred
   approach.

2. Privilege Level Management
   Currently, daemon processes and user processes have the same access
   level as both use the same accel device node. Daemons attach to
   privileged DSP protection domains and require higher privilege
   levels for system-level operations. Seeking guidance on the best
   approach: separate device nodes, capability-based checks, or DRM
   master/authentication mechanisms.

3. Audio and Sensors PD Support
   The current series does not handle Audio PD and Sensors PD
   functionalities. These specialized protection domains require
   additional support for real-time constraints and power management.

Interface Compatibility
========================

The QDA driver uses the same device-tree node structure and child node
layout (including "qcom,fastrpc-compute-cb" child nodes) as the
existing fastrpc driver. The underlying FastRPC protocol and DSP
firmware interface are compatible with the existing fastrpc driver,
ensuring that DSP firmware and libraries continue to work without
modification.

References
==========

Previous discussions on this migration:
- https://lkml.org/lkml/2024/6/24/479
- https://lkml.org/lkml/2024/6/21/1252

Testing
=======

The driver has been tested on Qualcomm platforms with:
- Basic FastRPC attach/release operations
- DSP process creation and initialization
- Memory mapping/unmapping operations
- Dynamic invocation with various buffer types
- GEM buffer allocation and mmap
- PRIME buffer import from other subsystems (contiguous buffers)

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Ekansh Gupta (15):
      MAINTAINERS: Add entry for Qualcomm DSP Accelerator (QDA) driver
      accel/qda: Add QDA driver documentation
      accel/qda: Add initial QDA DRM accelerator driver
      accel/qda: Add compute bus for QDA context banks
      iommu: Add QDA compute context bank bus to iommu_buses
      accel/qda: Create compute context bank devices on QDA compute bus
      accel/qda: Add memory manager for CB devices
      accel/qda: Add QUERY IOCTL and QDA UAPI header
      accel/qda: Add DMA-backed GEM objects and memory manager integration
      accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET IOCTLs
      accel/qda: Add PRIME DMA-BUF import support
      accel/qda: Add FastRPC invocation support
      accel/qda: Add DSP process creation and release
      accel/qda: Add remote memory mapping to DSP address space
      accel/qda: Add remote memory unmap from DSP address space

 Documentation/accel/index.rst          |    1 +
 Documentation/accel/qda/index.rst      |   13 +
 Documentation/accel/qda/qda.rst        |  191 ++++++
 MAINTAINERS                            |   11 +
 drivers/accel/Kconfig                  |    1 +
 drivers/accel/Makefile                 |    2 +
 drivers/accel/qda/Kconfig              |   34 ++
 drivers/accel/qda/Makefile             |   19 +
 drivers/accel/qda/qda_cb.c             |  125 ++++
 drivers/accel/qda/qda_cb.h             |   32 +
 drivers/accel/qda/qda_compute_bus.c    |   80 +++
 drivers/accel/qda/qda_drv.c            |  144 +++++
 drivers/accel/qda/qda_drv.h            |   90 +++
 drivers/accel/qda/qda_fastrpc.c        | 1009 ++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h        |  367 ++++++++++++
 drivers/accel/qda/qda_gem.c            |  155 +++++
 drivers/accel/qda/qda_gem.h            |   60 ++
 drivers/accel/qda/qda_ioctl.c          |  290 +++++++++
 drivers/accel/qda/qda_ioctl.h          |   19 +
 drivers/accel/qda/qda_memory_dma.c     |   82 +++
 drivers/accel/qda/qda_memory_dma.h     |   17 +
 drivers/accel/qda/qda_memory_manager.c |  369 ++++++++++++
 drivers/accel/qda/qda_memory_manager.h |   85 +++
 drivers/accel/qda/qda_prime.c          |  167 ++++++
 drivers/accel/qda/qda_prime.h          |   18 +
 drivers/accel/qda/qda_rpmsg.c          |  201 +++++++
 drivers/accel/qda/qda_rpmsg.h          |   26 +
 drivers/iommu/iommu.c                  |    4 +
 include/linux/qda_compute_bus.h        |   33 ++
 include/uapi/drm/qda_accel.h           |  242 ++++++++
 30 files changed, 3887 insertions(+)
---
base-commit: 5f07a0db7088b4ef4b9a48069a93b9f3e1a33379
change-id: 20260817-qda-v2-78e2d1f10529

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

