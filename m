Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032664;
	b=Hq7psrmcZt7hy834WavZ6ewgC8N65hwqedbWw5KuLQQurnW36YsKvscLY8ROT+4z78N2
	 aTgOVALJBBVzBHvmRKduT+rQUz03igqTFMv09oSpSPcJD+BGziI4Jhjh6Gv1Os9R2rPa8
	 EGrDpqGSolFl7w2TQeyseA02/sP7EYXYZ32PRh3CuYmAwrDTAx4nQhRuuHeQoRDxqLANF
	 +b+OswJzUf7lZx3bnb4yTlgMBScQ1kn7YiOu9NcDVod6XeSeLLGpdXAjVebi0dWMON6En
	 WTdU40fzk3e+4Nsu/ERyZto1c/uSNrXJv8+9mDh2Ai1T9BDbspiX9NQr9FGe5Q0eFmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BfNeuWTRT+i4ou2unYboNnu0L/YebnnEf63WZELUhR8=;
	b=ouxd9QY4AMt2ZbSbx5hUZugMifgsOkgicwLfpsOcc7NTF7x66r772ggNK2wu1feHzKkm
	 QXcZ0+pm7txSHh3VMlX7rGjdCb6BCfYKMqfMBEXMkYJvp48Ar4ITnmZ2ovoTWUeaTBjHc
	 e+xnPpt0gqbGgI5GRGcvfaps3lbiEv3704GowpGKm32bors12jhWwpVPTXcJfXGjMqhcl
	 IR857fB/8cA3QjdiFDxyYusSHfLfYr4EUtT1EaE239yDH1a1xRjJdNi3bicBLY8flrdvJ
	 DEEp/ZT3Z72oYeAO5IeOid8X9KISTV5S2mjkZ5c2AeYt2YWlNi7yfqe4I6UsppFzrag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PyY4JeYN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GLUaEhP3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B455606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B455606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PyY4JeYN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GLUaEhP3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvbt32544094
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BfNeuWTRT+i4ou2unYboNn
	u0L/YebnnEf63WZELUhR8=; b=PyY4JeYNyhZ239sWmQhK6Nm7W+gh6uabh6B8h8
	80QzDZYMiLEh6Ne73I1J3Un0zyeFI8DtxOrpmFUkQDcQ+byf8p0MpbXwthCVUk/G
	uNMhAL7ZQJQFMMY7Bt08myVmWMvfPBJKA/6lxBqobIvrzuTUapU9db/ABsPtAwvX
	ji7ABAnW02UgFYeEg8uFZeZodUR2XWoeTbUCjc60Zp28PimG6uulHdkaSQ3W/oZK
	feySqlU9D75UohBaZXILiXq0SbvyvEHUVSyS279Lms6xrNZZCPcOYP61PvOTfjOC
	l68P0wfqwfkjx3uDjh5fXKhUZLu84okMldTWmgkddHt8j36Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smrg84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:37:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso430147785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793032662; x=1793637462; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BfNeuWTRT+i4ou2unYboNnu0L/YebnnEf63WZELUhR8=;
        b=GLUaEhP3SuRYjVUuj01pHz4eBuG8JsMSMKc/btESm7QMb9YfoXEpdxZttkVd67La2u
         BbaFreXlmVm4HRY797NjJfTR5SSwqsvtVl2Cb6GdCbcaaGgVjk2O2QbDmUPyxRwupJq2
         YyRpmtoTUnfW/MqbYbmlP1hQYdRXYEZBFP1qQScGOxag68QpdkxTVQXfbDvLjCxn6c0x
         kc8FLMUYshfP1hd44rbfOIrNUccoU2iGCMkaq+74FHWEMvhSzQk/d705m840cU541v9t
         u7HQ77NL2VL7UTB3DFHsSt/mXQ9/A6K6g+RV20jeLwZhdsALMZ8jkIoZ/Mk3BF6ZY6Eo
         dTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032662; x=1793637462;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BfNeuWTRT+i4ou2unYboNnu0L/YebnnEf63WZELUhR8=;
        b=znFm49Axw8YQAeTMb+pDPFj5bAb95iOO6OivzQ4VpuvjsxRMchCOVeNolcfkswVTFH
         Rjy0YwbDyJLRzrOF9AFo6XWFkPRSo8ISRnh9rSGcc+ZHjpD8rSPhqYNLdM/4fVR99+zQ
         rERY6XibHyYEDZg5OknGzEqKuFCGFSkw4fkMauinEQaOZaOsbAORQ254kU/uGTsMVO1P
         RKWXmBSGJMvwHSd9J38YBV8GarFszTu0BuwizzW4E7TMRZMx+KKfW6P7V4X4BRDASjFa
         XscwYBBJ7raSS68TfY47MPbuaifqZFZ395pyYZ2uCJw59kv/y8jOTlTkCzLh+u2RjVpv
         FoHw==
