Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D552488221
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846907; cv=none; b=s+9EAzELHttuP0Npov84O8SpLVYJvsi+iFvdTVEQ3eg9JlRXHa+9679Ob5rebtKG4xgcVTWOwDWqvpaABSFki/tUN93PD/RG2UMll2eI8LpnF5s1RP4GgZ/cp/3ZRBKdAnNjd5CLs4C95/2lblU7cRLo4eJqhCnsJM3nyEHPgDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846907; c=relaxed/simple;
	bh=InJBi1ft2hBbaFKieY6YZqUXPU/gfk8w7Fh7r9+bQPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A8W5jZypceOoLRubtjDiEIoBNwGsgFjfiUVbGKDvxFO6TOiY1HA/jgwDPhMFGsjk1D1yiaWthtDzSHzo5uBo+6odFj2yFlfGS2mF5TujBnEhHrln5F/XwxbyWNybUaAObPJKo5KveF+a+TtMStZlmI57fc0Kn1x+n4QF0ghocwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4uq6JlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1Gzg4Vm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4uq6JlM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1Gzg4Vm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFcWMJ3360499
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=atRu9g3ecGR/Ax5Jg8bJIB
	651HizDXONPJoQtisnwWc=; b=Y4uq6JlMpmj0npdFeC57HIRdcXHvB1w2M6L9O9
	PwLZ2U/E0etX95l5S3QazbFxtQ84dSCpFhs45XMhhNr3ykMBlc1XAe08rxWKIf93
	ISwIavbNkpr3MlFveW/yD//12y0VEiu3W4O4nTwolGa++uMHbVVNsr38aOU7Ccob
	nAAhMKFTAbbbRqXqxz0wW2chDr7MQ4aF8D7HsMFFWPhL78MCVYcgmQe7N9Jv2Aks
	dANs4IPALWTMepSN4Eu5YdlOwWxdhvCJ5Fo/H19ieoRURWH+ZGvNlorRanqW5mN7
	JP7f9tVZZ3N/9OpCUX+Y6KR5kKq6jRemzqPyb59O9qxQdGMQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gab7t39cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:08:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so191946a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 09:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787846903; x=1788451703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=atRu9g3ecGR/Ax5Jg8bJIB651HizDXONPJoQtisnwWc=;
        b=F1Gzg4VmkuOEsACdblWuKAtOcr6W6YKWMVFwu+Kh+gqkimFgSCc2waBhtWpILUSOrv
         DO7w/AJuTdBuIde3AdytuBdGizsu4+v2Unpni5n5oR+DC+NTUZjJw+prd7nmEqVoTfxB
         kvFax5lZ85MmKppQTTDpSvFHWVMOwR01gshwQqiGAnwGWLww9oy1QI5TyQQlvOi5rOkE
         3s015XgPsOf/meLzGNptBOBC1/zVuUvZrahT6/T6XTFzfzbEoj5zWbMx1/nIVYgsNZkY
         2h/p5WWerLNSk+N9aRCq2MQaW920TkEXf28Pwpa1ZUN24kTIJedpyYaukAC7SH+ztFgt
         y/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846903; x=1788451703;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=atRu9g3ecGR/Ax5Jg8bJIB651HizDXONPJoQtisnwWc=;
        b=ryiUtOEO9QG7U7ZvVvhSlbq+9kb1T0imchLD/ah7vms4+oKOTKOClTLzIl7e63A+Qd
         cu/IoU9RALuwAxadMNIaRUgFdc4WxGzCPkMW52gmXXvW608zndjk7R/AlSyhYptVVBBy
         SX9xvZ+J5+5w3+PvmW4VDpzN4K/535ghpV2G9fYnZ5NfqOxU5KGne+62OGys4OWPlWr/
         SkYXF68zezQ/L3n59ixZqeRqrrK/nTeFK2B/E/jG9tCFUcWpRmYjVH32tCokyLDLQi/H
         FPZPQdzslaAXZwcKmUZCVhDM3V5SzyWz8pL78Vlkqpy2XD+OO+Wk4diQOSu7Zd2j7nOc
         ahAA==
