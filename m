Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707153E49F3
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 11:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286465; cv=none; b=ldK2gUZcot9mdUzVsAfTbGfvGskFwohedNIdzdnq68CL3zr+IDXxIXCJcTnF7UIAoN4Lh1WTORxo5Nyny8rtd5DsOfA/g9Pfqf6fpXCPgD2vXYPjLcqaL5VJQwTTwGD9LI8qSHPvV2Z90tHGKjHlNQiXyyOPsmxxgrAl5BSdf9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286465; c=relaxed/simple;
	bh=V6V67HDyVwvDLDt9fmB26sYcY1MHYbVDIRs6gvhxmoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ahRiZxd4TyhiDsx0J0Ej1B18KiP2FpfJzY+ZL1dE9wFTA6b14w4dEw7ho+ILxruxSqAPZ99pShjiJCYhljuA50ZTf2/O3bFP7Anz1LqWJKGrnn+wyMjctjIORKIiAphv9+WoMpLIkkPg25c1XdBDxAtlEyBA2AWPeJzIuOCA95o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVt5RnDR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UgfoUGEo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVt5RnDR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UgfoUGEo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPW4o535725
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 11:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3m8lL1hF50/CqIcZMmwBNIsPVljpYvteygQ2Xz3F0M=; b=YVt5RnDRq2xGm1rD
	mbUHvUuqsFsBaI7j4nhg+FS8v7msootrv+mvIzhBylThHBgZ1+amTzLkyg66vOym
	U1C8aISc2FoB1MCT804QydLin4r8dNhkEF/XG5SipUpyvh66z2SreJnGCpZC9U2R
	w+ikdzhmStAnWESblGgv4ViuTdgYud7VfjglUNjYZdCQMRvLqyaxS10XlnFjH0bk
	wr8CMucQkjuftRLxWk4FHzbqAHKtRnR+NF7lCS2QoK4oz+hLA4uQVlgaM+lDtHG/
	oniFfwcJL2cZKvMDPbuUGHltZLHt3Qsd58HejzMpnOq5dhnVEDDgrIhZgnOR4Ly5
	+vmOIA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0bbdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 11:34:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so2865827a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 04:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791286461; x=1791891261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3m8lL1hF50/CqIcZMmwBNIsPVljpYvteygQ2Xz3F0M=;
        b=UgfoUGEomy0e9BAiGrt6ZsIdblRyqjQ39U5PFJJs2p9ctUeRssFh41su65VQ4kawhw
         mij2Pf2x+XPADeVOhdyDlvqh95LbydL1Y73W81ae3zWm1xdtp+OHA5pCTJwayN/KdMo/
         uBUch2cAe7fCpqppZRO3RgMuJEq3qzmQrOrzKz2nSrNz1cJh1+yKuuYPtJZblnDss4dy
         0ejibH7xwTEFSYor+SSLJBOGSU0u+fYqAU9bkMYx8W5S4G1kiUHllxDV88RsxVE7/dHJ
         0uFteVbeLeR0kmda0YkWLPMLIBEbJtwkHaGPsAlnK+99GOFtUDaHexnzXIrkqifJz+M7
         DO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286461; x=1791891261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3m8lL1hF50/CqIcZMmwBNIsPVljpYvteygQ2Xz3F0M=;
        b=qzvyAyouh8ApO65aGMbVdU1URrs6Ag4jlmEWnU+wD5hAJFHTgGDLBrKaDQEjjDu7Vh
         zp3gUV1hS8Bfe8NQkAGkcuIVCBoHRSDFuqoAbbIVmTYfk44l09vbrnwcWxhoMOg6lokN
         LFCkgfSpVYtNc50kVGy64dY8CVNpV+2zOaNPWFnL9NvT51ZPsFHgYkF+wz69gDOAI+CM
         4Y9CRICxdJP53X0rFCVaDOS8bclu948OETzsIzr++NPU0KSxXT3h/V5UhojiCljQUIGT
         AKhSlgFjUpPCKDFu5YmuuPFi8GYYZBDcACvfr7yE6IO8dLq7ygGnX6uk5p7PsxIe/vwz
         bNYg==
