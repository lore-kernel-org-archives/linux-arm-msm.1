Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A0E38DC57
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 08:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785571254; cv=none; b=J+nUTveCpryv/51JTv0vorG4h1XfJXxX0XgFivRvnBzL0Bdfz32AqYK3CvuKeK906G6asraaIPV473xD2PX9viZdZIJeX1zVnLznBF4MifEaGfCsUVRjmkuwLNModyPAXDMtj7lPGae8fQ5U/CIgll0itMjWIRsBzgEdpDtA8YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785571254; c=relaxed/simple;
	bh=/lQS+ClgoGUixR/QI1y225RxGswvnDRbQRyL4FSIIY8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TInywE0TcCFGy11IK3fbhmqDEWDV3sRlqa5szLNxBGa/Nd24QxXi5B9mqRbx3KPWLdGmCw43ptgWsb+1BR6vWIuXNhDpDU+ovD0M5CRHwoDy+PorYY6QrGRBEbnU0XAfUg2xpjEdjyGgQWvUVhz2JlX3ENA/8s9f8alFduyOfxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvcfLphF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UBYtmzRf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvcfLphF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UBYtmzRf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713DjSc2066119
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 08:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GiYcVjBZ09W9+YUl1IOFMv
	wZDm0LSVBwbrIB5vHXWwk=; b=YvcfLphFZlXjbdZi5RDWcKXjt6V3vv7eRo2TD9
	8wOoFNwCv1RWTttNpwLvLzpA3SL803T3AIJ0HhUOoldkNICyOiRLkBemFAoY7a79
	FgbIG5J37WOi+a9L/616k9Mjq0Z3YCPPm/JAZoV/E1Y4sZaaWqKuqwUDj6pW7mEy
	9yydcTUDjZA39F6rlYTed4Fz+AR9g334VxKisiw2kmjmdPMTTBY9wkN9/m3jI8yX
	TqrD6rIho3olicWIC9IUeyjePgnC6RdjZfZYFBsnYxZhHfCl+TK4isRu4YhcUlz7
	qRlRMsN3VakdfuJN+jUtGD7hgENlkdUD7Rk1RFlD2VmB/IcA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q50hfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 08:00:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso2122494a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 01:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785571247; x=1786176047; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GiYcVjBZ09W9+YUl1IOFMvwZDm0LSVBwbrIB5vHXWwk=;
        b=UBYtmzRffRewX5YDDKmZu+tjxbrQocOmEjJssmYnA9/RzgpRsQ7Mqs5RBRkPXnZrWc
         buEXhXuZ31tJMtiQa65gvl8mBtMi3uGovE+8Z2PNBJXJiBaZ0VOTF2+kajR6kpaiardM
         ycQm1RLFpnj4stg2Sob1i1epPDlDk+GyjSAGoL4o9XZPZegUXgCBwPnu+Q45T0O6CB1s
         SXyAtEz0gdGTiTsvFHUFA6jtmkTeVR7jojI6Wh9uuzqJI3F8xiyjNk9c+0ZekvGqveF6
         r56vNgb32srSlrToXf5jCzPzo6+58wTPshqhOt4uv7MO8hRaZzeHDL9ER8iQNRtEGhe6
         IXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785571247; x=1786176047;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GiYcVjBZ09W9+YUl1IOFMvwZDm0LSVBwbrIB5vHXWwk=;
        b=iArVYMjDtXjdKmKcfhkHtouXWqNXWXx+x0nYOpKfEsRgm5tPQ4cVIGJsCxMh+bFpy+
         4qzWoEeN2FHIbBIcajvNntGZCzwppcEGNXAATokFFDAFya3py6bvSoNFqf/afS/li/a/
         MvFcM2M0URdkvAoB0qyH/pExK2oH+USGjOwjsLYeFLYRv3lC6nOcgjpF/r+Bpfi50NJk
         ogsoueAfLwZ5oLOKoc7u6DwVWCaie9SQOzt5doMJ+CHZCYEmXt+cy8zpKuPKKnjbu05m
         QlIFzTKDZ36nnadM0JTS/RVlmVjDXKCHX/y8LqmtJOLJwjlUQVXyIbe6GWe9p9q0WAHD
         Ni/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoqrahrD1bgSJ/I5e26HA5IISig7sAcykdH8D+4QMt24JY5JqWcFg9qD+u+hMMlmLJ8d8yrggMg4APSQNCP@vger.kernel.org
X-Gm-Message-State: AOJu0YwVjljNa9icyZx0S1U4SbXvKh0ad/EuzlpcPbmm+YAD2OBMvRLe
	oS5aufbOBxFf4k0TjvJ0D6z0T5Bit3U9lTXt/eFod2gU2EPm7kzvHeWNyyQZBn2gPWO7InHqXg9
	7AQ1HVgwrYHOizuXlK2D4FSxqqnCHev6zfZhnLVDzo2PbuqxiGVbKRdqN5ehj2iSKOPXU
X-Gm-Gg: AR+sD12Pl7khUcWPCZCYsB/gOxZGc6xHF1oCsM0uPhTxxxxNbLcU0VoIGQ0U4wBk4FI
	JLqrEgnqMMHGbHqk3kpKi0voA0ynMLNgSoJ3raoMz9lJxbauNnYivdJ9l6JW6hdDZOfd4NhXI/+
	/9snpN6aiiIqEKefX2u7TCH8DFUWWn2VjBQrIJqGP9PihWANsIjn+U0sp6+2tPCE+bi1aslGu4q
	vcvCOdw7RfUcmocV/KqX41bggfYHbx6odKe03Wazjjj5ZDXFFK42WI8jeCrhPPwsQpl6CYQ34kP
	FZA7t7ebNwz2+ifMDOfit4TQR5gVeVZi9dA+U6bgNVdApHLcNE7pBS5SS8+ZCfnK4DMoV6Gs7vg
	KMWkeZXrjG8BzN93jUxugS3evyaqHQg==
