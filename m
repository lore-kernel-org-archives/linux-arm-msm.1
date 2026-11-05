Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877353;
	b=4nTgyM+upFpbN161r+GRLFP7xguxZtPbsjifoeP2AOeWVcrfFvAKGEQrvBlA94gO0+1l
	 utNUB+BMz2pau8p2KA1B92yuuk6/OUNfLOB9Ssawk1PGUy3/TZUZcGcijx03wG9OSOJop
	 f8goDoSKGerGW8b6KE6FGtWeKFWsv1d3VFRpfZMtkDXCcZXs07bg48IFC6r92WrQ6EvPJ
	 ipYAjxly/eQvI6w0VYHMAwTQqy3TeVIDfQ01Z04H3crwlMKNRijA1U1nThhf0wzgGETXC
	 QjXLJ9ct0m3VoNXF1MPwHKLlYe/NKdmh7ZCAgHleIBIJ6Km3jLP6vQeaUJVQ31nZxnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OSyGglNviyFpT8Uu9xEAndODqt4knqWiiFpaao097o8=;
	b=uAVzd3Ps8mHhk6bTPZXjdk92oARdlsbP/J/lD25gA/9n1zA8Tauu/n94r0BC8ssXWe7C
	 UDmeUqf8v6p4ebeMJ6mqHHk/6f4qVN+Inag5bufp8GaEYp9ibiYMbkFE5kiCR9I/9JdHv
	 YyCLGrFwfkiPy9lJuVrtfrAMe2GhjmFmk/iqG/TenZ2T3J+kR5bmAMa0pVS7aEhwfeH2t
	 VzmOP6b8qoSgljIzsQUuzwhDFT80el94fciALw7726R9mLuvRGPPrb2WjwWEFHa4RWtAr
	 aG0yikc1Tx+a58TaHESAjaL4odNtE3O98wFmmFMdh6U9D87Ou1lPbuIMKORyDYIXwvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FnpEQ9Vv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CH4WIJfC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D48606A336
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 11:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D48606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FnpEQ9Vv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CH4WIJfC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tcsU1028252
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 11:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OSyGglNviyFpT8Uu9xEAndODqt4knqWiiFpaao097o8=; b=FnpEQ9Vv5tE+BsDM
	PD+fLZrLVW6lU+6/bxawyMYuHXIrlSTNeGObYmYQbDYrSBIJjODovM1KnaV/97rj
	Se9ZDDNvvoOHyAmpq/YWT2zE0EezYfq8Wj6n+jFTUMXWInBFsK5yKgXfZzh88KgT
	kB4dd48oAFfQE/0zJCd3ttPbK4LXvIGySh7CiKzDHyHfPt1rqJ+h01Q5RlomVqNW
	6AJrfmwvoMxWyPYOqkxdYZA5K2RBA5UsfQ3V/7vDqvRLaxcXiQP7qUemEF7iu4GT
	nfYuApiVwJmeyXUJywY9GqafagoQC8sOLt+/DrTzPDd1YbLDaATP4LzI0aLHNkgO
	1YhNIA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq9eq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 11:15:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso1770846eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 03:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877351; x=1794482151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSyGglNviyFpT8Uu9xEAndODqt4knqWiiFpaao097o8=;
        b=CH4WIJfCbCIQZIP3XaVLx9aPIOQ6gsaQ9/9Qt6prYTpEcmuWv2+LJkNEbj/KLGr8am
         6+7GTokFqBh29xHsdxzHL8kX9sKvZx6Vw11vfmveFvVlNadJPx8OFQw7gM3qgBgD7PXk
         DgA2uUnQs/a8vJCoAbiv/M/HoBc21XZd0taQpKtgxQp7F8i6hlUQPRwTVqbpRQdDVKdh
         /wUVEPrFOHoCRv529KcrAuAD0W8pF+/Gct60wNb4+HKvI4g8rIcnZwX3zDvuwMUDfkkP
         eMPTaLsJMYezzf6r6+0EDG7hJR3VtI7xpt3xEYshW145oM325BsFlUKZGGvMQjbow7ly
         eHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877351; x=1794482151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSyGglNviyFpT8Uu9xEAndODqt4knqWiiFpaao097o8=;
        b=Z92qQtZsRT/jI3bftZWsCrh9CmbXB0tZ+EZ6lwIJEY/vWAkG+3JFoF7mkQpZKnw0tN
         TcPdt864AU5ntYMIUxBF8JYKUeJmAdN3Zkxjty/BAqn4uwGR6/gjl4oOKDiZPG+U1HtI
         eqVQDlfdB+VPUtwYYA34NDhqreOufvx+ePeEO9Jk9mTJKQoWn6LJkbNm8Lu2J4vv9KjV
         Fog/6ATud/yHDL9U8QQuXhKnRaIDHVX8Be0e5RDJlSrjrF2xrLrPix8snPN7j2mguLfW
         T/94Ay5YJhb0h+y9C7UoxGSvNUqXHdsRalS8abw7YB/44QgP2ElGYAeMxD2rN9JQM9/P
         Mu3Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3ZT1EC8BIoDVSAQ8x4f/GcHlLwZbSl8JS1krg0yJPSqPqRtGABs7Pa9mME757O+y51LbnfbMtUp1uV07S@vger.kernel.org
