Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1FD2EEE85
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784274633; cv=none; b=N6cNTrOjqCiveJdMmZAJPbrM7Y1vRs+jAv6V0Zg+9UxajeB9ncwWbT5unWnndu44lpMhskgZpDaXSngwoUGcirHoEV6K2P7rm7WMged9+t2AB84Mpaiitc96F6aei5ydvvnb/6P/sikMhSdS4USEiFhid2tSg1sBOJLc7Pv6rpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784274633; c=relaxed/simple;
	bh=Xdkfp38ugvat3pJCk8j4xMKjU5XKiVx7ZIZNl7h8dx8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nn6DiFCaxoTfPf8h7nlFLnpZcbtgodxaXjGY/0nTXgCW9kve+sVAVQL1ZStMRh+hBamPPNVH0B1NgXq6ZSl1VV6QwhrsPjXk8oyahe38+iqBPGU70y4+bpB7EFlAuGDk9GeXAAEZ6nr2p6vHK8hg9pbK/CwQxnbO2qZBsNufalA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jy5kdOed; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xrk+6gtr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jy5kdOed";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xrk+6gtr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cviq662142
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qoCWye4zF7DvPmVEc8L+zJ
	cbMYpCeu0zKGBrwPLIM3o=; b=Jy5kdOedCkEtsPhHOpiC+ekjQXs0SHhVF4LlWA
	3BJlf9DzuCpcp1d2uVz0UcimcKLpB50in4HKzsuhAOnyr341Mf3/AFdXLhpvjtb4
	wM4nxmqvgG7zi/MpB7y5ukIUe89AiMi1bYVv8XzpNASEb9O4OQv59wWXE8mEB5B2
	NGgEPB9TrlzywTOoRrD8tzmHnd8lSRDgwSkahfO6rruk7oLnjSDLAt0JOlDZjFkK
	m/11ozFGMwTARCJKIumpFF5DMWc4qOX5lDoGCEsTd3owGxCY7wJQG5Z6OvWRaAKM
	QuFOjsEF6zL1za4+NPzUDiMmMJLargKL1uNqiODt8vdfJzVg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9kba6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:50:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so11307148a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 00:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784274628; x=1784879428; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qoCWye4zF7DvPmVEc8L+zJcbMYpCeu0zKGBrwPLIM3o=;
        b=Xrk+6gtrMAJpg7lsvrZqaO6f3Pyx+3B+d+qevmncLMQsEe8kdpbJBTc4KdojQt9baZ
         MozSlQWArpV7Bmy52wLtbd8RrTHGYBgbBYzlGkZ2mk8zT58q4Xo0QSihloGPVIKz8st2
         DExFEtAa2CFfl0kmqJMitNIaE4dWTnzoy29fRBqUE6de7rVafnp1LrFnSUMmDcXF0hGn
         FbWbLYRPL5brzxL3ccZGCsWUvrCZC9lHn4NlsLh0OPiZ2nPoVaaNYpCvYfTPgK2dc1+Q
         YrAm5ZX1gUlaiPpmC5mgf2cRnP8bnyCaI/ErggZuxzgzLgmZwiDHzf5AyAEXTnShDmMy
         qZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784274628; x=1784879428;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qoCWye4zF7DvPmVEc8L+zJcbMYpCeu0zKGBrwPLIM3o=;
        b=EViiwZ7qr/BfxCbxgsAI4567xyoUH/b13CFLeY9o7gPJmfymIcCQVPqDWmBePmrVn3
         OjJi6x4+XJ0glvpTVy688Q7Vw5NJ5NI4FW4ihz6FockcCr0VXnA4xDPRkoM7FLceHL+5
         LDicKXmeJqT69rG6uDmqlj6Ybewwkk8GDa08B7lqHBXyVsFRAgL+9Kxl1+UwIiwvKLRY
         Z+6zzQapHCyzIMB+FxIrqiDckM+V4/3ir2zWbrisM8xFg1+hQU8hOXiiBDlKFQArk8uj
         LR08KJyacCa+kkBSp5VVAi5BBRj9hQahorAyxgex097fA0Bm6dX+361T7FeSR6WfhUG5
         OWMQ==
X-Gm-Message-State: AOJu0YwaLusH+CUiTpzlblZ50UHR2dbMjapNkxwaK47dYLO0tO9EfHrb
	4AHsXstSsUridBOiNKAuq3aHniS9G7zxBa4mRbOPNPajlVUqiwCcdFGcu9GHX3HIuiZ/0MMAe6K
	iTaRaLfzNVNQt2nW36c6t31yG2uaw6nv0MaVxNGb1Gh8D4ZowXxf9bKimmh+fX/IS5/ld
X-Gm-Gg: AfdE7ckOpImNffQdaWu5FAyjjTXOxcLYGBDlJ6ZqVKaN+5s+RKJvRaAM9eUC5yrMJKH
	4IGTCoCxcj27wGGbLtld4q5gWMP07DVO+bKJtMKDY5gtjlvL4FFFTEv9y47aox9bKBEKbsdOzEh
	ABR8yuVHoepYuXH1JcQFFITpSz874oG2Wztce/oLmER0ol4PG2avj9gEhk9uzjBRYRaCGPcpOoa
	cDSX0diQkHbouapCTtwxq5pm807D2VwdjVC2p5SD8TVwgbxOygIziJvOTEMXLMymKCax8l7LIGj
	hyfhB6gLQO9lamSw/Nwbxnewx1AsztSctFNvDYM2JOGUMQzB7wreQgs7nZc3EnkQZ8CeRlJjCDd
	n5ySF5x0/Bv1b1Ny1SStzAmwtgTG4
