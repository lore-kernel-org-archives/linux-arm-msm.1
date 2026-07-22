Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D573358D00
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703599; cv=none; b=iIq6V5xm6DTZwBUZjco2HJI5nskiWf1NHTqLEN3BV6QHcuBUpHcKXfnPUI0VPIyjbLejUYc1diwVbHwRdZN/iJ0qNv6DFGeS0ejeXQS+Wgbxrk4OGKR/r+/CxpAgnbnU88S0rE4tQh9YNgj6MJBl+rMPidRf7YGBOOVWWpOsZxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703599; c=relaxed/simple;
	bh=UutwisPxLmXUS8raj8VcKR5HsTjTxGdmVUYtVk2b150=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEfDLcVvgOewmpOQxOG8o1WFZlV7Ydu6RUSfvUq3/dyKXqtihI7ifuqq/RGPMwzj4EvkzqdrWfJgj02zobvu6rf4MNS1EHzYkvQ6WW1Gvg23q9T3tfyoYuMq5LI3Gw7SSZSbyFsxIr+cQLOMN4mk/VpB40NdxyU2WYgDiDOzo+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nUbNWyQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OzBK9sif; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nUbNWyQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OzBK9sif"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53ZJl4054825
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DN7n/bdfkW6wuLU+Ox37xcY8Be/ZEVNLsXfifpOhL+0=; b=nUbNWyQumK/DBmof
	ASV/5Cgecfp7vw6pRDIrtK0EYgydzKrCfa0aRoZF+9toVz4+GSPKwov0nLunkk8i
	/XTTrfT2uz9/qogFAy11SXiDSmmp8b5e8zhJXvGhFrxDPCL6JB8hlSw08bfKi3vJ
	jLiaf4iAFe82/RU0aQ4pWZxhctj3hgY8mxPp5QDvp9NZbrVq0y32j5ORByL2Ph18
	8uaQNy/5KllxXFiFkeL9J2pR4lFFowwcE32Kympw/QztfusgTZmkwPwNQqAoyUXw
	k2o7DwWbkLqW0VcwSIAv+a/c/HBTDcb8s//vIcsIV1LbJfgOcqoa7nqbIMJ9vQnt
	eGdrhw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdgg3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccafc5e82cso118077035ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784703596; x=1785308396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DN7n/bdfkW6wuLU+Ox37xcY8Be/ZEVNLsXfifpOhL+0=;
        b=OzBK9sifXP63963fzL0qExpeb3uOAYEEitEn3oXr59FQoKjsFTqzNKRs6cGCEqwFel
         aYJtNCyF56FjCnOd2qLOayjRi0Vh7Rub2I9PeqslFF24kPWfeMeItDVX2zW62fUn/R7B
         LRP4Tv06sE4s9xnmdU0wuiGL0GqGet1DI520LwLCB5O1XWatXBB8n6MuAZOry0tG3lvb
         JQnoiMuofMqO78tqbSqIIzd6D4/eW3kTWoO7ca1i7kSEWe3imEAfiUQxBZ126X8a+G6l
         ylB+60YcSLokyHccQLdgGIO2sGJD/X6uM+EO/JoFYEn3kIyRpwQI+kNRPTBvXAqWjCE9
         j1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784703596; x=1785308396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DN7n/bdfkW6wuLU+Ox37xcY8Be/ZEVNLsXfifpOhL+0=;
        b=GmXmIE35F+I06aNFwPC6Dofz5c99ivzraDBbG1fIvwVLPF3fiv17w47Vh5rKa17iBi
         KWnZYSy/4tE5RlkhaEHg3KkMUGh+xBmYi22tJIp02/1s6YAtdNg8LT2gTX1vULOonHPg
         fYzqfrF25JI2973iHqsDWBiaVUW4NOmxV96xV6MqzkbylxUk+rDwOaulIfGOfiipbLrX
         kwXf0gChLRw+fq2bzAfcod1Uqr7nfx5dI63ig0S1sUUS/6gaSQJa14YmpOTUVUiKjmiH
         0st+6l6aysYTpwRxr45SjEcpQGQSfhr5tkdHsepeALqKDiR9CTaDkAIDk10WZmYMjVsr
         AZlg==
