Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22209418A38
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560089; cv=none; b=lGZ8htiaDKY0l4NN37IJdUoKSiJow6lpx06/Y6l8Tbe9eO4PB9HuyVSAlbhdR2C2hKnaIMZNClKTWIBOjbaWA3z30JXTDM4GNu3E0toKWWhA9/B5r3BuGtF0brjTIAk7k7rlJV45cMO32RXL8nQhZqFr2IDWc5uGTI8/5vbkZ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560089; c=relaxed/simple;
	bh=7WLCND/ZXGAyuMsyPwAtugUkkMEKi8fZq+9tUxivf5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s/L93Cckiyhs5yidAuL27JGf+ULLfdsx7pdrhn6sT1QBvmhvg3blEcAl6RoXtFtkIp70be+49bRnmCGIxHQn80IhG9AV9HAMJVK7HtQHpxlM9kbxyaWuCpCK6qm7pGbOjCgGHAly9dy+4pdSfDT9Al5hO+pCKhGoCBBESjxmdac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLLvt+rl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrQRY2nl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLLvt+rl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrQRY2nl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqeGL2604308
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2sUNNETE0h/q96BSYwXRXi
	Gn6f30NVrYm0hZ1/p0G8I=; b=iLLvt+rlvSQtLaBtXNrnal0A8Hwvt+5Fm+Q09D
	qtundav73bMBc0CMc8Wf+ze1+6OaySs4lLhqR/XKrUbSmmGNsShHVNtAccahOa1F
	c4PS5tSq1YzpB5utTfZNrjblfJ8pOm9/Hkn8uboVAiJsPPXGNdENcXnx+gN1srCd
	dyDfzQMMcbyAlv/JOvb6mX6+JduZ+k87Ih8gK2e6dB7jczvlGd1gblMmDL+KuY8Z
	VRnu9h6UwlynhZY7kBZzjsHWAjuNLbTY+sXAEKaqPkZUus+g55fWZUVJpMVR1Pg8
	efz5r2moAmZ/F4EZl8z8KJVHVqGed+vrnV7NOMEX0SC1uJfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg9sm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:08:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so9804642a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784560086; x=1785164886; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2sUNNETE0h/q96BSYwXRXiGn6f30NVrYm0hZ1/p0G8I=;
        b=YrQRY2nlcfaJ/+M4T99m0X3LG2fE3bKoVkEu53LNZAnnTkLRSKOmGs6+5kJiymnIZW
         Hm15doYHkNpyCiJTl7XllKPQtsQgNvEAx3I9/3tx3mxO8O5tV7VPwYFs9cD7ZvbFoRFN
         O+LDuNZckvEkf3WBNTTUF+SxVPsd5v38cw/jK0zCUBy5uRgn77HL6fN2IjgwgN9mOVN4
         lGmb6oqwSYbfbWcf8TofNTusB1BQ1GwOb8PsXiOHGoUhutTcbMCWWd1nTY5ab5vCbWR9
         xWYDq4XpvdZ2zExm1p+BCeVjDTJzpq1SX7AxEzOaYZ4/K/At0VXZD2u6DjvsBLCXbKNO
         UcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560086; x=1785164886;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2sUNNETE0h/q96BSYwXRXiGn6f30NVrYm0hZ1/p0G8I=;
        b=EhprJn9A/xtnm2d/eAdZtTJo04TbPHOmcFyO+Xp2IrggMFMQLO4MWiNju0u6jKWOjp
         PINgq6zzxOQD1Qe7z4uGcrtBCHDiLnr1YxPqVFb4AW4RRXe8VHuE2bCJsgL7XixTSsJe
         LRZK12nHpLAxneTkd+z4Zbs0w02PFs8yrLJRRKb+PDIJT7+qPQwIb5BBeXUE3E1I6zrR
         059JRqacYNfnYM3HOMflHBXnRvA5+wqMMfZxsSYgVNb+07YvmE99TuPS8LNWuv+zsj8a
         Qx4r+ZykWqxplQeb1FC6koQYkGVl2+wnc/0oaSAAiy9HeN096dbYqSK1bcnQIXY6OQR9
         xo8A==
X-Gm-Message-State: AOJu0YxrwVYpK8rnkXg1f5tLOHsqHjakywu2zOKfHeEI5m9gV2YGzxU2
	YBjuOKVTvm/h3M0OWwu4kRGD+TsL3U7XWkkcUUwpCn6V3/TEX/5tku5RbFTcbbymoqJYDygorSK
	hWrFXrX3G360KQlXn/cdpjRuZ1PUQ/eBtKrMto3W6qD5Isw3aXF92yRTOhomm7K/U5JWr
