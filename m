Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4033FFABF
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 11:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852608; cv=none; b=Q1psAfBI9J63zwbnUC6eydDMzof/aSBkLGKLzrL2XXuoB9FUfqMrLTxDiCAI/nK4G3TO8cIJYN80n0dMohU+NFc0365S4X6oSrVQ+GU0k4PynYqm0eWWLoZcOaAx8wdNny+W+6tmPuBPdL/vf3a3JZzTTyd9TowkcsC6cBTHTmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852608; c=relaxed/simple;
	bh=8J6mVwucr3YpUU1SbpeFpncvz94Oynf7QjRheGK7mDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WwlPmUl8Igwj0qa8cHKgo33C+MxiQzCdKPA59RT4K4HGjN2xl9YpVM3w5ZMOZmSUQM+T770RZ6ow79Qr+bJhUyCAhPnSB1G7qHMWVaBqzO6zoMZzjmJaGCF6ShiKFt/fFWYJd+zJgoyd0DQHcR+6u+AJnik3ExUUHjr+wQO4etY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7NBUm5K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UZ96f55q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7NBUm5K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UZ96f55q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xNSV2806265
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 11:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zTcg7huVH1+fhu8zKoiibUAUrz8ad4Hg5rZk58E3qB8=; b=L7NBUm5KmnxDR8PJ
	JBGu8ewhN2UqnFyAa7ATEXHj16gaHk/UJBTHsjnJ/uUVjb2zzSV9l++T0dFNpJOU
	ePFVcg9TpBgZ0BJQHpwz0WmDGntUQHrm4N9nBGgAezrGqeGLW7uAxfLv888lm2sK
	LSM0UwMM+HcJfC7sDO08o72n8mYT7/tOkXK+PhtVxjRJOszU9eXnfZHjW1wQ8b+e
	S0nmb6xZ5WPjBpu2LluSND1BquXhCrfLfCNFqa4KJmuP5xxrPsR6cq6ptJ89CtNJ
	zz41PCj67hnw+mAPiIFfzN3Y9C/PBVBTVnTOe/SEcd6/3+xW4DuUeH+TtU83pA+K
	PaljzQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1hvkha4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 11:03:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb48f41343aso540734a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 04:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852601; x=1791457401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTcg7huVH1+fhu8zKoiibUAUrz8ad4Hg5rZk58E3qB8=;
        b=UZ96f55qFwwYLb6iFBUZQHPcplP42cn2RcgkUK8DaNFZW+KZZWycxK+vfUvDm0ZvNp
         l7IEpcWTTvinDnKNWPAbcO+bXOndmbVnamdZkvAiO91SObesCKo2StJQQWZfG0yVghVK
         a7tqI0tr1FMR1OSNo6d7i1WxE2isSntBgvzXddINhi45wn7AA+NyRYvVqjawua2YNKUR
         dAqe52thFAk4IPclfZcAvuOIHNGsrP1WnHnSo4tnmIUTgPiuDdwikVRtVy69/LT/dIrL
         V4Gu8kDe2o+1+8rLXHVLIA17/d6R52US8kDlIdANDFGk82bwibuBo/O5XVOwUPNBOrHc
         g+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852601; x=1791457401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zTcg7huVH1+fhu8zKoiibUAUrz8ad4Hg5rZk58E3qB8=;
        b=WL32jpP0dtaCo2j+kKSMm6TWl7lJa3XkNayfKLMVMVRkrZJtbgduuwuPlXc2HaN+5K
         tZ/VE0HKY+etmPUthqFxEWU1P+CbAP7TI9kI/JsEZoLSCBAqT7SaLJy7yNNvpwwdngqy
         IlNZgoMW+mG1eIqpqk0u3g3iFam7nG/6YGeZegDoQuPVtN1G3I78IyOT47rdFDNgpfV9
         RlxM4GNX0CLYP4HwPreOfUTYXBsoc91SKabDcZ3p9N8NmzgPaWbUekk7uePK+Wx40rg1
         LTxjQvojpySlx9NATqNR/E+7Tdryw/2pRhLsv2104AqDYGDdNKdM/TiYX1neNKaIXf4t
         /lBg==
X-Forwarded-Encrypted: i=1; AKwUvBzgSgCcC/RXaynUnZn4O7Bd77eIKj0fJYy8J/kUqvleMOSAxA9kILNee1zucp2xUuy/xoRFqoZbIwhP9OEO@vger.kernel.org
X-Gm-Message-State: AFq9FYK2+1nyopQqh0OGTj1yNNmM14Il9+M8LUXjHTwX7I0AWZwuKGbi
	0r34S+eYBabjxlGuaYadkg6P0J3ZljS3/KKxUU8rVAAJ4K061d8kn4Pp+f1RcpfaxXnlcqwVNxp
	MLPNeFmCFUQJDQA7DEchvAi5Cu7BKY5Iwa2BYWRHRC2F6nspqk/NdVCsRdbYTZhGm0rup
X-Gm-Gg: AYBFou1HwJvasHZ9B2lJcrbM4DWDMTNbNgB4WBsi1jERpLu38xhLG26g1K/K01D8kO/
	YuYJBiPkBJVVQSIf+jSsGUhbJR7c9N1GKMQQffIWxj+ro0mVgW0MDEr/3CeObY2Ls6yUmHmxm2e
	23zcAygSMtFFjaG0PLXk8GAqOK6Yi2kaL3dpmlVsxwpUUaLI6NaAbTklxc4t0V7lsuqt30A6KtZ
	e3P09BANNih5g0ai8iqjcONM0KbgDOHwxi2RetL2ifpXACqZ0zP0ioZxEzX0Y24qJG+Y0UNNNwK
	Te/hAHidl7Sh2+R+YbScsetZZoUYLLh2NuBoW2xwAIDANzfTdgNFZZCKA9yyIaVbNFi3/rf1YPK
	FWSiCtpT7Dez7q8UsQsdcJjDudg==
