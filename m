Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232993;
	b=sMwAHmqJY2bWUhdnTXCQB5DDoIY47wfrsoaskGYcZeCe04KIsSLfsZJfbLi/lF6ynLnl
	 ddZdrsRgR4zhhW8F0yWQPsJI2UL9Kqq3joYqgBj67rfUh9UpdjYAVcf/mOjhHHzoFuW/I
	 3C1uuP6mmMg/CERLGSAmbvnCXvZY+JVqFE8OVE5f41xAyJwR+yArXMJa0M9SzVaQche96
	 A+lY9bbpb/FxglaNxWAlgj/4+3lpMBICn7DgOsJLwYaQmUozuqkRU2dr4/wq3Asl+GFaW
	 gM3UG7tvZkXCp7VGCkb0g28370Z+5qSpcRQjN/eFgWkBjT/PH8CQXIZB7A9WE4CjFwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232993;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rMm4oZuo2z9W+nImaszEaAp1ADUmyI6URhH6NsR12iw=;
	b=jzk7OwSxn9q1Wi+ggq2tHleXJWZH6lZnGAL1JcnJspt8Nqs/1FYOed1qL9FjBKL/W1gO
	 sihNWSiAQIx9IHlFLmX5vzGk1F2/pBXUkctV+DBdlDavGkwwNC4DpO9yiP9vQniCbQixv
	 H2vJXJR7Eciz5ADBGrZVqIVxXzU4yaAZ7ghAIwsTQfdav5ufvT3uhz4Q+L3FtApo3VHOj
	 sXNNVg9W3xD2g1NME0Yfi0U10HMIfcd2YnjuzDTqrVVWJ18Nj3y+POLfQgLo1Sev8oYIT
	 nX2qA9fFDlIkEnpj2PJ/paZwEHKR5L+wX1wAalW+nTzBgXe+0z9WoUfn8Vfulx70TXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Nrl/FBq1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g4dd3nam;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DAF606D803
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27DAF606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nrl/FBq1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g4dd3nam
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFHTv985148
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rMm4oZuo2z9W+nImaszEaAp1ADUmyI6URhH6NsR12iw=; b=Nrl/FBq1tchQeyEO
	usYUOiM6DNJ7kNmTpsZ/+DRm/R2l5HRmmarw2ynLWaToVnPHX2hAKzNnX84norvu
	S2zps9VRww7nd1KgkeE21hnbQwrqUhe/o2UerwID8HUk9WNUEpuzrAiQ+09Phcbn
	YKZRBd6K2FaLMtZTElGPsB3/PYU7IOH672Xeo1ib2oQceNXf0ppsl2jLuvtpTo0X
	ITrQZB10mI5e49KvdKI8XU7BlNBIcT4t00Nue9gpZFZTWbL2HqzurrDemWf1HEU2
	JRE4cl170BwjEdORL5zL5VEVJPdSjX2T/edDY2MQbJ22GptU6bde52z5bqAGPbZu
	ujkHsg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxenyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:03:12 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9905fc56b60so800521241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794232991; x=1794837791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMm4oZuo2z9W+nImaszEaAp1ADUmyI6URhH6NsR12iw=;
        b=g4dd3nam1MCzoRnGGWYaCz4GPC9D/NGBggObDqLf+9ErWA2Zxfr+q28aV2M+za4nP/
         qkr7MrVJ1l0VTSkzTBJ5nvv3b6asbW+/3/rwYqmoeLokecthQs/Vq5aFa5cLAGCnOnu0
         wMmXyIdZfuARhZExk6Ot1f42VITsLgIhqXkgSAMpPgKdf11kMi3KdQYGrFlP//S2PqcT
         Wu3Ug6KqYO30a8kMD1SkpGUZhiFOP2KinMGaFTZenm6mbhUimPtar8yUEu4zX9d/GrNA
         YMNjgFoDE2r08e/UH/GxwM4tcBf0fXiXLCA0TI8KzbbRmL2JXmTIv37trgikEXxQfLog
         ZjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232991; x=1794837791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rMm4oZuo2z9W+nImaszEaAp1ADUmyI6URhH6NsR12iw=;
        b=OgARXaLQIAtMyDY4XnB9MK4wrVT6SnDypXmviKZKgiBKKQ7P0VBosf8q+0NvTpzv0b
         3VIVwqP/QIrF5AB38p9ALJTHn1wovylNh/KIw6fI7kwpiwXurz7hdC6UKF29lciObvrJ
         F9CE8bNEZKMp3exDJ6KCh4yFK+9RyovbmDz5ANcyMTG82DNVOM2ET5TkLgRU5G3D7rlz
         gqBRlGEVfpQMfPyNNCQuQcgx3/unKY7p6iLc90vfe9MPhxfbOXPrdZsHzp3cX4aDpKsn
         o2J42OVpghpNIzW87XiivVTudhsk5A4VTXOcRsUkLrB2fZXFdAVfIY2TMha44D+WO1Ba
         6Qcw==