X-Forwarded-Encrypted: i=1; AHgh+RqQ8cUEh/oO+TQzk++hoiEeD/rKRSoA/IPSSXax57xcd4IAlwSrFzhakwcxh7XCkFgLNow8rQQFVUJJZE12@vger.kernel.org
X-Gm-Message-State: AFuF++mNmju753QUZNj6fhVdki7lH4FE5vc2n7N0qZKc03XlbL3iuTNB
	aa5RzgChzLgUM7NiM2MRDtwHn+R/rAg755IysSUxegqMy4FhA5p6mKocrpz5FBzB8N9FGUyijMy
	ozIgFsXHL/oSKfh6yNGM76donNilpDcb1q99qGd4KdTcLDTk0BSVLU388m7yFSFcVmeRt
X-Gm-Gg: AR+sD12dLPU0m9t8vRta9cJt+hE0nav5E4uz+rIznzTDkxF+8B/25OEE9JCLgrWJVKc
	EhO2Fq/lkjQcvwWv1T8NXhJDiHyRHyKzKl5+mrKyirpJ7bpK1cVinmUqwvqett7Iwr2zoWzQ0Ho
	OLvhaRp0V3tJSH4htDq2PBS7Nxm+7aXaSb2Sm9WUNkoVSwjdhiYinE+td0c6GQwACz0rUG4KTW2
	DUMo0VA+N71sZUwoqv4Go7xzetFWAk2r5zv8xvPc4EbN8iZ4ZYpwhCzdvWtihgAxONSL1wKXnXZ
	2OiAUf/RrcTp3RZh5QJ1qCCPe1kuP63xuoYFlPJxwGKLVRSCYd8L0LE+u+hq+alzj+c3mSGIYV3
	kMXbC0DUuSPoDkh3/ld9EutH6SOXh9+/OIWC/ARpVtCkMS9foK+1ZMzTOyLc=
X-Received: by 2002:a17:90b:3c8a:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-396d10076e9mr459899a91.13.1787846901410;
        Thu, 27 Aug 2026 09:08:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8a:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-396d10076e9mr459325a91.13.1787846899408;
        Thu, 27 Aug 2026 09:08:19 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd9085sm3245892a91.12.2026.08.27.09.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:08:18 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: ebiggers@kernel.org, axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/11] FBE virtualization: inline encryption for virtio-blk guests
Date: Thu, 27 Aug 2026 09:07:09 -0700
Message-ID: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X6Bi7mTe c=1 sm=1 tr=0 ts=6a9060f8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bZYwddHGPv9KEr_TRj0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: IKu3PV0LoLzec0kRe-QUL4gOGrKrcfxI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX/vQsk7uMY5QE
 NnqeHkwzWwjEpE3D6yx08F+DB8YzL6TIfEL4OoZeC4A7Yx+A/k8BJnZV0ONObpnZ3UACbFGmYDr
 nGG3JVoq3Qy5n0R7YpqYaKlgyti8byE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX/7SSQkaKB4yx
 WNds4pBbIy83nCl1UaTzIrKNy+6SqO9JoI0rkb4ZefOvzLhfUFcBCS11UsT+ayrU8LIOc7hoc5G
 XrOQPcf3KGlF8maOVqcNidTvteZskBwKGOqn9NnbqkC826V9JBtlYCwVnajWIJ+o68MgilyXVSr
 H2GOHDgIh3XAhXQQ65Rl52JHJMnrvAL1aAFp11b/Yo6Kw0F1r9DPRjEtSY8y/0EPMR6/NLWuG8K
 1hoyI5b1xxtVEHzSOjTQqxBM6bF9/GKuPz1AsKFiF1OuQkUi33G0B3Ayvacjq+pk9TEYzM9hLb9
 Og0tuvjGWi6xtH2aXE5ZhWBFfvaK4ZY3ijdCxba5KGWzLwTX3RHAzmRa5M7skSa6L4S6Mk7EZzv
 3TDZBjqDO9C+t12dScnjKIJs1v8XivLgGPXVFc3eOJsf5H7MIcSxHaKCJneK3kHH6YQdhnQTRhO
 dxaqVARAWHPCtq9OFdA==
