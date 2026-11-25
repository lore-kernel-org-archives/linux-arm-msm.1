Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596193;
	b=VJ3I6ufGUX9TBaFl5avJLRggKGdSNqNMr8CV+v0xDLsKgFkw6hUDuR/dcxGbWV0S0qFk
	 YHTq9BVM7AU3sp6Cn/RgLdwes5mk1gd79usurHfJ/WdAzEr1FeNrqiqqMY7/x9JRYGhfn
	 mBbvnDNVDCu+N1YyPpzjpXLIvX4dRNyiopTObAT8SXE9uQ5HCbMHa4qvPzPt3gY6jfRZz
	 HNe/N/+46ReiUutDrJ7xggiLFlZcQ4BATszUWwLG2ppUuUGTS40HvWvMfQE3X3pSX057u
	 vzpPOvGDlx5eZO1ai8ir29s3mwtKH+KxlNDDm59qAgtWoKS37+rFlVl2FuiYfCI5f5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mkMPx5pZu0MJCT37mBs5hDdYCQOlPFYux99EQPGEygU=;
	b=kHcx97py2QMQwgwyzZv6Ld6rFEQJN14Qzznew0kjl6vszKgb+YCshxQAtzP5gHXJUj1t
	 67RPJ3I1W9ho2ZY/UOPocpRo5j76dNeoskFNhmS4HNj9t/H1h/mtXixd/vML19YkSOMrR
	 bTXWM82jvDSnXAvY1qemNvF8boOCLmq9uFZtf+0VTgdKswQVBjaeQR5ROIg4YuqZYDgG3
	 DHLACfPHV7TCEukSuw5O2Wd+cMad/2flZiu9izp6KO7llZyHoi0wxwjLrPxFEAVMYm2SK
	 mHioQa/b6YN5oS+f+CfKKvGwCbH7GpB9Omb8Q1WC/ccpoINSPPNxuzI4ldJg5wTTXwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hHn4WBpT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmX9Q2fG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722D3606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 722D3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hHn4WBpT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmX9Q2fG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68TMI3534188
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mkMPx5pZu0MJCT37mBs5hD
	dYCQOlPFYux99EQPGEygU=; b=hHn4WBpTKIYyhJrG83QykBmEsm5R4JykuSSIOy
	GjV+jc7cAzz34j0Ays+Ze+k2HQdNssCFnPw8Dhp7lsIedL9EDcnAthVFlYlm0wyz
	TEo+5sZQteBlxukagmeZ2wo3K2IBR0s6xlB+Vh3ceqfCmE+3yEK5yA8dVJOffFwT
	kimRc8hg/Ih+tBggC/KglL53Q7SDyJj+bmzkDKPIcxhFf+cv1SUqZtktuTS4xJPO
	pqSCea6KFHqpEHKzESnrSt52Z9rUeHpQSFiBVBSynIDlseix7s7zXPRPxzozk+/8
	gMX4gpo1U2Kug5Sc3r1doKnBOjyIw9w+GRz77jl86gHN9yHA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbhses-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:43:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so5387916eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596192; x=1796200992; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mkMPx5pZu0MJCT37mBs5hDdYCQOlPFYux99EQPGEygU=;
        b=kmX9Q2fGKkWt2TkAITlgdHxmWOFHpqKg8qHzFkajkqCjOvCct1clecCC3iPm8cko+H
         rfduzihUGBAVwBtshJgXi680CfOX4Yu9jbEZ21fEjj5rwi5u1z4cwpVPeO/flJF2nTIk
         eEtIvP8c7XKarYZ7VeLK3KVXqsbLYaKaQJNTbc+3FxBTVp2zjGeegVZ9ONKXby0si0+3
         K03xT8EIVgO1GmrpiaNymRQ8AFIxZCM5mvcKDC7AvYS1Q2UfD5JasDc7cyqhEKeX5lRT
         ZrK0DDlZ6IrniQqvMSfcWq9DEwUJhnrfUIE5+de4yCWee3DqnHYlFFz1G0liUV03v8cN
         hEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596192; x=1796200992;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mkMPx5pZu0MJCT37mBs5hDdYCQOlPFYux99EQPGEygU=;
        b=IphP6Mvb2W6IENZBbjZ9JDzpkDBt9ORV8NYDJ94zB3Tt5Gbe9ztNae1v7znxFbEUlK
         HW919enpXepfp80hKvfvdgtGaMIHILvWkSVtGcRtKt7GSjaPd/cq0tgOshKWTUyPNyXs
         G6SCniBwQRmV92GcPE09F2Q+C8dszftgzt2r+hke5yZFaHucr7QMQHIAUsP6cadAyjEY
         YkMzIKVKTKtpGXx/sklqMLdPIiqQuh33TAt1y8kqQ/GkoWl5qMVS5MpTtghQv4TyMkTl
         BKsbB1ODz+0RoDsvmEvq56pX1cRqXme8xHEadmUebWBB2h6D/I3gOFgdfDC1JWrgfjtX
         C8Wg==
