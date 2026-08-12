Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B8B330D4C
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515182; cv=none; b=gBLvJxu9Fux4+xsUDw7u7DGT94mRfT4dcLY56jbQ/73S4b+NnEGkk1rNU/tfHMUOBfpcKmBPEzKO4vuGhqDSN18mxeZ4SJBs+6qbTfNpnC6r0nxtMOakRLb2ZAi38RAlbxPRnHuJQD9dsQG2A1kOIal5RtsfxtK4tl5xrZ4CwZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515182; c=relaxed/simple;
	bh=iiutUiHiaGWSNwxTYD70TJeu05S/hOOgh8ZjYce2oxY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kjoNzlKwb8+FZ+ECpqvI83IqK5v9fxl7kd9JNUM6deKdJvEvtgFW4xFXLcvxr+jCp6nEQmVjS3pzbS0ud20dMk4i3ubSb3eVYZUZukIs9NXy2YqmA5Rcj/HfifVVLzMhdJN1h6MK/OH5ES6wdpl6RdnMTJs5u87vZqLZCNl4u/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmRj/kbh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8CEiXhl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmRj/kbh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8CEiXhl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62Qko3288612
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m50sqcoQfJqvY+uX1lL+5E
	1Y2TK9O1zu/HMkE+W40sI=; b=LmRj/kbhtDOomptQsql53/FgH8kntH8RAn+em1
	cNidNluZC4zPXqqSjklF8Groe8We1woj6c/j5nocE3ghoTU6kLKDAndcTUOmEtNA
	hQjyVhg9WKO5dsLkMDDivYAWcSyMd5HhC4e/DbTBIoOVNyquNntWNB3hfngmnZCd
	YIfHjMY1T8LapGU+lH6GctDvFyZEM+4SeJn96RVs31aOIgKYa219WyenSEv/zcqW
	xtv5SHEgDZGuX4mihWCPNwfBOtKbOlrvqb/UnMTHXSP3J/dIpFmqRGyWQalmTURD
	gLze/d3vaNcws5YxRXaVm3+LGm9csGUkV53sWoCJZEJfjb1w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049euqgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:12:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8486c3411c8so988565b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 23:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786515179; x=1787119979; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m50sqcoQfJqvY+uX1lL+5E1Y2TK9O1zu/HMkE+W40sI=;
        b=W8CEiXhlHk6Rwt+4/fShmySgZfDZ8BeEAgxox/lkAXgTEK5z5d9ECdGnbGwTPLzSO0
         8TQqWXgRQrM+xE6NEPex3k4gl2Pd5zdht8GaxWGNJaWRGzXkUK6vmjFtAmeBY0JFOdjx
         FXtZmJ8NVkcU2iek7uxQIWg1gMLS3g0O8+9Sn5ZMgAkg75TWbUMScoQ+AyF2Y/5P6Gs7
         lF+xGCY2qbRsNBTzExv49Trp15kaTsmNNPDbka/YRjuJyo4YXmYsmdwgKFpNiY1uPabg
         yR7I22vl91EkqdHX+Jw0UTAtxWjoLS4qNreahWmHb6mZFJLL3+lDzP3kVEk/LMegpAcR
         l9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786515179; x=1787119979;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m50sqcoQfJqvY+uX1lL+5E1Y2TK9O1zu/HMkE+W40sI=;
        b=iryP2pnhxX8y0V4B8xmgiZV9BSBMguK1X7aw3aIk2A29O4XIoHtRxDLHLjYBzwSsZB
         GedUzq53T1p+4QFPCaiiLQlQjVniQuyBTx6yTKiJ6WX/jwc4uGpnla4pySEngOiWP+GD
         IhTJj4xvLLwlxeUijmet4dL9q0JwnygEgfNXciHh60xn/w8gXcrh4lh2m1Oja7o0Nh7U
         0o7OyiGqds/2elCVRXqsUaW1dIJ0z+0RPeorDuEsUrl+dyDuZ8R+lsW+aIKSwZ1d0n5a
         tzjVO1ZOg3Vp9nrMBIvnzWLsj+XWMGsVphwoVtqlM4qPM8tUVuEAZpGNkq/qZOAtyVus
         u3Hg==
X-Gm-Message-State: AOJu0YzhMJlhacBryTHYItH62kOoua7VKtcqPhgbSZaZA78WCnK/Qzta
	dxA8M4ZqRNOm9dwhb7qUOwfeGxMjH2UtdIWbABK79LhtScRmQ9NZEM7iyNxGltIhyjPLLoYiD2V
	GrkZuyC5oo6KcaSxrg7Bc7aM3uVjg3p4W4RS0SEqPNLGWwk0eT9dhKi/goSPSptGPeVUsBpGCDb
	SD
