Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C9E477E34
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455328; cv=none; b=o8Tx8EfKDCIo8OLyxtbGp/1y+Qf40ix1uuRzJv2pDlaudX9y1DuR/opbu5j/NpiQkRMONTizsuqu4AMQxjpPBsxho2JL1GjiKvEGy6S/QPYKRYKMeFb2JZVCOh6zFk9P4D6MrYTcBdNX2x3Y2aXWBgkgJMqJeO5gTNpnqJZb67Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455328; c=relaxed/simple;
	bh=SSs+7RfrQ2KoeMZ076FxpqWCMTst1+Gu1ebH3DhCj4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S6e+7rlS071yRGMrKUmglgBdkpomzDS5e2buK3cXo1esArr4OPLILPxS9XDn3fXzi+/oKDbCffCqsz1FsfBmaey39zpFTHPkuJhjKCRDd7jbqp0oINxKaX/OZbOIf8qNxQgEhDv2BZFCmfYxELpH0NwYNidxGhQgajXMg8zSTkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWrf/v5p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aC9k0EkZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWrf/v5p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aC9k0EkZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMsHsU2479799
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cWpvU3nD0MnG5/zl5tkWRQoAqBfIToak3OCkd+7JogY=; b=mWrf/v5pJTpRzIFX
	y0H3fjB8qcXRzFufiZl/WKJBnCXPZLr8qR+lkCD3ovj0MFoS8c3J9sA/gwZbdj5i
	dBe/vwV0yqiVj/4CQ/VjZkBe93xCJBinJ5xsl3L+23N9BKel0dD9AuMLWxat8z1I
	1rGwcURqGJ7h1Jjzez1P5WrlmTQ1ryaVAZpxqZtgu8RUH+ixrIO56IFinE2VPJrF
	pWED13zPODCVOjsNyCJszJk/iH7btWmwVHWVxkJLjW7M56edlKzJKkWXYAa/fBD6
	wZfFCjQJq7CYAPxKZ37hEdqzq5umRLpembkyVlBdmR/d9+vCAjxBAEIDcXaC7r05
	IVJcZg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfpfr4su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:48:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eec6acbe21so7819796d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455324; x=1786060124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWpvU3nD0MnG5/zl5tkWRQoAqBfIToak3OCkd+7JogY=;
        b=aC9k0EkZCGY5c11nnrFmHUjJR707X3cgBCQwQv+SkSHNChKlHISvDFQP9bKkDuPGYz
         7QOKoj/LIqyZTPLpNjzvsB+Z6Z5ARygKG2NAG+HkW83eSKvu5TYAm+h3pZ+q03ag5GV8
         4KmM3AIdol851cpHSBZX2xYv/VSa/r/F34fyUZHFnFHRdT/MRiZDlPJgUMFPSzZahmLz
         zDQB+6uNhpGn5Ol4gkoUC8NIXWfepRaw7eAGzfxaYKVJGNHQ9f8MbAZBIIzZu/EzIIki
         OlBgzlIOdOvGUh11BT5tDhCR+kGjTgSOoHybKtPItSYcbis7SzpMm/n3HFY31z38N8DQ
         G2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455324; x=1786060124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWpvU3nD0MnG5/zl5tkWRQoAqBfIToak3OCkd+7JogY=;
        b=JZiVVKLJik8fgPFywvysCzAWh9RQJ+kGWdt8EWLS6GF2jlB6If1WqImIZ341lulqMt
         /TbRhT7p56a+uVLp5wsyA4MxkMy01hvAcEzj6LlQV7TcD3NMMAfsboXVL7ZARCNO/HjS
         XYqInkWtNuUNOfT7Ns5aqiQ2sG4u2jdnf1yQdgzp/Ojax3LR6oRXwPtJtqqzoOYPVjRm
         RdQ8mhno27i2GhsT1Y5d0s+NVm5TBIDP/o58pezaA4VBdBgAIu+5FH3R+EPjUX2WZZJp
         qSpKM+WYlNR1P+lMtQSsAYvPwS96F9FKGHsfcQB311/IkmU7j4aevENjhe+slvNxMjFm
         G8ow==
X-Forwarded-Encrypted: i=1; AHgh+RoxtCYCCGRABmM8E652wKRh6eaPe8dPqiL1yGMW968Xmpcrdv5qBkAYwhKS6FNSufKFTQnMEnKon0cxKjPM@vger.kernel.org
X-Gm-Message-State: AOJu0YzELuCwwvFgv9SFJU3rhJlfdnhPtuqX6AzGeffJ/C49jX/nj9bB
	YJkrCao6ahOeNO+FWzRst7ClonTRMlkG4LUaTJtPqTFrXKKHysUWS/YOOmI5QTI8p9SadR4Tcxt
	W4Cux1wAp2O0nk5Ljbq8fDxU0fEM7bDsFOW8t6gSZI1nSYHJtvrxJ5YJNObbjOMKnSlF5
