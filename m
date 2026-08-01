Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E870A38B14F
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 08:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785571264; cv=none; b=Ekp2hLSg8pjLGiNJYLOfV9UpKB9KCjZOcF4mdS4ulM5dJ+ga6p5LlEtFGXbbXjMLyY/SX8liIqj1S3UKcA3ZMbpzEDEgF0lDXdqS6vksz/zKTHfhlT5/6YyE21JD6NjML8m2lzWpaBX/uwyWVeU7VkDIjxq/xvdHtRniQqKEz/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785571264; c=relaxed/simple;
	bh=tO/UbORkYQRu2GyZWsd5lIQjSIfPDRDF6k5spd1aUaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rSc4LvJ00MZura4ZvMV66b2jGL9gRy6LUoL0bMTdN4K12p57Mduut1xMysa/cb3D8rG2og7FDaI5HLb1uaaYgxfDb3mbqv7HMA8/4g2bCsALumFz8YSF3tYmHr2LBCAxTuwTDkU/GrlyJbL6PIOwzBs2+ACBgYOoFfEBkGh03hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIx1wPuc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RhiRZtIN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIx1wPuc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RhiRZtIN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713DhUp2065736
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 08:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfffiHlcHMLga+lw3u6634PXzQHs72n/jaqHfMgjoHs=; b=eIx1wPuc1iKcn7z0
	9skC3AGl3GS/XeWeRsrGPDfMVp+hoyDx9uk7bqhEtXGxcj3CTQ/A/YuBoya7+BVo
	DCsW6az9tdNKUDYtDt0ySe0KNlbB7XM+rW6utp5lZr54WV7dJ4CDG/IJ5nEvUiKG
	wBbOX4N8Vt4PSUH1j8XXU94K/AdeL4xa7Ook+AYTAs0Rl1JGkQXE13NBVCJlHeML
	I/xRmN2Vv2B2WQbQbsdXDYKl3DvHJTjsCK+ugrqHDYMbWrCabtnKNE5YQFHss8wk
	bEJo4iKWvBlzhdDOKtuxVwcj3aSAfOnQO3YSZI2+cHJsZbVkEi1FyfTLhZ7TrPko
	joZveA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q50hgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 08:01:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so4490939a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785571261; x=1786176061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfffiHlcHMLga+lw3u6634PXzQHs72n/jaqHfMgjoHs=;
        b=RhiRZtINfMd2ZdnUXkfk8PYkv//vRFh3oc2F4Vs/4MF9WYHqrkHbEQvY5V+0B6w/xN
         FA2Bz7uDmqF0Jav69D93Je4eVbVQ8lhXKpCD5zozPgKQhDnhSDPS6nlH5i2R36UaFhF/
         i6Cqon8NM9wBuOs/vj/0vhnfeLmCdzU7oNSzZk/1jVoEvMq0JmC73yHH77cdDfjqHba+
         iO4w6UkzOtaT+BjIVQEffPmM95v9mpGGI1kgQgE8nS1QwVl9FKpK81Zajo9eMDHvCyJn
         SVJl116/gEmQb2fb4WMfjx3L8ozQ2GfsTgDeYIXxVbbLpOCzXWTq+MPqtzJCQAtazP5D
         fzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785571261; x=1786176061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfffiHlcHMLga+lw3u6634PXzQHs72n/jaqHfMgjoHs=;
        b=PvfedNddwPZea0iBVaQd/aFo4RcOc072irNeVl+K5toHdqAX+H1GCQsBt4J1Ug/thf
         2T8Dg4poIpH6bgLB4WxEpqh1CkCAWvzpcG2xpxiJYvuT/kKv0bMDKPyBF+1vQP861AWM
         F+46kcbSoC5+/zxLlR5ea0CabTj3X/6cTxXWeRZVyfrd9pOoYh7Lc3dPxEXUuJmgJq8y
         nQyh2duH2E7SBJRznTs+jjZU6iuiu23vMKyty1pNslLze0jZr38wTqEn92jeM0VKSfzP
         V7Fg9qPKDt9a+u5fOjll1hwHIL1cjCv9rI0wp4oEtNj2rCrabzK2lN6mYxx8jiPtnmUY
         t7oA==
X-Forwarded-Encrypted: i=1; AHgh+RrCQsVZs91FjgZcF1a5CzfnNrvhwZqP+nHBKbGWBaJ4xSQXaWqXdoUz3IRTzb+Stt8uBIHwBuRV8FFn9NjO@vger.kernel.org
X-Gm-Message-State: AOJu0YzhE9qCm+EJUB9kS97+sCQ2mvIJxMGa16XQrA6elFwDoT78Q9fq
	JenI2nOUXGnyb+cLvIt2aUYnQGgS86QIeXNT8tOLSQy1X0MmmTZ0jQPJdArtXhIfJ03gg6qBa06
	zOzo+68j7KK3q4h8Q3f2Vwtl+//0WhxmcMbSF7gkJwroTuWkUGJj8q0wOY6IYLiVG5I/1
