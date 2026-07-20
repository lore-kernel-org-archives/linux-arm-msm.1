Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C19B3AB496
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527856; cv=none; b=qeJPYadWEtyoj3WQikIIa9O2gXLtwh9mAgwmz0QVTD8lHNvUanJMIQC6qxWHja5QWZ9Y7izcY+SMeB4zcSJu8CIM/F06Db2vrIzRMN4xbHNgxMtfG/83WH2Aq9RqlsZmms6zMv4rqLqit5BfitUfP5t9uVrNP7OQSn5igmNdkgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527856; c=relaxed/simple;
	bh=PJ0sxFhnEHsV2GmP43kohhZ45+dKgPmt9r5NIhHpWo0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DgJ/SeWPWp9iAPmpeq9lxKZqI6n+/yfcagS7FoZW8DvwQwNCKKd5RzZjeeNo9zdQwk67BY4Uv2qC1tOndUUkq3eZ0R95lDTX9YEXUtYVFLffxQbVbTAf5Z2cgHnCjEgPVds6tk/9DogLseebB1leX6A3kfsrMUU5JU2+at+ILpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ptWTidbL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b7wHcSGj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptWTidbL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b7wHcSGj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsb2I657712
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BxqLZ7hRz8DxawPShTOWyx
	1Gx5YiSN+QI/HdPPVSBxU=; b=ptWTidbL6sraJI1cUEYGj9uIgvk4FlGuJfLqsf
	2hKXEPngJt/KZS1GemeOF4FjryLhPBFOSIv/UBmkh4Yo53WZtQ5rEaWNZUsUMUd6
	w6nmXdLSlgKG2u99dM6MN9yrclbNGBZNPPNWIw5LcHt/2FJ8iGMwy5qk8IOG/Y6o
	BuS+Ji1b6XUnatKmaKp97BaiNuPJb3z2R72Vdt7UBdFM7F2pKDc0sAQSnZHVmAoS
	uofh1U8JNStsT0kiS67/BL1FZ5lNmEGANYp+8F7Bkk+q7Me7wpRTn+63Xx+it2zs
	Dv1X/NK4iHqFrOkscsjRjDk5Uks4WNcNj2RiLTh5VdFYEb3w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chmm03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:10:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ec3314f65fso197494246d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527846; x=1785132646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BxqLZ7hRz8DxawPShTOWyx1Gx5YiSN+QI/HdPPVSBxU=;
        b=b7wHcSGjniKt05ZeR4yuTUxBR4Med+8eNu5HwnWywIWmOTWlwBjTtpMCXc31RG32rK
         jjjNZOhB3xQ5XbaYrDq8CQfg4m0SondBdS6E9TGYcU8kEFtKBXJH8SsJBUSNwbDo1wvj
         Qa6/ky4fF6+fTNN9A5Sc5lN5TMniCyluE2lLDuO50Yzz06Xu8aL96rjD5U4qGpDMVmq0
         crwlztA7ddoJ1YZK2nrBcexyNAs3IbKQCYaoeEqDiFMA5rnh9VMDdvBlrHCjK7bNc0VM
         7MyaffjyA93rerZ1iMu8d5UtHm9CHFCLaJMsQNkK17H+X93MRFw4UwxJCw1VJvxvi4oM
         mR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527846; x=1785132646;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BxqLZ7hRz8DxawPShTOWyx1Gx5YiSN+QI/HdPPVSBxU=;
        b=G03vmDZwaautx90goOoKsIH0bhCyoneSycj38ODMSLl3B4V0LuQD88bWZ4jvTmOPyW
         ngNt4hpoYIgmO8oBj5JpvbOnsl+PGcLYgFNzrmnbuaEEpEqpS/MuhIA5+va70twWYXrB
         tFmjb2hW6+Jahh4aP+ZQVXH8P4JTMrAFxEgnZXdwZCrojTQ6SDdQQIqzFXq2nreIsMbm
         lY+rgKUwPJfva1l4bb2yFIKavzvOvbek3BNsq8F2WZbtfdFL+0N25MfdJ+wmfIjX52R9
         UyTTGXmMDuSUdGg4vgbUaAv2Q7e0FFfMlVO6nXWbnle1gxhB8Sv8X2kzSxWMaRC6sBlx
         6ETg==
