Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944C83ED3CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 11:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547695; cv=none; b=cgA6FNb6SXfzKFMJ7QqeevfDOjXhnf24bJ93k+Ur0jVzF7spGTJQxj8VFch9a73m8+tFYenn60SaiNvz5HflBQJfZDLKXBD9Sz/++nqRIu3ukmWMkmWRjoG4OLsiKMYbBVwq8Oo5vNjqryMT0RgkcH6oIGKLcuG1mY0SPgHeoVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547695; c=relaxed/simple;
	bh=y/JvSyMfS8L7pvQPfF1HhGAMSKax9xThh+ckULgHJIs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uOQ+G2ZjMXpEOVQkJWjb7uUJT575fiBWdbJ2aD8bu7uP7q0ps+ZhEMcd8pjrLblkIbJSo0H/JkDNNiOYk3FrRI2vEnrBIuxBSdYuHAat4c5bjr7z0zXD9PZ0AWZIlNPrqqB+COFXIc3PtJTEnu9uLfqxgyYRjNkHYdX061grZ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fqy/+PLC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3ZzxVJU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fqy/+PLC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3ZzxVJU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAw2kc2377635
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 11:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zfqwD3OQO+OV4T/Qmssm03
	QpfKhp6DK+NHYzB3nuAdE=; b=fqy/+PLCAleK8pfag1RTyxNNo1suB4w0QMATCe
	TwlyEfvFVVMTfVh5bv11g7BJHPNMd7jDzaTqINCvtWW5PTN7iRG8u208d8z7fYBo
	0v/HOJtAlfPfV9uHD8aNb5STgddWtgNpgsu9aLwKRQoATRXiWza/bA1XEc15HpJS
	P5O5EhmkZF8WpMl8L/OGy3iETlr+OOcPrv55uT1wLOiKsenHkmNY0SecaoaDN4ce
	3XJ+A/6aPhr6sGgGE16OMvVIlR1pY4xqx/+0rLqtBm6nSXGggBVO04qvbE/zwhYT
	lTKRB0aXejS47XKRKJzeTG1powkCAT7Mko7P3Mxx9XguosMQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre8pe4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 11:41:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8482b95574dso12932537b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 04:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784547689; x=1785152489; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zfqwD3OQO+OV4T/Qmssm03QpfKhp6DK+NHYzB3nuAdE=;
        b=i3ZzxVJUQj6Es6delEC12fX292UeLpzV5thwPoK6bgFAIyPJkLaJR9EY+nt+ISga2R
         fWMU19Pl46LaQlP89p6WGO9KfVITdU4KbH3UcOePZ/WjGyopMiccmmqBSaAi049O6ZV4
         g7DtbpuWB+IFrSvmANLdWp9/REg3fGRylewRIIb3KcFsh4VlB8EPqo9ZNW+uzdEQNNhT
         WRaFp70TeUNq9wiJpoaG42oWhdYke3N3CNpoD4AUqm0/HO7kfkxP3MZ8x5mApShsdN+t
         /ULyuDaWbjAeejQJOyyfLY/KTWoKYlpWZzgKerP4uRp9/Az5mvNlmTfSVFHEoJ2jLgBn
         onKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784547689; x=1785152489;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zfqwD3OQO+OV4T/Qmssm03QpfKhp6DK+NHYzB3nuAdE=;
        b=sVfwmy9jpXSWUOPL7dRbNlMjezJ1ympvSeskUjysKzdngFET6b+GK0QNithK3pRZgc
         Rh6t2jfKGYcxBO4J04q8AgAW56ZhQo/kQiYJqQBKvSHlO2pZOQOQQ/VU1z/pwSiMk7Md
         ddUzt/FuRe20hotnGQ1czNDtZSvwBNa9HxHBhpciPgVhU0e6/jkUeXXjAU6UA5C31HuT
         RXNe/BxW76s/DbTvQUsnjN/Hysc+GBnhywyaNd4FkLsjPudxMvmLg3Bp6tyDWw9tZQq/
         J43ZDPSsjNKbcEQ/PmQTAe7JE2W4yf94xSvhrdqmQuadIMtvt7XTXHSvknl0JFMl7Dm6
         4pFw==
X-Forwarded-Encrypted: i=1; AHgh+RoKUfUo1QOkGuyIpjEHKW7q+wYtTVD/uR4yJ7BnVf5oIJgzJoDed4sRNtV8h6RWs/qMagjAPvUSxTdegK7q@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ28ESHdVWxOwwXyLOfMgO6C5NhbDMgEKjRXMnkjiniM39CSl+
	eRrUzrdfWKQZfvleUUlfJFczJrO5eDfSnj7kv5sv5yDhRWJyZUtzuIEIfoKxfYyXd5IeKa99vcv
	WDDDYc6Dr0CBdacpR+2rX+ZBgNgwkdDDSmdwjYD7kejfV7M6RdFCx8J7UT2bOKh3Idw+nZgGUgd
	Fo
X-Gm-Gg: AfdE7ck5EHM588lpxWjfYDmYdObHXt6XqSE0sESA/IQmaikCIMzDTxe6rk/h6CIoMOp
	pCKKEG+qrPvKGFyDLfoIlnLei+XTHbitHQTy3FSIefZUtTrWD/02uzIgPSB8XyiuHYjXFBwdJ9T
	ZepI4X2WGjRpJbXFO1Gid0f2k9axSjBzbX17XIhkyIZAy5nMPhx/STw7bnMvhLThy3hMpSV+mlU
	PGoH778Nv4ZF5JsgI5HSC3z/toql9id/VI6R+apJEnOU3cdVbSUvgMgwFKz78j76Js8zCxfEhUe
	eCUYOgv9Sn1KVzL22mNZ4wpGtVEqZGsG50QPMJjGiTpU4+cKM44ODioQ6a6T4O68m2/fIb9oWoq
	yUrN6fQqlLTXuh7GT3fH9vdISpSwfB0zleDU=
