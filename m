Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D514F4AA1EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829095; cv=none; b=SQDrTGXfPZ7DZ7JFdBSWBNPdDsIbe4cFebqKlfrLmTx9+3wglZH3KaJ367R/YwquswCH4DWmNbOLy6xKBlAUmYZ/iY4EEfzJ2a+1k2U8QEPTAWyUD5AzwwkJGc6wZR6z3IAWSTBQcvX7piQoFsM7Lmpe6eP+sf7xZZpzbttPN6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829095; c=relaxed/simple;
	bh=qQxpGCkmBrmToTnrtmzbPTnehdVr0DjcnfRo6PenOlw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ix9HgFNBWLIXz9W19cKKuTFdR3jFF9GciWGWSvLt13rW1iv+Jv4poUd65BpLcFmnUPxGGn1L8Lgos8yV90m1SC3Gg7EbRHCw5M9CzsAn0431uecph1L0zietMaaCez+voNDAOp/ONKwVK5rryPqesiXHFZpH86d7HrobGiDe3lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OknDlfrl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMIHnh+I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OknDlfrl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMIHnh+I"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHujIG2722793
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sTqXbDBaN0X4bkIx38SwJs
	II48e9h6LTI2mEy3hMK1Q=; b=OknDlfrlObentLs+cznOacfmAGE93PVTWIMoMq
	EIaOnYHhtgmlPL7eT7yl/zjnIANRhnrabjNXfpdmP+bYqLPHVuXoQm9QqnTGxUU5
	fFYilA3YmAcd318LFmb4+RPpu0ltnDMPhBYFVlFrCRZPTKq2sjNKWkliTnOvHcfZ
	0aaa8iLD31bvsDUg3wGItFjKFQqLd47+jdbHtIAc8rJnv0VPjzBAOiI4pSRXcUaL
	uwvrT3O6/rSTfwwCmdYDDK00PiixNDdp9bBk99URUFAiNUT5fJ3aNSVwYxM+ZXej
	NxW8sL9rvP90Haqt1HCQIU/0BrFKiJWN4OaVIwMzO3cdkATA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w06xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:18:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso3809485eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829092; x=1792433892; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sTqXbDBaN0X4bkIx38SwJsII48e9h6LTI2mEy3hMK1Q=;
        b=fMIHnh+IXnpYDK+X/ebJ9MjbSyVqph5UiPP0/bKg9Hn6V2iY7wOp7X7Y5GUKYjYs71
         4ZKQLvu2HQn7fgPCnkgr4DmIHiNSBNdJr4+QLpru7ZsJf1JwowcLW9F+bKNC0knQFQuI
         dv7shozVSoZd9xc3r3uBK/ZZY9FHyWCimLQpN2iNTzy5k6gS87yQX3xDUaOrcPxf+1Dt
         eUFc6BlX/47XzcnZzcJfw5Vjii2adQU+VOgLGFzDpZh2QxprvvVVHkeZoFv0syni7ln5
         BY/dlAKucosPfiY6tQm7r3Yc9wZJLv4QprVNMfwQU9A1H79QcOy588hJFHo5Dnt4K4yo
         V6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829092; x=1792433892;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sTqXbDBaN0X4bkIx38SwJsII48e9h6LTI2mEy3hMK1Q=;
        b=cVhoxl8A9aB6xkKalnqHNOnbV0gLOQId6XURzd8jsHJ5hglg/i812sfWEUkcPJX2OH
         jjqXtnR6i4Rg5tTZw+rBOQ1oHgxsBUtzqnqWzFoK/iFfmou2tuE0nuIDaP/PiamgC0gH
         4D4vQJkF3zAgCLLueobIGD3YViULm/L+7AYDzWJUA6cdoDGmJz/d9FiBx1B4iXTwrgpZ
         VU5Un3rWxwT/B0F7KhDr5mRo/6e6qZ2jopTY74T4lT2p+SpSvTvOf8SpypbifhafnKzm
         7kOrqNgm26caJkstTzliNtls4qQS71mrNTRAYtMtE72tUlHXm017Woo6U/tTbr0jMKN/
         kEOg==
