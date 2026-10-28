Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193860;
	b=FpA6lt8DK0ttubTyUVQEglAdVExh0farzZ90Z3yEvG5fT71da5QYMY7Avy9zWzhjVcdw
	 FHz+ALYNm+mMbEhgAuuTggoUwiRY8+Z2YiRx46U+acdHIg4ZnqJrMLB0yNeWE9R5HfhmF
	 hbd0hYQQkL1DtHqoSviO4xCMFAt1AQYJe1EDRnJdCqk/x3kNfIhImd5cqQC4sq8LBdS4P
	 EdDXuYeII1YE+qtF/fgd1p4zgoVEyNLVzzkSoldw0OQsp3z/bxq40l9FXLqIT4jYNLo3K
	 CqeNl9//PGnmU8RGqCC0mbAOjlDyXm0vJXs/gJcONoRLil4kYiiwFpW/C345wAAHfPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m0cdH61+/9e1ojUoxbXI507X1lJnFk5xGFSGwC7PDes=;
	b=JzT00+ky106hq+g2Fw4UWr2tyP0BaPquY32vQ0m9OF0/n9ZnGuNwADST+0Szc+xS/GpT
	 S1ZmDXdt89gpkv6JKApmW31w7bK7gEDJnTND0SFYh2ABA+TVMVLyJwAqWwk/fJ/whpyvZ
	 0bGeXhnzaTV0c7bF1fgIRQ7PGnzvoTpw6uduWF85y9YM6/TBBKfjH7OdcV7GPPGnZ6JFe
	 dDy16jsWhQCyD5fly76Tip8wxwdHlc0RGXY6zKiN3w+52p0V84pZUdl9SQNKJhCp/CN4C
	 LNdngloarZZTQA8wCnyjfEUUOk/lKth2Jze/3hMXiw9dQ9qpY7HZLOQ2YijAFZ2Gyjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VOmLJ9G2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LSFS4DT5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E7606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807E7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VOmLJ9G2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LSFS4DT5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBekFa4156060
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m0cdH61+/9e
	1ojUoxbXI507X1lJnFk5xGFSGwC7PDes=; b=VOmLJ9G2y2Q+z0HpF37VDETeYWd
	zra3YTf8Kep+rGb4MYr13sN0kWEnD9Kw4Ep3hMleZNb6PviCVrnGVjV9epYWg+OT
	cufN8xRWlvYoHJdQfbJUA8hO2TINFA84T36SdQ6kRWLsjIa8OqDsOvqZf5HOVCb8
	0Ljy+xlpRcyZwaa5Wx6tjbLUYlrAVDnlBkoTYATLEAM6NH17wgoqodjh41a854Bj
	jeWKlmNL59uZg8jcZt7sfesT4mgnl7xd8e0iA9BZ4XzMqGbpAAVvWwBWvPnmsp5r
	Jo4PCLI83Ntc7mHxCANMEusM1cuWt0nkG0H+lzhHlgOyE7vIk6sgJA3nAog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0ypg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso181113585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193858; x=1793798658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m0cdH61+/9e1ojUoxbXI507X1lJnFk5xGFSGwC7PDes=;
        b=LSFS4DT5nR5tCiYFRwWqWTYlOB4nC3X9BXr8WyQfmfKs08AeKDCqciDSOabX4XKenH
         7psKyJm2uoVvQk/SL3nnp1enP82tdSLyguh/2L0pd9tQd/cl4Ar4qYBj2WmMStFm6o24
         RcG64G42/A+7tZe28JaCvz5An3DRLgjSKNuBliKOBN6Dhi4uVuQiy6poAEnKNesF3t5n
         ip79xy/aS0E583JI1Zj/y4x6/7pjZ3mHRWOqB2mijoxJzbH8jHMi8t695w3DUkYoCEOr
         15geUV3SkEZvXx5CaIkbWXbACliQ0rRTquoTsMPgPjA+MxiXJlL4LQ4dUwFOzFK2I2wv
         2cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193858; x=1793798658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m0cdH61+/9e1ojUoxbXI507X1lJnFk5xGFSGwC7PDes=;
        b=m3vc+umrLv8Bg/36tfFcdYCX5Q8foTDhPybOaMS3klN27zB0wYjtdDjpFa2/Ab8Sq1
         NM4lQvWT4vPP4wLT06K6XfnmjKCmcHZjCqS0eXK3ImN/p5zW/vyA+/ez9o8HqV4pXdIr
         5sYmBJz8r4dSjn2GWd6kr54UfXf5SAeMbnnD41HaogTvV0Nepf2LWJLY2wSJgxrX+hP2
         UpKRMLTdh8WkqrjuDW6sm71ijQx+sPicy/mHRqZy83JEmbNdnZQ7IYerGPUKCcI/YwXy
         sOvd180WktjXR3TUql15BS3sTrdzV9PeUmtj35kt3Cfzi27VCdUpj8Ydt32UdVV8/axr
         cg/g==
