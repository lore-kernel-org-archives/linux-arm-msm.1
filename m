Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4193E45040C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424894; cv=none; b=m3OssxWz/13L7PAMsG15k1JTIUK9x/HfznLLfNugYK9DLSjHXxdPVSqxGjAfl1ygT2m79JEVNqO9S3cIFKWEpULls3TReijJ5dn9iVww8K74Ywr/M5P0C9crEewZkyBIvJNQTzPfTNoWlzq2R5ACLn/oqx+A4WVOnyDZzEDM6FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424894; c=relaxed/simple;
	bh=iLrkaUGF2kv7EppzouCmtz7uCkkhgBRWggynLlAnH5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jrh1G4iAlZKH5/ceC7g87xjD/cUjfgXlG0BNEWEdThpNnYrFQ/eTse5oWE1CVS2JW2bKsJaYh4nsHLb3vz9AXQELyJnvJ/0iCTTzT2HdHLL4oIRgcWDhyjPQQB+h9PFHUj65Q3FzqaDLURnYYX2bwf6/1p6rjZjFUbnw9v64JOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dlbO5hgg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FL4EMX8X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dlbO5hgg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FL4EMX8X"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEdIdk1110011
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+lonAlJlcriw3pD+O9BnHyN+0SzW0bawUl95sO1Qeg=; b=dlbO5hggWbiT/zlU
	OJNSkpOpBuiO12wTMs/KXDZtL3eRgGUmvE2zz6Ktk7g82ex0JKRvUu63Z9OLx/l1
	9a4tZeNbOsoC6oi8hVefcKlR0dV7M1191K9e18kiqgux24lsRTxYyAiPSRfT3kpr
	b05KG6ZkxbZmPrNEnSNd6yLpLrcRslk3qgdVOqo/8xdONxuvysHbk1aSFtd6djSV
	85Kxa6WHix9fpF6mdyjQzqcdh0mg/uw2wxajMZiNZw7h1fhyAx7PSVZUs08vpMEn
	yIQSqzrxlToa90pREEK2YgOPi5csq0SWWRSGvsb6ohOngMcec5iFLZ+IRzC79Xps
	Zji0Kw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8jmr7t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:21:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a23afcbso23393851cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424890; x=1786029690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+lonAlJlcriw3pD+O9BnHyN+0SzW0bawUl95sO1Qeg=;
        b=FL4EMX8XHhsr595CBn5rDYaAepzkGJm6rOHbl/7NDVFJZa+l4yOAXNnhpIEFx8bPlt
         H1mBoXSJ28vT2qDE0hwovZ+t6lq7wSDpdlMKlBE1AbECdgaOZC2nUrPFoE7XhP+ad+I0
         7628kGOymqHZm2UHhEhYlQUzKcLEOXsKgaW+YAvwpjJzUTtoX7j0QL9KcFz6t0dR/NNf
         pIorLfUUQnYCCRbxS1MM1I60aPjYsFHsFxEC7eljQfggf2rY8x+P1xs5FxgUgCjgDAld
         8F9UnYRy4GCI9PbBiLYw2aFhziWz8B0BbXYxVj6XWTspE5yY+3XbhOk1n9/sefWqT/lp
         19Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424890; x=1786029690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+lonAlJlcriw3pD+O9BnHyN+0SzW0bawUl95sO1Qeg=;
        b=fYk3XQTd00lB/uG5ubeOQgmfjqf2QQV2oAmPKuHqyqV2kKRddM0pTYZXiSgIKe2cex
         HdWlTaifaO41DwNrb64+596Kq4sV51kwjxjFqNGGBMTP1t4FWcLt6uoUE1ELhWIGVFdO
         wo1twspvzDuyO+6MVK6EOG9AmWAUKlbNU7HyRPbMeZhyyWJ3FdbeJcaF+d5zaxQ/quNy
         xfkaWObebWH+oMcNERSEzPNFwehYlYufvG5eptuwrYFZ5mc7aDK5NMZVt/RQs5z6xW+x
         q/YK5rSmjHuj0GGplaB0ynxFGEnVfYNOmJ1QF0afhhylqlCZMmYAmq4+auUGESNSTFgJ
         K5TQ==
X-Forwarded-Encrypted: i=1; AHgh+RoO9/wv3ELuuEJhh2lnKwpAF3Rx/BbKnwBA+IR1wEPBNr3gea4TP3l2RPPTPy0ogDA/F0Nh1ZkfxkEA3pGy@vger.kernel.org
X-Gm-Message-State: AOJu0YzbOxTBOpj6/mOLqUsmmHrR/asvQ07q5s5EqeCQJwnj6YmRWAfI
	DbgOXvDTg8T/wejv1RmIW72ZRkVT7LhmSwLQVAU2rrl9lbtf2GCvVvdic4/HhLvOR2A7vxljofS
	CijMf2dyrHi1gpe5dP/yo5OqDPnbWi76CAC8aSSnFCRGfpcaHDg8MSMpbgQ6x8Tu7dLsd