X-Gm-Gg: AR+sD11d+AaJKMF7CevXNcPwifl4KhUNOvIDPZLZPoSv2A7uaduwLHUWbIf/ljLEdlf
	UtgxrTtTH10PDFyCv6lwb0oumUfC3asxB1ZB59mndGhSUvdtfY3fGMKra+VuXvAcSMs32G/+khe
	idBx+nGjc1bRLS2CGDrzYwGAXTJrXT7AgnOzkOywzGSljVI81KBq6ItB+fJnh0hpbSuxCxAcuPg
	DNUIQRSk6Oy0dr3Y6IKVRrlfMelZGWEftXaUrKpOQFiTXMPkEy/eWUkHHY5Z/0g5NJTlxJ1OQvu
	UFnz0mJNYFnKO6SBwR2RD6C0vqS+D16Lkl6e4JXSwEz2EEtHqbqbxA1UdvyUEoXRFHKYOQWC+tU
	ZRE1pzxtBCGyvOqcEznpyOIaG4g9N098QrLOgvHisPkHf0H+CPse3VBvnBh437Xhv8StwKPPprO
	wIPC1o34xYHkqAzg==
X-Received: by 2002:ac8:5d8e:0:b0:51a:8c9a:8fad with SMTP id d75a77b69052e-52b38700b3cmr52384381cf.62.1785455324491;
        Thu, 30 Jul 2026 16:48:44 -0700 (PDT)
X-Received: by 2002:ac8:5d8e:0:b0:51a:8c9a:8fad with SMTP id d75a77b69052e-52b38700b3cmr52384121cf.62.1785455323975;
        Thu, 30 Jul 2026 16:48:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:27 +0300
Subject: [PATCH v9 06/19] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-6-d71a782001c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LLqeRAsiXvNKhG2Og2KDbIVpdb/v6/FkTza6aNnn3Bc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LKpGKNZ+7JUcWW7TkiqapLK6iUbS79fx+Cw
 dg0Fid58N+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviygAKCRCLPIo+Aiko
 1WbSCACEClWE9ivMYeExtnvKjGXVyPTx8XCehvGjd9Unske+C55If7Dfce+NHDgcqrWsRbq4m6F
 d2AafODa1YvYFZxg366ryCyHL6LhMIA0iRXqB0NDAHeS5THxWF9IWuSFP21ds+BSVhHumdSs5vQ
 bWZClouqROuA9M0U6kb2lANndOdBxOa1vih51CFOn+CCenb3XqDQ821uZYfIWwNWrxKklIiyEa/
 esijF/wO0Yu3HLiTmxdeYe49tP4vpbGuxZ/yeqL4iqxPP/lWdbGy+CQD7W/OiUhBuuX+6w41GZW
 1KDh498dm5VhKpFf8B7VIT+zhlQ1ooVI6bFhiY1goIHaOY4Z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX4hwqsdPOv84z
 HUllTSJHJe5vMc739D8R8CHoDYxHZy9pyOqsZZ+QoePUmFrQ1MuqVrH30ICHl74FyprdNNDfNo/
 x2K6adXYp83QhVfKeuKvJGft97f1wS10YLeH4taWilGWys219XyMTIN6ruMdewmOJnsXcTt94S+
 a7n2dWj8/h6pcDUZoEYHvktMlNm6hnnTdaGOgwwDJVMRJAXfYRVLmU/mBQWFgavhu+0v7zx74y+
 I5ib7FT8FvkIDbmLrTlkWPXR6PGDA+rpgGi/jjR94y6zN0FwtAGcSjeukEbqB623CCPK6uDNkk4
 1P/TgEf3QQuV6PLq4UWjH3lnpw//IGlwmjuXxTgEyeXOldRWVbhMZLZYJ8tJc89iAqS0g/FSG8h
 ZUaOIPVvMQh311C/ZDwZuVM7tBFWD4WBHh/19IUCss/eU13gvr1Tsesf7nxC1ivqjOn+YyBEiPW
 AGQLNdwIO/2baVdtXVg==
X-Proofpoint-GUID: GhZ5hSpe74sUrTzCyMXiNdveMbohsI3Z
X-Authority-Analysis: v=2.4 cv=XNEAjwhE c=1 sm=1 tr=0 ts=6a6be2dd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: GhZ5hSpe74sUrTzCyMXiNdveMbohsI3Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX7VknKvYfaEsq
 2/jOBuFYl+aj1ilTojDRAHA/WbHDx6Gk6ZXO+mwV3sFKCJZboQSvD0lxWWlp1wouiR1gzF8yBha
 5nTfLrJaV5ktqjh0XGDHHfw8uP4Y0Cg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The set_preset_registers sequence is currently shared across all
supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move set_preset_register into a vpu_op to allow per-device
customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index b8714dcbad10..2dc121a3f5e8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -45,4 +45,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..dc02ced1b931 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -261,6 +261,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -270,6 +271,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -280,4 +282,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..f608a297d4a3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e4847c107709..39adf8aa91a7 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -483,7 +483,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	iris_vpu_set_preset_registers(core);
+	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..21ed4c9bd5e3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,7 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	void (*set_preset_registers)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3