X-Forwarded-Encrypted: i=1; AKwUvBxtTHaXnqL3FUc4db0W4CPE4Sx5G+/Xhm/WzgdlkaH0tyXYLslVxgSFJ71kqxdfdsFAYuh7YzXNoaEXI3+4@vger.kernel.org
X-Gm-Message-State: AFq9FYKHg9lAm0/T++N2hcanNv2KM2OrTEvVLqS1MPwH+c5Y3wbMu/yX
	Jl+zCX6bfFtGRF4lP6ikVhuTJFqsqGLo6f4H5eXra2uVLdGebDsJxvDYXf+P+qmXBlknrTTBIoc
	8P5fs3Is+Elun5lANastkpUyTJszP7pNgrq0BAljL2M8067QoYfprR58hFvIRQVZXm7qr
X-Gm-Gg: AYBFou2/fdEd0O/RTj8r1LAiAfGRdkZqUhIoEsP0csVxMqLunYC48eFQnS3y+Y/laQz
	cW+i1BTbS1N3YiS6AYgPmGkkcoEUphA8p9bxg36jzyPMCFntSuxMsMHV0cRXwZoRunpra+GD03h
	jSlUydL5tro5Zeiecaqi/VQDZ+BqsqxzFxvl+KXiKHM8PoqDfKRAUK/7gZdi2O7Nx8pCfFsrbyN
	Lw5ZUdeSxsrAps7/k3IdIUImF3cxJ1H2S+Skv5z47QLWNwIAeUP1AL6sN01Avbw6fp8o0n3iUDr
	uv0UA1PJCHc2kbpbXpfwDbjIAGSj54+um38cfooAIjjExpKDrfAAwKjMH6w32LZDfrS7feagyot
	qLzjlO8S8zw3e9g0zl3rHkQxIT0X33Qo4QggLaRrrh/+EEH8RJq3UQgq+7kXynIFqwCBYTSCwyQ
	==
X-Received: by 2002:a05:620a:2688:b0:93f:353c:6bed with SMTP id af79cd13be357-94408a69494mr339802685a.20.1793193857829;
        Wed, 28 Oct 2026 06:24:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:93f:353c:6bed with SMTP id af79cd13be357-94408a69494mr339796785a.20.1793193857125;
        Wed, 28 Oct 2026 06:24:17 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:13 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] media: qcom: camss: share VFE clock sources by the highest rate
Date: Wed, 28 Oct 2026 15:24:01 +0200
Message-Id: <20261028132403.3505037-5-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zom1PU15q_pMwuGOrJ0InkDNKWC_ErqN
X-Proofpoint-ORIG-GUID: zom1PU15q_pMwuGOrJ0InkDNKWC_ErqN
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1f782 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=IrtjSiDjB1mfS8sH3h0A:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX7jvcLcg2doBi
 rcVCmr//1YIJ6sbZWo5VhszrQoNguJm9WKC2DvGL8hneGzxYHzWXMK/vekX0NQjcfa2iw5q+/jO
 pW2qHU7ewuXcFiX9B0n8OHhZnCvsW6LE9oH/RMBR12NdgFvBGCVeWlMT7p/fmKKh5BMMzLIJfFK
 0KA9jpaqQlaBHFJJrm7tayJq5Q4LzrLY7O0k2gmTDruHmZgw75Cod9nW6YtWn3MtbzNIqMgkt3F
 t9zf6Inv4WsiEiPt/sJ83PPtEP2n4XcUwOsgTwaKhXTVTTwERamrUI827mwBDZcHTRyhQDKmSfR
 x6HZv94RYvy3DKql91sjbaRaVnvjVEGE6cnNWE9dc5aTXO00XwrwdjR8byI2Mpy9rrXKEQkw+lQ
 4fXxmgBcDEm1VVNIjmScNnHL06jgKIJFnTWnfS1YxBfuThP2NlRvmtA2oa90AlrRN2Nq1sOTh6a
 RPFRa3lhv1NlqRqtP/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX6bOqTy1/5zT/
 ONwK4aQoKLGLZu5z73IzXrG8mB736RT3whpzR1Bodc8Wweas2eDH8w3cWHLy7x2NiwnaGOu5cGW
 IJXQ8boGcYiIRlxKcXYXKFqHS33rKGk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280053

