Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795924;
	b=m4PXWUS1o0oERK+FdXYbC4xoASgy5oG0A55qK5kAcE1f6Hv0WInwDImrOMlQK+QW2Uh0
	 3sPiMSEBPncmu29ItL0KOi6Es90v3dSwGgzxGqoyRyIP7Chxn8JJlBFNscIVbGAY9GfLZ
	 /gKMvlaDLJm9yHjlhC8mkf6yS9bQtn2CAEZZMbfjhxYW3DjnG4yqw9yWhN7/j04nUIugg
	 DOeBZ1WCmPkI08CDRSy8MvSuW+hR3lc30BP/zCYT+k5zAy2WFrbT7cL2N0l0J3rEz18Vu
	 Hj644beDtdglyeCGFUE79zD1Y8VAZTO0cnPiVZMVN1QCQ1bSjKLmM8eE4ar7zHfWxFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
	b=3QR75xJ/AQtDqq4S/CYcBrNzV6AojMeMcioTReUifoLvI4jfMyV6xZCSNbRuPVA0YRro
	 LJq/dC2lkq2KgC29NguCKSMViBfFmmClc5K7SqoNaJEKmBvRtx7LwBm3627ULVIocvCSz
	 z0koFnfV9deckPNHZrrwCQUn/Fuq37SH6cURKQRjI5D6SHg9rt3f2w6QcTPFk5wQ6KniD
	 3CQY2L4T8fYwL1jcYWwbZR0+Ks3Pfoa4ibiodGzgrlcsaLTB77g/2Q57z6HXkLRn8iv7a
	 s9oELQ9apmRC9SUoW+D/MW45dDQhjoe0YDuZyzv9X5snLtb9JemwI1FiSqxC8DskKpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Op+TaJqN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xy29BqEZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C99B606A689
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C99B606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Op+TaJqN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xy29BqEZ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp9ED2712078
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=; b=Op+TaJqN86K7uc+a
	CG+aU3JjMprxZWOI8BU+p7NqK9+O9loTLA66hPVTPSQevla+Sy3NZizQpMixC51e
	7J4fcRmzIRvjBi88dvsqx3ZaKjOXltnQtQ4BAmAcgDAwKUEugw36ZcZjqAw0EWH7
	0LxRqm6dYpbtsoOO126aqa4AGpo9R1ZLlteIX8IU6iI6bY/VpPr9xi8ZA0aYjj/Y
	K7YBmKvPDz78i0fK+JYR1dYdDT++/Xjk1gsH5oCqrD9701S1tSXM7ob/duc3CVlq
	Pmsihsp5TiWWxpRbBLHdHitPKKHvPoVju20rtg/OK5O6AVttEvbRoJgpHy4/ULNw
	59snKg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gat6x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:12:03 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-57ce46ad0c1so6705890b6e.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795923; x=1796400723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
        b=Xy29BqEZTOG1INagFr/2rZIuJMjyI779KDxKvT18MU6YjAzk8sBLbA6W+HayDQ3JTn
         IC8pn+BG8U/Ql+3biOCVJ7/8qWjhCl0vZ0Um3k6ihNIjLSBk61JIIpV/9UwTeBESaWyp
         snTU0SiCDQ00Sokt/b+eoJuMWGllOCfFvkn5ZBFsKia88UxdLTfhDftW7byLVVeYaUDY
         U2hMzr8X0/3xMfY+gyd82dhpiuH20ETUTHduTuLOPncNQBkEwniXplLc8qOBA6+8iK8f
         OFKte3IGRw80IuhGoSlkMsYNsxoiUQl2oPMSVTf9w67a1iFIXycJkYsH6e3kuNu/zOJ0
         kyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795923; x=1796400723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
        b=YZEZKBbVf3akFR9qpK3CcWsbltNpNezurJCdaaNiunA8wAQFPKo9Z8Z32+v8DHdrK7
         23ewjoU19Os45cuU5hhouio2xpm2kKKiUXpVA3e7SQHipiINw/QcngJU+iinGMwxPrdk
         KqRPWFkRnuLfpJaf69KTopjXntDbKCKBbr/P9hsSngmqYC+rIo4nwkVFQalQ3ZsiRHMc
         N8wfHCiNRMSOqUGYzClsmqwRodinxbW22byXreuZ12YPIDJvJRR1cwyhBqfi2ug0J2DA
         gJKLZ/DBLYqEM1EJqgLgFr3wyGK4eT/F59TD3RCkJQT34QtbgjGBbP0fJU3DTylNYuvj
         SKyg==
X-Forwarded-Encrypted: i=1; AL+hErGYopw65t7zHP0IE0USTxyPzZ7eFKMLvEPIG3fgu3G5Ae+ctQkZD8CQkpGnQ/M4HE0UXpxo2S1zfp6tvQek@vger.kernel.org
X-Gm-Message-State: APuU4Z/MQYJm+Tx//UQufsU0AxH3ZfJCVAalSEhzV/IupvLa68IQO0//
	5P7irZGz9rOQ0pA1dTgcFOR9suFyywq40UB1zWBAwhW+uZpi4v+ybKEunlggDucP4DUlKd1JDzw
	SERPV/+VCoIe/yZrYQBywgvdHQZrljtV5yMbrF//3SJcwjPZ1Vlz7k8T2ldkyyEs6TRGG
