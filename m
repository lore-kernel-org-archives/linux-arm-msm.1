Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C3D3C8700
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 06:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440661; cv=none; b=mDWMqWM0tQfDpkchSivUJ3Ps/WTo5fcXnrHGT6pJNMoFX2YH3GlMA0rjG2GCdRktv0fNCwSQRk8TyRg6TUbBV5VMP8N9SP3tGk/zysAZ4u7Yb9XOFJJTz8RXN3Z63Lw1gGSm8BN6E2T018kDeyD4PSKNFYrRBOO7FwZUKNMQ8Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440661; c=relaxed/simple;
	bh=ZkA86Go2WmwsxeA79B2BPHvYldgOMas+7hnEDf9OKdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDBTAg+LC27p2L+Y+IcYFwRmrovyWhiAex7wO//xm0AsKlFrjedODi2fTM09R+4LRV2cnf5xrnqHm9CQVkqWdlNd4mTWVYyFuOx5DLvUDwTxx6EjiEU998YXv7gYf4keU9rq1+hJdCn5wlwmssmmrpMkIsAtRc7KrYhQWd5psAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFmNdFpO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeNs94ni; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFmNdFpO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeNs94ni"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BhDU928691
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 06:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+Y4gRYTod15OBoxNgHw8ukLV+tqTnNT/YxqpsSxaXE=; b=TFmNdFpOlG6NHlIp
	ysObBgGGLPPajn+bvzRVehKaxBQR+MqGbnXHIwO80l9sznaCsHTTxnr67Um5cruq
	6Ak60HUHN2YY8cPW4VydPR5c8Y+elQTNoklcIReDUvjI1YvdvrW3OMvTPtUfRij3
	0hN9WZrezjRdiGQuqO/Djk37SFsmiiU1oAE28/O5GwmNbUshM92gp1hmYDA9QWXw
	kxzHyNOX/TnywHGk4RfPjYYkncHlCKOlyvrX+9Rd3LYs3M0d5qc3lUHOS4A60D/c
	tR4uoBtujR1aRD/3K2X8Q6rY6XKzhh6WeB5b+lSJLyPOYbrAPfr6IbPCpnjMFWAA
	59VVRA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2senf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 06:24:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so4849367a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 23:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440658; x=1792045458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+Y4gRYTod15OBoxNgHw8ukLV+tqTnNT/YxqpsSxaXE=;
        b=LeNs94niub6zqddIfBZ6xBnVOrlC5hJM3obvzVG2rNOTMvqRMjaejf7JK2gnCOzPqt
         l13oGXB74Bj2C/K/LeDwV9wNz84NEMJbBiwut9D2Aaj8WSFAJ+4/diT6uiU7XpqwMvWw
         wNqpJ6myF1EJRRirPzALc+6/n9cA3RCcsvr/4gDJdMCegMnaPQM/bTmghiC5tJN1CyI0
         z4zmPdfjaVLJdxXZwTwl3QuRbN/y8YSkesqDiuP42w1CgzVWnDfOP7DhlLSQqBTP3kqr
         aWfB30SOSW63DyltUB56CI1pOOEMmhhjmgy0ASyZ8L+3IlvNApO7jOXa3i8tjObYE3kM
         uulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440658; x=1792045458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+Y4gRYTod15OBoxNgHw8ukLV+tqTnNT/YxqpsSxaXE=;
        b=NriRpYEdIt9eZiZK5kP6B3FHn7p/B6HZNQpnEqdbnpq6BWixv5XoaaaY2FpsgKWUYP
         HGO32lOIN/6t5/0Kd/yGaj4wvOZJNR3G44KQlquA+zbYXKT8WTbZkPvPPMyRIyDCoZoz
         /c2MSojxdJYkyOOodmjheazUU+E5sI28WJQ2pmjZfPRKNcShn160H+PJTjtXF6D29DGs
         qBv1oQBxm41uFOI9rnedGN4myHDSb/zC1LitKHJ72OTSTzPZpkM8fBTMPafZ/wjb3uFx
         WFkgJrLszhq+pxDExPFfybCCFoKSRqZjTNICInH2Ti2xm5IixRh6tKP0Q8P0ZGIJO90S
         6DPQ==
