Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3069C56B849
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 15:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882672; cv=none; b=O5A3UxZr0GzjP68CWfoy0INsEcfAGqnYM1Y/jjoj69CzcvBPVnBi3ylFMBH9TdXv5Zd37ntll2GV9xz/0BZSV9YJI5J45sby8SdAy9jQB+IogPoFiabJ6P04Hjxx00//GPLsJx/qiLKe7Rr7iAGPJUwUhyhLi3t8pv4nDINpUoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882672; c=relaxed/simple;
	bh=XSPete4kA8gcLf3/xZdNmlyaz442sDN/1+dtmpWZ2KE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y/+wjXpSEALy7wvPWkZhrsnepegn1P4i0xyXwGuEOZA1vC4XFPlZU+EF3ZYxu7Lr/qeB7TuDFytiMjOE6OsKRFF4Ve8VEsAZLVALzJ+bNbi2KPmEFUYM5jTsXoij01EDCX51tU7XY1c2iESOADBxu5oKdZypUyu+U/MfPc7y0OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9QMxGdT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eewXynS8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9QMxGdT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eewXynS8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdaYe2769665
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 15:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=adDtYGI97VusfpxJEE5tInx5u7GwKzmvoOx
	LzTA7bYU=; b=F9QMxGdTT4VuSmIdhRsOW6CEzx4M54wecNMKimvIA7KQiq1eGZf
	2RNuJ1rHWvQ88hC87CoYIn0W1tFphCVv8ULzOHu/pUyivfLyouuew2rxWGnog9IK
	SzOXbRgztFPdZVy/KtDvFm09I9NevqVsUA/hJws289Mh4KmJ8F7DHZo2JmHTTauL
	P+6pGKz9R1m7DsVawenBsk6ziOfNkF+gg6tS4ir6UXJbKeX1MP4X2buMlwvFVDZX
	LIf0frH4Q4EXhzrrgMbwDrNkBwM2aVSyhI02XLhde0IGzLKRrWR4KNLj9xwbxG36
	GGFzuqzdqczAQcUCdLATIIhEAMe40H9JA4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvugtt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 15:51:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so5871881a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788882669; x=1789487469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=adDtYGI97VusfpxJEE5tInx5u7GwKzmvoOxLzTA7bYU=;
        b=eewXynS8cvZPMr4l8xQMsoScx1Rhxn7+/6A8ZEawwKuFZeUCH7Qe9fz8U7nFHuXuMF
         zVVtd9cRRqCKiEraipw9LYXXdrRIU1i3296VpwbOdk2dLq0u6IMeLndNaS+iKPw3YwFt
         sIhOXrE43iab8/xNpioQ5oi7hwakBMBukek8QOoFL3duxAwXq/psn6l+eMmXRES1fYD6
         eAMaxG03QNm0UfEZcNNlEaQPbngYtCX5K4U+lpk7ZAmbPqjpdvsR/HTWwFIkcGd9nF4e
         3x9shLiNQ7w2k01/GScF+krhAv797vfONX3XtIQ588ri/usOGUR/Mt7yhp34oeZVrMhi
         NcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882669; x=1789487469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adDtYGI97VusfpxJEE5tInx5u7GwKzmvoOxLzTA7bYU=;
        b=TYRgieod/NcPAWVG4//bE2A0bkwDBbbxfOv5uYsRVRnlZhH4AK8A+UQlJlIEOLeQIg
         qIzynhxJG8uBPYdWutanSkLDPnsWrxzYI7RiVlEKmumRumsywjx0+9LX1rEGRuzkm/70
         FoemOBoMqqoyf9ptEWtyI22d35LwB0Ez2XG0i/gIPUjfqVV76tZN0PCKoton3IYvhYCS
         bUTca4SNbgu+PrPSw861RXvuvJtRjhJ92LerfibtPU7mH3pPjJPzMCJ8rEv/PD9H+axH
         D5A1pCAW5n4XNLAVq3RpuViPXa0gIJnnoc5IprcvWq77/bhrrfGKjPH4Ou+lFARronXO
         WRGg==