X-Forwarded-Encrypted: i=1; AKwUvBzaqKUiimlRFmyLtDgOx5ji9+rdBXUcR9C83Bc9v2BS1vbVKVMEM8/bC4SUONQ5dQcQH42Mhbf33ywuwJcB@vger.kernel.org
X-Gm-Message-State: AFq9FYLyZDqoSNbtwoVwgTQUbBUvfGM7pjJafJDIEmJOVOr0tIm3z47U
	bVM58zoQnvRcMoofRbzmRMg+Acs0f7JEmQiV0g0/n4rMH05CmVGxxogY0m4wl3e4eKGSZlm1SbN
	wwG+CQkkhPPbmjQnODCQdPpa8Tb5rNXAd/CuPsiCSsPq7orryG1goJe4nABcoKGla6my2
X-Gm-Gg: AYBFou3DEAr2/jlH5ohGf6+KcdtktJJN6D2JRdrXt6ogMii/qO0Rw5wsQikHGtvxWDs
	wS3V8DmFhQax3NyaaX2GGmlkhGejGzcYt/FImWQVRHCzgx/OfWbnMYKkUJf0c2kHMseiE58WUcu
	c5x8LxrHh9AiaSaM18de/6iup9ftKZTREf3DQh11clcIL0SlVsIHzJw3kEkpjwUEyA9L/4OwYqa
	uB2OG1gOONn7/LI4HudzDNTGXJO70SIQS8uWU5faq0zs2/goes6ny3R3g+cPFDa01gz97Dx/Bw7
	beIRtT5Qvep1oD8+F4eX/mHXoRCARHyXbb6QQb+derbEc8CkCBnOhnE0q/+olnrnV0TE+KWqDjh
	wzSIad19fsnaVwkjoEmKtBI/S
X-Received: by 2002:a17:90b:3b50:b0:3a1:6719:6892 with SMTP id 98e67ed59e1d1-3a87350ab25mr496954a91.11.1791286461238;
        Tue, 06 Oct 2026 04:34:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3b50:b0:3a1:6719:6892 with SMTP id 98e67ed59e1d1-3a87350ab25mr496932a91.11.1791286460766;
        Tue, 06 Oct 2026 04:34:20 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm9330092a91.4.2026.10.06.04.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:34:20 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 17:03:25 +0530
Subject: [PATCH v4 4/7] tee: Export uuidv5 generation for TEE backends
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-4-bf1c8e2a64ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791286430; l=2896;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=V6V67HDyVwvDLDt9fmB26sYcY1MHYbVDIRs6gvhxmoE=;
 b=H+AL9sPBWZtubzOPpqMMxaz0a8SEPvsgTWpF9sb2XyuXMZ4q8jYMSuyYS08eK0e6/yne6nJnR
 Z+ljMz64mfRAA3RJrzkO8xT+ddXNZvjgF2NtEhj1lFKbvx7AoYmeXJn
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX89TKbAuEIAes
 XqIIvny8HwCkRPVHYnVPMxj8lrry6QD0YNe6T9GRrtAF/wOaVPYqf6zIXL8oBhjGg6GLECJutzZ
 zJqb9DwIaHTaMhZJgQ2K7uqUX+wq92ZfPEmRVP6JEQ+KLTOEpOAIef0+KO88yBatA/ffPYn6ZxS
 jNcTOs6+qPZOn57aFrI0ESCbC2Wto5NSGf9uN5yrGl02gGYgcTgp+lM7R5GNZ8sBRT8yWGrmD/J
 6mV5Lv2I9a9H7pQ5IUNlReEe3BLZyIJsvGyIEClv4pQT9bHTd3TjI32vTaaSsv9tf2kgLbEvZRV
 aZgi2AzzArEuFMQk4gVrEgylJv0A3AO89wAGi/SvNj4Dtt6UnP3dxbNuJpjdC8Sl4DBPS896bKe
 bx3To6SviKVCh5NRAreWmKZ/VuaDgHvuTSIG3zIv2Nh+jcsJFUPCnNMBCkqk/uzfDcmSbRhwYGX
 dX9JSagkajbCJfxgzEA==
X-Proofpoint-GUID: bCopDsaNyJuI6Ccu-bMFXiSCaxI3ppLU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX8jJImggJr0+H
 f0Bdn9+EIfRh+Cd2UbjacLNEaXH3zMCE3nbSuEDo4u+rcMKAV624YhYRv/5eB5YMuoh6pmES40h
 wzY+/mbsoQCbhe1e1sFVNuDNbwgR840=
X-Proofpoint-ORIG-GUID: bCopDsaNyJuI6Ccu-bMFXiSCaxI3ppLU
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4dcbe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_y_UpZ8dDEjReVSEE2UA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060045

Export the uuidv5() function defined in the TEE core to all TEE backends.
This enables the TEE backend drivers to generate a UUID for identifying
and registering their secure services on the TEE bus.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
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

