Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8212408026
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455338; cv=none; b=XXx1rab0xwUypfbY0ZUfNTwdHiSOBUoCFLK7A62dqF5o403gWJIwNt31lVb5tLQbZNYPLUE26dvP4PVYYMbiwFCnJOc8VGOBt37JYXaLcaXiwwJUKmzQsDN+jFy6BG1deVXNlXMaegto4Fwc/63MLwrHJH4L5QlqxRTH3t7QrpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455338; c=relaxed/simple;
	bh=hbMAj1Jtog5/mdC3X9nKWxXuxrcta9axgsc6lLpIR6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJ9oAYrIsCMrJ9BVMAV3aswr32XBtrs9+zFehaElwR19mea3uZ+unghWuIM+aZmJV1Oc2igPgImYmIrO2/OvnHHbSrQkDz+vf/U4fCiHNnx7eRXHqKoqAFfw6og4KCMq2nHAsuMMP093lGl+UpR8tmb7FuzIBbwEYIxpqUy5CsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMyruUs6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8MIHbjt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMyruUs6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8MIHbjt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrt9k2479352
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwMZlMHsuQHU1UftifWPcDYujlD8pisCKUyAh3gzrqE=; b=CMyruUs6pSjVleig
	fZUeC1QfwymVb/x/tMjdLzbRNXmY/SySMkHQpZdsoAkqfut1HGS6tCVlolz+B2tL
	P0QZvIFctKG7vZxXi/jvkRk0oVRO5rG+xqOu+ii0vJGTkZuWidXoFm6SnPfrO0VL
	nSZ3214UVQU/3c3vOSzxE2i47JgWDvtDe5nl86q+v/S7pw0sZvrW6hQGWViEwIdE
	md6IbodAqbjjX60oWOiFI7M6TZLUjlfDgTkBI9DfeWwf/xC/QxCZu6UZ4iOmzL/x
	9Mx0z+41+J82q2X7yRQL1bGR4qNZrFMKLIgYX5pekQan4QHVUoAxJJLUEkADYR/L
	k9KR7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfpfr4tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso3679971cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455335; x=1786060135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwMZlMHsuQHU1UftifWPcDYujlD8pisCKUyAh3gzrqE=;
        b=c8MIHbjt+FBPDNpXY4boFPMJefCyCzP7Ryf7bKV+YEjs6XVUq8hXW95fyCI4T1vom0
         LiQDRY/HmVB+z3khBw2mSJtxa1ltDrGpaGX0g/5sliXk+HacDjqQNL90baOComG0DBiy
         92Q6BbkyT6c4hc3yU1OzZnwpBa/WkDjnj+bvjTDDLvgPzQOEWSQA9ZXpfq45RwcWjUfA
         Hn1Q9D28s614Ufrc9FVsldCqArdm+8XDOm4pM1dPiU87HDgclwnCUKMWu7cFmdXqZ+y+
         pgR0+Il1QhhpT04Fl0LUt0aolRfszATAzmMZL+OuCY1VTxECloA/Rh5Fj9avL3VQu4kG
         E8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455335; x=1786060135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwMZlMHsuQHU1UftifWPcDYujlD8pisCKUyAh3gzrqE=;
        b=W1o9gg4A+TuiDa0ywo6XMOBNZ9rMigwoiFEfXa4F1n5mnIIvruheOR5uQZ5W5HjMbv
         bKfK8TY2uFVGXPucALyuN2V8mc1/94Pmb+mtvRmPicqC45S+6aPN8+o5FzgQe09/VsAy
         IVNpIXvgnVs1gK75+Y7oA3RXhNdHK5qkHA7hgfRmLPw5zchrtoH0u1PUV6REA76+IDV9
         Zu+f9T5CjtCngv3eUIxZJIy4iQAC8DgCT4/n05TfaPTcYIqXYpKclDGVQf/ybG30EyRc
         qr0GqcQfrjMgT8TO6ocZY3cVmd6qH/FFOnCN0u0q8+ieuS0OTZznGtZh2ZUwpEDLWcI2
         STAg==
X-Forwarded-Encrypted: i=1; AHgh+RohPiF7AwfYQ+8x2h9p6t8qkm+4dxL9jBZKmce20Bd87LxCuBmPxn45rZa40YdVdMS2j+RxQqCAa1qfvKR5@vger.kernel.org
X-Gm-Message-State: AOJu0YxIrtudx5b/de83BVg21VMiwkS3nUsdHFPslnV2uXziO3CvcWb6
	KUktYfb4semqfdUB9z5gZvMJhDjSovjqLZra8pQHc/YH/npmlpJuRse/FRwGyfoSqtHsvRkuI2v
	G4yzU+Y2HMEn2tEnIV64trJUbcBhZo54hkgYt3ANhysHQh9NZRr6V0I0EVeiIHtjGrqUw
