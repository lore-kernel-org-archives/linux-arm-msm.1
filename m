Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0733B0AF5
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260727; cv=none; b=o5/R3+CERTyAXoxRVnnYHksStJBMLLTlPiHkFMC4ojxnJSpAshEpmO1vOSB4v4oOBl6tcV7sKwU8qbNrhYA5Vbv8NRMXjJ/V8QYdim0s6Qy9ZSEpMpMCdfLiPPgPy9q3br44VT6lU9PUh1pjKcp6WkMQejFyXMlfXngt2c9cNqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260727; c=relaxed/simple;
	bh=8rsYCWsi+z+9YKAJEdO1NnrxsZm0QOOlc8znCD6EHwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZ/9gfTPTYGAgkiwux8Sis5FOHEPeEL1wosefwdDUNVpvP6wreIpziQPVyy7iMpVeME9vy7M+Jg9uJY+mzKse+vuzuaFQe1BZj3OpACX42iEWNRaH5WbO+R/L7amDNYc62H/QDoR77+4k9tr1A6y9/cOowsuDe5jC80tWqmnAqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/hGKgj6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8WvFkuG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/hGKgj6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8WvFkuG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SHIWHS3631251
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQuoy2xgAU0KTs2VSlupSgyKd8orCoUGVK6VULyRe9w=; b=m/hGKgj6zA/ZQKRo
	kY83IT6E4pgIdurcPf4cSb2il7G24SZIySQsOr8DsCrsCaZ+CMpPOv7v/A3mwNSZ
	Cq29aewugi2dfHxi8N2LvUAajcznrWaoyCPAA6+b0OI3bMO2BZ9YCmZU1A7qDCnc
	0gOwWD7uUBfY79jL0BdGGCQTJw3OdD2OeId63NbnuqgCBp7WtPqpzagveFZyoNFG
	sgwN5N6/uhwiLesRffaG8RgoDLLpBUlRlpp7qgHy3vLL6ZHk7q2IX4qsTpvh3JDE
	CgBxQLaDkBAPvAYUyedUQsv+pFapG+PC3rVrL2r1cb+2yOUgC+rdNWePMgVi9EVU
	u9C0/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q6r3n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so221876a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260724; x=1785865524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQuoy2xgAU0KTs2VSlupSgyKd8orCoUGVK6VULyRe9w=;
        b=b8WvFkuG0IjltcRnlMrymSPgttM+4OwqM6kgIUBBtT2FpLelFeojf2dDehL4UnXbeE
         Y2vCSHeppGtfGIqKiajwrVnF7WxzK8P0IXQpCD6GjNT10wcSRnIJ0/iPoqd+8ZSnPjbj
         hDuX3GJl+T1kX89dFfz4KDgtNkIk9gNwamH/Q7PVtTFVdo0fiNd2GrD0oP3COLisYTeX
         ItL3oTtWt2hak7GZulpdYt6Abkpmv4n/Q4QZL3WQrVeRNtnmCngpDbkw1uE3wZdDp8FC
         bm+xuy1ZwYnoFl0zqfB+nBC0GIYjT8/opfnXKRgIgk+gvUojjN80v/6gaJLo7XFvxNCm
         YU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260724; x=1785865524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQuoy2xgAU0KTs2VSlupSgyKd8orCoUGVK6VULyRe9w=;
        b=FPca2RNibw4yAz5jP/Smwik7ygahDKBzTU6rU+xJwQjBkLw0oW0S2iciclFLwlWa9e
         RPv4Sq2vN7YIXnXOluTrlGrB8i3k773Mwcto3RKZGXRiyUnIloLGsRf3+pPFBD03vTxM
         nFqH4pmmKu05m7DwNAE32pfDQaSi0D5QgfqH8nxyMzDiDT4vbqVKksCKJ4symUGWb+Rn
         Ns5ssOzLCszMDBM//JiLJ8elljEG6kEoyrzdyRV5VTRPMctyH8WebMuw0VkvRfArS4pT
         G9yRjcYtj78ZNKcuWZ+uiL2pleeH4N4kF52MIisMMF6eHPqhwv8PiX2NRGoGc/nwrsND
         /NNQ==
