Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72D0422556
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651873; cv=none; b=nd/cPLtvS6+W/hO8JjgVN5tJjFjf48UlNDdxkA3ItPx3kP/MSlVd2XcaLTaGaRvAmnM9xFXEE/q+/MSWwB/3yxrGlZlFcn2cucJ6mDwcmKFYJsHrBGp1ITOxVVOoQ2QeYIyS3hFSoDeC6pA2mGIXsa0E0O0GK1rcvTtM0gCVGEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651873; c=relaxed/simple;
	bh=ds2/bSpP2Fxo3x1RHGmhuUeuOy3oLLfjpnD9APeB0Tg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/WQxESiKvYLE9qOiISKT4fsxjSLuFCvTPf0hzpLZkP1jaJV4t0whUQnNWB4RITiHp836f6yVKoTJl1q95EvnJms5COuKX8FL/jepAtMoyIQ5wTjJnI5UeDjqiOQG9/Att0PorhWSg9Vprzqy0wMbi5gDI/htGD018euHvmKmjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pThb0bHf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekznbS/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pThb0bHf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekznbS/V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T1BKCV3278479
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5V+tcV8r7h/bBAiPAxg49R
	LDye23rkCQxQjoFzn0eAY=; b=pThb0bHf0CNLv7kdyhTwajN94O2reA4BP1EvsW
	wZwUocvlVT4ncCLqlYHdnYGofD7urzJlmpuLHXzb35c2kr8ybt3w2JK9WF0Ig0XP
	ap4ZyRxAVm4KND0rIOsLCxZ21YYs12sdp1zj/36OB7NMYfoAwlCa+yIYiITB8d9e
	cb/bSV6zyb7GAEYPaFvDQqidpdhSRYGM4/jEKZXybNVoydywL+f18pWXO91n7jUf
	6i5pAjJu8ayPt8Vrht/wsDrTr5e8qGJGxtgLl3lE4M0zKO92MYIq7TfsTigbazIw
	5/Tm4tbxGcKOxp0FpCt7Y001FFMnqZrSflyQG/aQ+8gmi2Vg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew0bra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:46 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14318be7d79so165616c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 20:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651865; x=1791256665; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5V+tcV8r7h/bBAiPAxg49RLDye23rkCQxQjoFzn0eAY=;
        b=ekznbS/V7sYGfVuXyqx3t218U4eDYR5Av+rPiJUrWVe+Wij3MDb8GDyB2LjohWD9uN
         VLRagkfyO4E0ff4z4tvrJmvZ0/THs3RmDLyS1ThlIQrEAjpSDjzq47dt1u/sBA+y3mgZ
         VNW098zrXIrsm1/gXzV20u7xqUrBSAtFK48Wrod6LbgLFuRP1XWf1Y3K3r58aZqEe8QR
         MTh6u5DuOOeGDpJ342sZiDhhN4/TuTaDqZLKvSqx71y9UloVFFac8UW4FOj/mLfLJnih
         W7OvBYRxHdJE03USNc40tsmUzw/jyRhNknTCDoxVVm3q1UzJ6YC+wlry5822M2urCAsn
         sKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651865; x=1791256665;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5V+tcV8r7h/bBAiPAxg49RLDye23rkCQxQjoFzn0eAY=;
        b=QlPPBG5tbme3eOHytMQ6R0ESD21U/6c+AZoL7RWmjX62Br7PcQKJut1rqUKbqPaPKH
         2LLzwQfc/ZKN8HVSxwjaG/iVPu2Qnw+TSuZjdNdfJIpcEeqQ0ggM2lxQYAS2XUXwPJBO
         5QMd5Dyu+zl3ie+7zJZ3CFsE3OpqxyrIfIOuY0YpL/iGUTPqH60eCsoJnZZzSNmI0TN3
         5VaWyeBsj+N1OaGbj9eW1x1OySfJKF9ccXOoyU9F0y2wmqMgJV+ZBfjisG+wYEnApDQX
         /+9SqKhvEBcriznE9GLh1V0jILot2VgKNrmqq3I0ia4NoHphk4a9GB8SC/CsYsd6EmxL
         3Xjw==
