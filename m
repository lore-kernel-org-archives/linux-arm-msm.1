Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489520;
	b=a2LzUK82WKiSA1eslarNxkhndOQ2KrCs0KDoHo9RiYfzfeuI1TrbqrQNc6vwp7kOFAvV
	 /kXjY7jI9JjoX+94waDFByRzBobpN8EIGHRIP31fx55cy+7jjWmlwa0vC6jQBqYQINR0c
	 Eu336hu/9lEV0M9ezidb+8ICldnMcpjzk03ZHB1yIsM59N/wjNyLabjBLgQcOQjVtzkmC
	 ap5YZEt2RKttyJpDq5/eMgMrN9qq3SDPQJoFXeHMGllYqtA2n0OyyG+iTmvr9dGlX5tR/
	 LMCqN5xiIumjNS1uk/+KN5W70L632prYZFCmffAE/RIe0oz2yQM9F/G7QDLbfQuUT5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0reVTygQYZvGgH/DtOXkcK6EGhSpuDmU2CumM9pari8=;
	b=0T5Std73zffWbEkZbE+Is0XRmp/NA8gtsRyP7i7hDIWuJx1CEAzYngixe9Aw/94O3Orr
	 9sTXIoH/0Rc16+6hqmK9/FlZhE4MJFHulEBs+c7927iMVlife8C/NXm2Ad1noikYAVzJ0
	 bmexla7OTJ6lhc3JEhrw7g7Qc3xp8i9Gq+EGsQFrXeXdFpcQMF0g9rgpIgp2/MlgVjTNi
	 jjpcE5xE5+FJVVnoNqr86Ua/PoUDW+ZCxhDof1CeExIi0IsZY1O3NycN2GYJUgU5bTVsW
	 mf0ipf5uCtXfJYiqpKWz3JE//wFE1XKjYoE/ZXV6nW5YLdJmaK8ZEzA13/bOAOxKkRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6oaWtMF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4kQJXkk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D73606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5D73606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6oaWtMF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4kQJXkk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7jFAN126967
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0reVTygQYZvGgH/DtOXkcK
	6EGhSpuDmU2CumM9pari8=; b=k6oaWtMFbt7v7dpBKEPbHRgaguk/AXr79CCMIA
	pYowYhoiV7TQWcgNfvL9ZHp8lSojuQngdWRd5eZNNoCI52UWL5E/YHIsGxXslnm+
	0HCsAVXhIUyPrxvx4ey3y+S0nn5xd8F5qSMZszNFrCcYnhp/KbqsJ7dFKzkrc7Xz
	DrP7GA1rbekvL0WDG1t8e06WYdLsY8kTV48XF2x06rNB27drGlvJsz2zyX9JkvvJ
	xlhS4svxPKicXfAJ/3sW8UQKjl674+sPOW+urnTgt90R7ZPFPXkTfKm1TWCOiWG6
	80hGQMiAeO9wbMuYosH28vf4tmaQafsQwgUjxinUNUr7ySRg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a095ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:18:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36efb506f29so1077153eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794489518; x=1795094318; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0reVTygQYZvGgH/DtOXkcK6EGhSpuDmU2CumM9pari8=;
        b=Z4kQJXkkuBYcYZ7tSzY6NfHQhbPL/HYDW075fvGpkibLkkkdo3+HG+l2T33fhATo/a
         yK8E82veWF9s4CygE+pXYrRHDK4m2QV2Ul5yB9Wrs9OAKmnKcLdjuDdWtV8YK52u1LZT
         VLRrvDl6KuE0ID+oMlvl06ODtwu0Z1qKwKtz50I1KAIVAa9WXn2uuh5/ZH94uKGBeeQj
         umQkMFPkylZwyGbDI4/AOaSVOy8tudVrsRlzt2ibSduWLEWXp/NxZPm3294eRQSxzZF5
         DBMh3bffPWHZiDrqVmgqjNpRe+OXTYJ2BCeJuznJIkM6Uxk0LqcRjS0ECXPVVsmftUb+
         O5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489518; x=1795094318;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0reVTygQYZvGgH/DtOXkcK6EGhSpuDmU2CumM9pari8=;
        b=iw4fuqzw7di49W8dedkZBWkdwy8mthPo4l+5rXfyov+kUuBPDtkdG5tkJMd/z/V1Co
         nGGV8xv2C10rnCuf3pu7TSnMfrCWsG9AkHCfwLXR3MWRA8NBvprhu6xbKFoY5pEHivuM
         ovbFQWiBkQ1O4S8x7fgXh0JAiYh2x8o/EBcV8b+CZj8s7uPWjcbSumcicOxmlu1cmRub
         4EtmF275eEUz+J+ikpaWr29i594FlHgmyKgG2pWJshRwgpcJRJysu0ZZudsb4KC4ErpN
         b2zPQYLCz80UofXoKsA6LQX8YGOcAGNAwrZWZGeaAjMAetFWTan9b1kiub+8yDUa4pW4
         7ByA==
