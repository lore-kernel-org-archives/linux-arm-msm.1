Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBA66BB5B
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 05:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993565; cv=none; b=qqso6WCx4m/OG0/K6tWfIAWK9vcV/ayFqd0i7rlfzhY7jc4KRmz2xfhaHk8UpS+tXAk/XMHly3zVZK532ijpWKWVdvbMgDuMaENOMfWYCtYwiuPpirbutxSmDF5A+531LT1AUKMDVgNPsciW3mPQ12uM2RnnJaipjib43Wonl1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993565; c=relaxed/simple;
	bh=USZVqPnXKF9GZaS6KQ1RN4flewbkQ3iaunSm30QJx/k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eyVzytmsVD7RzE5mH6HIQKnnXCNsI/BdVRLNX6/vE1mAcV5xVllIL8FOc7AFEIjspSo4yFQXUDGBVX5kHXvM6RzOlGGZey845TC+v77StBIco+hCE2axJtyHmrT8lQSA3o9Z1kFzyfujgMy2NCUKTGM+lyl3WGGmN4x049XQ+p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DG0OCQiO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DG0OCQiO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Nblcc226729;
	Thu, 6 Aug 2026 05:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yTSrB8W8clCC4RFRUKAH0yIkOjRUxIdDIu9
	ZnmU4Wyg=; b=DG0OCQiOdo0YRsPp2eU4lungl2YoJAn1+ENhkoYSHMv+x8Q7vzY
	Zl2iuvyjHK0hK32+gqZoHcUNwBGG0R6N0q9NwceuReil47JiaO2MWiA6tTnX36lh
	ghqKEF0/jVxKghirFrNZBuZ6FRFoUKS7SM7Yr2dAMc+2vd3diVwf+IwqfBUC7DEz
	JF2P4GGNLo7/TH6mUsqfAB6pmRA2o9r2YD7Ov8e96cQZu2aq2w9dW82hGMtqpFvJ
	GQ7P3rQnfbT4H0rTjFmHQGZ7mvRrZ3B40k7kJCe6td9L2Jc7XkXk/k93iR5sBK1c
	gmBaq0ByPqPyYCjhlbrOhLgV7SOMgZ1AkaQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2r64h26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 05:19:16 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6765Ag0d019048;
	Thu, 6 Aug 2026 05:19:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fvdbw2yne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 05:19:15 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6765JFJJ002631;
	Thu, 6 Aug 2026 05:19:15 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-pravinku-lv.qualcomm.com [10.81.27.176])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 6765JF6W002627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 05:19:15 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 3914598)
	id 19C8F6DD; Wed,  5 Aug 2026 22:19:15 -0700 (PDT)
From: Pravin Kumar Ravi <pravinku@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: linux-accel@vger.kernel.org, christian.koenig@amd.com,
        sumit.semwal@linaro.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, konrad.dybcio@oss.qualcomm.com
Subject: [RFC] Synx: A global synchronization framework
Date: Wed,  5 Aug 2026 22:19:15 -0700
Message-Id: <20260806051915.2234481-1-pravinku@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=WrIb99fv c=1 sm=1 tr=0 ts=6a741954 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=G3I2PbPdawe2DYykPU8A:9
X-Proofpoint-GUID: AtJsumE-Z_RwUoWxN2gM6GCJYj1yS9hK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAzNyBTYWx0ZWRfX2z0exGr9kgs4
 Gtv0Wl5hTedv3LEReaXFqJg0lbk8Z/UXdQP2F1dE1Yzj+VwORaQGPN10NfycMoYpv2WLizvc6Y1
 4CW7QUSgYM57hcpQfp4MxFpxH8kTEPg=
X-Proofpoint-ORIG-GUID: AtJsumE-Z_RwUoWxN2gM6GCJYj1yS9hK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAzNyBTYWx0ZWRfX3s3lMS+8/xtt
 sofTuzHJoED/IzpJ5Sy9Oud4OPIdfHX19RFTFcFnL7oJByV4TpVNgvB/7aglG7YW0WmmFoZKEDR
 rnirzlb9fNc33CWqgVe6KnIM/z7zQHhshJ2SuyOlCYcSyQIPrRJZpmncaI0Dr/MiyaU8nH+GuyE
 TDyjLwb2MUyBtergsvYLQTc8Sd/1EqY3QGV9XIyOYAwxeU7ZLclGfyHbmGduwt3UAtuqMPJwlHU
 WvfM+Em/nVLWdo6bxsvuSEwQIaJiBFb6X/Hj4GSk1DCv76hz54x2DN2/dy5HGMe/oK+h/ebiAxd
 RyMW1WGsNgqgQnujZJrfrl89s+asfQhSmA2AoiclI62MiU+/uTuMwMET83gZh1eRXxsP8euQwXE
 H1cJjfdyJR4layFILajEQykvgt1uGvefG2qvU/LkHmABuTUQ63f+aGf4mG1cTnkQdaezoBgjggZ
 SJM8qOaAiBm6nDqDvbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060037

Synx: A global synchronization framework
==========================================

This RFC is intended to start a design discussion around Synx, a
SoC-wide synchronization framework used to coordinate fences between
Linux-hosted clients and non-Linux execution environments such as
remote processors and firmware.