X-Gm-Message-State: AFuF++khO2m64MvX1u5zBJLfL70ICyI0IF2H+ak9ukqd4iohD8k2WKy5
	iwsp5A8ixujSHYvtfODUAC6epmpNR7NNN0ROGyZennAHjoNSE5mx4oJHcByDxJVsOOAzwlTIRRJ
	sFo3HRj7coack2mx1hohvkTtOdVyUy5NAK7NoIcVXJWIiiWeykWjZMWh5wubqxDmSE8w=
X-Gm-Gg: AYBFou0k9VNC4S+A8IDg92vw0TVT+o1XWKLZg8JrYe0fr9xriPvGSXNEXw4fNx81dXA
	eDLTG1TSRNs6bLJncMkCuNQ38rvy5rA1LrWRuQVL9xY1EaQThEY1EFXgOQmQWd6+T3gdhshCHLt
	heHIZQNiEDCvcaj2zASr9LzCUM1Rjmy6AS2Jgz/MvkFr9C9cm1PeXZcTcifqDO9OQ0VfPDmq0ev
	lswkra6TjZ0/xnmoqprBavaG/Gyp2QjafVN7G6s49N8tgG/BsLumtn7hvsolDV7MHefNaIcfpX/
	Eq9Bs1Z8y7P5rq5GawtiEF9BK2QUzZJp5IGvSzVOE4ieQVEcoSM9O7begtZxwba7gF+sEX2YA9W
	kbV/ThWeEOQ0JonoYpGoswIcNg+S6RX8MiCVKx/xj6NvnlUgDF9Yr2UDMBZ0=
X-Received: by 2002:a05:701b:2212:b0:149:ef22:2fa2 with SMTP id a92af1059eb24-149ef223168mr4999982c88.8.1790651865137;
        Mon, 28 Sep 2026 20:17:45 -0700 (PDT)
X-Received: by 2002:a05:701b:2212:b0:149:ef22:2fa2 with SMTP id a92af1059eb24-149ef223168mr4999954c88.8.1790651864531;
        Mon, 28 Sep 2026 20:17:44 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:44 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH RFC 00/10] firmware: riscv: add RPMI TEE service group
 transport
Date: Mon, 28 Sep 2026 20:16:51 -0700
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKMtu2oC/x3MPQqAMAxA4atIZgO1FbGuggdwFYeqUTP4QypFE
 O9ucfyG9x7wJEwequQBocCejz0iSxMYV7cvhDxFg1a6UFaXKOzHgHJujBcRuoGxUIasM0NurIU
 YnkIz3/+0g7apoX/fDzEuc3xpAAAA
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfXydoQhZiD8Ldx
 mza7vU63bFjT3z7PZuJwbaS5/T5QtwG+Nv1ztbvJGabcbIc6xX+PC4jYwhvjFkh6gj+rorSzk/E
 /DRcYUUk/rmahLQRf3h1Slt/4zN1CHY=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb2dda cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=SoDOECYcTc9ExgbA9_YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX/S+UjoD/j2US
 QwGUP4eD/kv4luR13QDjKZ74b4ZeQn9bBoMnJfzHcg+yv9pyHhgQc5BEN9jMu5PrvTTV7HpFbvE
 oESy/ZcKt3BDnVtySmYvudrZCnlAcGJ+lDLVrI/oWD9vVaJz28DluMWdVT1lB9OAZUZCtvGXHtJ
 g1O9/DlFT0nYTDhyEGlA01zC0JxVRt22x5rQM+fnKjk/eOm9jxUWqSIZWOYV4ELH56Jzcz52WIM
 U4aKr5CFvt8J42q6YZ9XtYU02RHntFn7auFpzUVgrBcwDTfNcUZJmNJrsaQpnps2XKciXDFUo52
 69g2LVFEzrgpn5gR5EpNuE8l2aqWE140+Jegqet6kCikJTs9V6K5Q6ppZYl1lhykuIpZhF0jV+7
 Jk4hNMEdpdlV1vPYvxQwI0P3XLX+IhP5XcRW059/hKdxMdudNP21ucHwa2rRGg28WpODwhxPDKR
 js3JjBff6rQZpOt9ekA==