X-Forwarded-Encrypted: i=1; AL+hErFkM9YCoQiLJaxS69htHyxKuf7QBe1HYhkd0qcZ4WurbK7r++xF94zLjP1OMXCmuxHZdkAY/al/cvyZwN+C@vger.kernel.org
X-Gm-Message-State: APuU4Z+GdOfnRYEOGBrGQVWkcOrpO8/N55WTwJnNBIuL0DbCxDD0lt8H
	jz3Pfp27UY2ZTyHw+IN+LdsNjQoUsDUaUMrj83MW7q3OxrinKr63Cw/iiJ89exTRxqDN8oHyWQN
	xz4Hga1iCNpn2RxdURB/+2hHbW+ouQP5jJSXpml9wYLdpQeMi96753R5dml/SLoDKyHgxmA9kdu
	bY
X-Gm-Gg: AYBFou0jpaE9tUJso2EfDEdrFfo4atNC9bfqMwJlON0gd9rotV5o42K9bQMrx0lnX/w
	d7ocBF8xz/+cTbxP19aKayChADUuli5rLPgQu0RKadrC/49S9RUUn+xQPRAJXSQwpMLaNdIxpQc
	SJINXlCILJxmYlFfGlIu28UQle8dmWFD0R4ad9WXqGUUUDZIXIdIY/l73xH8AOXSj1GfcEpfJKU
	7ONBAzpPr4YtuohkyQKdAGvhFxaYpUNYGEXkSVkPSK/t8mUc9ePhCKORXLy1Yi0RsLfwkwkEbDn
	HmT5uyJoy1EwUJ/eyVOQ1H7T4s9NrOkdYRYYm8UofUf1yEB74rIqh8eCpQJ5P3FVHZFgvfRYFXc
	OiZ1uXbck7d1wTp12kUm5ORibpUMUQn33cMckI/8LlijDIhejogHGYbxylTx+Rpdd1RMrY7Com6
	Y8t6fzgrE=
X-Received: by 2002:a05:701b:2906:b0:143:271a:3df2 with SMTP id a92af1059eb24-1b3c0361cc2mr4490671c88.44.1794489517449;
        Thu, 12 Nov 2026 05:18:37 -0800 (PST)
X-Received: by 2002:a05:701b:2906:b0:143:271a:3df2 with SMTP id a92af1059eb24-1b3c0361cc2mr4490638c88.44.1794489516809;
        Thu, 12 Nov 2026 05:18:36 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm43798356eec.22.2026.11.12.05.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:18:36 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Fix MMC/UFS sequence for ICE calls
Date: Thu, 12 Nov 2026 18:48:16 +0530
Message-Id: <20261112-qcom_ice_pm_enable-v2-0-177e454d6f22@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJi89WoC/32NQQqDMBREryJ/3Ujyq1Zd9R5FJMZvTVGjiUqLe
 PdGu+9m4MGbmQ0cWU0O8mADS6t22gwe8BKAauXwJKZrz4AcE8ER2aRMX2pF5diXNMiqI3ZVcY2
 iyjKKEHxxtNTo9zn6KH7slupFaj6WDqPVbjb2c76u4vD+HqyCcdbcZBrxNFFJLO7GuXBaZOfdP
 vQBxb7vX8i1aCDNAAAA
