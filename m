Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA724749C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628917; cv=none; b=qHTpKmgq+F82oS0zpQYaRGHPRamIYjium99jeupnhhasttDq5Jt2iRuzpgGbF6bdHCGjYDER59bAJT1DRryXtmoGr4zQQovTyr9xvi15NXFnpSgvVhcxUjCR5W4s+VOaeayZRS5WT5IR0rubhQk9aRHlurX2jULBXObgWMy3Wyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628917; c=relaxed/simple;
	bh=+JeOcCKCJT9TzZJOqCr35ckMrsBUUbL5W5ule19GD10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFod9iw+2OKqBhloGthMmrfXekFPKzcAAGrJDRaa93+gj1zDJwALf77+Y3SBO1j6h7dcI1CJNqwcUdr51nfGpovSXegEXeoXtnbUCP+kwz/8meXaw/YC/vynQk1G+kvQE6B+Z5MnPPr8uVKtshpKUxX21WLe6WItPQlvc86cjnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZvDGX5jE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWzrS64R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZvDGX5jE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWzrS64R"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H61YBf776798
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FvKzqYphaIeLTQrNu5cABi1Q09xRTU6c92RkEhIvSW4=; b=ZvDGX5jELdG/1TuK
	WedbuiquKmbLPNq2yz8NBFSwany6WnHfJrXVXvhYONvjE3a3ujemYddOM8D5Hbx4
	zLnBS2BoUc2wHBPOjOkieI/KrqPv71Gkca0tZ2j071ufmbW3egtug2XCp3ANWo8o
	6oqMkoloXaMqDGvd61+1WlgQ8MFm3iVgqXq4QxrODmZMTorlyhQYOb726SKkDiY1
	hqeXbevjeCCVUqP/Siosp8LsGiH//PRbh9LsA8xQbMAhkfcJ9C8X0d3V/9zRvSOR
	4moZLGBcE3dWZ1c/PuGc7ziv70gK6VqMEfc9PrAsF8ezAEXBDZGaiIxYzNaQjCvB
	M6+d2w==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2uym9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:08:34 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1ac969b92so675042eaf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 00:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789628913; x=1790233713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FvKzqYphaIeLTQrNu5cABi1Q09xRTU6c92RkEhIvSW4=;
        b=HWzrS64R58YBbF+4nNtJkvf0O3GIA5dx/IxFtQYansLqzE3CqGhXo/iz8QS7lg1/Cj
         t4l7BZkHTYRU55ahU1QZdCZFC6rlMtVHXJvj0WHRVYrf0mjisSg1xoFS9M81Kj8AxCVJ
         58g7cByzcyJm8Mb7FHyr2L6MjUF+QOqHTKthnnUqTEcjv7QmI1Rc8I2/XXWHlgwVQE/y
         jaATBUQ6QJBkw5XRXLafeYGOtmxSs4bAQ6nl8yyH39MsTriRuytEYf06EaFHtRn7h0vO
         VnFHKr0I+I+ODKzu/eCVEoXIDBJ7TAcze04wb0wBMWrDm/my4G+GCGGpclUKtfoWhw4l
         5lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628913; x=1790233713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvKzqYphaIeLTQrNu5cABi1Q09xRTU6c92RkEhIvSW4=;
        b=SSrLnB4aasJbai3z3n55ARG9rwSuy1hsIfXxOeLjmGTjs/qpX+B08434crQ2VSY2xN
         1GHOPonqtGjXCvAz1+AvCelhuLj6hIJbX0gvEaUKD6dzJpAVzWzUMzGCQ8nT1Pv/gSVr
         TWVf8BRPpgCnDJm9YWkYhfi2wZVf5cRc6qEGITqOfKg1va2bwjAERKwv3+bWiJw3FVso
         9yUERp6qQK3irBnhNkJZS/RztNRBqMvDhOOoTsd+hC1zJNGDnCBkYZPK1cCqlVDsovmG
         HAgJDo+zipcU4Mh0zAvISdIT5oD+9Xc/Feomk9TuqBT47sV2oSQmuz6mKBiEcg8Lkd69
         D8PA==
