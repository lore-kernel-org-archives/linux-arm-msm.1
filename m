Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C171E4D1789
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829120; cv=none; b=Lo8hN6H/HV4fijzrAnQFz2F7nUBGD5DMKbrF6AJYo/LBWeBJ+a8/nNZBcqsOo34eyTja5d5Vqe2BMM7VP52fwnM6tgMyVsw+sb2G4RuK9zfGzR2nScKaVyaTGpq8ZcNCYuQlCOXyX6QDaQ7TiBdV5p3C92aiFHSMLJEYCixELZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829120; c=relaxed/simple;
	bh=VkPrxkJqsqM3JMRUSMdLvFLYTODuntM5UO+1g8Zzfgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jdQ49AHIAF+/Y/TLKV/xir09z4Ihl038YjnKrj4ptbBZK0vZ0R2T0TR0GO3Tp8lL2QdDq3aL4WLD6Cd/PPFvzTeiXv55WQDH7inXU/XBSTkfiHXBbtBR5QyljhGmzWXwTGtJ5Z/IMjY/PbLoC/JidyP43VPFhs2qjLrwQqmSlNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYGolGSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXQOGvhC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYGolGSl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXQOGvhC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHueGS2022609
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lLxL9awAk419qzBctCiH67jNF66X+ZqDVOqGlMQ9peA=; b=HYGolGSlwfYtoBjN
	Tx0Q/JUifUU5LAzpZViLLH5uxn1PVr6PNzSBa/D4gJfQiPtE6rh2ED9L4JTbMOSG
	bI014oW9Ri40/EHZJdP2Srtts7wOkY33q0L/5dvXHoIJONmBrpnqo+MAWSABN05A
	vf6qjNCtwfTQhD8GFtXc5zRO6xtV5dKm10ylVEbKjH2dzAzWc+uk1zk8cu/iJTsz
	FyMLkgR2k3K3kGJkz7Btjpe+fqUaZoWiRlMMCifx+36xqMJPBBBFNcHNHiBi//9k
	67P8QWk3nORt8hWfXsOUq5+PnhT433WaHeyTfpfve0+YXDULXLDCCZimN6DB6xws
	44Ifeg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aerdw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:18:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso3479558eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829117; x=1792433917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLxL9awAk419qzBctCiH67jNF66X+ZqDVOqGlMQ9peA=;
        b=TXQOGvhC+KI4PacXx1cYO3qA+5iQ977a21eanNl4m2k6kdWxA3HzbnA0HOKJUVr0Ak
         cTsBb6gYgfe/2Xzi+V/hw1NFobaKCoP4nElYG3zzJuxJWc8HIgnCJjp82bz2CmtKCkls
         pO8mFY6IOfvKbwhzcgfwYLQdj2Z0N2qPmKn/StR2s4ptPxxPSK+l7Hicx91SynsKZawv
         Y1V3isd+7rMkbT+QK+ZVpjjTKs4afGcMsYRhdlwBBDlxtaJOnF8ZcpAg42WT3gKejw8s
         OJvGiIwThgew2N4qTKjovx4tWRcCK5Ii3UA6iP53mdiUwR654XJ/mq+a/wKV57KQ0czX
         Uinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829117; x=1792433917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLxL9awAk419qzBctCiH67jNF66X+ZqDVOqGlMQ9peA=;
        b=up8gbGRdXA4kbFibZ0VdnPX6bRwi1AsFiO7r0c6RhcNd0HyG6rYJKrMMwLevniRwGg
         oHj3BDXpAOhSEVYGyrNy9XnxEJskQMDSjAWVB6OGB0OoFi669Ew9u6m7x8lKm5eWljz+
         9vOMrj/YqM+nLzzm13z49PHajv7ueSN/nwbX9tarqFqZCbl4MiAu1DYM0DwnuI6hh1cK
         i2G7sBlA6NSovWtxjJCO5DX0QpN2flhziGwB6MBVWesasqjzq68v9AAY4AgS0keQV4Ni
         Lv9g1gx6DpMG8ucaVEFx9KUE3oUpElAo1dU7bm7OHcokEL7sxAce+HcwuoCzAT37Ke4n
         xAJg==
X-Forwarded-Encrypted: i=1; AKwUvBwTVpuFl1sPQR6brW7giKjsN1TMdFrUkJFLMO8v8VVTmTfsIC0haX8hr3bf2U76usmTAG8oVe2EdTT1Csh0@vger.kernel.org
X-Gm-Message-State: AFq9FYI88dDrG3NhBE4yEnn6xj6ad0G1g6lMTcGgkoljeu1kZ3RyywrI
	pWJkO6d6HdL9LqXLO7htkG0WB/pB/AAXDau3d5X6Af+usI3p/EFaFTOPzN38LUD749tHH2OI0J4
	f+8xKHqzgNKv2yXxLy7w2kNKSjceQiX6z0fYuoLQkpzm2C8p7iEZf5VzduGXH4Ka51U0d