X-Change-ID: 20261022-qcom_ice_pm_enable-3c5d21b99e42
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: V168_S6Z7PDMk5_cdE3u_u1Ta_HlbbIU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfX/mYp+WMB+U9i
 A/WG61Ylq3wNmzI7IW4XYJshq0gio6C6U3h0Wp6kIumpTDoZylcnZVHBaCppRRyYWRifICxElwT
 wCXmmeWA4A01AUpgqG5C5f5oFOeqUk6LHcOHbrc7aTzNCifmiHzXpWCQZX9lDSaRoJpOcnKLQhR
 gjkvQvttfrIdBqDbWho/l3Km1cudJnInBHev4TIwDjJw+qqvX0iZNgaYMYUji+9cSsLiShnzItI
 bdYS87uYsOe7C+/foSIOSC8sX/Vtuq0Obj3HcPiyQVHXIqxibDNfIoZrdMqd3URWX/fYDZEjwj0
 TZUK6qd5Dpe+0u8GnwxKi74h2ct5+FbB3bd9AkwCfcH4XGjvxcoFH6iDuOvKkPwKLXSlSLlsTd1
 39u2rJVZJUVG5fflqcd5j/Tuoi/eIKU4LX8KVKaKfM3bnmnV2S+SWMLz3Fwk0TZGgfedewV6xyt
 6rAe9K9zp2t5tJ9L03Q==
X-Proofpoint-ORIG-GUID: V168_S6Z7PDMk5_cdE3u_u1Ta_HlbbIU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfX8bFxOnHeiQTf
 JLNSCEGnI4tNvcASC9veVRa5YVlWVJo2G8kDBQ58KKu10IrflayTjpAVxe0ocG/6qKvMU1PEPTe
 AOXQ9+b60+bJapnpOckTzP0uIbWyPlA=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5bcae cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=bLk-5xynAAAA:8 a=1XWaLZrsAAAA:8 a=k6_AVi2K15u0NLJkO0wA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22 a=zSyb8xVVt2t83sZkrLMb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120052

This series fixes ICE initialization sequence where ICE is modeled as a
standalone device and referenced by storage controllers through
qcom,ice.

Currently, ICE driver enables clocks during probe and keeps them
prepared after probe completes. This keeps the ICE clock voted and
hence, any key programming call from blk-crypto succeed even when
storage driver don't have valid ice instance.

This exposes serious bug in sequencing but it works as of now because
ice clocks are voted. Storage controller should not rely on ice clock
state and rather ensure valid ice handle is available before any crypto
call is triggered.

Fixing this issue require ice instance at early ufs/emmc probe so that
correct sequence is established and ice is ready to accept key program
calls from blk-crypto or any explicit storage operation.

Validation:
Tested on shikra-evk, kodiak rb3-gen2 and sm8750-mtp.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v2:
- Drop patch 3/3 and post separately once 1/2 and 2/2 are merged.
- Tag stable kernel for storage fixes.
- Link to v1: https://patch.msgid.link/20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com

To: Adrian Hunter <adrian.hunter@intel.com>
To: Ulf Hansson <ulfh@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
To: "Martin K. Petersen" <mkp@kernel.org>
To: Eric Biggers <ebiggers@google.com>
Cc: linux-mmc@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-scsi@vger.kernel.org

---
Kuldeep Singh (2):
      mmc: sdhci-msm: Enable ICE before enabling crypto support
      ufs: ufs-qcom: Enable ICE before enabling crypto support

 drivers/mmc/host/sdhci-msm.c | 21 ++++++---------------
 drivers/ufs/host/ufs-qcom.c  | 29 ++++++++++++++++++++---------
 2 files changed, 26 insertions(+), 24 deletions(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261022-qcom_ice_pm_enable-3c5d21b99e42

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