X-Forwarded-Encrypted: i=1; AKwUvBw1r74OkKO4NPeJQ9KSo0x4pPkz52KQUl8J39aShiauwZiKJ1kVyZmYumemS/9VVR0ROsQ8B1LNShvP+FJ2@vger.kernel.org
X-Gm-Message-State: AFuF++k2HOh8GQdkuriCQWzGJlehNHV2EJEDMuXOu2S3y9tECgRsBAqm
	SEVBULbXVqpYct70ImajTdlORR+jknkO5rl84GaNOeIi5uBzDOjvhX+FIihZdYJhItSoJ9lo6x8
	S/nd03E4+enacmJ5XK6L7b44n7Ks4xrw4odiehROfgB2ST6ryC2hUfitCAoyU2xtwwMVV
X-Gm-Gg: AYBFou3j2H6Al90O9RTI1Af6C6mAem2pSDJMDHbObI0GiwrNx+XjHyz8tWzbyTIk9dz
	NHObw+3yJeHeXZnYZ5qD/MPUUD5EPFpxKouSVSdfFNoKidLumoZLT5ZkL8QezPdu7ouSxhFCfhW
	s/0iRzpFZ1XwYUgCzboSVYPoa0u/hatcRQ666097zpElku9Dvki8Ide1yGdYfocNiVjKg4BGjrE
	jKtvKLqNbhWbsuLROuPLzLslxnAD4OCM1DcRF3kxXKUOwqlOCTfc6u2J49EZa+GAuRbpjJrk/bO
	Oe/BalK9UXkU+t5e6uCEDTnaWRQHJAQ5pmzINLzSvbR0YgCqs6EMlzAkxTm0qESHZ2QE2mfz0wZ
	w1qFpslBPYoTTaBJEF4dXc3zWQEc5e0ZEWDE=
X-Received: by 2002:a05:6820:1899:b0:6c0:66ae:ba91 with SMTP id 006d021491bc7-6c7d0ee5129mr4794614eaf.28.1789628913555;
        Thu, 17 Sep 2026 00:08:33 -0700 (PDT)
X-Received: by 2002:a05:6820:1899:b0:6c0:66ae:ba91 with SMTP id 006d021491bc7-6c7d0ee5129mr4794593eaf.28.1789628913142;
        Thu, 17 Sep 2026 00:08:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm13280835eec.15.2026.09.17.00.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:08:32 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 12:38:02 +0530
Subject: [PATCH v3 1/6] bus: mhi: host: Add support to read MHI
 capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-tsc_timesync-v3-1-6826d5d2d527@oss.qualcomm.com>
References: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
In-Reply-To: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789628904; l=3082;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JclDFIoQQmU13ybasYFbXZ7aKUGUQ3PPLi7vjPeAauw=;
 b=dWhPBK3oKBwqaXPL4W4EjaTr6g3gbUYII/k9qYfnqAqLMsDoscAd2NEWHr7hsbXw/7d4ln4Ny
 PZ1ugcCeg+KBXaA9KkDH1WFik8LwsAQfemljUID9++iWggEIW7HuaP5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX59MC0zZlTpu7
 3Z0hwBuGUr63gMSZxikKK0yj3vPCq9T5tXYvhBOlACgYos46pzWZ8th9Tj/kaY+Y5CI8ZQD8SXc
 J8PDsxa2882D3WE2yn8pte7KxBDjmOo=