X-Gm-Gg: AZFdTZefv59hjofAcmszAu4AENCzjYm1bgldkAykItWErpp+A8NvZ1q6B1ML7GluqdF
	t8KEcsYZlc8fEbxuYKc/nGcn9IKxifY3s8bbPUSL5hdwC/DqP/wwds6n3wQ6NNR7J1Ut1vFtP18
	XCDvCn58DUpg1JaLNZvkalNXbPgcOXnIHIkwaXXn6UliZNV7MptiW50eywLuoEBVIRVcfjAyz89
	32mRCJuL7wjtT0Nq7tE3ybxucELQ7eNR2E+2ONQAxc6xrIL01rGpnl3UsXkDJ03AD6YDOFhR2Hf
	JkVNKVJ3Ynjm0fK/SyQbVu/SWTWWgE29PJ2pjN5lsJ8d+1XPgE/yYvblL9TWZKGvrmBWIvqzk4x
	uPPsfg0G8jTuoQEGze1ig7HANW1HRpFHJbZF/5J0CvwN4G9kZf/05REKp+lMpnD9aRLlQxFh0aM
	8wWo5CnJxCcH7snP4DBLzQXzbmdF7AmQBeHAi3cEFbIqOVVELomKqBcNswmrNNrpPPEKAaCWD93
	ws0Ky4/rkC5uzKmMMBYR8GrsrYD
X-Received: by 2002:a05:6808:6411:b0:573:f2e:2bf3 with SMTP id 5614622812f47-57a0a30b35emr25153138b6e.17.1795795922633;
        Fri, 27 Nov 2026 08:12:02 -0800 (PST)
X-Received: by 2002:a05:6808:6411:b0:573:f2e:2bf3 with SMTP id 5614622812f47-57a0a30b35emr25153087b6e.17.1795795922042;
        Fri, 27 Nov 2026 08:12:02 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:12:01 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:54 +0100
Subject: [PATCH v3 4/8] media: camss: csid-gen2: Report the hardware SOF
 timestamp
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
Message-Id: <20261127-camss-hw-ts-v3-4-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Xo4iw7tJRfPdjeO4AzblwhlrTD8gtNdH
X-Proofpoint-GUID: Xo4iw7tJRfPdjeO4AzblwhlrTD8gtNdH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX9biLyUMXKP9o
 HcOSjQd0Vq+/54gvfMErpgSSPRdmO4yG+HG4pHV5ioVJMXzveBIUT8HSVxwcPMoG0e1h7LKEdyR
 OLrNwoi1xHQX7j4lTvbiEHm2/DTNElpVyoocv/ZvyHXf2EMCgctk2bpLs/e8LKCUEMPCFfBURlA
 5DI2ogCW8eBB9IDUqAHWpoj9yr1H2AecvRKklG/Iub5qfoK3joTCo8UftvzzE9srgDYGRj3Y7ee
 lKNqAVBPJP7V2wlubYyw5ouphOEmIiOxteEzaN8Hklws+fTJi4zenQ8MsSUVx7wCdKROgX+UHuS
 iA7z+yfnxpisaNardVMn57cVjlzWtFujqrtcHqE9kEYkPfr7PswRF9lbW7KNRIzKalOrsrVxFxN
 KOqBW9dEmm6Y3GeRPcXnWh8YdaCSr7yFdmGqqh7HMDbdEsuLQLXTvS8ZKRtrXXDXkFstxdUjGwl
 yJqyxAX0M47Xlq7LemQ==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09abd3 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=d6NsCnqxkaT3_V1LjFAA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX8v1tooT5+iX2
 hLDYL8Pe8OR/NC0SnBc4oFQIOZ+Hv6pudbW3aSmtTYYyQsNN8+hliHt42bLtsANnuMy+rDI2Hm4
 Boi+D3C4UiY6mLBcDuq5tf6Y2n+0ZSE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The CSID latches a free-running timer value for every RDI at
start-of-frame, a timer that keeps running across system suspend. The
driver already enables that latching, it just never reads the result,
leaving the frame sync event to be timestamped when the interrupt
handler gets around to queueing it.

Implement the sof_ts operation to read the CURRENT_SOF pair
instead, and let the CSID core put it on the CLOCK_MONOTONIC timebase
the event carries. CURRENT_EOF and the PREVIOUS_* pairs are left alone,
following the reference Qualcomm Camx code which only interacts with
CURRENT_SOF.

Upstream CAMSS uses a fixed mapping of RDI to virtual channel, hence
VC0 => RDI0 and VC1 => RDI1, so the event id indexes the register block
directly.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 85e9eaf78df75f95d5f44f83b45dc7a3633401d0..47b0881e9c9942eeeaef53d8aa6b466ca21a366a 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -376,6 +376,20 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
 }
 
+static u64 csid_sof_ts(struct csid_device *csid, unsigned int rdi)
+{
+	u32 lo, hi;
+
+	/*
+	 * The pair is latched on SOF rather than counting, so it can be read
+	 * one word at a time without tearing.
+	 */
+	lo = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR0_SOF(rdi));
+	hi = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR1_SOF(rdi));
+
+	return ((u64)hi << 32) | lo;
+}
+
 /*
  * csid_isr - CSID module interrupt service routine
  * @irq: Interrupt line
@@ -459,6 +473,7 @@ const struct csid_hw_ops csid_ops_gen2 = {
 	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
+	.sof_ts = csid_sof_ts,
 	.src_pad_code = csid_src_pad_code,
 	.subdev_init = csid_subdev_init,
 };

-- 
2.34.1

