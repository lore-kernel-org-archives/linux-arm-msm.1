Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819E3B2FEB
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260736; cv=none; b=LWEQT0Cmwd0e58xGm1qTqjCYozz6naNmO6OESLXcCi9c6Q8OZE3tiN744RLqVsmRVn+YCmHCkKULsSN2WQQUQ0TBzpopjP88c72jMXjxe3EYYKzeYuIzoDbGJq7gys6xFCVEeFkrI0DbGvTI3N1fXvXe/r1Dpj3RySy0zhRbi1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260736; c=relaxed/simple;
	bh=gStEzvgs7NjI1ffvpOOKeWsN7W5iJqPLd8nE6UkcCAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhILpyrb+GsJQsX/9hjryVY5VcqD6wo+qvw8NIl2BYMz7GLnHnyJWlqTiWtFKt7st1iXss1BALRvY20MvzK5enfu/0H6HHoVm2kQTsEBD7U3HENiy6iTv0uTkvL8AVVPvSgdT8x5UkRSeUEPkLwd//HUFLnKe6HY8BNdZyXka94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yjr+DPBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnQpqIis; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yjr+DPBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnQpqIis"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcgXK2996606
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gjUqTR9xujL56+1zqXoD7uw6MiEVy7r/K7rNUJtK7I=; b=Yjr+DPBltEEFJbC1
	wHF7mS2LSw23CjS4bgXLm3+AdaaSq75u+CbOh2lqjFrjqyXNJRKIKY70N6e1P2ud
	RaKc+ZGvQsgO8DmuX2E5LXf8YBzqNf+8mvo9uFfm4qCSTgG5CnX6O5xWRBq5yQUW
	H+dxawAsVuQDv7TCSfluQhk3dOEyF0RwOsZrQTpurzlyqH1LR3wqL7Ha0MjcEJ4B
	+U86Eu37RXHj++c9wyI2IjGn7kWdKC8Z+CFItCGuo84RkAGVZ8kwq8mZwO11U13e
	o2C0YF0RKWPegEG2PZaKHJjg6BcWnvUFAUepiHYd5lBhulv+t4vI7tnhTRXjrBzM
	8pFA0Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjjx72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so18629a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260734; x=1785865534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gjUqTR9xujL56+1zqXoD7uw6MiEVy7r/K7rNUJtK7I=;
        b=FnQpqIisZZxdfHlN9AmlYzIQRgQBWuBQms+2++7r7cW0QCJrRZFyS7Y0xeiRBuPl1+
         nWfMn1ih7JbUnI+tUpdlS5uP796qbNKKwL8GYOwqi17AC2GT9tZDgMpy7EpAjbMaG5Rr
         oMTTnvpzPtW+dLZ0oY/t1GG131qe6ngNGZrME8HiGpfFr3t0wzIUxYKljQhJ6EDBBNmA
         riA2u542YaMqOqPD/GbX+f1BjT0qeKMuQETStH5GpDbQFTw34j8H6h6uHBwilMyBKWmM
         lTKMVBDLn2JVSsuB6rR9Bhzi8yuNeXF6yhodAzMNdfzJjghi+3kepKSuMNV8/A4vcauC
         kLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260734; x=1785865534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gjUqTR9xujL56+1zqXoD7uw6MiEVy7r/K7rNUJtK7I=;
        b=CTDmjOOFOBvpBjxnHw67JDDDx0TGVoO3d4KR1/LHozZGHycpjl4crKfWIUhH7zq+vh
         gHGApmoDcguEkAUg5i5k2tEFlQlWobu269WjpcvuXM3rWDZEcpIOXl6JDhB1jp6hgVcc
         cESXAtu5eZXWWKR3OAVC9V3QNr6v8yvRe/FhikTZE2gmMB87lk2zgkzuSt1xAcTxRdf2
         ajhzUkBMl252cO78axpKus2gcbn6JNawD25TTPnRwyejmSduk/vlb420lAM/5dTClsDV
         4MpM6JxsZocgZi8MtsyBa0iF38ZSfbCD2KSpIE6lm1BWBHcY4cXUoNNYivDWNaWOqMfZ
         2v5g==
X-Gm-Message-State: AOJu0Yyn1SRtyUpQeBBiIGPgGYngyq24Y95nKSMsmm+SX+sDaRKaTCCQ
	M33GYGcJEvIRkYnNT+z3XqshQv1dj3kVHQQRDvzWCQUGMd8AMKErRXW2rCHgjyiOSkw0PYn+NDD
	Bd0kwlIC/5SkOCrFSlWisC07FXP7klO1Nci/O9hjLL/gfhe1jjkc7uRdxd2QQc5MY05Sv