X-Proofpoint-GUID: IKu3PV0LoLzec0kRe-QUL4gOGrKrcfxI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270136

From: linlzhan <linlin.zhang@oss.qualcomm.com>

Current virtio-blk does not provide a mechanism for a guest to
program hardware keys or submit encrypted I/O using pre-programmed
keyslots.  It drops the crypto context when issuing a bio request
to the virtio-blk queue, preventing inline-encryption-based FBE
on virtio block devices.

This series enables File-Based Encryption in guest VMs on Qualcomm
GVM platforms where the ICE inline encryption hardware is shared
between the host and guests.  In this environment the guest kernel
has no access to the ICE hardware directly; it supplies a virtual
keyslot index and data unit number with each encrypted I/O request
via VIRTIO_BLK_F_INLINE_ENCRYPTION, and the host must translate the
virtual slot to a physical ICE keyslot and submit the bio — without
transferring raw key material across the VM boundary.

             +----------------------------------------------------------------+   
             |                                                                |   
             |               LA GVM                                           |   
             |                                                                |   
             |                                                       |        |   
             |                                                       |        |   
             |                                                       |        |   
             |                                                +------v------+ |   
             |                               +----y-----------+   blk-mq    | |   
             |                               |                +-------+-----+ |   
             |                               |                        |       |   
             |                               |                        |       |   
             |                    +----------v-----------+            |       |   
             |                    |blk-crypto-profile    +------------v       |   
             |                    +----------------------+            |       |   
             |                                                        |       |   
             |                                                        |       |   
             |            Control path:                               |       |   
             |            generate/import/prepare key                 |       |   
             |            program/evict/derive_sw_secret key          |       |   
+----------+ |                                                        |       |   
|          | |+-------------+     +-----------------------+     +-----v-----+ |   
|Trust Zone| || crypto-virt <-----+ virtio-blk-crypto-ext <-----+virtio-blk | |   
|          | |+------+------+     +-----------------------+     +-----+-----+ |   
|          | |       |                                         Data path: I/O |   
+-------^--+ +-------+------------------------------------------------+-------+   
        |         SMC|call                                (virt_slot, DUN, DUSize)
        |            |                                    appended in virtblk_req 
    +---+------------v------------------------------------------------v----------+
    |  +--------------+                             +--------------------------+ |
    |  | SMC trap     |                  Hypervisor | MMIO trap/VIRQ injection | |
    +--+--------------+-----------------------------+--------------------------+ +

    +--------------------------------------------------------------------------------------------+
    |                                                                    PVM                     |
    |                                                                                            |
    | Crypto IO    +--------------+                                                              |
  +-+-------------->  QEMU/Crosvm +-------+                                                      |
  | |              +--------------+  IO data                                                     |
  | |                             virt_slot, DUN, DUSize                                         |
  | |                                     |                                                      |
  | |+----------------+       +--------- -v-----+                                                |
  | ||  blk-crypto    <-------+ blk-crypto-proxy+-------------+----------------------+           |
  | |+----------------+       +-----------+-----+             |                      |           |
  | |                             slot path based             |                      |           |
  | |                               bio_crypt_ctx             |                      |           |
  | |+-----------------------+       +--- v----+              |                      |           |
  | || blk-crypto-profile    <---x---+  blk-mq |      bcp_hypervisor_ops             |           |
  | |+-----------------------+       +----+----+              |                      |           |
  | |                                     |                   |             bcp_slot_virt_ops    |
  | |                         +-----------v-----+             |                      |           |
  | |                         |         SCSI    |             |                      |           |
  | |                         +-----------+-----+             |                      |           |
  | |                                     |                   |                      |           |
  | |                 crypto msg in UTRD  |                   |                      |           |
  | |+----------------------+        +----v-----+  +----------v-- ---------+ +-------v--- ------+|
  | ||    ufs crypto        <--------+ ufs-core |  |blk-crypto-hyp-backend | | keyslot-partition||
  | |+----------------------+        +-----+----+  +-----------------------+ +------------------+|
  | +--------------------------------------+-----------------------------------------------------+
  |                                        |                                                      
  |                                        |                                                      