X-Forwarded-Encrypted: i=1; AL+hErFVfZwlFYpcditYEHCrsUSVkM2vtcnpOtDSH69pkIO6MgQwHya0ovaA1tP79ejS9N0kJnP/7yLF8wwvwJCU@vger.kernel.org
X-Gm-Message-State: APuU4Z8PMpfAVlZUS4LSSnriLydjxbrXgShjyMWKssPXGxuhOd8KjtAP
	+IiLdB+H5iHqPqyMioXDsWhAIeZO+V5CMn1EeCpjba1GK/ZzDaxwmmKO2WGuTwQ5V5SEaFVW4/+
	0mNqhBP4yZ5KGcpEmRwUyaIfXWtigD0/3p4KH5RqgeTjrWobala8rC+OvnMsX0ULQwl28
X-Gm-Gg: AZFdTZd/aGwAMCSGJUnsXe/LTLWO518PL9LEiP4gMWvCGVSSkiWC1Q1ICI2KYSCSWM9
	f9Es0jhqzqQX+LZRkzgTLNVQLcXyYiCXXXp8CC+jaAg3TN4ZwQv0JpGfNQ7Xp01zKNs+puLiQFE
	FUuMgpTfkGl2HcBFbDv8lha7S+G7qv1X0x93tKxVfnfYMFPVNkOkdPHnFl4WnV9LQERvFx3y0NY
	q30WO7Pg8/RlvWWkRLij+5tR/qN97pnmRjZKB+W2wp7WPUp7oI9M3PIf0q061PAPP/gzh/S2/+9
	a/w8ximjUroruooBKOmcwi/yK9npmKk+RLtXdPY8nOf+k0U3qfm0KnkMaDbpQAvSiwiyHfXfQno
	NmVSWq4uBNlNoVL03qo1vXSOaoeoGuFNKI/8LkniCv0KJYREXcFsfWUUTNEvcrGWe1yPQF3A/BN
	j+P//W
X-Received: by 2002:a05:701b:21cd:b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b5568fbfcbmr15129861c88.39.1795596191396;
        Wed, 25 Nov 2026 00:43:11 -0800 (PST)
X-Received: by 2002:a05:701b:21cd:b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b5568fbfcbmr15129829c88.39.1795596190763;
        Wed, 25 Nov 2026 00:43:10 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm60290694c88.14.2026.11.25.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:43:10 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add CAMSS support for Qualcomm Hawi and Maili
Date: Wed, 25 Nov 2026 14:12:59 +0530
Message-Id: <20261125-hawi-camss-v5-0-d48c4feb1c2e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJOfBmsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNT3YzE8kzd5MTc4mLdFAsDQwsT42RLsyRDJaCGgqLUtMwKsGHRsbW
 1AGkVK7dcAAAA