X-Gm-Gg: AR+sD105EnXzY5FVyUdI+V7G5N9iupbo/gxueNnGpO15zpRXoDmBw+c4x7C0jQR33TE
	AsOXw8appKVGjgb1k0VaMEOvIeDfU+ydaNix0hM/9hxzSHNOzia5iErtQ8mXJb8kJINGdKCJr8z
	JDwnmgSMjWDjpN3aRDpemgTBC4306kFHPTGJlpiCL1Jf2auhcXgOPmYRwsQ9LFp0MOkG53ZuFrv
	AE9FbQvMXw41naSdq5o397DXkDcAcyUHDLLdhHaVq9rKz/e/xfEkJO1RerSC1PBDEURMPKwzVL5
	wHlPpk4maT5iOiTbAROxnJA7GgW6/UCLsKIm3xWsubE3/61qpfmRoAnlCeD6TO1xFs84T+rT+i7
	jmIhCYZYkkjpjtEeRKk280alP90h4
X-Received: by 2002:a05:6a00:3497:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84fb5404a23mr3073265b3a.13.1786515178866;
        Tue, 11 Aug 2026 23:12:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3497:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84fb5404a23mr3073208b3a.13.1786515178009;
        Tue, 11 Aug 2026 23:12:58 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1f2587fsm525814b3a.49.2026.08.11.23.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:12:57 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Output debug information from RSC
Date: Wed, 12 Aug 2026 11:42:21 +0530
Message-Id: <20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMUOfGoC/3WNyw6CMBREf4V07SVtQYuu/A/DAtoL1AjFvqIh/
 LsF49LNJCeZmbMQh1ajI5dsIRajdtpMCYpDRuTQTD2CVokJp/xEBSvBzuMAXo9oggeFbeghMhD
 VsaOMSRRYkLSdLXb6tf/e6i+70N5R+u1sawzaeWPfuzjyrfdziD+OyIFCxRqFZSdVW56vxrn8G
 ZqHNOOYpyD1uq4fts0SXtMAAAA=
X-Change-ID: 20260714-rpmh-timeout-debug-v1-785f011ce7e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786515174; l=4974;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=iiutUiHiaGWSNwxTYD70TJeu05S/hOOgh8ZjYce2oxY=;
 b=LaOIkvtHhTRSMRm5CcDYwss1zi1xsrOolypbwY8Q3uX7KMRijUv8Rb1/HM0PLpWcnb36ShR6d
 E5EzgEd22HaD5TAierkYiPdo7MM9vTHZcOLGCxgxA0zXiUzdDkWG53U
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA0NyBTYWx0ZWRfX6wOVSnAO1ler
 XaGGd0+dp08IxJV2UwDrTvbqXpaT4fr6ncGvufPfxboFjvbnjHZbpHUXpJZL+tijmOUoy/p3s8h
 6kvkK3Youw34oM7B7YGvR4SNrbahnjg=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7c0eeb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=6YaLDFwgscZU8kD0fAMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=pioyyrs4ZptJ924tMmac:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Ew6L2jNXyxP5GAhjIy3VjnG8Jtp07OtU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA0NyBTYWx0ZWRfXwEMmmy4m6WrF
 XlfhNAcL6Ktig1s3td9agODai+pza5QGsukwkTJ75Ydu4nKtH76g/xPyidXoy0krIu2Lozdey+O
 q45mUzBfjiDPEPYM03XPpOKnBtcMinLQ9w05iAgIcZp2p2+02TGsJOLIlIXM+9Tbs2c5YhgLBdB
 ilhP9suQaVAMK/MhHT3G1kww1pATNpJlEOH/Nq6xYyOTAZ+3/VOzYRyick3+F2HabFn3VGIpksd
 Xfwp6Z+30HFTx1z+JDPDMH/kc+HzwD/wYjOVqGEUBg76OAVKYGu+7+zLD0hHUEl70INfvspTC9F
 EYoyS7UWgbss9HICB1vWLOcrQk0WeEsbYLCqIHX6MbaBA3Qv+mkHn34vUckAtVdK3+pPMck96Mr
 RTVQQFkz+yd/zpPC2Xn4Pxdwc8JOSAqJseU8WnOWQpZLYD2z+/aKC7xgYEjCQHQmJ/bpcD1dzWy
 pVHbVtGsQfrNe5Nl1AQ==
X-Proofpoint-GUID: Ew6L2jNXyxP5GAhjIy3VjnG8Jtp07OtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120047

RPMh transfer timeouts are hard to debug — the only indication today
is a WARN_ON() with no record of which TCS was stuck, what resource
it was voting for, or whether AOSS firmware or completion IRQ handling
delay caused the hang.

This series adds structured diagnostics that fire at timeout.

