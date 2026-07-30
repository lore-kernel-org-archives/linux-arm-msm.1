Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1CA4119F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455658; cv=none; b=BewgJaIi3AbUc50k26WjhXZ22JkYs9UAode00qi6J3v0Uswk+BlODm5og87mIaICu+LaoQZWCXkpwyNm/3e30zgg6QXzPqBgwv41JUw6NSAUv9c9e6F4KH8ZCd8xygwm/BJZ8TrG0hnRa3nB5RNs3ijzaGKK3IHfHWyz4vk2f2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455658; c=relaxed/simple;
	bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O6fA1g5lJYUhAikTa7q+8cg3RW04kdlrwg+2EIfz+rWvnpbMbRdYGNzJheUTBAm7/32zZz5J7/nQ30lCjcETXnG+X6yQFVusuotVvSkomH+kdyQBj1QyyOJ/ta05yU9a7nvqg/mEk2KHADZCFACNIoG/TEuaRl57wcyCQMGfllg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrJmlbZu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kf09L0Wj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrJmlbZu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kf09L0Wj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMqrjN2203022
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=; b=NrJmlbZuuNRt3Y2Z
	m+YGBLBbD3dW/VOAmQBa1Njaah2WYkoDNvUqe9ZQRw1od9pLEWrLK5taKgRQ9JEZ
	FranFWVDNE51f6HxTuLbubC6uwj3Ek5ahwD2FQ0tLgKztgoZYLlY8emM/hvazmU8
	acg0GoW1VjIF/lKBG0uoWY6M+YXTZD6395f+zrh+5kBaW58JNSTgcDCs85h6smaz
	jNX9iaIHUxuMdICruqsrYB2c3K0WB4HpWCdaWqGpROINc7SaZC5A8EVoWdcWhXHf
	Yp7uXbE8lPE3mQqWDeS/xeF79WZ/RHPleXl9yofSAQLeZ/uqiFGNE1Es5L6ZL80s
	dDDLfA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frdjgrm98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:54:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52827090cc5so3047891cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455653; x=1786060453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=kf09L0WjBRBblCfAsD2Np52LQ0UB/yekaSbMom8/SbioOJ7PieRHiVbGd4IAhNRF8+
         ArRydEfQsWZUrkr/xaBUorQA1h6DErIJoeEhrcpHh4SlGFFc2rJlthNeM5q0WBGHegnm
         w7nk/PuxUi3oMZLpDE2jY2c2rK8Bpar/4/cgbD6He3cn3lnPJiuyISXNCIqvBkYZks5N
         FdD34mMEssdhMjl33fJhJs3mLltHFO+IRRlxSm+ReI1evDDyhwTm9miI9miZKZgeRX2p
         Zs3IopQsb1K6GLAFY3aj7HcNzNhWhvl6H0MAo364QiihbcVtrri3zTqzfbu53mGl20uJ
         BMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455653; x=1786060453;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=Qte1zF2ewUQ8+4mK7WNCkI8vHjfnvvthnccjg0qdk7yZ7lezp1js1gdMlQ4ZnT54XY
         VHp1sOUOXqDT6Bnkii11hLjJ/ezzp8M+ZIVfOYjXtMw/2BOaB6sCYm4vObiYDI8ZcOAr
         mn+/VkTi3hpvfSMWPpyyRh41QZHdkgeiifJ9+sxwa3afD0++o1MyGj6JsDwakt/Mc1rb
         AWPcF497BJV5dx2C57F9yiqKcIYfExo9vrNz8Lk6AyM0uL2kOD8u2Ka8AMVPWkhxIgU2
         DOCwrmmjQyZDqEe4ibfZ7fxwRRPOOTj2yIsEXKDivMXQQiuhQWFa87bC4qOeBqAAXg3H
         T+lg==
X-Forwarded-Encrypted: i=1; AHgh+RqJcLeoNHDdqDzsf9Fs1t6lXcdGMkvRkvACq7jyGVYoVCFMtFAw/GVfXOfjiMpqhoJcvgNWeVfnauCMIVq3@vger.kernel.org
X-Gm-Message-State: AOJu0YxCLXUdXVL7U83g/eH7W9wzxqm08WwQXWgDMopdNGgoFj9MhK3x
	pYfPiqaQYv4ZSdZhZBqEMIsp8JcgkZMVfmkFAa5dV/8o/yucl88XRD+bWkFFo2VJabQaMW8D/Lb
	gGs+MH2BAY8rzT/2KEaa9OuM+bG29vKhvqZPT8HmNrofh5r/aLMwo9Jg9BzdWYaS7+Gym
