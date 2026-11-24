Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522591;
	b=LjfXDLacdaCgEnkqb/Zy5o+fCM9TSWUZscsfPZ3AKj8SgjojInw+U5dSHaDEyqyEEbhq
	 YlYpJf38KnreWG7VkNNfFZ3tRCMwGniNzbrfFhIH/IAz5I06UJNxsaEVOrgkGzOQaQd/u
	 oZIY5izIyZ7npXv9jo4eQGnSNU2+3xLlawRVGsZiDjpK6O88LT4YDXFR2cPRRpd8hbk2r
	 wj+Z4+/i0Ly2iNE6XWf0Elsyr2HLOWK8HX1AIZi0g+cG3kQGmd7tewNdQTu3tlmIvMf1T
	 85XmoubVVYvPjpIJJBGyPkII3h4gnMLqWVNhKLT6/EIz3wqgZa6YUS8SJRBhjZKewIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522591;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bOFKsbxpH4KzFXDCaYL69M3Fbp9dtS/WswHdh7QQcJ4=;
	b=TPsw0XG3FT94MABf8IvQ8/LFtLpYU4zun7Z2T9NmC3BcE9cCnYY4Ttc63r3GWr3xRV8f
	 hnarV26lRBDSpxt9sCCgkDbXb9R4A2cNNUbhk4Y3wS1tod8lGvNh7PIExY/buxwPhGxaR
	 Ksy+SpwoqwC9PQsg1u24CzMKthur5l113s1ViYfR+oB47noR7j99LDwvINrdrL0kKTsv3
	 UTpT4374GNwxzYlLo2eseM3rHUmIYpoJemXf2RQZrTf4TRBLVeDRj/C2l2w9YLYW4y4ry
	 P3M+h+0XDZxQxLiRyyip3jjK4mZOScvw/ZBm2gDfN5hq9qzvNXCLcRUX5ozWfOGcQGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b2UARMif;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMiupnBT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3198606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3198606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b2UARMif;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMiupnBT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuquA1113710
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bOFKsbxpH4KzFXDCaYL69M3Fbp9dtS/WswHdh7QQcJ4=; b=b2UARMifHJia2SbY
	SR2Fffq/WX1293Eg0LtfWiMZ/hVw5YZ7RIDDB9FKxHHy4miA7up+IjrD7nVzZUuY
	osoCdQjGp3BtGCG1IIjup/Df0hX8faAZh5ARECl8M5qlfjZnk6EU8bOLIg7r38lD
	eOXTP/xi7uqgHX+vCCEcT/T4iw8vjvyYB4bykO+gRgPIk2ASLL/Zg1f1Ge7fGUBX
	n+nOs9Fj87UDrwbry8/lnjGZddYXbTsqO18B/n5uVSDIXZYDadyEgeDWXbd787mB
	Wa6OXYCm4r+UoRWzOewcSLy09ZcFvkUsP1ZuOYb4fFRjUjqy05/XJ/l6MvNgGnJD
	JBMXTQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nur8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:16:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so4753502b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 04:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522588; x=1796127388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOFKsbxpH4KzFXDCaYL69M3Fbp9dtS/WswHdh7QQcJ4=;
        b=ZMiupnBT/NjZ+hbIwXq7cL0wW6Mr4IErv76YEunZHTAX+SF4J4uZpGOcecDvKLuzo+
         e9NXOfCaK1FZHfQs124DVo9aVO4esZgSZ1NnKK4WfmimT0mOzcKr5R9O+PF/uSnzkU7I
         ZhVp5ctoXCqx41KKw9JMmBRPodzuC9T8YglldJlY8WD9mJVECSOAj9o3/RH23+9g0RA+
         4KCotLc/x7D1INLsTHyi3oCt7qqZnJExCA+Bwz21GVOv70vLqSyUszYLQNBi5yiEJPeH
         bGOQ4SRTSf7lQF8n2Wrh/O4YBdAZADPbL9VdalxZJlavJP363J5ZS4YxCZi4Ai4151TY
         R8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522588; x=1796127388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOFKsbxpH4KzFXDCaYL69M3Fbp9dtS/WswHdh7QQcJ4=;
        b=Qwk71iB7TgBXVwLOjDbXfkILUhFsjZzjZuebQACkNEUpWh6U5/ShFHUCuJ29tx1yD1
         zxcSLIongJyfIIfUiXPPq29a5HHFUUZ8riysqz/24TxMCSE2HzW0Gh185EYNAvD668Dl
         dJAbw1gbkvqcAKzEbd+JIrAavLlAOXUqpeSDuaF9OTArr+3S9kLxjRSwRQbHG0UWXICf
         eKfsljjM7tx9czxt35pvCj7r2z9U8Q7+W2Esh5m3+S9J85le1rUgkEFGgXcoTkKKuUoW
         B8THJb/k/lrE1XbzJ403z24g20hNMSMTn/OxAnSHjlGiOzTrDDjDaqXB98CJv1pI75E5
         0v4w==