X-Gm-Gg: AR+sD10OaOUp31B6/2s2VCNmdlU+AUdawDiGrKYATzv2BQyfmbbi2OTbhQ68KP6uUTc
	3I7kMu9pxJWndsAEt1KO+i1gO89d5QJMLdGlClvyw8VuP/w6fKF4KgTEePzLLPBmE5PZ8rjzByZ
	GKvLPg7gvd8DBlI4/HmeaTy8Ti3LlJ9rlauMKN3JHcGad6N/9UttQfoDygtLlpDeb9rBdWf12fi
	ZFeUzCYvMhNtIGSRYjEfWSKycsFZ3l1nR5U4mW/SOIBZIb2MxlrRJFQAPf2Zu6x/3Eem6ZxtHJW
	tREHebpcg1+yJMrUd5GJhlQNM9DtH3wxFYyi/4LeSMbptmUHkE637JpG4CZu5b2JR606UTLwjsJ
	w1VKGRMNl5inKVke3GKdN/xx+q+yQcAlXtIOeVMXLdKivG3K85encIUCjp1EidhQoNBQdNRPupV
	qe82z3N8ohv/A3
X-Received: by 2002:a17:90b:268d:b0:38e:85fb:71b9 with SMTP id 98e67ed59e1d1-38f6a311026mr4103310a91.4.1785260734185;
        Tue, 28 Jul 2026 10:45:34 -0700 (PDT)
X-Received: by 2002:a17:90b:268d:b0:38e:85fb:71b9 with SMTP id 98e67ed59e1d1-38f6a311026mr4103283a91.4.1785260733774;
        Tue, 28 Jul 2026 10:45:33 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:33 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:33 +0530
Subject: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required I2C
 adapter functionality
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=998;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=gStEzvgs7NjI1ffvpOOKeWsN7W5iJqPLd8nE6UkcCAU=;
 b=4hRPZy16gtfLknzVZFnG3R0ewTlG4RYVkBHY4haPX+cv9BGYOjLpsuon29h/psfLt2/Cxy1GE
 sOLgGg9vkzHAvmQIQZ7PuNDLql4V0BlVlYREqPm3Fsf7ZpFGTnBSXMv
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: jD6ZHokfruVs0FtRtofm7qS6aFut7DRp
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a68eabe cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=CFGf0PpD_GUA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rzEn2H2MjajWylKlqLQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX9haZ/1H3UPto
 BrWnY6bGRPS6KuPbnzMwLAjB5zg6tnPMydhk1YMcRVpO2Qw7vhF9Z0UFM/U419kuEBxyiSBrzMt
 Y3GnoYBR+bgmqUXz6EF05iS1ckU1aZs=
X-Proofpoint-ORIG-GUID: jD6ZHokfruVs0FtRtofm7qS6aFut7DRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfXygg+sfiXlTs7
 cA4RH+9xe++vD006jrHZzFl4WRa8kwydmm+i9q80KQnM1eMJYUTa6p7fNn7KMAufAqFwFYHYY+u
 z1i13QDCEoT6FY5iHSQhw65LxlpTj4Q+d6PQOfsZmb+S/4Glls4PWSm+tduCWYXpNhn7chRxn4w
 7WVeDrWpBlzpciglt6Bjxi7pkJz/sZrjr2rK9eKFv/iS7H+RmGdkXjLrbneiwvsHohmOouVp4aO
 ZYm0tRUa0eFfiiZFAnDuy51liECBAwRvKYHyHu0o8XyNCXxLpP+GH+Gc3FLQ490/niCMmLbQJOr
 xfDhDujGDBvcy/iZ92BKKOnfyQU2wt2EUv+1P/KjTvinv0sZIuhIn0P0qNz5SbQEHU+8M+uw/Z6
 7tn21c7L9omAi3//5Nh+WKC0fqJJmXy0b7zOIPrkN7yF49CQHOlaxUc/A9ViwuZtVq8VvzXyIXl
 Od02QqzHNqfAUDzT4xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280156

Check the underlying I2C adapter supports both the raw I2C transfers
used by the fan RPM/LUT commands and the SMBus byte and block-write
transfers used by the other EC commands, and fail probe early with a
clear error if it doesn't.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index d0c45d9970ee..a420a180a194 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -1195,6 +1195,11 @@ static int qcom_ec_probe(struct i2c_client *client)
 	unsigned int i;
 	int ret;
 
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_WRITE_I2C_BLOCK))
+		return -EOPNOTSUPP;
+
 	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
 	if (!ec)
 		return -ENOMEM;

-- 
2.34.1

