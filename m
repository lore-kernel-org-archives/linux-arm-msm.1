Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8623C1095
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785484864; cv=none; b=E19A2ncIb6eTOSHYUjiEKV7OEpcDxoTW1/cl0xaPTNUCRTbCBa0zqvyHA+J6EEXWBg31+qe+WiFESH6h/8iDFBWTs9Pa7Qa6y0/u9pX+LajHgw99PsOazmOxW4JvPE91Lh1bZvv5hUXqot9qM436Bfq6hR5L9oMlOnsAVFPO3io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785484864; c=relaxed/simple;
	bh=BrOiZmqjDQA4SOX/tFJ9OG7jOwQsX4AlgwumHNQ6g7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MkmfV7TI2tzO8xTXRIeUg/TS1+QJoHb2B9+zvCbhDYsd/vj0fZuLGQBtDUvG8vIFqHb0OlEOQVfTNrXdPmIL7/nFKcOem9RSz+B+2r6ahXiSxIsG6iTqR0JXCdhrYC2Ceo4Ub3qffMzmaQFqLPq3ajlqnvwHsmLmy+xzOkqJXmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4UZLNu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IElzC+1x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4UZLNu2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IElzC+1x"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7vkv23411085
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2pDxPDiiaZcrKgTDQUne5eQDWUVnlE1MaiQL6gCnqsA=; b=h4UZLNu2Rj8N/DBq
	8kZdyCEc0SBUs9GU6uZUuw/smkdYBWjqW705IvBxf0Y52nz0foiytR+HiGS2c/pC
	SvGHtBOJ1cySIrQsypzmRGUnoarhTfVtYUuzP8J4EDANauHPB4FxKWcCJuc/Wynu
	5ZKlW2g3j4F45I0K9kb4V+8lA/F97iX1lzLaoMC1dcU2+CVdpSfT5vtO+iSzOC/Q
	vqihXnivn31fvixoF/+U3oA91YlQFxvifHH5cONy4GJySHAHjFxnfxZlsvCqe1BD
	DCiEqcWDi+F5SYx2ymuyitgPdCR25Q1iOrfGYvi7mY3OKv6qF+1yiTh50OCg5Yog
	hSoSxQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frq8f84rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:00:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8b0a08d2so5374511cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785484858; x=1786089658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pDxPDiiaZcrKgTDQUne5eQDWUVnlE1MaiQL6gCnqsA=;
        b=IElzC+1x5DVOIpJuY5S7BtOFj8e+VZJnc4K60iCHGm25O1q0c8kS393ZpOEKVk+CZx
         360tpNIlfGxDWxf5gA5yVwvFlgqio5vSm4hrhojA7yP9UDF1PwEWpF5D+J1lX8BXbVzZ
         nW89VStOY/OI1P1BkV/+feUqv7KOWKb9m3aZp1jqBEt2W8PXzaY9EEgFbdo6Dt1Z4+Vz
         aktdf5KnAFGg15/LrLW0x9bkDBt9aMmgOGRBm1/mbDMFIU0hudTP8Ty505FgjuhJbpx+
         Oka8HKth7jB6lPFf2SkmzF2n+LRGvShQtFfP204ytNYrt6Dt32Uub/LqJQHCze7HgYM+
         kZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785484858; x=1786089658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pDxPDiiaZcrKgTDQUne5eQDWUVnlE1MaiQL6gCnqsA=;
        b=KYeqwBt61QVKF4QthT7HAYpUwBQJ5ZYvL47gQ/HMBwRpwte+myw1kX9YS1Z4qMqWP+
         lRDvpdEeQE2OYT4F3mG21aRz1Tnh/uyG/06dHArBO2gcqr4eDoPRBZ3A4P3ZZ0Y6pkc2
         xfFNsyWMD/YjuNvv0Byg5SzJZC/BbZ05AUso6BnRuqGg5M8HUFZVVidn2K72OBoOTMPG
         2WyeWPo3HhsBs9Rq/xWDWciTcVct0t4Gb0d9FLmTViRP4eNDTJfKpqnxNvzgqv2qbkSU
         yYXsr+0wu3NwQvPxprRLOExjvMyZmbsdWkgnmvqHpyzwutCejVWT0rJLH2Mbtu3S7qWq
         rPUQ==
X-Gm-Message-State: AOJu0YwqR/bpcEJgBX4Xa0/tgq5LN7EbK5iVtRTSjcBCg9znry/S+NxA
	krR0e/mbVgVyxWA4iIjlnMORFIHII/AUf66Pb0lq8BB7R9YifpTnHNDAJizIQqRI4Jr0msxHyW0
	AKEnvZDnRIkYfE4LBfKIiiVUHXkYxfpReaPaURCZpntKRmmq9aLxFFi7VjpOm5px2W7ir