X-Gm-Message-State: APuU4Z/FkhRdLWiLN8+ttqp3o3QZdtnUL7Kj24Bs2JvhcxJs4IhFapBg
	tSjy2uTvyQZ7Ir6Aub0bXW/EzmQwphk1A/kwXTipe9gjH+dt1xD1+7sANj2i0cLox0Id7twz4Or
	xdwwuJ2dTkcYtri/v9v2HU24CCYidkmWFDrKNsE7bh7kn5aJC1lMiR8GisSR4qkQCgeZQ++wKP0
	ak
X-Gm-Gg: AZFdTZfhVifV0YNPnIz4+iZVHW8WRMyla1dFJCARVGscXVLnW9T6ePxzQiJil+GGvsc
	OIFUmhKdEUo2XWO1QPuaUP94vA4KenT31ESljFHCrjurFyKSE75zJnq36j+USlF7YuyaIptQagF
	9osiTsj8t6E1m1LUCKLkhlz9jKvJRkzPpPniI2jmX4rifroPF3YjmatiwzJsZQROTU8QBq+DQd1
	nSgkge/B7DBYjhOEbsNUERPGNrQAxYlP6GcUfhYWM+OgOKEjKhWaVWa5KyOGexa3/tqNfbeelwL
	7lrSSkvx014wX4v1A96nskpJ2ykhR8HLvHNKg8SlY19zfsjR5YQ96N2OF4PHdsVdYj2C3wPwpLg
	ecrTJkoqb62/+CTZJZcBSB0Jmk0IcLSN5xWvn37Av9VXpcbPJRv0unh1ihfqygJvHiQFYodPGWW
	2agr1+Qrtc
X-Received: by 2002:a05:6a00:b80c:b0:8a0:644a:d1e6 with SMTP id d2e1a72fcca58-8c87bfa20b8mr13052698b3a.28.1795522588276;
        Tue, 24 Nov 2026 04:16:28 -0800 (PST)
X-Received: by 2002:a05:6a00:b80c:b0:8a0:644a:d1e6 with SMTP id d2e1a72fcca58-8c87bfa20b8mr13052667b3a.28.1795522587825;
        Tue, 24 Nov 2026 04:16:27 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm7245572b3a.1.2026.11.24.04.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:16:27 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:45:25 +0530