X-Received: by 2002:a17:90b:4cce:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-38fbc422a55mr2509617a91.11.1785571246497;
        Sat, 01 Aug 2026 01:00:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4cce:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-38fbc422a55mr2509584a91.11.1785571245858;
        Sat, 01 Aug 2026 01:00:45 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm24739838eec.28.2026.08.01.01.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 01:00:45 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: [PATCH v6 0/4] regulator: qcom-rpmh: Support RPMH address reads
 and use it for rpmh-regulators
Date: Sat, 01 Aug 2026 13:30:26 +0530
Message-Id: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJqnbWoC/3WNQQ6CMBBFr0Jm7ZCCDgZX3sOw6JRBaoRiC0RDu
 LsF1yaTn7zk/zcLBPFWAlySBbzMNljXRygOCZhW93dBW0eGXOWFOucK+YRedI1+6FqcCVlzxnV
 mWIggrgYvjX3vxlv14zDxQ8y4abZGa8Po/Gd/OdPW+2+Pp9BweWy4pIYKuroQ0tekn8Z1XRoDq
 nVdvxyr8g7HAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785571241; l=7633;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=/lQS+ClgoGUixR/QI1y225RxGswvnDRbQRyL4FSIIY8=;
 b=Zvn4/DHyGeZOJ1zmwEh46+ss26YV+oHY5Ih5LdZ7TICY01M3rTZ1FUB5Grc9BK+FbuuQlQ/zF
 wVdlYbRB4/pDveOk7sU4PkIQ4SbzE2AX8II+gFJjPrTEu+J9ar/rM92
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA1NyBTYWx0ZWRfX+eDYXwkvPsaX
 UjHoX5t4s3/pCoV0P4Wj6za2MpNljpqDXbmXfdInvnV2EY+aIoBZXoSOX54czzpz/v3tJUYfZ6a
 a3SIaDTnQdoK359KX/97mJsFeJKy20E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA1NyBTYWx0ZWRfX37Kcp/ySqje+
 dWBfKWyY1jupxyC2OgVVbhq/485LAK5tMLfQB/QWxctLeIGTchH14YsbbdFFqPBgY/FIFlXEK1j
 77krDNKq162gBG2TkKqWknceGHx7bEDfJPcP/p3NNTVl/m41aSUAvnYTzKiourCoBc9FINhUQI1
 H69Rqfyib+5n697BPrNEo+QvYKn3hYa7F2P1R2SO2wKOHTCjocNFVJ+j1IJtvymucnM4JnVW/o2
 SEOOIvNqodKOwQZUm5FaU4M+dDvtK5XrlNFbpNY3bQ5CzD+KQ0nyJ1Ug5wABMroknl3PA0wAkL2
 FvS4rxru+SyaiankJnbyF+cbIF9911xwMLFlbPwJQW0zDbE8OnLWtlDwOSHRoVoI45RyeqeGymJ
 gNvjFK7lQry3oVkbZ5WytoyqpN28Hmp/NXBAFB4WhTlFSeO6pAH4qXQYts8+FAqt0phNUGlAroZ
 8yA1sek0Gev5eiMOzOQ==
X-Proofpoint-GUID: Po5nSF53tPHnt2tZjjygnyW3AUvwhOaB
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6da7af cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=MK4DTrBJAt5pQD0oKkIA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Po5nSF53tPHnt2tZjjygnyW3AUvwhOaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010057

This patch series adds a new `rpmh_read()` API to allow reading RPMH
addresses. Using this API enhances the RPMH regulator driver by adding
readback of the voltage/bypass/mode settings as they have been applied by
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
Changes in v6:
- Dropped the `get_status()` callback and all associated status-tracking
  (vreg->status, rpmh_vreg_update_status(), rpmh_regulator_vrm_get_status()),
  as Mark pointed out get_status() must reflect actual hardware state, not a
  cached/driver-computed value, and the ENABLE/MODE/BYPASS registers are
  control/vote registers written by this driver rather than free-running
  status registers. Renamed determine_initial_status() to
  determine_initial_mode() accordingly; mode/bypass/voltage readback via
  get_mode()/get_bypass()/get_voltage_sel() is unaffected.
- Link to v5: https://patch.msgid.link/20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com

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
      regulator: qcom-rpmh: readback voltage/bypass/mode set during bootup
      regulator: qcom-rpmh: Fix coding style issues

Maulik Shah (1):
      soc: qcom: rpmh: Add support to read back resource settings

 drivers/regulator/qcom-rpmh-regulator.c | 128 +++++++++++++++++++++++++++++++-
 drivers/soc/qcom/rpmh-rsc.c             |  13 +++-
 drivers/soc/qcom/rpmh.c                 |  47 +++++++++++-
 include/soc/qcom/rpmh.h                 |   5 ++
 include/soc/qcom/tcs.h                  |   2 +
 5 files changed, 187 insertions(+), 8 deletions(-)
---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260720-b4-read-rpmh-v5-bab1bd1cbe55

Best regards,
--  
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

