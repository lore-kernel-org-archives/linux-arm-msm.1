Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF3E3B47C6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260742; cv=none; b=m1n5ihSqPLNeUXHhc9cr8ZgxZ/ZVggxTo+ThShqTHGiHjUUc4PyrnAyGuKhz2dZWzprc7yeIQDy2NJl5Vu0EYxsULNlz8VxOOnLUPlh3hVBChyndBb+WKpGejVONkoa8zm6xa1Vl5veC9MoillNAc9yvqFEHHthAgwDxNzru6TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260742; c=relaxed/simple;
	bh=t44lY22s35NEeNaqS+Z3V6CASIdAbd2ynB7Wy9hB8i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lzbt2HDMq+7BSaz+xonED+28n+Tb0dVvShbRg+KOaj7DOEaEL2KO8iqoYhG9JeYVFoZid9myhTnW7wmP/xSKl/KxBvBwWCM8Y/x18tiyXJC8vygDFLRS0gIelIWfDiBGBHd1wHSu3e2KY4R5yO0crJsyAW0bwJDUPKqf4eEIz+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9bAwFiM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cP+nyc/A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D9bAwFiM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cP+nyc/A"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcW4n029614
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1YYujMqkG4tWK2IP4MSkxSdkB0+eWGpWly5CPNr074=; b=D9bAwFiMNg7yNpNc
	2CQpjMGPTn0WkKv5ziO45UIsy0BzmBXAnzhX/WeeWn+pJvm0m7X83SAjpyulqiAk
	qT3NjLow/MCwv7/KQ5Ce5BwDMZtuqlFZpe02LfARo37I2phzXQPJoOgNcCOADRFj
	+s0+QaJdol0qivm/OnxAn36hLgxZIdlNrYOB03pV15LxXjEdaFiW9GQOrnlTOfC8
	fgkL2lj+xOfxNOgCeJILnaBE4lkCQ3w1LaUG/pW2VE/g0C96aaPkPFBpdH39ZYte
	yBkZleWfXGivmUnmULubUhDHd+Sc0lSAnfpNZKfSj1uJRgdJACJPcux9gTiL6jhK
	yGpHIA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvxxhmvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so18693a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260740; x=1785865540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1YYujMqkG4tWK2IP4MSkxSdkB0+eWGpWly5CPNr074=;
        b=cP+nyc/AJ0cXgvtkUyR0kBA1biQUH5MJAymopvaRJ50/5uNo4SzP0VlxEKT4/iyUfl
         kSiDzKnbWRxV50BGlN0WRvroKxCh1j2M/5URF4TYVqczqkX4WpRP8OJEM5atdlPpI5k9
         XQ9NZBldCTezBaAnzp01vdKgk7N+lvPfqNEGlqnfCGs2TGAOyODbGu0xfSyWmU/4B+oJ
         ZFoFxhTSDTH2RDe7q+Re6lvikX6O/AAWcl3YMVcWR3n40iTBG+sI47oDyvcMIH0ti00l
         ITFqV6hCtt3BDQkLti+IMZUgg1W2UAmPQU3GbpkNfXNkVrFIVVn2KGZFTnT7maVJSis4
         szcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260740; x=1785865540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1YYujMqkG4tWK2IP4MSkxSdkB0+eWGpWly5CPNr074=;
        b=s4QtRtUkYegDV2FrbGpK8X9Aia7U9qRYY1Y6uVumtaTr1qC19vPDma07Ju9BO/Ox23
         3lk6gSV9nqlCuC44oZD4gQ4SfCpa6rgDn3lwk1i01teyVAxBg+43VwuKuB995A8UgCLB
         5JohQ00yedicvPhD/OXDWHVCIKeOuLPJkR+qwZl+p/KdAailmIDe16VCyqgExrsgzPuZ
         99c7oD0qKzpZh/i0IBwwV2NqcuKONXrWxoMWuoKLs+y3ePrKynA4CtXb4qXe4eT2hV65
         x3q+uQk2wVN7z8E1qWIeZglmcSHgvJi+QMvpz2CNCrcDvGNQNMumSDG1RiKO5yXyYO9D
         eLNA==
