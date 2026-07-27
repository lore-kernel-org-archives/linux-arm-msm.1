Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED6C3FF1AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173622; cv=none; b=gwCNIDGVr4mpUpvStjm09wgcFM/g8vMnvIJ2ftnGsyUCZ2PUEiK55zbUkTDiAmIoxrwQnMedhaqNjLVqMM12We8HxFqTvVblbHiadCvZW7lfOB7mi08Kw9rCpz4DEaOZBBxygT+vQeQCM4W2M8C3k/vurG/7Tpa262Dk5/X+UQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173622; c=relaxed/simple;
	bh=uozLiHlkPj1kytXZLfJ++Gy800b9MPYR4yUf8/+2a8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MNKVbq3vgsDwVdvxOHADGPeBrWRPdYCAUhsPKnsS3Dn7qal+DSm22UPlYVpnNKiPvmV0/vTI/A5NAkAd0zA7cSEdtekifzA6bhy+cLjRf5pEMe6+StzAjXwpcTq0CJsY2sXIE8Pmj86uKm1CXxwIBjNT/xIKqVmqePmLxWXz3AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pdVIoFAe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCzyUB1m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pdVIoFAe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCzyUB1m"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RFu3oM179442
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cF8c4q3C/Ch
	cYb2N5kbu5QRV+XcoHZMqcfbrFNapFxA=; b=pdVIoFAeOdYcXTrVdXPAj1blwyv
	+A17VSDPKhPLcdDW3w0NBJEbXSTaHvN1p3osEaROidbMY7Il3PtkRlMGyEtC2t4x
	kkcmY0RWqJPnnBTI/90uEPmdNoehFc0BV+x1kIGEfN0dBqjCUrQ1L7mgaS4YTROg
	6fHU8KOqU3O7RSPt8MaKXb+Co+bKYXzh6pg1bn7k+G/VqGTYTl3AKiGRYGa95d/M
	kUvH8zJj06XNaaqzWOqW1ooZQx02M/L8lytdVS1QCAEMk4fK3Nilg28l7gjPNfAk
	GP1f58yaVfXvzjHJXdsy/mNp3dLeENvM/tO/QDUqPDbkQJvHd0ioynz0Rhw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpadkggj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso51254431cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 10:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785173620; x=1785778420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cF8c4q3C/ChcYb2N5kbu5QRV+XcoHZMqcfbrFNapFxA=;
        b=iCzyUB1mCsROYBIOOB8d5HCyZ/f9yDfH6GXV51Eu5wmg5xb4wN9wvFDxkzgqHcvzLM
         F1aJVG8ZkoWpzES6AqxQRLndJ0jAFjQ15TXbE0b6cwO8ct9XYfDM/OJAbc4Sad0bH92u
         MLGP716toDFNnHGA30zlRgockOOlpp191hBZzHL4cdH1VPJTGY18ycg4laxa7iHxaSfw
         p8b25U2beEaEwsk3tLm+4IqC3GMore8Hhw1zLY5wQWZpuj/hF7BqTBHgu5KH0A0oagmi
         1KvMwQG+TPYlfMb2LRwfJ4ijJuKJgwxS1qcnvZama4eEeExxcgtS4xcvOZKFPNeLsEuK
         /cNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785173620; x=1785778420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cF8c4q3C/ChcYb2N5kbu5QRV+XcoHZMqcfbrFNapFxA=;
        b=n+UuvCjcCEgbf83LgNZ9F4O2Tr0YCA7HBDbZpqc2xQ7yPnKxX8OjjFGboxfPu+0+sq
         C4bChpUtXHknHi0ZhBYACJt6tWoJZB8Mpi2Q0ZNjhMaYgIsKgX2iJ1N7MOTllKDsLsMG
         qLUCTqSCdVHVyad4CuFH7ZksOh3pKLQcwIxMZEqyBlhAvWmrr65eIiUXkq3r4tpd38XX
         yHx/qs5l5SRdDD+nNgikTQqhbp8dA8YzE6uiLyezx/Ybay8JK2BznTKlczKRGu3v4DNl
         eZ8n0PUCTYSBIOX0suCWR2/3FCJ+c0Aihf3bfdMF//03mXuLuo9ENCcpCdtaAKIUFLLE
         z/2A==
X-Forwarded-Encrypted: i=1; AHgh+RrimK6vvAdK8fcgq68vnXo3oNy+a1X/XnV8HHH9YJiOyLRtLT465zYr8PmzDEC7nyBSORTiCKKT69rGZSp1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5c27LthXKIduCEyPAbkYo1obuGYNFWpoHawi/ITa8wDtynmSl
	szo61aa4rtRQB1+nmNY7VgjFmS90FLBtcDnroYcS5T+8NUZ3qxCK4sCB0mgf7AVrFwolcEw6ztE
	Ts3KJrTOtNb7khhARiypOcU8mX8yk5Y4SWzE6hpZbhvOPxVGUFyrpNcwJ0cFSekbrP5XotOpH3i
	I8DeE=