X-Gm-Gg: AYBFou3eHOWr6Ca5kUQQ8T9OTdTmQGGsl5EDlz2yVnL57F/+LA1pUS52cMH4XYkwaIY
	+LGS93PHHZy7oJ0q8OiwJ8QVXRz0ChdKrZpd8KmCbWmhWtquZki9w38+3zwukq3WEBaWyAWJG13
	6Liz+v9MkRtUPIJgO2s3zuV3SFIpFoy5tGbcF5g3mGUO0mn1OsmceviJUIu62FW2zRSf1SgiUOR
	4AFbU4iUoMyIqzFdjtKNsCCom4S5FWtZk/vcX/YcJZYyiNysmTc12NgAzQCuqYq05ioqyIPmgMl
	r/kmdRknFfkcJQN/9j558OGOR7e3n7Hg+KWplkprBj/qeEa7E4K+UJfkwQTl0inWlAg2Y/5ml7o
	QS/3tR481QCcntYIEbvcG8L/shFz+
X-Received: by 2002:a05:7300:ac81:b0:353:7e33:664c with SMTP id 5a478bee46e88-3537e3369c5mr21147292eec.37.1791829116615;
        Mon, 12 Oct 2026 11:18:36 -0700 (PDT)
X-Received: by 2002:a05:7300:ac81:b0:353:7e33:664c with SMTP id 5a478bee46e88-3537e3369c5mr21147215eec.37.1791829115791;
        Mon, 12 Oct 2026 11:18:35 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm22827311eec.31.2026.10.12.11.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:18:35 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:48:03 +0530
Subject: [PATCH v8 5/7] bus: mhi: Load DDR training data using device
 serial number
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sahara_protocol_new_v2-v8-5-e12939d229a1@oss.qualcomm.com>
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
In-Reply-To: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791829086; l=2312;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=VkPrxkJqsqM3JMRUSMdLvFLYTODuntM5UO+1g8Zzfgc=;
 b=ZpCO9GOHQmxmSwwG63+gYndvPFgU1yjA7PkqDcVwq7tg7+t+/k2WztsK7jewmcQJx4SJnS0Cg
 8QZrLuBr5IDDxqp8aU5o8mPtE07eD02TC2jLh2utDGUFJH+LQE5DLDd
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: B4c9mK3_MQsFFCg5yaQGssL6vw8_I_ND
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acd247d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ICgrKnnyuXbdZ-Zkjz4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX+zyt9sngqvBe
 KNLtIlTyjG9Sb771DXiy4agKQhMjaahLk0o9lmgKBldpF0W2mILM05Zzz3NG4U6zP9gkNy1Wr47
 9c5YGiJf57iuflzF63/DCm69AutI/mc=
X-Proofpoint-ORIG-GUID: B4c9mK3_MQsFFCg5yaQGssL6vw8_I_ND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX920POWZthDHK
 tB1iPaY7cwzeFXelS55X0dF6sTQP0QBtCe7Q3Nr7NUMhiMnhix1Mqc+iUCt66L9vkZJU8+WGvru
 7kIWvK3Q03+f7zGkpf+qnWZ/yq0TBSdhP6LWvhsAuN3K3wrSVzBCq0ODqeGnDFnJA/8n38f/lq6
 RIcM64GflFnJSuXEi2IZGz4PMZERa5D+7ClRiOX6eobl4p7zN9gHAT/NldeG2vpipQxBoECVnuv
 qJb+nVtqLf8oujovmODy4QXWOI1/RdBXNdM/TRQ66a3OWC6pDlhIFH6LhL8aNq0hDjRZVH5OIJ/
 zn7xZJF5657tmYOQwlMKG+6pgmnhN0+tBYuvysKFe2/yO1Dl4aDvJQy9NAmdbeUb4C/eUhb4ufY
 ldVLAh5aaRlhyHJZSU7UPus0X4JEXOEBk//AlacUAtBScgG6/Kl/RbWGEgoDLf5vte6k02fQUCc
 4Is/TEM963BBnaLM5Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120072

Devices may provide device specific DDR training data that can be reused
across boot to avoid retraining and reduce boot time. The Sahara driver
currently always falls back to the default DDR training image, even when
serial specific training data is available.

Extend the firmware loading logic for the DDR training image to first
attempt loading a per-device image dervied from the device serial number.
If the serial-specific image is not present, fall back to the existing
default image, preserving current behavior.

This allows reuse of previously generated DDR training data when available,
while keeping the existing training flow unchanged for devices without
saved data or for all other firmware images.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 4baa47d0b94e326b5bfcaa80c8ddf008881c85c9..afb72910fd67b225cd77c44d7e835cae138c2ffb 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -59,6 +59,7 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_DDR_TRAINING_IMG_ID	34
 
 struct sahara_packet {
 	__le32 cmd;
@@ -226,6 +227,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return 0;
 	}
 
+	/* DDR training special case: Try per-serial number file first */
+	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
+		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
+
+		fw_path = kasprintf(GFP_KERNEL,
+				    "qcom/%s/mdmddr_0x%x.mbn",
+				    context->fw_folder, serial_num);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+
+		if (!ret) {
+			context->active_image_id = image_id;
+			return 0;
+		}
+	}
+
 	/*
 	 * This image might be optional. The device may continue without it.
 	 * Only the device knows. Suppress error messages that could suggest an

-- 
2.34.1

