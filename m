Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B718398911
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645932; cv=none; b=GMGerj+iTWbrHudP2vDrFEaZx/GggQ1LNrInA0aTC3S9vk3a23sKHVNv6B7YLanh8p6tRkQenPfVW08D94NjJ02sWtTSyah0drIyWUXhtd7GfqFSxgTdIDpgR7KLo1/8o52Ps+MpUQwK0U62a8eFVq41vwmVqdcXA19gl5ITVoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645932; c=relaxed/simple;
	bh=XceuDuLrzakfs0zugQBbXJa+oizwCWt+Pl0ZpC7HxL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlEv1bCdirkIzs11PXU0mpQGD0rMOkOmqokjSshjeq44ch75Qgw6g6uFV4om8dy1iy2wi7lobFgvy6t6Y+sqgzt03Jd1ZlJeya/7uK8qoQebWjqIq8qokVuPp7owD87+1vsC+/A5VvZpSDoCKGfofrAWPVQUZHX53FBgVy4PTU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDQZyP1a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2dXsORq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDQZyP1a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2dXsORq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg4Eo1912610
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+LK8F70ldltnOCivKw+ePZv3anat5mG9iynUsCcEZU=; b=PDQZyP1a+PemFjTw
	AQhSirae6PXtc2O2DukzeDWgNvycAuO0bHrzkHmSLrye89JVi7vw8X1lMdkd4EI+
	cceh01uxqGDQcDrCpWyI2CVe4FWoRZh8a4HmhW9rqf+F/b4/4bgohBvzOESHiVy9
	lhrjhfTVgqdU95qzXfXoCQ7C9EvNmIUCiBbynTq/AtNDB0qcFxzCIdeLxiGrWwOV
	rHub1ktrI+MP9fkmWqioGMWZE5LKKjN0CD8jGm7nFq+E1aXQ4pjbNf+wO16wfUI+
	A3n4e6z9MoteF49osiSBFL3YkZ2891JCQSKKJSF0y/Ir+pgIEM2dBa5ZMb6UlLY9
	MMUKvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duk0bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:58:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ebdfceddcso135939281cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784645930; x=1785250730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+LK8F70ldltnOCivKw+ePZv3anat5mG9iynUsCcEZU=;
        b=I2dXsORqzbGVhTvlA0NY40IgXTMvtoKkdGANY8/6p5IWvTfRv/QM11r6t4lVsXJ9ED
         F3uTKnUfrhHnDgBStCia1YQAVMJv5jeRrXeY7Y6jh+g6cXG+3MxznctpDETsxAdaHgco
         X9w600H5mM0osz2iTWkgHZgnEChkox0hPs6T2F+W4IJ69zB4mnkKqor+g95k8dPTzNTv
         gZ3db2xOCGqchriIvLT+O+qB1tN2WdGp9WnN7/d7KVozkpJfmf+mYf2EI0R87bW/JsIi
         3+Z9v0hBczKzM/4Yb8BxhHjkYNH4ZFCaWeEP+4Ce+FsLdUxS+sIyNqLsgYueggMQA4SL
         5RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645930; x=1785250730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+LK8F70ldltnOCivKw+ePZv3anat5mG9iynUsCcEZU=;
        b=JowptHa9SVd8cggsODXAnZTZfa0xh1J07yOPfURAr5Vnquv/yUUN2lg5mWrOJYx22l
         QOGR+kwPTb2ashr9huDVMlUXhZOnkjPd1V+uQTukd1dEkltigRu1uPLN0Fo6tnvsRbpp
         D2PYPgmyhmUFQA/ngI7kKSu2vEjiQc8N8cAJdEID+yqHpxDGQm24CKRvBRzq9Hb3w6vg
         Hdb1mXZ21fxlSsotrlC/fbEnSHaFrx1BXGWVsXGV0fpRYI1oc8AEcf/Y1a4o//TmxtI6
         OgrXne5/aN6a0qY9KgIVALk+pAYUDPvt5GRiFWFCs0l/JG47pOwxWgZLaoJZn6g1JSG4
         CM5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrwGurK1UfM5YLVcyCVrVonGymPXHerClgRaBoS9S84AWVZRmQBJMv0LSxMMRomIusqOWwglEz58etwRqvE@vger.kernel.org
X-Gm-Message-State: AOJu0YxxKEXIRsxBFqev05Kz0+AE9cIWexEFgoYyENR9MLijhSh0g3qa
	S9NEj1rua2kENXF6I+FZLan1fg65Mqo10S6Vz8/OGoge5R0/91ehn/q/pEgwRshwHVngLagY1lC
	BvCm4sRbgvhaYaDPvA1/S4R3xGv+o3FGPtdA2BrWSe3bI67EmRMZYtYe2Q+a7hue3k8wP
