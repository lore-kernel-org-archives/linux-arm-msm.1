Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590153515F2
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 03:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726945; cv=none; b=NPGMIAEdX44cQfIJMC1R48zqwIOOwD1oUEzfuMONcC5OtnTrqtlFhx02H1KCzRb3NcguXEAT9cZY8kYtViwV6IJoUfKoBkQIoAyMjwh5aprecJ+T7j6PmgET9ETggZIjLJ8EfcTVo0p/0RG93XudETpjNE3xk1qpu2MijO//Ebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726945; c=relaxed/simple;
	bh=HpHLnY4+cq26k9bEYWvJsx8FG9JYVOEw8X6TJecOzlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MJDVysk7CAypHv4H9LH3IL06/soSQ5YmuAal2ClExjASzLmf0PTmKrIEdyo7HntmPhaJx4vi1OGbobV1iq6Aodi57hpjeO7WDPGh5GGchsBxIWhQ4SSuRFFX51fhk96vUMF7PL5jeVKRLkN8t/ulBYQ4BQO8JbZCvl9O0k65ehc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZ0yOm55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Orbt4cfB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZ0yOm55";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Orbt4cfB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672Lgcqg3319452
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 03:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lh7VPnpiWdW
	yrdblOAW9o/VI9PYxFPN0+cxK+2KPVVg=; b=ZZ0yOm55CmwDCYxS11YV2uc2mNl
	P0om+LSoGl+7c0OTrgyNc5vjgDmMECakEzeAHJbIf4W2qnQ8CpYBqjGveTov+6xd
	TXlaKt3Y8Vo5JC0An4V4qjUL5JsOIi8Retgdk9JC+OI6bLFko84rAaxt+EZlA7kX
	ioR7DeOOKLSs9dKz34oRxs4tMHFVWMkz6x+f+K3QTTyqY9ZrCh8oze3mMF0WXpNR
	t0a+jS5ukJrXtETjBqFzdtj7FCsJ5FzLULGjkNwKiA8vfFOA7Lmk7+CVYjvGbWFf
	eram/IyW6YOoAWnaEUVdR2uWC9AZewVWJ3ySrHmm/9XLXSitWOcxBGsjCBQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qpv8v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:15:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab041eced3so4685535a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 20:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726942; x=1786331742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lh7VPnpiWdWyrdblOAW9o/VI9PYxFPN0+cxK+2KPVVg=;
        b=Orbt4cfBsyPjubVLKgROhxYNCbzYaE5GURLGgaPQscmRo7Bg5TxXPQMKF8kt9rS+Tq
         BVXDaGLwgTDSBKJShm69+TIZyUIbAt9cwAEwiBG553Fpqi0Hy3eDK/CYli8lE4jvNnTi
         b/wbDNLenfv6Le5S1QMNKNae62pnatSDC8xzHszj9OLAy7HL0t6TdUMD9+xRagh24/dk
         EI35Ro2iSML3Paf304+1VSbaOlCniv4PuS/9LM4SwX2hmqhkTebMhYUIK0yE9gxPO0Gh
         T1ODBHVgTFb9RMCPmnk3TxCRTdzhAaxGNBcnSCXq9We6AtSF0+3cgOydSMJF38x8BnLS
         OE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726942; x=1786331742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lh7VPnpiWdWyrdblOAW9o/VI9PYxFPN0+cxK+2KPVVg=;
        b=Kf53iXQJF1lE0unT299nNy6vzOYbsVy8IvH6kE9xZFM5Qc/iFbvxc2KDDxgp9jpwHH
         /kO3T0Uvjs0aw/qntFBp4yF18g0hvPwzHQdAsvyH5GhVsF/5SS6qvvyB1wbqX3sovtaW
         Eupm6h10IlKy6XlkF4SYQ0ZKFYu4alxMMAHYffYtQBfKronViqF7HwQ/rBHGAI5Vgqd1
         s6l03Z9wOuQmPyPC0CdrvzbNxBFzguTVru1qBiZn+rjbSEsZXgmiCKRZImHmg/r0sj3V
         1F77BA3RjnrRuQl94r24q17N2kTH6aJP3bs7wzkLhNzD74cbR8pERmLxbm6w1Q6NC912
         l/mw==
