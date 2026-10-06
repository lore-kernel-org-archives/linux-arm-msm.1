Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94703E49E2
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286454; cv=none; b=EwtOZhKuiHAqmsXUssAvYEm1ILFOEqaWgH9T+aQ/AHstmz2NZFCcbbaM5BmTJa7RmXZDb2Z6TpvMw4N8iDG2yqTgNRjIZG1MomPdohWUAWgxWI5WsOzIXn0ZBiuuMHB6BtBkpXdT+3QzhMD8lfw02ZORTFQScOiCO6Pql3pnt2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286454; c=relaxed/simple;
	bh=Rpbjn0YNacV1Aifz97E1Ai2mwQ/oNPnx/tZLiOWYIw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDvj9StP4pTDu8tsxRfPtm+7MAeOPq9CazwXPky94DmBUaylHKWNXm7yy+Cw19ZNSjbe0K2cGNxQLwGt0w3NBda5Vg4XKWbPqi8TKCkiy1fDqf/UvhKxJPis8goH75/fBQ3lUhPJGROUAVBWCk0RQBJdNaeI/wLSBdJ9qI8fIgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqK/WKgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTa6uGRz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqK/WKgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTa6uGRz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPNx2535555
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 11:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBx7DSS4OAVf2q7wVxZqqxHfDSq45aHtmPOJDnt8KdU=; b=hqK/WKgwFi8KBCv6
	i/2IQxUsEpV0EFxkTsQYoaxtDJCTEZU4VvBibb5yzRF6nF1Ue4KckPYTmDsE0dTa
	+j2dENYUcE3d0e12Flazw10Z6xVCblwgyK1lryFTtfjkynbCH7MdJ0zO9BnmkVYX
	qNP84mVCcZZpvpT8UOjbOi/yRv8Uq1pWzeiWOSpkRKdQ4vSXzNwdU6uS09Hl/LlG
	1RCZx2lcaGw/7fhjvh3QahNJg06bGtDYuPzUZTqkzd1n1xpR9/q2MdnX1Y1yxF/O
	Lq4GYCSt96w6XHMEX6uKIDUc2yr4U0gxQKwCGnMos8m3l3uYYDoaucRmCSpUz/K3
	ewM0Zw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0bbcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 11:34:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so4181306a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 04:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791286450; x=1791891250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBx7DSS4OAVf2q7wVxZqqxHfDSq45aHtmPOJDnt8KdU=;
        b=PTa6uGRzXIJ1X/uIfP2SaUPEG/4ZIuSE7B84Ucg2bUYB5Lw445rJW4SE9d4uKX1Ie0
         vLzUHYNqvT4Ruo3a2ByzDxyDsc0qkcJoXsKCnBxY9eWfFlenosTzJVH2SCUSMJlkqTHW
         lELCY00xqjrgiZyBE+qKWqk2onqQ480bFrbAyLpXsXIu3iwiYE23hYuEDMO/+KttItc9
         Gh4mqFBba9IddgNMKEfCMB8C7a4+OzrWUhCgS7+HrgEZBizwaEStzyNzaNgQQwmjakry
         WIUHG00+ZOr1i9amxj7dTEGgXKCS6Y3Wc+l+mhEp63NgJvREqSWAxJn3Rual+f+cG2Y9
         QGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286450; x=1791891250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBx7DSS4OAVf2q7wVxZqqxHfDSq45aHtmPOJDnt8KdU=;
        b=Y1KwnH0/y8y+JFiL3mdQlxaMbj+MY8DQaAJj8OHvbLr2QJy+ARXfa9mBPoEQYx3DM4
         2ZNmeesCvHO/F9/93KkTGxGWq8sw8Z+tnTdTV86pE2T2iN0s91okPV4g3jxgAsnZUuIR
         k6DQMnJxQzK0lurMCdnndJbb+F2FthKL7/UL6rhOqtDjTz8OPs04XmCx1EyegMYzf4Dy
         zhkvEbtRZN30Db/d2UFtbNJaEXPTcxDIVV61d9rX06FEUwd9XY3itx6W8N6I0CT20ttT
         Xc0q8cFXhilkOTQQjUfdbMnRhkn4KeSCUU+ovLIgb8WVlP8CMTZXuvv2gbN8D76kgOqp
         wLAg==
X-Forwarded-Encrypted: i=1; AKwUvBwts+meOgWKXeMdxqQtxaiGObz7UuK9/LV8fQGM4XI6s/WYmb7ERItb6XGRr4OW1FVc1rGec3B2IGakDjqW@vger.kernel.org
X-Gm-Message-State: AFq9FYIP9uijfO4yhWUpFxVtXvgt2ZVIZU3Dyr2Zvj3VYF+HhoU1zij6
	4RwYPMXMSxq9oa6r4uHuAbdsqzbVS8ucNRmGWk8fUk+Q5QA39f1hYC8+1AcLWp33H8RXuMyux5l
	qzcr4BHy0G1Nervyg0My5ac/tBnerbww501CX01JVwDIHZoD/e+WOOnBgKvIgsVvsyWdK
