Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5989935AC09
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208132; cv=none; b=ZodlkfdKOsM4r0XereJt8XxM63p9CsIuKVyh0d8JqGss6kmT8gh0JaFhd/7m/zsaj6EWnkIyr6BDYyYX0R64yo+9pGPp7urp7wRH7NKXx6qC/ef1nCN7LN48owcBYQbsVxvoGyCmqz0NZByIctUqJtsBd7KGfsFhEn2oq938hgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208132; c=relaxed/simple;
	bh=3i/FrZXVmWI7Atm0YNsVJ226agJdLQqGFQnqYBQUV1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NpHyRgmiSmQ3xFiMDcw8MpF+kwnRfMErCP7e6aLG8Hd/J6ssbG+xEzA0CAM69NNPC/NSdIJmCo9B0+nJd/veyr5d9c2K6kush5VNO/1DJLJzsocEx6FtZkMfJGQR5+dM0V5fUgAMf8Q736ZwI4qqjY700LlcRI+zJ9u6nrNLAg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZNawyG1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hi3yII+w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZNawyG1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hi3yII+w"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C853I63019601
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 10:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R5jHNQqpCxih0uhIATPS5R
	+CswhgM6mi1nkI0T2LCp8=; b=hZNawyG1cAWEXrtAytMyqklfS03eL509lBJneE
	b2VbFNBOd5m5zXDHkmAUqxntKNhlOVwtcx1/mOjxlsRg7zpPNlaHlN8G4bioqCva
	VWbNBG7R6+PnTjBdIj40swU6nbXPGIBGqNv+25uClJFoSFY+FDU6CLkqArHsUDKb
	PDmAOuT86uAAQkJVlLiWSoBY4dxCHcKrVxCAPQMFnIsLVIXvf+LVm6SLJVgiUwpJ
	6rtd9w3vJvA435vbapOsOzEz1p6FCcvCklRYok9IPml02JWekCwv/e+koo+3f8ns
	XcyFWa0RdyEeJ+e1iykMy/GHhUHrkjHRHXBiJ6+sD7CWd2Ew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dgp86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 10:15:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso2094083a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 03:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789208128; x=1789812928; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R5jHNQqpCxih0uhIATPS5R+CswhgM6mi1nkI0T2LCp8=;
        b=Hi3yII+wMTKvV3nJ7Rl0CaibiAzeiHUcZF/sVuscKGOqv1FiciUq1jPI8uKCPtlWJG
         ItV2+pCP7o9H5uN4DLS7BFvRVUzzp3Ji8EXrwWNAxfSNdo5fU+5Be3ozXlCdv8TKWLRO
         9HZS9X9odo4jivFZm0JFC8DA8HJejk8u5Qo/D5mxcy6T5lA1fJTSV7j4klgho6OkYuLP
         LoGRK6LfXyDiLi6hdsNWV74jFZx9WxWikEWyisYoHn14W8phdn8sJnNuPqAMde3hAJkT
         ig+y4F0++plORtsm48912NExuelmBOUUxJtMEmz1AKo/ON6ew0J9DpmncbPcufR83pGs
         ic/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789208128; x=1789812928;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R5jHNQqpCxih0uhIATPS5R+CswhgM6mi1nkI0T2LCp8=;
        b=GBXtgSFQ0hGI2hmgOOJkjnAX7dDVRaF0ngmIOhwIEn5X16/ONUnm+74NJw50aRxVZs
         HetTlI2iuVfvaVg0HuuPtkZFcF+JQDC5PnscxdKEavh136QbBSIvIrrjYyrzHwmYb20+
         Y7qYljhc7Pcx0ick569zvU4Yew3ctIXcCD3G+hMVCXxITixE0DmWibDXNtxBTlt27mPT
         rP8a94PAMBy8WEvpAfaK32/Cgz29CsSrlDRxjRFJw99SmbL5ViYYFWTnFflgh8MpK7mb
         YFIz/okJ6l/2ZwYLCqIPn1VRAjwov/D/IF2KCCCkOTUdCZxHzCE9EbY6UOjyBgwje9BQ
         jHqQ==
