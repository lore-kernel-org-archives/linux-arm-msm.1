Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E964F96D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779950; cv=none; b=MzyufBiDbPG4N+gDa1hi6gr48HyLVySFyZadGMNgZFm1XBVhO4KkoP6tSJQJvRGc+jfTAf9LJDjTUSYaGuzHCQBHIgmreOeqxacEx6jLn3fpC4LBAmno1fe0uvw+nqQ7xBOFiy36rKSuYHNPstBy3kmn55ID+IX8dWTSizkY5ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779950; c=relaxed/simple;
	bh=9cXLQQHKl6yEKaTCBAgfXYVQ5NuyFBWmetQmFW80k6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IBnL2s0C4wQqA9RNNCwQaU1NdRtYBRw7f+LygVM44Zf4AUc6E7SdK8TRMvswXJoPZKF+ODHrVxWM14vpU70jrnfZ6l71pp4eCQGWhGO1PjEsCXMAwEJ1wpl4Jp+32xTT0kNDt/8oSQs+CrVLy5EdYdW1thT9z56hCAfE8NhLnVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4vmgpR+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlV9kU1i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4vmgpR+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PlV9kU1i"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE07JZ4178834
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xm8ZEn8ghmOcAG3oNkRt/e9q/WbJ/MPAnge
	ljbhU5zk=; b=g4vmgpR+Wv07QF4yjUx3TTAZx5u3STyLEcb+kOa7MSOFCac/7mS
	PBph/bxk3J8/oY00Is2fhhNR7Zk2JKpHWvQ3uE85tVrNvM8CfFKkT89kOhdf/xKv
	ORFvzE4LkDRydyo/LoN4hI44GNmZcriByZHEEI3LsfqRb+JPhn7ol8we51zLukeV
	w2q7Xt6P7OUlNufe2GoXgbNEiOINH78xsHsavpU1r2w9Ks8tmH9tACzJxm5w7GpD
	1RIA+aS/kQq7ExbmuroVz/tZ9CiD/h8Q04nHETLEOm4sa/o9V1IN22pOb6lTH5OK
	a/2RtiCDrlSYOhj3/meKR1niJOq3NgPwG4Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3m028-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34d49d8dee1so463371eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 07:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790779940; x=1791384740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xm8ZEn8ghmOcAG3oNkRt/e9q/WbJ/MPAngeljbhU5zk=;
        b=PlV9kU1iaBRQesYC3WrtcmAV+VXaPFJJaIwVSv+uKHVIm0AWhTSAwaXMw+szEb97le
         2V6ayCRnR83Z855T4PHPiw7WfhfAwnvr0FV4O2xlw1E4qqA69B16XRVzReIpicnVHMho
         vVcKCa3EH1sPMioNGkyWg+VIngy+tttk+Aow6zNshpRE3pumtlLXpI9f0XqSuEv45Y/E
         pt87MOpcFc6UpDvQHKoPBfTD/hOvv/n9t69gRNXA+J2Laq1a+sbefeMbXf9z/4BkPRV3
         E27ZUaZJ6bZUCDeJ1oC3SNMjQZ62Ta/M07O8TZy/fYmZyt7IJXv49VWtbxSqJ4y+BDdA
         T+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779940; x=1791384740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xm8ZEn8ghmOcAG3oNkRt/e9q/WbJ/MPAngeljbhU5zk=;
        b=cdy84YdetojYXzmlbAYTojWSTSa/FMLqMUhiGWhgutJBOaHH7ksNTF4BO5ynlVcCHH
         uLWcN5eowDzNvNACjJ80FeA68mmQCGAzAR65ttqah3+OaU+F7C8151k7qFhyJAnZ8X6N
         WuSKKAV6Gt3ZfAwabIP9TKbhD4JxeM9WkR0uZVsTR3F18Nj58xGExpu6Agc9GyT5dGTR
         u7jl7WBrW74y/ufAy8fQhnUrYsnOcZMw5Cuqm8RgCAA/traJF+gFViZXubl/8Q6NTz+u
         efiDXah6o5LXFSLrLQ2fbSGx2d4NjimyTlotK7G6ceLxySMspWkkWI9gXPxjLQvMZHg+
         hw+Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/pEFFaIRJGQ8ghAvJl37AsRUdsowOuNw18y+CUZZcjwmpkgyU5KKVZ1Wyo1IzHMxDVtJxvhjYupfYDqki@vger.kernel.org
X-Gm-Message-State: AFq9FYJf+hvHfGAN5h8OC1Z4DSJc3sVbJ/M5rbo4xKvJhMxvCTm1X75x
	vM2HaHFPrUke5+Pxd++UgRFWJeTlMOKVIftQj/OQOZTkCRwdNFnq/j4eB8SNHqqXYuRR5UWV3jc
	UUQf0MVggz3ifo956IZqjj4O1qDgql7ibfDYHp7Bsq2lShk4B61RrdK+O9vkIOnwT2ybk
X-Gm-Gg: AYBFou0JT2qQ92wpW3FnY/EydeCzX5voGFk90SlpUInO+a9I/I7+6d+VdYRIDuW69FC
	Fd3kTajrIsngw8hbJQVOl/qyC1x+xMZ8jCt9iquyk01YIj/oNw7LoYaiTdZcDECrTXFQqlDvn7h
	iNyq6Zm54D2Uq83LJaX9X2vRKc8LuqthauCrb0nDFEpIflugQSul3wo1iNqig0GcsCVfeqYI69r
	JbYaiEEz8WIliDxHTSU4cTTl4Ig0gpbQUhpPT0ZJKCYysPDEJcDDSkcFXBLmPOjJPq7igglmCwZ
	HtRq60we38EvXlkpwO9WtyRj+QPplQjbP3p663lGJFt7RbtQk6QkWD7Sb9Pe/k4tmWPhqQXp4ft
	S9QTAxBEpNoEE429uyduCJwgkJnDKw9JlnHqz1xfZ3V8iXX0GQRdP79Q=
