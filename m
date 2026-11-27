Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795923;
	b=pKbuAREQtPR6HVRNMYieUjdBFJHP3IAUMCaLl79LfIhJA8a7HxpvJVjws7cSDh7pok2D
	 hH2LVSRCSf/QMN3OI2JzSr/0Ypzsla218YMhz2wgxWSL4uA2SsVOKpm5+uQ51D76AE4oe
	 Ke1OGuQYi1r4OOgrM67lUmS0jsvrRnedb9skMb+5pHEFQiTwQ6nYk+2cMU8AxNn6Nf5wW
	 s6trsxNqMGUlxg7rhTuqDkyY9qB8vV0zUacd/BseuMW4joiqZ5x9mKKbqZ2mssNbu0UQV
	 9YLAdA5bhMjHqCvs4vZK88ZPzgqQQihX4LSd6FAARoER6PLubQrFsK7byHqLLOQ3myQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
	b=WCHwiZ6LrrxnKfPp2pWstpmRu5vMtIiOnqWxv4S/X/YbRCLyTT02kL+n40PPMygiTu/e
	 O7QfCo54y2iXtrCDpNc+vQve8Fv7BLE18poKBfVSgAjqakMIVLzLfKVUr3lpCT3fccYIH
	 yyLa2e1i6SXIDrI18Dqox+C5/lne2Ndt94l2vfrkiKZn8+tZtHwhlah3EoIYqKqWMtVHu
	 poCJsW4IB/Meb4MVmH1JqvcmrLWReO2qCmevODBq76NUcOtr5LcJV3qx5gP53PtpVxMOa
	 mlRkeh3wGKpazdr8AI0wS4dwYGD6Ih/i2s5U58514DqhzZfep+KbjQ3Tq+5O3y5E4tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WRqTCmHS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T91Ye10D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264A3606A327
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 264A3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WRqTCmHS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T91Ye10D
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpA9u3328916
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=; b=WRqTCmHSrF7KWxzn
	uuZj+pMUbCOmTNgNodFBFkhgGG1O/VO69m/JiB5rLd2/kgIEoCZEvBN4qdV9+QwB
	4Z8wen5Yg6H6pIXwjM3Lf0XeZ/5v/LRva1TeQtJGrWr05U9dwQIPd1DsjKwxX1ro
	yiRBIfjWaql37Z9D9Gtc4ca6AeGUw+Mf0IRUoUAiTilVDcobZWOz/Brtod/ctnZV
	7Q6i1OzYns90JpDZhyGpBN8KUHM28qOQ43zLvluZb26B0A5NG6kErO6njimoB/7Z
	xafe0P8v2H3NiFl8YGtB4T2Whwz8/+Zkh3vLHCK/lJHlZbh15k69lcLILYgvYeeX
	4HUo1A==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gha4rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:12:01 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6768601940bso13469394d50.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795921; x=1796400721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
        b=T91Ye10DymC/iokbFR6cPQPl7bnMwNyL2n95Ws3Kw4KnYaJBoittNkPeWn7GnJWAFQ
         GWgJJi2ZKxSCt8m64HFeJm/StrPLdgsSwQXueQy8sAXsCixPmSwq5Ean4/PWtP+rIqd8
         CkNIkmSpFUVmly0Vt+JrMG6BXdAbKUuKCapMiUefw0Ayb1Zb0OoVJtU49HKMLd5p+XX2
         v9bPnNeN68pyNNnfZFotl6f4/ROmXLl1zEelYQF5q00vWCE+xMAb9cBTq2Ka2pc88N7O
         YUZMwHVXxHCI/2JpYoNK+oHUd65/mxZnXQav/5rxMIXqymhW6Xib7yrj+ezm/hJXmIa8
         BrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795921; x=1796400721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
        b=mjJv2J3w6Z2AsgFO9kaLc0GOdjQZ84tTvljkcJu0Diq3Eh1F7P3nShP3hU7ostSj7Q
         m+oRdjOrrDBZVQZb4vFtxGhW0Q6w7B+0r4wVwBAigKtImWAa8HQqoq9RMSXN8ZFFydtY
         LQcQK2nSOHraxM+MEimuJp8iAd/CwYIhSzfLhL/9X8z9zViZr1WZnL+D7eJANo6ibXON
         NmN06nmpdWkA/K4QwttfnBlOPcZ7oxMz9TziWRps957mRG8PU7f7CUkH3eTp5QdstFPX
         7n/aKZmceQjouTZy74fJ340e9uZP6J/a6SQKkvKkXPc77NQNZBH3lfHKUXJeSHu+eLPh
         OBag==
X-Forwarded-Encrypted: i=1; AL+hErFWqWUGWx3m77W/qdY3HGDKbRIbnoZozS6wimr5g5nUYYzwB37Slaqe8rmrPEzvIgm7vo1/67nKiqiSTuTu@vger.kernel.org
X-Gm-Message-State: APuU4Z8XjI6oPV0PW9ceONlGuso4MRRpEQNHfEG5O9mmvfpuLRginaig
	JYqqraWk3uVjmbX5X/flMA26uKTot/At+RicsfxYXiLgzckcJfRoOotvfoIsA6rIOw0KmjKHJKV
	e3r2qszlhcqrMafbPi2YxT2M0/vDHz47M7Jl0WC6zRrsf4MDpRyvl7GFJpeG90PS88Hzu