X-Gm-Gg: AR+sD11i8QwvOlWvNJlJYLLRyPW5lh9ODHPq6pg20sg8R6pyLqb47TcjlcvBcebGyqS
	DtvqWrOUrCGZbD6KLCThskUOVWqQ0kbXktJqEUBBfjC2ZLiJ3twqBRBJ6QnYPezcIpMuF51JE8h
	20JVLeiO1eutDhKE0z9ctLre039sgdkJYs4RtBaSTgHqslbjW0xWi4eUcizINHY/WDEYi4YlOTU
	7+nqzXnCV/Q7wwt6a3baAZ6wKUlR8bV+aV7/gg4GldwnKEyZ7dez13scL/xiPsAYjhK6VR95spN
	m8yly5XK7WqaczquemVcZo0iMSQDzNp3vAB0AaEuz529F0appnz+6DUbpE25k97tflxprSRHnsk
	MOmeWS1SIPYxPyAzWbZVNN+L1gdGXAw==
X-Received: by 2002:a05:622a:1f95:b0:51c:1005:d096 with SMTP id d75a77b69052e-52b4af4fbb4mr13030231cf.24.1785484857775;
        Fri, 31 Jul 2026 01:00:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1f95:b0:51c:1005:d096 with SMTP id d75a77b69052e-52b4af4fbb4mr13029631cf.24.1785484857273;
        Fri, 31 Jul 2026 01:00:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:40fa:e8e6:4785:ce70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4534fc4sm51032966b.51.2026.07.31.01.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:00:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:00:36 +0200
Subject: [PATCH v2 3/4] firmware: qcom: scm: introduce qcom_scm_clk class
 for clock management
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-qcom-scm-code-shrink-v2-3-4ba76096915f@oss.qualcomm.com>
References: <20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com>
In-Reply-To: <20260731-qcom-scm-code-shrink-v2-0-4ba76096915f@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5215;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BrOiZmqjDQA4SOX/tFJ9OG7jOwQsX4AlgwumHNQ6g7E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqbFYwuGtYO7y/9saNMqx1Ip/1IsVoTDPqMZ7i8
 SL+vs3qLaWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamxWMAAKCRAFnS7L/zaE
 wzLLD/97KXFtD7LIQ+56gmRatJ3ybY4StPN3fSpJIBpTfPObNiMTa7OPkyEjxyvnWShXN00ZY7i
 sgLUl1DAFNa9s8MkyBKTO/xJoTYAfv1ea6UXyOvUkvIspbSe+2S4HgDTa8511pu5uGJ6z0VI/86
 lfa469ecD8HVOYOt51gGhTvLJBTGOZu8pfEwEPSBBdfQqRxctjilElcyfl52ZkUDIUwhBrTRYKi
 ypQmdDm4TZgUyqbCXRg1oTPfDo/XuXzq+WPsh7vxOambi5wjLJtVgqhBfWhNNOU8K9T+U9EZ8Ui
 iboodhpuBb2+jpVrDalYTxMYTZYWjBzWG3BjRYtHcuTxzVM56d5eQBaQkZu+f9PdLSXbi1PQMzb
 lDO7v9wbNN5aV1PGG4QmzIoHPV+iTRbM8IqpoScxsclYnuYn9Nbn4+uDmqMa6ylCe///N7T0D10
 uD1llJ934755UF7FzmEVnz6e/lqtbW2APF9nNVL787Qy0va/7aFtjKi8MoiH+78Q5UfUHg1krsB
 BZQ7WEW6v89SxS7dHPMPm8/djr2IUhE9VaqBCcrck4j+t9ykNrNigDv2A5uaT7wRT8XzUWPjdPx
 341t8uRCESI/F5FTFCeS770bz4YAZ6Ajb+0BEnW/xkxTZf9L1pNXfQW3DokGtLsXjnfF812a7/D
 L58IyXLqoLGyZAg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 422OhH8f3a24GeZGhPgJo7kBsNtkhmEa
