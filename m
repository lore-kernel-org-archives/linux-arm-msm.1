Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1FD48097E
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046312; cv=none; b=mTrnozLEYT5FFuR5CnVxECgV2KD6lSfxx5W+4xUKvsYNNqDjReXODPJEsLxLrNVYoZpBdF40DiuvmzGZ8AbSiZhhhE6xnFiBbkJEpxPpIgieiiz5SE/bMud9PRR/PN8oN02eCtQdsuICbpTKV4oUiVMpTZH0FiGTeHDLtKUbjSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046312; c=relaxed/simple;
	bh=JYTMtNgj/5fZcL3ftFEkoott1ir+FEvQxYenqM4wIjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VuNoJmT8AvLzCSNLoImK/2MiSJHgO2etCq63A+WwfYav+2sAXYvLugoS3zKf9ZW+jrVYORseJscOtQfaWq342dhceV5SpOWzw4IUlp4FsUF4SzLN78lDylLKyb1awzeNuNkPsdlXo49L48qz7w9lG7hjz5KiObyU/Vn74t4mrkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvXu1D1e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3N5nEYx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvXu1D1e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3N5nEYx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6SOY01682636
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vn+PAPU2yd7dK7uPhM98pxh8Uq/TtLrKIIgwoWoqb3U=; b=TvXu1D1ezG/STOX9
	8R0AFj1gTvm2/nHC15+MuZiqzspRvk1HLnKXf4UGL7aK6ufIT3D82+PG4lYDENed
	2FEX1L/DHyCgsk0SpV+bJMV7i5db5Wksppsd6LrHXuWR954+54infdTFRWAfc6YW
	bZv8xx7yq1k2Hzz3L6Y8Qyh6XKQCljvo+zVecVDMW3aeMfXRxmXaQI9qxU0dW7fV
	MUSBOlwWv8HVFwqdnE+r32Jx/13swZ3AyVazVPPCzxCQFFJzb6KbqAZEKPMKH2xn
	PwSz4sp8WioAma1ICiJPmSgPV9rCceidSbBNB0Y7TIy9Q5o2t0f5IYzAsGWxt8kt
	aSeeKA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb032hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:38:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so1954422a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792046309; x=1792651109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vn+PAPU2yd7dK7uPhM98pxh8Uq/TtLrKIIgwoWoqb3U=;
        b=B3N5nEYxZ9ZHvBQkwV6Lr1UQD+n8zjUI8xSG5EE4LrzfycdOhNqYPWGzBCA0BqtaNy
         CeMLdFXiZ/3/cePmRPMS2yLbtdNxGJS2jpT6QCZVvrvxZzoyfADq1ZpoyXBqdoi6k1Tw
         +LM7jBF+9fwRVDTy9hS+TU1nHeiUIadaU++m3rt+XVW1OG7R+cc7vW6GdGiy0ciGNaMe
         SCW0yUcfWV4UD5TRpwlUOuyi1G6cglHmvZMSyGjj5skix3TxLp/gF9EITY9BiozNFjew
         A4TqioqTii3RNWogwu2DJXUTKKths8yQN3Fyg67P0YMyBaLNcEMQWr0uiD4iSZCXWMvD
         ZiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792046309; x=1792651109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vn+PAPU2yd7dK7uPhM98pxh8Uq/TtLrKIIgwoWoqb3U=;
        b=HL2RQ4swx13M1kooOJzho9NNxlz42ll+1djJGTILPBUX5obDbFGeJPGh8psgK/ij6Y
         fu4lDgyGxPjMfypj9Sq8DX05pDS1MlCTCt72j0urm1rnOYtgWPzd0MSw27GXcWr0HYhq
         1+pmoXXUBJUzQEITfxZV+SaAE2E8i7uIY2P47fsRQ52VGZ6opa44ZPM+UA/UDtMpyl4N
         xy6M0oOIVnXhh4jKiRlJsoDxpJc3fbMWoiR0SpGRPkv/ytkJ1WKQZT1tFO0YBGfi1TF8
         g1otkHfjVZuNJXfAg5hYomRiddxswvZu1o/gbEpvaruBPe0SH12pIE96OVFaMDvSMW/O
         OFSg==
X-Forwarded-Encrypted: i=1; AKwUvBxrw/avRQLWGIhxz6/5g7jwiPSB2G9CLAeemYenFDlJoI7ZWCZnSUASbzQT8OacobZ4q7bM9aaytvVosF4O@vger.kernel.org
X-Gm-Message-State: AFq9FYL04LnABDqKxXMK+aUGTEPkN6UT7CdVMuXYHp68d2RBJcIvvtw8
	jCpPvlmng2Pa7CsEW14Qrbryv4kuO0Y8Cfkhi0Mx2TjZhI4DmGfRGoSPpjibm4ivyZgtebmRm8n
	8Yk3mjLKDQV+Do2Pc6xu9hD7/gVGvRVnnXN2b3gBbHt47l67MXB/Q9ucF2fGY65sZsYw8
