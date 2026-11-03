Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696212;
	b=Y5W3kizzQ1SoGgPv7CDsiZqAvRyBTFDLh65VYX+uPI4VKjgdarWvYyxAMBzr944X+7D5
	 P4KgBJJOgLAfJfxu6WTkVpFA25RZ6Q6m/ajdtVcV7lzWumfBmy47yYUt8mJXZpnjnVUws
	 tBrhuOnuEUZo8eWvg2ll2nJOp3TIlJiQjdEsWyZmXqXLiuHfmJt+xQOVM3cn+fCwcO17G
	 wH+PhW1Mfk8r4zQrwkY0QbRztnpiS1WCZ7G0RG2EP/Nhqh6BhmKTtbJLLxwzQxR8IphW2
	 VmvIUguNAOi5CJdhhpKYmiKN7mnXoCp6nLn8tMGYghJfSBHh5Wr8obxtNundjI73ODw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/2XqUpzEZxP6DjASKfwlo2XiGaEyGtmb07VuZYaRpFM=;
	b=oAn1ei/aKGk7+AeGhD1XUl+TeIU2bd3oS2ISBJmYDCsJXRoIczAcPI5xQvGnTQeA0zUa
	 vK6ysBhVt9td7O33+E8O0/qEOpwg2sHIyVIJCVA/JI84iNEcrP0Po58vAMX6C8SqO5RFk
	 CixrXPFJYnVW89ryKtzWHUk+uki71rKv3KNduxhsMEfSL93cJRa6bn4aE33RLhEn2P15k
	 Dp7dFP7ftfegfcPtPeCt/8B80U195C4ZEI/aNtQY6yIh6j66WQzARIaVzRWd9EPxONrUq
	 ILaOjCfrw6DvRWnwfbWbflt4iM5bnWbLqabNdu6bCO817U4Kanc0bMXNnkbtPAcRr9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mtqz9JOi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="N9i/ZpXZ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E432A606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 08:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E432A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mtqz9JOi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N9i/ZpXZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A352mDn2449162
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 08:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/2XqUpzEZxP6DjASKfwlo2
	XiGaEyGtmb07VuZYaRpFM=; b=Mtqz9JOiOulxvyV/ROh7QdqLdCAUPpi49zCVvb
	XGSQU/lQ3RE86Y/hIiHHpbnVV2MNBCPGrV2wOr6rmKXSOFdOynp2QjJdeWkOta1I
	cOrtsbcYT7Z7lHHDcuEveSRSYWSdeTIzjRYQ3ZE1ZMzsDypji6s9WODPS0MsiMaV
	avPjM4usyRUGwaESNIwoN7jxWP8t9KY/cz0WQ0yKuBGMjuy1YkEnWfr2bOXjIvDt
	EUXnXQ4wCp8wmMV6fhsPO8hTLlfyTuA6+BCwfDU85SVwcfG3/rWEHQo7r62M4ozT
	dIJ9rgkIX7A/X9hXYUd+YUJxAu8lmJw+dXVFZc/Fy9fI2kaQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94crusb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 08:56:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd67e98f68fso4158776a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 00:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793696209; x=1794301009; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/2XqUpzEZxP6DjASKfwlo2XiGaEyGtmb07VuZYaRpFM=;
        b=N9i/ZpXZeYC6eEJNSj00AJ5+I3vu+6RXsU+dOjYvEmkP0IjYggDc2GLR7D/Ylz4eba
         P8I4C1qclcNAe6UOWz6LFAuWu6YQCPjE9vo54KaMUGTwbk357STLPfr8myF+BZW3gyB+
         5fOFOSrCjSUSUHtCkW7NIFdicAILGIJjKm5D9mvNNXMr3jnSndRXTM8TxhO9EO7mQqHB
         P33YamhT2yOXsObj7XWydRCLiuzQhcjsEZTsCIJC5UpWHHLoVAEEtzSb7Lf7HYBCrsoF
         zd0KVYDJgZx8voD09YESf3caKaK2FWJmD7VBRp76NSVMvgwKLQ9pUxemwXw5Um+GTffD
         L28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696209; x=1794301009;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/2XqUpzEZxP6DjASKfwlo2XiGaEyGtmb07VuZYaRpFM=;
        b=OqZN54seBw0DdM/xw5RMi9IgdHFbGPs+yn9yIP5XZ51OGQYJZ1S0/SYz9WiajIH7Io
         IO4a6uTm48phHnv1V6IG9F8ejE6LwNUMmGzmf7OZ1qJWII+tFWVOKjbf32zedO9PK20H
         Dc0+4jXpQGmuIpeBV+vyMGl04wCiYfUp3iqIKA3Jt3+DBvZti5GihEHL4qZsD3K2LyoE
         LGxuFHjiE9QMQcIw1V9Hsv1F6P/ze2WBSDqyNffdBs61oT5397iRvsLc5urinAeKlnoj
         fbwbhYK3wltPZWXr4ZQu4J+rIKE6oLWaV5pREu3rUfJhEPtOK0beciw0QNzPISpJzrPW
         58xw==