The intent of Synx is not to replace dma-fence for existing in-kernel
GPU/display style synchronization. Rather, provide a global
synchronization mechanism spanning multiple subsystems and
processors, while still integrating with existing Linux primitives
such as dma-fence and sync_file where appropriate. The solution has
shown significant power and performance benefits in the last few
generations of Qualcomm mobile and XR chipsets, and is gathering more
use cases. Also, the solution is SoC-agnostic, so other vendors can
adopt it in the future if interested.

Motivation
----------

Many multimedia and accelerator pipelines on modern SoCs are no
longer strictly host-centric. Work may be produced, consumed, waited
on, or signaled by multiple execution environments, including Linux
drivers, userspace components, DSPs, ISPs, NPUs, video firmware,
camera firmware, or other remote processors.

dma-fence is a good fit when the fence state, callback list, and
lifetime are owned and progressed by Linux kernel participants.
However, for cross-processor use cases, a synchronization object must
satisfy properties that dma-fence does not currently provide:

- Cross-subsystem visibility: A fence created by one subsystem must
  be importable, waitable, and signalable by other subsystems,
  including non-Linux processors. struct dma_fence is local Linux
  kernel state and is not directly visible to remote processors or
  firmware.

- Point-to-point remote signaling: One subsystem should be able to
  signal another subsystem without interrupting the Linux host CPU
  every time in the signaling path. Since dma-fence maintains all
  waiters in the Linux, remote-to-remote synchronization has to
  unnecessarily interrupt or involve the Linux host.

- Distributed lifetime management: References may be held by Linux
  and non-Linux participants. Any subsystem must have authority to
  create and clean up fences. This requires lifetime state to be
  tracked in a shared/global table, rather than being owned solely by
  a local Linux object. dma-fence lifetime is centered around Linux
  references, which does not naturally model references held and
  released independently by remote processors.

- Race-free global synchronization: Registering a waiter and
  observing signal state must be atomic across participating
  subsystems to avoid missed wakeups/signals. Atomicity between
  remote waiter registration and remote signaling needs a
  protocol-level guarantee, not just local callback handling.

- Subsystem restart recovery: If a remote processor or firmware
  subsystem restarts, references held by the crashed subsystem must
  be released, and waiters that depend on that subsystem must be
  completed or failed in a well-defined way. Subsystem restart
  cleanup is outside the dma-fence model.

- Global composition: It should be possible to compose fences that
  were created by different subsystems or processors into a single
  aggregate synchronization object. dma_fence_array can compose
  Linux dma_fence objects, but it does not by itself solve the
  composition of globally visible synchronization handles created by
  different processors.

- Transport abstraction: Remote signaling should be independent of
  the underlying transport, for example rpmsg, mailbox, GLink or
  another SoC transport.

- Linux integration: Linux clients should be able to interoperate
  with dma-fence and sync_file where that is the right ABI or
  in-kernel interface.

Proposed model
---------------

Synx introduces a globally unique synchronization handle. The handle
indexes an entry in a global synchronization table that is
accessible to all participating subsystems. Each entry tracks: a
global handle ID, current fence state, the set of waiting and
subscribed cores or subsystems to allow point-to-point remote
signaling, a distributed reference count, and parent/child
relationships for composed fences.

The design is organized around four components:

- Handle and session management: Any subsystem, Linux or remote, may
  create or import a Synx handle and hold a reference counted against
  the global table. Handles are destroyed by the subsystem which
  releases the last reference, regardless of which subsystem it is.

- Transport abstraction: Remote wait and signal messages are
  delivered through a pluggable transport layer. The synchronization
  core is not tied to any specific backend (rpmsg, mailbox, GLink,
  etc.), enabling point-to-point remote signaling without involving
  the Linux host CPU when both producer and consumer are outside
  Linux.

- Linux interoperability: A Synx handle may be associated with a
  dma_fence or exported as a sync_file, allowing Linux kernel drivers
  and userspace to interact with Synx objects through existing
  interfaces.

- Fence composition: Aggregate fences are modeled as parent/child
  relationships between global handles. A composed fence can span
  handles created by different subsystems or processors, and its
  completion state is derived from the states of its children in the
  global table.

- Subsystem restart recovery: When a remote processor restarts, the
  global table is walked to drop all references held by that
  subsystem and to complete or fail any affected waiters according
  to the configured recovery policy.

Possible initial patch structure
---------------------------------

If the overall direction is acceptable, an initial RFC series could
be split as follows:

- Documentation describing the cross-subsystem synchronization
  problem and the Synx object model.
- Code to manage Synx sessions and handle lifetime, and
  synchronization using wait and signal.
- dma_fence and sync_file interoperability layer.
- Fence composition support.
- Transport abstraction for remote wait/signal messages.
- SSR/restart cleanup hooks for remote processors.
- A minimal Qualcomm SoC integration backend and example client.

At this stage, feedback on the model and layering would be more
useful than detailed code review. In particular, we would appreciate
guidance on whether this should be pursued as a Qualcomm SoC-specific
driver first, or whether the cross-processor synchronization pieces
are generic enough to justify a common framework.

Thanks,
Pravin