Subject: [PATCH v2 4/6] soc: qcom: geni-se: Define the QSPI firmware
 protocol
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
Message-Id: <20261124-qspi_qup_upstream-v2-4-cd69894107c8@oss.qualcomm.com>
References: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
In-Reply-To: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795522563; l=2240;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=55ZlMjRkdONF+TCCiT2mIr0TCDYDNs9cTd+Da/93QPU=;
 b=v08YvBaHpvji9aixFBPMZtsrOMFNQDH8Osu6qZohJxJgoC6EYZ94wDW0zH9toEdvjXxxfeyP2
 K7UALWXHdfVDAVOFiu17M69dE3J8HpEAiDw3wMsqbZj2q1tY3NpJWjx
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX2hE3vi5OGrTT
 yonZYRy+nrFHay7SH2MzAJ0+AJoJyI+0N01z1mPLteDORqjz5jKJUqrh7woXjtAS70xtA1JNEi/
 NgthXTjENPo1egH07CO6qWDbRe3F92JAMidvbceD2N50laP/rhl+Ysx9tphl98sNR+jHFyyNe4Z
 VP96nBVJm8EcCWld3rJiB7ZAjwvgPiDItllKeBz5uzTLjqkY206FEQchgQNZgaUMrmC889UcK0n
 b/l0DFjSx32KA3/DA/ji8M48GK0XUg76TGIZ4jVtR8f/PcC6lXAwGOIn08bmBMzKM1Tu664kIqb
 1NBbqDEbzLybfOVsTk/RmYjfxMe7u2bjNPPeNvR31fefs7Mrp2lV/kFsv0Q0StbPQ0TSRHpHkPq
 zu25HKMoZ8NJjWanPixiBORKVW/xxOsNBIP455NSl6kSV6ufw7NbDi1FtdCu9Iu7MJ2+iUaPNcd
 qIV/5yytDrDtpxisFfw==
X-Proofpoint-GUID: 8Or8ZdPyuYLZy0T730Dymxp0VWUIMIV-
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b05801d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sUBs2YLvzM1exbN-AwcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 8Or8ZdPyuYLZy0T730Dymxp0VWUIMIV-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfXz912b+H8HsM+
 egS+tqmZtCqgXRRS2baFSFVssUwpJp3v/Hu83YdCKQBc5OdlLrNd/weNGJpk9xgPToF1k4RrgKd
 hZ5yFryVVN6b6rVal4GpApm8SuJKrVA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

The QUP Hardware Programming Guide assigns protocol ID 9 to QSPI.
Add GENI_SE_QSPI with this value so the GENI SPI driver can request
QSPI firmware and validate the protocol read from GENI_FW_REVISION_RO.
The firmware loader also matches this value against the firmware
header's serial_protocol field.

Extend the protocol-name table with a QSPI entry at index 9. Use
designated initializers for all entries and reject unassigned protocol
IDs before looking up firmware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 12 ++++++++++--
 include/linux/soc/qcom/geni-se.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index ee519108c107..270e7c44425b 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -126,7 +126,15 @@ struct geni_se_desc {
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
 						"qup-memory"};
 
-static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
+static const char * const protocol_name[] = {
+	[GENI_SE_NONE] = "None",
+	[GENI_SE_SPI] = "SPI",
+	[GENI_SE_UART] = "UART",
+	[GENI_SE_I2C] = "I2C",
+	[GENI_SE_I3C] = "I3C",
+	[GENI_SE_SPI_SLAVE] = "SPI SLAVE",
+	[GENI_SE_QSPI] = "QSPI",
+};
 
 /**
  * struct se_fw_hdr - Serial Engine firmware configuration header
@@ -1581,7 +1589,7 @@ int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protoco
 	enum geni_se_xfer_mode mode = GENI_SE_FIFO;
 	int ret;
 
-	if (protocol >= ARRAY_SIZE(protocol_name)) {
+	if (protocol >= ARRAY_SIZE(protocol_name) || !protocol_name[protocol]) {
 		dev_err(se->dev, "Invalid geni-se protocol: %d", protocol);
 		return -EINVAL;
 	}
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index f77c3a47c3d0..e2b93afba4c9 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -37,6 +37,7 @@ enum geni_se_protocol_type {
 	GENI_SE_I2C,
 	GENI_SE_I3C,
 	GENI_SE_SPI_SLAVE,
+	GENI_SE_QSPI = 9,
 	GENI_SE_INVALID_PROTO = 255,
 };
 

-- 
2.34.1

