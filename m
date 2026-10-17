Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44B33C1D59
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211817; cv=none; b=FLZklVva5U2oEHrvTO5/NvkAHJSXye4QzljKd+dpNqWRa12/Dmw5uq3aI5DRWBLz3A+m1ueJ0fnZwVcfPY6GvKlu4VaMGxcb/rDj3LWti2cv9ZWfTVkF8VibHm6b6doiRMquQ+3VVgDRe6LV/ZbWUb0SsfYdcfN/n/Cy87/gx7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211817; c=relaxed/simple;
	bh=vjJSwaWsYnkxq3tEubwmtFVGN+XvrRZe3/PK7ZMnRV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wfj5YwByzPhI2ezoWXglIxT+36xwWinzYyvG9gABbx0DUwTqR25CrSWbSpi19U+n4b31tu8XWdx0p5IeLJnsiJdbqy1rNLQGz0mo7/HDnMDKqNaQmghOZaoxlSqCh0d+gdTkDy76DC169LBUt6zZNgerx3RSqefVi1CeXRJhhLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tqdh8jiT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LttDQCht; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tqdh8jiT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LttDQCht"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30RxY942413
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t6TZbpPblNa
	ZUeBPiksbD6ZdKQB61AuoJhc/GsXviKQ=; b=Tqdh8jiT98DD01VVVaQV1vdUyrp
	XEqx9OMtdBQbx3SZwNEDIKLbZQPyaWzDIyzmJltDIDH4IpGJsW+lboXa2lo1KR4E
	KwxxBAEw2nv4MNEyT3e6xnjgvxmNzKNCfzL87EsXIRg+XzrcerraXlMaYss/liaF
	Wn5oT+shUmaPzrwo/ObbfYbgNf8Dp/i3bsv4/L5D4xZv5pnWvCv+NLQkB21lV+ug
	rhZI0se8c2c1sTtteFk+RMndWGYDP5YThQzwSM5+5k4T+/UfJRd+XsTlp+XQPxiT
	Ivvibrt+fzkxC3nWkLoAWtx0gy8mNiVWKgRaLEhGZCsMCh56c8nd+SfAR7g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys0885-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 04:36:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so725592eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 21:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792211805; x=1792816605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6TZbpPblNaZUeBPiksbD6ZdKQB61AuoJhc/GsXviKQ=;
        b=LttDQChtNwTPnf4OfpyQLy8BucMBCTJoBHVv6Ce008Uv4qqGMoVRYpKiTtFXzVXOJX
         GDGJsZpVR3LM3u7dmifF+mbm7htARrmct6ZR7N3nOH7AJ1hrgdGYT9RnZS5WjbbFHmW8
         C1EerrhYV2xobIydZI0zaypsy0AOc8alMkW5ZXGC8Lqh7znv/aPvDsDSQhB6rWio+3OH
         wF1RTWRC5BoCIkeFaf3Cad4r9VnUyqQ8pNKP5rcVBo2dLBsJZKqffshccS4Q49Jwt3ON
         DMb/d8E/gwpdlA/OaL+L/povJyAuFKR9MTw+fE5gcycOwGqAOPMqS3Tu/EAzd/TVPVXj
         AVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211805; x=1792816605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6TZbpPblNaZUeBPiksbD6ZdKQB61AuoJhc/GsXviKQ=;
        b=ZLLaaLDABaEdxcovZx9hjVlcSZELu8oAdE669Eao5788hBHMkPpVjGwef42ehYJX6O
         z00cF2KmpDl9u28q0/SqNvGT6YxIQbvYvS1AhmNIaWZGDps6hsxI3vZzofUGWU94Vvau
         QPbOX3XrLfEfo76vLGrQnX1xFe1DEoJ+tw9UdiSmlE/x4JHyPV+q/ISkoV8NdA/GceEl
         mQ8gsgRSYhovwxZqnECBBA2DxH0kjXr8dvpYlAfSyLgqABBBuIHnxYA/rvZxKG1Fvvgt
         QLbVwdceB/blFhAmumWblkUzsZNxpgyQF8T1QBPGCS+tsEWQX+0w8oXgljlpRqXWvpj/
         dfUw==
X-Forwarded-Encrypted: i=1; AKwUvBx1umAi1CadCkfI5o+cDkNUHzOldAaaSG552mEbuuVuAoFX1I3GAc9Akp1y3hPZCWfSjYTGwldHAjJZcq7W@vger.kernel.org
X-Gm-Message-State: AFq9FYKRNrZU0yLb6DERMlyqVEqZLLhh0dd00z0VZuRTF/Yh7+gUId6z
	4+leNk1RCOF9jByjsoxQy8c9Ci3IOsGIwh0eUfV6BmYSV0+2tZLj8VnGt9aVzwZNEpI78+uK3sk
	FDSRlUf4RjT3jdxJZoXmN1J/3sikMkf8FFV0nwES58NyAQq8TgMUBHGiodTo1jq0K7ncM