X-Gm-Gg: AZFdTZemTgMeb6O+Xl07w9ocjQXSn1V4UFg9dJOwc4wt6NTjXzj7BwUxyzeeIE3Wet0
	NiOOXS90OqApmt3GuIVVe9g7d7AZRgvIZy3Jbw1obIFqS0YFJMg5PWvy67KIZV15nkcv5F4mHvM
	dhl/YjUVOlwa1QUwcigYUiPl5bBzTmf+ru4ODHfoSp5NlCvjUh3IEHjGCnbSwhWjt+TRqWhils/
	14oT6s2ze+bOt07JikSHRrn8l0Pvt8ETA8yDr93ryMcLyfUPUPJu+mCgV91ZPedokp8dRrz3tIa
	xS7m0OOVgVUsYi0iN9fU3+5X1dIlNdklrILeQx7Fh6M4CclZJG+IRWwS7yTUYdi6S2tfFwdslEa
	n21yxNCRfhDdPD6GSSmIeQWzKCeYNz6gY4bVkBPHe3MOn1oqyth2xTYHajg+x6qQBeRJmYqob94
	ZD5qdbHq+JIMrt3FJvrjweJyszPAcJ7iihjKNa2cvsN2QE/n0KC45WFOhJTTasy2A3XAgfJoylR
	bMLSsoh4Vq1vUAxX1M8EPhX61aJ
X-Received: by 2002:a05:690e:807:10b0:677:d375:13f3 with SMTP id 956f58d0204a3-67df449a45emr6413021d50.35.1795795921206;
        Fri, 27 Nov 2026 08:12:01 -0800 (PST)
X-Received: by 2002:a05:690e:807:10b0:677:d375:13f3 with SMTP id 956f58d0204a3-67df449a45emr6412992d50.35.1795795920575;
        Fri, 27 Nov 2026 08:12:00 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:11:59 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:53 +0100
Subject: [PATCH v3 3/8] media: camss: Define timestamp registers for
 csid-gen2
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
Message-Id: <20261127-camss-hw-ts-v3-3-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfXxSMiH2GYeeN8
 urXNhisSrWQvdODhL7z32ZEQPImTXVVjBUH1m3wiy2CXC/E3CVOWe992MfVXzf3SrfvzbzMBUOv
 hOLSeiicKugTYvOMWVc6UWUefCwEpXo=
X-Proofpoint-GUID: 6Rb4ddKzkI-A1JgbYEHH2bOJkRmzs_yM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX8ZoEPxBU5QS1
 HvLzuRn0FxxzO8gZSG736OWAAWxJ2+08CTAsEzoXvWlF4/TiaQkSjW49ebMkijqk7cLp5FxVvU7
 jxkh/wluVgl5JOHkbZwIiokoxXstNUleajEmPp+quw9IVDP4gqnkuQa44YyIo7NQb4VCjYJruFX
 e26ACBqcQUrgvGyb50EAAqgqeMD/Qpip+/yHJbp4TguM3S1KA/1AKLVOtpmStBVS6zDZmJwzN91
 okKGJw0DAQS5NF/GtCzwP5WLczypnfRz3R/TigFM8oZsvBQqk+PDXo7hH9bTfWq4NS2icUpYXia
 gDSy2xRIVWomTtn/bYmba1EKtFMn+7L2VOaWwXb5tW5TL39wMXquDkgyqV7FwY+tRSZtTd+lwPB
 BxznJc7//K2ka62TBBoLHjGRdl0u0vjfvv1hJeothqFZRgsa2QnIg6udrVq/O7fdfcjY6NIgQhh
 cfWd502ihj5e351raXQ==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09abd2 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=3Wk6MWIrbtHnLGL1blMA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6Rb4ddKzkI-A1JgbYEHH2bOJkRmzs_yM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270064

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Timestamp registers inside of the CSID block are available at different
offsets from the CSID base depending on whether the CSID is lite or not.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index a351ac4b91728b981fe80e030fcb5ebfdab138b2..85e9eaf78df75f95d5f44f83b45dc7a3633401d0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -121,6 +121,22 @@
 							+ 0x100 * (rdi))
 #define CSID_RDI_RPP_LINE_DROP_PERIOD(rdi)		((csid_is_lite(csid) ? 0x230 : 0x330)\
 							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR0_SOF(rdi)		((csid_is_lite(csid) ? 0x290 : 0x390)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR1_SOF(rdi)		((csid_is_lite(csid) ? 0x294 : 0x394)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV0_SOF(rdi)		((csid_is_lite(csid) ? 0x298 : 0x398)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV1_SOF(rdi)		((csid_is_lite(csid) ? 0x29C : 0x39C)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR0_EOF(rdi)		((csid_is_lite(csid) ? 0x2A0 : 0x3A0)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR1_EOF(rdi)		((csid_is_lite(csid) ? 0x2A4 : 0x3A4)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV0_EOF(rdi)		((csid_is_lite(csid) ? 0x2A8 : 0x3A8)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV1_EOF(rdi)		((csid_is_lite(csid) ? 0x2AC : 0x3AC)\
+							+ 0x100 * (rdi))
 
 #define CSID_TPG_CTRL		0x600
 #define		TPG_CTRL_TEST_EN		0

-- 
2.34.1