Clocks of different VFEs can be fed by one clock source, and each VFE
sets such a source to the rate it needs. A VFE started later at a lower
rate then lowers the source under a VFE that is still running.

For example, on SM8250 the two VFE Lite share one core clock source,
which the VFE sets to 400 or 480 MHz from the pixel rate. With VFE Lite
0 streaming the CSID test pattern at 480 MHz, starting an imx577 stream
on VFE Lite 1 sets the shared source to 400 MHz under the running VFE
Lite 0.

Request the VFE clock rates as minimums with clk_set_rate_range(), so
that a shared clock runs at the highest minimum of its running VFEs.
On power off the VFE drops its minimum and sets the clock to its lowest
listed rate within the remaining minimums.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
Changes in v4:
- Use clk_set_rate_range() on all SoCs, drop the vfe_clock_ranges flag
  (Loic Poulain, Bryan O'Donoghue)
- Add Suggested-by (Bryan O'Donoghue)

 drivers/media/platform/qcom/camss/camss-vfe.c | 39 +++++++++++++++++--
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index bcc2c1929af1..46674bc30e6a 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1037,7 +1037,7 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 				return -EINVAL;
 			}
 
-			ret = clk_set_rate(clock->clk, rate);
+			ret = clk_set_rate_range(clock->clk, clock->freq[j], ULONG_MAX);
 			if (ret < 0) {
 				dev_err(dev, "clk set rate failed: %d\n", ret);
 				return ret;
@@ -1088,6 +1088,34 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 	return 0;
 }
 
+/*
+ * vfe_release_clock_rates - Release the minimum clock rates of VFE module
+ * @vfe: VFE device
+ *
+ * Drop the minimum rate requested by the VFE from each of its clocks and set
+ * the clock to its lowest level, or to the highest minimum rate still
+ * requested by the other users of the clock.
+ */
+static void vfe_release_clock_rates(struct vfe_device *vfe)
+{
+	int i;
+
+	for (i = 0; i < vfe->nclocks; i++) {
+		struct camss_clock *clock = &vfe->clock[i];
+		long rate;
+
+		if (!vfe_match_clock_names(vfe, clock) || !vfe_check_clock_levels(clock))
+			continue;
+
+		clk_drop_range(clock->clk);
+
+		/* Round first, so that the rate respects the other users' ranges */
+		rate = clk_round_rate(clock->clk, clock->freq[0]);
+		if (rate > 0)
+			clk_set_rate(clock->clk, rate);
+	}
+}
+
 /*
  * vfe_get - Power up and reset VFE module
  * @vfe: VFE Device
@@ -1111,12 +1139,12 @@ int vfe_get(struct vfe_device *vfe)
 
 		ret = vfe_set_clock_rates(vfe);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_release_rates;
 
 		ret = camss_enable_clocks(vfe->nclocks, vfe->clock,
 					  vfe->camss->dev);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_release_rates;
 
 		ret = vfe_reset(vfe);
 		if (ret < 0)
@@ -1141,7 +1169,9 @@ int vfe_get(struct vfe_device *vfe)
 error_reset:
 	camss_disable_clocks(vfe->nclocks, vfe->clock);
 
-error_pm_runtime_get:
+error_release_rates:
+	vfe_release_clock_rates(vfe);
+
 	pm_runtime_put_sync(vfe->camss->dev);
 error_domain_off:
 	vfe->res->hw_ops->pm_domain_off(vfe);
@@ -1169,6 +1199,7 @@ void vfe_put(struct vfe_device *vfe)
 			vfe->res->hw_ops->vfe_halt(vfe);
 		}
 		camss_disable_clocks(vfe->nclocks, vfe->clock);
+		vfe_release_clock_rates(vfe);
 		pm_runtime_put_sync(vfe->camss->dev);
 		vfe->res->hw_ops->pm_domain_off(vfe);
 	}
-- 
2.34.1