X-Gm-Gg: AYBFou1zF2E82eCoh1R0ubBdJyzK3CixqtD4Xb9TZWYIP8vvABmhBAsuyCY4DoEW3IR
	at4iYcLF1C6SGJAtr28A6VUQms5nHH/yZrdw/Wxz7mdpNaO7V1VGHqiug3n9+hKVwLOMke75eYx
	zrCI+bdfwLZU0v19AN0Ga2lJ+Euti62znhq/OKgQqPRd0tfYaVHIo82RY+8pTHMToTeu6xwJw8x
	WiFQzkTTfgECJi26Joel2qzj7zgQnho0pPBmvyqlPOuitNT619txNuJi6tDA6aR3PcK8rwcNzEW
	VjKETe+htbqWA/SxFRZh17B+8jojY25a4s3xe0Vn0A2lx0BWB5EAjOFBo5Zf70fRktvaiV1oCVS
	D7THYLWJc+ofP2ZwlZMRYqdYhfA4XTS54ey3kVG2DzRJutf6Q8cQF3v3ky/w=
X-Received: by 2002:a05:7022:ea42:b0:164:3237:4485 with SMTP id a92af1059eb24-18507af60e0mr2471302c88.0.1792211805152;
        Fri, 16 Oct 2026 21:36:45 -0700 (PDT)
X-Received: by 2002:a05:7022:ea42:b0:164:3237:4485 with SMTP id a92af1059eb24-18507af60e0mr2471232c88.0.1792211803762;
        Fri, 16 Oct 2026 21:36:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm9771425c88.5.2026.10.16.21.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:36:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 4/4] gpio: shared-proxy: Drop the vote when switching to input
Date: Sat, 17 Oct 2026 12:36:05 +0800
Message-ID: <20261017043605.1503563-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX2xMV1rv+h5mp
 RVCz7MD9C+SCupk5r00gGZJ/MOuMVaq57h8mmbXNGDfBBzWN4mYcjt2iHRCNjYn8CX/7T9u6z9w
 DqoYyytoWh/O9d8bzin23hPQ2DK2FhmMBP0dAxGUk22JxWTwy0DwbPhRqwgT+5zMYvt/gz+XKRA
 yl+Pj6m7O7Pco7JwQeolHTGl0HTXNdcsAYBtgZQFfkcYkeWHpXjDNNVs7SYRyHISHvHUdCTY8Tf
 /zvlh/ejuUDGZaZemzl2X6YIBd8nX8uv5xUqMrL7j3UQ1qo08L5hj0GHAyfFAohZ/7HXADDPz5z
 TGn5woIqBfa8xdornIY3dmRGrh8S6mj1ygPUxr3x8a2bV0joq+2mh37fDuOs6Tf+PZVEY+wSGJm
 TUyIZhwNSz90YI7dUQ9w4W6bNqhp+eUDLd1tKFX9NCkXkyuMjEBL/bubppypCvgxHVWDV9YnBsU
 Dk8eMRcukefLaz73y0g==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad2fb5d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ZGWLMo5Seu997gzVtjEA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: EHo3Sd4piMmgGP6AmDKjO6_eev3Md_-k
X-Proofpoint-GUID: EHo3Sd4piMmgGP6AmDKjO6_eev3Md_-k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX5NLmPT7PbAGR
 hk15iZEfKeOGYMHUNk7FPuGkDis7HlUc1zKc+9dpNmhu94mQtsBZ4EhhBrUYbyXWF0sGoHJVabe
 gvMB5ZjAv32vbmqP3vOR2ZqBN7f/hLA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170018

A proxy that is the only one to have configured a shared line may
reinitialize it. When it sets the direction to output, the proxy
resets the vote tally, but when it sets the direction to input, it
leaves any vote it cast in place, although an input line carries no
value.

That vote outlives its meaning. When the consumer releases the line,
gpio_shared_proxy_free() tries to withdraw it by writing the default
value, which gpiolib refuses on an input line:

  Failed to unset the shared GPIO value on release: -1

This happens, for instance, when a consumer votes for a change with
gpiod_set_value() after setting the line to output and then switches
it to input.

Clear the vote when the proxy reinitializes the line as input, as
the output path already does. No other proxy can hold a vote at that
point: voting marks a proxy configured, and a proxy that frees the
line drops its vote.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 456a3c3dbf71..d4680b35fac3 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -207,6 +207,9 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 		if (ret)
 			return ret;
 
+		/* An input carries no value, drop any vote this proxy cast */
+		shared_desc->votecnt = 0;
+		proxy->voted_change = false;
 		gpio_shared_proxy_mark_configured(proxy);
 
 		return 0;
-- 
2.43.0