X-Change-ID: 20261125-hawi-camss-d801843c96b1
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795596185; l=3216;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=LCKglgHmOSMp0gqQvoaScETsQ1eifl2GUqlrW/x1Vx8=;
 b=tLcDx46uoLSaMJ8XkdOrASfldBEIHBZ+IrJhE6+MpYoXiTCp7sKc1nUbWZ/Lj2EA/DGNUHN16
 NJQHWbJMdfPD9eYZx+P0owYssq1LnmYwbSxG0w96H/s8FMugrjp1iRl
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX56+8VquBbzP+
 pidNV2vVhILwy5rc2g97iXUlst+g//8ndpZJlZA/azc04NWFZnqd91FlvMvsgrmHKa1K7nMpmj5
 0frpTk7evqiRQA4WtG9JTqwVv5Jnj/M=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b069fa0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=PSXh-a3-1L_3D_hhYzAA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXw3LDjt40AMIq
 6ljjWIGvwjA5L99tdQBe579cCZJHateGkhh1l1hX3yNhZh6iuE5nW9XpAQBPJSma85VO9Q09Y6B
 0APQQhuKqHCWhdos8LcwrxtzXw9IvUgcnbB3OOzQyh8R2sfvPb6lVrTjVEXSqeZNMjYG0xZL0jx
 uvSO3983zbY7etfEYm6C9zZirLUs+sts/5br+AF8dP35K5fZRE0TYg/Z6QpDj3b4h5UwlgoZTjd
 e/sCPpjUzhBcbmqEAMkbvZyjSJQ6b9fqYhBR9wi2hYEDKi0QZeIU2UPVnO12qtpJOxeREoFWqEb
 21WaE8lx7vLOyw/QeEs/dglI3jqqCL7O0RK0GDgOGc6FIRCag5GAK9ZWtU8FLvo+9MyxYmU5lou
 3sNmmG/X43tNIdhV4wm8V/xdAMclTKRC2gFuGgY9s69175GARAJHl20y48FqHvSIMWOn4Myzxkw
 AXYlBJ/CslV4puUh6Sg==
X-Proofpoint-ORIG-GUID: ctbKCxOA4HIXCmXKjfCeNJygM7N_cv2m
X-Proofpoint-GUID: ctbKCxOA4HIXCmXKjfCeNJygM7N_cv2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

Hawi and Maili are recently announced Qualcomm Snapdragon SoCs [1].
This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Hawi and Maili SoC's.

[1] https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

This is the CAMSS/media part split from the previous combined v4 series.
The I2C CCI and CSI-2 PHY patches were posted separately as v5 because
they do not depend on the Kaanapali/KNP CAMSS media patches.

This series carries the CAMSS/media patches from the previous combined v4
series: patch 3/6 (CAMSS binding), patch 5/6 (CSID clock scaling) and
patch 6/6 (Hawi CAMSS support).

Link to combined v4:
https://lore.kernel.org/r/20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com

Link to split I2C/PHY v5:
https://lore.kernel.org/all/20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com/

This series continues the CAMSS/media portion and applies against the
camss-next branch staging to linux-media/next.
Base Link: https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/camss-next

Hawi's camera hardware topology:
- 6x CSIPHY (CSI Physical Layer)
- 3x TPG (Test Pattern Generator)
- 3x CSID (CSI Decoder)
- 2x CSID Lite
- 3x VFE (Video Front End), 5 RDI per VFE
- 2x VFE Lite, 4 RDI per VFE Lite

Maili shares the same IP as Hawi. The only difference is Hawi has 6 CSIPHY
while Maili has 5.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,hawi-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=y W=1 dtbs

---
Changes in v5:
- Split out CAMSS/media patches 3/6, 5/6 and 6/6 from the previous combined v4 series.
- Drop the I2C/PHY patches; they were posted separately for I2C/PHY pickup.
- Base on Bryan's media tree where the required KNP CAMSS patches are picked.
- Link to v4: https://lore.kernel.org/r/20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Hangxiang Ma (2):
      dt-bindings: media: Add CAMSS device for Hawi and Maili
      media: qcom: camss: Add support for Hawi

Loic Poulain (1):
      media: qcom: camss: csid: Scale the clocks with the CSI-2 link rate

 .../devicetree/bindings/media/qcom,hawi-camss.yaml | 317 ++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1190.c    | 417 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 208 ++++++++--
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1190.c | 217 +++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 228 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 10 files changed, 1354 insertions(+), 39 deletions(-)
---
base-commit: 2fe1b6509825b39a090d7ec055d094155af4e0cc
change-id: 20261125-hawi-camss-d801843c96b1

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

