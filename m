Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C525416CF4
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455526; cv=none; b=lUPx3tzjbpAZp4mwTsVZFipHp9RRRkDWEYrMj21BT/ulHFIVOPa/3CkPy9Dd1/fEoSgBPFRtF8LsebpfaV8cYUAzXhHsFbhBRP0sdK/b78OzotGs7ogGZN52OBeu2ne0OfQ+xwpVut57li4qSoPQ53dhQMO34THCp1oV1mgEvWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455526; c=relaxed/simple;
	bh=7KJFUkK3IqBdyfiDVBbWS5wZfeNsRT8SMeMXT0iYUtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W6Jtw4nOR6TP0P7L+lStXPSq5u5rUzXDc28hEoZ/yQoH/GBzyYPKBG2GAlXYMVOjTwUhQMJ4oQb8gMx9ceCq2VK64h3o2kWt1stoS6dOQZ6F22dwh+opITUPUe1lnLwLkG2p6AJHI/bMfq2hx8uzr5Coop8Gt8crdD3xUXgA/+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQDqIqiK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PS/dYtzz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQDqIqiK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PS/dYtzz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMr5fO2455410
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XgFBMuS+PB0NzgKzGKdztjxhr9r6FfGOR7K8XJ478Io=; b=lQDqIqiKp4AybRsq
	w4vvDaEHIj2depOj7nPvbYcirAGUIyN9xQfLHBozYDKGQw8a6j0S8FYorvilaIdE
	MwFNLv7LWj8WFKPer1oD8lCM8PP4bD4EvBlRY3oZtunMwR32KUfIMMFafDdvvaHB
	fkEB7jIGMCQ4EANBZ5UF+tK5gB9R9P6DqLVyOjmjDJaD/edwhPoLoxIBj3uI6Psq
	KRsCffCOWe8mb0ABGooE2MZzfFUEZ5rgJiLnn5Ti6+cusmbTI18ZDwZFb74kSsU9
	Sk+15UclF2qWA00ZXMWNFyKQdZdqfv9+9KzJnjRpVPECm44i6HJd9BD0ZKgLulBj
	9ESEUw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frf0wg91u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:52:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so3712841cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455523; x=1786060323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XgFBMuS+PB0NzgKzGKdztjxhr9r6FfGOR7K8XJ478Io=;
        b=PS/dYtzziKVthtKCYAUieP7uUei7CTqHd0g8dWoU1hQwNsa5YlQ/VzEloM/yJX//Fu
         VS6kEfe5G4ZX/I1eMSdETo9RXvLJhZ4HbftOvrGxVvx2cr0dOv9IQaQ1+mSDXe4fhEtv
         a0spz47DXjXwrTW38BpXbO6SvBxpdcEY/gR7XlYnjW4LwvQz7alF11Wfrzlnn3nu9wH7
         xTmYTu7xmIG+1PMZeQW0X6UtckJgGUMp9ncFDBMwmt79PgjVVKv89ToU4UOtauke7hE4
         ykA+uKVr/0uP6daaBc5iaHDh683GLlScS+13s65M11XXBr224mFPnFnS6NCtIAQcNl7/
         s8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455523; x=1786060323;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgFBMuS+PB0NzgKzGKdztjxhr9r6FfGOR7K8XJ478Io=;
        b=VBT0SiDbEpbX084uGT8q0to8wehkPXQJZpC97+kdGsOPMuQ3sXkaZiCB8IN9LC4kUo
         0TAx7+deVRGTCMDtEmP/akojiL61sQCBDCuFa9i+X5sNMQ8w0na2V2zebMtmu9ER89Q/
         fCavW1w7mWR/I0eYJG0PAIqvTy6WA6q+f+FYrVMswnpp7eClF65Cb9T50oN72ocLJ32W
         ZAhiixqM1HAdt8FOjqV2j6OR/SQFjzuJl8A6ZPBCEozgcruujzq8C1fHdZPH6SD0sSd4
         yt3uEKj8hhu+zkwk41JUjC4FkR1W6S8AUTQWmB9xQvixzTikI3NJsTg2qmo/9s+c7Mfk
         yZDA==
X-Forwarded-Encrypted: i=1; AHgh+RoNr+HXIyP3YDzI+HXpV2BrRLJnHEah5KGqFYRzj4CPgQyT3hKmcUxskYmt3z1IvmwfUDrq3jnjt5ZvIbGT@vger.kernel.org
X-Gm-Message-State: AOJu0YyhG04r1hCDuEuGIsJ+iER5dShfoOf/U3Oozm3355YD3PjLJme6
	vQ9Ysj6qORC9Y1WjdwmoMOOMm22nX+Bvxn0K7ae5tqhwHg0aGjvcGUIHBpyJA4GnXn/t6PmW8e/
	ajLNmOcMWDLUSnlobzNfD6t9FYba1XKcoYysahjBMlcGOiTxHHFMmrWhPerYVatgy4Iuu
