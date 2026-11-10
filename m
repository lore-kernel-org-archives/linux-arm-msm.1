Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280969;
	b=IV6M3zZLIju1xH5kI0zktQG4oCc8W+2SZyrqBgZnUVeqTYr3P5CnX95gT7iVrLJqJecu
	 EMfxNr9tqGr5KZraU47Dp6ClG+VimoF/3zhdhxDpbzy9xI00HnyTyG5tGzifLllvR2Kc3
	 93GzZ1ErI1kqBqr68GTlC83vBm/H+epeo99F0nj/Ubgn1V7ShDhVD5NbWr6qP1JDAFFZ5
	 zRFHAukDBYbwpgr2krnUQ0rY5wiQcpdtwXx5ZfKUA5ZHhRHcyOqS8us0nHd+NQh1wVxXT
	 VN6VWaP2+a+Y/lFq4+AlGRiFC6kLbLoZcX+y7Nyk7hggQ9V+3C0JMENkE1NJBCK8V5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280969;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
	b=lEzxr8cwgPnK5KyMrD431RHlKgQMRvg5wSuxGAycMBHApSJw3SraVlj/H4K5WST2Uvtp
	 2eoAnA+yC0NjLo1CIlkFDk2WLnx9D7hKoWVJ3qU2AYg/WcJCCrEsr0hr/OMdB/ay8exto
	 RE6KYR8EHKquXFibH0OzDc0CEag6YlIsRa+tvEP/eBRCnMzxqZKRkVAzvggZOqSLds7qB
	 2oMmPNQhaACnM4l3ILdBXghNFPzrx9msOFOJkBRRs1En7Sti2MRRIQTdBZqwNKR7sr51k
	 9Jn8X0ORMiFH33VGb79kYnzHGD/HZuWdGZjJSFhhrpnOj6a1cu3ERF4jLfAH9pu29Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y9NeKlJA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUA2Ozqj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5440060A381E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5440060A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y9NeKlJA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dUA2Ozqj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jKQL1514238
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=; b=Y9NeKlJArDDZik6u
	i9r+Gc4AC2GlTg+Dgud0mbuq6zicQ2UbTDtbGicesU80GkiWuOk7f8CwJo+CrPD1
	kftSTGmQaC6cTgf/pXCY84uVI1xGqg5Xc5Tdk1JELl1PaINFaPzrvMkJdVNd8tTI
	Ly2xub9qnwbaeyAT1sey7CvkJpP+0S0OEXxvFIC65F2LGEvNTn4RYgCkSxBhrT+4
	N/gZ9DRad6UblyX2S1wxN5mn5FfmDH/DEfvR4O76H9qJrDCRkGkhiLhtgiQf8DHz
	XWTgylQsN+cZqf9oVmvLjNquAH/PxcwXS8yliiL2aJPQIkWKJnFUWrmYxh5vWCgX
	GZ2AuA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydkbcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 03:22:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb8c46e240so822462a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 19:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280966; x=1794885766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=dUA2OzqjfuPKww139zibdMIN267Zqs6B4SW9713FlkUHfbbHLN/Ug2zQnaxc54n+/t
         Eg7vahXJYSeuin5xtfaXerEewdZwzXTKzP4WkuFk4GzYgSoElkoV4Ua3TaRrbjwPs0it
         OJq3eSmCfqcEY2ML71st/ro9V+PNhUSUzLtvfls6wIjRFI58uXQHrFv3PsZk1gAoLX8j
         a+HGvy8RIJPY+KjdvetbIkR+Wp69SjM+5itJMWBCfJTrC8YSGNNwyFmwriNwYmHFWViP
         VQEwa1CGvgT1T6FRT0RJTLt3UiOJRF86KdXs48bKNH/NrnJLiewyUKTx0D71Khau2yBQ
         H6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280966; x=1794885766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuqNEpDUlfFbdnNWjZAurd0lzCiaAXeLtHn+BckMIRg=;
        b=ql8oXQRJ5X7HIiopi3HgarNM5zfy6P2L2VKIY3K2WlJTf40J3LKM/HcBuDL0HuVb0Q
         /XMk5xb3rSaPTCiqeaGN8ullqGA/qCsVhgJUhv5YEOBDEWS1lo1XQL1mtCSbyPXQYyHO
         pVLcFg/8Qbiei6DTHDCnJPIc5wqVhjjwHsbhubNqzJn861OpB+WwJKruMkYM97Xu7v66
         +3GkLdEoLT7T0RL30R9xxUwRdSLSjlJAFrlOYePt+1QsTWdEMejArckpBhkwaajS8GkN
         mW6OSO74fGU/qtPtdQYcWxJ8y1PZFrW72ptt8KDGME1/reqaMLbb0yzwb2YjtQ5S+A83
         HLMg==