X-Forwarded-Encrypted: i=1; AKwUvBwrw64gdx8fpO5UyPat6bqFbJThcWTlKMkmdZR66cJF46p+QBC+gVmIBZ/r7N821FYg/ZCVyUTH2BKTmmPz@vger.kernel.org
X-Gm-Message-State: APuU4Z9e32j2n0aUIKEqYso3DBN983mjTRTssQZt9bDzDzYMuORFt+Ex
	RvhnZhuI46Pb+1EyZpscX5DiqqWSg0NXXizfs/DKwK16h+REHJ+RvrD10mfJL6iRA/7jujYhRVB
	pN6s4GFGX///TEIyiJDlAL9AH+KGWXfP5sTE5yBYoprJUBY/SWJ133UZF2vKZL1TfXjIy
X-Gm-Gg: AYBFou2HjNDNBtOM6p3P31OLg+xxosZROJFgUUx4ASGfzmR9ANhe21DX0Qvzw+gJTR6
	vNJLXI4UbNAX2dXK4OZdUZQ+lG17cKqytlTygNv8YC0GHtXDLZsZJ840o6nS6C0IXr+wHlQko+D
	SXkrApVkFPruDaf/r5aNnQ7PPH9vvTlElocFQv/M56ILH1nf62kilIb5Pirs5IeiLSNZ/Ts+ys3
	A8zjeq6Ul+y8DjJyQRh4ZwMhXcNNiu9y28zpU7M8NKS4US1yJ1m7yAQgdvgzEDC+r+BMIPQPqfx
	73qilv8JhXWfXUTojVRYVzSoUR6PIRIq1m5zCIn/VN6UJqHiwLKvunR3FAEslm06gqRZFA1ZuM6
	NVT9Gbk/xa36D+gdDVkvDeofD4PF7bIAy8xhQQ1GM/L4jZgqKeIvsBRPsyLEnBa9bFLxu4DwBm2
	bSx/TxJNw=
X-Received: by 2002:a05:6a20:2d10:b0:3dd:a197:ede6 with SMTP id adf61e73a8af0-3e928dad9acmr10946976637.53.1793696208691;
        Tue, 03 Nov 2026 00:56:48 -0800 (PST)
X-Received: by 2002:a05:6a20:2d10:b0:3dd:a197:ede6 with SMTP id adf61e73a8af0-3e928dad9acmr10946957637.53.1793696208145;
        Tue, 03 Nov 2026 00:56:48 -0800 (PST)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfe7sm3017471b3a.19.2026.11.03.00.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:56:47 -0800 (PST)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: [PATCH v4 0/3] i2c: qcom-geni: Add I2C bus recovery support
Date: Tue, 03 Nov 2026 14:26:39 +0530
Message-Id: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMeh6WoC/5WOQU7DMBBFr1J5jStnnDgpK+5RIcuxx9RAY2onF
 lWVuzMuKmIBEmxG86Wv99+FZUwBM7vfXFjCEnKIE4X2bsPswUxPyIOjzECAaoQYeH3EAEqbKbz
 grJOZXCioY876tJhXG49HTYcPre98J5UU4Bjh3hL68H6d2j9+5ryMz2jnyq+NQ8hzTOerS2lqj
 93WeACrxyXrhDYWTGdeGi5IRnqBtld+aB/IYHsz2NJhdaXAF6cRIP+uX4D4O9n1MLaddMr/wpf
 f+f0/+JL4vQejkDYc7n7gr+v6AcLmo6WhAQAA
