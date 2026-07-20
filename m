Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5637338839E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561840; cv=none; b=N2Dd7EOET0ViCv5z5iVZ8X+PoJUjs0e6SRkARCm0HQK2TeKASL22kHXR/TTdKzSdNEJw07WFX6SCr9USUeZyIkS4J3tSSFJ9+zH9OnGr5nVwsJuxt4f8QX6YiS77yHk7XWXD0Sj1E9J9gWC9i7u1oaHT42vPy8M/xOoHX88knlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561840; c=relaxed/simple;
	bh=Dpc9D5IQ1PWPpDwozKqq+GaptINW16Y/WpsNK/WrWeE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tRx1dcVxQ3mdJVr27odfQq+NNH2umuihVbNL9+gwHdEuxRu3GybSA9zkdZaoGq/BYbdov7/5r5A649duOw8VCgn/YAMIM3tRNaTFGSvVXOK16uysKFHmpmHIMZ7GfSTkfv4JtomQMPhhhnY5NhUQQAIQb1spg+SqLYb1yM2L8EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URfqohFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLiRUiF5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URfqohFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLiRUiF5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KFLqv93018990
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=95V8I0nv7kBf2zDty0cCib
	nQHMfHFvwnpNHp1EN8hS0=; b=URfqohFUjsnt0/UoHJLfycYEjSLzGEDps5pwlQ
	2SxW34qdeHi4YddE/dv9A4PfQVM+R4V8/g2o03sEG2cbAytHIgMjDcS4m4PfTePf
	AUFxIs7ecukiszxFN5Rc0EOw9SlSBAjlmaTgmaYcNrxWw1FzcfwYn3dX8nmUDyJ4
	A6PwBT22dfcQ8NsMV11eKtmU9iyfIqD4wwKCxZoSEMY744RDNeaGLPcYrZg5L2q4
	GeXGZGEy4kgwpHpbK+Mgv833s8ciN3yFD1rHb/VKcEiIX6ZOXExxeFJre4OESkgy
	KBnnEY5MwsxOL9RU6+aBSahLaszyMKUqMYHxCBPvD7yuYSZQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre9qa7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:37:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6dd278512so1359299a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784561837; x=1785166637; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=95V8I0nv7kBf2zDty0cCibnQHMfHFvwnpNHp1EN8hS0=;
        b=HLiRUiF5wku3MRWzxO3iBuNhzUCJqZLz96S3ELdcNo12sSoH+Rej4j81waMS5sPF5I
         PeED27SXrzG4kuUGOSs/3YsBMENbJ36u9j/UedqUKUwMSr1a2JVR+447/JN35JX9CAH3
         LaLW18dUGR82+3kXKmRB+EUgWgN8kNXEur3tkWwc+nGvE2ZPF7zdnidtuOXGcn0RrkIB
         zj5kpq2zIFMuKcClv5imKEX2hf0b4A0xtlnE6XhJs3+FKG7+laNjmfOimFXZ61VNKZ4k
         oT1o1NHZf//ZZI2o3Cv9h8vd5py7IjHBZoNl1WV16GcSbdtHLb83IQRP+bPE5+Zg4bXc
         GSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561837; x=1785166637;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=95V8I0nv7kBf2zDty0cCibnQHMfHFvwnpNHp1EN8hS0=;
        b=VVwjo0mCgrwc38fJJEK9oSFyh9YKmwgnNUcFsM4Woyl31auw0hlf11E4tJ0VuAv4PC
         QaEF6LbxHmoDSUHxpk8sa/z9LFezN/14zjev/PShnuuoe7GKolPRZMQI2avgut/PAmb6
         9YOXI/RlfJ9nCKE8GC1h7Uv7bHE4+/9wTnsJydgeeugUn5NkMF7o61ehQ8bEPDS7bExW
         Y2ESGICT4mVRX62tL5UFvtKHlhHBBcl7shZZ0+DRypClftgYMQuxXY1J4ahXtBH9Y30Y
         W3ZnN1GqIe2OjY0OOMzV9vIQBrvB/4lmELwfXStV+vwzJ5akUFEdaZ+lIUbzrVaerKLT
         VviA==
X-Forwarded-Encrypted: i=1; AHgh+RoGOq2+rTX1322MoQpwvMwsHw4jDUeBOfg9rcvMh5sPcXWeq6P+fwPFKOLOwGVITw70dezuslQ1GFvR8+mt@vger.kernel.org
X-Gm-Message-State: AOJu0YycNO3SzgvG1Tusq3qzJfDlpbp+d6IeaEgC8Qtked/o85HejGgQ
	yDDBezOam7GhAd/+HU7ptk0P8gSbrfbi0agWWXKS5BQv6fi/8qvX0vYVrOayO+yzfQRu7IRBdu6
	Fr3iQJttbkIB5o4OFRp7K0IceCCJSkflj2atMnTLDzCMmXUX1tVSaE0zhAXUbI1sKUM9O
