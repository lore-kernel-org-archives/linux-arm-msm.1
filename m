Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DA7439F8E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738231; cv=none; b=Z4TVFGeFHwgp6lplktmKAUC9iTYP1HDfINAJ4A+FzKgaVZ0aA3xePN2u4qruJssThIL4R0cVdqUtPmiN0iclLXlEdf88889JQi8Zpf+62RH98YIelJ/ZWi/o5QT3/tNerUdmuG6ixk2hXNr0yeeX6gZmrT3zMF7Ez74utsco/TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738231; c=relaxed/simple;
	bh=RJA/UEi5fCKfanbI26YpCiTHwb/5qHZjiE69M59ihlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gsBO+nrp3mnBvXjiWUFWDIbFk4yrK9G8Hqa7lybt2dfnpOwtI/VSwzM4Bc2kGKAmmII2UNlLXVrjGG5pV3A7cNmxILQv/gFmmh5DnUw5yQP4Xkudkv6vzVslCfkxcbMdfj27UO4TmLrJPzgu1ChQd7hW/aJZ7UZHMLlS3PbT+/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTYoyUwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1Qohkqz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTYoyUwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1Qohkqz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFY9CX1043995
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pxmeyPcW8Nk
	u6Z0fAEYSy8Kkx/4RuUXF2wcZRuxQKGw=; b=HTYoyUwAShyCuvGO7gxbUfHqH/S
	Bp/v1oToSM/B927hTnDeYotast9Iykrto8ufGswo/81nqP0T36ohAKU1jn5TGHrT
	ACMOLkuLkv2sVZmimelqapRKdzGf/R5D2tFK8NDFn7llwBbM+IHlLoOxtxyOnDEo
	QWi0ekzGGm0VJhnMlDr8HX5FPVxPQ04LFn/CJEjYAFOsa8GU6XH/B6Xu7byie/2j
	4S1km6tKyrXjPBs6MyL6/73/jG5axDvDMVo5sB6FByo3TOSYiocIQAHrwKAd5ln2
	DOUynojY4fTPalGKpGHr7mBkclMqJhXFC03YoIbkfIjSC9Iuf4DgWeSOWwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4u8gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 16:37:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so29011671cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784738228; x=1785343028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxmeyPcW8Nku6Z0fAEYSy8Kkx/4RuUXF2wcZRuxQKGw=;
        b=M1Qohkqzz9YvecLrXwVahzXrjR7rOekbgY1lsNlsL95v+3zgZjhhOhTJv/gMBPFqvM
         7S5WeCqFQxBMFv0pdGTrfvOiiEGSt61kg7UJN2Edoc72cwH/DeA7u7FySpXq8GCaqfac
         TptvR6Ajh7NxSiwqSlNowQ5hN8+PZVEnVnKRzJ4WXWZcJBlBhdDq3zsHo4eujFibJz7M
         89o+WbPWoGdFUeBOInEX4b0A3+IC1OEJp92oTFDT/HBeGApKqFFGX8XBvOMCwWHxdbg8
         +quwNTMvs8qQYq02QDnKT+wi1m5DJ8OyQqiUItUrE9C3JjRzua65l8yrBx/8FwZQ8u0A
         qBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784738228; x=1785343028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxmeyPcW8Nku6Z0fAEYSy8Kkx/4RuUXF2wcZRuxQKGw=;
        b=Y4chlqsKGoexbzYxU3woxhRaTntMb32gIGcRTWxGnL3CuvD5SRoQoclHZLCmcwshbA
         ur3LQw33sMHGemjuSVTi+5teJ6h+5gIHATIkQWC4UfFGmvVhjxWwHdU16i3tiJg7EtlE
         ZfgbHwwTLa1DJTnccwwDpwAKAXc8GhMBcv5OznxDMuiu4TWBH3gA2UD2dhqN573l8yMA
         Lt9NMVOqXEV9COodlvtupW2WRfn9cz13m+np54XMtkdgAbmCO4qR7rhOCGZmzrtDhEJB
         4TxjdYk6eVBjENebwTjIV9FPM4c2sFXc8tBlW51uDv5BMXrfED1NqzxPLZRJvRByJxXy
         MeTw==
X-Forwarded-Encrypted: i=1; AHgh+RoZtS+PJrfKxrZo6GJeXbdOZelwGVtodD0wMTtmFmm0StNEn6xdOj/STMVvbJhvQ5iH/ooHPvnVsTSVyjx6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp+plobwv535Py3jZI/HfR8494a4+wQ6f0TUuwVNgAbwTtej1v
	hMIpKm0JKzLGRyHMGPxNJcg5uu2IcJez7LkNnFstMrl0Qz8AZFg39yxUDaZTg1wD7QtSPUFOD0a
	F/I8oFT+n1cJ4XWfj6/6z/9ejboDGLXRdFZr5r3PhDJ2aMtLKI8z1Q9hl7m1/mTWok5LU1dOtOD
	gP