X-Gm-Message-State: AOJu0YwfLaz6XzW2NDLYJRcEcRJkXOhKS+MnxhG8eDXkaPQYsTnM/0Qz
	qF0099qb18LT+vC/wo2P8BjGgugAMeAqxNNI89ycTC55uxsLV3cLkyBmoy6pcwW3zPxjb6smBl1
	5cRK2jvRi673WyDWe/zRXT2jeZLIQ9GHmpemNfjf27uod9tlIYbUsIXcQcmQpI4u7QjnL
X-Gm-Gg: AR+sD11iRAUxwrTum8pg413qvDZSl7LMvsJZibGP6V1QkJBwg5I6PpwXt7vM7Oe9g6Y
	PPUDq+iIOpiVev5WvKCGdsTiKv4oZRU+WvZSZ4wE9Vu6lpmsEAXZM5aDVqLmmnKNguk8PiukOMB
	wy91OI9/0Z5wsnMx3CKWf0jA0+yiORaa//7/QQNoGADLC2XScV4zZKqzYxTVLqTDlQpwcZAVKxJ
	XUFAtgRPqEyllZjzPrFEbEO+67AHZlhTU3utSizrp8OKWVXRWe753DpBpKuXlx7DGjHqq/a8gxd
	MK96nOaGhjpCk0RSrerjuohESs480IAeQqKlBdtx2u+TvFi7YJ25tc4PwNQXLaTjpDzy1gHdpGZ
	TXUe9gvlJs4bJBJsyWHJ4fjeW4WsuuzzySfdQUyQw+wrJQCUoCry1fA==
X-Received: by 2002:a05:6300:4045:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c92a524e22mr8309489637.23.1785726941864;
        Sun, 02 Aug 2026 20:15:41 -0700 (PDT)
X-Received: by 2002:a05:6300:4045:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3c92a524e22mr8309462637.23.1785726941444;
        Sun, 02 Aug 2026 20:15:41 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:40 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 5/9] usb: misc: qcom_eud: improve enable_store API
Date: Sun,  2 Aug 2026 20:15:30 -0700
Message-Id: <20260803031534.2942628-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX5VnGawjLVRRG
 w9hH+UzHNmhE8KkQLeQekX1SOFpa+A+zJjYsCazJqOKUsDEvmbFeniPcBYwdOdznhSltvdZsSnN
 pg/hanhCaRfNznBBo/reuMOqmJthBGNyyGWai1EwEAy+PdXz/arW5ir0r1qMd6rilZmMM6AvHn8
 NEZRBOwIldxyGi0xdz3M+5E4m6KwYPeei+E5cPTp3ouNOY2DGCX/FPtgFaHYvJboodtOLAMj2F5
 NfDR1vSr6A/oFNidmTf1FvUkrQO7V7ptp8x7TAeh3koGdTVgP05VEnK5PzqJjfC8/cr3ZT8pXV9
 1VpGNBEXLIY4M3izb4KPQn4XOKapOn56w4ktqP3ZtIjm00eRqu8UTOPmyHxAIH1uOLPujbIvmlj
 +S/nuz90abh1dnRKupoqrt0Vi3qiF6GpeaXTrOjJS4YAZybrbN9Bm1Oih0XxpzAyMYZnaNtLMMO
 2QwV2Qdb9oCA1lvgw9g==
X-Proofpoint-GUID: Mwvj1AcVksgpBDYtIAj5mJ-q_XqSNCrZ
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a7007de cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Mwvj1AcVksgpBDYtIAj5mJ-q_XqSNCrZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX6MRB+1cDEKPp
 G0iFfInyspsP4FEWkqQSBkT+nkYZ3M/yNo4yf3N6nm2CQ/j3LRooZyyJpQK6j0IIOL3YjcG9WFt
 s3wqwFIYdcsevCC5o3DxtyocDxenS4c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030024

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 48a4441b0c9c..e83a4402e4b8 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1

