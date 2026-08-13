Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C1D3E51F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 05:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786599913; cv=none; b=Vd8IhBlm1eyIJrqNkElyMAoaZ2eoNThRDb5cN+lqSmihWj+UwHqWOf7CMW5oPeidDUOuKcF70eE4gayXZw+zBG0+3DUSM4lwM+T44GUPxv9zZjHOydG00gKHgHfnO7J0+UoeYeeYH/6p6ryGzobJQoz3Ugnai4ZY5V6nSkdXgU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786599913; c=relaxed/simple;
	bh=EIM+00GCuvTubxKkRRTAMcjkkX/fC1S8PtugeUfQNHk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rfbte46LBEVjSpFH6YyrKxVnff0J3u1zOQ7rhunuP4qg8L0WbdyRlnjqDCTtC1tPUy4XiLkVZwDzjnx9TRBRdjAns9xTNqIR8uoVyVMUKO9hvm9iuuLmhhfJ9D+tKm+AN8gxHNZwOv0jdFoOcobQOLybRUqQOwCAoUxtVTt3qQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enYv7hXi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OrvyHOhv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enYv7hXi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OrvyHOhv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5gFJp2398586
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 05:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KHYyC+iAYlxol+c0pSnYJr
	gZM2/0AXJMpaGhwLaay8E=; b=enYv7hXig6UuQZZdxVn1DWDK8D9ibAjeMRlVhH
	eR0oI721K30CuyAYFkWJUfNgN6GfgwOUH38Lv5qLgErds48MKmX0VU1RaK+xvBta
	2XK/WWf/OTYTDSv8ZaHqUC/fhRJ274Kt8bpZ5UHF6syR42ek5BuJaumPk+1aiUa4
	x9MIRiw7VrqvfAa40o6clcgnW9QKyOy52y9vTlhWbwwyk6BISPUtHoW3dpKlmRgz
	5SbxuRjdtCeZJokOEt30bXXdFSZKg+5vQLr8/lfByAgLq1XI76gErDL2arPGypQb
	fnoFCiAbVN7Eob0HzEhHk6OR8gsFGYjji10qfqA9B/R1/gqw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0sk43skh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 05:45:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e048a801dso518411b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 22:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786599911; x=1787204711; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KHYyC+iAYlxol+c0pSnYJrgZM2/0AXJMpaGhwLaay8E=;
        b=OrvyHOhvaMiesun6HvzivWyA2rx8UvUfrlqnaRII+rsAonntf1v08wvYEVdmkALcqF
         CJMN9v14c/LtDHS0qZhNqOLHuSfZ77d1H3EKCg6Xwa6FKEBfgmK1McMR6cjWTgqzTx77
         NLJViiF5hfLT68yvJjfKzPbMlIMSGJg29IuwZDXLgszzz3JAltqrBeVlQ/vqdpisgr8l
         E2oyHYn0T8IoKamm1QqeyyJylAfOLEZ7ZRdAMgwhRVlrwOU/hlVmt/rk6THduK7vqcXl
         tnXxcbIMPfPMECNaXEYGLyU/D/pPoTmNEnSEprgyole0P2hL2OlN+q2dblXk1xiJCn6R
         QyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786599911; x=1787204711;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KHYyC+iAYlxol+c0pSnYJrgZM2/0AXJMpaGhwLaay8E=;
        b=BgFIKl5UTFk11eaqfzSDhHCcyiJhccAyC+M3n0ucbQhMnQI556sVfxX88zS2/h/H6M
         HnGr5ePEVyCJ7RMp8gq+5EI8VI/Fu9Terr++cWC2owxswFitBa3eYeGGzK+SGIVGPoeB
         OvGHaNrTl8yJnikCQN71eUAvc4gXykoHIKitAWs2eahoPozL+jvzkNe1Wrxnj3i6+zct
         TgCu/R0hOsCKBQPWjzJBrrrjsEeDe4F0LXr0WRUXbzjF+E9qi6RciqsjXOaqnBK59mgX
         tfpNIRJ+xdwQhU5/tGL4L5UdwkdQE9631u17PNbLyFHeypCML2aS7scrJ3oihpKALrRh
         FGnA==
X-Forwarded-Encrypted: i=1; AHgh+RqxC9n41qtL0lAyyWmOVonvCSJW2fFN/rLp12ym7TlfAjkF+lL1fIJM0d+eEr1bWxFGnISGGBfat1SvG+8g@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ3Yg+75S9ScU2nnk3mgibDs6fusYkTdmMd1ZLSbRB6HRg/a+l
	xOmDPJuKE2QhelH1bDYzWWWxceSpbIHBO+fIk+yKLsOPucxYeSyrgUsgT2hy8pbQwuaCscgICe4
	2DTUQEQDDt7me3HUsjbRvKyEqalkTwkNh6B/8p0vapcQ56eGZgN6N5+DOY4B/beqkua7v
X-Gm-Gg: AR+sD12VuaehyOW3f4FIa24kzzdh3ZsvUHWnwr4NOwzc5FD3+2EiE9v37jjpLPVv2ds
	ZJD8QG6cmwC8rkm5JTyMHp091n9g1QUqtoUqfT5Xaw49T6Qq4oLbNwHUsmlbS6kaokxTbovr3ag
	z9wKJ2u+EShH1EqmFPIaAw3jjyg2G24px6UMZAYQ9KSRbDDkUHmxlcftjb9Dd3Ff2erv71Lfzvw
	1ji8887DXCloAzGvk8lAW1ATtBB5+39/pDkrKMvxRVI76pShFrprJ5rgxhu8NxKcT1UU2aDX/rW
	yqldg1EXNj1YxAHWqF+aj2DgZv36mqjJL81YldfGQmVPtAyBCMVDz6ZWcdE0tXFqbgR1gylp1HO
	7nGoncxE0S7Z0YOpLNwZfwzHrFCuG98IEZdw=