X-Forwarded-Encrypted: i=1; AL+hErEjC0D2ZMYGyZs2g/v78EOesLuDWRtUYAmNB0WcQQ/67z6FY2SVg4kjMBWBltZIIsx1DgiK+Kq4ehY4zOaz@vger.kernel.org
X-Gm-Message-State: APuU4Z921zx4/Syd2G5rcbV28Nec2aRiNoTnge/A7Vll7E+STpJyHT/k
	8LcU4A7LcpbH6jm6IlkLmQE8T7EAlwVto9iBPR8Np5xXWLot5ic+FU2wCyuQ10XDFi3a7FMINuz
	/yx2Iup7yI8cw74sjd5qxhqlquv2oM8R+qS34yWO1xaQGmbYOb+Gqm0H4tZrKbkQbKsEv
X-Gm-Gg: AYBFou1sO032VhtYc5vgyNEr9dqYvorsIzJzjNSMjDcjpfKzlZACORguiRprYWfyLNR
	dti09OvR0Q/tv/oURMPd4MzE3juKQumHrGfZgfiJWnm7hF3gA3LsD1oeiBm2hmJwvVXjv3a/+nx
	Qb/iKLROde5R86UVeaLzEIlQyXgGsBuW0QWZb8OAIPr33W5u1EigkFQG0SQ6b8E8DXAkqfpNEFW
	epCqdqBtzQ7BL1elRQWcMUqxwjHaba9Zjpy4DtQqUXqB9DU3D3LER9f5dz+HfMIiMRK0iRie6v0
	jzKxHgVlapPdgvgQhqkHK/ey22OvURCKvp+oVFPv7PoGkTOZB0O93YBHCxHInjZP+5f5bHqo1sw
	ZjkBDQQbk8q1P0Vf9n+bcQjRDzTHKfIP5BLV0/eKl2X8dEfRB2caVNiUhLimlyfTMCMY43nTXDJ
	ejXUHCj/lSclv5aKCwCYTQDF6vQxo0uhK5xKJL
X-Received: by 2002:a17:90b:48d0:b0:3ac:7c52:faeb with SMTP id 98e67ed59e1d1-3b166cd0dfemr1871320a91.41.1794280966244;
        Mon, 09 Nov 2026 19:22:46 -0800 (PST)
X-Received: by 2002:a17:90b:48d0:b0:3ac:7c52:faeb with SMTP id 98e67ed59e1d1-3b166cd0dfemr1871273a91.41.1794280965687;
        Mon, 09 Nov 2026 19:22:45 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:44 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:27 +0800
Subject: [PATCH v22 5/8] coresight: etr: add a new function to retrieve the
 CTCU device
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-5-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Y/FvSaBbedQq8aKjgsZpsJQaVI9vU9ZVyO2kbtYJAR8=;
 b=V6M7HUx9Kms3500hr5WZuGK8cd06NyCwD55SfWh+pDqabilgAIs6G7iRqWoYD5IMsLKodsx0c
 g6c8d2cIg19D5JiY8rMe9D+/kgU65OIqoDGzzMAuOw5l76/ZxcXBWLu
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX4tfiEzB+yhZz
 z+st4CZbf7wqR/o/mX3Oe/g52JuS0p+3KL6IUAxyPDa+9ZFBJ8gLOPh29ULfKABWwA22jdmLSxv
 AMHFJg/iT1l5k2pVfz4OMN/bUYiUzwE=
X-Proofpoint-GUID: CG-Qddm7mfGvJYrpmsD_WMq-vkebxcsT
X-Proofpoint-ORIG-GUID: CG-Qddm7mfGvJYrpmsD_WMq-vkebxcsT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfXxOEsLEvFzMqC
 OfFtdxwB/FBIj+e6I8NBzVbn5z2HEeSHUIpbYEkHBy1YHLuQ0K30rM5m3bJMgZOsl5tqNyv9Mon
 S7XdnhOiXNTVviMZepk2iJWCsYi3f9K0WiQybRRVSBBUFb4EWf9+bjQLi0Lkh+GTa2sRZK+soKk
 sEAqYvuN2ZUNKAA/GedsKpno4VCXug6m0RbBlCr7JxrpCYHpRYEFHqnatr0L9iwxcVv70m+1SuY
 MavwnyD89/3fLLhzEVOxAbZzQD0V3MWtIIFSpuHdmiKkEm+wjEUDW05guWCzIcyzJVv0cwSIVgP
 iV2HJ+NpgXe0UmJOgMZ6WhPrgPW+853RY5PSDmDIlAJ6PfUTobQ5UwO5BPj2wrZgsSM8dTvNVgI
 fHV4GZGfSYIvkUgfxbCp4HSm38/mA5pvpbd8I9lL60rOpU6Vga8FWdghtpGw5hvDwwsg3RxLPGL
 dOjaKgl7E9DWRli3NOA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af28e07 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100013

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 5032f5598e15..cc341cdf8d8e 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 36c80918958f..2345bdbb0b9d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -474,6 +474,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

