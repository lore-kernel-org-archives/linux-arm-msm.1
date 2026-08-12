Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502E03E95B1
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523472; cv=none; b=en7XUKSdd4lWkI62FhLs728AWciUfGiZ40ziTDlkf2Qv3DzhoX6y4XZMhDxQf0YFqpGQhD800hoWmR+ZfhBWn/gI4fAp3WtSsAIag7yuPoEDErvawHW0dLAZ5rbiOwgKHT4uR4R7wA3ODAbKRhXzrb5NN8iUM9QHvqskDIDf9UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523472; c=relaxed/simple;
	bh=Dja56rSsJWymUw/Omdg2HDuTOFhSjr88PK7rUZ7ZjLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=swGCnJXLPtQ1sHsxSPdDoCVMKiWaqal9NB9FhAdh9e6PBo+VcA1+Z7luGBnskB5P/ADPVs+z9vf5wBPfq4rrbsWPXgDndlMjMGFhgIGnhQ0J0DkyARDJ55KQ5bgdUlI/EcB+yrcEgxQI1HBmkqeC85xLWDPw45Z7vKIIv4M2WEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNVCXFsq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DcE4taUr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNVCXFsq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DcE4taUr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C79SiL3144252
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0E2fjjl2z413AgzHaMxdBXeMeM9rA+DTDDWPItpGYo=; b=WNVCXFsqv4TkdJxM
	IFoilKDtqUYwjwPhWLZjtR+rfm07J5Zb1zgw+nDdEwdQEEWD5R9HuMUa/8T5KnRO
	quvXcags+JeyituYvWa4N7BBq3cJE9mnKuCE5V+SwGewTQXko8ew9KDS+59wMzuM
	hWY+HPcZED7iO1XxfZ60zcaSvpgvW/cIjX0X9iORft8dd0Q7FkEJWHrPcKFjXtwz
	zRmbfvvA1ohXAWC8OhU0XJl8ykCDkqc8GsUAWVmSVF5F09+9Tg9M2PzkbgtWqqCm
	DXwkSz/jlQgYpo5r4sWTVu/XI5L3DEAsx3BxnkBgKTAdf2UT2j62o6LXjlfZOiWb
	ButPow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0m6rg9u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:31:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cceabd70f5so21337935ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 01:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523470; x=1787128270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0E2fjjl2z413AgzHaMxdBXeMeM9rA+DTDDWPItpGYo=;
        b=DcE4taUrezcIZ3WfEqO7hJmdWJHYZxIRqPCAceu2RzTSEU3LUYLCcIabjSKrJiXBxc
         9sBwQugkUzhC2VDKN3/5ek2lqT4clZc4n2lvQYZdlgehIkyFgJ8Zml03Y7EVE9yXT1ql
         W0B331HahOaHAoaLltyi2bxJkwOMpfHG6/HzH42QlogrqjKEnT27ZDUbMptz/5gVY8Gr
         v/eGMwyxp6TKu6XRyRRqKWXoTZ3HKV3Z9XgDsLjFQt5H9uyFsHrt/03kPl3TPfyD70WJ
         tMzkRxKp0XNCfsczS3yyBiQANJ9a3x3IibBzgAFfhmZhq169uB5EUYZUZ4ZnwpysvikW
         u9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523470; x=1787128270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g0E2fjjl2z413AgzHaMxdBXeMeM9rA+DTDDWPItpGYo=;
        b=XmsePboMgo98whxqr4afOfUZmHt3B57qN4hFjd9pNAM1tqwT6XS1UJyVRxsiwMqQGK
         mcpD74Lo7VGqHvcVE4R28EoZ29Oa33YryvV35i30Nx4Lj02Hplna4tBM4emDqD+TwHq1
         Q/w0asevx2h9bCO4URGEJjcF8UEBW9Kfc90OmdTtIarAUcnybTlWEg/FhaeT4qvn3oAZ
         UgfZn40DyFQeUDC+GYqDG0EMConIuWhXmkMY3kE1oMFV5n/DWSnWahZSNkijQTI++fIt
         pnVze41j7gea+dG51TtEXMVPJE0VJY+WQK7B0NdTGfpuwC/PACoHgv2Uc+AxSvfENVuo
         Mlrw==
X-Forwarded-Encrypted: i=1; AHgh+RpCqKsRhnIYmAxuKLOd1CdLdBqZjxYbYLBrY6v+IYJHvFgFkhImbxyabt48i6l6G8C2U4ZRwD2uAdwAFkFp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj65JmzJ+78AWiEesN6EXiXR0YZQV+sBGUqusfWSXfssD8OwP+
	vc4uEtD4JjNmtFEzyZ3CHRJSL9sfbPFHVfwNhUQTJFqHPgH1hSAIlqcbnS/Tpj5YhcJTSOpjGle
	OwYZON4HQUGm0V6S4cOuJ9nYZwzyyCLd7Rw85Qs/BeOuYaUuzMwEujLp4gUfOxNOgR8dS
