Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630A051AEFC
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064412; cv=none; b=gyaYCLpEqh1BeQXbaCTeyy+EzTU4JukKv3V3PdgsRB0MGblCv7uetyQcCbCToF71fHF70CHI6MqAEgEVoss7cxlIgLSqJL2yfBmu+CG5FEYh2BXMC97+/BQbgbi3dP22e4/qqcH9NQ4/VnqUh6z36aZkivsrLUBcLqwpgeOrhzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064412; c=relaxed/simple;
	bh=0Kc794OPno2pW9+u85wr/YtBS+yp4Ljn3phxmGe7iJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jOsZZ5pUEKmguD+egULV7ylIf6BV5ATr+IG0M0pLzQCMM7jz5x3gQtbKCRa/bpo1hqDvF6ZP4TqMClRfLtcGuz58zp1CG3C6O/b+O+5AnN/V3G/trgtxWoJXGeKIms+sDEQdGc/XvPkT2IKCD4Y+2A21+eCttw26SZ69NiNrauU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fg2eELCJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jkoey8ew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fg2eELCJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jkoey8ew"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jswR2417395
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3H9YKHNrLlGtzYAMdj326MBl/MGfz8aeOp/tdjelI0=; b=fg2eELCJIw4NVXvl
	kIkQc2x+GAOzfRjwzY/zAWWnXKVdcCiob1Wx8LQhJUx/DPDJALiBi4VOSAiDj3fS
	lXv19llaUGFdyELiDrubMQazALFAPR5sNJC/wILbB5gq0k5RJVt8ViDAi3Q+Qmw0
	jknIdjpHm81vpnfTP7ptaQzjyvSl/bWewOC67tRqivpkhocwBlByIvNgGOuWYXhI
	wYH2BBX16vRrS4vGAAkpZluNvSNsUwv6E9jt466Al9m55LLx6lWZ+c9Hdv+vkIJ+
	xsCyfuoFcSSd3kM8q2QxPvJZ8TqDlAKSBxqC/dUQHVocxnSF4uqugIqHgjeDg4kt
	a7gI4g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhhvsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:40:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso765707eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792064406; x=1792669206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3H9YKHNrLlGtzYAMdj326MBl/MGfz8aeOp/tdjelI0=;
        b=Jkoey8ewdE+Y7AmpHvB6FWo6Dvm9o8RaB3GdyViNBlJM3u4kdYg5yOpd3KSwPDDExb
         wFGFzKnt4h1gRDruVzRMSW8TrwPiZ5UWzVSCSL5UbC19IQ2txAd15la56qoWXu35Ohu/
         +Iw/bu6PsEgk7+2In6vZ4HyyLd2DwURpTJ94qRERbdMtgNDjW4FOC+vDE0UG601w4lrr
         Js5VvEeR8u3wit7QX7kwHG4JKLrdT16U/ZGenPzQUQau5RupzXNNZgnX7MNaTc5/zUci
         Czb0k9913vUpGVZ2o8A4Wk0Sy2nLd8Z7CQQWpit2tif6B2voeLV5z+QlOo3WEdReMixR
         6emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064406; x=1792669206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3H9YKHNrLlGtzYAMdj326MBl/MGfz8aeOp/tdjelI0=;
        b=huQs0i2X6O6b0AYHKYhuStknpbamGvMPoKhQDvj72k+TrB63XR6a4qsbvruIrwG747
         +GRbl3x16MvbDVymaSS+XzDWPvH+uXjGgw1Vj/xmgGzTjxiJKR9+cAFpdfJtB1w9vKOf
         qB+g+XJgsM8kmUqo7K0CxygWyffnv3Kq8OjTffxSIJjnzv9QTP3z9k12h+Rf1TrZX1fW
         jsNf5Yj0p1axV2jDuMT32l7uoMfTPJYt7PPQe20rq+M+mejR+PSq353zzKB5vupPKem9
         xrblA1cDjh5w15kw60lCErFfDKQkkgly6TvBdEJ58yhlauSYgtB5ZI9545AMFXF/fZ2Y
         gLrg==
X-Forwarded-Encrypted: i=1; AKwUvByBpeMpr8hF7mW3Tc0beWTNct+QmZJ8PxM+jsOZCSF763lmQuzyH91PjUbPhyzrb2MnC0NkMjYquzg+9LO5@vger.kernel.org
X-Gm-Message-State: AFq9FYJUw6GRmO2Lu2Cwo13dco2j6CmbHGgMAyJqJSmIdEFlnh3+xJIU
	AC4IzgY10Eth51lJUMVz6dvGjQoUVvGdG6owfJA15fhDjEAGA9hyliUzD1uK1CzmAzKXWFzasZU
	bWcqNxbWp1IuzsiqziIJ7p6vOsdQewM/cJ8yHT3YLESmOidmDNrCWV7Uo6qRbC31H77xG