X-Gm-Message-State: AOJu0Yy5xWRNrVyFlw5lOVoaUtN3xG+IIKNrLVhdAgR63bbBaBhzEDis
	kZTBr3NEdlKF8qEV0WoR01oqXrERc7iy/55Ginki5r/KOlfDIUvhGMtJRuegXZzMoG/RiznziPp
	sJeKvQ/OqI/jccILhKSfyQ2TjXMShzngKffdDubm/I3qA2GARUGfUeBIz9P90Mxjwl1AA
X-Gm-Gg: AR+sD11l2jBnVQpm5lsER8nD2s+aBVbdujhxo69/Rvqn1Ar/edNVsPBq10ZazjFGhaT
	NNnV265g6i3xvplsEOaxXX8eM2O+iOlQ8RO5Ot6SATUVL40WxBdwTtJ48djGiWqetjbB/NwlJTk
	P17zR5zMBWXu9JDM6+1XsdUTYFHXGd1hVYKA5u8Khkw2vo1mslg3y6Qg1aO6zRrJQxrPlSrahco
	pXHGGkBzEcirdZv6uDiaflbVloIwvW/Z3JMZD1+MaKB8vXAI6ztzjbhF/DqzBEGhS6Z6zfnlkik
	F2RXEjRqFugSQ/O57TC87/VjJKUR1d5GhVtjqoMJjkxlvN45LZEh4naNB2XvOqYuxQC8E8eEEz5
	t0QLDo4R9YIPXaxiq2sGvaBl4+G7VM8ouLzuoPCdyyAY8bH1bsaEyZh1JSi/eL4q2O3uCGZtiVY
	Q50RyKXGIVfZ6f
X-Received: by 2002:a17:90b:584f:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38f6a4e2a12mr3669845a91.23.1785260724092;
        Tue, 28 Jul 2026 10:45:24 -0700 (PDT)
X-Received: by 2002:a17:90b:584f:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38f6a4e2a12mr3669815a91.23.1785260723698;
        Tue, 28 Jul 2026 10:45:23 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:23 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:31 +0530
Subject: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=7692;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=8rsYCWsi+z+9YKAJEdO1NnrxsZm0QOOlc8znCD6EHwU=;
 b=Cjb5ogUxHeejzzYkzjyPUKZFD+w0NW89x3yxMbBgrQ3YHevVfGZZ7kvXm9QkcdFuT7H5mrY99
 j9rmArWzGraATumwy2gJTBt363M9YAgemD1Dk+8jeSeoVLDrm4Csbci
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: WuG6g1zwO7sZj04Ef_P5PhMF7CGfdTdC
X-Authority-Analysis: v=2.4 cv=DqpmPm/+ c=1 sm=1 tr=0 ts=6a68eab4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=S1IX0agl0VDsrzKuCdsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: WuG6g1zwO7sZj04Ef_P5PhMF7CGfdTdC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfXx+ybWYnqOOTs
 G8VXJGx4me3Tyrg3B6mte3rWtu/Wz1vo6QEkUvBHanJPJdBvQpzpEzsM8XGX3VjTLSrZOzReAUp
 Xm3xG0p5r0uMrtwrxb9wC/wy8nN+ROY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfXzidIzJafUZGJ
 p1I74z23NvqLVUjK6b4sBX+U8pOk2ISE2mauxlLUWGdCoVBxgjmm1w156qdw1NUyzEIyhapNfBQ
 Qzu1i36beNfzC7zjrmw6xU0CQg43ML94t49hkaH2rl9POOp6wMsSPL34INTByuEYPZM+eN9+vFB
 701udgrymWUzT0rG9sbuBxv0xr2bLrnpKCU/V6SHT4socHSXQBXmegWKf1ntZYjIG2YJoKRLZXA
 5m0OPd5kiDp8o2kyzSzZMt/GNdiwTBdDjTpdr317+Wi+GwN/mEABU2o039pp8Ivx4NNpqOD5zRw
 f91DJpF6mgsACLUKH2NSf3Dy22nsgJaQixx2i4WevMnNAuUGL6LUGvfQ39FwbS5SCAW7caLF4xz
 VSjinvom341zf49M2olgjJf5ZIRcswIJLVzWS8xrZdzyZZv6S+RUrZzVilsrTYKUV8nfFQ8niU0
 KMdkOblFLu6CoxgHqyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280156

Add the EC command definitions and handler functions for switching and
reading the EC fan profile.

