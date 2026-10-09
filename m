Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ECB3D47B5
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 06:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526122; cv=none; b=sWY+q/yVSCwWk1SQ122gK2NqhYUcPS6EBIpwqyaJrKL26C83iPM4nBcdMHuDKMS3xshc1yP68iLAymO7eIhNstYM3KUMyPNV8yKXBH1PTBSV6T2XB8/tQHWp5dNBQx0+LTg0iCOQXnGloSah6Fx3ciO54EUcQMtIqL0DpBaz2hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526122; c=relaxed/simple;
	bh=bDo5V1i9/RWDoQwxQteEZEwD4Ri1WKSOwqyfFQS4C/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gHUxrwAs3atD6c2RHtQlPQgRi/O0Qi6ElMD9ZOtlB+tkeKgibcD9RGyAaSlInqk1HczPMxzfWGnjoRpfL37Bw+RLtIAX7fdixQfRF53qj10AmPfkyEqa6X7QKeF4WDNmEPKeU7jT3HMuiAx2auHWdu9zexMjbOknGCUJxswuMUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwId+N9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bekhIYBo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwId+N9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bekhIYBo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HHNP451485
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 06:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iArE7Nqfazy58+toWHiMvr
	1jpYAwQqNWDVhTADvn7A8=; b=NwId+N9J7yHsG68MqHb0RK1V5NCl6gkdleS+qq
	FbM4QXl5Z9iZVXSumAhDBKuIvPy/yDStjstuBal/vFzkIF72jaWzcHhd0ftK/2Ky
	n5o2sx4AFV/42yoxeoD77bGaKEwQb5LxyO+10ADOOTZ23mHVbqGmgMp+eCK47SvY
	P+xKpYMRm9IczESWw/rGrlBI+ZyJM9YMlMfXCfk2xJHQehT1N6IqqQMRjI0GArwP
	/MzNp0YJEhkP/vFaDuxdalKMRn6SWSHlSHHJPcF98CQZAi7ZRN8OjvmTmlZl0E11
	tVIBLMTiGgztkOv8wvDIJzUxUK5UGx3xVD/KFhdoJWBjo/cg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kkb0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:08:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso4124835a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 23:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791526119; x=1792130919; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iArE7Nqfazy58+toWHiMvr1jpYAwQqNWDVhTADvn7A8=;
        b=bekhIYBoB/9pylM356xkcBTHIrYVTlo30VQo8blFPAEL2kgqc4M+OGimCc9myS0H1X
         0Z1H9YDyMNlMbehrY4KcgylSzx0eeXhhRrzAye0Tdm172QkTGyNcu6i0aYxk1BzdqlAG
         PeYrpKDhD5dcBWYI/0AWY/f2Tu/ujooyD+rEhfFuinioxdWIKDI4AQVRfQHsyd4rmmYU
         XlXGME0zb/fLAdB7UaZvJfhCR57oWi8SCy9UGDFMQCPEECrSKOtRTvrDuJoEa1mPh7IR
         fwr5zyP4wsWU1e+ETboS4q+Cf2Bszo5VfK+6IUhlJOzH3ct8r7GUIzA67itJQEVFyRtm
         ivKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526119; x=1792130919;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iArE7Nqfazy58+toWHiMvr1jpYAwQqNWDVhTADvn7A8=;
        b=NMrcCQWjzZIWIOGPyfgbcxawz4zBYvQpWksu2fb2S/SKdX4Yd1DeI70d1jiLuZ7rC+
         AAJyvXynp+U5QJrYqz8eUisJWakW+Pxw6L8VK72AeQcMi14201cjoz3mw6pFF21sjeu5
         Eb8Xf8hE5UxIRsV2v8ra5BcNJf+W/xOJyxp5RP8LwLjaS5Lqf7WVAwY7+i4H3tkXyPZZ
         SVqEcF4duB7ELOQO01bxTkz1Jff37UlQKxTxC5k8XVId0DPMhQvohG6KC/MK7gcdzX+Z
         SN6rfulzqOVo12TtDRmmZJMPL1cQJyHHS8V9YAlq7TvjFkaZkhMWAJI15Qa/LeSJbYjJ
         GvtA==
X-Gm-Message-State: AFq9FYLP+XTZS1nPfQVTKui7FRGDYjaCNIb51ociFuJhjtyB46foRqKO
	UcQ39fkrjj8nRZ7RUn9TyaWiNJw334a37GdjAkCREPXMia0MNm6qlK8/g/jzH4qkLQ5BMH2iLGZ
	fBjKom3y2bDjZUak99kXSOQVFNqDgclNmMaCpptiUfv1e0sq1fWZeVohAvw3ksR3hpAhH