X-Received: by 2002:a05:6a00:6c9f:b0:842:2a81:4c63 with SMTP id d2e1a72fcca58-84fc6e6395dmr3631575b3a.25.1786599910478;
        Wed, 12 Aug 2026 22:45:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c9f:b0:842:2a81:4c63 with SMTP id d2e1a72fcca58-84fc6e6395dmr3631492b3a.25.1786599909921;
        Wed, 12 Aug 2026 22:45:09 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc477e53esm381500b3a.14.2026.08.12.22.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:45:09 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: [PATCH v7 0/2] i2c: Add dynamic transfer timeout based on message
 length and frequency
Date: Thu, 13 Aug 2026 11:15:01 +0530
Message-Id: <20260813-master-v7-0-3f9010cf9229@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1ZfWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Mz3dzE4pLUIt0085REU/Nkc1Mjy0QloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AVFUKJGoAAAA=
X-Change-ID: 20260716-master-f7da57c7529a
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786599906; l=3190;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=EIM+00GCuvTubxKkRRTAMcjkkX/fC1S8PtugeUfQNHk=;
 b=wBGBpHnk7H/P66diXYZ2LehJESfWX0a+M/xJGhYJjTu080bBVsrRmC0/f0QhZVurNcLfwIHw0
 yFWB/PJ7jx/BUSHUS0CO/Wikd0vNkZUnc1i/uf9sloSYr/niTwwRFmi
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-GUID: re_hmtHkfgKwSkq2wVsu8MH1H9ril2TB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDAzNyBTYWx0ZWRfXywtSQ5HcRkaq
 ZvJKcnYKgIQEVXLFvAZRUmgmFSi47SeT8bChE/YOJh54gMYaQ8iE08k2BT1UveBBKt+MTVHlruy
 dszCqZp9NA3djYePbCjI3MPrTxhdPI1PRM7Dv2DfeizKyWVrtty98lJ9VYR1+YEHcdRBclkrgRe
 pEDu1bgutiSQS4JT6jaEDaVoCUTuhK5hCvNXMXB5iPs0XfjF6lRxpw1CwnX+wuLoYuzveeatrPD
 mCwqRRQNbIhN8n24qhdw5B2cofvhXY6Ix0LBtZjS8NxZLgvS6IidJeb6/9EIAlQd2FUd8hVWLtY
 1w8Gsg726HZx1m95isEqSqty6XjTsqioXRB/2CZsiQ1UJUG/jFTyK8waTc+JCVW3T3o+jMup43W
 1ijt1Bk8c+WuYEhTpMhPaaIWbFUa4X6cvqANbsX52zdNniKEmHiGni7DYFIQHL2C5ULCfjHPauu
 7dfxJG0R1EvDKj03Lig==
X-Authority-Analysis: v=2.4 cv=E8n9Y6dl c=1 sm=1 tr=0 ts=6a7d59e7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JvO64EORAAAA:8 a=m8JL0bDcoiRC_ExNt2kA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=Qz6KxWHdQ2_aS5WpiCfK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDAzNyBTYWx0ZWRfXwl4Y3DD4Qf9/
 wy8EofnAPsOj2OBgeYvMCUyDSI/b3r3bLSORZYAyzqN+CFRw50a9NAd9K5weOptq1J0/T+epC8V
 CCbofOG0IjSmaruFj+1KtsAUNikrJUY=
X-Proofpoint-ORIG-GUID: re_hmtHkfgKwSkq2wVsu8MH1H9ril2TB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130037

The I2C core and many controller drivers currently rely on a fixed
timeout value that does not account for transfer characteristics such as
message length or bus frequency. This can make the timeout unnecessarily
large for short transfers, while longer transfers at lower bus
frequencies may require a timeout that better matches the expected
transfer duration.

Introduce a generic helper API in the I2C core to calculate a
transfer-specific timeout from the expected wire time of a transaction.
Store the computed value in adap->timeout so that both the I2C core retry
logic and controller drivers use a timeout value that reflects the
current transfer.

Keep timeout policy decisions within individual controller drivers. Let
drivers provide their own safety margins and minimum timeout floors, and
avoid exposing those driver-specific policy values as part of the
generic API.

Convert the Qualcomm GENI I2C driver to use the helper while preserving
its existing timeout policy. Preserve the static timeout behaviour when
CONFIG_I2C_DYNAMIC_TIMEOUT is disabled, and let a userspace-configured
I2C_TIMEOUT value take precedence over the computed timeout.

Suggested-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

Changes in v7:
- Add CONFIG_I2C_DYNAMIC_TIMEOUT to gate i2c_update_timeout(); no-op
  stub when config is disabled preserving existing static behaviour
- Store userspace I2C_TIMEOUT ioctl value in a new adap->user_timeout
  field; userspace-configured timeout always takes precedence over the
  kernel-computed value
- Fix geni_i2c_gpi_multi_xfer_timeout_handler() parameter type u32 ->
  unsigned long to match wait_for_completion_timeout() expectation

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

 drivers/i2c/Kconfig                | 13 +++++++++++
 drivers/i2c/busses/i2c-qcom-geni.c | 44 ++++++++++++++++++++++++++++++--------
 drivers/i2c/i2c-core-base.c        | 40 ++++++++++++++++++++++++++++++++++
 drivers/i2c/i2c-dev.c              |  4 ++++
 include/linux/i2c.h                | 12 +++++++++++
 5 files changed, 104 insertions(+), 9 deletions(-)
---
base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
change-id: 20260716-master-f7da57c7529a

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