X-Gm-Gg: AYBFou3CkqxWxcJ97ksVIzuiqErBx8LE0tM/ry8Y1sFBY+kYeu6VGU2yUbAKSmEXadr
	JW3aGUejpNX/7wLAbxBvdE/J+mNf/MAFdptV0V/P3qrqsvaw3sygmoNH8W41PgkOP62LivaFKd7
	5YUUKoKCEKrDRlCVZKa+DQLN9hulBpK3KAF8EV2W0G+0ePxUKmnuvMsYrO9mBHCnAPMPrYgxl8Z
	bDFDlEG8kEQaSiCQk/bUuhUmy+sXd8HSQK/a1TDhmzVYSNh79YAbgvyxAKAMfrEMgCURj4X2RyM
	Uh02/NRXt8KydeSA0wK0xNHLLBiq4lctak94MbmatESrTwr5V6Imt9DKUFotfRkwdWb546BcvZX
	6YPKxAgw1sxSXQFlXCPumlC6PkmQJj1c+
X-Received: by 2002:a17:90b:4f4c:b0:3ac:7377:fd48 with SMTP id 98e67ed59e1d1-3ac73780712mr3644501a91.56.1792046309409;
        Wed, 14 Oct 2026 23:38:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4f4c:b0:3ac:7377:fd48 with SMTP id 98e67ed59e1d1-3ac73780712mr3644492a91.56.1792046308950;
        Wed, 14 Oct 2026 23:38:28 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac93ff4474sm2844429a91.0.2026.10.14.23.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:38:28 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:07:48 +0530
Subject: [PATCH v3 3/3] MAINTAINERS: Add Qualcomm TPM driver entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tpm_qcom_driver-v3-3-247c8e50250e@qti.qualcomm.com>
References: <20261015-tpm_qcom_driver-v3-0-247c8e50250e@qti.qualcomm.com>
In-Reply-To: <20261015-tpm_qcom_driver-v3-0-247c8e50250e@qti.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad074e6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tHMf5gnvwFDjO4kcr9MA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyNiBTYWx0ZWRfX8ySN/kzd6RWu
 9LIAKfDRn9nG58W8I+vk1rjNgzAw26v0jbRIgZVvSfSCX7SNHO/sv3REMYI7jAFQejd4bPK0bVG
 35HYYQlHrsKf/DF1QUHpVpKTl4qFHUU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyNiBTYWx0ZWRfXxWxpK3LUv9I8
 8RK1H/PXCL4FEXzZKf2hDUyBHcbIPqrQDGBm4kPNNS6UEFsQ0PC6Kf4qRK5mojilPVWzzkxHwNm
 OJ20S6SIJNXVXN3mJMKhHwcml3YVhxVPjjxg56SExy1i0cOEk7kbcgNpZb1gFh2AD6vmHvqUi9R
 L9DQvZP6P94JMq97UMVZPb78SEGJ+pePftxlRPse168H70c3+bbk6EBBv3lvhGj3G2TO+l7/0ko
 m0T9JFmJy6vc3LB/EibFJvr6CIODDgEeZqrTu4CyOsSc/ByczNgaSKY5spO+HoUU6qEQjCfu4SC
 NuTDHnLJkeKtfNjzJ8clkHiKIu4IuLN7K8mIGldpUjbOgod6gJrV3O3ZegrL2Osc81eHblAA2M1
 YtnKVQF3MEqDewbzsOvjHqDWr3TElTwDMlDKaOOxwBzm/iZoklsRGXV0cn0KcHS+q1rSpt/eaVl
 FMH7L2exXDnEPdRGICw==
X-Proofpoint-ORIG-GUID: TsX3Hz5dkP7nGf5Vxlj7QkSJ8cur_Yb9
X-Proofpoint-GUID: TsX3Hz5dkP7nGf5Vxlj7QkSJ8cur_Yb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150026

Add a dedicated MAINTAINERS entry for the Qualcomm TPM driver, which
uses the Qualcomm TEE interface (qcomtee) to communicate with a TPM
Trusted Application running in TrustZone.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0426fc05a66d..618ebcf39ca4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23124,6 +23124,12 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM TPM DRIVER
+M:	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/char/tpm/tpm_qcom.c
+
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.34.1