X-Forwarded-Encrypted: i=1; AKwUvByT/sRGNAvQCptM3a9V6/OpwxnhXdZ7uS9Fzb+qWcvYkp9WLoeMGo7sgSyjIrmLBnxBpDMNUk14h+toWIvW@vger.kernel.org
X-Gm-Message-State: AFq9FYJX0ywcK2CJzIGlhD6lFQ5JUebl1JiqPTIBjYPPWAh87VIt2Qeb
	FLXnaS8jsXTLgfl1ShKFsDT+XgAqIt/xHlpcPLlvSYsL8+APbp66Wf7Ztme/Ai2yHzy//WtnRyy
	VfqYNMrohStTFFSLGJWGeVWZx50RUdqQ78nn+lHdo8MT4ghVGYzPFRvRtpdFRU+hS+ppx
X-Gm-Gg: AYBFou0qpYXVZnis4YbWqUN54LN5hhGx6pfo0HW3TyS5EQKtgBRguRAvZcN+hCI99fD
	iKZGrc6QVjpogI7+Tgv0suQEnUv6svYtAsEl4wVTglOSzWWJxuVRUCrDGi/+1OSHQyIcEXuO+9L
	10RhrpiD8c1TTNtG8JaowfGTIaBMlXkedNOaPDeuArvdph5JzPuEsok9aLiFAMWEcml386JXGN4
	HEQINwuBbrlxl6UdRGl08iZF6j0+mohIsfMbbevv2iVYmhbfBEbDFAR0c1lWj4RY93T9o/ETsQs
	KWz2OalDyVGwRFZhFOrb6d4O53gpWTRRHrRx7DLzQCzgfKYH2dHREc0B2Tj4UrgJVLTnwHNFKte
	hhMk+AyndOQ==
X-Received: by 2002:a05:620a:480a:b0:93f:3120:6c71 with SMTP id af79cd13be357-940ef956f4amr1142394685a.44.1793032661362;
        Mon, 26 Oct 2026 09:37:41 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93f:3120:6c71 with SMTP id af79cd13be357-940ef956f4amr1142388685a.44.1793032660681;
        Mon, 26 Oct 2026 09:37:40 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm22074219f8f.49.2026.10.26.09.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:37:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:37:35 +0200
Subject: [PATCH] irqchip/qcom-pdc: Restore the configuration when resuming
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-b4-irqchip-qcom-pdc-restore-resume-v1-1-ed6cc37816b0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM6B32oC/yXNwQ6CMBCE4Vche3aTUhWNr2I4yDLImkDLFowJ4
 d0tepp8l39WSjBFoluxkuGtScOYUR4Kkv4xPsHaZpN3viqdP3JzYrVJeo08SRg4tsKGNAfDvss
 AvnTenSECqa6UQ9HQ6ed3cq//Tkvzgsx7mbbtC2jwNL2GAAAA