Register a power supply notifier so the driver can react to AC/battery
transitions: on each PSY_EVENT_PROP_CHANGED notification, queue work
that checks power_supply_is_system_supplied() and, if the AC/battery
state has actually changed, switches the fan profile to the
performance profile on AC or the battery-saver profile on battery.
Track the last-applied state in on_ac_power to avoid redundant EC
writes. Run the initial sync once at probe time, and defer the actual
switch to a work item since the notifier callback runs in atomic
context.

Serialize the fan profile write under the existing io_lock mutex,
alongside the other EC command sequences.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 158 +++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index 4c745b78322c..f6ff77d4e8f6 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/power_supply.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
 
@@ -26,10 +27,14 @@
 #define EC_FW_VERSION_CMD	0x0e
 #define EC_SOC_TEMP_CMD	0x20
 #define EC_MODERN_STANDBY_CMD	0x23
+#define EC_FAN_PROFILE_CMD	0x24
 #define EC_FAN_DBG_CONTROL_CMD	0x30
 #define EC_SCI_EVT_CONTROL_CMD	0x35
 #define EC_THERMAL_CAP_CMD	0x42
 
+#define EC_FAN_PROFILE_BEST_PERF_PLUGGED_IN	0x6
+#define EC_FAN_PROFILE_BETTER_BATT_ON_BATT	0x3
+
 #define EC_SOC_TEMP_SOURCE_TJ			0x1
 #define EC_SOC_TEMP_SOURCE_TSKIN		0x2
 #define EC_SOC_TEMP_DATA_SIZE			2
@@ -92,11 +97,14 @@ struct qcom_ec {
 	struct i2c_client *client;
 	struct qcom_ec_cooling_dev *ec_cdev;
 	struct thermal_zone_device **soc_tj_zones;
+	struct notifier_block psy_nb;
 	struct delayed_work soc_tj_work;
+	struct work_struct psy_work;
 	struct mutex io_lock; /* serializes EC command sequences */
 	struct qcom_ec_thermal_cap thermal_cap;
 	struct qcom_ec_version version;
 	int num_soc_tj_zones;
+	int on_ac_power; /* -1 = unknown, 0 = battery, 1 = AC */
 };
 
 static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
@@ -351,6 +359,140 @@ static int qcom_ec_send_soc_tj_temp(struct qcom_ec *ec)
 	return ret;
 }
 