X-Gm-Gg: AYBFou2YA6glQXNPiWb37KYhJbViP6RqRPWyzDDtcsTdXVnJLAAALRoBrB/PqFxdTFK
	6IUWsPSEZ5hyA5lwBd39PVrdrPf1Wmun/xK3h7MZC55YJtDPZNUbruWi9ef06oyfA6zW8Tf7KOu
	GDDNkkmP1X5mCeHTvTa3SOwCHSjJYezAWja16OR75ubEGWfiTOaNrmxgKKzVQTiZVIbNGk5h2Cq
	VEdfro42bexwWRY/sLccMT3I1vMffhUaAWhwsYuPCh9/Zz80beH2n8LJ+PuU6BM4M6Sh0e171EL
	PxTnSo4GICC37fBJaDnv8RVEl/4IIoXetR+dHDYbbIQSjEvald2B6RY18RNvjjUKJmyl0P2yrvz
	y+gZR0xdtM5BGvpS+2tlhc/e2
X-Received: by 2002:a17:90b:3e82:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-3a872ade7ccmr899951a91.1.1791286449471;
        Tue, 06 Oct 2026 04:34:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3e82:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-3a872ade7ccmr899925a91.1.1791286448939;
        Tue, 06 Oct 2026 04:34:08 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm9330092a91.4.2026.10.06.04.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:34:08 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 17:03:23 +0530
Subject: [PATCH v4 2/7] tee: Add kernel client object invoke helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-2-bf1c8e2a64ab@oss.qualcomm.com>
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791286430; l=2638;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Quti/9VlUblrcTksx7XZhJmH9kVP/PDp+rrGqRHsdVw=;
 b=J9ElpovhGgPaipJFN0RwR9Shmw8hecBUpv/Wb0IGyeRE8PiDgfKGEMqTMkuxmhTrMSxW2xOXH
 5RfTpEUkC4tBmdXXaWItMlBxonu7im7mtgsRyLAyUtT+2ARzd2/76/v
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX/x4SBcW/5gaR
 n0LefPraz0DSvrMXDCb7OILwH1FtT/z3Wgyxm+zdlgGtStd2TJ+lfHE4e2LLODX1oV2jQfLvxYv
 WKL/mBYeRylxdIqerUD+x42OH6cMLjDGYExV0Navrx8Ri5YquHd43j6WeXPqGI0Jkc1DYQY/x1g
 6wdnh3GFweDNglumB3SSki03rKI/Do5f/EQaCd6YbzDVZDnhNuk4b6bcpoXBAH/q2DYBky3Klih
 kIgw0itIJCd55+0e64F6pa/8jZuFmpx+PrCcJvezJc2lHNjLghD04X4bxrckXhw53L3SAEDneTo
 stvQNvPriiZutqmpFCk8sIoaBMv4hVA2Qunj8cu12ImUMuMP5uAh5m54UZk6F5gKHWGm3DVDEvp
 K0ruLTUra0TNvseD00tbtZHX9Iq0F64IWIksrLH0iOhqv0yLkETFtuc6AXwqnMzY15czWQmNh/T
 1wkKJU37u2OqkD2ikqA==
X-Proofpoint-GUID: 3SRRDZ6rTv-DvD1jCuudrzEax4tac0sC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX7FaUhyPli7ty
 8eYG1kXo+JJhJT2Nn3rbCT/tELyvMWcKHqwhzVUobOO9hmfKx9oGotNj1djXZbJHfzFWDoCwQ+7
 +ANGv3/jONnQmF+bs/LjhW/2hIqIhpM=
X-Proofpoint-ORIG-GUID: 3SRRDZ6rTv-DvD1jCuudrzEax4tac0sC
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4dcb2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kr-ihz5DC76VLKRVsLUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060045

From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Kernel clients can open a TEE context and invoke regular TA commands
through tee_client_invoke_func(). However, there is currently no
equivalent helper for invoking TEE objects.

Add tee_client_object_invoke_func() as a kernel client API for issuing
object invocation requests. The helper checks that the backend provides
object_invoke_func() before forwarding the request by setting the origin
as TEE_OBJECT_INVOKE_KERNEL. This allows TEE backends to support
privileged object-based calls from the kernel-space.

Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c  | 12 ++++++++++++
 include/linux/tee_drv.h | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 30901390149c..a03a3d645dd1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -1404,6 +1404,18 @@ int tee_client_invoke_func(struct tee_context *ctx,
 }
 EXPORT_SYMBOL_GPL(tee_client_invoke_func);
 
+int tee_client_object_invoke_func(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param)
+{
+	if (!ctx->teedev->desc->ops->object_invoke_func)
+		return -EINVAL;
+
+	return ctx->teedev->desc->ops->object_invoke_func(ctx, arg, param,
+							  TEE_OBJECT_INVOKE_KERNEL);
+}
+EXPORT_SYMBOL_GPL(tee_client_object_invoke_func);
+
 int tee_client_cancel_req(struct tee_context *ctx,
 			  struct tee_ioctl_cancel_arg *arg)
 {
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index f3c5e106d853..369c87ad0205 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -283,6 +283,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
 			   struct tee_ioctl_invoke_arg *arg,
 			   struct tee_param *param);
 
+/**
+ * tee_client_object_invoke_func() - Invoke a TEE object from kernel space
+ * @ctx:    TEE Context
+ * @arg:    Invoke arguments, see description of
+ *          struct tee_ioctl_object_invoke_arg
+ * @param:  Parameters for the object invocation
+ *
+ * Return: On success, returns 0; on failure, returns < 0.
+ */
+int tee_client_object_invoke_func(struct tee_context *ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *param);
+
 /**
  * tee_client_cancel_req() - Request cancellation of the previous open-session
  * or invoke-command operations in a Trusted Application

-- 
2.34.1