X-Gm-Gg: AR+sD108En3IY3pUvj2/Xd6gns4SUSHMZ/sdy336w+u5SNW2Tv6Z3H+93YqP9khIkDJ
	HFh6jR4H6rlMbKWJsQi+iAgEEnA8PEmlk1IxkU46oav8JgWrOVIL/y1Ahv9/a20h75yd2FhiKea
	ioDz/Izeejl622jL6A12YRydQjQrGXFdNvnkmqApGhX9S0powyUfGzYqCMZwtOv0O25EoSYZQI2
	MQM++5guKTVvdhwTsXZu30IPSeBnEKPipekvMw6NUBC375odijzBuCTfzgVpV6hHPsLWT2BrXhx
	2Yq/trFl1HEFOVjxhDsPORyFjSDcxEMT/gC5Qucnhh6qWQFeMTsl+rN/UNmS7Pnn+ZijQpBA1Ph
	MnHlS1cWziYcK1pgvr4nfiG9hOTWTzUOrQQ==
X-Received: by 2002:a17:90b:1d45:b0:38c:e9e9:e7ce with SMTP id 98e67ed59e1d1-38e4b41bfd4mr15181179a91.3.1784560085772;
        Mon, 20 Jul 2026 08:08:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1d45:b0:38c:e9e9:e7ce with SMTP id 98e67ed59e1d1-38e4b41bfd4mr15181122a91.3.1784560085273;
        Mon, 20 Jul 2026 08:08:05 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e0531asm7856411a91.5.2026.07.20.08.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:08:04 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/3] serial: qcom-geni: Reuse common GENI framework helpers
Date: Mon, 20 Jul 2026 20:37:48 +0530
Message-Id: <20260720-reuse_common_geni_framework_helpers-v1-0-c3330ab9b982@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQ5XmoC/yXNQQ6CMBBA0auQWduk7YISr2JMU8oAo7YlM6Amh
 Ltbdfk2/+8gyIQC52YHxicJlVxhTg3EOeQJFQ3VYLVttbNaMW6CPpaUSvYTZvIjh4Svwnc/42N
 BFuU6pzvTD60JDmppYRzp/btcrn/L1t8wrt80HMcHZW+mZocAAAA=
X-Change-ID: 20260720-reuse_common_geni_framework_helpers-787081bd61a7
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com,
        mukesh.savaliya@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784560081; l=1120;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=7WLCND/ZXGAyuMsyPwAtugUkkMEKi8fZq+9tUxivf5I=;
 b=ba6QyJoKq90zD0bNNORo1pakURnwN5hTDD7brR3G5XDa74kxLjzDFk3kVJFU8lSfFm6lkhQjF
 MhlxVVjooOIByQVVOanNW2o+RP1+G4Vn8F84b6RHkNtjbwp5ycRIcZs
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: RHxGu_YOrU69MWPLQfxNbyTBKMof3ZB0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfX42bNSDGu3CSH
 FxeeLOYA40SFKDymAKTpn/joivx7Juei+b3QLDd+n8Fk1anvmfvrX2+g4ROYRBI3zugsf8EFEFE
 m1rqksLmGooKbhY9etxKdRir9xIbt9yR2RIS55T3wuukaqS9toD+LPDZnKhWagc8E+LfRtTmiRX
 G++vOlV6qp5Mfk85UFfDGoFMFn3Tmx8edJCjGNxgGZiEKGG+kRBS+NIYOP9w0kPsT5N1yZOnGwx
 J9Ew/fwzOzDg9m6P8EQlvO4DH3+sY7t/9BJFIo2DuTdsgQTpfyejPyUlgPyHvdOb9Ede6Hd814A
 bZi6xHO1fkm0hmoQMXVK0dlgFWY5yzXlhntpBK9A7Sc268wTAVdT7695i0v0UMA5V6mpoehOlBf
 Sl6A+5LbDPPVnVudqNLOYQBjHR3Sf39fkMNwHXz+yvZCz+cwXcrRs4k+qbxKmg80c3Eb2x5DZSt
 jyjgwQnsL8MKU/eHscw==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5e39d6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zYmsmQLqyy5UlMnypS4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: RHxGu_YOrU69MWPLQfxNbyTBKMof3ZB0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfX0XsUOAp5q97M
 zZhilQ+n3+jCyIx62TpZw5YbOM/ld115tJfe4ZAv67phySpbcoMZgYotv4C7APGJEG2xSvhfayl
 Z872r+7uNMUnkpEDGS2YvuQcUJ5VpMQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200167

The Serial driver currently maintains several helpers that duplicate
functionality already available in the GENI core, including resource
initialisation, power-domain attachment, runtime PM resource
management, and perf-level selection.

Replace these with common GENI helper APIs for resource initialization,
runtime PM resource management, and performance-level configuration.  This
reduces code duplication and centralizes GENI resource handling.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Praveen Talari (3):
      serial: qcom-geni: Use common GENI resource initialisation helpers
      serial: qcom-geni: Use resources helper APIs in runtime PM functions
      serial: qcom-geni: Use geni_se_set_perf_level() for baud rate perf level

 drivers/tty/serial/qcom_geni_serial.c | 204 ++++++----------------------------
 1 file changed, 34 insertions(+), 170 deletions(-)
---
base-commit: 782f4dbd1794b4f30dc116a7ca42c5962c409be8
change-id: 20260720-reuse_common_geni_framework_helpers-787081bd61a7

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