X-Forwarded-Encrypted: i=1; AL+hErEs9LFoCC6cEddTMsDqcHlXnjkkzmQVMvS2R2NwLP5fy1juy5QplY2Ksgp1HcJdizEmmkVaWhd4CIQbuEXk@vger.kernel.org
X-Gm-Message-State: APuU4Z+FFikAg+vfyXRqwqobou5jsftA5J36lbvyqRAj0MYWTBSHE8eV
	bNe/GXq5LvknElVP47kr9k681usKpgXXR8zygao4iB4ov9fXeCygHZblupa1QNiw+ZOEKzGtVt0
	g8gGGsi9JWFqQ2/6axDD/2KpuV1kPFtDPz10IEuY5rDkdB8UvstVlfG4Fp/8Zk1lWKIak
X-Gm-Gg: AYBFou3w62QVyiP8DvxCVeYGxwA4sGxdNSzI51vGuD6LsIVc5w6Yq592grwg1NzJomj
	NBN2dB/aK0YCxLA9ZOSk/4N2NLjq2QvI2sVrRQ4bkpDUL0GD+buYzKVdCWlhw8Y6XGPCIZqaBhl
	s6hDwFo+Mfo1TauMX5kT+fEFf6S54FVXCdVW9/JbYeskqMncNLN1Bus9xm/JGy7mopE0+7YVQWp
	bn13DqHlnrteW+ud+Ofu5wUU3LLugkiNTudVO6l5QbJARneGqDuwrHNoWu59Ghu+HxOcmH3J6XY
	c8RDqD3ioKSPaA2v3OBnm6HUIeDKJqNU4iLtw/iadeBqUEPJEgSyX7IbWn6kRHqsSKucv/kTtQ9
	Ndec8flmwbEM0yW419k1mIAIxrRGDSSZddtyBi0CfnMCAaHWYXNxjf72E6VGj6ld3vKCt4j8VeP
	Q8E1xpfQ4HrKIuLwZCCmWraHRKFr7VrGhyjgUrS8eCGbnk9Uc0G9I8O6WTqKnyPgowJDeo303YY
	+RF9Fu6vIaWOOjfsBfiGw8Wl7j+
X-Received: by 2002:ac5:c001:0:20b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ecd1fb88aemr1103879e0c.15.1794232991247;
        Mon, 09 Nov 2026 06:03:11 -0800 (PST)
X-Received: by 2002:ac5:c001:0:20b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ecd1fb88aemr1103759e0c.15.1794232989817;
        Mon, 09 Nov 2026 06:03:09 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f9b5:154f:6aa3:35d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm161515845e9.4.2026.11.09.06.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:03:08 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 15:01:58 +0100
