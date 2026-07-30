Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC3E453A2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425183; cv=none; b=u0EXEyX103ny+JiED5LvNFxDQPhxyKMYjNYWvu0mnT6Rj0Ik1xaLk4ycdrLUBfPWd/ll7QIxk9Z8cx8PkSN0NJGKW+yV+M+2JnpFTp9df0NgySJVPYfknn/qI0XtLx4krlwWVoxpvkU7/SXHrLtmpya7I9g+DiMVI8/LG1Omzms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425183; c=relaxed/simple;
	bh=I67VC/gNY4kHE+svCnNw4PCoBcF9qC5mK1lQvEAVgpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FuvC7k8TteAc5vY01tSsWlWjICp5OF2vg1PvuUu5Hmf+OBZYSN4JMS/lkUhpEJzinCeilny8vf6zraAvQX15BngcwEsXA1Jkl4NIdoOxnFpGqV89vR0TTonDKVTuMLQ4AKyi+/V7UGm4MLxY2358DWAUmhF5lc0PAqo7m+T/t4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9HO1M7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kOAk19S1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9HO1M7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kOAk19S1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEIolX1252176
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zWxLXLsdWznvcrvfCxX1Ci+cwsfTdfGwDo+TIIWlD4=; b=c9HO1M7dfbR7kVCm
	nJJK/A2Lg55Ulld2VGFo9LMLB8gLsZct9r8pZa/8BoNj0sR0qUyisXtH3iTQZZnL
	03g5Ztw1wcJWy+t+5h3IpQ2D3jTQYj7EnkpI3gBl0K+Iovq7e8JTZ3mggGIlpyWY
	SPecu84c5IhgNuL1yIVL/LSKLmRVF1Cny0Xfls+QueFPhfJopVb8pgaOod1hXZHH
	TIiPe/SR/ZdOz4TUU9DfVr/a9v8tV0dWZv37XnpcEJluAd48LWVy51vB9AGqHPZ0
	bdqHqBjqDrwNXXtrduQ1KBYonhSDmK/9tkNyG5w5GUm81UYZzFUAIlXCoZ49K1e7
	Hpye6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891gc4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:26:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so46627441cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785425180; x=1786029980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zWxLXLsdWznvcrvfCxX1Ci+cwsfTdfGwDo+TIIWlD4=;
        b=kOAk19S13qfjFAbe8GQdSMp6a7qqBbzaRql/XeYwHFbVbjwoBIlNeKZmh1xUuNDu2i
         Qdx/2Tte8Bz7DMk0jyiC+peOVtIhcQzFmb9EEnaGp9ZaGBHm+jbJkwbXfdtTIH5iJuk7
         ANUrWVjf9uniwuj9vWaS0ArdofoypDPJhifXe0l4Vesm9poTv2/W1YaJ8tt3x0dngAe6
         mywkthHQYu3tmp6NqB4qeUQRv3M/BlgX7d/iMWfY8W/pH6dHCen5kM/Vu6l+C1XLHvzA
         fyzQOGrlrbbdPMLirJ51jGbnRLIY9AX98VSqRZ85x5GBFduHENq1pBKN0/loP5CfnvYJ
         RkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425180; x=1786029980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zWxLXLsdWznvcrvfCxX1Ci+cwsfTdfGwDo+TIIWlD4=;
        b=X4fmM0J1F1emJ9DH0pcjRN+Hbkfe58yGswaQRG3EcjCwz6NnlKSQyf+k3OZdLi4Ckd
         pIdNE+ZHJrE9XzMY5htrDJtD94GkGQQuRADJO7MFTMCaUmDm4RJEkSIXQ03Felqv4O8k
         4k79DP1p40YS+RTM4mgeJxFL9tMdDR3kPPWir+lVGb6gxyi2Y4J0I8m75nLYKY+3IRE0
         iu+UNKLEtmWGGZ7a6zCIpxPam/0z9KCpoCbrrW6dQreXSqNA96W1LvRizEasRLXAQnAu
         d/0GeUdjsiOtet+PHojq1i/ttl/cfX8nXaRlv1GuIZpEVMUT0Js0RDX6cTjjuv6IkApb
         eVGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQ9+vdj2HA80R875XIQ6f0Pq0na4ytYWIGQrQ1SMIwI/XDzqmq38USczkOid2m/RhyFLq5cvGKheQMgOB0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh7A5RLzZ5lDx04qo3j0BtJAHijwZRNN1RPAYwM9XA7zP2yqm4
	A0z8VBiHWR6y4xop/lPHVfV87P9rHXENMEuRPSVsV/04gpq5VIIhV/PgJmM5jQx4UA47edtMGfr
	FbTSyHTFE+sUcWoQ0mDsCQE1Fl9chhdT6HERXiNg9QzFD/Xm4e+gnrPfgamRPWTBLhxO8