X-Proofpoint-ORIG-GUID: 422OhH8f3a24GeZGhPgJo7kBsNtkhmEa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1NiBTYWx0ZWRfXzV7SIQW1BEUM
 uflhfJIJkD/sYBl/OzkIdyeAnkqedAcaDwZI11pIxolTBw75OTgIoZhednIRN2USZz7MXBvEXtV
 8x8q885PszDsxgJR6FZAxrYVEFpGqqs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1NiBTYWx0ZWRfXzXZBfsCThci0
 91RP3D3Uzfuu58IQDEgjWfVNZeqhJSmMh/JoNG/60GgW+HQGWfgGqGg3MbPKykpSR1StNXKs5sl
 4jYuTy65vR6qTzRajZDdLzCv/Boci3xZUA/xsJg9mUgHuP8ah+QymUKy4iG1k13xY23zsUGKD5O
 bQHzUqzFUobf3+b4k6EuDKr0uSnFrZJFb0GOKusNVINGKBfpxjw1nqYNL+VhP81h5jV5PIAm6+h
 HInYSuapLiehuSUzvFDjJE6zmRpXYWL/rWdF80+Z4hPjn23FhLyKDvDNYZdC2p4aBuIBmCBqWcV
 ITP8RwuguZjbDiOGOWbt7cynoQQ+G75pBOGRnUUGh4XNK78UzHjz4a52qnKg3LLMUyWpq5jr/h4
 5IZisUCObu3cfdudLC79yiF0uztzW2iIb8064MiEHa9pfwxkHo5qXTbDaUE1fhh0TrTLZXm26gD
 Oz3PIxllIGhLDySMrJg==
X-Authority-Analysis: v=2.4 cv=K8US2SWI c=1 sm=1 tr=0 ts=6a6c563a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=NlXoPVkAUwU2Be_QxucA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310056

Define DEFINE_CLASS(qcom_scm_clk) that calls qcom_scm_clk_enable() on
construction and automatically calls qcom_scm_clk_disable() at scope exit
*if* the enable succeeded.

This allows us to convert all call sites to using
CLASS(qcom_scm_clk, clk)() instead of the manual enable/check/disable
pattern and to remove the associated goto labels.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 89 +++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 55 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10c79d2e59a14af0532c515d332f65bdfea05621..bb213f64703a7adb9ce413ec00524a7d0a1d3856 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -209,6 +209,9 @@ static void qcom_scm_clk_disable(void)
 	clk_disable_unprepare(__scm->bus_clk);
 }
 
+DEFINE_CLASS(qcom_scm_clk, int, if (!_T) qcom_scm_clk_disable(),
+	     qcom_scm_clk_enable(), void)
+
 static int qcom_scm_bw_enable(void)
 {
 	int ret = 0;
@@ -509,13 +512,11 @@ static int qcom_scm_disable_sdi(void)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return clk;
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -609,22 +610,19 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 	};
 	int ret;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return clk;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	desc.args[1] = mdata_phys;
 
 	ret = qcom_scm_call(dev, &desc, res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret;
 }
 
@@ -734,20 +732,17 @@ static int __qcom_scm_pas_mem_setup(struct device *dev, u32 pas_id,
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return clk;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -819,13 +814,13 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
 	void *tbl_ptr;
 	int ret;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ERR_PTR(ret);
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return ERR_PTR(clk);
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ERR_PTR(ret);
 
 	/*
 	 * TrustZone can not accept buffer as NULL value as argument hence,
@@ -872,9 +867,6 @@ static void *__qcom_scm_pas_get_rsc_table2(struct device *dev,
 disable_scm_bw:
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? ERR_PTR(ret) : tbl_ptr;
 }
 
@@ -902,20 +894,17 @@ static int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return clk;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -997,20 +986,17 @@ static int __qcom_scm_pas_shutdown(struct device *dev, u32 pas_id)
 	};
 	struct qcom_scm_res res;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return clk;
 
 	ret = qcom_scm_bw_enable();
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	qcom_scm_bw_disable();
 
-disable_clk:
-	qcom_scm_clk_disable();
-
 	return ret ? : res.result[0];
 }
 
@@ -1780,18 +1766,13 @@ EXPORT_SYMBOL_GPL(qcom_scm_import_ice_key);
  */
 bool qcom_scm_hdcp_available(void)
 {
-	bool avail;
-	int ret = qcom_scm_clk_enable();
+	CLASS(qcom_scm_clk, clk)();
 
-	if (ret)
-		return ret;
-
-	avail = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
-						QCOM_SCM_HDCP_INVOKE);
-
-	qcom_scm_clk_disable();
+	if (clk)
+		return false;
 
-	return avail;
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
+					    QCOM_SCM_HDCP_INVOKE);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_hdcp_available);
 
@@ -1829,15 +1810,13 @@ int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
 	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
 		return -ERANGE;
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		return ret;
+	CLASS(qcom_scm_clk, clk)();
+	if (clk)
+		return clk;
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	*resp = res.result[0];
 
-	qcom_scm_clk_disable();
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_hdcp_req);

-- 
2.47.3