X-Gm-Gg: AR+sD11fMI25MYr5If74SUHPm5IHsdyWQHhZPCfEGw/oGryfuOylOSZgbg0PxwAWQtK
	MlNeRUrX3fhE9BaPkzJ13fg9jDBDd2FW7wlec+1227V6vLbWDrKfyzH7DBTnPpgKV5Cqo1pLX+S
	IjHHNB8UDsGxy7YVwh8ZZxFhvaF3JIQ+ssuy0AEWrgZJiOy4sOGj/ZDuuSwGrXnAugEqaiJM7u3
	MnMu7C98uNlkG0ifOnOJdd4YD2XuHB7knfeUnQ4uF0l6Pkfen1owhJ4Dpits18STfsG5N1RTXLX
	sWBdF6fpWCHYl0U0SI8cEt41KYYCBdVdeQTg9L90B4sJ47RRn3yqLm47kQQsvOWrsIa7UVp8a1E
	BBDZMbrRnKWCq8QLTOTlQtr4XspyZ+5vqbWoXpr6wPI3K2ODLIZy1YnEO7bKTfIv6MBvPOl0NsP
	p8F07ctG8Rlj7vaQ==
X-Received: by 2002:a05:622a:5c15:b0:521:5c5:f986 with SMTP id d75a77b69052e-52b384c918dmr49314741cf.33.1785455334823;
        Thu, 30 Jul 2026 16:48:54 -0700 (PDT)
X-Received: by 2002:a05:622a:5c15:b0:521:5c5:f986 with SMTP id d75a77b69052e-52b384c918dmr49314531cf.33.1785455334440;
        Thu, 30 Jul 2026 16:48:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:32 +0300
Subject: [PATCH v9 11/19] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-11-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hbMAj1Jtog5/mdC3X9nKWxXuxrcta9axgsc6lLpIR6U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LLWJdVGnPX70QBCdbtc4J37CKRjhhzwPzXb
 mi9cnYmK5mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviywAKCRCLPIo+Aiko
 1UrmB/0T1YgXOqC06R513be6YkDazdHaLEe2RxP1Nu2SZxpwGibKiuwVb3yntD7F6oHWgQBx0qz
 IsXu1O68Aq9HihFJryCJxjFbTlOPJaz2dB7zobhZRVn3m7dtgQBWT0kev63BpqrOxw34UyVFZsA
 bjAKvA+G4LcMu3z3uctCJOelF2itS9HmgTkM5/hXII51OQMj+uO7Kpny2tjCtictZzCyyhYPUua
 MDraS09AWrQaxT1nvNyvqf+zy/MFFeMn6TbQo6U58H8R7TKzXCGIoAaaQrkmP7HxY6EDfhaYYrE
 fn/e8YFoCtvxK7H8gwL2Sh+UOWPGIlNsrezpeIjCqkoM3NmC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX6G6B646CVHpL
 xjm5HQ16+ZyC5kMT6Py1rbF2gSbxudOcVuQ5QR8K4YX7nZ0kHLgAR8u1Cgo5jMvlC/Vh17DoS5l
 Qm5G7pCyiOewudr4vSFp/F1Z7rkUEnaP7EartlFqVjmTXleL4+ixmrrW0ecYiUE9lt6H3XJ/5CP
 QVv4dPq2ktFf3470z8rnLCHQqPkYyOTcB9VdulvIwieIGyVbc5zBmGbNtCGI+qydy6z/tcqvcLw
 r+A6ekSVmbLd+qbifYxXkcrJccYtpl5Ikfw5d5UryAKFB0WV9bklPEjpvm4NCro9iPPagDrf0Rz
 ARsO32X/CTG1WklYiE3USasspBUWiChDq3slDcsNDmnoGT7MgMGJ0KPRO5vO6U+YZYo6xaqEQXn
 1ijI5gTdw0eV47JL0E2M9g35JuIY39AE6mQFSXCoLwktqAHJ4mz5CBGpDcAd0i5uGrG5bRbQJGn
 Rf91G2ip6MSonGjnQQA==
X-Proofpoint-GUID: fqFTzOc7fZni-5_cfZxXTk8VlbAx55XE
X-Authority-Analysis: v=2.4 cv=XNEAjwhE c=1 sm=1 tr=0 ts=6a6be2e7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: fqFTzOc7fZni-5_cfZxXTk8VlbAx55XE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX9juIax5raJhI
 mczWekTTF5sfm1mpPz8I3E1vMOPU3RtIQBcmEeYO843WzF+O5bU33XYMr177EbmNIK8ZrZYfdI4
 /k4axAYvsns/rG682xbtLwJF4Y3PH1o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index bf17d310eac0..cdd02328cb71 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -538,6 +538,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3

