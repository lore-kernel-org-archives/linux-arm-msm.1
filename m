Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977340;
	b=UGwpnY71gSadiQfil/bd27zAK65CEls7FGm9rXqS0vkAuRjaQJsmoEMWakFVBKXOYBV7
	 cmHol3U1oXR+vFCX2vj6+dOQYsnbTOYnibh9kIeEd/TTkK81SJdwUBI1/PM7sw9FEc1+2
	 0OWUlMDPJ++oprS67FiP0PfekpuDWW+MMMa2k7jQjV81/VyO4fN1VRgmSZHXanF3Jl/+k
	 KEiMUm26p/pyq7pK3F1tw84vUYOZvOmmluS4iBsSE29W5d0Xc51xH2DOmRyG4oxipeBu5
	 fECe1fJ3dIa/x/KIayyZCU0+/TJEf/45/FTowz4kDnyavnqTHUi80unaPJgQ2ollMWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=;
	b=E/OH9wPmpj84EQkLGKXzkYkG2Ko2/3FvOghIDplxoaljaiTw8IzYRUXxcuiV8ZVO48BC
	 dcO92wHAYRVo6syafDvEC3EvuRyhRm2aVOAAbltejYKas7fYyteoK69e/oKL7pysRs1yO
	 0pIPdJOUxOXiVDLsbXr4ZGbqR3U5cDyiiM0ulyt4vWXLXq1/nw7x6Mo9JS8IYEZYoA4KR
	 dWEGSfSXHoww+Prbn6p1KwwGbHpjtISxw5kpxSrHie/8UnP6bXa/8LHYrVKWWR56iMPDp
	 wKf73T6seHR8RnoPVKYiz1CDQZWPB2t8/ujW2o8548KSAfZyHnDr927CgqIb0gHj9Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ooiae5c8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvIYChHZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF593606D828
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 15:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF593606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ooiae5c8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvIYChHZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F0CNU2672154
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 15:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=; b=Ooiae5c8LeL790vg
	3HfGqpQUSGhnFjRhtcuabcQooUZ2p2X67qIfBqVZ6cJSiDsr89ZsiEPfS16DrFSC
	jmGDzOugKZM1tmiZzb0zZBQlBfyTzTC4DY38Wz41e8+IbgNtHmonNQnFmZWUUy2q
	Wx/qoKO8cVvXowyRBYaLrDGLqv1Fw7WJ8xCMDfm7r32yupZuEkTxJiG6QFDjYUXL
	B7c6U7v9i2dksJOHuTXFC4jWgnHtNwLsf644DC4Rsf2hdisD5Ps6jnfD+b0BsOSO
	raMctBdtu7Z6JnMqLTre3pUEZiQ+43kNLuZ/FKMa/TV+s3xov3PSIC/f9eoeZzrL
	6pHzig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcb8uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:02:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a3ee64bbso1488312a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 07:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977338; x=1794582138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=;
        b=fvIYChHZ/VHb44k1posJawhbEGdasBVHP6OuucAG55bMZyX5yLzA4Dd8JcOMo0iIA1
         mLzEd6PHs74xzqhX7aOdUvLf9jHgKSXJU3K86l8Bm37SBIHl35O1tWJ/dO3uWb2+A6FN
         zTov97mqiwmS+8k8D3FahTDF3S0E6/XWQfLBCeOl+t8dWWb3vlpSuukeBi93x/UaKGDh
         iaCc4+4RRNP5dedWVLEl+wUHdQ/xyrY4B1+0R8ZnB1KWBrW8m26W14WCfVBQhb82FVMF
         1CUpzDkISLKoJ5XzgkQEH+jcXHwnOaChgWP2vnbxnLZ4J/4bkW8e06hLfx3Z5LKCekgd
         3BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977338; x=1794582138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=;
        b=cZJHxcuU29mTia0FeMGlRpPjBbwu8wVxiIIuAvVixk97srTLm3HO7aJp7g5GcbV+yE
         DkfeToCFjWAKmutZjO4gfKaQjoaOuXFlY0HqtrWj9gA5VpP4jsehR+gFj+2HSNpqLTem
         lrz66HEOUb+kdLA5ssyYI1SESSEuiKjeIBUdNqhUayMoAU4PDwr3tE41Av44KE6hKzhA
         pznHfn3xR0mYsN/ePH2AIlMpas6Zi0N2n2CJbb93B51PjB9Fs5xGzZJfnC+kpImnmyKK
         E9C9skKWQFY2LHwcX/BE/DDBywgRv+CXPF8g9Ly7FC4tipMSYcLryqZFlRj6XB6rBe7v
         qVaA==
X-Gm-Message-State: APuU4Z/9dIO7S6cRSmD7xJQZVuEPOJ55jxezmxrZze2cmMLUa62fJpl4
	HIxWLqGTCBl/3Fz3jHtpUt9F53cA20QyduPU3pGWRlulz9+DZTwi/N0UNG5M5YFmP3bToqEjlrP
	aboALjFJ69ZfpeubB6wptTOZkHxcaGc77CVTvtjPMZBZkXpEOLdOI6Nm/UWsOEwMHH1iITOlHu8
	Hd