X-Forwarded-Encrypted: i=1; AKwUvByyKttGW6lmRMCufO27ncQJpSI0BV+CqfSVwH0qvMOaLPqyZ0rDpODCjBIeM8vJ+o8fJqyRDHI3UEwnTFRn@vger.kernel.org
X-Gm-Message-State: AFq9FYI04l47fHZNmSz+sH/YBA5nCUnwwuQb6wY8il1DJ4YxjHL6QUJ7
	yrDuU/nak3lpIE9I37Sh9MTCs4XSnlq9upLOIt+1/NB3tv5/SCiXecSzSfFmnq3v0a3DvIH3PsC
	qt6tWLxLMUv+ztSnGE/j8OLjRn0vlJFBEFw5noWDsEU9LUuTq3EB2YGj0fur02vhHiNFa
X-Gm-Gg: AYBFou2Nv0py1m+Ij62Ke7jXIo2rbnI/YYpeNKjhiX6cSLybFhnKezWFtyWN7QfYbcx
	KQpkV7GeCj3MnMepl1Jm1L07NdjAwhIP8mmwn0o/vQGdVPAld76thgb954URfSilxs5DNadravX
	qV55S2bT1yzpTJG16Juk5u5C3ux7y1h+UpCuWCY9++9NnXjZrCXz1pBlXqe7gtQgTpJ3YRBm32a
	Jv+beAq69qjjejYByLGCBuRl39oLD6pWGvDoVqNSbxLw71OtwhqdutL+7oCyckeAiIAjRPtKMPd
	Z3Z5qXOr7PvymZw4BjqHOcjgx9jxgz/x2osLmgHlisR+WlXQTO/BojMJZVnzftVBMUgiET7I86n
	ZzBELCzDx8yd/u4HHdlXpnAeCcGa8
X-Received: by 2002:a05:7301:71a4:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-35a4ae61ed4mr5464309eec.22.1791829091405;
        Mon, 12 Oct 2026 11:18:11 -0700 (PDT)
X-Received: by 2002:a05:7301:71a4:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-35a4ae61ed4mr5464273eec.22.1791829090664;
        Mon, 12 Oct 2026 11:18:10 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm22827311eec.31.2026.10.12.11.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:18:10 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PATCH v8 0/7] Qualcomm Sahara protocol enhancements
Date: Mon, 12 Oct 2026 23:47:58 +0530
Message-Id: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYkzWoC/33Q20oDMRAG4FcpuXaXyXGSXvkeIiWbpG6w3dRkX
 ZXSdzdb0PbCCMPAH8g3w5xJCTmGQrabM8lhiSWmqQb9sCFutNNL6KKvmTBgCjhgV+xos92dcpq
 TS4fdFD52C+uUYloKRO72SOrnUw77+HmFn55rHmOZU/66zlno+rqSEjSTFKhhqmdUgZSio91rL
 GPKoR/sPNvHVEr/9m4PLh2PfW1k5Rb2Q/y7VS3omPEOhR5kMK6h8TuNQlPjVTNGBCsG8NL6hib
 uNdPURNUEWo+Gg0bFGpq8aYKqpiarpmwY9gAyiKF1N3XTEGhTU1XjFjVXzAkUtKHhr0YBdFPD9
 W7gGerBV0z8oV0ul29sE9kZjAIAAA==
