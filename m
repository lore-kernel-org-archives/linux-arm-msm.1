Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8D537A847
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140224; cv=none; b=bwTXGyeN7whXVPjksWUc/7BUhR2FGZ/0aAytbHKR7t4lo4K5rpbMoMLsqyCKH0eTt+pGM58uVpfzUbVF+AbFyijTaGXBbwDSW6M27ktVhxJf5/YNkRhrM/gcdFO/VadUWABk9dbNv/GqTsoKQtQySqZ/cClc9+JgZAifyf8HJOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140224; c=relaxed/simple;
	bh=fOozqXRREZdVE1IpU1zeudvT0HR4HrTNyPKFTzqIpmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6+EUaTZNg5AkOanwRINkn0L83/grwvtEtdH4XGLVQDpKTk04tdeXoC9JZ2Ca1cnjL7ONlR4BD/nf0AXSVT5M6qkzV9MnC1xq4Fbg9Y4rT+sWAzlKBX19rdlllaG0r7mUO2khr7mt0ehsRjXmoPn0cAFyZlKFpXcYKlb3JT1J9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dp4kRRQp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmuQg6Iq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dp4kRRQp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmuQg6Iq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm4UA443049
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g5ESSTcnZuT
	5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=; b=Dp4kRRQpf311WuUvZyTt1GXXi8G
	mQYJJF0dlzq5DsvMj5qcT8+2XoHzzdBcsvCTXIZycX1tPeuDr4fJwTrinWI+XCIS
	RZr9KMknF8zabRu1Z99rhRnOTBmnz+oGP3KkyHZ/x/7Zkp/P/UnBfrcxzuo8rRxS
	AYpK2/Xy0wzFGf0g/R79AgTuzeqTejBhWQo53tpIEBFMzeeLvKLYRq+pN/aM+N/y
	Rh7oNoGRbqeQPF7851HTH+/1Hbt0SxLjaX2xCcry4jhnQpsiJR0/LIXHo9rO0VF0
	5rigtLFxh9aHI/uR1xm1pDcI2KT+d9BFbPNeCGMghN2kgL8UZSAg7Qt34eQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg2kng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:23:41 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78fa7ff1a44so283340137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140220; x=1789745020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5ESSTcnZuT5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=;
        b=ZmuQg6IqSjBUKTtjuNXd5lOVyCcaGh8nc9H6gFUUNXpudhv71IgGqgFTs8mOd1UWXB
         F8US66kM+5GbuI/kS+iUOvriTXN8DrBqPIEpqb0oqLTwvaMqUkeDLEp2V+Pa0l641LmW
         DDxnByG+WbJKYPLNJrJkmlW+EkWN5Jx5rQM+aEBwjKNp+bCD7qGCWoIni8pSWBPIuyXx
         bN+IRm1/uOXp1CyRg2UuV5oGbx6zwBu68/rClQI2Su9Sv+SvvY+O692BRWddG1E6Zrmd
         Pi6FWjuy3WhNWIMkE+/e3bQQSUzUIy4pTofT3d+s7mLr3Jv+UBQ7YVqj2tOYej5AIp2D
         xGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140220; x=1789745020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g5ESSTcnZuT5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=;
        b=SLRHZBIkNf7SduBlt793Da5bEOF+QQ5uq1UnwYo7wh8+b9dZN1OFqKKLm3nPuVlu94
         O6D4d5z0ugUBuKW3lm3V1foF1iNrVe9pr0WhH+TxxdTquGZk2zh3EUKRs3CLGk8qdPDP
         ga2vtVnKUq6W7Gg7GmCkBbiNvBGEivyfGUh48bMwUZXWunZsOO6qHTPH69qo7P2+SNaM
         s+ViKgpswx5ia9DrqUimKRj4LK30u8s4VdQD5taLKFd+O7VH/Erf+ErpgNZyK+g5FrOV
         CF56c1GOWWNWzL/RJSCfQvqOCKVzW7FiTt409uvHOT0b+R4ugktqVFrUhpeytGAMyZiY
         DwUw==
X-Forwarded-Encrypted: i=1; AKwUvBy38xIsN8/oOz6enhL5HwsdsVw49gQtq9XJ4+Pz6+u1xKSrtoWI3t9d5VGGRBJUQO/JDJIffo/S1zflyKHe@vger.kernel.org
X-Gm-Message-State: AFuF++kS1d5Xd8lYTqwjr8WGlrMSzz2cxQSOL0UgXdHb1r3/hDs3BcPH
	p4Cyia5zZF9ExvPp3t0/UITWtxOE50NsfgkK1tF/F6CD8XqoCQOjuOMkWbWmwjjwF6GWkT2Fa2S
	INq9L9DzXKUsy5OcoWdgNRbaVR3YhVfWhDzQM98KGMuSmgthYs71C4IYq839m0xEuEjyV