X-Gm-Gg: AR+sD13EUK4YOV7VyoW6D0VdKHR5HWJeJdASSv6CgWQ5bI1718OHfVfsDIedq+Yc4MJ
	hPULzxIrxosDb/ErpbzNPEGOnC2BBPst06BOacjB3Z2TOGu7Z7zQgiyv6RN75BdW2u/qd+iXQrr
	R6WXw3wvfGTeLiHl4PkC2fE+h2BQu4wabVXmUY90TK91atcLrj0xP/XniHu89MLG4AHT162IodR
	ianKJqgZSj7qZ7DOS8ReU2OquuitzupM3MhPPBHRBbV3Wpsi1kgIVRSxYBzSNfmDlf31Zl5zPpB
	agd6UIy0rsm0Ybws5/Bqe/g1Yl6Y3jVfSwk/XHWe2Ge87hiVVIBIL1jS8e4IMXm48CaGdijKjGz
	alDGT+0z1MghkeK4q4plhIByjig9qo2gxTckxa33kFp2MM1BEozlhyF7dVDvziQxttRRMOtL2nG
	5ae4D3honCK3K11g==
X-Received: by 2002:a05:622a:2515:b0:51c:7b12:1205 with SMTP id d75a77b69052e-52b386e3c79mr33732591cf.83.1785424890166;
        Thu, 30 Jul 2026 08:21:30 -0700 (PDT)
X-Received: by 2002:a05:622a:2515:b0:51c:7b12:1205 with SMTP id d75a77b69052e-52b386e3c79mr33731911cf.83.1785424889452;
        Thu, 30 Jul 2026 08:21:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:21:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:21:01 +0300
Subject: [PATCH v8 18/18] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-18-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
In-Reply-To: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iLrkaUGF2kv7EppzouCmtz7uCkkhgBRWggynLlAnH5g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vTsUV7LmuZ9E8hql5wplfmmY9zUwu3DXEqk
 F1jk3qLfLOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0wAKCRCLPIo+Aiko
 1YxyCACT4GSTZ5bsenhLNyp/AwiBJygtjvM1fuJGGmeK9A2MKDAFzGDGDjgr0PSMcOAB/rgjO1O
 k67A7zycCOnadRq0ivHPM/AhgyPWZgvza3xe7j+Sjxqt8e0I68vF7g7xY3DDJf5SA61LGUM6o3Z
 V5RI+AeObhnBHzssJLIxR5JUl52QhPnobb7d7ZQ5GCyyCt5moFRGSwbCXL7vf4TTknEYYszYpTF
 WWRCs5SKN0T874nb7UBWc8RCmTlneBUXljWb78jF3y8MFMW+OH1zqvsLL8yZeMdr+hY/0tMq8sn
 d7hQ4xJHlKy4pyLnkdbyozhhVenlk+grBk06FT5spHD5a0ie
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V4tNF+ni c=1 sm=1 tr=0 ts=6a6b6bfb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: dja-AIrTlwIb22DAVycDFlTA9NyDMLuN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX3e8CcWCnNAkB
 vOzkWVZqXrBJQcyQ8sTt8XHS1W4IAXpOfLiVA5wswHL7koUc1oekmwN3P1fiF8mQPwIk1/+OQvn
 EmVSftU5I/tUiy2B1YlWHzNboPm9Ogcb/LQYjRPQiHOfGL1y5l2Z1DTMQv6su2woOq2C4o3N0pu
 A6yvxEFIxMAn+z+FoEIZHD+WrLTTtTQFIJQ0/jC2PzYTZql73ymj6KoV2EldZE6OHzVf0jpKQZg
 ggUerFfHbL0oCCvF+nBv+0GjA3gIInUFf7/aAz5MEhU2YYDklCASXjcbI0Rs82Gzsm08Sfb9n0G
 4Co1UsVEM16c5thGYIwIJWyMz6YpkKbNtGP9+xGpJA6KLQ9I7Xwgclr8OQDUmsKFbAiYzNiikI9
 XDnZGJ9f1gfllaGAwCB2qj4g7Ur1z3rB0ak5kw648GSilzIzN5vTdU0vEsRmQ63sGa/rz5VreR3
 GkaYDjzOsSCVnINLNNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX47D6+ypGVBmP
 MP/4+7NzKX5YUwYaJZbBmZ+UFIdG8NdNPgogd/cLHd8p7VlWJtQ6SIN4pymdCBMPjwEU5aSO8Hu
 PO6TVcPhIfzfAIAOy+i0Vb4bPuhvFTk=
X-Proofpoint-ORIG-GUID: dja-AIrTlwIb22DAVycDFlTA9NyDMLuN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300117

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 020f55092737..b7b1b852d45a 100644
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

