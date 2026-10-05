Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F4743CEF6
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191500; cv=none; b=XxzwSRTaNMf6maVrfGnLmVqta8uolUd1RXm/mG/pay2kfVs0ZT2SuGJy1N9QU4XLN8PImGp3ewfQ5GhF2CcLPJGZInf9KPUtbqIywyRLKfxHSpNmt8X4yZERYqk762KGTp94XQw1tWKmSraz0RAgbxA1hq5IDuPOBK+DnjGb4Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191500; c=relaxed/simple;
	bh=Hlf7VSK/qWazQfOke3i7tTTozkSWme1ASg3v22MytQY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ExqQ9vLmksfnoULB0bwN4cLT44lKUbrGzS5W2yGbOORkWzXDxM8ZfUZAFljAnbFzyj/gHKRAKuHh6UTN1AG5JI63xgvKhi0MCCLUvtKnhfpy8kYJyt1aenfn2ksi95xBOSzt+nLpGFBSn7KTAPCemzy8FDGfsg/gAsKHLz91WwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFjZZ1Le; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5wgKlXm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFjZZ1Le";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5wgKlXm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xN5E645955
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 09:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6mFgRoJnrSwP4kpPibBGvb
	GsOL3a0TxVGyvh+x5PVnQ=; b=BFjZZ1LeJhM8KkYekV1HRBUW7VHB30HEdzjl9p
	YiI4njOzKiKKRLc6hdQMineH/AjzK+6i5go/oslziYj5tP907lAl/blqQs+Xkgc9
	OFkN0nSZAQsycaC3AXh28ZQbo0AK3NkzG10KOkxDaKpV5S1zmjzZNKY+mzdgwihQ
	Qx7m6wiq2bl/GuD3hT6ExmfzhqdaI/u4k09/yuu9N8wQ74Gbr1vU1OUsSblD0M8R
	FxuA21WrD6SQNGMsAildblzeg9CCZ7hUWf123PZf7omPY6qPOWAv3rKSbEB9ssHS
	WGaW3bVRVGToPiE5/Qc00wwYPLRE87xZ+9TKHr1iN66q5bXw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08n3a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 09:11:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8883dcc671eso1143169b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 02:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791191497; x=1791796297; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6mFgRoJnrSwP4kpPibBGvbGsOL3a0TxVGyvh+x5PVnQ=;
        b=h5wgKlXm4SkENxMT1/o6yYArQ1r/Etw7s6vZ835U5hP+yHOu8MKUX38AU1wHqxaFrT
         DbOz6CYCOsjvNkIIeEGKc8IvyMsLl4WRHBAioDw87Y0YxQG7IR+9SyX+r6yWrwoiWqSY
         6YZBWS4UUTMWT9KX3zaM+gXfLNJx6aQG7wkTKTsvC1rdaegiwN5b0v/93QJdlQWvIaz2
         jF4MJKIfAcX+gx8p0Wdb3JrRfnZALc2kTtiZ7ikdOzhbV9eSl162Z2G2jap/UWjVtb6G
         raXbj+g/3qfP/mTML6753Y9CCCcRHu033lpsZIMStE4RW8evgfj4B9ilg9VuV47ZClI1
         uOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191497; x=1791796297;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6mFgRoJnrSwP4kpPibBGvbGsOL3a0TxVGyvh+x5PVnQ=;
        b=r64F6sP/FFkpr4b0ij++BRkyaUhZofsEOcCYmEL6H8SQrDqmqzOYIXvTBn+lVY8nE8
         dm0lshoBbIgaqX+N6DrVZR9N480VV5W3q3mljMk/vwFq/Ql0VJFIDB7lcKGyVId7BDs5
         l5Ju7Jpi1V1xeRmnGbNKOsHoNpmkuXkWCZ0xHr3pbUDzIDn7ERpe6a9a5uER8PAhSkcr
         lVt2QGtC1jd+gw4uF+tqlvqAe6nhyNnWi4YVXbbLWbK/K5vsp4lUU4QkG61wlfEcHoCd
         qjm3z7XR24jS6fPUYgUiYyCWS93v+ObLqDY3u/eHDsmbE4XNfSY+CVUX9Cok5t8lFzNk
         /NVw==
X-Gm-Message-State: AFuF++kUoomaTAhQG4rRS04MRmwZjFnmirBpo9kuXCQIhW1mhr6WSuDF
	PCaOscWQV92jeqK/yIsh31ZJAd2H2W7zM73HWkVW8eLXBpqbDFiiWaHWsC0OYwnse0DkAWBvmli
	5zdMuUxK0xBF0kCidX2gJjYod1xMwNnw8g4A2nBKwQl7w43CGmm+WCCUErI7kuo6dioaw
X-Gm-Gg: AYBFou3M2jLK6k/an4RIlBAbsGfclrtOLAyDoSTGxeIlLmaI1AhDlMziLyDvuVu8lKC
	AmTNsEIBHbUvEUrzt4vryXLl7nJgsWgeReGBjoA3WEZkuskBw6dinj7I8q/yAum86P7uy7Ap166
	tMOfqvPzutqWOR+Eg3k4+tDZzHFAQ4jhlDeHBkBl+JFoVPN/BCD8euinh0HggnJ2QAUdHi2rPyJ
	H0fA+2TNxZHPgeDw6eHksHscClaChz38kCC9kByBET6vlknhElrDDkc2tm1nHgfikc4sm+HOfU5
	hHtR3zwPt1bb5gRUJcdlvLPy2dtl1WBzckuYRK9AcutCmyCfLMoTlZ8ds+DWekU3UpkGt7YWOgs
	uMAwvrjmMGCykTp+juaP6W+KTStCZ
