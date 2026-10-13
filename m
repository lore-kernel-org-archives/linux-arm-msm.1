Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF03C3C14
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881174; cv=none; b=lHG7mMVvB0ltS7Gvp//x9wb7BriDOuA6exlJW+S4jqhiYzNowXB0wKKKGwvoNQOyrS4Qpvk/fBFzENG7McHO0nFmot+L0rRtdlVn3wLqj91bchmu90u34xk0z8WDI53UIqWX9bc+xOQZDijQeYIheHdoS09DjDXnCuhfhf1lmnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881174; c=relaxed/simple;
	bh=2+l0SnJ6xQbWmIt7CHKhLtT8Hjx827L4qCZBd+DMmbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6cygFSqo8zzh7HKokBpoWhL1Mh+N4MNnIEFew90C4fsjyAHY9TrCMWpf0VldWuqCz73UgAe3KxMbbyB5wKnY1/wB03Nzzyr/YVQWqFAX0UbrJxn3aY99gNcr8b6IixFuKzF9Qmqhaky0QLr7jyMTJWyoIs1Qd5nGtk7yKHcgAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhE/ct0o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ReXeOq2c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhE/ct0o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ReXeOq2c"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D81RB93752542
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vxnCH0NNfcKcGsDeYn21MBx17/efcxQrfrVWQPGiIVQ=; b=KhE/ct0opXgywKQF
	zc9DGwJVrVbYEoKdqAp29DikI3MOBwcyyKUiIoISqPSefq/Ju9sEMHFz7mKSRhTY
	S/ewT2kuej3w6UF+EsDs857gctQ3OjyUGwYvFWV3P5rNKJAdzcE5jF53piODgLMG
	zmWNZBpkDEL6CTjtKO17ZLy6P+ICwCOh4Y6BeaQyhmjT2/1RbHa4BnuFmXsv2srE
	UDTXVapAX6i9DRHLEceyman4Epgmm+gCil7kkxs7IhmV1xmJJJC8MbhQDxxYfBU4
	cabnedPnHFcG1qWFYv2ZpW2XLlkXlstppT2Vq4zL8H3I/olUhTScccYBH4wBQDvq
	WA40bA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w35cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:46:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1a439db36so2032062a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881171; x=1792485971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxnCH0NNfcKcGsDeYn21MBx17/efcxQrfrVWQPGiIVQ=;
        b=ReXeOq2c5Ls09enjs13BRbhIiqfAZ8GfPiaqHnIX8FcMzsvS4QrKgcMzOKfRd/dQp+
         1jsou6d2wVFzTdp/hmVqDiu1w734Hb4ZAs5cEYUbOdGCFcmZZYxFrA5zyk+ucOeCDdiz
         CZa9wwqV+3jICU26/++azGfXhBYpzgJ/svYxdNz/8gDxycIMr4E8HS51zMtf1dW9jR0h
         BBrkBo78/C97wRnW+hlO1WlAcV412DnA/Z0HiRnCOHJmPh0jCXPKVr0fub7GzMm5dXJx
         AKzlSXPSF8DfIHuoLHhlr2/os7aR304o7ikPPNxzDHVCNj2m45ELRl/HSnuF7hjPFc5D
         dOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881171; x=1792485971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxnCH0NNfcKcGsDeYn21MBx17/efcxQrfrVWQPGiIVQ=;
        b=Vxp+nGG+rKQzOrkBtIX9PonqdHLShQ25MGeuOhbW2oUmztnqwzN7bHLuR4rFD2PpPi
         KMcO7qPj4DXJsePWh2TOWdLg+AD26ZphTJ8MGYV5ZU4P0XqbJx40BjxeYx3UMMKE/+LL
         ozRcrJJrEF1VnkIVEoTUN5EXttVo6RWMfPBPjWx5fwJHHV8KJocmraWIghWXjqR5pcQp
         bMM3NH89Fy6K5s4ONs4d/cKgrAEEWjTU5lsobmQplsmCifO+6fvL876eaqB5DcXHb9iY
         7tM1QnMcWBhfb/0Asa23SFIulQQ4Tby7t3b3ImMS9xLYbfNifPiWhCo1NNRIdr+qO7BH
         vt/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEy+cO0PkwQIbyU4p2SqGWpBFOaDPcmOAf3ITxpwDMGlsZUl9D18218QEsb1Ds77xY6I+vI4nLiTPXzzV5@vger.kernel.org