X-Gm-Gg: AR+sD10nEKRvseYoIB2LJdKlDfQs+1V2c5LWE74XVcLW6ENDBZ74zVWFeLSKNp2tRmQ
	+N/Za1ocdz8SJknINzwuq91pg2fwipffMizixZPcCvXYnT/hdAj6+BVOmk4V8wxBt9N/y62ndxE
	8Lj3WB0J17KSYl3VTnqV0YQA5wsdRa4+LaJfEh6DlhFj8tNnx8JmwoNJl6Kt4HBuVkGEh4+Qjr/
	jy3SbsT4iyyD/10/XPjt8+ozbeMJsVnWW5zCnR6TreCslFdBKNJZC500s2DetphMNyXQMZQlGhg
	sJVBE1ma9lE2V8k6NmD+Q7b/I218j0fhl8wkjyWlETrWWYAHHnLirUpmjqBReO4+19rIG4Fygmg
	ewDd0ec7RAm9oe/c1VkYU24B/cgI9fA==
X-Received: by 2002:a17:90b:1c91:b0:38e:69b5:5386 with SMTP id 98e67ed59e1d1-38fbc53bde2mr2650461a91.33.1785571260758;
        Sat, 01 Aug 2026 01:01:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1c91:b0:38e:69b5:5386 with SMTP id 98e67ed59e1d1-38fbc53bde2mr2650435a91.33.1785571260291;
        Sat, 01 Aug 2026 01:01:00 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm24739838eec.28.2026.08.01.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 01:00:59 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 13:30:30 +0530
Subject: [PATCH v6 4/4] regulator: qcom-rpmh: Fix coding style issues
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-b4-read-rpmh-v5-v6-4-9fcb54928523@oss.qualcomm.com>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
In-Reply-To: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785571241; l=1010;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=tO/UbORkYQRu2GyZWsd5lIQjSIfPDRDF6k5spd1aUaU=;
 b=DGztfFQVOi9xI5FiPYjngOxoCFJ29tqeCDSWi6jya8M3pYxQe8r3PMK5V22UvfrMdR9HHrgsm
 VpirXwrnlfqDUI7jLd6sitkuMECPVvmD4mOgV5HEIoJQ8kQH1sOAunE
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA1NyBTYWx0ZWRfX5889m/XLwtqV
 da+P8ppXkAqG3/t8OUbhAwE3WeP8fKBECL4UBVzMUiNh7k9E6V4+eeP7WIMObS4BE3UfLTIm2SF
 mB8VSTdrB238mhsmbRcyHTDqx+jLQTg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA1NyBTYWx0ZWRfX9qkjYx8lQ9RI
 9NymWq1dGz5lbTLIo24Woi6527Qbj32NC4ciJ9eZ+dCQsjkOkZccL1aBcUBjy/lzHUN/141/Rzt
 3kh2ODP/vvSRkQADys4EJFCm1mQIEUDILl7vR6qalvhhCmtZtyuYWdcBwkOachtX6frO8wy+RbL
 TH1I7zpUxm06LSHhijrhA6e6jTl9Pi3JayiTd+jDt5m8GN5fsfLUpkeYCrG6PePGnmBGCYZbtZs
 a3CglWGqn0Kkeh+Fx/99jX9AeddnioQFcY5ChPEYsHLvpFDd8T68X3AeweOJs3a1WTXKahs/6pT
 kcjYN2tpLvGtb96qPLryy5Cf5kvs2x475zHdtxagakzYaN+DYlQZbJp4qSoqTE0WpRalGOyiFdp
 ZP/c98p+/boRpozjwTDEUbAj3QLIIu1u35IYaHXE+DINC4rScS3Qfh9rlr1ZAXuy8rto/q2Kjp/
 2gBAYwn4J0NJyqSqySQ==
X-Proofpoint-GUID: okfRHc0FD2bHO6ciLCEdh-GBOWv16ZuR
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6da7bd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5CyPyIk1yY-pfn5d-v8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: okfRHc0FD2bHO6ciLCEdh-GBOWv16ZuR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010057

Fix the code style/format issues reported by checkpatch.pl
script.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 77d402ee6bf6..250b2c6bb795 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -110,7 +110,7 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
  *				regulator
  * @ops:			Pointer to regulator ops callback structure
  * @voltage_ranges:		The possible ranges of voltages supported by this
- * 				PMIC regulator type
+ *				PMIC regulator type
  * @n_linear_ranges:		Number of entries in voltage_ranges
  * @n_voltages:			The number of unique voltage set points defined
  *				by voltage_ranges

-- 
2.43.0