X-Gm-Message-State: AFuF++kTmL7jSzeHL21N2uPIFIu4O0HLTZtamuVq2MusebDa5tr13FWJ
	SRVW/EXTOlNqjNW5fhK5feBFbD+uDt16eZ2X/Y3jj/UlslCuT8idVM9Kjd1vqnvFO6qSyTi9d/S
	AVI8nuJGNzpj3E9htxT7Ob9aBjRI/QMiT+Dco5maJiqQy4Dr4oRcVs6vhwGTjqqXGo6s=
X-Gm-Gg: AYBFou12fvuHvxbVJuBivYCCCTBfz/8giVldE7u+pZUX6M4o+Q1wTVeqYFiELl0OUWQ
	uf4CpCqCpYUhpCgLchsFiqGIZ2sBd6NGJjUIxIwTcC3MvY//0ILlTeoBSJ1ZRZKpTK+xvht23t1
	8rQDSjdf/uuHGEaGdZUgvOE7WD3csJdO7P9QkFeisXsxtfxB7QxZVgkDALoVHjoVD2QrxorSABU
	SSrhO0gdopJ/ngA+E/b3yEZtPbIA/IuFNrlBJt4+iv4AlJwMKWSmaoxPjQFmljNBwVmFcvEaRkG
	aJjuuqFUTZFXhVtoElN5KizbLKCMDft6bVGVB/BMtYRRbPxaHJkkppH+15tLr1JNHbyFZK2j4Jv
	i5nXyTKUnoSbeoBcYLGl4KZ8PUtZXkNa7e0Ze5TAyrInDrpeoLpcEMNJjwuI=
X-Received: by 2002:a17:90b:4b83:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39d9bd67a22mr13716499a91.8.1789208127850;
        Sat, 12 Sep 2026 03:15:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4b83:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39d9bd67a22mr13716438a91.8.1789208127398;
        Sat, 12 Sep 2026 03:15:27 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm10340085eec.8.2026.09.12.03.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:15:26 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH RFC 0/5] tee: optee: add RISC-V RPMI TEE transport
Date: Sat, 12 Sep 2026 03:15:11 -0700
Message-Id: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC8mpWoC/x3MMQrDMAxG4asEzRE4KgTatZADdA0ZWvt3qiGpk
 YMpmNy9puMbvlcpwxSZbl0lQ9Gsn73F0Hfk3899BWtoTeJkdNdB2NKmfADcYFEPXi1xQOGXeEg
 cL3AhUuPJEPX7X8/0mO60nOcPQEwISG8AAAA=
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: IFkuvQYigF85LWmrrHjB8kbicr9-2OHF
X-Proofpoint-ORIG-GUID: IFkuvQYigF85LWmrrHjB8kbicr9-2OHF
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa52640 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=MT4jQWGmPZThi4S9qkAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX2pD9O0pI3XXw
 lN1CNa69oqtEDHCaEnAP+H3y3Qeh+D1iONVTLfyEmzD1jM3O6IwYFxXBIIw3qT6GWUoIF4alfGI
 u9koVWxSitiWAx0PMez70cJ66NlFwfA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX43/UYDcmAY2d
 eb0Caeewn14mn49/MLWFnr3EdF3d/RxBgS8ZeMkW9hhepTNWjutr7MhdASdFwKb1au0vAnBKDZD
 JtdsqGRHWOB4R5RA85g0m8AyXu/+JCtiV+vuIhgyX4bEoeCzEqBmk0/k3jNXoZFzI48pEFSxR91
 5PdiI5+Fentc6Qk9qFX3SYe2XLN2mMExiDDbQAntGf7oiMlqTvcuIMjR/ZHnBJj7fQr5mxTD5Tg
 fTqtLmJqyHYV8PRxEavVlzwimBzXkosoU/JbOA6TNhkC9+9cnNH73q6Z0RcmduQD2Co8Ac06PCl
 mZ+Lvy7/E1FxlgAXGzCEnwii3PgGhFE//o3U124K6CSwpbFjCziQgW6edcv7l/bGsL1r8ze2ByI
 83I8bXjULWD1dWDBDIt2sxepm1i+X6rWHVmJhug3brDfY6pkcqM4kUciev+E6AFnZ0XBXKq7zaH
 VTGVvHVqJB6UX+WFrsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120146

