Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7924C40D57B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294198; cv=none; b=fHmzsTMbR23aoAyO0UN3Vcdj0Wm0EaazTIOssdk5/9RbTRLvuZYWWnKcKw5oAm1/sNTufq66Waa8/0RutpR5lrI3ejkt0u89i8C7rJ498oVZxdrlkP/t1WJVT8k5+uV1wZXcneqpEUN+qYx+kIYcExq2fccOZbEbBLk32619AWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294198; c=relaxed/simple;
	bh=gZJAfTY3BHN4SpZtXuYVir/rz1xZsotjK6RAexDWS9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QKceg9wF3v6AYzk07KEE7B18JaGb4dFh67pQtg63XJXQoF5hVBIJuhb3gJ5p0xPXSJG1KK3v2trY0X8xbUzGTygIDSKSbPtfwTRmA+YeFO7Wh6unwlhlfYAIPL5N6PbZrG3P1IJZa87s8CKPgPMoUqESKCKKNMJPy+HiyvMOxBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2BOWTfs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMZQVTB+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2BOWTfs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMZQVTB+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5Taqj1042239
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sv4OKfp4ZqCdBoH2aBeZxcxEWRZQzQZoAtKASLW6guY=; b=k2BOWTfsg/hCDozV
	Yd67REK3AIEz9PftmfB/8RLZk7SLmTetBmJjrz0hWGswNxwl95aKqs8iny5IRDr9
	w+cx0Nyg6eEDvCMjJBiyTA5HzhA8xtreWPS63voTd5pT1pOOBHWgYBkoLVP5/XCB
	EPAcU79tkAqShpFqXXRr0KEjCXfA+3Xd5l9xu3mAI/LIW6kp6QSC5xsvmnU7HJ05
	7C6OSXFQ7cNh3jLV69L5/L9V0KyYDwRgs9O3BOXPIuvYtWuJF0m8/n8bg/du7pvK
	QDHuFuqqgTo6vXl/+o3eigwdijptEQ+21wNgggqdI2pH79EINlv/ezp7oFNanUEr
	VKMB0w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fue0anc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:36:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso911498a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 23:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787294194; x=1787898994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sv4OKfp4ZqCdBoH2aBeZxcxEWRZQzQZoAtKASLW6guY=;
        b=AMZQVTB+4ZgG8L8gamK00hLDiHv4Yj5+1Y3O43P4mnOmA+9GCOWeYBp1F6lwAc60ne
         b8x+vrf7fJ7cYPjv0f4saadtBAcpiLUwEVmZLdzjKa0JKjcdXzSnteZ09U9pi06l27pm
         +SvuSGCuetrDsH4s6j1muXSFh5ks2GilCVOvlVZyVwnWMNSAVc8udw2cxd8iUltCgodK
         TxldrM4zg6S1NRZYH35aYztk7A5UrLELvWFhqA9nVetX7/1LjxrZEGk+RtmlnlaNELbc
         LitNLc1g0Q9D+EaxnW0yqdMILYXRMFERMvvZJGWXjE6lAcjLFdjNiXVqlNfu2VKzVphO
         I8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787294194; x=1787898994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sv4OKfp4ZqCdBoH2aBeZxcxEWRZQzQZoAtKASLW6guY=;
        b=mgDp7mbFRrx3R73cTOU5EV0yEAQQZKR8wreGMxK5refn8wOFn4XojmwQHLVc28hE2H
         xTM0Ip6y+5Deqsd7SbK9AWq2iIqYro06DHbkBQxt05diBCDIuULHPZ9ejlUoFhZQ5E3e
         IJG/AvqCI9lxlR/TKzCAXsyIlY/VpnFBWN0L/V6d5eDy+3sTB0moYIBa35+idowfnix5
         hmz8xpL/94EIMEKLJp+BeaFVtOHVm9ArJMpJfUv87Ibj9oDjIl94sNEOHv4TEhSYtuCC
         VraH6NzaLtwghJcus4n0bqqD2Q6tzhgzJrywFiyspzQCubroHPP3jueqJAWR54EKBPan
         /WTw==
X-Gm-Message-State: AFuF++k0Q9nTNPblSgcRoqosa5usJyU6xyuKB1wnX4Req1ChovBYDLTT
	DLKw7TAqWNC+91ZLDC2h6NRIQpKiXJ9YHs/AZm9c3BgHHVUdm3SHdu2Zj6HdRXg+RMhVCeJJa1G
	DxXZ6CecMnVspHWOih2exCc+vb1Dw15FqcObxazFrrHTvDN8doFQ3gzs5tP5bx6YnryiI