X-Gm-Gg: AfdE7cnYN0wDBYb+RBhL5EK1rKaxhmkrQuxyM3L2cQ0xURYOszZXg2eriyVW8oc8PWK
	kgMAfwle36LWXmppYNGed9kNcw+k9bwMlV8bNE6jCzDVKT6fQBK+EB5HyVa5yO1gwGq7TNp4AAd
	P1O6uTniToYgqCTyeCogCf/6bk9ev45cyevL3FqEK63tPB1KLgJua00snHeVyXzXTKxiiLbICRh
	0fAiQNFLNKGTgsQFHXjaaZ0F6Mlf78G1EHQJeEvD2wcpvk05KDS/0vgJMBivuQCvSRLWIQcgA/1
	8+W8zlIjatty1MsRLhHl1dEwRqKCyu9wr4k1KnOj9+Damreg7QgFmS82FhqJJHa/Zmq27RIa9Mt
	WQsbBxFodmrKlausPc+8y02yD90pJrGfJc5ZfM541VaaBHQ8zdXEaF3zw/W35iKdVArgyugS76h
	ggAcSVIiTqkiL18uhnTuRWk4d4mgivyzidBbkjdEFwhZGl0d9EEnY=
X-Received: by 2002:a05:622a:909:b0:51a:8c97:938b with SMTP id d75a77b69052e-5213e190f97mr180220841cf.66.1784645928137;
        Tue, 21 Jul 2026 07:58:48 -0700 (PDT)
X-Received: by 2002:a05:622a:909:b0:51a:8c97:938b with SMTP id d75a77b69052e-5213e190f97mr180207641cf.66.1784645909028;
        Tue, 21 Jul 2026 07:58:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbba0fsm5875369a12.17.2026.07.21.07.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:58:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:58:21 +0200
Subject: [PATCH 3/3] i2c: qcom-cci: Fix CCI clock rate enforcement
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-cci-clk-fix-v1-3-5eae78700da8@oss.qualcomm.com>
References: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
In-Reply-To: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: LWS0ZyUuw72QoZzLV64zV0TNz1v4Jp4K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1OCBTYWx0ZWRfX1MMaUxnmYPH2
 UpPzHAqIRFbYMS46mRsya8y2F/g7whrFx/sfqI/TNfA2FiO2VZgi0qEfGnN3CmPrvspSZsbWo0g
 FK6eOF/MvOiKNKMq0zk/nilMODfFjy6F6ElntOZbd9AxsBX930FrSz8xUYyLXT+jCWZCpGjIkA9
 T/Shbnw7VuFP25JSMcBpO/eBT3Cr4KZbrBx3gR8wmiGsEZ6pcjroeLzQqxN2/4Penf7XgQSxbhO
 nSCG82jAhPgVyYFUhW9ORSge/J5BZzWj3ux4MffLvNpnO8wvmabnmZuJYX5RjMPRtNIekOKknyF
 DsIy7wn3LskaRVOhk+bwgeG3scq+Sb+RfSnD/fp2c/yZU3Y8WVF8gAxHPxZNcMKmgRh6vrxfkzK
 trRga1lG2Na5LJ+40JPvFvliLAyhC2FaL4OJmXIY3f3sM3xbK4kRSUud0HaHsdFeiVOzE2elPA5
 Za1l4asdnMqJvAOe4dA==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f892a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=fiHgs4EJ_qdzu2AaPLEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: LWS0ZyUuw72QoZzLV64zV0TNz1v4Jp4K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1OCBTYWx0ZWRfX18DEkmSYsSn2
 sahXg+23PukN8gn3Mq8cHKdeKyswfackfbsuPbYCR14hMzsd0xYN02QsWyamqEB5asALIm4ugAm
 Gi2YCxr6oQYKEvOEf/YHw20uQj2p+54=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210158

The hw_params timing values (thigh, tlow, etc.) are in CCI clock ticks
and were calibrated for a specific clock rate per hardware variant. If
the clock is running at a different rate the I2C timings will be wrong,
potentially violating the I2C specification.

Rather than just warning about a mismatch, actively set the clock to the
expected rate at probe time. Warn if the rate could not be applied so the
user is informed that timings may be incorrect.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 5f74edde8558382e63e2c3d0fbe19489f325e8ce..e001c0d565cebd386fd67b1d9d532360b29c67d0 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -519,6 +519,7 @@ static int cci_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *child;
 	struct resource *r;
+	struct clk *cci_clk;
 	struct cci *cci;
 	int ret, i;
 	u32 val;
@@ -587,6 +588,15 @@ static int cci_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
 	cci->nclocks = ret;
 
+	cci_clk = devm_clk_get(dev, "cci");
+	if (IS_ERR(cci_clk))
+		return dev_err_probe(dev, PTR_ERR(cci_clk), "failed to get CCI clock\n");
+
+	clk_set_rate(cci_clk, cci->data->cci_clk_rate);
+	if (clk_get_rate(cci_clk) != cci->data->cci_clk_rate)
+		dev_warn(dev, "CCI clock is not at expected %lu Hz\n",
+			 cci->data->cci_clk_rate);
+
 	ret = cci_enable_clocks(cci);
 	if (ret < 0)
 		return ret;

-- 
2.34.1