X-Gm-Gg: AYBFou1TeCQb1Cv8dxLLldZFU+ZpPE0luJmjM5d7bhJezitFmAPmj90aTUNTVTMi6fr
	l1O552wGEPcFFBhdEArRkJgUg6oht9fQMT/2xaOx2Ad2jNYwa/ENs3RdvnmyVxPITLH9U75HOLL
	kQg8hT9Mmhj6Xd8nQsxpKFVrzV4p9wuBe/KtusqpFNSWppq6Y3BjBvrB+/eaBOcXZS8xtP4iVIe
	8xV9lNInHycWoypJ6k3s7UUzJ+45e8DuShwsNR93oVd0/yIdQxsZfREUDAVoDBMyIJ8PARDRan1
	5XNwhOhJXRDAKm+m4X7v8Jh/QuEdHhMnZrn4i/rxS2JCdfLSp6w2TBqcPr1G8gu1u66NzTOqFXG
	QzGjonwkmje4LCNRAE86y/q8LZ2Z+l48lHYpqN2MPo1oKRENlavAGwS6fD59I6Ok6YUudWX0KXK
	OY5jqldcSI
X-Received: by 2002:a17:90b:2552:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b0db6a8e74mr2884517a91.10.1793977338267;
        Fri, 06 Nov 2026 07:02:18 -0800 (PST)
X-Received: by 2002:a17:90b:2552:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b0db6a8e74mr2884448a91.10.1793977337611;
        Fri, 06 Nov 2026 07:02:17 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:17 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:22 +0530
Subject: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
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
Message-Id: <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=1942;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=ojWeR4VoxNLp6SSgIqv2hrWvgVO2h3SZMPicVyzBSmg=;
 b=tXEQEoZ/2GxkCiFk/2JvJdGrCiIpMiZY7dqXyKOv0bjxZA4pHhyNLUF7zxzajclaa1/wm6dN1
 Oo68+1Np2XfCQpX9o6a5Sa31CNZVIfN+QTegPB27oFb8jKr8OUrnAw1
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-ORIG-GUID: 21E_H4tGiy9PiRm-qjzYdk_viO_61Dgz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX5RYL9AYFft0C
 boEZ7peEPuCygJxWnPuvCD2C6u8vh5o3mOilX3TLL74MyB50gEmgHEGcINkj/9k1ECyBKpgtDMt
 /y6uudx5jVJJQcfI2ZwjjlhaVLf45GYJfFP/nP/KNpYghj0d40TAX3ItNhJCdhKRfSLe8CVTynG
 ketgSg6Gmztj4pV6L26rmcRIraBdmtrvPvgWASTdOZvjcBkd/lOfFv0zr2MIPSMRH7OeqxeJt1J
 aYBMl5v9WELbDF57HbtFRlh9c+tpTJWvuK65TFg8BDC1mWGbqd8JHu3REFS+NWq+Yqobf+TeIVq
 Uq4nB1syKyDdsLgmHKbDtPg5a+K0D3QuRUa1LKjuCWd3Sa5yj6nWzBEHHFcIOmqXG7gUZO5LRMh
 TM4CYKtfSG9BwIPcHSjAefiOQvm4gckODSvUGklnk5ildXkWvRYfu6DoXKqTuNex8Cx96POYaGH
 EbRVa8M9IykwntEg4MQ==
X-Proofpoint-GUID: 21E_H4tGiy9PiRm-qjzYdk_viO_61Dgz
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aedebfa cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0Zn3HNfoxhtf-8mV_PwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX23VXsUqtOrRa
 HF8KG49eramKeyNyM4s1EVa6FjSjSsuu37My7EI4pAz11eQ+1MM7vqCeD11aICJMfqCjE0nDh6A
 zeereLmBfcT6evhmPO03u8F+8IcVMb4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
this value to request QSPI firmware and validate the protocol running
on a serial engine.

Extend the firmware loader's protocol-name table to accept QSPI.
Reject unused protocol IDs in the sparse table before looking up
firmware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
 include/linux/soc/qcom/geni-se.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 873bfbd6b2b7..396f3d81d292 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -122,7 +122,10 @@ struct geni_se_desc {
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
 						"qup-memory"};
 
-static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
+static const char * const protocol_name[] = {
+	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
+	[GENI_SE_QSPI] = "QSPI",
+};
 
 /**
  * struct se_fw_hdr - Serial Engine firmware configuration header
@@ -1557,7 +1560,7 @@ int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protoco
 	enum geni_se_xfer_mode mode = GENI_SE_FIFO;
 	int ret;
 
-	if (protocol >= ARRAY_SIZE(protocol_name)) {
+	if (protocol >= ARRAY_SIZE(protocol_name) || !protocol_name[protocol]) {
 		dev_err(se->dev, "Invalid geni-se protocol: %d", protocol);
 		return -EINVAL;
 	}
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 29a53bbc0dd4..e96266631ae1 100644
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

