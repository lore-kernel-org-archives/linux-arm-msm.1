Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2673DDAFE
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 02:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094404; cv=none; b=BZNq3Jv4Ksxb7QI+1u9WNZu/LU9jMZSD3pGgn4CSgVmWH04EiuDStWLVM1tJm/F2RB64nunNrrHl/gcVbNpduchrR0yrhngynJWI/MBtv+wBqrHgcqhMGPbA8PqsbfNg3St0oF+dxiJVTPRImDNC91MzkII6ewHLzswgCWROj74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094404; c=relaxed/simple;
	bh=JdeyxLKm3z51enqh6IQpT4fiCuVV6Nsi8TE2vt9eEus=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qvK184mR4dEIaWO21DsHhegIdpKiVKNSfSX1ei8HN6b20Ki9XQG41Ek7nlkyIzewB70Pc0PN+VZNy7ifjWPQ+jlUrmlTPn5nzx1iK9t1VJVgzEhQb9bLoo/D+zrxoKIQrfAZp3NLCE0EyT/xeJPFRXw5nxOiCorZtoty8+POoRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVuo2hy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3My/3fv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVuo2hy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3My/3fv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B12Htu1916251
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 02:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gmcYueUYUzUniqPCLBhx0d
	LD0mz0L232i2G5Xjk/FAE=; b=DVuo2hy3Tis6UAHe10+7Yzt9OjQqPNC1imRTd5
	maOq8hXIcVve1PAZOEroauhugLWKD5WdWnlelRlQ9hvNvp5fkUC28SIVLp8vECbb
	j5da7ZbIxngcmb8FN7enomlPdaOPI6GPEZOxiLMDkYz3OW8JEsVYbk76FcIOsTfu
	r54YOPyoX74muPzJlgbVpgCMA368GZLhM9+26o+qjDuwxwSljuHUDcFk8to+DOVL
	Uos+MOwJ8Kod+yreoxwMT0KarlUObE87ysJCi5ScX+IMfm2bi4Yi5AN6LB4OzhPn
	UmuVBMefxXHane6sWfvz5FOt7n79zJXaJ6LejpraEhZsXeXg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729ge4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 02:40:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so701152a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 19:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789094402; x=1789699202; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gmcYueUYUzUniqPCLBhx0dLD0mz0L232i2G5Xjk/FAE=;
        b=I3My/3fvWf9CcSwDzzdbvlSuzUR4cyma15T9li+cOkMEFCd7dib9AMf+ybc3T9dPBy
         D5MhzIRvf5q6LGpiTdYblwQm55hkfGkHQET60Vx/sbi2SEGuaEOAQ8r8RaxP5Nq0daif
         jG0CFQV5GuNeesHAfUyMQdWQhrvE8A/pgk4j1evN2RLKWzN32McVklkQNEO68fCQAiSf
         6GGu0KZf6i/7C+2cAm7q0yFvJ9BxIaLPrOyftNC3RlmXFsi5rYFx4NGBtF+S2RYJ4aEC
         E86tJEpOy0lbny7VgoGNRyZ0O7lTpaJQyrHydgHtYs6LfXynLNB1sOKVAEfJV4r38Tqj
         lVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789094402; x=1789699202;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gmcYueUYUzUniqPCLBhx0dLD0mz0L232i2G5Xjk/FAE=;
        b=kbsGZaS6TNf1TD5fwbIn0onxGVvGMmxAEWI9ibMm0P33dVxLGu9PQe5Ngu/5tCGoUG
         +0CBLpyaG+0PikfUTyCt8p9Rifu9M5Ns6HyKVGP6m7qWh5v4mdC5E0KYt9MaIvm0QTzT
         5Shy7EhXJauZL1mXH/Ax47nVoliCqpF3zGKDgHs5WEsxHL208n8EVhOxPHk9P2v6eqQ9
         DT94xjjINoxirut0FU/l0vfxmvL6Px+EEAL8msXTbJvb0kfSkQt/+3JBWk6dkbDpyzc/
         DSBY3TgAEmR5um45/Thz0v2AakqfflonDV1+rTDZdh6/a9AoJIYN1cTlYmvKcvblcliS
         NJoA==