X-Forwarded-Encrypted: i=1; AHgh+RqOgNWkA25EvBZRQ8V7vJMslqWfv5XUdM4QZtPX3Gpt0elNIcp9E3xM4JcITR2pHVBd/M+fNLQxw67ChBuC@vger.kernel.org
X-Gm-Message-State: AOJu0YxXUe9bdu4KUn2sZo2ViWi/bx20tbs2Cb8EKatWe8Q2C2dsxiGF
	0u5T9KwJxBHblxN5XgyhaoycHzNkCOMsj/FVoiGgw2KFQ+DvqXOV6O24GwSD6Llze2MxboaoA9/
	wyBB0Ri6lZ+y24QLBX/oIj6PdtVr+qulf+GIl2dzu4aGeortXa37yvAZNPNULFLLobswi
X-Gm-Gg: AR+sD11ZjNY4deAzSSTOEmtrjU3/v6gRKKBlNaEhRW+jDdDkx3Uo8RFBCsDlJR/qB9P
	J7AlyYJ/c/QjBn314/CR8jl/1Beh3FuEnq7a0xyg/YJa7VS9eHERgeDdLRZczv9epLNFMfv63AQ
	rzIe8otSQ8ByypWGFlNjWUV0va+cIxptgJIVjMaqWTcqIhnJ/6HlgH8FgkG+hq9moMnT8LKMOAg
	VDQ26uTPQsXiBFhraW+iMw/MqZz1S+BGSpS/gA66xkaO7quc6OFVxMBf/Fdny/Fkb4EbkY4W8cM
	L69se6ga54HzrCTe93R668Fuh+kaOy56t6A6TwtQ0ZMErDBIcQggjwuf1NwNbQRqawTl4ZDaLRe
	RnbjqExqQ9xIkmt8UlxxaRYiupw==
X-Received: by 2002:a17:902:d48a:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2cf34889935mr241887185ad.15.1784703595876;
        Tue, 21 Jul 2026 23:59:55 -0700 (PDT)
X-Received: by 2002:a17:902:d48a:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2cf34889935mr241886725ad.15.1784703595269;
        Tue, 21 Jul 2026 23:59:55 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd88f7sm9428935ad.22.2026.07.21.23.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:59:54 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 12:29:15 +0530
Subject: [PATCH v2 4/6] tee: Export uuidv5 generation for TEE backends
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-4-b8a8fcbe4211@oss.qualcomm.com>
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
In-Reply-To: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784703569; l=2841;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=UutwisPxLmXUS8raj8VcKR5HsTjTxGdmVUYtVk2b150=;
 b=e3840ElqGSsbHCB/vLaMQ0i5nkwNtX7qIXk4AQ5l3SYykOH+T0ZsgFDH5wsLcBe09Pbg1b0lV
 ojALYmxiZ/7DcaLepple6Z8D1EJcn3Wc9nlMRylWSvsb0nWaz2EIMLn
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfX/hMKgK8jWdrO
 kxUXnk5PO8tEv38fVQHXv2J/beFYD4oIj4aDfmOAq0HwyhD3AesC0em+j/QJvCy8jCPKO7wS0YY
 5R2Cy0VBgrHkh96y+tm21lwaJEVlCwsZ0QjNAvElSoMokk60J6aH+o1CrWyDN7qvjet5Juxtrt9
 zjaB2Zy/TzirwLM9a/oKux/kLn65+DbWpUfYq70rKX99RxB99clNh3rfM20/G6G+dAIY50kyZG0
 cSerATKOj0b2Tzd/HIQsnKJs5ZN4DGiZ5xpVQvyvs2gdwAcGGXgFpcFTaT93u/utRhV8GMWX5gP
 re7U1E34PA21UrQiL/nUZRxcslngM55KrKtxV9O04Yfn5Hbe2MTO7oTmzbIh/IxNCxGLjOUrp3m
 Hw6aZc+rVG/XD+DIGTdNdqbXU70Oih3s52ys8Y/rdEd5XMdZ3PhCeZw58KgRX8uD9RoXCKiaDnq
 rujiBulSD4d8ytlAInQ==
X-Proofpoint-GUID: a8a6OZmZrr7ILFo4TY7JIXpAeILoIQ3p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfXzn6bZmrhL5VW
 x0Mo14TsyBEK1Htv+s72MvjWo46vG9DCOj2pi4eaYGUIL7cC8QY9eWh74iHYlXIVa3P7qR9pSLs
 mtVZ27K66SYEb+Xj559Md2hnA2RA85A=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a606a6c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_y_UpZ8dDEjReVSEE2UA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: a8a6OZmZrr7ILFo4TY7JIXpAeILoIQ3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220063

Export the uuidv5() function defined in the TEE core to all TEE backends.
This enables the TEE backend drivers to generate a UUID for identifying
and registering their secure services on the TEE bus.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   |  9 +++++----
 include/linux/tee_core.h | 15 +++++++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index bb418490f3af..df88727b3680 100644
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

