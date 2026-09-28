Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDD33B7B6E
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577442; cv=none; b=ZhRd3nbha94rnHf9ard+F4iMh8UfhOG2Dc2vmSrIH65u2BUgD22G2YN4K2PMLCCdcBX1pLhP/b0fwtfepGNRDWQBI51GDC2bD9pNAQ04M9eTH3CiDiMp5csfIDRuzF4LOFvCFjrny5hZZnDREhpT5m9we8eWncF+oeAALGsjiVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577442; c=relaxed/simple;
	bh=X9UFLy/tSfYGS4+J8pPMCA7NLf0Fczxwpqtp/69dYqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ON3XHEoJcADb6G/fc1Q+sXhjcIw+OloHCB2hJzkCkNpu5n2gSsBwXW7hkQRXTYB8REatAZAYHBEdnck1Dze37ryiyQ5MYPfR3jO3rlc1WSNXLrwhlmiiFMbGGBYSCrpAvlBChZFgEl5KzdAOQGBlPC7vkW4GXaj4xi+OTvc5ZmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aV7AWv5W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBqwu5Ta; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aV7AWv5W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBqwu5Ta"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S5XgPi1666726
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CyfLly6N1EVgguRmgnD8MhSCQkFeA9yXJVjR7ODJleA=; b=aV7AWv5WNmJw2Ez/
	6Cwr2QYPRV6J6UuTycRgwHauUv9gmo+t01obj4pLJ7GN20SLyocE3WWDFd62O+nK
	aZ4qYasVVTqlU+NX5jJjdY6ZHrHF6uOirs55DwOFCjIvAxKv1XtRaLaxS+80Z/gr
	ZCnW25R2/tRslpszkIlFqBrirkrvPGmmSui+jUPXuHShP0BeC1VaHTyf0HJEhCyT
	rcX/ZDKfE5wZB1mHJVIgc2w/TAv57bqRS6gabH17aYS8FspjLV6NbQX/Xs2hnDeL
	t4/eCRN2RaPiHRGqPTGE1VoDgBMwldYLWQX5/vVVjk3YWvgEcSX0OixDsxtqijkM
	+Ki4Ug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t06jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:37:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dc7337e2a7so26032535ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 23:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790577440; x=1791182240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CyfLly6N1EVgguRmgnD8MhSCQkFeA9yXJVjR7ODJleA=;
        b=KBqwu5Ta7DTVFqoq7VrbYicYY37o1Z/REj71wkqCv6OFsPWGMDXxeqC7y6625SPqfD
         xYwDuJsTrXlBlYvRcgJmawGdxstIGI56b0Icqv3Z9x9G8xIJQXIZ706CY8t3XiQtm5H4
         NWPLMShS25CBXPOoqpTfuXhQTgRtfctHUf4sIzqw4Way1ubmDmTsGSwIiuNEiR2nzAX4
         y07NZOSL0Uib49ckw5oINN5odfcBI3B8OGi2CdZ4EASv13+fBkJZsmHlJj0F5Asj+00a
         5UklNWD+EGVP81FL8gub2LglbLcp+o+EZ3uHeg2WJLOlBn4AZCOekys4B/q7uygXeNzE
         zPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577440; x=1791182240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyfLly6N1EVgguRmgnD8MhSCQkFeA9yXJVjR7ODJleA=;
        b=KlBSUCStKg+cY+1/KttAPYxQC/WDmnS6i65msPXZrHESWbGh10GXRZBdoH+Mq4a1Md
         nNVJz2StyYzkMxgq7wXUi2HdWoY1yorrtP/ggg+gnAce7xgHBAqHveFyIYEGH3bc52QU
         FOD31A/laJUOUzIP4if8AAXzEwbk4zUOPlWCzm0ilQL/nFcet3EMrec7kAYN+a1GFbbd
         HigUU7R7T3+6Mh2k3Y31M0Sa/uRCbTmwnXQ9UPj1z34mU7CV6L+HnHfar9c/ngkkzLAM
         iBmGTceiJKpJo1F6qP+p+aA/p7OqYYIYxcyFb7FeCRJ6nZIsIMf3jwCDaentV5Vh5qwi
         xDUw==
X-Gm-Message-State: AFq9FYKhNIVeOxc9crVWFZa+aOmuTp775s4RL7IC0zoRKVUGC5TIGxsq
	ZABdM1XQXSmuEq+z48nt6YYYgdEomvrrH27OMLOXlJ2jaEzoxKHXek2nZaADCSES3fXfIXLwvrs
	9V6FaF1eCf1ghgHfDLhdQK+laFnD/o0hf6OIGpZiMY5dg6VzuSgWVhu5DUDbr0+tsdPjH