X-Gm-Message-State: AFq9FYJmECKcCAMQq6D1t9fsqwtQlBKzczyzWOjlJ2yGyL1gLg33rk5Z
	8oVAceZ+W96M0L5VNsxgBbxOJjB/iuL3pKeDRDQ9t4D2PM1wmn+pRMHIYrgiHkoz0xtNS8roguW
	1GoCbJth5dkheM+8Q60D+YTFpl5RpBkaw6i1+7W2hs4OXGfg6qzJUu76ySLwL9pcd7Xqm
X-Gm-Gg: AYBFou0Z5SSxhAAEzVXvYK28eHwXB+WA/SPF0SIS68Jtz83Ctst4fum77ahCz5jJpjH
	CIWv3UzYX3G0T20TU9VvUC1IVKq9odOQQN3TtSl/1jKKWfdLvf7Rp0s9LowJtJoDQo9T59UiBkt
	qWElzBkpdatIaC1seIVwyGgnwi7yGHrgPDHOsQpTecGerj0q8xqA0DKqGxiCVAxkHkn/l/dx11o
	Zzc4lonzew2HqssZnH6FlLztljXfzt4bqi9bRLz6HWgDNpueVZd2fvZpFdkkvWtSHinPLrCzm2X
	c/f7hTcfpomMbdKbgUlV2C0oHZ68xrR8m5pSqKqT6pV4SPvaUKHkeGmvCuG1uSZP91Y8wz5qSH0
	+KSFVd/OTBG0hXFkb0LGfkS8nyZUA
X-Received: by 2002:a05:6a21:a4c9:b0:3dd:a197:735c with SMTP id adf61e73a8af0-3e16c052430mr9179237637.53.1791881170202;
        Tue, 13 Oct 2026 01:46:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:a4c9:b0:3dd:a197:735c with SMTP id adf61e73a8af0-3e16c052430mr9179215637.53.1791881169627;
        Tue, 13 Oct 2026 01:46:09 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm5384721a12.31.2026.10.13.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:46:07 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:15:36 +0530
Subject: [PATCH v9 5/7] bus: mhi: Load DDR training data using device
 serial number
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sahara_protocol_new_v2-v9-5-dc9f24357c4a@oss.qualcomm.com>
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791881139; l=2312;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=2+l0SnJ6xQbWmIt7CHKhLtT8Hjx827L4qCZBd+DMmbE=;
 b=HnyiFaueBTA9ATyK3dZXMfV2qee62iFqJG+G8cD7P1CuCfQJ+ClZ4AvpSZ0L1UuLOmrq5ceAB
 ADA5An6WtpHC0J7SJF1weIXvXe7vLzFi7gTZcnmhKd1n/BXCyjtx803
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: tPVQsxggQ0K92r0K_L7b6_5lKZQZEDRD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX8WSkyMLCgQQU
 zIM77N7gd6JS5hTqcNVulvzeIirljFkeNC2FDXzHiAf3WPSw1pEN9RNd1oL+Kjxzz0i/QVwwYoN
 Spiw0GbXCuDnPJxY8sv33F1AA1U2UZeFDBT2bFgW9WUqYZ338UP41kITyPlH+cGhILVH38BE2Vu
 5IVk+bHGGV568qBp6vxCCO5ri42UjeEZCFupBF2x0cNZ+SxkEiojcOLBlWr/v30TGqOd3cd7RXc
 efXA7jMSlQ3yHuv3SqDNBynSJEwT3qGx1CfQOCxZXftARAajJATOKQUO+ywj5PgCPm8BsyDKkLj
 F514k14KLgcKLZTpt081iVNW2RluuIFMMCas3KdvfqNxKMQxufzSzwIHWR8Gr9iK1u7ZAlHNcJ9
 +49sf8MSS8wvHWW6e3/Lue+YjKfUZLbj6gC7+MBGYM4TboPrFp5Em/nO2UDDF0C1va0xgBtuqVP
 E5Ct4Z6Bj4/l79z0NkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX3y673nROlY+J
 EyyNWASX5FYb5WHj4O3kQiHj4LBeJ+q6qTL3EV5xB91h4guIoFlXtnp8DAksqboOAEVGAUdaUHK
 qlTWVlK6L/Va61MHAzCkEojk3P28iSs=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acdefd3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ICgrKnnyuXbdZ-Zkjz4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: tPVQsxggQ0K92r0K_L7b6_5lKZQZEDRD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

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
index a4b3ef197b303cce5a36cbeda272119f0430e619..62b9c72e826801a77a321991f9bb91af37e0cc8c 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -58,6 +58,7 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_DDR_TRAINING_IMG_ID	34
 
 struct sahara_packet {
 	__le32 cmd;
@@ -225,6 +226,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
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