X-Gm-Message-State: AOJu0Yz/j+N5ZvSIKNYvUFbTScBz5H5WYpeVeoMb1BEAW9hK2O+PAK2H
	t6lidnj5wje1hlZG3UmnVO4R+je2khd3vwZ0GN6GfPNHxmt8mafdJ6GwRDKRVJs7iQhDD6m1RwZ
	XffQyQmfpJOK6PtoLbxJtxOX+cuWYr11t6yDsVYOFu1XZyYHR/5dt5YD5ZgFPR168IDAL
X-Gm-Gg: AR+sD12tGLaltsAVbp97tbheiLu1zjmB56vKRWqCPXXOLjQ/XuwHVtbhqTh/rUPYce2
	CqingHDT6npO9ir0KYMjdE2naHeBxqwvYpcj6MqOrVj9lHpdkOgwdSyH7xfPUFMvP52o4dOru9R
	zZaVLlwXjEMDv4njxoRsXRHzOz8SeHhjyNCTE1qDhqbz/mhYLd5HrjouCu8m9Ob/LmfePzmVdIz
	mOvjZq0T3/fSy/IXm2sLWTGpUxt2oWTyaZ3OH8j+l1S1PQb1GVA5IxMbO464Yv8bPv/f7zuyEQ+
	9s2f1sBQUqOoG0l6Qafoz0MRoqxx47MD9jozjX9OhTyY6ySBs9Voo30v4NsbgEEJ26xxl6hP0Tf
	UmZBQRDbep6rBZlPfNGPGc9IZLz27vGNhw5ht34wqByMpz3D80e7I5NVihaShL3A92aDIdX5Ed6
	2TdJlj/F05/nC4
X-Received: by 2002:a05:6a21:339f:b0:3c3:8315:80b7 with SMTP id adf61e73a8af0-3c8aaf9c597mr4605574637.9.1785260739622;
        Tue, 28 Jul 2026 10:45:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:339f:b0:3c3:8315:80b7 with SMTP id adf61e73a8af0-3c8aaf9c597mr4605519637.9.1785260739030;
        Tue, 28 Jul 2026 10:45:39 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:38 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:34 +0530
Subject: [PATCH 6/8] platform: arm64: qcom-hamoa-ec: Retry I2C transfers on
 NACK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-6-771abd65ee1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=3402;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=t44lY22s35NEeNaqS+Z3V6CASIdAbd2ynB7Wy9hB8i8=;
 b=MrRZiNl4voVXf4hRnRJ8F06/N2JEkPvmDNWY02iNeBScF/2lUgP9On8XD/rF/dtSeM7/rxlvK
 zTzwWjST1EdAhEws4JCuWMw9je5aUF7DCplWvhyRimq8CYaZsnOoWp0
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX4R0Ue4duiuBC
 vzbIND/ANASNDeoqQXiXE079z+Qcolwuanpw9lA/1TLC5MO5Qw5KKKBo9wMs9GqBn7JzW4tRnbZ
 a5LZfJMmKsgwQT6xQbKgkrpJC1hzsQkXW2Ua8J2MRUzJSu5SJzeYJAw9gM385CcqFQkZ5BDzIsW
 uhUl7Mz45U07wQvNASdNCsXqlTJlV3fpdRksg4kZGa63m3ptAJY+rIXwvht66rA8bH1dk/Ek4dG
 03Bx74okoi2m8btTz8xr+prxV351Ivv4f3z5REyY6dBU8NCJwzuBXfI4Bt7m0INtsBCP3KnvFsl
 Q90dU7yQNVl9lrAIxGVSgBNniVnLPmH1AoVeDNCrvW3QoS21OfY6a0kjzwFQco+Oz69HgMMkQop
 CBgP76wUAngro+q0BBvXfAnhQkccH3CFYrynnX3gVFZipIsoY/aJnCup7wFkrQ1h9lNZ1hAlOVN
 f6FeCDqvjl8XmST2wow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX+X6b78wiw9ou
 lgaDpmHpdMj4Hpk4txzi96fUVvhQvjVWpOh5haXhYwkevTy5sTH4R1ru3iUzjEaR9MQr6m6k9Pj
 DUdQEh4JEdUA/N4W0o23OwIQSP/AQj4=