This RFC adds initial support for communicating with OP-TEE on RISC-V
using the RPMI TEE service group [1] over the SBI MPXY [2]
mailbox framework.

The intention is to provide a transport for RISC-V systems similar in
purpose to the FF-A transport currently used by OP-TEE on Arm systems.
Linux and OP-TEE act as endpoints of the RPMI TEE service group, while
the RPMI framework in machine-mode firmware mediates communication
between them.

The implementation closely follows the existing OP-TEE FF-A backend in
drivers/tee/optee/ffa_abi.c. Where possible, the same overall design and
lifetime rules are preserved, with FF-A operations mapped to equivalent
RPMI TEE services.

For shared memory, FF-A memory handles are replaced by RPMI memory parcel
identifiers. Linux creates an RPMI memory parcel for shared memory and
makes OP-TEE a receiver of that parcel. The parcel identifier is then
used in OP-TEE message parameters in a similar way to the FF-A global
memory handle.

RPMI TEE_CALL is used as the entry mechanism into OP-TEE, serving a role
similar to the FF-A direct-message path. The request and response contain
a small register-like payload carrying the OP-TEE call information and
state required to resume yielding calls. The existing OP-TEE call queue,
RPC handling and shared-memory infrastructure are reused as much as
possible.

The transport uses one SBI MPXY mailbox channel per hart. A TEE call is
issued using the channel corresponding to the CPU on which the call is
running. This preserves the execution model where entering OP-TEE on a
hart results in secure-world execution associated with that hart.

Shared memory is implemented using RPMI TEE memory parcels. The driver
maintains a mapping between parcel identifiers and struct tee_shm objects
and uses parcel create and reclaim operations to manage the lifetime of
memory shared with OP-TEE.

Asynchronous notifications are implemented using the RPMI TEE signal
bus. The RPMI TEE service group does not provide framework notification
events corresponding directly to the OP-TEE asynchronous notification
mechanism, so the signal bus is used to carry notification values from
OP-TEE to Linux.

This is an early RFC and the implementation is not complete. There may
still be functional bugs, incorrect assumptions, missing pieces, or
interfaces that need to change.

The series is being posted at this stage primarily to get feedback on the
overall architecture and on how the OP-TEE ABI is mapped onto the RPMI
TEE service group.

The implementation deliberately follows the FF-A backend and ffa_abi.c
closely. This allows the existing OP-TEE driver design to be reused and
keeps the RISC-V and FF-A transports as consistent as possible. Some of
these abstractions may need to be adjusted where the RPMI execution,
notification, or memory model differs from FF-A, while others may
eventually be shared between the transports.

[1] https://github.com/riscv-non-isa/riscv-rpmi/commits/main/src/srvgrp-tee.adoc
[2] https://github.com/riscv-non-isa/riscv-sbi-doc/releases

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
Amirreza Zarrabi (5):
      optee: riscv: add RPMI TEE service group transport
      optee: riscv: add shared memory and scheduled calls
      optee: riscv: enable persistent shared argument cache
      optee: riscv: add asynchronous notifications over the signal bus
      dt-bindings: tee: add RISC-V RPMI TEE transport

 .../bindings/tee/riscv,rpmi-mpxy-tee.yaml          |   65 +
 MAINTAINERS                                        |    1 +
 drivers/tee/optee/Makefile                         |    1 +
 drivers/tee/optee/core.c                           |    8 +-
 drivers/tee/optee/optee_private.h                  |   47 +
 drivers/tee/optee/optee_riscv.c                    | 1621 ++++++++++++++++++++
 drivers/tee/optee/optee_riscv.h                    |  334 ++++
 include/linux/mailbox/riscv-rpmi-message.h         |    1 +
 8 files changed, 2076 insertions(+), 2 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260912-rpmi-tee-service-grp-dev-b2ce2f63e0df

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

