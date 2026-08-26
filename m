Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8E9357CFC
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764807; cv=none; b=iaDM0SNRHC720qJ2aTKSlF6wD9OrlPX8eT58Y6Mf6BC20QMjogIFBRHKgqu3UhXbunOm6cyXYWpdpMK1tmTWV+nbYCKLHS7P84asBZ77U3JN9Y5X2EQt5+ZcTGWjaSm3OHdyg3As8KAM9HGUfLVNSpkYazEMH9wURWiHcl2cbw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764807; c=relaxed/simple;
	bh=wv1LRyJF436NBZkqYSed99dO660pUkPBSqfpXcjqKUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BjRL7tLITvV7G/qyiiENNczOX8s+Pg6G+wWbbuQJjA2CKwQ5shtFkfcsBabnbR4NA3oH8vKokUJlb8Is5jqbsFZMHAV7vE2U5zqGVJDuOTNJj+f+U1SMB9Y4zXEOzfpF5nO5PMfok3ZzmJQhvEZtYIh5i8jI7PUnMs8djSzi9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0cHsH5M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cj4ti7Zz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0cHsH5M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cj4ti7Zz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuq5Z1541311
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 17:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tD1u+02Zr5j6+6GAngHUQW
	gDuBEpH+yAUOjfilb1Lg0=; b=i0cHsH5Myr654BX2GGBptirO3vrAjd5cAQBJde
	uVVvhy1rtvbnlMYolAarMYZ6XyeRnV3FeOqDhOryG+ENNmT2WIvGX7mSDS77nSla
	sr51ENigQoc03d+4PlJt3xh4J2tOjCphPQgj1kMcDcfnVAOVCwRSFbKHJBFgDnj4
	ROs/r1Xll35Buy6JDnqQCbWU1lS86ti6bkHXnG/1w5OU0gIBjIAHNnz/Pt4rtvSL
	wj0JNOr80ZYXLoOdp/se0IIzkpDczg9z5idEWeBFkmEx/lXL/VY7eU3Wz2vf0wND
	NrhBlSp9b4HquIWJwdXo4QCCV1bkhsJhHGlRAjzGcFA9QzWQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga075968e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 17:19:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so1389366a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787764779; x=1788369579; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tD1u+02Zr5j6+6GAngHUQWgDuBEpH+yAUOjfilb1Lg0=;
        b=Cj4ti7ZzjmDqvnae/WtTN5LHC6F9Md6SXmtHcIf6UN7i6mbynf+yjI43R+neoAcy+x
         kHCtAjvOBVP+2fw3uskRFqM6YDOmvw/OgAvVclr95pmcONNnUbOJplvvubBcyUEA2ppO
         eiNCsXnJq2zxRpr5tniGPg1GbjkEkecZLhq6nGNk5NoWZ4i4/l/6PdYezPWULJAWSFsC
         vkmq0ZbpORsc4kQY4UuHa4bP5TlZMRP++xQjICtNSeSCu7IMe6YVB/OyUP7ldvWxFFXe
         NaIhovmAS55xe3oOlR649oOC7kvSRThMdMRmgx0WQCqcqwRefEUbMyrbbgy/jhHF1l7h
         FEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764779; x=1788369579;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tD1u+02Zr5j6+6GAngHUQWgDuBEpH+yAUOjfilb1Lg0=;
        b=GTR8AHnA2k7BQK0PFlcCt9faEGkCYU+5X0A0Lh8iK60Z2JyKB/fh9wG3b5cdB0q91m
         2s9ZNtjBEj6tuWzpII1dLZ6VkKjjbpo/SrMbk0qzfidgbpj2A812482EyOZpkbu197Wq
         uYO49TKyWZgw0gRzchLIIw8HsrbAtmnsZtO4sNtZYhBlLzF7fIxwVpCt8fhsdVMQtAcH
         irK0UNpE3pAPeQ3VWEsRXdyaWow446cqnlaHQFtP05s0OtxOg7OWPW8lAAQHJF6UxHVh
         OIfAhLM4XJnVWs59910GV4Z/tE+a6vC8mn++obLOR8Q1iiLtlbRRYnMzlD+/jL8rqKMR
         v49w==
X-Gm-Message-State: AFuF++kpFw4IpF/s5rGpzADl559SYe3yfk8I4cIx8rx8CnX01VcI+gOu
	BU08JEjMELOJUshpwEo28X2+vG651xAEoCfnTFsmz9Nquva64c4uhOD2W432c9jqsuVH0dPUIAt
	t5e91ymoGadPdrAV/zNbRO88LacvjH/iZ3p3Zsrx0rsVPPDNHK/avDmDYIiLWxWP87wdx