When a timeout occurs today, the only kernel output is a bare warning:

  WARNING: drivers/soc/qcom/rpmh.c:386 rpmh_write_batch+0x190/0x2b0
  Workqueue: events_unbound deferred_probe_work_func
  Call trace:
   rpmh_write_batch+0x190/0x2b0 (P)
   qcom_icc_bcm_voter_commit+0x33c/0x500
   qcom_icc_set+0x20/0x34
   icc_node_add+0xf8/0x118
   qcom_icc_rpmh_probe+0x194/0x540
   platform_probe+0x5c/0xa4

This gives no indication of which TCS was stuck, what resource it was
voting for, or whether AOSS firmware or Linux itself caused the hang.

Patch 1 adds cmd_db_hw_type_str() to cmd-db to decode the accelerator
type (ARC/VRM/BCM) from an RPMh resource address using the existing
SLAVE_ID() encoding. This lives in cmd-db because SLAVE_ID() is a
private macro there and the address encoding is cmd-db's domain.

Patch 2 adds cmd_db_read_name() to cmd-db to reverse-look up the
human-readable resource name (e.g. cx.lvl) from an RPMh address. For
VRM resources, which have up to 4 contiguous addresses per resource,
the match uses VRM_ADDR() on bits [19:4] so any sub-address resolves
to the same name.

Patch 3 adds rpmh_rsc_debug() to rpmh-rsc.c and wires it into the
rpmh_write(), rpmh_write_batch(), and rpmh_read() timeout paths.
Per-command output now shows the accelerator type, resource name,
whether the command requires a response, and the decoded TCS command
status bits sourced from the CMD_STATUS_{TRIGGERED,ISSUED,COMPL}
definitions:
addr=0x30000(ARC/cx.lvl) resp-required sts=triggered+sent-to-aoss+resp-received.

Example output on timeout:
  [    0.132051] qcom_rpmh Request: tcs-in-use:YES state=2 wait_for_compl=1
  [    0.132057] qcom_rpmh TCS=0 [ctrlr-sts:BUSY amc-mode:0x1010000 irq-sts:WAITING]
  [    0.132082] qcom_rpmh        CMD=0 [addr=0x30000(ARC/cx.lvl) data=0x8 resp-required sts=triggered+sent-to-aoss+resp-received]
  [    0.132098] qcom_rpmh HW IRQ 37 is NOT PENDING at GIC
  [    0.132104] qcom_rpmh Completion is done
  [    0.132108] qcom_rpmh ERROR: Accelerator(s) at AOSS did not respond

Tested on x1e80100-crd (Snapdragon X Elite CRD) with linux-next
next-20260811.

The v1 of the series is at [1].

[1] https://lore.kernel.org/linux-arm-msm/1581504972-22632-1-git-send-email-mkshah@codeaurora.org/

---
Changes in v3:
- patch-3 wires rpmh_rsc_debug() to newly added rpmh_read() timeout
- patch-3 moves WARN_ON() within timeout condition
- Add the reviewed-by for patch-1 and patch-2
- Rebase onto linux-next next-20260811
- Link to v2: https://patch.msgid.link/20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com

Changes in v2:
- Drop patch2 change from v1
- Add cmd_db_hw_type_str() to cmd-db for accelerator type decoding
- Add cmd_db_read_name() for reverse address-to-name lookup so that
  per-cmd output shows the resource name instead of resource address
  (e.g. cx.lvl instead of 0x30000)
- Add callers in rpmh_write() and rpmh_write_batch() timeout paths
- Use pr_err() for the opening banner and error conclusion lines;
  pr_warn() for intermediate register dumps
- Read CMD_MSGID register per command and print resp-required or
  fire-n-forget instead of raw hdr= hex value
- Use CMD_STATUS_{TRIGGERED,ISSUED,COMPL} field descriptions for status
  bit strings: triggered, +sent-to-aoss, +resp-received
- Use DONE/WAITING for irq-sts instead of COMPLETED/PENDING
- Rephrase "Possible lockup in Linux" to
  "IRQ pending at GIC but not handled within timeout"
- Add more details in commit text
- Link to v1: https://lore.kernel.org/linux-arm-msm/1581504972-22632-1-git-send-email-mkshah@codeaurora.org/
---

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

---
Maulik Shah (2):
      soc: qcom: cmd-db: export RPMh accelerator type string helper
      soc: qcom: cmd-db: add reverse address-to-name lookup

Raju P.L.S.S.S.N (1):
      soc: qcom: rpmh-rsc: Output debug information from RSC

 drivers/soc/qcom/cmd-db.c        | 65 +++++++++++++++++++++++++++++
 drivers/soc/qcom/rpmh-internal.h |  5 +++
 drivers/soc/qcom/rpmh-rsc.c      | 90 ++++++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/rpmh.c          | 12 +++++-
 include/soc/qcom/cmd-db.h        | 10 +++++
 5 files changed, 181 insertions(+), 1 deletion(-)
---
base-commit: 5e6de6a2b522f659defacb1551d0465ba6ce13cf
change-id: 20260714-rpmh-timeout-debug-v1-785f011ce7e3

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