X-Change-ID: 20261023-b4-irqchip-qcom-pdc-restore-resume-7f205eccec68
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5165;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=N+kdRhBhvzMmca6BhjzSv87I8WfEefVN0+O5L/8kdp0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq34HSVJ54jZ9ChP+gX2trF5CzKsgbK6qYRC2I1
 3TGx2fsVR+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat+B0gAKCRAbX0TJAJUV
 Vq/uD/40SuVSIE+/Rr9Ou31+6GZo1MYDsJ062l+W9jDMWRhNpyxvhyVEWwgMkoqf0H/wEUCfNY3
 fVpHIyOXEfAthnXCqD25CEBVYw1X/KEMJlUAy/pyrZxAGVUNhamctpDPmvqkITMqupkE/xTd39t
 ooGq+7TrFuXeavOggd+/LN2pKLA4QSSWce7EjWgso9gtSazPgDpkbE8W3QtH+wzpJKujIBjSXRI
 0+h+oewfCxoxztwNY9gn8RQE6WSlfvi/eNdSfygz3TTUPxsbll6vZ9ZX+j55wErvq3TXW5RW4FT
 +O6OiVOowyDvPGlSoxuB8nTX6Aw1rRNNiI3j3fxAhvedFEUMn1UgokenNQ41Et8FBcCRHvdyC3Y
 yvZMRZK0JKdmRerOyyJlIWrUt54cVbUZjojtsntyYAR0ucj7puvR3Mo1tm0P0iKGKE45qQXqpUy
 HowQbJdY8sX0PBZjbgfP1Ogc/XkBdQj7Z+17KfV4zml+7JCEzl9MUo5ode6ksRPPDwu1GaTG+3e
 3XrVqCA75BVSqsf/PM0PWtGmEJs2dI60A4QOONQoAlsPDqzX5iXxnLfvmaMtROQitj61+8rC8F4
 kTuilgIyjbGorAtiEPvXb8pxxPe/BCBIoosobiwBOT50jSEvyf4u3hHVwkntJm5GZhOfPr98e0s
 JdSiNo+fBapJGLQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Mh4rxLoHMZg4sgajy7p1_tm5jq-LVx0Q
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6adf81d6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ki0s1ZjzMC-ugNsPGPgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Mh4rxLoHMZg4sgajy7p1_tm5jq-LVx0Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NiBTYWx0ZWRfX5Q3InSzO8YDd
 FZke+bZDofsampgUNQl1QpGIG85kHGQx419bOuJiFGU7gT5lpoQZT9d5f5+VEghUwn+ALZY3eqN
 RC35QMY5k7nI30k/R+o7bSvEs6jZM3w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NiBTYWx0ZWRfX7plHOIEOfyRz
 x7HPPCpyiLR0NH9SRmneNfZv/S7D5G8+ynUydywM2Re2I6UWJdmalMllrbcZ7MFZEF1atoZMJcZ
 5b2IOFCf11eBkM23D99An4K2t1u5d4/DRQnvPr6jCSxkA+x7UfdnWNHugZHpkI0yd2njtOddcq8
 oum1d554U7nz6Niv+81dpRoQKDIfbEFb5usN8/9ckbt+cuCKdlVXaF8y+YHUIMq5IPtWWWQ/b3D
 KHLs7JOLwBscAuxxPWesvCDmfRgFltJLCPet2BHoP9qE8C+sao5/k5kkM99AaZm1itkm13u+dTY
 tVXIA148mofX/xdJUtX8OB8HINHEqKEpRn7PjTlz2ope8QwYklFG7zdgHUb6q9+WZeyq5MoDeTP
 ykquawKdsS7Mv+DP2F4FiergHx0nQvleUZjbddwNPj6mBNpzg32bOjNES1q+TsXwpXa8e536IMl
 ID9YyW1MeLJFehaphLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260066

A hibernation image is restored after a power cycle, and after the
kernel that loaded the image has set the PDC up for its own
interrupts. The restored kernel then runs with the PDC configured for
another set of interrupts: a GPIO interrupt it uses may be disabled or
have another type. On a Qualcomm Glymur CRD the EC interrupt, which the
PDC detects for the TLMM, then fires forever:

  qcom-hamoa-ec 3-0076: Unknown EC event: 0
  qcom_ec_irq: 20501 callbacks suppressed

Restoring the TLMM configuration does not help, as the trigger type
and the enable for such a pin live in the PDC.

Save the IRQ_CFG and IRQ_ENABLE_BANK registers from the syscore suspend
callback, which also runs right before the hibernation image is
created, and write them back from the syscore resume callback. Keep
the latched GPIO status as it is in secondary mode, so that a wakeup
interrupt is not lost when resuming from suspend.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Prepared with help from an LLM-based assistant.
---
 drivers/irqchip/qcom-pdc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 29025a212ece..af3ff8013b84 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -18,6 +18,7 @@
 #include <linux/of_irq.h>
 #include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
+#include <linux/syscore_ops.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -26,6 +27,7 @@
 #define IRQ_ENABLE_BANK_MAX		BITS_TO_BYTES(PDC_MAX_IRQS)
 #define IRQ_ENABLE_BANK_INDEX_MASK	GENMASK(31, 5)
 #define IRQ_ENABLE_BANK_BIT_MASK	GENMASK(4, 0)
+#define IRQ_ENABLE_BANKS		(PDC_MAX_IRQS / 32)
 
 /* Secure DRV register to configure the PDC mode via qcom_scm_io_writel() */
 #define PDC_GPIO_INT_CTL_ENABLE		0xb2045e8