X-Gm-Gg: AR+sD130cWrhZJTvUu3l2zG+NbL/DT5OeHY4PFYFiOj7r3Zf1cEGeAr31SFJrFcawKt
	vSg5+/J23rgazaoWkhBx7r3O0ijD6bqWtu/vLPJ5dKP4TFE9n3fuT+ecxREwEM5Rf4oNjwTjHwL
	5yguPpEqRiKuVyoi6fdBHBTzxktyyfp6qHVFqx78+bnktksCF/C6dYDv/LCfUkbKgWWqvzurVZo
	lVWumjRuKEnyrAlIkmp8CAOPCjcpkqEcJlgc6ST+et+ObdYXmAD8Hhm+OO1wvacOafp6QGiW9nd
	G1NB8MjhBix99UirRi1SEXqdg8/Ed44Gs8TAC6xnR7FXB/eAbTxhI5hWV4M1aYpvK/DU1NcGNaw
	5INydoyHs9odNMGwdue4EEdaKhIoNWZIzQ5Xd
X-Received: by 2002:a17:90b:3d87:b0:38f:837e:fc5d with SMTP id 98e67ed59e1d1-395c334050emr8076487a91.3.1787294194258;
        Thu, 20 Aug 2026 23:36:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3d87:b0:38f:837e:fc5d with SMTP id 98e67ed59e1d1-395c334050emr8076406a91.3.1787294193815;
        Thu, 20 Aug 2026 23:36:33 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c3da9csm1787377a91.17.2026.08.20.23.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 23:36:33 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 12:06:18 +0530
Subject: [PATCH v3 2/4] soc: qcom: geni-se: Widen fw_size to u32 to prevent
 wrap-around
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-fix-write-to-read-only-firmware-buffer-v3-2-43e6a3abd651@oss.qualcomm.com>
References: <20260821-fix-write-to-read-only-firmware-buffer-v3-0-43e6a3abd651@oss.qualcomm.com>
In-Reply-To: <20260821-fix-write-to-read-only-firmware-buffer-v3-0-43e6a3abd651@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787294183; l=1169;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=gZJAfTY3BHN4SpZtXuYVir/rz1xZsotjK6RAexDWS9o=;
 b=3GL0AGQcBRvKEQ2JC8Pb3AJIHShOyU5k7vI8JqyFCz0Iy3iD4qbQzBwLYL5nBFBKQ3vtrAi3c
 2E4BnGTM619BA8wvMdhmFYO+SpR0Svr2BknTdobZzsK67cumvySYIaL
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA0NSBTYWx0ZWRfX/pjZTfJOKdvl
 jJsdFdKfkMJ5LWmP3F64m2Xxu1UuB1PrDD2jjeheyASPj3IA0aJCIhGlO7Xk4TP8SMKLdNnUm9w
 FkKWGsrQ1R4zd87qTsyO49cCENvJkcw=
X-Authority-Analysis: v=2.4 cv=U9+iy+ru c=1 sm=1 tr=0 ts=6a87f1f3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=65oZO8-CLbckpCt6umIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: tlDEIiItEA_uKdm3UvJdxQXZj4JHlxNG
X-Proofpoint-ORIG-GUID: tlDEIiItEA_uKdm3UvJdxQXZj4JHlxNG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA0NSBTYWx0ZWRfX8DonymWAfhsi
 PHID5agYNXUB4VnXErDbxPUtePo9D82xAUdFCyJBwLyOMPaf37Ui6gj57BGIh6oyO8fwkA+T8Tw
 64x8DR+BF7q9Taf79HE1gNAVpILKrBU46SGJqCUMTal/aSr25S/O2lHVRbx5AtBxOE4yAPsuUvV
 EGjCDphu+aBAJvqPncFXN/pCiw3xg6VeHyjDyVfoWUJgVIX3BSANotfC0pBpxjWCPJp4lHbFKw+
 uz9pMpS5vKnublS2hx/LBUC9i6Spr+T6Yruzma2MOqvBXm+Nq9G/+Mdm5tFQynFEdyPZ4f3O6Eu
 NrrCDMsapuyi327E8IOLEYK8H8bmoN33yCbWKXFTb3flVkS5tRkgplEPZKGMxAeyK9vAiqm6962
 3G14gpZiHYGttfCF8mG+1pjd1uP95QzcqNknO/bAdBbBkrnySV93OkIIJu+IZl6d8xL/IHsltd0
 rTefnP40VfE4Jy5VK3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210045

fw_size is read from the 16-bit fw_size_in_items field and incremented
when the count is odd. If fw_size_in_items == 0xffff the increment
wraps to 0 as a u16, making the bounds check below pass for a firmware
segment whose actual size was not validated. Widen fw_size to u32 so
the increment never wraps.

Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
Cc: stable@vger.kernel.org
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 1d6e6611441d..54c0a66d6dd6 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1248,7 +1248,7 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct
 	struct se_fw_hdr *sefw;
 	u32 fw_end, cfg_idx_end, cfg_val_end;
 	u32 prog_ram_depth;
-	u16 fw_size;
+	u32 fw_size;
 	int i;
 
 	if (!fw || fw->size < sizeof(struct elf32_hdr))

-- 
2.34.1