+-----------------------------------+   +--v---+-----------+                                      
| +------------------------+        |   |  ICE |    UFS    |                                      
||MMIO trap/VIRQ injection |  HYP   |   +------+-----------+                                      
+ +------------------------+--------+                                                             

Patches 1-3 land in the guest kernel.  Patch 1 negotiates
VIRTIO_BLK_F_INLINE_ENCRYPTION and wires it into blk-crypto.
Patches 2-3 add the Qualcomm GVM-side crypto backend, which routes
key programming and software-secret derivation through SCM calls to
TrustZone.  These patches are sent for review; the virtio-blk inline
encryption protocol is also under review (see
https://lore.kernel.org/all/20260814142306.3934029-1-linlin.zhang@oss.qualcomm.com/).
These patches and the virtio-spec depend on each other.  They must be
kept consistent for upstream merging.

Patch 4 adds the dt-binding for the Qualcomm crypto-virt node used by
the guest-side backend.

Patch 5 introduces a "slot path" in blk-crypto that lets a bio carry
a pre-programmed physical ICE keyslot index in bc_slot rather than a
blk_crypto_key pointer (bc_key == NULL).  This is needed on the host
side where the hypervisor has already programmed the keyslot; the host
kernel has no access to the raw key.  Patch 6 extends
ufshcd_prepare_lrbp_crypto() to handle this path.  Patch 7 moves
bio_crypt_dun_increment() to the public header so it can be called
from drivers/block/.

Patch 8 adds /dev/blk-crypto-proxy, a misc character device for
userspace virtio-blk backends.  The interface is three ioctls:
BCP_BIND_CONTEXT binds a host block device fd and a hypervisor VM fd;
BCP_GET_CRYPTO_CAPS queries the device's inline-crypto capabilities
and the VM's ICE keyslot allocation; BCP_SUBMIT_IO_BY_VSLOT resolves
a guest virtual slot to a physical ICE keyslot and submits the
inline-encrypted bio synchronously.  The driver is
hypervisor-agnostic and storage-vendor-agnostic, using two pluggable
op-sets registered by platform drivers at runtime.

Patch 9 implements bcp_slot_virt_ops for Qualcomm platforms: it parses
a qcom,ice-keyslot-map device-tree node that maps each guest_id to a
contiguous physical keyslot range.  Patch 10 adds slot_offset to struct
blk_crypto_profile so that blk_crypto_keyslot_index() returns the
correct physical slot number when the host's ICE range does not start
at slot 0.  Patch 11 extends ufs-qcom to read the host's own slot
reservation from the same DT node and initialize the
blk_crypto_profile accordingly.

Patches 1-4 are technically ready for review.  However, since they
depend on the proposed virtio-blk inline encryption protocol, progress
on these patches is expected to follow consensus on the protocol design.
Feedback on the overall architecture is therefore particularly valuable,
as it will also help advance the associated virtio-spec work.

Patches 5-8 implement the core host-side infrastructure and are
believed ready for review.

Patches 9-11 do not depend on any hypervisor-specific code.  Of them,
patches 9 and 11 provide the Qualcomm platform implementation based
on a static device-tree keyslot mapping; this may be revised in a future
version to use a TZ SCM query interface.

The kernel-internal header declares bcp_hypervisor_ops, which
translates a hypervisor VM fd to an opaque guest_id.  No upstream
implementation is included in this series because the series was
validated on a downstream Qualcomm GVM platform using the Gunyah
hypervisor, which provides a stable per-VM identifier but is not
yet upstream.  KVM does not currently expose an externally-visible
per-VM identifier that a kernel module could use for this purpose.
Input from KVM maintainers on whether and how such an interface
could be added, or whether an alternative identity mechanism is
preferred, would be welcome.

Known limitations
-------
  - Only AES-256-XTS has been tested.
  - virtio_blk_crypto_msg.dun is a fixed __virtio64; the driver refuses
    to enable inline crypto if the device advertises max_dun_bytes > 8 to
    prevent silent IV truncation and reuse.
  - Inline encryption is mutually exclusive with VIRTIO_BLK_F_ZONED.
  - The qcom_ice_slots driver uses a
    global singleton and ignores the blk_crypto_profile argument to its
    callbacks, so multiple storage controllers sharing a single slot table
    are not yet supported.
  - BCP_SUBMIT_IO_BY_VSLOT submits each bio synchronously with
    submit_bio_wait(); concurrent in-flight bios from multiple threads
    sharing one fd are not supported.

Testing
-------
Compilation pass on Linux-next.
End-to-end FBE virtualization with wrapped key enabled was validated
on top of gunyah hypervisor.  wrapped_key_test is a local utility to
get wrapped key and ephemeral wrapped key via storage ioctl interfaces.
  - /data/wrapped_key_test /dev/block/userdata generate
  - /data/wrapped_key_test /dev/block/userdata prepare /data/lt_key.bin
  - /data/fscryptctl insert_wrapped_key < /data/eph_key.bin
  - /data/fscryptctl set_policy --identifier=20f553802e64e36b43469211266a5f1c /data/testing
  - echo "data" > /data/testing/file.txt
  - sync and reboot
  - /data/wrapped_key_test /dev/block/userdata prepare /data/lt_key.bin
  - /data/fscryptctl insert_wrapped_key < /data/eph_key_2.bin
  - /data/fscryptctl set_policy --identifier=d8ca51d6d2094b73b2dae5ee7e3a10b6 /data/testing
  - cat /data/testing/file.txt


linlzhan (11):
  virtio_blk: add inline encryption support
  soc: qcom: add crypto_virt backend for virtio-blk inline crypto
  soc: qcom: crypto_virt: add support for create, prepare and import
    keys
  dt-bindings: soc: qcom: add binding for qcom,crypto-virt
  blk-crypto: add slot-based inline encryption path
  scsi: ufs: core: add slot path to ufshcd_prepare_lrbp_crypto
  blk-crypto: move bio_crypt_dun_increment() to the public header
  block: add /dev/blk-crypto-proxy for host-side virtio-blk inline
    encryption
  soc: qcom: add ICE keyslot partitioning driver for guest VMs
  blk-crypto: add slot_offset to blk_crypto_profile
  scsi: ufs: ufs-qcom: support ICE keyslot partitioning for guest VMs

 .../bindings/soc/qcom/qcom,crypto-virt.yaml   |  39 +
 block/blk-crypto-internal.h                   |   5 +-
 block/blk-crypto-profile.c                    |   7 +-
 block/blk-crypto.c                            |  57 +-
 drivers/block/Kconfig                         |  28 +
 drivers/block/Makefile                        |   3 +
 drivers/block/blk-crypto-proxy.c              | 667 ++++++++++++++++++
 drivers/block/virtio_blk.c                    | 199 +++++-
 drivers/block/virtio_blk_crypto_ext.c         | 283 ++++++++
 drivers/soc/qcom/Kconfig                      |  30 +
 drivers/soc/qcom/Makefile                     |   2 +
 drivers/soc/qcom/crypto_virt.c                | 197 ++++++
 drivers/soc/qcom/qcom_ice_slots.c             | 232 ++++++
 drivers/ufs/core/ufshcd-crypto.h              |  14 +-
 drivers/ufs/host/ufs-qcom.c                   |  91 ++-
 include/linux/blk-crypto-profile.h            |   9 +
 include/linux/blk-crypto-proxy.h              | 100 +++
 include/linux/blk-crypto.h                    |  28 +
 include/linux/virtio_blk_crypto_ext.h         |  78 ++
 include/uapi/linux/blk-crypto-proxy.h         | 122 ++++
 include/uapi/linux/virtio_blk.h               |  62 ++
 21 files changed, 2224 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml
 create mode 100644 drivers/block/blk-crypto-proxy.c
 create mode 100644 drivers/block/virtio_blk_crypto_ext.c
 create mode 100644 drivers/soc/qcom/crypto_virt.c
 create mode 100644 drivers/soc/qcom/qcom_ice_slots.c
 create mode 100644 include/linux/blk-crypto-proxy.h
 create mode 100644 include/linux/virtio_blk_crypto_ext.h
 create mode 100644 include/uapi/linux/blk-crypto-proxy.h

-- 
2.34.1