+/*
+ * SoC to EC Fan Profile switch command:
+ *
+ * Command Payload:
+ * -----------------------------------------------------------------------
+ * | Offset	| Name		| Description				|
+ * -----------------------------------------------------------------------
+ * | 0x00	| Command = 0x24| SoC to EC Fan Profile switch command	|
+ * -----------------------------------------------------------------------
+ * | 0x01	| Fan Profile ID| Bit 0-3: Fan Profile			|
+ * |		|		| 0x0 : Invalid Profile			|
+ * |		|		| 0x1 : Battery saver profile		|
+ * |		|		| 0x2 : Better Battery with charger	|
+ * |		|		|       plugged in			|
+ * |		|		| 0x3 : Better Battery with charger	|
+ * |		|		|       removed				|
+ * |		|		| 0x4 : Better Performance with charger	|
+ * |		|		|       plugged in			|
+ * |		|		| 0x5 : Better Performance with charger	|
+ * |		|		|       plugged out			|
+ * |		|		| 0x6 : Best Performance with charger	|
+ * |		|		|       plugged in (default)		|
+ * |		|		| 0x7 : Best Performance with charger	|
+ * |		|		|       plugged out			|
+ * |		|		| 0x8 - 0xF : Reserved			|
+ * |		|		| Bit 4-7: Reserved			|
+ * -----------------------------------------------------------------------
+ *
+ */
+static int qcom_ec_set_fan_profile(struct qcom_ec *ec, u8 profile_id)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(ec->client, EC_FAN_PROFILE_CMD, profile_id);
+	if (ret < 0)
+		dev_err(&ec->client->dev, "Failed to set fan profile 0x%x: %d\n",
+			profile_id, ret);
+	else
+		dev_dbg(&ec->client->dev, "Fan profile set to 0x%x\n", profile_id);
+
+	return ret;
+}
+
+/*
+ * SoC to EC Fan Profile read command:
+ *
+ * Read Response:
+ * -----------------------------------------------------------------------
+ * | Offset	| Name		| Description				|
+ * -----------------------------------------------------------------------
+ * | 0x00	| Fan Profile ID| Bit 0-3: Fan Profile			|
+ * |		|		| 0x0 : Invalid Profile			|
+ * |		|		| 0x1 : Battery saver profile		|
+ * |		|		| 0x2 : Better Battery with charger	|
+ * |		|		|       plugged in			|
+ * |		|		| 0x3 : Better Battery with charger	|
+ * |		|		|       removed				|
+ * |		|		| 0x4 : Better Performance with charger	|
+ * |		|		|       plugged in			|
+ * |		|		| 0x5 : Better Performance with charger	|
+ * |		|		|       plugged out			|
+ * |		|		| 0x6 : Best Performance with charger	|
+ * |		|		|       plugged in (default)		|
+ * |		|		| 0x7 : Best Performance with charger	|
+ * |		|		|       plugged out			|
+ * |		|		| 0x8 - 0xF : Reserved			|
+ * |		|		| Bit 4-7: Fan ID			|
+ * |		|		| 0x1 : Fan 1				|
+ * |		|		| 0x2 : Fan 2				|
+ * -----------------------------------------------------------------------
+ *
+ */
+static int qcom_ec_get_fan_profile(struct qcom_ec *ec, u8 *profile_id)
+{
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(ec->client, EC_FAN_PROFILE_CMD);
+	if (ret < 0)
+		return ret;
+
+	*profile_id = (u8)ret & GENMASK(3, 0);
+
+	return 0;
+}
+
+static int qcom_ec_update_profile_from_power_supply(struct qcom_ec *ec)
+{
+	int on_ac_power;
+	u8 profile;
+	int ret = 0;
+
+	on_ac_power = power_supply_is_system_supplied() > 0 ? 1 : 0;
+
+	profile = on_ac_power ? EC_FAN_PROFILE_BEST_PERF_PLUGGED_IN :
+				EC_FAN_PROFILE_BETTER_BATT_ON_BATT;
+
+	mutex_lock(&ec->io_lock);
+
+	if (ec->on_ac_power != on_ac_power) {
+		ret = qcom_ec_set_fan_profile(ec, profile);
+		if (!ret)
+			ec->on_ac_power = on_ac_power;
+	}
+
+	mutex_unlock(&ec->io_lock);
+
+	return ret;
+}
+
+static void qcom_ec_unreg_psy_notifier(void *data)
+{
+	power_supply_unreg_notifier(data);
+}
+
+static void qcom_ec_psy_work_fn(struct work_struct *work)
+{
+	struct qcom_ec *ec = container_of(work, struct qcom_ec, psy_work);
+
+	qcom_ec_update_profile_from_power_supply(ec);
+}
+
+static int qcom_ec_psy_notifier(struct notifier_block *nb,
+				unsigned long event, void *ptr)
+{
+	struct qcom_ec *ec = container_of(nb, struct qcom_ec, psy_nb);
+
+	if (event != PSY_EVENT_PROP_CHANGED)
+		return NOTIFY_DONE;
+
+	queue_work(system_long_wq, &ec->psy_work);
+
+	return NOTIFY_OK;
+}
+
 static irqreturn_t qcom_ec_irq(int irq, void *data)
 {
 	struct qcom_ec *ec = data;
@@ -570,8 +712,13 @@ static int qcom_ec_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ec->client = client;
+	ec->on_ac_power = -1;
 	mutex_init(&ec->io_lock);
 
+	ret = devm_work_autocancel(dev, &ec->psy_work, qcom_ec_psy_work_fn);
+	if (ret)
+		return ret;
+
 	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
 					IRQF_ONESHOT, "qcom_ec", ec);
 	if (ret < 0)
@@ -630,6 +777,17 @@ static int qcom_ec_probe(struct i2c_client *client)
 		}
 	}
 
+	ec->psy_nb.notifier_call = qcom_ec_psy_notifier;
+	ret = power_supply_reg_notifier(&ec->psy_nb);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register power supply notifier\n");
+
+	ret = devm_add_action_or_reset(dev, qcom_ec_unreg_psy_notifier, &ec->psy_nb);
+	if (ret)
+		return ret;
+
+	qcom_ec_update_profile_from_power_supply(ec);
+
 	return 0;
 }
 

-- 
2.34.1