X-Gm-Gg: AR+sD13XW5QVIFmLlsPxvFQ+ubdRi0d9gY6I9o6V80aSdcFGd6zjlQVNPFH4wXTOLHc
	Og8EtLRO8UJqIQCTWsRF6wyWnxDApPipyqw0Oc6uJntCj1Dl1pGw2JH9QCBk4HGrQFRBTMqOP/R
	4sWxccZcVWOAHb7DphX3d4THqKyn/1FBJgZzrRkQCi+O7ZFmiw8eNo70K/AmoOQW+i9D2Bicc+z
	SSVWX07eFslHbpNDhrM3dNQ1XEG2IH9RAYMrvtWZjwT8d4Bmn5zGneA/7+lqEcOeIZw+8mV6IR1
	rdUFMDsOJYwmEladMVM10+vL2s0w76WiIhirO8OxFTpdgitQk6EMo7zpSP6jmDdTsJxAIGebvmX
	G5NRY4HZTZRGhzaWZUE4/XJAWS+0p9FqrYIic7WhTE3to+e+sbbmq7xoZxmYipS5jcjRlJAeCKT
	lonpEkV0bfVHsUMbIV2QD2/3m4FUX2tGbubxw=
X-Received: by 2002:a05:6a20:1455:b0:3cc:3d08:da39 with SMTP id adf61e73a8af0-3cc3f1fef18mr3945180637.0.1786523469970;
        Wed, 12 Aug 2026 01:31:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:1455:b0:3cc:3d08:da39 with SMTP id adf61e73a8af0-3cc3f1fef18mr3945126637.0.1786523469592;
        Wed, 12 Aug 2026 01:31:09 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141245a9f70sm9942865c88.15.2026.08.12.01.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:31:08 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 14:00:55 +0530
Subject: [PATCH v2 1/2] i2c: qcom-geni: update frequency table to fix
 timing parameters
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ipq5424_i2c_scl_updates-v2-1-e09cd39d01d7@oss.qualcomm.com>
References: <20260812-ipq5424_i2c_scl_updates-v2-0-e09cd39d01d7@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5424_i2c_scl_updates-v2-0-e09cd39d01d7@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX9Xj5wbI7VpXY
 LH3WvilsxuHhd6MLHhPSLCArUfMsDlpinYsIrT7STnL1fp6mhEeOJy58CP64X7UamFdutIB2u/b
 E8O2KHC7fKWiS0kwafB7TeBasB90xwHM8xK7riSBN3QUx3AfCKHsrQ+bhJNUwrn3ZfC1AZomY7n
 hFRXwOBE0K8zwf57Cw32KNR/Tfmoa3MIsgDxtl42SAk8Sq+NEHqfxBIjdmadoRjD7npY+Qh8wuz
 /DiGATyMQaESni9BSPghVqjbr85POjUjGhbCQmBcTxlMkWHBAIlicoObTJMlG/9rV6AKSS0vYDo
 A2BV0zf0RuPATJHFLH1ks3d5Ju86J9EdFYd6jexNbKpKvG+bQ4de8nkqOgPImVhfk8z6cKr0Mvn
 EM+yDwRaV5Y67IU4CL/dBzjh/rBGm/x7r/ljbb+VF/qhfCIV4BlzD1DVQh05NU6wA1qnJ2E9Um1
 0r8Qwx7rq4e0+1qefGQ==
X-Authority-Analysis: v=2.4 cv=Wb08rUhX c=1 sm=1 tr=0 ts=6a7c2f4e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GyXxqrRC-9zytgsE6zAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: OGuBqElUUj8yawO0vW1UpoAVIy9YqgUB
X-Proofpoint-ORIG-GUID: OGuBqElUUj8yawO0vW1UpoAVIy9YqgUB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX12czfa8wZHsm
 Uxw+cOTUdbn1Oo++DdbrtHXVLhmsdCHwHMFkxIlpxBcAnxhvX3pSD2dZvKYPfLW9joB8f6Tm4he
 /LjN26Wh0rLUwxN3F5udIh9q/G3emZU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120067

In IPQ5424, to meet the setup and hold timing requirements in the
standard mode, update the frequency table with the values recommended by
HW design team.

Also remove the stray space in the I2C_MAX_FAST_MODE_FREQ entry.

Cc: <stable@vger.kernel.org>
Fixes: 85c34532849d ("i2c: qcom-geni: fix I2C frequency table to achieve accurate bus rates")
Fixes: 506bb2ab0075 ("i2c: qcom-geni: Support systems with 32MHz serial engine clock")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..00013b41a6f5 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -188,8 +188,8 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
 
 /* source_clock = 32 MHz */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
-	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38 },
-	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19 },
+	{ I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 26 },
+	{ I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 19 },
 	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
 	{}
 };

-- 
2.34.1