X-Change-ID: 20260307-sahara_protocol_new_v2-662854773cf7
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791829086; l=7588;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=qQxpGCkmBrmToTnrtmzbPTnehdVr0DjcnfRo6PenOlw=;
 b=OCH5LUoUMuR+rabisWG4JgRmhP8Hx4wi2B0l45JwGA8FIu29L7ZCuZvTgPSL+iTUqOvpx7SS9
 uyCpYvJ70mVAQATZc5q08wd2WiFYnKOQ82nvqzRa24GxAGiSbYIVBqr
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: torwRey4j3_q8S-QZxXA94BAcXSrISET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX6Pku64gPU044
 pQcp2uwemLDpccyZW3+QNCZMpw/kMVZyDCGmuHOE4LP0+cOZLWdMp0xsOAC21R+9n3TnR4GwkRJ
 o+bCGwbZjRzUFCLMGlxMirTfd9Ga/6t8oBZrt7tiNACEITq8ShodDa1Gq6ttnsGUVvWusEN/fgb
 gO2+ycZ9lxT5NHVbOYRzWn+KuUGjSpBRFcEDKrh06kyfexJnrAK+irNWBJLoeTGAEQgWU169JC7
 BGPXPehNy4NYUuR64d/dqa6EBCaJof0lFEhwCYLeKMapUNS7ucX+YFzysuj7x8SIPdoH1TYTKBJ
 /mrQpWepFZb9V7ZzLAxrztb0gRgkL+p1BMIcwbjTj3cZzWZw7nKGd0spVxMQGTw11gAEygrW889
 7XfG+Qe0C2ZPSH6zAqsH4APW5N0KTzhEbw7pEPqoE3cD41qTxx52hQymf3TfA8m8iCL0JmG4mkW
 /js7E/Lldya7qMUg6uQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX1umWGhzc91PH
 DkJcFq82Nvu7rTyr+DkMelGIJ5TvwEcfuRQRLb6V6K++atyZjCHWMZS0GUK+3sC6B9cryGs6G0T
 4eQoZfUXdOt+1A2+RRrrrDkpE2X8/n4=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acd2464 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TZsl4NGrXgOhBUOoEegA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: torwRey4j3_q8S-QZxXA94BAcXSrISET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072

Hi All,

This series reworks the Sahara protocol driver to make it reusable for
multiple MHI based devices and adds support for capturing, restoring and
exposing DDR training data using the Sahara command mode.

The Sahara protocol is transported over the MHI bus and is used by multiple
flashless devices to transfer firmware images, retrieve memory dumps and
exchange command mode data during early boot. However, the current
implementation lives under the QAIC accelerator driver and contains
device-specific assumptions that limit reuse.

Some MHI devices (for example, QDU100) expose the sahara protocol directly
on a "SAHARA" MHI channel and rely on command mode to exchange DDR training
data with the host. The existing driver does not bind to such devices and
ignores Sahara command mode packets, causing training data to be dropped.

This series addresses these issues by relocating the Sahara driver to the
MHI subsystem, centralizing device specific configuration and adding command
mode handling for DDR training data.

Overview of the changes in this series -
1. Move Sahara under the MHI subsystem:
   a. Relocate the sahara protocol driver from QAIC accelerator tree to
      drivers/bus/mhi/host/clients directory.
   b. Register Sahara as an independent MHI protocol driver.

2. Generalize device matching and configuration
   a. Allow the driver to bind to devices exposing the protocol on a
      SAHARA MHI channel.
   b. Centralize firmware image table selection at probe time using a variant
      table, instead of scattered conditionals.
   c. Preserve existing behavior on AIC devices.

3. Add QDU100 firmware image table support
   a. Add a QDU100 image table and select it based on the matched MHI channel.
   b. No separate client driver or registration mechanism is required.

4. Add Sahara command mode support for DDR training.
   a. Handle command mode packets(CMD_READY, EXECUTE, EXECUTE_DATA).
   b. Query supported commands and retrieve DDR training data from the device.
   c. Allocate receive buffers based on the reported payload size and copy
      raw data from the MHI DL.
   d. Store training data in controller-scoped memory using devres so it
      survives sahara channel teardown.

5. Expose DDR training data to userspace
   a. Add a read-only binary sysfs attribute under the MHI controller device.
   b. The attribute reads directly from controller-scoped storage and remains
      available after the Sahara channel device is removed.
   c. Cleanup is handled automatically via device-managed resources.

6. Document the sysfs ABI
   a. Add ABI documentation describing the DDR training data sysfs node.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
Changes in v8:
- Rebased the series onto the current mhi-next branch so that it applies
  cleanly.
- Resolved conflicts with the MHI host client loopback driver and retained
  the existing Sahara functionality without functional changes.

Changes in v7:
- Addressed review feedback by correcting documentation punctuation and
  removing an unrelated formatting-only change.
- Passed the QDU100 Sahara firmware mapping through struct mhi_pci_dev_info
  instead of selecting it with a device-specific conditional in PCI probe.
