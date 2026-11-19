Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088769;
	b=YuXbvmD2AR6PBeJHJDF+LWT1P+K1cpSdC38l3/jOhfwOsbQe3JvhqZ/2KnUivDjl1VDR
	 EewYasqgeM5KLmyQbBhRRWQsCgHrxOyaCB+LKAvhqj6DSPDH2SNo8iQKCMNO4mU5IRFR3
	 vZEXTzINGHTXZnFYLER0T6FPWsFNbj74/9ENLp706li59vGpX8ZpNQjWP5DXfH/7T/yqk
	 mGtvUHNmEcZn/GdYF7nalZBcp/Lgn+ASZAefOJwe0JIIR3UTQSL7tXOHnVAm8yAU2ZCCW
	 17T0KsVb19dw+T3J52NSM/Mn/lXfesItBYKLZzw5Uy1G/0+p0jsPSwVslgn+3Ae/Ljw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
	b=SfgqrVHNBOO7fKp0c2AdX8P7spwhvYaDQR1dq3k+q/bmYIlHmet/cJsTyUvUqpzEsYhv
	 rym5NF4sqUeor83dR05JRdoKYthFQA/4zK3ubfqDoVZ1MwMeX+ShtcXz/dW/g2HcSuHPu
	 Qtmnpm67nIdTU7dO4nSRO9vtay4zNy5j6h+XxdM2OrplxzYrbHKTxUsl21qEEpEwTzStX
	 xfTs5c0Ud+yw7ZBixajsutNgPR7ZSlvuDu30cZ0yTHXp24xiOSDytgn7IwhsDghfzIsKU
	 49OCuATsxTG2qhW/GZGrAUR8apcZPyUTJ5/XdGkiJkyV1nVhoXyveQdYevk0Tty99gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qk2Wfyjq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AI2l5OzQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF02606A324
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF02606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qk2Wfyjq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AI2l5OzQ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBk8wH2843768
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=; b=Qk2WfyjqOsdNzhvy
	JUjGzXrMV4EL89CcRva/75hT2gBy53M94wYUM7rHhZ3eBrgjmQlQr5BwtkwIlSbI
	z/JAcVGZNQgWTe4ZRg3hbXsrBhLWzAxaXRTXnESpvAQXeq7sfe+J5pQLMu+90hRh
	j9ok5yYH2OWHaOC8FGp37wo4CWmcNT01v73BCKXbOYniQbcPW/W3yMigODeUitf5
	yOLOFZgI8BscbVg1iNsdomdMihqi/zF7j+4tB9uUJ66RCamn4F/LaL3tdaKSQTFO
	YFCWKV74TgAxgV8KATWll+H1myxvX9GUd814A9THrPhC94j5uOBN1PN+SpA8eI76
	Q7rH8w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xc6rjrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:46:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so2902076a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 03:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088768; x=1795693568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
        b=AI2l5OzQsmStehqqf7FovbWLHt1lGdjFm1vkzqJRJdhh6uFcElkdkCoZq4V29CqPXG
         hw/HTmdx/WZVcqr95jI3nFjigjbZvEwYxVjUHUIrzgYdhYCaxjy4oiad5PaLYn6wd+Ud
         ZDahYoCBuu797nXhZw0GqO6c5jgAE9YYOzpJH9XO38Bw3fAh3H6xMedpC+hD6qnIRbi/
         Xio7YWZc5yrSoW6lLK/kmt+RLtf4KMY5WVIxvLgTyOuziAckFhFihn2Ja/34KerIg9ux
         O5XElY6Az9p7SZLJ7Lq+i/eb0QsmFz2JU07ucXumWL0MUp6V8zBs7Xy9ehS3EUCShC87
         GLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088768; x=1795693568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
        b=s4eI3cO5ryY6twGPjzOHsI+ZN/Bj++HFYRL7TVs5rph8gXAwyfe9jTZyY20g8RCekw
         XEUO6v6NDB7I3qCMbnspE8d02iBADf8rMOfn5VU8HJuJFL5Kah3lKxze5vc9MweRH8a5
         7OQftDmbrrQHhBtPCbbyFzlBxk41MrXL2yKaASEu+uE1dXdInTxR+vEOuxR3RhC1Hh2G
         5k9FXsU9ET+FjhXJotxNto5rr3cZdUB6vJi1xdz+7Emn8Upqyb6YDsFnWnO8WRyLe79K
         98iCDetZ/GgQbq2Ky6TQqRdwYGG//2fqE6jjREC6/jTkdBYZSgWRnzfdJls1akIup4D6
         OcvA==
X-Forwarded-Encrypted: i=1; AL+hErHdvW9+2NxwPHohfDJB+Q40NAjaxyEB+kL71PDfgD2mZyBjv3jZT+64rboosWgMfd4jFoQgIqtKiU/3UkZu@vger.kernel.org
X-Gm-Message-State: APuU4Z/sFDHEyL06mF5i559AWuEBHXSjqQmXTU95uRglSj64lx3WEwJv
	tzjdzWii5do6CMT10vc8hqUsEUOkGfsTfqRQThFLmzR42qysP7cancUkJ8Dww2uQUI26WOxFoXH
	LAMdZSNBqIi28/SmiAlDV6CfzmuecSyEGTpMldoCdG6XADBA2pYRu/mbdEQwEgnKs71T+