X-Proofpoint-GUID: _ABFyTFCvcXIJzF1PvVh3jEk5YhZjBY_
X-Proofpoint-ORIG-GUID: _ABFyTFCvcXIJzF1PvVh3jEk5YhZjBY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290012

This RFC series adds the RISC-V RPMI TEE service group transport [1],
which provides RISC-V systems a mechanism for Linux to communicate
with TEE endpoints. Linux and a TEE act as endpoints of the RPMI TEE
service group, while the RPMI framework in machine-mode firmware
mediates communication between them over an SBI MPXY [2] mailbox
channel.

The series is layered as follows:

 - Two mailbox patches add a direct synchronous send mode
   (mbox_send_message_sync()) and its implementation for RPMI MPXY
   channels, needed because RPMI TEE requests must complete
   synchronously in the calling context.

 - The RPMI TEE bus registers one device per discovered TEE endpoint
   and service UUID pair, following the device-per-service model,
   so individual service drivers can bind independently.

 - The RPMI TEE transport core binds to the mailbox channel and
   validates the RPMI and TEE service-group versions before any
   discovery or service traffic is attempted.

 - System-information parsing and discovery walk the firmware-provided
   descriptor tables to find physical TEE endpoints and the services
   they expose, registering a bus device for each.

 - Memory parcel operations (lend, share, reclaim) let a consumer
   driver share memory with a TEE endpoint. Linux creates a parcel and
   the parcel identifier is then used by the consumer's own protocol to
   refer to that memory.

 - Signal buses let a consumer driver exchange asynchronous
   notifications with its TEE endpoint in both directions.

This series only establishes the transport, bus, and discovery layer.
A consumer driver - an OP-TEE backend mapped onto these services,
analogous to drivers/tee/optee/ffa_abi.c — is intended to follow in a
later series once this transport is reviewed.

Feedback on the overall architecture, the bus/device model, and the
memory-parcel and signal-bus abstractions is especially welcome at
this stage in this RFC series.

[1] https://github.com/riscv-non-isa/riscv-rpmi/commits/main/src/srvgrp-tee.adoc
[2] https://github.com/riscv-non-isa/riscv-sbi-doc/releases

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
Amirreza Zarrabi (10):
      mailbox: add direct synchronous send support
      mailbox: mpxy: add direct synchronous send
      firmware: add RPMI TEE bus support
      dt-bindings: firmware: add RISC-V RPMI TEE transport
      firmware: add RPMI TEE transport core
      firmware: riscv: rpmi-tee: parse system information tables
      firmware: riscv: rpmi-tee: discover TEE services
      firmware: riscv: rpmi-tee: cache TEE capabilities
      firmware: riscv: rpmi-tee: add memory parcel operations
      firmware: riscv: rpmi-tee: add signal bus support

 .../bindings/firmware/riscv,rpmi-tee.yaml          |   35 +
 drivers/firmware/Kconfig                           |    2 +
 drivers/firmware/Makefile                          |    1 +
 drivers/firmware/riscv_rpmi_tee/Kconfig            |    8 +
 drivers/firmware/riscv_rpmi_tee/Makefile           |    8 +
 drivers/firmware/riscv_rpmi_tee/bus.c              |  202 +++
 drivers/firmware/riscv_rpmi_tee/driver.c           | 1816 ++++++++++++++++++++
 drivers/firmware/riscv_rpmi_tee/sysinfo.c          |  385 +++++
 drivers/firmware/riscv_rpmi_tee/sysinfo.h          |  244 +++
 drivers/mailbox/mailbox.c                          |   72 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c              |  196 ++-
 include/linux/mailbox/riscv-rpmi-message.h         |   13 +
 include/linux/mailbox_client.h                     |    3 +
 include/linux/mailbox_controller.h                 |   10 +
 include/linux/rpmi_tee.h                           |  175 ++
 15 files changed, 3098 insertions(+), 72 deletions(-)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260928-riscv-rpmi-tee-abi-603e9a3b4399

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