X-Gm-Gg: AYBFou0wFM/o/GyQD8sk2RqlXH+03ZUhR6IY+koJxLvGjoZYch51q+DRz52esiOvk6v
	Q2xt8FoNymg2KaK3eC904X9E8l/aHh2MPX8wPBVufqaBmF0SbcNYkzhXU0HQbeTP9ReZG9mVyUS
	b/+LieCdZBiQabCDOWYRoH4mVQTJoIKrKNsVUsWng5YFKdKjYU3aIE3wwmuGSEeGwmEZdLQSFin
	YqLwTsFXCKPrdG3x9PCHbDXGVK28/IfplvRnH8bsTq2iAaVFsR875pXYePRF4/G/XWsJhs23xhv
	CR4P2NSHdyY2qD98Mqw4kdVs7gkOVlKaCC0/OHYvYOXs02XkN+15QfiuDOAqBTk409VppP8xdZ1
	Y7jkp7tszz89u621wGmg3yvzGwp1xTU+UwVf4KSixdb+fT0Nuv6BcSeitH0Zik4fcIwEekg18Wd
	BBa3ok4H2A++0S
X-Received: by 2002:a17:903:40cc:b0:2dd:c053:e0f7 with SMTP id d9443c01a7336-2df7e43e9d3mr99685795ad.38.1790577439852;
        Sun, 27 Sep 2026 23:37:19 -0700 (PDT)
X-Received: by 2002:a17:903:40cc:b0:2dd:c053:e0f7 with SMTP id d9443c01a7336-2df7e43e9d3mr99685285ad.38.1790577438317;
        Sun, 27 Sep 2026 23:37:18 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91468978sm35292685ad.79.2026.09.27.23.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:37:17 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:06:38 +0530
Subject: [PATCH 2/3] platform: arm64: qcom-hamoa-ec: Add thermistor sensors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-ec_thermistor_support-v1-2-d9c1bae4cd0d@oss.qualcomm.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
In-Reply-To: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790577422; l=4925;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=X9UFLy/tSfYGS4+J8pPMCA7NLf0Fczxwpqtp/69dYqY=;
 b=EPb/q5RPLAsViqDE6Uvnl/UuIaZ59tliKEnlPqYShFnn2utiQCbb41DjQPV4L0ttO5wzHdWu3
 pQenjuz9uUJAGrnFAS1AwNr98t5Qzl81xNozVSLpMijAgqeGFBXxKFS
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfXyX44pnCOgnXT
 XlltaqMO3k8n6cKe+w3Ye02v8P7/kB8CGyFrENwp1e+DqG247HIxbocuFinSPyr4ZzASz1HrZzN
 +P4eJQ017pPNlVpiOF/91h+eDGn3A84OYRm6CXg+Zjd9iWwc9+msMpe4OXCtr6wNaQqCkHXoNWv
 1qz5mdhQOIM/9Lj/V57Q735Mi8mngFno/WrJK2uRhbwxQOjzoIU9oQTyckzhH4M017c+9kRlgxn
 j+Hc3DY/PAORGXN7GGa4vy1ftfuHKiVX5wH3Qc1ef3z3cccRac7Gji5ztgCLTc34sgRrNsc2rRT
 jfZvuUyvFKun8oCXlsPqrvBFhphi0fiH1p6FYc8kl23aFpPjoh2AZ333XBG9/jDW5sQAtIXvSFD
 OPDXfgGd9u5RWCNyfKPKyiaaFZVQWKcsOq90OpB0uDsjx1NQGyO3OmZRAx6UZ33CiuMhlFAcWFw
 WJ56v7uo4gKb8Y4VL5Q==
X-Proofpoint-ORIG-GUID: wA6JTBllcR_UuPJaTALu8mG22YgmQe9K
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6aba0b20 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iQKfIWaIXs3HRlposCEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: wA6JTBllcR_UuPJaTALu8mG22YgmQe9K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfXzCSXxLa2KJsg
 vNR3Uit32KdObuqZq0EhVMxgO1H3wNIdsLtWCm5cPUUxzK1Lne53L7lc0Rh0lcUqBxPYq2K99Oe
 bdc4fFPXrimk4LJuC8N5PgeOH7FXbTM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280026

The Qualcomm embedded controller has exclusive access to multiple onboard
thermistors programmatically discoverable through the
EC_THERMAL_CAPABILITIES command. The temperature values are reported in
degree Celsius through the EC_THERMISTOR_TEMP_CMD.

Register these thermistors with the thermal framework by adding support to
the EC_THERMISTOR_TEMP_CMD and convert it to millidegree units as required
by the thermal framework.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 74 ++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index 4d2ad042a7f8..acf3d7f53026 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -16,16 +16,19 @@
 #include <linux/pm.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
+#include <linux/unaligned.h>
 
 #define EC_SCI_EVT_READ_CMD	0x05
 #define EC_FW_VERSION_CMD	0x0e
 #define EC_MODERN_STANDBY_CMD	0x23