X-Proofpoint-GUID: oqpK9Ct6tQHbWFNb72OMD-XqjT-0PJ9L
X-Proofpoint-ORIG-GUID: oqpK9Ct6tQHbWFNb72OMD-XqjT-0PJ9L
X-Authority-Analysis: v=2.4 cv=PeDPQChd c=1 sm=1 tr=0 ts=6a68eac4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PsJaXn4vnLjY93LmvYYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280156

The EC firmware NACKs the bus instead of clock-stretching while it is
busy servicing internal work (e.g. right after boot, when it is also
emitting a burst of SCI events). A transfer issued in that window fails
with -ENXIO even though the EC is otherwise healthy.

This isn't visible with the smbus-only command set used previously; it
surfaced while stress-testing the new fan LUT command on Hamoa, which
issues raw i2c_transfer() calls more aggressively and is thus more
likely to land in the NACK window right after boot or during an SCI
event burst.

Retry qcom_ec_write() and qcom_ec_read() a bounded number of times with
a short delay when the EC NACKs the transfer, before giving up.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 40 +++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index a420a180a194..122ae27c2b48 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -64,6 +64,18 @@
 
 #define EC_SOC_TJ_TEMP_POLL_JIFFIES	msecs_to_jiffies(125)
 
+/*
+ * The EC firmware NACKs the bus instead of clock-stretching while it is
+ * busy servicing internal work (e.g. right after boot, when it is also
+ * emitting a burst of SCI events). This NACK only occurs at the address
+ * phase, so retrying the whole transfer is safe. Attempt the transfer a
+ * bounded number of times on NACK before giving up; a genuinely missing
+ * or unpowered device pays a worst-case added latency of
+ * (EC_I2C_NACK_MAX_ATTEMPTS - 1) * EC_I2C_NACK_RETRY_DELAY_MS.
+ */
+#define EC_I2C_NACK_MAX_ATTEMPTS	5
+#define EC_I2C_NACK_RETRY_DELAY_MS	20
+
 enum qcom_ec_sci_events {
 	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
 	EC_FAN2_STATUS_CHANGE_EVT,
@@ -233,11 +245,20 @@ static int qcom_ec_write(struct qcom_ec *ec, u8 cmd, const u8 *data, size_t len)
 	msg.buf[0] = cmd;
 	memcpy(&msg.buf[1], data, len);
 
-	ret = i2c_transfer(ec->client->adapter, &msg, 1);
+	for (int i = 0; i < EC_I2C_NACK_MAX_ATTEMPTS; i++) {
+		ret = i2c_transfer(ec->client->adapter, &msg, 1);
+		ret = ret == 1 ? 0 : (ret < 0 ? ret : -EIO);
+		if (ret != -ENXIO || i == EC_I2C_NACK_MAX_ATTEMPTS - 1)
+			break;
+
+		dev_dbg(&ec->client->dev,
+			"EC busy (NACK), retrying write of cmd 0x%02x\n", cmd);
+		msleep(EC_I2C_NACK_RETRY_DELAY_MS);
+	}
 
 	kfree(msg.buf);
 
-	return ret == 1 ? 0 : (ret < 0 ? ret : -EIO);
+	return ret;
 }
 
 static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, const u8 *subcmd,
@@ -281,11 +302,18 @@ static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, const u8 *subcmd,
 	msgs[1].len   = resp_len;
 	msgs[1].buf   = read_buf;
 
-	ret = i2c_transfer(client->adapter, msgs, 2);
-	if (ret != 2) {
-		ret = ret < 0 ? ret : -EIO;
-		goto out;
+	for (int i = 0; i < EC_I2C_NACK_MAX_ATTEMPTS; i++) {
+		ret = i2c_transfer(client->adapter, msgs, 2);
+		ret = ret == 2 ? 0 : (ret < 0 ? ret : -EIO);
+		if (ret != -ENXIO || i == EC_I2C_NACK_MAX_ATTEMPTS - 1)
+			break;
+
+		dev_dbg(&client->dev,
+			"EC busy (NACK), retrying read of cmd 0x%02x\n", cmd);
+		msleep(EC_I2C_NACK_RETRY_DELAY_MS);
 	}
+	if (ret)
+		goto out;
 
 	if (read_buf[0] == 0 || read_buf[0] == 0xff) {
 		ret = -EOPNOTSUPP;

-- 
2.34.1