Subject: [PATCH v4 5/7] i2c: qcom-cci: Extend i2c read limits based on CCI
 revision
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
Message-Id: <20261109-cci-imp-v4-5-4dc4095dd052@oss.qualcomm.com>
References: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
In-Reply-To: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: fjRuoaDkpsH1Y8fpHOocpFe7lx3drpyx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX9IsAS+KxIDII
 vZbKrirbtju8iSQabvhaZChLRednpbuCG7SfMSQy/Az5KoOOCE9CJLcFOqDtf2htMg7TuKZh/f0
 v/SlfXK6V6RXb/gpM0ghfqYLGZr95GfRJ2CoZLPer9dAMom15zJF3M1TS2EKFu7zZ7IudDx96zD
 4FgVapYntSL1OeriPPIDgODQsNenTyR9fBbMNF1AzJzu+LwgIV7sCZUWhJImG5gBSfsor3jGKtT
 ShOSZ+eSe70UycpHPNj4FEpT99sA88VaY7qCMU+n5ZK5JG3/lNlS8ByMp/GDDedgoDN1o3kyEEY
 QQ/hY7vDKdxQmVJw/UcE6WfejhANZdEll8BvLw8mcGwMfTObNpmT2RRvYjzeB+dA3QJH82y2vmI
 aljtHL6AIeZG+kRajOSMTfBhr2LjdM8DvUunv1wTgAIt6aVrDtFxDaBsmSCSVXwXazNnCY4jxaZ
 AZkUpnZA/hUgBipj8tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX+Imqpq6MZRVv
 8chZWbBppKa+mCf5fBGT6IvWi7FCc3rHnkJcj6BCVnq+QyfUt+6mKnxjQi8uDLRD6eXJ6LyXS4d
 WdCL37NI9cEx5LXN9PN++WxpJ4yTgkA=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1d2a0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Q-BVT9UuQ3EDAlpGIL8A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: fjRuoaDkpsH1Y8fpHOocpFe7lx3drpyx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090055

max_read_len was hardcoded to 12 bytes for all CCI revisions, but
this does not reflect the actual hardware limits. Depending on the
CCI version, the maximum read size is either 14 bytes (16 - 2) or
254 bytes (256 - 2), corresponding to FIFO_SIZE - 2. Two FIFO
bytes are reserved by the hardware, with the first and last bytes
used for metadata such as slave ID/address reporting.

Add CCI_I2C_READ_MAX_LEN macro to derive max_read_len from each
revision's FIFO size instead of hardcoding it and adjust the
values according the hardware revisions.

Improve the FIFO read procedure, read the first word, discard
its ID-echo byte, then drain the remaining words in a plain loop.
Switch to readl_relaxed() for the FIFO reads, since the preceding
wait_for_completion_timeout() already orders them against the
hardware's completion interrupt.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index a698130f4712492847336e401c0789b1a64dd02e..2e10e9775cffe57f291c48176ceda4ec14411db3 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -106,6 +106,9 @@
 	(((qsize) - CCI_I2C_BURST_OVERHEAD) / CCI_I2C_WRITE_WC *	\
 	 CCI_I2C_WRITE_MAX_LEN)
 
+/* The first and last bytes are reserved - not payload */
+#define CCI_I2C_READ_MAX_LEN(fsize) ((fsize) - 2)
+
 enum {
 	I2C_MODE_STANDARD,
 	I2C_MODE_FAST,
@@ -479,7 +482,6 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	u32 val, words_read, words_exp;
 	u8 queue = QUEUE_1;
 	int i, index = 0, ret;
-	bool first = true;
 
 	/*
 	 * Call validate queue to make sure queue is empty before starting.
@@ -507,21 +509,16 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 		return -EIO;
 	}
 
-	do {
-		val = readl(cci->base + CCI_I2C_Mm_READ_DATA(master));
-
-		for (i = 0; i < 4 && index < len; i++) {
-			if (first) {
-				/* The LS byte of this register represents the
-				 * first byte read from the slave during a read
-				 * access.
-				 */
-				first = false;
-				continue;
-			}
+	/* The first byte of the read is the slave ID echo, not payload */
+	val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
+	for (i = 1; i < 4 && index < len; i++)
+		buf[index++] = (val >> (i * 8)) & 0xff;
+
+	while (--words_read) {
+		val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
+		for (i = 0; i < 4 && index < len; i++)
 			buf[index++] = (val >> (i * 8)) & 0xff;
-		}
-	} while (--words_read);
+	}
 
 	return 0;
 }
@@ -734,7 +731,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 64, 16 },
 		.quirks = {
 			.max_write_len = 10,
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -743,7 +740,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 64, 16 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(64),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -752,7 +749,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 128, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(16),
 		},
 	},
 	{
@@ -761,7 +758,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 128, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
 		},
 	},
 	{
@@ -770,7 +767,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 1024, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(1024),
-			.max_read_len = 12,
+			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
 		},
 	},
 };

-- 
2.34.1