X-Forwarded-Encrypted: i=1; AKwUvBwXT2hzCDkj2IOpSqZHWJkc1GRvDJMC8dBVgfCzHNvGTQmjnOVRMsqCqzz1hH5R8YYBQAtSQtxNhtS2xCWO@vger.kernel.org
X-Gm-Message-State: AFuF++l3t7P3wc90pBFjhTNkxWhI2yLha6YqbNCvpi3L3ASC6MVKYr8p
	3tVGqehbVRcFXC+y7GDN9A+XwkWdKQpzkg1ibcVUFqDT7fEJC1eZbEXg9NzxUb2CAMYmTx5xf2H
	NAAAzQM40nCWslMP+/yOUbXHu6B1RV2GVJZI3EdltcPHRikkf41ir9WWdXUFhzc25n/wq
X-Gm-Gg: AYBFou1T6C5936NSNX/a520jurQl8ePrJE4uh40P0Ox4aFuCi6YuczRovzj9ZMk4+RW
	kx4aOVYEzvQ9jnFOT34MsSVrUbSnrJUOANt4De2c0yalbL1bNyjd5pzMTH6aEl9XoutFSQFXVb4
	yXs7FT0NMjoT/T10vjVP0dSV9ZYH9X3Bv1zX4zC5HhbLlZ+vhjvluVGWsX6T5H8fXQF+lt6fHnF
	CIDejCUFdbLDzk0c2JfTCLaT5ppOfp0kbJZDWElzqGf+IYe2VlzorxFx3d3q6f9xBpyr+AkgkNf
	7AvKGE+ZXezU+IvNFI4hNDe2RofiA24nxwm7qNbKMMoWLLVQVRj6fCnLsMDY4a+BRZCZdkaKt68
	lSeUFb4N8whnbxLJiodRLObGhsL+OmElFXxlsh25C4LzcAuRwC2nrbiJkYwrZ1CMppW1sRAwnWD
	eoe7jdElLzslAlUMeO3T36dg==
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr43264075a91.14.1788882668513;
        Tue, 08 Sep 2026 08:51:08 -0700 (PDT)
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr43264017a91.14.1788882667899;
        Tue, 08 Sep 2026 08:51:07 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm58606342eec.16.2026.09.08.08.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:51:07 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH] mailbox: qcom-cpucp: read mbox hardware register using readq()
Date: Tue,  8 Sep 2026 21:20:39 +0530
Message-ID: <20260908155039.1203344-1-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 91gNNS1flcFY7xKoooFxZruk32wegf99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MCBTYWx0ZWRfX/FZMv7IR0Yor
 aKB+k/dBxlQsiVa9m8litDdpyQi5iXq9PI91VMg66NlrEJgUOuc9/w9+Wjyv3+IgBigZLAfcaBj
 FdhmVdUXpOddHXiZjtfCQwSfCC6oklClfc704rX4CYXD3+LxGAVRm8LXAt/MtNjpWAKINrVy933
 xLOWk7iXabOUcQP3kzuMPIUcpj26ZXlIVax55So7iR3p9e9DdZ+PwC4nFT5dQyhDV4BmmEZeSrB
 8hb2PB+6wItY8RUozpXMd85M6IyudmO9O+ciF0qOmGGBJ3nCdg59b05nN+rt4iHKzj8SGnmklyH
 k+P60B2ejUvsPd6dg1l7mmGkz8vDVYcaIB44wT3eYqKjxLdycSY1+jO1bKHM71bvEduvQqBAZeB
 NS0a3rS5CkiTAFsM8vvoqfXjO1aQ8ra1tLlBSchZnGUCq7ERrxNBu9wuw4Ocj0B5jPypJJ/3rZ5
 gnFHhJHOihRrDAaEa0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MCBTYWx0ZWRfX8WnAwPRYq79J
 lzGcW+hBt+nicOgXcjjJgsAdXFfdwaSkwNUBYzwX6hys0Nok7v5V1BT4fImG/whGRSS005C9OjV
 xGylwxJjtV2L1+C1nVQNELkL5n7iw0s=
X-Proofpoint-ORIG-GUID: 91gNNS1flcFY7xKoooFxZruk32wegf99
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa02eed cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=zVvgFSUyQItoBg7ASCAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080170

Mailbox hardware registers are 64 bit but the interrupt handler
currently reads only 32 bits with readl(). Use readq() to read
the complete register value and pass it to the mailbox client.

Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
index 7ffc40acea9b..f56a05149281 100644
--- a/drivers/mailbox/qcom-cpucp-mbox.c
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
 	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
 
 	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
-		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
+		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
 		struct mbox_chan *chan = &cpucp->chans[i];
 		unsigned long flags;
 
-- 
2.43.0