X-Received: by 2002:a05:6a00:1d98:b0:848:57f3:8f99 with SMTP id d2e1a72fcca58-84c2953e769mr13863156b3a.56.1784547689104;
        Mon, 20 Jul 2026 04:41:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d98:b0:848:57f3:8f99 with SMTP id d2e1a72fcca58-84c2953e769mr13863118b3a.56.1784547688558;
        Mon, 20 Jul 2026 04:41:28 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adfdfe9sm5450701b3a.27.2026.07.20.04.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:41:28 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: [PATCH v6 0/2] i2c: Add dynamic transfer timeout based on message
 length and frequency
Date: Mon, 20 Jul 2026 17:11:18 +0530
Message-Id: <20260720-master-v6-0-671261b05c61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF4JXmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Mz3dzE4pLUIt0085REU/Nkc1Mjy0QloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AEbRr7WoAAAA=
X-Change-ID: 20260716-master-f7da57c7529a
To: Andi Shyti <andi.shyti@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784547685; l=2334;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=y/JvSyMfS8L7pvQPfF1HhGAMSKax9xThh+ckULgHJIs=;
 b=/799jFacbkGkI516x+646eXmAnUPkd9DiK61RXaF4ScfwRZzTVIZZ7T5nMBIyTPe1bJyr/Ztf
 CzroIF+MTayDsFCYXsGbJsLYDMKKNOXUo5luKDlOii8XIYJj930UfEd
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyOSBTYWx0ZWRfX0+/vwL3P1avs
 ACo8ZfchHNMTm8XGVvEzpbbXtmFDxHmJ1o+HHlKpmqbyZb3Ev+IoJcT1MDuST2Y6h7zBUel99DD
 eaei6SYpPp5S1PDKtIdxuXSGBAVz8fs=
X-Proofpoint-GUID: JqR1TW-z4YBTi0YdDnb4mUAZL0zZWpSC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyOSBTYWx0ZWRfXyXZ+1FTtuNUH
 l0VMVU4xB4b1luJLoc6to8MgBTupCErHowyv7DhiHdam1LtFvDxqk5cni4tz8D6RN12yEFA91/F
 S8x4pg86eg9T5BsUX3lqpg3rK23eCAGTwO1YvPVC8J09RYA4E9Zca+lXm9OYtcuehbcqk10EHig
 cTEtRximRBr0M0H01PnzOxzHNvxItnIT5hynwA8tZEl4zBZlTJzcYZJdYZY37smqVz4Wqwf9PQ4
 xgJC6E5fFYj1jHKPP5jsh/kN0PsStx5Vq3VtATj2BPgkSWLVvO3+YpIXbKolE6ZcVnaWVSuPmgx
 yRKo8bGgoLm/AmWM/dqGHElKFUJO9x9UK0bPOkK6wobZsqiKuKaUTFJ2Hoh3PhtPfjFoS7vtiD8
 EDr9Gi8G7CiwoqcgDzIJ9miSAkrNtimb5TRcUGF3STego92UNQhDDQN+9FMeRBqajzPiCDOHmUs
 +4jZM6F+iksxBM/eYCQ==
X-Proofpoint-ORIG-GUID: JqR1TW-z4YBTi0YdDnb4mUAZL0zZWpSC
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5e096a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dEJld19eDyxHv94P0sMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200129

The I2C core and most controller drivers use a static 1-second timeout
for all transfers regardless of message length or bus frequency.  This
causes unnecessarily long delays on error paths for short transfers, and
may be tight for very long transfers at low bus frequencies.

This series introduces a generic helper in i2c-core that computes a
transfer-specific timeout and stores it in the standard adap->timeout
field, making the dynamic value visible to the core retry loop in
__i2c_transfer() as well as to the driver's own wait sites.

The helper accepts a safety coefficient and a minimum floor as parameters
so each driver retains control over its own timing policy without those
values becoming public API.

The second patch converts the Qualcomm GENI I2C controller to use this
helper.  The 10x safety margin over the theoretical wire time and the
300ms minimum floor (to budget for clock stretching) remain private to
the qcom-geni driver.

Changes in v6:
- Split into two patches: core helper + driver consumer
- Moved timeout calculation to i2c-core as i2c_update_timeout(), which
  writes directly into adap->timeout so all consumers of that field
  (including the __i2c_transfer() retry loop) benefit automatically
- Driver supplies safety coefficient and minimum floor as parameters,
  keeping I2C_TIMEOUT_SAFETY_COEFFICIENT and I2C_TIMEOUT_MIN_USEC
  internal to i2c-qcom-geni.c
- Compute timeout once per batch in geni_i2c_xfer() using max message
  length, all internal wait sites read adap->timeout directly

Link: https://lore.kernel.org/r/20260715101805.3615166-1-aniket.randive@oss.qualcomm.com

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
Aniket Randive (2):
      i2c: core: Add i2c_update_timeout() helper for dynamic transfer timeouts
      i2c: qcom-geni: Add dynamic transfer timeout based on transfer length and frequency

 drivers/i2c/busses/i2c-qcom-geni.c | 37 +++++++++++++++++++++++++++++--------
 drivers/i2c/i2c-core-base.c        | 24 ++++++++++++++++++++++++
 include/linux/i2c.h                |  3 +++
 3 files changed, 56 insertions(+), 8 deletions(-)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260716-master-f7da57c7529a

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