X-Gm-Gg: AR+sD12SczZy17TT0kKsj1T/I6dFTJYrrjtuIdMKSR+CFuQx6y+KOe1Pm5b5HhaaKyE
	cb6lRPORtQAELVnNqOe4rExepk+cpq43NkqfY3DpddjLevpp5jonyaBzBTzfcfujfOTGLfX+Bd3
	JOqsCXt7blg7KvZ3kXtU4spPVlo2ZOJvrvNHWfW3/s/U016Xws8qXe98qWGfRdaskwvpv4uTf9l
	EkF6W35EEAzZvu6R2K1age0f/RwtkAcFBfVtQXbA/MOTdewdN62OpZSN7iwalKrVoMn1HT135od
	4uHs/O7FiLM9820KjOabAO8oz7d+UTz54aL4B2OzW710iFdEkPE+gIaWiJeGw5bEUx5Qm5F48jC
	g8azuithIpS05X4XiT4bcinLRUIYlM7xbTdJh2J9UeocK1z+Vjj15l0QC8dzbFVRZE9Pzr5lNoG
	ZEVoAxo9dZ18AGpg==
X-Received: by 2002:a05:622a:488d:b0:528:1bad:a2a4 with SMTP id d75a77b69052e-52b424e2ebfmr26815521cf.15.1785455653474;
        Thu, 30 Jul 2026 16:54:13 -0700 (PDT)
X-Received: by 2002:a05:622a:488d:b0:528:1bad:a2a4 with SMTP id d75a77b69052e-52b424e2ebfmr26815341cf.15.1785455653001;
        Thu, 30 Jul 2026 16:54:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba855sm638689e87.49.2026.07.30.16.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:54:11 -0700 (PDT)
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
Subject: [PATCH v9 18/19] media: venus: skip QCM2290 if Iris driver is enabled
Date: Fri, 31 Jul 2026 02:54:02 +0300
Message-ID: <20260731-iris-ar50lt-v9-18-d71a782001c0@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873; i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id; bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=; b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+MuxTJ+JLL0cauK+e83kbe8RkVEly/9fxE+W PfFTIuzi3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvjLgAKCRCLPIo+Aiko 1fEhB/9+q8EAZ52a4Bs9eQGkJ9cbuwXlA5Ud7ToOq/x3/yG3h68s2uTxL2xmQmxbMx+7AIqlD+k gGgbCaJzE//rXF3OgH3gfy2b29ocj219agCx0cP6wsip1c/g5hIr0NkadTKCu15Ipnyc2xbnGnl zTqirGGyaF1nCm+uQwjDjvtsHOnh10tBCli1F7TydofZ1yDZCOINabFbhKtbpaoi2e8j+3lj+8F +dik6f4Q+iZXt3DNkOD5ZVpU/fnI9gDn8EwRQF/E0+q+bGo2MfesOL3BOymTNzTcouq8qEVvq8y ynfDEElonanJ4Ka6qppUuzvPpj3viLp4koiUlUGsS7FjAewi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp; fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IfKG7Qn-h8PeEH0QgC1VZbFYtxtRjlga
X-Proofpoint-ORIG-GUID: IfKG7Qn-h8PeEH0QgC1VZbFYtxtRjlga
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX/i+R07d644J6
 pP9Ru6cuqYJPMfATWRAvmHO13USw/gmNrxdi0mAuNwS5nbq7d0QUobYoRWImRHSLngRGUsWIACD
 ZLJnBaKAWMp9URmLBFdqsZfqYgzlve8=
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a6be426 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=4ldMYZ-nzf-nUnInMJoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX9dsBp1LWoTyZ
 h81UwBZU7ZvJUWpCAFZhHHJPamLy3pixzcZ9H3pW+6b8JjWDA0uEjhzGG7DIRt6Yx0PY/EY21er
 Yht6KtWPAR0RYfCmpvgKFcV4dUice6939vS/zMguVFfthBpXvsMR7b/jKlHoDIH2h62WGylhrKF
 8d6dgG5WgAX+L1qRR5EST4g7vOrOTNVBq0GuYn9NguN8ng6uIUgdZ53DT3ZdJyN+QHgOPmh6WLJ
 06pwvE/cnRUptJTeRQqrYnNbTiV/6+yxrnVQvGb4Oi1g0Myo3hIUzicOxLU3Lpz9bqiLnkfZuMR
 b4k4YoCtbf113LOUZ7Vw5hoXBbGXqi529dSaQTWIsrzzBHp+2eX00nwhgdknk/zwULPa/minU+q
 y4rUrwlOKUCGeffvjpGVS9FiTOrznXe0Mof8DYxOA3SDvgm+nbTxVQr1qPEs6M7/7GclfV0qAsT
 f+2MbGPP1BTeeSh1NxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300168

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..3c88594eb1d0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1118,7 +1118,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1169,13 +1168,16 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3