X-Change-ID: 20261008-20260826_aniket_randive_oss_qualcomm_com-84f5f536302d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793696204; l=2932;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=Z4+KTPxeraVIy1Vic4c7QiMWNojxv7I5mkhSN4OnDes=;
 b=T9S1IYYdEjoZm1y5PKIic6mGMftZVpJ7cnxdaWemjFPtL79LPvXCI9QvZcEAMGR19XHVAQzM+
 0g4CgzYzK17A0og/M1O4K7MzpXwPb+jnfNAvnASocR+I/0eg7kdB27u
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9a1d1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=tvANDUIg-hJFOwLBRUEA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: vtdXqxbRh6AlAZs5_U2H2rs1pXZK-hWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX3Srk+4YQmYlX
 MOhXDczQ9Oky2N8Lxcacc76KFEIq6uPH3LKPWrqCBxCHg2ZruY4Hv5Tbs65O3h1eQyyT5jZMagj
 5vkFxTOdUdwVCAxBNt88DsSEYFyiCuRgkwSxpGIbi39yyy2SLlidgwB5loqBLqmXbvIkpuXfkHV
 3IUT69cvDjvp+LpPkWCKiVePowrghrUgT3NJ7QkbRK2gXtLiEQc/bW0qHCU7HqNTtfOEgLRdbdg
 BH9va3BZg22mUbg3RUghC249OUOye0SeioWsO4448C9DaZChcE1q2w0Ug0y9nMeejybI57Ry+qj
 7D3DwSIO6tkpLBKysbFxNPWUvx4bccMg6Xp2/MTVnv5urKTWhiaE3pOMdECvm4xYougyK03PF0U
 EFBcZSyJlU3j2q4EEUn88x9AKm04nisEi7yJxU3GSm4LyMs0BmmIuoxizu3n1WMD/SlbopC+UvA
 TErtCClWIZ3Q3kRLsug==
X-Proofpoint-GUID: vtdXqxbRh6AlAZs5_U2H2rs1pXZK-hWi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX/l0t82O3iRr1
 s3N/hzF60Uv4DOyNlw5/q7WA28qadOf01pDZTWE/SYiqcSTII7ViM63ltWv8sn5m/jHj4Y6q+nC
 WtymdqkA2KSvk9k2W10DLIb2IqcIrD8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030035

An interrupted I2C transaction can leave a target holding SDA low and
prevent subsequent transfers. Add recovery using the GENI I2C_BUS_CLEAR
and I2C_STOP_ON_BUS opcodes in both FIFO and GPI DMA modes, without
requiring GPIO-based recovery.

The first patch adds zero-payload recovery opcode support to the GPI DMA
driver. The second registers the I2C bus recovery callback and implements
FIFO recovery. The third extends recovery to GPI DMA mode.

Recovery checks both SDA and SCL, skips an idle bus, and rejects recovery
when SCL is held low. It is available through i2c_recover_bus() and runs
automatically after relevant transfer errors, preserving the original
transfer error. GPI recovery stops after a DMA command timeout.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
Changes in v4:
- Clarify that gpi_prep_slave_sg() is common to all protocols.
- Consolidate runtime-PM cleanup at out_pm.
- Use a ternary expression for the recovery result.
- Preserve DMA submission errors.
- Move reinit_completion() before dmaengine_submit().
- Link to v3: https://patch.msgid.link/20261027-20260826_aniket_randive_oss_qualcomm_com-v3-0-7f2a6e572de9@oss.qualcomm.com

Changes in v3:
- Use the adapter timeout from the FIFO recovery patch onward.
- Configure clocks and timing before recovery, with PM cleanup on failure.
- Remove unreachable GPI error checks.
- Log DMA termination failures during GPI recovery.
- Preserve GPI timeouts and stop further recovery commands.
- Link to v2: https://patch.msgid.link/20261023-20260826_aniket_randive_oss_qualcomm_com-v2-0-93572b453d6f@oss.qualcomm.com

Changes in v2:
- Rebase onto next-20261006.
- Move the recovery opcode macro removal into the DMA opcode patch.
- Check both SDA and SCL for bus idle and reject recovery with SCL low.
- Share the bus-state and recovery-trigger checks between both modes.
- Guard the current message pointer when checking data NACK status.
- Reuse the FIFO transfer abort helper for recovery command timeouts.
- Use the adapter timeout for FIFO and GPI recovery commands.
- Preserve the DMA configuration error code in GPI recovery.
- Link to v1: https://lore.kernel.org/r/20260826-i2c_bus_recovery-v1-0-203f0ec76f84@oss.qualcomm.com

---
Aniket Randive (3):
      dmaengine: qcom: gpi: Add I2C bus recovery opcode support
      i2c: qcom-geni: Add bus recovery support for FIFO mode
      i2c: qcom-geni: Add bus recovery support for GPI DMA mode

 drivers/dma/qcom/gpi.c             |  30 ++++++
 drivers/i2c/busses/i2c-qcom-geni.c | 207 ++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom-gpi-dma.h   |   2 +
 3 files changed, 236 insertions(+), 3 deletions(-)
---
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20261008-20260826_aniket_randive_oss_qualcomm_com-84f5f536302d

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>