X-Received: by 2002:a05:6a20:748d:b0:3dd:a00a:c5b3 with SMTP id adf61e73a8af0-3e0d6ceb5d0mr6259339637.38.1791191497043;
        Mon, 05 Oct 2026 02:11:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:748d:b0:3dd:a00a:c5b3 with SMTP id adf61e73a8af0-3e0d6ceb5d0mr6259316637.38.1791191496588;
        Mon, 05 Oct 2026 02:11:36 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d8ffc38sm497262a12.15.2026.10.05.02.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:11:36 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Output debug information from RSC
Date: Mon, 05 Oct 2026 14:41:25 +0530
Message-Id: <20261005-rpmh-timeout-debug-v1-v5-0-7b9c457a191c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL1pw2oC/3XNTQ7CIBAF4KsY1tIwQP9ceQ/jgsLUYmxRaInG9
 O5SjXFjN5O85M33niSgtxjIbvMkHqMN1g0p5NsN0Z0aTkitSZlwxgtWgqT+2nd0tD26aaQGm+l
 EI9CyylsGoLFEQdLv1WNr72/3cPzkMDVn1OOCLY3OhtH5x3s48qX33ShXNiKnjFagDMpWm0bWe
 xdCdpvURbu+z9Ihy1QUP6wCvoaJhBWVZkoyo5GLFUz+sBrEGiYThrU0AiUUqOAPNs/zCxrXLrh
 tAQAA
X-Change-ID: 20260714-rpmh-timeout-debug-v1-785f011ce7e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791191492; l=6029;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Hlf7VSK/qWazQfOke3i7tTTozkSWme1ASg3v22MytQY=;
 b=XLQxVmEa/AaDJvl1S5kil0yfEQZtNHO34bV4zcZJzvt6b5xNeQFhXVA/J1PI8eBk/PSz8c9dh
 66ik7fwoZRoAFVmbdu9ZE3wlt8mQ2jXEUScpJJ9nJXx4/EoeQYIniQk
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: Gi7Klay8SDfCDN5Bp7jaq4y6_3BaXO29
X-Proofpoint-GUID: Gi7Klay8SDfCDN5Bp7jaq4y6_3BaXO29
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac369c9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=Yhf029J9D-hL87zQiO0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=pioyyrs4ZptJ924tMmac:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfXwRnO3u5Pn8Fx
 Wz7ESa2bQw18kCGW3s9VPAMrXqwOCMZWRQWZN2Vs9GDOWZJnAEbw5mnsDVjrEf5I3StYuhTLClY
 4rwUr7ZFIIlWbv5yPs2rXyNqVES+bXc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfXwCQfAYI8GupM
 eex0NNNwn49a/jzMA0tNPMtvkJbQT6iF+H1Xgjlw+gdA/ItrDhJFkgkX9wa824s0deyCGMRJMkk
 JA1neucP/cbyn9IXOLvLmAsUd/YvNzgPh+taEfb2gqhqSRphjvacz93HtiOG3GvEIdpYhSOT56I
 EtbFQpa01B4K1j8/RkAVw0K1KnyC/gQhQVlhe/Lxlw87zfGGBHbeCKkKeTn9blWpmpnOJzsej+g
 rlZoKZyTj/UUivQq/MDXzr5CGpA4UPDobFjCPUV0gLhQuASawL7mRxBwhQS8Cuu7tjJl/zV3sEI
 QVSW2a5kkXIL7xrEvNjyo6yT/d/5mk5jVzw6HDAnjrnm177sELMJtCeRtmotLm8XkVJbw/381S9
 LPy+vVOna0upvHaB555gUN4tLEQZiKeRVQaZBzEAoRG9/StXi+Bof8erZdzg5GAx5hHvaBzzNpl
 06HDtNAE9rTuoyofISA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050036

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
  [    0.132108] qcom_rpmh Accelerator(s) at AOSS did not respond

Tested on x1e80100-crd (Snapdragon X Elite CRD) with linux-next
next-20260811.

The v1 of the series is at [1].

[1] https://lore.kernel.org/linux-arm-msm/1581504972-22632-1-git-send-email-mkshah@codeaurora.org/

---
Changes in v5:
- Accumulate AOSS IRQ status across all dumped TCSes instead of
  overwriting it with the status of the last TCS in patch 3.
- Print "unknown" when cmd_db_read_name() fails, avoiding uninitialized
  or stale resource names in patch 3.
- Handle irq_get_irqchip_state() failures in patch 3: print UNKNOWN for
  the GIC pending state, retain the completion status output, and report
  the error code instead of drawing a timeout diagnosis from an invalid
  IRQ status.
- Remove redundant ERROR: prefixes from dev_err() messages in patch 3
  and update the example output accordingly.
- Link to v4: https://patch.msgid.link/20260913-rpmh-timeout-debug-v1-v4-0-e94d3e416ea1@oss.qualcomm.com

Changes in v4:
- Use dev_foo() instead of pr_foo() in patch-3
- Use str_yes_no() in patch-3
- Update Timeout print in patch-3
- Update rpmh_read(): kernel doc to use rpmh_read() - format in patch-3
- Link to v3: https://patch.msgid.link/20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com

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
To: Abel Vesa <abelvesa@kernel.org>
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

 drivers/soc/qcom/cmd-db.c        |  65 +++++++++++++++++++++++++
 drivers/soc/qcom/rpmh-internal.h |   5 ++
 drivers/soc/qcom/rpmh-rsc.c      | 100 +++++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/rpmh.c          |  14 +++++-
 include/soc/qcom/cmd-db.h        |  10 ++++
 5 files changed, 192 insertions(+), 2 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260714-rpmh-timeout-debug-v1-785f011ce7e3

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