X-Gm-Gg: AR+sD10/sIq00NliwC/AfFJB3P3serKBy23Mw/aOJsdWXlmx8VWbeUHPAhtKX10fCxu
	UmOgFi6fRHlgHMZi9TmrdIM/fVSShDVO6rWO3WLwgbjWXmRzql3MQsz4mzdaCMpA2UCQ7t5ezxA
	QAOj9PbuViZkScwrn/MwjTfEh3jMLZHUaGTAY8lDBUGqjtCvFLlA710wINR8HCbnLKlbZPOPwXy
	wapgCrS2KLdpJ9lA0akeI8X80bq1w7P8hFKPcStcdAdzelxeButKu8l8GOWYCEA/TBF19BkXtBM
	TI+SMf7O9bc7meIk+/yQFNMhf+qUUKgMiAE7Nq+w7Je5hUbH8YJpysit7ry4h+XdBCfWBNJ4zg6
	Zu5HwOMaKPAcb/aC+j4gRPtGQrKAbN3SanEzbimElRopXJ0Z2EQ==
X-Received: by 2002:a05:6a00:8d86:b0:848:2eac:bfb2 with SMTP id d2e1a72fcca58-853748a0551mr17568193b3a.13.1787764779077;
        Wed, 26 Aug 2026 10:19:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d86:b0:848:2eac:bfb2 with SMTP id d2e1a72fcca58-853748a0551mr17568124b3a.13.1787764778636;
        Wed, 26 Aug 2026 10:19:38 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535d345ecesm1206968b3a.59.2026.08.26.10.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:19:37 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:19:26 -0700
Subject: [PATCH] i2c: busses: i2c-qcom-geni: Use resume and get pm runtime
 interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-i2c-qcom-geni-pm-runtime-resume-get-v1-1-25ee55d1f0c8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB0gj2oC/yXNwQrCMBCE4Vcpe3ahjVjEVxEPbTJNV0haN4kIp
 e9utKfhu/yzUYIKEt2ajRRvSbLEiu7UkJ2H6MHiqsm0pm+v5sJiLL/sEtgjCq+BtcQsAaxIpY5
 HZuem0QLd0J8d1dKqmOTzf7k/DqcyPmHzL037/gU4ciwRhwAAAA==
X-Change-ID: 20260825-i2c-qcom-geni-pm-runtime-resume-get-ddfbcee1a63d
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787764777; l=1272;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=wv1LRyJF436NBZkqYSed99dO660pUkPBSqfpXcjqKUI=;
 b=rR/0L1/u4biv+fJMMwzDwAWDhrZnvz6R2e9sjXqUg7saAttIuhJzroOjxA3XmHOqWkHZnqbRA
 Dua4wX1Mu9kBo+6FbKoLALLdm0mDhfW3nAjYUr4yFgw57UKVppZYeF7
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-ORIG-GUID: ck9KlqKy9PqfjvdgDZmToCGI7YXUSuB4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NCBTYWx0ZWRfX+LjwzyAfMYzf
 0LpfkTiQdzId7VdWjX4EitE6tqoOaW3N0crcPAUJfA8AdXNvwBtiizL17cTLPeWeVPJnY2GDDzN
 J9c5lP9ckun48+smrnrHKi43MtB0Z0Ztd9TeytvzozoSwWUySlcCeBs0zprkDKMrJf1L+H2FWzA
 Vip48KIuEP9eHDCwQB703Nf88PD/j1N5gVQgJKjrtfHqg1i4Y11bNwGsQGgwoSnHQcvJ9JOFqon
 gs79VEeAcleV46E+C4B0M/jnSA3TawxVOqC6Qd7nwkj8ysIXa+0Qtsc5kuyZJtI3LfqzxeyclBe
 5ldH9qIBlRpjcGQ60z+CCKggOdmFpGVHlSERp6EPNIm87v/KeOnTSE3nUXFI062RpPns24UTH9V
 Gf+3ogPraUz5S7NrGb8v5te5+yb/lNKfc7f2Ewbd8X8zqyvXvvACsO3hFsj7LOQb2i5NwxCCfir
 OczBcKOv6ljaScsOGYA==
X-Proofpoint-GUID: ck9KlqKy9PqfjvdgDZmToCGI7YXUSuB4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NCBTYWx0ZWRfX4YAD0VMG/kOt
 3mYk9myTEakptTIpNCnJccVEpy98c5PcnVlUSpVEmu+RrQo41GASQCVu75aCZTjDt3k5JfqE83Q
 jgI97IDB+tvSLHBOwSuisodWXyZJtyQ=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8f202c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qnW5PnHyz4QdMw9lHNoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260144

Utilize the provided pm_runtime_resume_and_get api
to increase the usage count and call the rpm resume
callback. Upon failure, the function takes care of
calling pm_runtime_put_noidle. Remove the explicit
call to put no idle.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 658636c1ee0e..d5f4de3e0a9d 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -963,10 +963,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
 	int ret;
 
-	ret = pm_runtime_get_sync(gi2c->se.dev);
+	ret = pm_runtime_resume_and_get(gi2c->se.dev);
 	if (ret < 0) {
 		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
-		pm_runtime_put_noidle(gi2c->se.dev);
 		/* Set device in suspended since resume failed */
 		pm_runtime_set_suspended(gi2c->se.dev);
 		return ret;

---
base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
change-id: 20260825-i2c-qcom-geni-pm-runtime-resume-get-ddfbcee1a63d

Best regards,
--  
Alex Tran <alex.tran@oss.qualcomm.com>