- Clarified the userspace persistence filename for captured DDR training data:
  qcom/<fw_folder>/mdmddr_0x<serial_no>.mbn.
- Link to v6: https://lore.kernel.org/r/20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com

Changes in v6:
- Used BIN_ATTR_RO() instead of struct bin_attribute.
- Link to v5: https://lore.kernel.org/r/20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com

Changes in v5:
- Sahara protocol documentation is moved to Documentation/mhi/ directory.
- Sahara driver is now moved to drivers/bus/mhi/host/clients/ directory.
- Squashed v4 patch 3 with v4 patch 5.
- Squashed v4 patch 9 with v4 patch 8.
- Firmware image tables are now moved to respective MHI controller files.
- Removed redundant if-else conditions when loading DDR training data image.
- Corrected commit subjects and messages.
- Removed Sahara variant structure and introduced mhi_sahara_fw_table structure.
- Link to v4: https://lore.kernel.org/r/20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com

Changes in v4:
- Updated the series based on review feedback.
- Link to v3: https://lore.kernel.org/r/20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com
- Link to v3: https://lore.kernel.org/r/20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com

Changes in v3:
- Dropped the explicit image table entry for the boot critical image ID and
  added a generic image ID based firmware lookup fallback.
- Link to v2: https://lore.kernel.org/r/20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com

Changes in v2:
- Rebased onto latest linux-next tip.
- Reworked commit messages to clearly start with the problem being solved and
  end with a technical description of the change.
- Moved the Sahara driver to drivers/bus/mhi instead of drivers/soc/qcom,
  reflecting that its an MHI protocol driver rather than a SoC specific driver.
- Removed client side image table registration and consolidated firmware
  selection directly in the sahara driver using a probe-time variant
  mechanism.
- Ensured each patch is self-contained and does not break the build or runtime
  behavior at any intermediate point.
- Simplified state handling and lifetime management to avoid duplicated state
  tracking and ad-hoc cleanup.
- Updated sysfs handling to use controller-scoped devres and avoid one-shot
  reads or manual teardown.
- Link to v1: https://lore.kernel.org/r/20250825101926.2160554-1-kishore.batta@oss.qualcomm.com

---
Kishore Batta (7):
      Add documentation for Sahara protocol
      bus: mhi: Move Sahara protocol driver under MHI host client drivers
      bus: mhi: Centralize Sahara firmware image table selection at probe time
      bus: mhi: Add QDU100 Sahara variant and firmware fallback
      bus: mhi: Load DDR training data using device serial number
      bus: mhi: Capture DDR training data via command mode
      bus: mhi: Expose DDR training data via controller sysfs

 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    |   19 +
 Documentation/mhi/index.rst                        |    1 +
 Documentation/mhi/sahara_protocol.rst              | 1241 ++++++++++++++++++++
 drivers/accel/qaic/Kconfig                         |    1 +
 drivers/accel/qaic/Makefile                        |    3 +-
 drivers/accel/qaic/mhi_controller.c                |   61 +
 drivers/accel/qaic/qaic_drv.c                      |    9 -
 drivers/accel/qaic/sahara.h                        |   10 -
 drivers/bus/mhi/host/Makefile                      |    2 +-
 drivers/bus/mhi/host/clients/Kconfig               |    6 +
 drivers/bus/mhi/host/clients/Makefile              |    1 +
 drivers/bus/mhi/host/clients/sahara/Kconfig        |   15 +
 drivers/bus/mhi/host/clients/sahara/Makefile       |    2 +
 .../qaic => bus/mhi/host/clients/sahara}/sahara.c  |  515 ++++++--
 drivers/bus/mhi/host/pci_generic.c                 |   41 +
 include/linux/mhi.h                                |   17 +
 16 files changed, 1852 insertions(+), 92 deletions(-)
---
base-commit: 0b1883ca75c0005ab5ca52c7bc1a26329bc39746
change-id: 20260307-sahara_protocol_new_v2-662854773cf7

Best regards,
-- 
Kishore Batta <kishore.batta@oss.qualcomm.com>