X-Gm-Gg: AYBFou34nSnK2pugCltl4Y0zSzurSTYYV9CxuQld+Wxs1BWqVia16WDxhsQx1K5dcP3
	8u9yC3cMO0yarwTRZRZEHPqxFFD6CrZaThfyW3qi5Lk2GcX/DqQ3e++6xnbWVKunJzht1xRnqdE
	B0TeO8vaGh5R0FVqSFD3xQgwaN9ujTnWZ7FzQZkqgzyC62TUDINJ/Q4EGU5G7NKKHaAAdCXUs3K
	QoZ2QcniIbUMVuHkzwf1mpD7rgIBMNOu2WAMU4MewhBCWmpa2V0XNXN+oSaqUdrC/qBrhWtO0Qn
	+fa5XRl3pgV9qNRWfVaW+KdsrQN1IqF8zstpw/H4jE+iP67GhZAEyKMNC/41inahcuiFxpzz9Z4
	VEYzQ3g2y106XzGy7LiHJQx1n7Pl68DcXJLJ529tDZDmfViJGik7R62cw9aflYIagmXiU9YrB6E
	H/gHcCJxH/DNWc447Eu9KqGcklO8wCjTShHSsm
X-Received: by 2002:a05:6102:1953:b0:78f:7135:b4ff with SMTP id ada2fe7eead31-792a52b9d3fmr5324928137.2.1789140220633;
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
X-Received: by 2002:a05:6102:1953:b0:78f:7135:b4ff with SMTP id ada2fe7eead31-792a52b9d3fmr5324849137.2.1789140220237;
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:36 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
Date: Fri, 11 Sep 2026 17:23:27 +0200
Message-ID: <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vPCy0ULh_r-kACPioDHALILm0OXYsVH5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfXxIvlN1Q5bElU
 9Att+eBEEpaeUh76nPfallWsz9dQpLwVOY4bJA7GXv8ma+xovwc/ERYFSYZApnuzQBsMELCAAsm
 nvdFH/AF6xy9/iTAAvhi7IpWeyJGKRI=
X-Proofpoint-GUID: vPCy0ULh_r-kACPioDHALILm0OXYsVH5
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa41cfd cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=mtY6ubt43vOedHXxatAA:9
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfXx0pM0inpscSS
 yMV8QxVUjX5S3lwP5X+iae2NiV0tXLMNk88vJqXDCQyBQTWrEFh9PokCQk2aq1dBPnFAOIhYfKw
 HjvCy8eusOsYL3ejQKyMzATvja8d6+cr1mGJVaL0EJOhorFaBF6JmTKcEivzHCLkBE1WNXwE2ME
 1svKNCQ0KL2KXrKX5HG0qbVJ2kb7kFA/veEUtznz9q2p/i99k8cKPRniJczsUO5n7o0GG4/tOr/
 xEE0KbfW4PpkthzuAWD5s1/+1fiENiQiuz06B02WUH/5ER+M1Y8RK7FkS+lXYWy/Lmktb5/F2MQ
 46cXI03sDztcRdjhfflk7lK3E3IrE6OyNf5B89IAOHThxWftOLGA+Co4njrz/CcyamDLJOX826O
 BmKFvyciwDuU4Z3zo1kGvsiMS4U3VP6BIE8lqoOzxpoAEiCkHtRbeIgMkMuLx4SiS0Uu1OzXOor
 iONwCoqm71XUHyS2ulg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214

scmi_protocol_table_register() stops at the first failure to request
one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
previously successfully requested device-ids in place.

Unrequest any successfully requested device-ids on error to fix this.

The code manually unrequests these rather then calling
scmi_protocol_table_unregister() because one way this can fail is because
of duplicate device-ids and in that case the original device-id must not
be unrequested.

This also moves scmi_protocol_table_register() to below
scmi_protocol_device_unrequest() since it now calls that local function.

Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v6:
- Add Fixes tag

Changes in v5:
- New patch in v5 of this series
---
 drivers/firmware/arm_scmi/bus.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d12d5de15a1a..6f667e4ffeed 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -137,17 +137,6 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	return ret;
 }
 
-static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
-{
-	int ret = 0;
-	const struct scmi_device_id *entry;
-
-	for (entry = id_table; entry->name[0] && ret == 0; entry++)
-		ret = scmi_protocol_device_request(entry);
-
-	return ret;
-}
-
 /**
  * scmi_protocol_device_unrequest  - Helper to unrequest a device
  *
@@ -193,6 +182,25 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	mutex_unlock(&scmi_requested_devices_mtx);
 }
 
+static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
+{
+	int i, ret;
+
+	for (i = 0; id_table[i].name[0]; i++) {
+		ret = scmi_protocol_device_request(&id_table[i]);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (--i >= 0)
+		scmi_protocol_device_unrequest(&id_table[i]);
+
+	return ret;
+}
+
 static void
 scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
-- 
2.55.0

