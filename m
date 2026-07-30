Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9188F411A1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455323; cv=none; b=J+xNZgp2dtmKeBGWKW4gb5x1zBbA8TmptwJU6TDIifYQVN4Cbt0QBAiuDS/QS/EbKMQv+9+bB6v0vbDUR/Xb6hKBaDG4tx3cDiLdE+W9jcA1g96Fi9cY5afJMTcX4Iv60Fv9tNYVwcP5eHuWo8IwAA8RKqjQxTYArbxjrL7Ly4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455323; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S3gYj222UMdsliclHUCYVuU9ztFtrfEDFAPWB/2Zux4QnWPYhKPbJtq+E/P+Vdw76zM201Vr9IgJLqM96Dv7EQzrpz7cSsWvN9RsvOebyTdnbfnVRSuiBOB55c9VZ2LVBMAxSAUa9tx0gI/XsPKsjRxTlRlpUD32hPOlqtzfJIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGrdyrOG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/2uB7px; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGrdyrOG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/2uB7px"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMr8BA2121221
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=hGrdyrOGBLwcRxLd
	IGSUribNLUqfByr9XxBMVMUGqI1gyqzCYF1gtggrtXjr8xmBvPsnKsLuiwvNVffb
	0TrjMYPJ9jvVNigaXEvj3fytJ1j45b/7CVUQ71fHdbe4erl4G/LdAfW+mPLBWlnO
	BxpBTvi16EF0HgDcTaxWK2mOUki1s1r9Z6aDl6DLLHym9HoSBxX19DI5GulaUBMp
	Bvy4KmQS4128PszNGFt1x0jFdw28waNPMjCntl86eYqYXrAfeHEjLs+fogqKWlE9
	1m2v2St8VCdLy64Gy5O3sIZl7aqB+jeHfbp+AdQ3Lt5Epy/Idi3ypgtnmzrSm1KP
	Zdi+bw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfmr05kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1c7f135bso6087651cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455320; x=1786060120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=D/2uB7pxlGCoZbEOsfGtpKzP2c1iUuNF3Xc1FRCmCpUqi+yl24zILQmHzTVDUtU4Du
         mfh5RnHAAaAP1LLDaSjOoGwIikz7Y1EmmY17/AwdlbUylsjaykBFE/TX3D7zNwTgBKI+
         WuAxJ6CT3Sy2b35Sx0B90G7+uxXJFnA9361sACrlNOhJXzJ+9J/yiQJePxwjefm+iu1A
         YsHWx4BeQfeJXv1nr6xoiZR2VEXW4EdC5jr59spqCwOWIUwnSxrjXnkxn/Mh64M7/ZmF
         bw6LFrlZhSM5hPTLRZEhsngB0USGxJE/0oSB19nP8/mv+1/2EJ7xTiZxxK1erbhBal5c
         Z6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455320; x=1786060120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=LQpjtxNuDqk4g+Dq3pQFfLGrdzhC8qSV6PoTodvZ+The4EbNDVYDWavITgG3IcPhy2
         3T0ttgA5zEMpr26Mpi/436piy63xRwl9Y+oKwue5qIBgYE8m1uhVYhLTFM5koopGDQXI
         BWACTgyZtesL/4Bz3XSOq8aFysBQpX4HaC7pRJO16/cpFv+4mEVtleTdk9dondwWCbcP
         Uj3p+dKAA9oWCpmwxOv2wqSQphRko9he9TiluGM4EETPx0JlHUhlDYGsMInBPBbZp6Wd
         n5W2mKZl2FkcSflXE4JN1rBWw2JWjCQEhfjnxkLwEtw5Vjz+94zhR4bl1bN5Ybu2n6de
         51eg==
X-Forwarded-Encrypted: i=1; AHgh+RqVDbTs0eZvRS25yBDQHa0c8YxyMaEgodupxwUByvNd7CkK/NTMsNLKAQyPSzZd01+OPmvSL9mBQe37xvaF@vger.kernel.org
X-Gm-Message-State: AOJu0YxTH8W8vJmpWjOO/B7BQJvpVPSU5FpZQ5o6qQT9QWmmBW2Y0/QO
	lIVSROBLOndEQWTkZttPt5aR1/hI7lPj1QHEhEh0wA+JuKGHNg0ynQKHfxVg8/lbkKbtAVsKvVz
	lTUU3UzVx8BwAAbFececND2JvQ9Kg57xAdGdT64rHK6G53H1xBFX/WaPFgnnGeofKxVb/