@@ -120,6 +122,8 @@ struct pdc_irq_cfg {
  * @enable_intr:    pointer to enable function based on PDC version
  * @unmask_gpio:    pointer to GPIO irq unmask function
  * @clear_gpio:     pointer to GPIO irq clear function
+ * @saved_cfg:      IRQ_CFG registers saved across system sleep
+ * @saved_en:       IRQ_ENABLE_BANK registers saved across system sleep
  */
 struct pdc_desc {
 	void __iomem			*base;
@@ -141,6 +145,9 @@ struct pdc_desc {
 	void (*enable_intr)(int pin_out, bool on);
 	void (*unmask_gpio)(int pin_out, bool on);
 	void (*clear_gpio)(int pin_out);
+
+	u32				saved_cfg[PDC_MAX_IRQS];
+	u32				saved_en[IRQ_ENABLE_BANKS];
 };
 
 static const struct pdc_regs pdc_v3_2 = {
@@ -652,6 +659,79 @@ static int pdc_setup_pin_mapping(struct device *dev)
 	return 0;
 }
 
+static u32 pdc_last_bank(void)
+{
+	u32 last = 0;
+	int n;
+
+	for (n = 0; n < pdc->region_cnt; n++)
+		last = max(last, pdc->region[n].pin_base + pdc->region[n].cnt - 1);
+
+	return FIELD_GET(IRQ_ENABLE_BANK_INDEX_MASK, last);
+}
+
+/*
+ * The boot kernel of a hibernation restore may leave the PDC set up for its
+ * own interrupts. Restore ours, keeping the latched GPIO status for wakeups.
+ */
+static int qcom_pdc_syscore_suspend(void *data)
+{
+	int n, i, pin;
+
+	for (n = 0; n < pdc->region_cnt; n++) {
+		for (i = 0; i < pdc->region[n].cnt; i++) {
+			pin = pdc->region[n].pin_base + i;
+			pdc->saved_cfg[pin] = pdc_reg_read(pdc->regs->irq_cfg_reg, pin);
+		}
+	}
+
+	if (pdc->regs->irq_en_reg) {
+		for (i = 0; i <= pdc_last_bank(); i++)
+			pdc->saved_en[i] = pdc_reg_read(pdc->regs->irq_en_reg, i);
+	}
+
+	return 0;
+}
+
+static void qcom_pdc_syscore_resume(void *data)
+{
+	u32 sts, cfg;
+	int n, i, pin;
+
+	for (n = 0; n < pdc->region_cnt; n++) {
+		for (i = 0; i < pdc->region[n].cnt; i++) {
+			pin = pdc->region[n].pin_base + i;
+			cfg = pdc->saved_cfg[pin];
+
+			if (pdc->mode == PDC_SECONDARY_MODE && pdc_pin_is_gpio(pin)) {
+				sts = BIT(pdc->cfg_fields->gpio_irq_sts);
+				cfg &= ~sts;
+				cfg |= pdc_reg_read(pdc->regs->irq_cfg_reg, pin) & sts;
+			}
+
+			pdc_reg_write(pdc->regs->irq_cfg_reg, pin, cfg);
+		}
+	}
+
+	if (pdc->regs->irq_en_reg) {
+		for (i = 0; i <= pdc_last_bank(); i++) {
+			if (pdc->x1e_quirk)
+				pdc_x1e_irq_enable_write(i, pdc->saved_en[i]);
+			else
+				pdc_reg_write(pdc->regs->irq_en_reg, i, pdc->saved_en[i]);
+		}
+	}
+}
+
+static const struct syscore_ops qcom_pdc_syscore_ops = {
+	.suspend = qcom_pdc_syscore_suspend,
+	.resume = qcom_pdc_syscore_resume,
+};
+
+static struct syscore qcom_pdc_syscore = {
+	.ops = &qcom_pdc_syscore_ops,
+};
+
 static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *parent)
 {
 	struct irq_domain *parent_domain, *pdc_domain;
@@ -757,6 +837,8 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 
 	irq_domain_update_bus_token(pdc_domain, DOMAIN_BUS_WAKEUP);
 
+	register_syscore(&qcom_pdc_syscore);
+
 	return 0;
 }
 

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261023-b4-irqchip-qcom-pdc-restore-resume-7f205eccec68

Best regards,
--  

Abel