X-Received: by 2002:a05:7301:fc84:b0:34b:a328:c28 with SMTP id 5a478bee46e88-34cd9177b73mr1684539eec.5.1790779939771;
        Wed, 30 Sep 2026 07:52:19 -0700 (PDT)
X-Received: by 2002:a05:7301:fc84:b0:34b:a328:c28 with SMTP id 5a478bee46e88-34cd9177b73mr1684502eec.5.1790779939129;
        Wed, 30 Sep 2026 07:52:19 -0700 (PDT)
Received: from hu-c-gdjako-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5639339sm4524609eec.18.2026.09.30.07.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:52:18 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org
Cc: axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
Subject: [PATCH 0/6] soc: qcom: Add Qualcomm Page Compression Engine (QPaCE) driver
Date: Wed, 30 Sep 2026 07:52:09 -0700
Message-Id: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7ksl5U5x4r41kxO4I8bX2s1nVsFIfGSh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX2+Ii7FtUGqYO
 sNUgyWwAPha64djrrI9+wb+ScefVf743k7yBvi1kYsF4wBWm8h/duKDcgXFlgtQW265UwrIUL/q
 C8axzGTxM+GxU+ZNwrh92F+TVg0oisc2yS6VGj5YS8qvl9WhkjsS7orxRiFaDRO37axmJULQwfK
 mjZjSi8N27g9Centb/9HgAjwB2GxBOWJ9f/Xr4gm+NxTYe7jAeH7ZbIwSIu16lL5RakSrtVx9QO
 bCenax2OvtQM7qdRk9Xntfp/Q05dt6k3TyX1rb2E1pbNClC66BqErOxew92hJYr6vhJ29nnAgyS
 0Q9adxDkzV/C+vPn5WS6aEl6RtGAST1byLyw/XXHqpMer65CSqkBZo0VPOR3LlKO24mYmWfM1gc
 eCTJWfNiqK6zvMe4gFuzgzHEKZzrRGmfYn44mOJX2DFEdAKBC7jp496SddEerq/VvqvsXoZpo0u
 7vB7fOmeL6in1imkPJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX9fAd6p2l7AZU
 70qmqFGpTp03H0Xp4xeA00RndQ6I/VCPFPt/m4pe/SWAHGKWCJHqEJxE2WMZ+CDuhkKGm0kiwFB
 AVLruu/HfrhESqyQCExGGK1uEdcJ8lU=
X-Proofpoint-GUID: 7ksl5U5x4r41kxO4I8bX2s1nVsFIfGSh
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abd2224 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oM0TwoE6PClt58MffhQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300059

QPaCE (Qualcomm Page Compression Engine) is a hardware block found on
Qualcomm SoCs that accelerates page compression and decompression for
use with the zram block device. It is composed of multiple compression,
decompression, and copy engines.

This series uses QPaCE's "urgent" (synchronous) path, intended for low-
latency single-page operations. A command is issued by writing the
source and destination DMA addresses to one of several per-CPU urgent
command registers with a single store; completion is then detected by
polling the command's status register.

The hardware also provides a ring-based (asynchronous) path for high-
throughput batched compression, where transfer and event rings allow
multiple descriptors to be queued and submitted with a single doorbell
write, with completion signalled via an interrupt. This path is not
implemented in this series.

The driver integrates with zram through a new "qpace-lz4" zcomp backend.
Both compression and decompression are performed by the QPaCE hardware
via the urgent synchronous path: each request DMA-maps the source and
destination buffers, issues a blocking hardware command, and returns the
result size.

The driver also integrates with the Qualcomm Last Level Cache Controller
(LLCC) to activate dedicated cache slices for compression and decompression
data.

This is validated on next-20260929 with the following patch applied on
top to allow booting completely to the serial console:
https://lore.kernel.org/all/20260911-rsc_read-v2-1-98675c248278@oss.qualcomm.com/

Georgi Djakov (6):
  dt-bindings: soc: qcom: Add QPaCE binding
  soc: qcom: qpace: Add Qualcomm Page Compression Engine driver
  trace: qpace: Add tracepoints for QPaCE operations
  zram: Add QPaCE zcomp backend
  soc: qcom: qpace: Add LLCC slice support
  arm64: dts: qcom: hawi: Add QPaCE DT node

 .../bindings/soc/qcom/qcom,hawi-qpace.yaml    |  94 ++
 arch/arm64/boot/dts/qcom/hawi.dtsi            |  17 +
 drivers/block/zram/Kconfig                    |  11 +
 drivers/block/zram/Makefile                   |   1 +
 drivers/block/zram/backend_qpace.c            | 134 +++
 drivers/block/zram/backend_qpace.h            |  13 +
 drivers/block/zram/zcomp.c                    |  11 +-
 drivers/soc/qcom/Kconfig                      |  14 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/qpace.c                      | 830 ++++++++++++++++++
 drivers/soc/qcom/qpace_internal.h             |  84 ++
 include/linux/soc/qcom/llcc-qcom.h            |   2 +
 include/linux/soc/qcom/qpace.h                | 154 ++++
 include/trace/events/qpace.h                  |  99 +++
 14 files changed, 1463 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,hawi-qpace.yaml
 create mode 100644 drivers/block/zram/backend_qpace.c
 create mode 100644 drivers/block/zram/backend_qpace.h
 create mode 100644 drivers/soc/qcom/qpace.c
 create mode 100644 drivers/soc/qcom/qpace_internal.h
 create mode 100644 include/linux/soc/qcom/qpace.h
 create mode 100644 include/trace/events/qpace.h