X-Gm-Gg: AYBFou2RI1/OAYVrgMjacbLiSx1VVtbys8M4+em0MRv2vszVliwjyVDoCxIf86D1JLh
	j1X8TDjojczbSKU7xpiIdYU8JxcEfgKvcC1oEpnwKsDV4W/utp9RjW2jrRGK6bEv2uwpqTGVscv
	49UqzubZZQDovcPdaHX6kixd9TBXTFwgD18hKEuIFk9129BRD0dPKUXDZr+XnnWJs1uAMSW8liM
	ALm7zC+M1NGmYFJ8PL1HKeU0tGjBIOgN8fpzSqbsT3szB+e8Z91TNtZ5sI/r18PjS/oMzo4/M0n
	3frjX3SHGRPRrlx5VfAnQYXAFbVjP0NbR0e3H1nWLqqnRQSa9KSqpDyaFr0au4VKgKcajNHAxXh
	cfeHonNtJQlAjivGif4JseJK+pfAOTw==
X-Received: by 2002:a17:902:f54f:b0:2e2:e5b2:6451 with SMTP id d9443c01a7336-2e842cd23bcmr8021065ad.36.1791526119284;
        Thu, 08 Oct 2026 23:08:39 -0700 (PDT)
X-Received: by 2002:a17:902:f54f:b0:2e2:e5b2:6451 with SMTP id d9443c01a7336-2e842cd23bcmr8020905ad.36.1791526118834;
        Thu, 08 Oct 2026 23:08:38 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8e11sm4010915ad.57.2026.10.08.23.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:08:38 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 11:38:29 +0530
Subject: [PATCH v2] clk: qcom: negcc-nord: Add frequencies for
 ne_gcc_sdcc4_apps_clk_src
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-nord-sdcc-clk-v2-1-e00ecfa321c3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANyEyGoC/3WMQQ6CMBBFr0Jm7ZBOoSW68h6GBbRFGoFqRxsN4
 e5W9m5+8n7y3grsoncMp2KF6JJnH5YM8lCAGbvl6tDbzCCF1CTEEZcQLbI1Bs10Q+plNdSur6l
 pIDv36Ab/3nuXNvPo+RniZ88n+r3/SomQUFeVokGqjrQ6B+by8eomE+a5zAPttm1f/jVuQLEAA
 AA=
X-Change-ID: 20261009-nord-sdcc-clk-1b23f4eb4177
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: UNiN1zYMJEeAqqo-xsFLy7YaTXiOkbti
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac884e8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E7-qh2Fnl_Ea1JZtUYsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX0D10Tf+yxd3e
 7KhV9RHo5g7A3chtDA3AeH7TIpOZS69x0dkFfwVHiZWPSTYjqm9Pyk4TG15e4qOvfO7l5uAIL2s
 OC5IaisXgIWDrTUPwNGIh0gMLJFaCtY=
X-Proofpoint-GUID: UNiN1zYMJEeAqqo-xsFLy7YaTXiOkbti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX+rB4aRDp/83b
 kT2ZfXVP70S6OKupcq1qgBb1rhZLdLh5sCM3m5KBPz/tZKE5x4Bms2EaWB/0ppNiwqK95r488X6
 hNBT79YeXNOtAZMQN5126Iyh8rpCxNEitGU1a6BuI3BnS9Ip56S0473vQW56jZ8jL0Wp4Uno2u7
 HhIYt7Kc2ntgPd2b3QUG5+RHRYdKC5aUAQkD6Km1ITNDPIgG+bdNSrN5oXHgZYw3sLRSzZVzTmg
 pwBeBwoxO3Pvu3Y8+IQR/Q/Qlc9LmKjilUO4ssbLwF4rJA5m1wjjCjDeBlpl3tnfiZ/Z9X0U9Q1
 klgTYrVMQC4Y4zYOoFmez79BoB2koT3oZBmk1VToXiI6oBNmOjto5aM8iC+fOo/trgsdajqc+FW
 ERzDs73j0P3nOuaAl+WF4PRLAW+JI//EPMWao3JSvJnnKbvO8TvMK4WBcydDZRZEQP7i6yKYFPo
 QnIQ0ljpviq6YzmTYdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090024

Add the frequency table entries for ne_gcc_sdcc4_apps_clk_src to support
the additional clock rates required on the Nord platform.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Updated few frequency table entries to align with pre-div reg width [Sashiko AI review].
- Picked R-By tags received on v1.
- Link to v1: https://lore.kernel.org/r/20261009-nord-sdcc-clk-v1-1-63351f25a165@oss.qualcomm.com
---
 drivers/clk/qcom/negcc-nord.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 68ce4d6278baa5888b277fb34a135d7e5beb789a..0e33737475d98f1c37853a5e234831d03dd50aec 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -436,6 +436,11 @@ static struct clk_rcg2 ne_gcc_qupv3_wrap2_s6_clk_src = {
 };
 
 static const struct freq_tbl ftbl_ne_gcc_sdcc4_apps_clk_src[] = {
+	F(144000, P_BI_TCXO, 16, 3, 25),
+	F(400000, P_BI_TCXO, 12, 1, 4),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(20000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 1, 5),
+	F(25000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 1, 4),
 	F(37500000, P_NE_GCC_GPLL0_OUT_MAIN, 16, 0, 0),
 	F(50000000, P_NE_GCC_GPLL0_OUT_MAIN, 12, 0, 0),
 	F(100000000, P_NE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),

---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261009-nord-sdcc-clk-1b23f4eb4177

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