X-Forwarded-Encrypted: i=1; AKwUvBzj3otB5V4EhfJNoq8euMGf2gygCCnbp1GL5jgDZDfjdswaQEJPJ5qv50M+JU5YRXeZCgYL8G1PvDCy0w2X@vger.kernel.org
X-Gm-Message-State: AFuF++k8KOjmg88ysSk5M5wsyEdnOkN44yr3UeGI0sOdU9q5fDYBA/Yd
	oL/Ef8VmtTD/fX/d/zMRPAa76FbhbhB7Rd8wAzraP6GtlGk6qMwBgF7IsCTA0V3Mm4ib45menVw
	zjsJW7znPsxKQgEBV57s+uuIusAqIaRacjYQH43WILf6f61LsLfXtZm9inuaqBusIrSNa5NfKTg
	rk
X-Gm-Gg: AYBFou3nlFrhPfZIjHJAtqFcqbrZGcH+e/2BVpfshPIlIpn/CJ1uGEqyKHvijCbAyjt
	54OAg7sPhmWk+XnNJnOriRl1inPJIM4RxlIPjdYJST1gM/Pn2w84kexB4ZvWqu6oqaM6jDhCsbw
	9fgevW+0mqCozRMTWtRNc3o0CjQekgZ/mnkzyinPZR8pzJdCVBtvKAdyDnzLgEITbUaXFZQ7XQO
	uhh3z9j7WGrs9wjiIf2WlQ5nHMy9srKsGl9zqemJXYw/NvZGdtsBL7G91dqYAjD/HzDk833qN39
	hxUVyH2wlPDElvh42ZLLpR3vFQkUktZi3GXZ0+XdeoGqmnxereWlx+ni6Cz5tePtAIF62IjqX3+
	gg+NIDrkMF8rzJ8RakZPmKCliNt9UBc8=
X-Received: by 2002:a05:6a21:1014:b0:3da:ebec:69c1 with SMTP id adf61e73a8af0-3daed3db08emr3724634637.24.1789094401695;
        Thu, 10 Sep 2026 19:40:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:1014:b0:3da:ebec:69c1 with SMTP id adf61e73a8af0-3daed3db08emr3724575637.24.1789094401271;
        Thu, 10 Sep 2026 19:40:01 -0700 (PDT)
Received: from hu-renjiang-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e95075sm2094481eec.11.2026.09.10.19.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:40:00 -0700 (PDT)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add firmware debug logging support for the qcom
 Iris driver
Date: Fri, 11 Sep 2026 08:09:48 +0530
Message-Id: <20260911-media-qcom-iris-fw-log-v2-0-6c46288f3ffb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPRpo2oC/4WOQW7DIBBFrxKx7kRAwEBXvUeVxYDHyUhxqMFxU
 kW+e4lzgG5G+vM1b95TVCpMVXzunqLQwpXztQX9sRPpjNcTAfctCy11J72yMFLPCFPKI3DhCsM
 dLvkEh9jp6Dtjo0PRjn8KDfzYwN/Hdy403Rp/fi9FxErQMCPP7Z/vpdI0RHPQbgjJ2d6SNBpdC
 ooCWtNKDF68WGeucy6/m/OiNth/eosCBcmjkxSl9yZ85Vr30w0vL4N9G+K4rusfKKbGLg8BAAA
 =
X-Change-ID: 20260815-media-qcom-iris-fw-log-3b62b8645b7a
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789094397; l=3283;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=JdeyxLKm3z51enqh6IQpT4fiCuVV6Nsi8TE2vt9eEus=;
 b=C6bPxvTO+dQZ5ZJ/0yGMjvE/WcT1JRCm4vnvwLuwyTyyh+IaD46GL5XL/HQiw6r7QQMERzfuC
 V6Fv1whsf/yA/xyD8MCQYE7hl43hN3x91U5m+/eM3+G7+0tKIdU26T7
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDAzMyBTYWx0ZWRfX9xs9dXT6NJa/
 7t8BGhiOb60eBCa8ryWi9HTY9o8J7Z6pkzCG5TFmW0obHuOntJJolQixNIuZBAUZJoAOjgVc1Fa
 hmUKnECzuZPDj40JsZkcpedSDWip5NA=