X-Gm-Gg: AR+sD136nh1lEr0chAT9A9hBa35kaJ7esTqmNxy0aloWpQ3VIcp1+clwGPDNEqM7IdA
	GRiIIFxjvK4vtIgXH+G6l2fgRsj8j6okbHSJp9P9Zuw3xGhfOZbrvcSdOdr+8cwFrcMaIfMZZ+s
	bZz9wDwMzls5toes4uM/2stszGjKhI5gwq/jkU+lLB4HiBUUgxzxuyMQxoZYoRjWeRvO85g9+2w
	Mgjd40leN3sDVsWafu91jo5/HHMoE7CU41SrfSV4YHcIAULvsP1mlopQKZBB7bHUAyXeOBAGmio
	yrRNoDHfL0Tb7DWPYt2VgkkBahm9HEiTEqO3SVr4Rl+LlxUmWwnIFKmk7rRYJiK+0qVxEj+7oXS
	Zhu1JJaOf7rdtv87jKs0UoSxaVx3PYS0wN24IcLJX
X-Received: by 2002:a05:622a:1dc5:b0:519:5680:1b5 with SMTP id d75a77b69052e-529a83a1c35mr97301001cf.21.1785173619701;
        Mon, 27 Jul 2026 10:33:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1dc5:b0:519:5680:1b5 with SMTP id d75a77b69052e-529a83a1c35mr97300671cf.21.1785173619206;
        Mon, 27 Jul 2026 10:33:39 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm2945391a12.15.2026.07.27.10.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:33:37 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] accel/qaic: Add <linux/device-id/mhi.h> to qaic_ras.c
Date: Mon, 27 Jul 2026 19:33:25 +0200
Message-ID: <20260727173326.2219191-5-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
References: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Mn0F66TYB4-XbceVMcsHguWwCrI0W7OW
X-Proofpoint-GUID: Mn0F66TYB4-XbceVMcsHguWwCrI0W7OW
X-Authority-Analysis: v=2.4 cv=Ns7htcdJ c=1 sm=1 tr=0 ts=6a679674 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=k-DYV1Y2ufZ2VE7ThZYA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MiBTYWx0ZWRfX9yait5Ks/XXm
 VMs2uxQENcy7FZDfPcqDiXygwXeBlvfjfwv4FKlPlIQYl5X8BhAFQuE2/vFPx3JcoFS0y9qsqX/
 o1bk20rbmIaI/ARVJo835aSXfzGyesCyzzDhVb9L21UjBUZ/SAgof+e5SPaTRnve8eFlmuxYGYG
 R0bUbHDa6GI81hW8DrgGDTaIMNAuTyRrv+7oXlBAb7EfHzn18wzB9X5CpF2+pLhXwNkmVucSWX1
 1+wh98vJaBOJMjF5auwz3qlvPLPmqTPN503sVAT7cgd3NojHXXfTWqwtSjv0hCn7McohY4aqBoR
 2XULzleZRqIIao499etcRZD1BWeML6u5ESCS/a5wvFY+NXxZjZEyJ1ARONFO73E69gd7QjfTHp4
 oISsa+FOor8QdUXrjmzbkONmzYgu8a7Rpn7ffgiOQOaO0aHLXq4+P27jasR63kvqFyn8mUxfpuY
 x9/o4oykhAOiR5fxCRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MiBTYWx0ZWRfX/3cgRRydSg0g
 30jXM+avVw8LsTzRuLTsyX5Pz/wHjAiz0p+J+m6u2IS4aca74JhEBiE6TK7LtyTNSDKj+dxuNxe
 jprSxefVVzACxShThZUUtxpk6c4hmpk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270162

qaic_ras.c uses mhi_device_id implicitly. Include <linux/device-id/mhi.h>.

Fixes: c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_ras.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/qaic/qaic_ras.c b/drivers/accel/qaic/qaic_ras.c
index e0205c2cda3d..236e520f708f 100644
--- a/drivers/accel/qaic/qaic_ras.c
+++ b/drivers/accel/qaic/qaic_ras.c
@@ -5,6 +5,7 @@
 
 #include <asm/byteorder.h>
 #include <linux/device.h>
+#include <linux/device-id/mhi.h>
 #include <linux/kernel.h>
 #include <linux/mhi.h>
 
-- 
2.43.0