X-Gm-Gg: AR+sD11LRBGCHzBPZGU93vKiiYZCuhVY6cqcm1RtZ9BBEo527KlL2owN4lrBq1HtnD1
	7Z6rtDsJsovQglGvJ0viNMOibj4ltsPg4KInXb/d1LmZxxRyOEbXFHOwB9PABA4jOMmUDs9tnIY
	PUxePGb7T1heAWlDVwnWLjdXcrsexb/aeQrL4pMYJ3s81i5xvNIV0+tsCmxA7VnZuWOTqf/zHYi
	TA/vg0KlzSj59iUUyuAWWXFklYGDglJSjbbdW8sXONzMuVZ2l9yZjcvTisrDZxUXrpFaFN0+nJH
	TI4Bd1IJelHxcFYxBjv/qS0cQo6MOdgMQ8tEgCUHsC0es51yS43o/6oAEzFjEAT1KMdq6FD2wIq
	jwleCKe9irfuZj8MDPo1LMVLZYmpqrbxw7Y6a8yAHi+QPhWMOoenH3mzLPaeyZ5+lNofGh3oqtj
	q0OtWUgOl/zkSnqg==
X-Received: by 2002:a05:622a:164e:b0:51c:b91a:33fe with SMTP id d75a77b69052e-52b38700b8emr51649091cf.81.1785455523388;
        Thu, 30 Jul 2026 16:52:03 -0700 (PDT)
X-Received: by 2002:a05:622a:164e:b0:51c:b91a:33fe with SMTP id d75a77b69052e-52b38700b8emr51648781cf.81.1785455522907;
        Thu, 30 Jul 2026 16:52:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db952f45sm613789e87.29.2026.07.30.16.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:52:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 19/19] media: iris: constify inst_fw_cap_sm8250_dec
Date: Fri, 31 Jul 2026 02:51:52 +0300
Message-ID: <20260731-iris-ar50lt-v9-19-25bbab43a436@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731-iris-ar50lt-v9-0-25bbab43a436@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-25bbab43a436@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id; bh=7KJFUkK3IqBdyfiDVBbWS5wZfeNsRT8SMeMXT0iYUtM=; b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+MuBlOl9n82gSaw7A5rRdOg6s6vZ0ThhgoXn cqdC/I4hNGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvjLgAKCRCLPIo+Aiko 1ZoDB/9shlctZEAYdOX7hh+LN1GFLylH8KEUBi5W88HbJCx91E/hyD3qZ0cn3RKpwC1SY2mXwZ3 Q/bFxzhMnQSUhcvGiX/0mJLago8Otc5iSd+p/Who4GxI2xLO9MJlr4mXtHk18hU2C626XvTMjx5 eu75KSeJZ+N/dPELa2oCC4nkh797nyEUWtwiiXWVfHWw2hUcRLkMOIWU+BGdumMK7Kaoac/+Ok+ qvu5O8FW+HVL1ZWmyZ1PGAt3LLoe2eGq1JVr39aEkohs5loALT0WHq87OPqYwj7Azq6KktBJTzN ED5Cz905F34YLSevy95JOQAySfi44oKDx1yExF/oDP59LoBv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp; fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX0Y0ObrYhmXN+
 UGbj4jn8uga6VI5ij7fk8XNYvuVY2r0hRpU7DyYeOlxcoe9YxX3s0VRgjGytJCvjwgwV4DXGUOF
 P8PuxMspBT4lnkt5rPZ2CYrcYP6b070=
X-Authority-Analysis: v=2.4 cv=T928ifKQ c=1 sm=1 tr=0 ts=6a6be3a3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: GJ6HrMZ7hZMTVMg8GxBHgN6HvLOQpxHh
X-Proofpoint-ORIG-GUID: GJ6HrMZ7hZMTVMg8GxBHgN6HvLOQpxHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX+Ckne7m7P8EB
 4Q3eBhSVRm8kkc3x8cKZRHvcrkVfJKdL2M9Dem9fgFeGsKblVtLWFb/Jj9hB4mGXpgLzMwGqDWo
 aY7lqXzYvYPdRdTaLZZxzk2z8AlVcKShcPcsWBpfIcTqC+P06SVgVr6gnAcpHvIFslKFRu9/fFG
 pur5w0b81mSXgJEYi0v/dqJWVl7wtgsiwwjU33T4CSpOQBWVp6OW/46FSJGq5oRwAr3XG0Q+up1
 k4KOwG1x1AaGpWhTD4XgwHAuD67a6frfCzvzlqr8PLw6wJuTqhFZiY0xSKqZ0R/hcJDPSgFX1DG
 IIkd59XWF7T4JCl8+i9k3BW/zL3Ze2Ls7chuqfpcFzPlvBc+BuecWbThvfBubYow/ljNzn2FAd+
 i09dHnNqTqEXhur2PEPHEIZcK699D1iI+VdBth1aTMSZgAO6mgHlwPGG2rUJDitysaNoobtk7V/
 xlsF3V9pE9nsfVsgiDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 548609315b85..1f87cef986ef 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3