X-Proofpoint-GUID: SjGOW20UJ2rAQlGWNkbmz4xoX3_YoRRS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDAzMyBTYWx0ZWRfX526YY4kPLW2V
 XkAyYckvE0t1QV9yFcUaceisrPN8BDZ9p83fy+z/m6ehxfkE2rGvBdWfkA57fM0syis4VBFS4fH
 C7/RSyoU1sDCudQFp76SrwFrjGrV8zVXd3SLMGAO5AWH+hIT2CgRh6iuS5Szbwb8lDA5Y9591cZ
 p6gqcgW5/h4E9w7DpiT+kYLQub+mSWW1AZ6zaYldjXweRUTLTrUwKBaFCVdC2sqht5EunuCsHWE
 W9HqxaIpUJ10cN/eIbIu3eVAU7+9gD/NQ63oNJYaf8pnidObez5HqA3+8X66tNHQSM0s9kbEUQd
 FtiNs8sKkziz6Ni80qhjjXsHNwFmpwVnXSUXVuu54LxG4L/GxvAj9jQtFGnzPVJAChk6MMd2qbz
 Foka0cKRKtlwAqhBU72q+Td4Q3knuYC6CqVTD0o1pukFiV7ybjj/rLa0SFottguUlt+CTVBfEc3
 3Uj/RvhgIPCrB1aXM9g==
X-Proofpoint-ORIG-GUID: SjGOW20UJ2rAQlGWNkbmz4xoX3_YoRRS
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa36a02 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vBuUH1DVfrQNvPyK4OsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110033

The driver currently has no way to configure firmware debug
logging at runtime. This makes firmware-side issues harder to
debug, because changing the firmware debug mask requires a
rebuild or reload.

The patch adds a debugfs fw_level file under the Iris debugfs
directory. The value is stored per Iris core and is normalized
on write, so userspace reads back the same mask that is
programmed to firmware.

The firmware debug configuration is sent during core
initialization and before opening a new session. This allows a
fw_level value written before a session starts to take effect for
that session.

HFI Gen1 and Gen2 paths are added for programming the debug
configuration and reading firmware debug messages from the debug
queue. Firmware error and fatal messages are printed with
dev_err_ratelimited(), while other firmware messages use
dev_dbg().

The default mask enables only firmware error and fatal messages
to avoid enabling verbose firmware logging by default.

Failure to configure firmware debug logging is treated as non-fatal
and does not block normal video operation.

Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
Changes in v2:
- 1. Increase response timeout for verbose firmware logging.
- 2. Increase runtime PM autosuspend delay for verbose firmware logging.
- 3. Drain message and debug queues until both queues are empty.
- 4. Fix checkpatch alignment warning in iris_hfi_common.c.
- 5. Drop direct iris_hfi_common.h includes from response files.
- 6. Keep bounded firmware log printing with %.*s.
- Link to v1: https://lore.kernel.org/r/20260815-media-qcom-iris-fw-log-v1-1-c8a70eb08849@oss.qualcomm.com

---
Renjiang Han (2):
      media: qcom: iris: add firmware debug logging support
      media: qcom: iris: reduce impact of verbose firmware logging

 drivers/media/platform/qcom/iris/Makefile          |  1 +
 drivers/media/platform/qcom/iris/iris_core.c       |  2 +-
 drivers/media/platform/qcom/iris/iris_core.h       |  9 +++-
 drivers/media/platform/qcom/iris/iris_debugfs.c    | 56 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_debugfs.h    | 14 ++++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 43 +++++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_common.h | 11 +++++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 30 ++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  8 ++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 55 ++++++++++++++++-----
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 21 ++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  3 ++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 29 +++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 36 ++++++++++----
 drivers/media/platform/qcom/iris/iris_probe.c      |  7 +++
 drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |  7 ++-
 18 files changed, 311 insertions(+), 26 deletions(-)
---
base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
change-id: 20260815-media-qcom-iris-fw-log-3b62b8645b7a

Best regards,
-- 
Renjiang Han <renjiang.han@oss.qualcomm.com>