X-Proofpoint-GUID: ca5NiDF7uHOIc_oyiYuyzY8GP_kdJ4iy
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aab91f2 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CnzCB1l8zP_khqs2e6IA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: ca5NiDF7uHOIc_oyiYuyzY8GP_kdJ4iy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfXyMjyaU/IOQyJ
 /yFkiGBuYzjoFQJglz3RahsxMLiXLM0t5Ts9jmYsHr06D9pySLuMB44FmY1zkfjs3o7ky4DNprZ
 oCxTlWD8OHEihS+N5SBW07P5E+Kl3Svi2c5cvBga97pw4AnN3NKv4MiTjrJsOMND3UjqiFY2JOT
 1zIRryNA5xzpYatS8vBuY7X8poHsCFEb5q8Zf+G3KztuzItfUzyHIKKcrbEtiKJE+ct77y/AdJ2
 Jq3DEakWyHr76XJHFLVtmn7FnE4ER6M55cFNAZ8nrKn0pGwwwfMUwpEUrQ6WZoJ7rk2MQfcyhO7
 aImhIGLSVx6fJ8fNpe1jogsE+GiSOGKcQ3+7Xg9b8mk0n8hEBh9vHQ7ZVo6SHCEvSDGvEWPRDKv
 pZEGcAxJoVyQJsbCRIUAEx0dKwBa/KyQF6y3vIO4eHuk0sKIW14jHGOVAxhMrPMYxxIqz4q367r
 2SgcvvA45P7JuV9wraw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170094

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
located after the ERDB array. The location of this group of registers is
indicated by the MISCOFF register. Each capability has a capability ID to
determine which functionality is supported and each capability will point
to the next capability supported.

Add a basic function to read those capabilities offsets.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h    | 11 +++++++++++
 drivers/bus/mhi/host/init.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index dda340aaed95..4c316f3d5a68 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -16,6 +16,7 @@
 #define MHICFG				0x10
 #define CHDBOFF				0x18
 #define ERDBOFF				0x20
+#define MISCOFF				0x24
 #define BHIOFF				0x28
 #define BHIEOFF				0x2c
 #define DEBUGOFF			0x30
@@ -113,6 +114,9 @@
 #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
 #define MHISTATUS_SYSERR_MASK		BIT(2)
 #define MHISTATUS_READY_MASK		BIT(0)
+#define MISC_CAP_MASK			GENMASK(31, 0)
+#define CAP_CAPID_MASK			GENMASK(31, 24)
+#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
 
 /* Command Ring Element macros */
 /* No operation command */
@@ -204,6 +208,13 @@
 #define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
 							       MHI_PKT_TYPE_COALESCING))
 
+#define MHI_CAP_ID_INTX			0x1
+#define MHI_CAP_ID_TIME_SYNC		0x2
+#define MHI_CAP_ID_BW_SCALE		0x3
+#define MHI_CAP_ID_TSC_TIME_SYNC	0x4
+#define MHI_CAP_ID_MAX_TRB_LEN		0x5
+#define MHI_CAP_ID_MAX			0x6
+
 enum mhi_pkt_type {
 	MHI_PKT_TYPE_INVALID = 0x0,
 	MHI_PKT_TYPE_NOOP_CMD = 0x1,
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index fd3050889412..7ca2fe48c9ac 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -465,6 +465,38 @@ static int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	return ret;
 }
 
+static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability)
+{
+	u32 val, cur_cap, next_offset, cur_offset;
+	int ret;
+
+	/* Get the first supported capability offset */
+	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF, MISC_CAP_MASK, &cur_offset);
+	if (ret)
+		return 0;
+
+	do {
+		if (cur_offset >= mhi_cntrl->reg_len)
+			return 0;
+
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, cur_offset, &val);
+		if (ret)
+			return 0;
+
+		cur_cap = FIELD_GET(CAP_CAPID_MASK, val);
+		next_offset = FIELD_GET(CAP_NEXT_CAP_MASK, val);
+		if (cur_cap >= MHI_CAP_ID_MAX)
+			return 0;
+
+		if (cur_cap == capability)
+			return cur_offset;
+
+		cur_offset = next_offset;
+	} while (next_offset);
+
+	return 0;
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;

-- 
2.34.1