X-Received: by 2002:a17:90a:fc50:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3a4f32b4c7bmr1262640a91.38.1790852600642;
        Thu, 01 Oct 2026 04:03:20 -0700 (PDT)
X-Received: by 2002:a17:90a:fc50:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3a4f32b4c7bmr1262626a91.38.1790852600087;
        Thu, 01 Oct 2026 04:03:20 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4371383sm4076810a91.2.2026.10.01.04.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:03:19 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:32:36 +0530
Subject: [PATCH v3 4/6] tee: Export uuidv5 generation for TEE backends
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-4-13df5c20c2e3@oss.qualcomm.com>
References: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
In-Reply-To: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790852574; l=2841;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=8J6mVwucr3YpUU1SbpeFpncvz94Oynf7QjRheGK7mDI=;
 b=ROdYUAbJD1wJSJyZmFU9DL5SMEUA/+HlaGN+bEc9GIWcfX6VpQDEk7sOs6Y2pijlQOiG/5F2q
 dpQvkf+vg6UCynX3Wnobq0FQVw36LVbb+Kk0eSuXy3lrA0QOte44C75
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX0R0kHkQ0UN5P
 QtDTQRAuSkYze2bsGTAeXaMQIk2U6mWiPV7cI9KtLOiI+vkCqfl5lybUhpWAySJoBnDnUyO5tFn
 E0Jz8ouPB1ArwDd4ml1G0Z1jJaO0G4U=
X-Proofpoint-ORIG-GUID: m7lhxTzQAcWTOQV-O_hl1oOvqUUKYgHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX5E6Sre8Jquhd
 lR0yzxkf4WVAe1oyQC56VgogTidm4HX5uhdRARr7XZX7Cu8YbamteldaBKecd6km0+w345qBdZW
 Q+GziQZv7DU009iY22mFHq+P9fS5FHD9tdjMXTnPdHEDc/iRXCrsKUkfiWkYgwfuCFA3v7tVhTP
 hfGsvNVnY/fVgTDNgMJwPOFIvJGwqQT1kN43A7j52jlRj4Nb/rbmVWDwxt86JyBqbq97nP1xUqn
 QFtsHGfdNi8+CFi29o9eRfzxBSlPtoHWZMBMCyVFsmk6D+x3oXtDpZ2CpWEV6LPcPJ3ydkB7FAa
 q7Ap+AkMVmkGYAYE5AerwkYZ8uEciQG1wsrZUQugy+2p0acRRICkWXE4YVNr026UNmUnkUBIcJF
 tnSurVYXOKe2nzrg8kpSXLHvNtQFcE9EQdMtTFBl1+Mw+l3zBd4T1kw1zMiEE1HEwk2i1s0MTLx
 aySK+tJTHujzCbHATMw==
X-Authority-Analysis: v=2.4 cv=IY8Symqa c=1 sm=1 tr=0 ts=6abe3df9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_y_UpZ8dDEjReVSEE2UA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: m7lhxTzQAcWTOQV-O_hl1oOvqUUKYgHh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010043

Export the uuidv5() function defined in the TEE core to all TEE backends.
This enables the TEE backend drivers to generate a UUID for identifying
and registering their secure services on the TEE bus.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   |  9 +++++----
 include/linux/tee_core.h | 15 +++++++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index a03a3d645dd1..2cfd302d1393 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -135,7 +135,7 @@ static int tee_release(struct inode *inode, struct file *filp)
 }
 
 /**
- * uuid_v5() - Calculate UUIDv5
+ * tee_generate_uuid_v5() - Calculate UUIDv5
  * @uuid: Resulting UUID
  * @ns: Name space ID for UUIDv5 function
  * @name: Name for UUIDv5 function
@@ -146,8 +146,8 @@ static int tee_release(struct inode *inode, struct file *filp)
  * This implements section (for SHA-1):
  * 4.3.  Algorithm for Creating a Name-Based UUID
  */
-static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
-		    size_t size)
+void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
+			  size_t size)
 {
 	unsigned char hash[SHA1_DIGEST_SIZE];
 	struct sha1_ctx ctx;
@@ -163,6 +163,7 @@ static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
 	uuid->b[6] = (hash[6] & 0x0F) | 0x50;
 	uuid->b[8] = (hash[8] & 0x3F) | 0x80;
 }
+EXPORT_SYMBOL_GPL(tee_generate_uuid_v5);
 
 int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
@@ -228,7 +229,7 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 		goto out_free_name;
 	}
 
-	uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
+	tee_generate_uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
 out_free_name:
 	kfree(name);
 
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index bcb5418d6fdc..a3f4f88b8423 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -272,6 +272,21 @@ void tee_device_set_dev_groups(struct tee_device *teedev,
 int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 				 const u8 connection_data[TEE_IOCTL_UUID_LEN]);
 
+/**
+ * tee_generate_uuid_v5() - Calculate UUIDv5
+ * @uuid: Resulting UUID
+ * @ns: Name space ID for UUIDv5 function
+ * @name: Name for UUIDv5 function
+ * @size: Size of name
+ *
+ * UUIDv5 is specific in RFC 4122.
+ *
+ * This implements section (for SHA-1):
+ * 4.3.  Algorithm for Creating a Name-Based UUID
+ */
+void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
+			  size_t size);
+
 /**
  * struct tee_shm_pool - shared memory pool
  * @ops:		operations

-- 
2.34.1