X-Gm-Gg: AZFdTZdM0GeHkvBN5S3gqf/NfIbmt3IrLOmc+mpnUTZUDiLc/MRApzJhxoLoQ0k+hNH
	9UHJfGh0gEU/Hz5xwTye25+ySGD7EGb85EDXudcgzb/BeC/9iJnEOtp+Q+DWiF6ns8bcS27i+OW
	tFdMeB1KkexH0WSji19avgapntuWZr0yf65szZLdcLtCVofv0z6gn97YYHeZJLFc50HJAJtONYB
	04fCgipklNhKu7TB1qlduk0WLJ52RUR3jt77qtJRzCusx3fFNDSQGBed1v8ZDiXpJsVyx/DD8Da
	sRN7TQJ3idhOcreV22VPS+e1X3aOfjsqCV9tHNIxsBROOjQrmGsZwkAtgU0vbLYdfukURxFd5GS
	CLsZ95SYEAidEWTWiFm0lRtxfiZe/hTSelml7iJwXUTIgpTU+xjPtOzQfnI7bknp5zLAQSU62GD
	ldjv8L2xE=
X-Received: by 2002:a17:90b:39ab:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b4062542fcmr1235298a91.55.1795088768152;
        Thu, 19 Nov 2026 03:46:08 -0800 (PST)
X-Received: by 2002:a17:90b:39ab:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b4062542fcmr1235274a91.55.1795088767648;
        Thu, 19 Nov 2026 03:46:07 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm2397030a91.15.2026.11.19.03.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:46:07 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:15:31 +0530
Subject: [PATCH v3 2/4] media: iris: Disable the system error work on
 removal
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
Message-Id: <20261119-iris-handle-unbind-v3-2-52d467a13907@oss.qualcomm.com>
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088753; l=1393;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=mTtJUAW16Pa3NLyR5lT7gqKE4xsReqod6ALEVe9NOI8=;
 b=qzfbVbNGl926ns1jwU1eo1xUOzOesUEsM7o+cod4M4Q0qd3oUHRbO/obYdGhiGQv54XoopBD5
 5zc28B1tTIyDRgxNQSjQm8M9t1GmHC4teno/zUH2Gr7apB5AWqmwdpZ
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6afee180 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bZa8m19-NPAJ73ByzVcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX+BiFuyVnhpdK
 fpN6I5qdSxH9R0TPaG3mwaSUt24dYVU/lQXW3pGTTICUC5VksqfG8ImpCZJAJZbAD/oKyBy2BPL
 pXCXtvXd4tgftcLoyhdlFyZFDaAu6uVJSpphDYNOujOoT2VlLr1TbWXEWdtAr8vPAc0aBNTb7uT
 As3HzBIc+JnCwWzDhEghRT4yl6ceUmizqFcsA8y9kEreKaaLwCd0OpvLlq5UAcj8eM96qiZ8vrF
 qiVa+5Cf7hvDkjQh6PDvDVPhj5yCP+DVeaVWAOr9nXFBtY5NQ514Ip1QwRzdQORPa1pl5vUMugj
 13nLX+5LsCz8L8HMghWJABMU2iF6tLL7yAsxUM1uvigzJBetPnQxxkd3aorVTc3bwiRuaaC/mn2
 V+FB3HuN5l1n1LVl62aa1ZakrOI9XJgOJtZe8xniLfLr6O4TMI3v+MDjxvWj6104gRV9L2YKX4R
 X4r4YSmeYPFW8bb0fzQ==
X-Proofpoint-ORIG-GUID: tACIDreIXpcltLvUX1UmFKC1PMfU12eT
X-Proofpoint-GUID: tACIDreIXpcltLvUX1UmFKC1PMfU12eT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX2uNJP+EbKu6i
 t5pdKXMghIvZWrpZwnkldO17GPlXBZIelxP64WCidUh1xK35qCNhxAIxYL8giuWGCkFtgoiSqXB
 avEt2kVLuiDjxIbs/lZ5oMLCliZfnUA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190046

iris_remove() calls cancel_delayed_work_sync() to stop the system error
work. This cancels a pending work and waits for a running one. It does
not stop the work from being queued again afterwards.

A system error interrupt can still arrive after that call. The
interrupt handler queues the work again. The work then runs after the
removal and uses resources that are already freed.

Use disable_delayed_work_sync() instead. Once it returns no new work
can be queued. The work cannot run again during or after the removal.

Fixes: 452480931648 ("media: iris: cancel sys error work on driver removal")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 343e44c6b9c4..6f02bb629867 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,7 +251,7 @@ static void iris_remove(struct platform_device *pdev)
 	if (!core)
 		return;
 
-	cancel_delayed_work_sync(&core->sys_error_handler);
+	disable_delayed_work_sync(&core->sys_error_handler);
 
 	iris_core_deinit(core);
 

-- 
2.34.1