+#define EC_THERMISTOR_TEMP_CMD	0x29	/* + thermistor_id (0-6) selects thermistor 1-7 */
 #define EC_FAN_DBG_CONTROL_CMD	0x30
 #define EC_SCI_EVT_CONTROL_CMD	0x35
 #define EC_THERMAL_CAP_CMD	0x42
 
 #define EC_FW_VERSION_RESP_LEN	4
 #define EC_THERMAL_CAP_RESP_LEN	3
+#define EC_THERMISTOR_TEMP_RESP_LEN	3
 #define EC_FAN_DEBUG_CMD_LEN	6
 #define EC_FAN_SPEED_DATA_SIZE	4
 
@@ -39,6 +42,7 @@
 #define EC_MAX_FAN_CNT		2
 #define EC_FAN_NAME_SIZE	20
 #define EC_FAN_MAX_PWM		255
+#define EC_MAX_THERMISTOR_CNT	7
 
 enum qcom_ec_sci_events {
 	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
@@ -64,6 +68,7 @@ struct qcom_ec_thermal_cap {
 #define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
 #define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
 #define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
+#define EC_THERMISTOR_PRESENT(mask, id)	((mask) & BIT(id))
 	u8 fan_cnt;
 	u8 fan_type;
 	u8 thermistor_mask;
@@ -81,6 +86,12 @@ struct qcom_ec {
 	struct qcom_ec_thermal_cap thermal_cap;
 	struct qcom_ec_version version;
 	struct i2c_client *client;
+	struct qcom_ec_thermal_zone *ec_tz;
+};
+
+struct qcom_ec_thermal_zone {
+	struct qcom_ec *ec;
+	u8 thermistor_id;
 };
 
 static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
@@ -183,6 +194,43 @@ static int qcom_ec_thermal_capabilities(struct device *dev)
 	return 0;
 }
 
+/*
+ * EC Thermistor Temperature (cmd 0x29 + thermistor_id, id 0-6 selects
+ * thermistor 1-7):
+ *
+ * Read Response:
+ * ----------------------------------------------------------------------
+ * | Offset	| Name		| Description				|
+ * ----------------------------------------------------------------------
+ * | 0x00	| Byte count	| Number of bytes in response (=2)	|
+ * ----------------------------------------------------------------------
+ * | 0x01 (LSB)| Temperature	| Signed 16-bit, unit of 0.1 degC,	|
+ * | 0x02 (MSB)|		| range -40..+125 degC			|
+ * ----------------------------------------------------------------------
+ */
+static int qcom_ec_thermistor_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct qcom_ec_thermal_zone *ec_tz = thermal_zone_device_priv(tz);
+	struct qcom_ec *ec = ec_tz->ec;
+	u8 resp[EC_THERMISTOR_TEMP_RESP_LEN];
+	s16 raw;
+	int ret;
+
+	ret = qcom_ec_read(ec, EC_THERMISTOR_TEMP_CMD + ec_tz->thermistor_id,
+			   EC_THERMISTOR_TEMP_RESP_LEN, resp);
+	if (ret < 0)
+		return ret;
+
+	raw = (s16)get_unaligned_le16(&resp[1]);
+	*temp = raw * 100;
+
+	return 0;
+}
+
+static const struct thermal_zone_device_ops qcom_ec_thermistor_ops = {
+	.get_temp = qcom_ec_thermistor_get_temp,
+};
+
 static irqreturn_t qcom_ec_irq(int irq, void *data)
 {
 	struct qcom_ec *ec = data;
@@ -376,6 +424,32 @@ static int qcom_ec_probe(struct i2c_client *client)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
 
+	if (ec->thermal_cap.thermistor_mask) {
+		ec->ec_tz = devm_kcalloc(dev, EC_MAX_THERMISTOR_CNT, sizeof(*ec->ec_tz),
+					 GFP_KERNEL);
+		if (!ec->ec_tz)
+			return -ENOMEM;
+
+		for (i = 0; i < EC_MAX_THERMISTOR_CNT; i++) {
+			struct qcom_ec_thermal_zone *ec_tz = &ec->ec_tz[i];
+			struct thermal_zone_device *tzd;
+
+			if (!EC_THERMISTOR_PRESENT(ec->thermal_cap.thermistor_mask, i))
+				continue;
+
+			ec_tz->ec = ec;
+			ec_tz->thermistor_id = i;
+
+			tzd = devm_thermal_of_zone_register(dev, i, ec_tz, &qcom_ec_thermistor_ops);
+			if (IS_ERR(tzd)) {
+				ret = PTR_ERR(tzd);
+				if (ret != -ENODEV)
+					dev_warn(dev, "Failed to register thermistor%u zone: %d\n",
+						 i, ret);
+			}
+		}
+	}
+
 	if (ec->thermal_cap.fan_cnt == 0) {
 		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
 		return 0;

-- 
2.34.1