X-Gm-Gg: AR+sD10bs+9Ud+5hDCi5hYhK5AugD+1NDEqLcEP98O+ydrH/130uJMD8OwCxOJ2vzJ8
	QoW6FORbltPEo6EY4G8URB4UnkIyqI8QXOahnNFuMfqOkI4anWpcwCkyptWDRmkw1/ChQWWbxyz
	D3Pwt2a66zqOa9iK+anxr6C8KRjzFNd0ZM0ZCiZy/3VV2K9VD+sfMSUghtWAV3H6lVDuHxBLfhe
	kDXGGxWWyNMF2xcI1+YIkBxJhiiCeolpE9/8Zx0iaukYAUiwwI6HDHpxWeT1xYE4Oi/hAlIvP6j
	2zJcCViFjVW9CksJVjTwktMg1BCIe9fv+mzY92lvcQoPE+40KUbQlnP1kZ1ZkmPly1rMByoZoA6
	OxmE/Hl/hLBMUT1RNIfKfbY9yu0LNfwGan19lZGFNqCvR8vufHcP5DN6+ms7sFw5BNbNtMeoScH
	elunzIIcdRQNx9wA==
X-Received: by 2002:a05:622a:2611:b0:51c:257c:8166 with SMTP id d75a77b69052e-52b384c3ab0mr57569251cf.33.1785455319655;
        Thu, 30 Jul 2026 16:48:39 -0700 (PDT)
X-Received: by 2002:a05:622a:2611:b0:51c:257c:8166 with SMTP id d75a77b69052e-52b384c3ab0mr57569131cf.33.1785455319257;
        Thu, 30 Jul 2026 16:48:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:24 +0300
Subject: [PATCH v9 03/19] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-3-d71a782001c0@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LKqIP3rXIJpdK1F4/DYlNSjb10J2CiKzkCP
 26vfq2iGbmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviygAKCRCLPIo+Aiko
 1eXnB/9rtGaAUpkLSqm2Apz9FksXprYCvFgna3L97Qo4WnL5wZb02ctDTinYSnQ+X3PEzBC9K0p
 aa/ZT4BaUhi4vWxQcpvS7hzE2eGsXF6/hgUVn2nQU/obzmh8/DjoqzLraJCmqJroL3rNXG8Czxu
 0FIfYR7KuD0oqDoP/uhRGtMbKmP5/7Zy2CX2pNVgwAqad0rbLUJL212zxYWmjqtVJJOsVi0R6vd
 XfAXPFrWwaYiZNZofTRob4lGNQdhDWZcKz2PWupnbJgf2hru1LkaV82ONQ997MZDH2eqC05legi
 0JdQLgEk4CX9esFhhXJNvZKdr/z+lZE1DLuJxAcFfdngNLI3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX+d9SW9o5qWIS
 m9q5Aa/ElIovgKzJCLqIekzhNOf6qTvj0sMguxtrGtCDOSoShOv0AG3A028gHnUxeW6ZB65IrfP
 rcO0VknqYcm+Egi21QsAA+iaBLrG0luEHxmhY8wsZ6nBOq00lT6i95NruCSNk3AgWXf1Vmp214u
 WW562BMKwVk/AG8b+ts+RdX1eU92YoE+m4Y3Pt9X+q6lLr41ip3QsaVTVJ4NLu1SeHRT7RTOGaA
 UjDUsQaFlwpsCxv7uH5F1zy3ty3e/q5V0yHHknIga0ZfgEE/ki9z+sPMnBhS3oJUz8F3W0NUwFH
 Gt1MC28zsd4RbnICPhU8CWvrOnY2Gm2iDQKsWWvDMIqs8zcs4A/PiLM6kpD9Fm+vgngHLP0U8Sf
 /E6nWpk8E96LTdIhjcftrkcumjg/ZuOyCVnGezhZO+XKMbaGrdr+q7KIP56ZAR6WUlNfqkTaLqr
 J7e9vf3M/Xf8IUWK+Hw==
X-Proofpoint-GUID: 8i7FoTNHVQo4VCzqD787m6SY0tF-laf0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX7pyoKrApPrbz
 heURis0zJ90IOjFGhIam4Srlts/K1a1eQFa+bdU6COwZk2fhziA1CX3QHb/HdbD34DuznoTBaUk
 bn4bhQfs3FfSXmRJasQGc6owFhz6CxM=
X-Authority-Analysis: v=2.4 cv=FLorAeos c=1 sm=1 tr=0 ts=6a6be2d8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 8i7FoTNHVQo4VCzqD787m6SY0tF-laf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3