X-Gm-Gg: AfdE7ck3tUvWxAQ8zFG1NoV2EBc/Xt49B7Dqk88hizzhK6oumtvOP7EkQtifb/We+Kd
	FzEKsWXc6z0OF+vBq1d3ST8SqWcqCHdwMDpgewQv7uM4rnlvuQYhksl75IWyHCjWxkoUAf0tcCN
	2jrUkY/y9EXtmCnMPm/GhGPZUJwe7NZDAXjrCvEzzWHgGdW6+pmwzSXi/1rJ2iNdzbjtZwaFlcv
	Laf0o5/RDNjq6PKE+8V2t93Fz4EsxOaQ4/9x+s1yetQF1x0o6mtlDY2AjunEQov7N12g7FqffOY
	JYC2O2ZMaa4z/L6u8qDlEB+ykLn9Or8fjfSg3b7bczZeUNIp66A0gOZUBiIfW48wQDAspQSu6wF
	rlEHD1JZSg4SmmoaGnFow6qxfCeqDoQ==
X-Received: by 2002:a05:6a21:6813:b0:3c0:9c19:b27d with SMTP id adf61e73a8af0-3c3adb1f025mr16664411637.75.1784561836679;
        Mon, 20 Jul 2026 08:37:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:6813:b0:3c0:9c19:b27d with SMTP id adf61e73a8af0-3c3adb1f025mr16664383637.75.1784561836147;
        Mon, 20 Jul 2026 08:37:16 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm38572824eec.0.2026.07.20.08.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:37:15 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH v5 0/4] regulator: qcom-rpmh: Support RPMH address reads
 and use it for rpmh-regulators
Date: Mon, 20 Jul 2026 21:06:37 +0530
Message-Id: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVAXmoC/yXMQQqDMBBA0avIrB2IwSj0KuIik0zrCFqZ1CCId
 29al2/x/wmJVTjBozpBOUuS91rg6grC5NcXo8RisMZ2prcGqUVlH1G3ZcLskDw1FJtA7ByUalN
 +yvE/DuPttNPM4fPbwHV9AYL+zhJzAAAA
X-Change-ID: 20260720-b4-read-rpmh-v5-bab1bd1cbe55
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784561832; l=7012;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=Dpc9D5IQ1PWPpDwozKqq+GaptINW16Y/WpsNK/WrWeE=;
 b=qXZzZBnZd32RwXuOFcVxx3Gc8KbI91ECatMTNVoYUvnOyTD9BNnqQYKTnb8OPoacFMzFM+AdK
 w1iruAk1s0jCpITvhSKA4pztMvKTTlKd5tgz6WHRV1gi20tj1pwmBdS
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE3NCBTYWx0ZWRfXzgfcdMt7vj44
 gSl1LHT/oyQZfQ3RBRlhCn1bc4FRpeer0rj0XCMAXZ8arxgzWGeQVAFBybl4yqAHxqUvMgZYiDD
 qsQwrfWKTe+OqkRzlXcsmLYCSJEekjI=
X-Proofpoint-GUID: UhevBfOlFKOj7uHn6k3DfWkrPW3aZWm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE3NCBTYWx0ZWRfXxtQhZnkZ3HUf
 xFshxvB+x321dcFA88QTKTVLJFqWHJzvPkxf2hV07BMcGRkfnAe28ur+8MsmNz/H+JZfHXzn1NP
 md0iOoo5XmjySF79sbUVRAmx7U3u/0/o2KDeFBW+ZVAc61+LuLQ+H2LrPKZBMTmoZKp72KUD5mV
 YGfc5tGiHDvGMJSHpgfWNxZEQ2pfFJGNnXquwY8C7tc6xXPvJft+AWXXnaXCjxqRsZ+/s7l8OG9
 DL3Xe+RcCh7sGDs+YZaNTBedbepv2axTSbKGH1BmdpWzkMTj2c0KzQlWjNseVMRxtwlO9tsH40r
 9evBqXqzUSNPJLt7jX+5LI/JkC71FWwSrx5JoNtDPV1P/SOtgh+65tT+Idn6r4Qk5LAeI3uyQrs
 DT9dDgs0tqKkfAkoK5/ILjPUI9aC2SF6+dUg7bQbT9upgDWUax5JmgxWDsVIRy6pD+JgIU1ynqP
 pUDht75/pn+Fh8l6FgA==
X-Proofpoint-ORIG-GUID: UhevBfOlFKOj7uHn6k3DfWkrPW3aZWm1
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5e40ad cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=tyxy7h1aezLcW-tGXckA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200174

This patch series adds a new `rpmh_read()` API to allow reading RPMH
addresses. Using this API enhances the RPMH regulator driver by adding
new `get_status()` callback to reflect the regulator status and also
readback the voltage/bypass/mode settings as they have been applied by
APPS during the bootloader stage, so regulator framework can get them
via `get_mode`, `get_bypass` & `get_voltage_selector` callbacks during
regulator registration.

This is needed because currently regulator framework does a unnecessary
write with `min-microvolt` DT setting for all the RPMH regulators during
regulator registration, because the first time after boot the value is
seen as -ENOTRECOVERABLE, as there is no option to read these regulator
settings.

With this change this unnecessary write can be avoided and regulator
framework gets a sense of the initial state set during the bootloader
stage for all regulator settings.