X-Gm-Gg: AR+sD11jA17VHi1FfF3jsCoVt7h284Jqf03DLpStEx2tOtTokDPiGKlx2Jev3YnS7yW
	K1oTEuD0DOT2zfTtLPpf11WWWvNeYq1yBYqVZXgerB4X8NCybVUMn/Udud87DHpA2ZvkE3AghjH
	L7GYI7Uu261oAVQdNOgBlnVIxsLMW58a+V8MYi9fg8Qxct+TknC/1V8ZmhA6uzfK9l6MSrVrK9X
	KknrmQ7JFFcU/TlBiu7aPyCFM/0Tt7TKI6fS7nuacHt11UEgUFtkau/UHs73t/smwH5YCN673Fc
	NgtFVtFw5Qp73sywTbkxlijfkJciNW3D6mKeXx9XSGCN2drqZxxhgUP219wQlJIG86nV0izEq/c
	Yo9dVqdeni5sFUtPhPXlH+OJIdF9SDDqk+QZ7OHhYs098OpdkgzAabqeVoLmvzVRA1n5yXmJwdg
	Hv20uThIxfUBnTWfE=
X-Received: by 2002:a05:622a:834d:b0:527:7112:a5bf with SMTP id d75a77b69052e-5277112a732mr48320571cf.71.1784738228253;
        Wed, 22 Jul 2026 09:37:08 -0700 (PDT)
X-Received: by 2002:a05:622a:834d:b0:527:7112:a5bf with SMTP id d75a77b69052e-5277112a732mr48318771cf.71.1784738225384;
        Wed, 22 Jul 2026 09:37:05 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34b9b064sm1301150a12.11.2026.07.22.09.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:37:02 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] media: qcom: camss: Drop icc_res_qcs8300 resource table
Date: Wed, 22 Jul 2026 18:36:57 +0200
Message-ID: <20260722163658.409872-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nxgt7BuLSHXyKWH_tQZKMb8-4d2pmQEF
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a60f1b5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=4KIXZSIjKgV3iKP7xusA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE2MyBTYWx0ZWRfX71tNC7W++BwO
 hkKD+Vvp2qIZt6Q251nQv9AnRlUAEnsm324/cIZ1wATQD4ajVp9CHvZYcBAPyv+hYGzuH9YJgFl
 Npklps2vshCO1Czq2RpjzYJ35sIqCt396d9es+fuTEiYBPwwwO/suWMMMjA2wk8wYAY8DfmPKf9
 +ZmuflUu/meFOzhn38YyjUU85uuVsH1vHUh6nX18FpUmMrVjGaYMrUSO1+8HkZB5OVGECMVkIeU
 qasGoQxf+5kl5F5KG22bd0gEtIgvAF9JQh81gBsWWLobyu6gpyavu6DZWaFd5IG0YWcVwjv+hcO
 yNd9iwOsCAWhraXv3V6O/I+aJElXY4PqszKOSt8mU8Om7G/c3x5EgjYK0344grJvUTo3WyUOIZU
 bONYSSrzSpVfSH6XIwHNhq4jRm0s7MsT4QCfwXtORPFCwokEbB3aYYUErfJ/0i/gsWwWBtnYy/D
 C+qFJtWatol/v3xLjSQ==
X-Proofpoint-ORIG-GUID: nxgt7BuLSHXyKWH_tQZKMb8-4d2pmQEF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE2MyBTYWx0ZWRfX8jxcoiJrki2j
 MeFQPixH3GhJ5gBWSOQT8b3FD3VQNqCnZzXscRWeDbSZ+k5OeGKcL3Ygk6ZWSWyjKWq1zz8gzSU
 9iSMS2BrslqiAeKUXzAqd9TDsGn/mzM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220163

The icc_res_qcs8300 icc resource table is identical to the icc_res_sa8775p
icc resource table and qcs8300_resources already uses the sa8775p resources
for most things.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3efbf2fb4472..477358dd39fc 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4161,19 +4161,6 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	},
 };
 
-static const struct resources_icc icc_res_qcs8300[] = {
-	{
-		.name = "ahb",
-		.icc_bw_tbl.avg = 38400,
-		.icc_bw_tbl.peak = 76800,
-	},
-	{
-		.name = "hf_0",
-		.icc_bw_tbl.avg = 2097152,
-		.icc_bw_tbl.peak = 2097152,
-	},
-};
-
 static const struct resources_icc icc_res_sa8775p[] = {
 	{
 		.name = "ahb",
@@ -5573,12 +5560,12 @@ static const struct camss_resources qcs8300_resources = {
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
-	.icc_res = icc_res_qcs8300,
+	.icc_res = icc_res_sa8775p,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
 	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
-	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
+	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
 };
 
 static const struct camss_resources sa8775p_resources = {
-- 
2.55.0