X-Received: by 2002:a05:6a21:6b83:b0:3c3:8222:b8c9 with SMTP id adf61e73a8af0-3c3ada39a49mr1676427637.67.1784274627317;
        Fri, 17 Jul 2026 00:50:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b83:b0:3c3:8222:b8c9 with SMTP id adf61e73a8af0-3c3ada39a49mr1676392637.67.1784274626776;
        Fri, 17 Jul 2026 00:50:26 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517f8f223sm449323a12.9.2026.07.17.00.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:50:26 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Output debug information from RSC
Date: Fri, 17 Jul 2026 13:19:41 +0530
Message-Id: <20260717-rpmh-timeout-debug-v1-v2-0-81ade4fcdb49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJXeWWoC/yXMSwqDMBRG4a3IHfdCErUp3UrpoMZfvQUf5CGCu
 HfTOvwG5+wU4AWBnsVOHqsEmacMcyvIDZ+pB0ubTUaZu7K6Yr+MA0cZMafILZrU86rZPupOae1
 gUVJuF49Otv/39b4cUvOFi78ZHccJ840Yt3kAAAA=
X-Change-ID: 20260714-rpmh-timeout-debug-v1-785f011ce7e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274624; l=4610;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Xdkfp38ugvat3pJCk8j4xMKjU5XKiVx7ZIZNl7h8dx8=;
 b=kBgew6KM0OtpGK6U7ytrhq5wRUXF+DBYaqPjF++ioTozaWqGvDCJ3IG0zQRDm9mYUyXE0aDbT
 Y1eARdFVid8C+e3dTDetzfIZcIwMBf0uq856tVfrYrBNPDEZ5sq8Kgh
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a59dec4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=b93rrwOzcNKONAag-GkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX56gZAquJFTMH
 64XsbY8A5oRZnL11zD+9oEY7sG+VraBokUClueB52jxqrPVT7dm2FggJmV4Qc2WDSkwPMur3LTo
 jjhUDaQBC+JXsj/82gLOFBxMg9Ejt+z2CSu3dUsgWBonIostpHIWFARSDRAdMXRkWxLbUxqJVVb
 tKMB2WXMPhV8HH5Kv6r9Q4Oq3IBHjBe54X3DDWideYhdK/V+gk+/tdeqKvi9TTKzzylXvTGH3az
 2zb1iLdx6Xt1w98MWdVXANnfOR55K0Si/95bE8aSb5136U0J9hnFFH8dHdt4Rhk4E1iuSqCpP7X
 L6vZRnog6Fxz6/WYvwWMnstqs3C90MS6/KYzBlvv4Tdp38lwpybT5dulTGsFff+WQpvt4EIobSe
 lflcrP9/PoqvvCpI51TslPA45+jj8xgqPo3yyYZ+qQap1U6akira13a/dsA7nVTm3JzR/b5N53/
 aHoJiPTdHD29fZXA6Yw==
X-Proofpoint-GUID: -RKKU0dCr-Pio2i0xrOsbGvE-i6O7zmB
X-Proofpoint-ORIG-GUID: -RKKU0dCr-Pio2i0xrOsbGvE-i6O7zmB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX4q6ZWd7LY2He
 LjRXNKaZJgikVEReLDNk9yLKBh7yIrORGp8vdi/iPzzSKuz+az74zwd+nD1LPjTzwisAzyTtE58
 GriKt6bmXdLvjawEiiwsfZJOJPLX83Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170076

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

Patch 3 adds rpmh_rsc_debug() to rpmh-rsc.c and wires it into both
rpmh_write() and rpmh_write_batch() timeout paths. Per-command output
now shows the accelerator type, resource name, whether the command
requires a response, and the decoded TCS command status bits sourced
from the CMD_STATUS_{TRIGGERED,ISSUED,COMPL} definitions:
addr=0x30000(ARC/cx.lvl) resp-required sts=triggered+sent-to-aoss+resp-received.

Example output on timeout:
  [    0.132051] qcom_rpmh Request: tcs-in-use:YES state=2 wait_for_compl=1
  [    0.132057] qcom_rpmh TCS=0 [ctrlr-sts:BUSY amc-mode:0x1010000 irq-sts:WAITING]
  [    0.132082] qcom_rpmh        CMD=0 [addr=0x30000(ARC/cx.lvl) data=0x8 resp-required sts=triggered+sent-to-aoss+resp-received]
  [    0.132098] qcom_rpmh HW IRQ 37 is NOT PENDING at GIC
  [    0.132104] qcom_rpmh Completion is done
  [    0.132108] qcom_rpmh ERROR: Accelerator(s) at AOSS did not respond

Tested on x1e80100-crd (Snapdragon X Elite CRD) with linux-next
next-20260713.

The v1 of the series is at [1]. 

[1] https://lore.kernel.org/linux-arm-msm/1581504972-22632-1-git-send-email-mkshah@codeaurora.org/

---
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
Assisted-by: Claude:claude-sonnet-4-5
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
 drivers/soc/qcom/rpmh.c          |  4 ++
 include/soc/qcom/cmd-db.h        | 10 +++++
 5 files changed, 174 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-rpmh-timeout-debug-v1-785f011ce7e3

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