X-Forwarded-Encrypted: i=1; AKwUvByM1RiUCkeK7FtU+J5adxa13JTImSfbDj/Tcg+hYUmEvbAHfS02DO5ar5oZKaQ8a+yarsv0tPT7cBfTUMwu@vger.kernel.org
X-Gm-Message-State: AFq9FYKVfQITeAu1CITdj9ghgRv6xRbvgP+TO5W4I5V4angLEFphkuRc
	bTLwwzP3iG75vA9x5v9PCiho/WMWRWWbCvo1Nva/gWJcQwEpdsSd+bQv7JSHKiT6CTHoI+pUMM/
	jd6lr6ELGgNTNFL5OhUCANKG8ZmKiCmhKANb9uhTdBu2YIp/nFljPRgFEmNApaNQiJGsU
X-Gm-Gg: AYBFou0qZjRcbB3czAx0DBV0GCHT4MiuKKc+kacqqCt1yOon7kk5CwvLPSjyExEc268
	eg3OO/s1bh146X5mU0ycA5zleLF5VG0X+K3vTYJBD9Y73LnK4xHnby98CstVUHEGYB6/UZAyWmh
	WaJJvPEtdNSjEpAgNMJn3Wd9GjJudc3klCpq6VZ7OKXstrrrcamIEv8StpqWvNPTYNC6rD4VGEM
	FI9Sfivu63ESqbrM9kwJBYMrj8QEkii9KaQLbiDSLLoDiMD9WSK6SZ+TiFV7m9ukKHH6HyQnAOb
	OziAFQO0ipauV6ox4P3w42Oo7E/D2f0lwd9ln3jzi4zbZUhSn+k/PnTtzaCcW5smlYET5TB+a2y
	3KHWXCF17oVkTbE1DZTIkR4D+kObv
X-Received: by 2002:a17:90b:4ac8:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3a8a10789bamr3477734a91.51.1791440658141;
        Wed, 07 Oct 2026 23:24:18 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac8:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3a8a10789bamr3477720a91.51.1791440657697;
        Wed, 07 Oct 2026 23:24:17 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ab034sm2767618a91.4.2026.10.07.23.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:24:17 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 11:53:49 +0530
Subject: [PATCH v7 5/7] bus: mhi: Load DDR training data using device
 serial number
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-sahara_protocol_new_v2-v7-5-90d278bd7414@oss.qualcomm.com>
References: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
In-Reply-To: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791440631; l=2312;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ZkA86Go2WmwsxeA79B2BPHvYldgOMas+7hnEDf9OKdg=;
 b=bOPbALLTjtghyIg6XWPv+m4uZabc/9k/qXf2m7FLi9ATry5ElCUPscnHwYbhJuhKdksUdejlf
 zmj75EumEjGBqTI4IiSli48DtA/009ODsG5zbLLblm0hBjfRMLBzdnL
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX6LrRzMqJubNf
 oIEvwop2JyKgNRbgkW+f2jjl3rBJjeatUH6ApZDak1r2rxOMXFRuxv9ITePPtXogBfXPqGIogY7
 vGWyEyL9vZXRZ09k1sFPi41GRPLd8x8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX4mRPvyimE11i
 3WXKLCSN77oQw8Z2KGObIdpz+zOKwUD1OdE9GqDxGCjpXqVf6st7eM3Ob2ViMf9hxzJ4iJyCSHH
 5LHeMtjL+MJPfbIJGqcAknAZk9mTMn/BCdCI7T8Q9IUtPMoqhJqvF4zSQp6vs/k0NZsH7xPcKGg
 192vdIAOfFYqItZ1ky4TdIAI/v3ENhvNFPQfBuZgj2w+/ogLD3Rk6vveNTBM7TRLhxFWVTRzvSt
 +j18w64aQ5fKJJ3FAtNTRU8Ph2/rlM3EezVFLPeKoncX5PkdbJDFobj3lZ/jYTWqqD5Hre+zfDT
 0D98Y5/QeKKdCIhYmfrqivofd7TOJlkYtA9TUwS22Dczl4KGaVzZBDiZMVU41N3VZBM3Rq+SKIL
 +xIhCKAw4AyHJGKeWWdu+7SYeWqcgXM4UAhj88J69DLldFisqJN84mUbLxieyKjwtqknwCwHIDO
 HL3JFz9A365BLnub1XQ==
X-Proofpoint-ORIG-GUID: hfHCmryvQLDSEpJIp3utKsYb1Lx05jNL
X-Proofpoint-GUID: hfHCmryvQLDSEpJIp3utKsYb1Lx05jNL
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac73712 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ICgrKnnyuXbdZ-Zkjz4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080025

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
index 7fe5158c17e9814f50b2065202a629eb10a742a8..460695055572151003110f4aec1d682b92753770 100644
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