X-Gm-Message-State: AOJu0YwaPRM8HUybS17Vs/78YB6VR6gGt7ZqsmU4mcgd+0mbpebjoAJW
	yA8c3glIQyMpq52JbW5QirnWqug1xd5CWjsuOk/gc/84fdc6EBTl6FGT+rTk9Woz7NfK+KSM3fQ
	1VFj+z2tVb7fE14mDBmwTINwtw9AgZv3Xt0HmnPzEw16/y+ikgtvSyP072ua0oZll7IV3
X-Gm-Gg: AfdE7ck1B5MZRf1rtR1ER3PmVq5m7Nfd9iVCc29ReYmI3fcxREyCpMFD6aQTHdCJFmL
	cJ0q8UIm1oYDB6OQFfMdgqglS9Zl7oR4VdpcPwaKtVYx6eZyz23KvtBk0fs5Yr5Qu6ugH6Tmbzb
	M683RbdMUsJn0NkeniUPQziENgsySwC0vFg88DAFhXtiGag+2s890JIawz3Aael7AOGrqmWnAne
	bgYb+urHJVUZqKolsKi3Eg9wWHHDXBm5Jylbf7/Yjy6n+u364WNYjEULvXMP7dm0QpuTaURrtxR
	5vm2k3iGnYpLzQr7JgV6D0ultDQ2y4x5gei4Y+HvUPy+xdGlJTIWN5DaQkensSk2jBkKo4Tn4IN
	ObAR57Nvw8d6QeBkwNatj4Q8rBsNk7PcC3RI5EXLPEl3KOTx1QC/lcvF62TFOePw=
X-Received: by 2002:ad4:5c8b:0:b0:8ef:e0d0:9fae with SMTP id 6a1803df08f44-9077836870bmr133324726d6.14.1784527845907;
        Sun, 19 Jul 2026 23:10:45 -0700 (PDT)
X-Received: by 2002:ad4:5c8b:0:b0:8ef:e0d0:9fae with SMTP id 6a1803df08f44-9077836870bmr133324596d6.14.1784527845427;
        Sun, 19 Jul 2026 23:10:45 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:10:45 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v8 00/15] drm/msm/dp: Prerequisite cleanup for upcoming MST
 support
Date: Mon, 20 Jul 2026 14:08:07 +0800
Message-Id: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEe7XWoC/3XOwW7DIAwG4FeJOI8KDAHS095jmipDzYrUJC2k0
 aoq7z6aHrZK3cXSb8mf/xsrlBMVtm1uLNOcShqHGtxbw8IBhy/iaV8zAwFGtOD4/rTryxSOhAO
 PotOB0AUEzerFKVNM36v28fnImc6Xik6PJfNYiIex79O0bYSVDpxCD84H1QlLUngj0XjtyUSKK
 IP3ENndOqQyjfm6Fp3bFXvZaW654NgByCCjjMq/j6Vszhc83t9u6li52fwSRsAzYSoBQdoYtcD
 Owz+E/Ut0z4StBKHQUipyoNQLYlmWH2P+2/p/AQAA
X-Change-ID: 20260528-dp_mstclean-f094cea8ca24
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=3646;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=PJ0sxFhnEHsV2GmP43kohhZ45+dKgPmt9r5NIhHpWo0=;
 b=AI1oX0trYhPs09RMZ1NA0wi/jsPxNHf6r0C9aDwI90c51QoHy2sgaApG7SdeIaTolZqxp+dEG
 7orulGG6Mu9DZGZVrtuxAHs7T9s8DamOuqUxBGNYkG/E4UpGkuEYlDd
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NiBTYWx0ZWRfX6po2kaoce6l2
 oqvK3QGium/6g569QApoFXxtz7tiCBTrrbjWYCC1FNxn+E5r1QfBWktHxNXcMdCKHjIb0OmsXkq
 3CWikqxNFT4MaR1PnJEWsvm93xfy7oc=