X-Gm-Message-State: APuU4Z+EO0DgeaZXwp4sXjHTpHGG8C9Kep35kDM/KcKYhkl4IbLBkbv/
	06GmApXo/NI8UdUcpdOT+pO53wztxkfNkVC2PVYoaDbc8vnGSMO2XJwhVHMTjPIjo2ZFT5yzHuf
	v9+4C6jjV3CdXdLGFeGB28yyd86aif6JKz9xfLK8Z1UuUSDmzuMg0RKmbvMJYrEn9+bel
X-Gm-Gg: AYBFou3BCIv5I8YORXUfHmXbITFf0xZEsn5/4LWZJcpRsPkD1RiOvnGUC6YK7HioD/R
	4+Jd+eEVvZY6SqA+7n17DlF++9DeBMRxQHqt9alQJM8w1Bbbbp+vSnucjyVHsvIebRJ6+I5C3AV
	bBac2CIYx4Yd2KqJE0UbtZQSdYLInDCKS7dFXfU2Gs4xHelYiOgjR2n2hk0yvfjoQHLImZNgUfh
	Otj77MMPCHt3MpQ2LbIn7kgIjcicrLRt3s6E3PO/mayHzA7Csh9eCux74juxENs3OBZkQL94OAP
	pidiiyLpfkuUhA+ScXYfipwwAWhvA+AbjJB7U9JYoJXcVSKljEsP/5mOIDlwxeF+vJEUFi6RL41
	EvjhEVPaAh2dlCASw/zRGX4BU5rOMaRM8kZqmKCB9zPZaTHfiw32N6ap/Acl10F1v9hMhBo7gXw
	==
X-Received: by 2002:a05:7301:fc86:b0:36e:c07a:426f with SMTP id 5a478bee46e88-36ec07a4913mr702725eec.39.1793877350498;
        Thu, 05 Nov 2026 03:15:50 -0800 (PST)
X-Received: by 2002:a05:7301:fc86:b0:36e:c07a:426f with SMTP id 5a478bee46e88-36ec07a4913mr702685eec.39.1793877349891;
        Thu, 05 Nov 2026 03:15:49 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dd7ec8881sm14002125eec.18.2026.11.05.03.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:15:49 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:44:52 +0530
Subject: [PATCH v6 4/7] tee: Export uuidv5 generation for TEE backends
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
Message-Id: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-4-c7d68ce05c51@oss.qualcomm.com>
References: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877323; l=3003;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Twey1zuZcAHPNfsDJ1UYaEgRECNx0M9KEAwGTgro9JY=;
 b=db++sqPUH/XyyGS7Ka53YiKQJPHZdjl8bosVBr48pSSEJgP7GfLEvetShpJRqRDT2g7wcFNqx
 /XdkqSkPuO2DvN3kMs4uHNGZ+n3fjQcQ208zNAV7WA6wJkuKtqsAyKV
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: IJ03lrZY-2BZj6F-zFxh_uktepXWbttL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX7PLzyiuX7kK6
 Rr1fxoKaEmyb96JArMcoOEeoD6wZKjIDNFIX0VbpNZ8p4OJgin8lfsWiICvTZtGA3oHjpwfbj3Y
 0cC9WbKCRi6l2CYadEqtsNNE/kzkkaI=
X-Proofpoint-ORIG-GUID: IJ03lrZY-2BZj6F-zFxh_uktepXWbttL
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec6567 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pmd68VmXx7mOn8wi7GwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX31aAc0dAYtbp
 fjuH1Z1X8SXlhoUNNvDYeZVIsM9aCMr/qadaWF+0yC33boYrNTDbWGLfzvex2Qw1+XZZVFm47cl
 8y2Hk8eaym/bDYJZnYK+5w9E1IC5ktD73NxbvFTegfUJDM51XPTWlW6KhPxIs5FpQwn5n35Uizh
 L/OIKQEaa7rW95Uc2oZU8hgDO5+8mo1W2ZxtiOUKaJxjvA1w5Z+NCJL/VemlcfhSZhDr7XJWxGn
 qcic+a6dQhKKhEA5+bbzBjzq1GG//xVg5PvsMg48DWdimR9z9hu08glEyehl4kT7R5scqccWKqA
 ZGO4V8qVJAVXfYwFTeQt+gFjGs29HpKMptxk5R3sO8xydzLGUSU72T0qaiw6BLn0RyB6XmEpqEO
 hc48V1MRpq2iJxAfO9jw9IYZCh4KywaW1ouKe8q4pracS2QfoX+UyyeXHWtvCVE+cBsG90mg/bm
 7LfJlPq9AH0hox6F6MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050044

Export the uuidv5() function defined in the TEE core to all TEE backends.
This enables the TEE backend drivers to generate a UUID for identifying
and registering their secure services on the TEE bus.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd
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

