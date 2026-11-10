Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319910;
	b=Ug0VLKGFeI8N5quT/pUV95KPdiB3Z2A82nKXPbIVHtIwhUS20o+Reazlz5PNV6fW3MTE
	 Nr4N+6wBKBQEcRReNf4A5cHCWPcCJBZ1vY9jM4Ia9/BfK9rhmFdtY1+Ev3t47oZXUjk33
	 GsPsHLhmVYiTi0VzfP+0cvlMqB6GICraXmZYUkXkBba6hXAUaklF+ltyNm9GsKCHa4SWJ
	 LEawFNlQ9n5y4AEsh1hL9C5j0MMOIYErbM9xb/A2QZOgKVwlQgsCDMHB/hJxW+2OgEHYp
	 tBnKqO19pcsyGdrVsi4KvFzgocB8cZ9SGYN/o3xmFX8woWfaX2y1UbVsn59Aw/PV+yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
	b=KBFMbENS4BN3AVWKAew2r3VSZ9SazON8vcRN8tNECPawNLRIzckSamASBAFiY4Mz3/Lv
	 w1mWRRotMzHucyK2Gun3a/7jdh712YubOrMe/uHCZaFP0WPjDqIgVsT9p1YmEipue4JwZ
	 9YkOGJIG3fq+13bDePRH/SZSXokuSTYVTClXpz75y0RiL40UTODEK9eEwED06FR9hVued
	 5sURWDWv4ofcFjoLXGP/yZfoSXKYf2rp6nLCByYO9KgUR40IeX8NjPZFVfSoZrtDgxnvx
	 ihjRj11hogIMX+i9JYI95kqsvJ805WYznwW77Izf2tdY7ibJtVX0kSKt226GWAzHtwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=blpI6bvV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NXeO/yq9";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B37A60A2621
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 14:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B37A60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=blpI6bvV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXeO/yq9
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAE3WrC028683
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 14:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=; b=blpI6bvVI0nv4wLC
	GBvh/yOu2RQPe6bTSO8Zi48zC4YOA+3DdgJFlraJb3dohvKvsQRE/hnbZ3uvR601
	d1zkcrmuK7O7hKlLbED8tzncGDiCXiX//QBigUEUDkb1wpJ0mXRdKQDU1vPbVOCH
	jlCEbMxV3WTQ4gY4IP1d/C4GMerq3N7ZqoZj91IF/B84B0A6vRzRSQnzx4T0BSAk
	hIIDEvMwkZUPmMQTAIrBcQI32/WkeWZJALbLi2MXPBB+vWPULalQeFopTl87m4ir
	4PxLQn95D6DgOpeMEUWNvNzyA1cpnAmH8SPWxojiiZyvC3JxWtESUDhpOVQJSNFW
	nD0T1g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv817u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 14:11:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so3419430eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 06:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319907; x=1794924707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
        b=NXeO/yq9rXyXpHbJjOJt2obvExYi77dvmusesoVb0TcY4SiAKXOh81V+fSE8ubRIun
         sNra5QfacdKdnikb6NqgqiY6fdJIhSZGLLR0Jg1/48ZjPMpexpK5WUZPrL5Z47kodLT6
         G+lo3PZz3QIVblKQKVUW2RQtiOnUAp9/nAmkgiP4cXX5MCu+jkr6MNTh+j4DdxFmWBuX
         2OTWIjmEKX36k6s0IK77kzBM7i5nas4UBrzb2mIPFCd/gqm2ZErqsiMkGP12lOh/Fg3r
         9zx/cBbC1sujU+s/icVhOaA/2bhmMaURKdkdoeFq/jx8YaDWXo395uMsTj8qHCxPI7lq
         gVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319907; x=1794924707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
        b=0gQZP3fjPSe0Vmk+xeYr/oPRcIXJ9ySraVHBlLjWBkv35OEpfOVuT0Ta6KHdp4xB0t
         oRcnLoxBUAf33mahib7tIoqyzR4M1RwXFT21351vlJEMz5qAwKC7QC7NHK5XqAmLNM/i
         5mFobg6duAh13Jw5F0cVsm0i4cmbho7MkbwZWZGzeYopGsPlDVAS7L6MTM0sTbKw3Nid
         5fEVuRbjE51jUxRGd+R1AOk8J5s6OODope8ulgk+aAb9/0jnLLOGGPpNCl4TQOxhljcD
         8+zabV7XfRX0mC/Zj0OAq2lcnwuhN+B/jSZI37C/dTTZG+xXJ9IUwV5FX58sTScV0M1w
         ijsg==