X-Gm-Gg: AR+sD11FWMJhN7y7MQ13WzcvGbPGprUgh/CxQTMlehXie9S/+H6AMjFKK8G3RGzMDDQ
	HTndaqjnAXUROR1GPr1zAZABjjSvcT6E7ZnxuuMuJtT5gbU+xDNQ22eS9egqlMmYU9BZiQQ42zD
	YgExCqJgAJg3RzliYQFJxdgw4hL7Ugi4TebpfWzQZxP8YtM8yqOMgl61/gkpaBDYPsfoSKmHSyG
	eoLy+2qV9ciGxl/eF/0afgTsfwNnmkgSI9tNVY4EhCIG7jvt/NGPj7pANqfOh0LTKKyEzlnwwSh
	UrQ9GeOpNjG+AGgpqCtbG9AYcW4nm56eM+1V0zB3Tk7a0J/YPRLzL2/bQM5arbpuxXrk+UlryFO
	50q3kNzvOd2FJgK9KH3+wGYNtp/SH0UIvNx5MqzfNsonhX7x0xuO42URjV4wRSdn6ZH3ZtiptHk
	QyfFS0EtdnTIR6cA==
X-Received: by 2002:ac8:5d90:0:b0:528:2e9:c0e8 with SMTP id d75a77b69052e-52b3873ff8emr32335961cf.79.1785425180322;
        Thu, 30 Jul 2026 08:26:20 -0700 (PDT)
X-Received: by 2002:ac8:5d90:0:b0:528:2e9:c0e8 with SMTP id d75a77b69052e-52b3873ff8emr32335531cf.79.1785425179809;
        Thu, 30 Jul 2026 08:26:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ed57asm443160e87.69.2026.07.30.08.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:26:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:26:10 +0300
Subject: [PATCH 3/5] media: iris: guard against a NULL hfi_sys_ops in the
 interrupt handler
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-fixes-v1-3-413d6cfaa8ca@oss.qualcomm.com>
References: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
In-Reply-To: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=I67VC/gNY4kHE+svCnNw4PCoBcF9qC5mK1lQvEAVgpk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa20SrDvstLbw7Mf9CxtJErd/Oh65L+TfXTq0W
 egaO4kEU0WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamttEgAKCRCLPIo+Aiko
 1d1OB/9oegYLMgquODc4uGEhDiGnKCNPlYqZnWKy+/DJmdjqRQn+jzTwou+/AF7pLt7YsjSjPZq
 w5+dzlGMn8mZoMzu3p+jK3pyIMNdmpP4idsc/v3TE8ssFofKqdY7h8/2QkgoztxEgQdWIUErGDl
 PSfh0So7kwaUEojlFbrml7/YSWA/337Vyt3Th3ZV+O9x2jOfwFRlct56JaIhLAOIlm9Hk5u0JJR
 icUSkXN6NEoJZ0qM99DmLZb2a2TNaiZykvI+LfRMgklbCyF8uKIJq0i3CaMm+ziUp70xsGosxHS
 pqBZNpZv/HwfESkPJ3ODjgI+o41DE/pMSyvm04oeOfmcpcre
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX0kzlFIOoQMnr
 1900dgQbV6mJiDCzUpv95trD1hGjIzD5omb1SMDgX1HPDOJbBIyZ95AFIzTgky2YNoT1NSAcEPv
 v/3tLSHyPNnC9n6vLMWCwXtv7smNVNXzYW413CkglfuDDUJuUDLKPODDyWIVZWnpjZv46oMYRl2
 j6VBJtJO5H26xmZHOCgNVUJU2p7gKiMUUitJojWsfssdqYm4uUhhGdnKCVJEJ4pz44RUgqT3l60
 Do9WOp15Ygqw0VzsPvo3TWmsXKod80wivZ7aLQWPcGzXWMzuxvNupDjQ/iJIFyFR7qCNUdiVrsX
 F4pgp0JEvmj04/qyQMXbndNnW3txLg54z9PVkkmwbjCVkIFXoG1YMCZ+xLlNXrU9kvFM0NFN/PQ
 18+oZHIIE2i85cm+LR879FetxUQMXXbMTgZl3rG9sbzeXlo/+BHeTR8eRuBUUr3E/oVBCsnRD9R
 7LKF0Jp92CpAght9fAw==
X-Proofpoint-ORIG-GUID: LskRQll2lHq7bGj2hgr8UsPnMmVQeQyH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfXykz8osPbWJsW
 cf94Kiehy8hwULUjrsC7m2qFTD3YL8B50PPxi4eLk2hbzECY/G9GjEm9yYa3f+alKDZKLvD+Uux
 Vy/rG+tyQfOQEbhqlXfahZbLbrTvs/I=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b6d1d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gNVOA7K2X4zeF1vqfc8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: LskRQll2lHq7bGj2hgr8UsPnMmVQeQyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300117

core->hfi_sys_ops is populated only during core bring-up, once the
firmware generation has been detected. iris_vpu_power_on() enables
interrupts earlier than that, so an interrupt (for instance a spurious
one) that fires in this window makes iris_hfi_isr_handler()
unconditionally dereference a NULL core->hfi_sys_ops and panic.

Skip the response handler when hfi_sys_ops has not been set up yet; the
interrupt is still acknowledged and the line re-enabled.

Fixes: d8a6a63372b8 ("media: qcom: iris: merge hfi_response_ops and hfi_command_ops")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..36fcac4b40f1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -109,7 +109,9 @@ irqreturn_t iris_hfi_isr_handler(int irq, void *data)
 	iris_vpu_clear_interrupt(core);
 	mutex_unlock(&core->lock);
 
-	core->hfi_sys_ops->sys_hfi_response_handler(core);
+	/* An early (e.g. spurious) interrupt can arrive before hfi_sys_ops is set. */
+	if (core->hfi_sys_ops)
+		core->hfi_sys_ops->sys_hfi_response_handler(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
 		enable_irq(irq);

-- 
2.47.3