X-Gm-Gg: AYBFou22QdbMnHxLnwc0LtutIDSZEIoylQ6EmUbvRS/WglHEvQcZRL2UMIiwbkd+tiz
	e2GfgJkumERar/HpnVFSXqPB87Blltk1zY/FyMHwtsO8+T6xyFvOKAA6YSHYbHs4SH4qpRo97ZF
	2m2nTzhJaMGsMLHNrRLbFqnrFdxMF3nAbrOOZWM4FPYWd/vFSL4EaIREFAFXD2HGT0Ay3ZhQbsW
	pgs+5HQqXd0Tlci2Un0bEneYVvW6JLv5CWqK50FO4mNh1hDl50XoZ97S/NxfEg6EgdPl2Udqonl
	a/oWkAQm/2HgmKcGFQ7oVN/6r+rUGXW4pXfk1mIVaag6WA4h3iVC/FJESbnrJw5muycLWcov2Mf
	DBKNw/Dfg3VFgfwrQBMH4C9xb7g==
X-Received: by 2002:a05:7300:ec8e:b0:351:1bdb:e3b7 with SMTP id 5a478bee46e88-3537e0792c4mr23860374eec.15.1792064406340;
        Thu, 15 Oct 2026 04:40:06 -0700 (PDT)
X-Received: by 2002:a05:7300:ec8e:b0:351:1bdb:e3b7 with SMTP id 5a478bee46e88-3537e0792c4mr23860337eec.15.1792064405790;
        Thu, 15 Oct 2026 04:40:05 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm48144891eec.11.2026.10.15.04.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:40:05 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 17:09:38 +0530
Subject: [PATCH v5 4/7] tee: Export uuidv5 generation for TEE backends
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-4-1460691b35d3@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792064379; l=2929;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=0Kc794OPno2pW9+u85wr/YtBS+yp4Ljn3phxmGe7iJQ=;
 b=3Xsda148xCgAgWWIW/3X1xBDM3z+OpNOIoFgRq5osdaIUhrqScLhSvBdQJC++d5laCbZ0nkSe
 7qJqXqp9npCBbTo3odHlGA+lJHpDGnKqvo7y9QKWwx/zOrO9ZzM2z+S
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfXyW5ClmJ8ehza
 BM96x7ykJNkUPFEgzSjjPEMUGFKaWNNhxA1uJmWvbpHdMy3uUDCo7Xksa7gtjSWs8n7enUyQLaF
 S+RKB1BZ6Nu7a+sNZuQoK0yg9MealZG+LLex9CrWXToksfPgxnHdZEMG6Usv/dmONtn7U4eb/dA
 9sNKy4uiV1MIxco9YIrwyeoWZsRbw33TLgs02U0ziUsq3cN4TapdLMgabsJqbK896sygqdmvjmA
 J0hmCVK7xQ03vqXa3W9ZcRnlVnVvjMWe3HKnyFhAOZ3FYh0uX+XohLP21is/8jTR2izLxvruC7N
 AqGsl6rj7w9LBHRMeeODn+9jbtn0XtYIrYCmzymSy84rH9FqvKKAea5zRC7E+MP3Hao43kp0tMU
 a+VthTeBkr5jR0G79seOgFo6USrRoGLsR0UR5YMyzEOKRf45ymNJX510lQYQ00Uo48nEjABupwV
 in529Pe8/6qX2zU+vig==
X-Proofpoint-GUID: HyVKjiZ-SmWBmjDEhMMP_UgeLzjfgqOX
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0bb97 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pmd68VmXx7mOn8wi7GwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfXw8qZNCSYXI6y
 9yBz1ePjQnn2WFuUcsY6oVtgoN9Axl8tNfR2Vel5GEz45ghn3zMQidRw3eF1Ediwu1GmjQ3Txv1
 npXkdogL55D/fFbgMwFRmL/lUE9tgbM=
X-Proofpoint-ORIG-GUID: HyVKjiZ-SmWBmjDEhMMP_UgeLzjfgqOX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150046

Export the uuidv5() function defined in the TEE core to all TEE backends.
This enables the TEE backend drivers to generate a UUID for identifying
and registering their secure services on the TEE bus.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   | 19 ++++---------------
 include/linux/tee_core.h | 15 +++++++++++++++
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index a03a3d645dd1..2d678d414edb 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -134,20 +134,8 @@ static int tee_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-/**
- * uuid_v5() - Calculate UUIDv5
- * @uuid: Resulting UUID
- * @ns: Name space ID for UUIDv5 function
- * @name: Name for UUIDv5 function
- * @size: Size of name
- *
- * UUIDv5 is specific in RFC 4122.
- *
- * This implements section (for SHA-1):
- * 4.3.  Algorithm for Creating a Name-Based UUID
- */
-static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
-		    size_t size)
+void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
+			  size_t size)
 {
 	unsigned char hash[SHA1_DIGEST_SIZE];
 	struct sha1_ctx ctx;
@@ -163,6 +151,7 @@ static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
 	uuid->b[6] = (hash[6] & 0x0F) | 0x50;
 	uuid->b[8] = (hash[8] & 0x3F) | 0x80;
 }
+EXPORT_SYMBOL_GPL(tee_generate_uuid_v5);
 
 int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
@@ -228,7 +217,7 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
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