X-Forwarded-Encrypted: i=1; AL+hErF/xwC6/i/dBG6/RcD3C1CSZ3934SXV1p/cBZxH/xNv3212H2hvNp5oCCLInIqYQlSzRQHBlOGcnm272lL1@vger.kernel.org
X-Gm-Message-State: APuU4Z8FFuKmjs1X+/wgOTEcMnMHt1e5H72j31GzaZTRP0tozV8XMBwy
	diY51UzrFbLPD4HKtylg5SveIwkOsWTDnyHxA06Gk+KFAxoqCcN3xWrcr53rRwzNEZVo3tUdpfK
	wPF5c6bzM0S43Z9di7cHK57ruRu5uSn6c/OKhAFwWgD+est0Q63Ey5wlZT64wdf9qpNMI
X-Gm-Gg: AYBFou1jQJSGGQHNh6R10ZLmYpbmh0aLG/Z+QmRXOLbkQvLBYTmTBmB33wjE0lL6Fns
	f9tJyzcI1mNCbKaHK82ma8cENSqjmWPAuqS3woMxfuuMSiwZFjZCr+wyJPMUCOfb16lGnOGdK15
	YJJmUtIXWFXbonurm5WVWYOlTcABea+pslZJxz8do/vvl2nBRiBlkT9D6KNTaTWCpr4mqnGPOGY
	GRDM7ujoFYG7Sh8wzfDGdC1d5pNVvETtE++sia8LuGtZ4EA5O9PhIfZVk9xTrFO55mhBTr+vMHx
	+o0vdLsXyy3HEs5v9HD1YyjA5rFQ2DNE5lQichf3HUcFLpU6pQeNWCCS4hV3LBw5n7zktH123ug
	4bta5n//tNCp0yjV6JkXUstJs/xiG1JFI0Vl1jJ4YIAZHp4g67ypV+Gl3eoKCdEqafKJ+W6dhZc
	ArKWLd/ms=
X-Received: by 2002:a05:7300:8252:b0:376:2e3d:7c62 with SMTP id 5a478bee46e88-3762e3db094mr431889eec.12.1794319907342;
        Tue, 10 Nov 2026 06:11:47 -0800 (PST)
X-Received: by 2002:a05:7300:8252:b0:376:2e3d:7c62 with SMTP id 5a478bee46e88-3762e3db094mr431835eec.12.1794319906552;
        Tue, 10 Nov 2026 06:11:46 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm8059128eec.27.2026.11.10.06.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:11:46 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 19:39:50 +0530
Subject: [PATCH v2 2/5] media: iris: Disable the system error work on
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
Message-Id: <20261110-iris-handle-unbind-v2-2-86d5f6f1dea8@oss.qualcomm.com>
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
In-Reply-To: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319890; l=1393;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=mTtJUAW16Pa3NLyR5lT7gqKE4xsReqod6ALEVe9NOI8=;
 b=sgYIsWk0J+dy5zR0+93KaXAWwXH6anaB/lPVLcrZptFqpFLlsKwfzf3esBGAbCBTIfiKr11Y0
 Zn8JD3+yTXRCoeGqwa1VUCFVDlEm+U4fPN+LNjyiQmq32Rb+/2MK3bU
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af32624 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bZa8m19-NPAJ73ByzVcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: ayLIQqzen96dYAZD-_y04H0XN92WjK3w
X-Proofpoint-GUID: ayLIQqzen96dYAZD-_y04H0XN92WjK3w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfXx/Co+FHldRTS
 syYLCXKzmH1/w9VRx1DvrJlCAXVjEw6P5DkfS8muGBUpAPFWT0frWCd06k1TspGLKWaB+Xm0n5E
 2uAbENXT3DNe3ZRzuTkRN7j22Lf0E5A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX9UZ0tu+A1Oyv
 R+kJLPHsrQqZ5WwIcMha11m4eOlAEpVNLXuG6H4TBL3TuHQO/vc37n18Oi8c9Zi8HIWgS/gOi2H
 BPXlc5xriDGSCyVaEUW7oBYCDfgcmGkAmUCOIp9x1E0NagCrBdmUGF66P1tTAbcg+9KnqpDxjU6
 /EfR9fstPzjP9P5C0tcr5MwIlXPhFEbZWtC8JGgmWJsl7NqH7c9jcZCjj1k16HVx55Ym3k+fOL0
 Pbycwzezr8bdA4wptel2HoIseCdYjp2aCmJn7KsaBpHPLk+sLALy3qCJb9x/nkgzCNO/v/ZesvS
 jra2I58YsiCsShGSYP6vTIkZe4MT7jy/+a0bQvadkeSWj4T8f4LQJb4TX0+mrImTYb8nMrGILKk
 uzFPC1LSXaKHRu+YZU2sIGpJRE6/ZGUnChxMH0Dvz7IgsGWJzoD2NU5+KV6UoILt2/ZOqFp2fvx
 PfwEgsakh+a88MT5s6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100055

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