X-Proofpoint-GUID: vFdibv40rPjZ_v25kNgL99XemU6gGz2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NiBTYWx0ZWRfX63Yp7ZUDVVCs
 ABycJ46VB3A3pwEHyhpvJ3lSzRBCT4ERh91lvHeV/dWZqKtAaljoBxSAcnCwhdqFkC7zk5VCG8y
 RO5SMysAOK3zBb2sUgHT25eRCtZQK/wwLRuZsDukRo/Qccpo9aMqKB9HhRx8OFLayfbHCuCf2Ma
 gUVRntZgwZxSnoReRaS0k+mt1V6qE630mAh4LZdqjiLyYYa/2k546suT9YNDHC1pWFm1DjwQHZv
 M8VRihZP0y1tanEhYnMRx8ylJ6hd4nhQkXUV2ICrxtTD1Poeq1MyKIeOqosdlXMROTy1D0D2Dxq
 6yYxXdFfLTDLnIdo14BAoWwFGg6uuRwAsvXRjJNgWyaMiDJEVm2bB71B6TLyNJklR0br3MXe1kJ
 IbXANc8/IHG5KqqFrLME5UcJu8dtt5MYLjXIvNuQCCNv3eoL6F26kQ0IlYqNddzi/9SW/Inm3sg
 3sYbNAis6vMryy0mHmw==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5dbbe6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vykuwZLdp5Yjkddl-pAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: vFdibv40rPjZ_v25kNgL99XemU6gGz2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200066

This series is the SST-only prerequisite portion of the MSM DP MST
work. It refactors the existing DP code paths so that MST can
plug in cleanly in a follow-up series, without bundling the cleanup
with MST functionality in the same submission.

SST behaviour is preserved end-to-end; no new functionality is added
here. The intent is to land these refactors first to keep the
follow-up MST series focused, smaller, and easier to review.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v8:
- Rebase to next-20260717.
- Fix comments from sashiko-bot.
- Link to v7: https://lore.kernel.org/r/20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com

Changes in v7:
- patch 7: Use WARN_ON_ONCE() when pixel clock is already on. [Konrad]  
- Link to v6: https://lore.kernel.org/r/20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com

Changes in v6:
- patch 4: fixed the RMW comments. [Dmitry]
- patch 10: do not rename the existing struct. [Dmitry]
- Link to v5: https://lore.kernel.org/r/20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com

Changes in v5:
- Split out from v4: only the SST prerequisite cleanup (patches 1-15)
  is sent here; the MST implementation will follow on top.
- Rebased onto linux-next-20260527; adapted bridge callbacks to the
  new drm_atomic_commit* API.
- patch 3: added Suggested-by: Dmitry Baryshkov.
- patch 4: fixed "splite" typo, reworded body, added RMW comment
  covering both SST and MST paths. [Dmitry]
- patch 10: drop cached panel from msm_dp_ctrl_private; pass panel
  explicitly to all stream-related dp_ctrl APIs. [Dmitry]
- patch 13/14: introduce bridge wrappers and atomic_prepare with
  drm_atomic_commit* from the start to preserve bisectability.
- patch 15: fixed pass panel inside the func. [Dmitry]
- Link to v4: https://lore.kernel.org/all/20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com/

---
Abhinav Kumar (6):
      drm/msm/dp: break up dp_display_enable into two parts
      drm/msm/dp: re-arrange dp_display_disable() into functional parts
      drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
      drm/msm/dp: split dp_ctrl_off() into stream and link parts
      drm/msm/dp: make bridge helpers use dp_display to allow re-use
      drm/msm/dp: separate dp_display_prepare() into its own API

Yongxing Mou (9):
      drm/msm/dp: remove cached drm_edid from panel
      drm/msm/dp: drop deprecated .mode_set() and use .atomic_enable
      drm/msm/dp: move mode setup into msm_dp_panel_init_panel_info()
      drm/msm/dp: split msm_dp_ctrl_config_ctrl() into link parts and stream parts
      drm/msm/dp: extract MISC1_MISC0 configuration into a separate function
      drm/msm/dp: split link setup from source params
      drm/msm/dp: move the pixel clock control to its own API
      drm/msm/dp: simplify link and clock disable sequence
      drm/msm/dp: pass panel to display enable/disable helpers

 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 383 ++++++++++++++++++++----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  30 ++-
 drivers/gpu/drm/msm/dp/dp_display.c | 277 +++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |   8 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  43 +++-
 drivers/gpu/drm/msm/dp/dp_drm.h     |  12 --
 drivers/gpu/drm/msm/dp/dp_panel.c   |  77 ++------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  17 +-
 8 files changed, 456 insertions(+), 391 deletions(-)
---
base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
change-id: 20260528-dp_mstclean-f094cea8ca24

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