NOTE - During discussion on the v2 series - PATCH 3/4, reviewer had
inquired about possible need for the use of the sync_state() to handle the
"multiple" client case - for maintaining the regulator settings till all
the clients are probed.

This case was not covered in my previous series and had originally planned
to do that series separately. But after the discussion decided to merge
the 2 series as it seemed this would be a better approach. But after
working on sync_state change. I realized a basic issue with using
sync_state() for regulators - that its per-driver and not per-regulator
resource. But we needed a sync_state callback for each regulator separately.

I had been experimenting with few ideas but seems its going to need more
time for me to close on the equivalent solution that has per-regulator
sync_state or something to that effect. So I thought to close on this
series and attend to that separately.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Changes in v5:
- In `_rpmh_regulator_vrm_get_voltage()`, removed the min/max voltage
  range check that was suppressing out-of-range readback values, as
  suggested by Mark. The raw hardware-read voltage is now always
  reported to the regulator framework. A separate patch will be sent
  to handle out-of-range voltage constraint handling in core.c.
- Sorted the `#include <linux/bits.h>` alphabetically with the rest of
  the include block, as pointed out by Konrad.
- Removed the `rpmh_regulator_read_data()` wrapper (a oneliner around
  `rpmh_read()`) and inlined `rpmh_read()` at each call site instead,
  as suggested by Konrad.
- Dropped the unnecessary `sts = 0` initialization in
  `rpmh_regulator_determine_initial_status()`, since it is always
  initialized before use, as pointed out by Konrad.
- Added a blank line above the `return` statements in the `!pmic_mode`
  block of `rpmh_regulator_determine_initial_status()`, for consistency
  with the rest of the function, as pointed out by Konrad.
- Link to v4: https://lore.kernel.org/all/20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com/

Changes in v4:
- Modified the register mask macros to use  GENMASK()/BIT() instead of
  numbers as suggested by reviewer.
- Removed the unreachable code in the determine_initial_status() for XOB
  type regulators status update logic as suggested by reviewer.
- Link to v3: https://lore.kernel.org/all/20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com/

Changes in v3:
- Removed "bypass_supported" as that is not needed for regulators
  that don't have set_bypass implemented, as pointed by Dmitry.
- Handled the corner case where the mode/bypass setting is read 0, but
  its unclear if the register has been set to 0 or its un-accessed.
- Dropped `convert_mode_to_status()` and use the `regulator_mode_to_status()`
  instead.
- Refactored some code to simplify the `status` update after every
  enable/mode/bypass setting change.
- Corrected subject line of all patches to have `regulator: qcom-rpmh:`
  for all the `qcom-rpmh-regulator.c` file changes, as pointed by Bjorn.
- Re-ordered the series to have the `rpmh.c` driver patches first and
  than `qcom-rpmh-regulator.c` driver patches as asked by Bjorn.
- In the BOB5 bypass fix patch (PATCH 1/4 in previous series), added
  the fixes commit#, as it was missed earlier.
- In the rpmh driver change(PATCH 2/4 in previous series), modified
  commit wording and removed linked as suggested by reviewer.
- Fixed kernel test robot issues and other formatting issues in
  PATCH 3/4 of last series.
- Corrected the checkpatch error fix PATCH 4/4 to keep to only
  one error in comment section which existed prior to this
  series.
- Modified the subject line a little and added proper tags
- Link to v2: https://lore.kernel.org/all/20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com/

Changes in v2:
- Fixed the BOB bypass mode handling (existing issue in current driver).
  This was needed for `get_status()` implementation.
- Implemented `get_status()` callback.
- Callbacks for `is_enabled()` & `get_mode()` will now be used as-is
  ie. v1 changes reverted.
- Bootstrapped the read values for `mode` and `status` in probe, based on
  comments received from reviewer.
- Callback for `get_voltage_sel()` has been modified to handle cases
  where read voltage is out-of-range defined in the regulator DT settings,
  this is needed to ensure backward compatibilty. Regulator probes may
  fail otherwise for some older targets.
- This patch is rebased & tested on:
  https://lore.kernel.org/all/176070318151.57631.15443673679580823321.b4-ty@kernel.org/
  to avoid any merge issues.
- Fixed code style issues reported by checkpatch.pl script.
- Link to v1: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

---
Kamal Wadhwa (3):
      regulator: qcom-rpmh: Fix PMIC5 BOB bypass mode handling
      regulator: qcom-rpmh: readback voltage/bypass/mode/status set during bootup
      regulator: qcom-rpmh: Fix coding style issues

Maulik Shah (1):
      soc: qcom: rpmh: Add support to read back resource settings

 drivers/regulator/qcom-rpmh-regulator.c | 169 +++++++++++++++++++++++++++++++-
 drivers/soc/qcom/rpmh-rsc.c             |  13 ++-
 drivers/soc/qcom/rpmh.c                 |  47 ++++++++-
 include/soc/qcom/rpmh.h                 |   5 +
 include/soc/qcom/tcs.h                  |   2 +
 5 files changed, 228 insertions(+), 8 deletions(-)
---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260720-b4-read-rpmh-v5-bab1bd1cbe55

Best regards,
--  
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

