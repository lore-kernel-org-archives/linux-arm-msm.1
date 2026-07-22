Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDBF3C76BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703588; cv=none; b=tYAjbItDSi7Iu19U5fCf8AlMZZaG/X1pUQR1lb0l8oRzqRwas115BFY5VHxV6ZAIozf0kZx8Kqt7Wya/BQevZoqqvGVxm//T7Z2PjmIZ4SvH8fy3ONODnWLqV5eJHuMbf/OLXLcxNIoH1TE1hLxjai9rDlU/1EhRj7Hhyvt/3Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703588; c=relaxed/simple;
	bh=25WePboOUIh0OM10e66E31TxP7xc6qwFaDOGM2WjvkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W+fJobV7DT1zkXx5tCKQ2rfzpHdlIKa+fmyLmb7xgqIQvrFcRQ3dc2LD/X70n6s+6PX2LDePj71fWYMH10rD1EI4Co6d6wYY1V7udiE6NMHLNf9Ui8swP+L3yDOoVzJ+AP3SKnktyMPrO1HuP9DSF9nf+gqSBM9kyBlGK0+cqQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDjA985F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fzeQbItp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDjA985F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fzeQbItp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53X3g3767503
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31qc/02ryLxVGZE3W44tXTDK/BxZ/hQGixj6FDcU8hw=; b=MDjA985FTEihcs3X
	2wdY/g4MKqtNbHKn/0l7btgtoFPyOsqvr8b6MCDfonA+ut2Flz/loSIvW7Lou1IR
	2PHskQaiWFW9MZTt312VyXPBuwzunDZd6sdNWj9yRGz0y84QDfzLRfrZ4oZ3qATq
	ek8hXIO0pAHOsUZeL6fm2LxkpfINR0A4h5s5WIZ8gsoswy2KYlff1heenxfQUNLd
	z7U+vQbcMNI9T0d8ceVpnnUXEOlgEL78Nc6uxknaJGHROZ/eFKHepsq0z6aGQ1+s
	4lyAO2VVUNevv79cLlzvGEZeJ+/5nPguQgHO7QwFL8lrOMyVKutGxODVaDFG94u5
	SIZDfw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4rr8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:59:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so9120345a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784703585; x=1785308385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31qc/02ryLxVGZE3W44tXTDK/BxZ/hQGixj6FDcU8hw=;
        b=fzeQbItpq2dxE7CNIiJ9G0bu0ocWYRScq8OrbDiJ4IcZMaYE/aUvXr9dNTViK36dyy
         hycUJcxtPGhQ3XW1rIeoRzBvboxpIuSLjiHsNM2bJ1DkwuzujiBoMX7U+rP4Bg+VfrWd
         E+ldQztGYjG8rxe6ffSMD47kGG00BBvpwNjSw7CZRZetvAB72Jmktr6isWgivNzVdVCU
         lY8+rrIAHvp5Ze1oymvcAYIbl0YYEbMNpg7mnSgjXjta0u+vM0YcvOWYu1gXdUSnoPgx
         43/oZ+iSG/S5QrxSG2NmqF+5NwjeWnvcDpdPO3Nimo7AKxD5QD8/LVkWEC1D3WPpgBY+
         jrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784703585; x=1785308385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31qc/02ryLxVGZE3W44tXTDK/BxZ/hQGixj6FDcU8hw=;
        b=YkkAIKM1C2uIrrhJ4jMxgHDW4VF+HYKqn7W3oVUZ2zcym4LN66iGip/Hc6u8aIm6Qc
         ZHGvbdOEEzZCULs11yFWOAmToHnv05FHHg7MpFsDx9IhTrCPKjFi40qOTjWvlaXCdo/p
         a9sHLbtSA6XykCPksdm159PmvXE2p5U2P0pDJt5j7m9jsO2mXLhKUV+GiYSSdv/nY1ei
         9j69/7aatOs9fFYdktaS02dAAYsDiWFpETctIRYvyDKpK3mKFq8Wfhke1KWT3U4RLroC
         7NkEsEdRBdvYPWGJ80YQqxCbSDUGCCu6FST849GUg8oJItk0iHKLYt24LkMZa1JOJsHn
         6A+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrej2eWuC77xE2cjv+y3SkyQyc+QoJevY9L8ZXxzaE4iLBwMNFcrTw3mnS5XStShH0xRSxnkqKTPS0a0Ihi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1aWTZmeap51Fgk04tnQ86TlVO/6561cXHMU5nj6mTr/T/D1dK
	CZvUu9kMuxoikcdXqZgJXVLSXELHyey1Lzm+lDBF2Z1mHt+LfQGRHJIPqMc5rHAmHVM+paRvGiD
	ll3wd/9N4ZWuUb3S4pgni5PO//VNLkELZ8kkIv5T0oa6RvkyTFGcsMHhbG9xKdv7vR1Dg
X-Gm-Gg: AR+sD102UYCkX0Bl095LgWuEf/1Lq72ygnb6IBng6e4nSnZEMrkmfgvStOvYfCjXeM9
	9mGCZU6h87GXhProbDuRXZ3VaxvetWEs7PhZiWjpaf1EM4OJZvLT4KRuwaQat0Jua5KCt/i+0v1
	2RXWLWnTlwaIeTrZ1hL5Czaa8KRVPWOU7/N86ZpeOe1QN65otA1Mnb0D2TmUzwu7TjNH8FAGogP
	Y4R0Khry6T+ki/YdB7fssZ6m3QEk7xov46bGutHEN5VHEWWlPm6kOP12Jb8HU7kk6ivSw2UqXo+
	hUc+Th1M5kzPTjOhJWCW7++7m8E85VjA3NiW1pyu/xYY5kE9rRydP2MWLYhJAOcvNAixrxUiRty
	NDfxKyhLne+T5rOJmQO0417wBmw==
X-Received: by 2002:a17:902:fc4b:b0:2ba:6518:a6d4 with SMTP id d9443c01a7336-2cf34906386mr240005805ad.20.1784703585377;
        Tue, 21 Jul 2026 23:59:45 -0700 (PDT)
X-Received: by 2002:a17:902:fc4b:b0:2ba:6518:a6d4 with SMTP id d9443c01a7336-2cf34906386mr240005515ad.20.1784703584781;
        Tue, 21 Jul 2026 23:59:44 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd88f7sm9428935ad.22.2026.07.21.23.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:59:43 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 12:29:13 +0530
Subject: [PATCH v2 2/6] tee: Add kernel client object invoke helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-2-b8a8fcbe4211@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784703569; l=2583;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=CXt0mSkOb6Fv+NT3vb9BCSp9EdXlKG5hU1H1pxd/wnc=;
 b=Y2LJQzDplsNqP3q2YuickHd4qkJhiO33TsIfTfT4UR7bl6qIwggPUpi31T5kjH5TerPc+qXX1
 D/kUoMsA64yAkN1RPu42L90ss/hWblwUp9b7FmCCOHQllGUqNLRVmN7
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: yUKFNG_eNT2Y0Mj6fTD0JPQxHijyKe_k
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a606a62 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kr-ihz5DC76VLKRVsLUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfX7LQJX5aRHIo2
 KYnaa29dMiWRg2lh9rS+UyIdq+FB+tSDYXr9aMdWzboggxNeIbJ2doEkTLQk8r1DF12LcZg5nwZ
 xmimEOsoC+V3sda8Mym12oc6YHsEa/q3RQM8DDa+rTq9YrcB1UfeHL4O32QvbxvVW1nS4yByOx/
 3LqQDzf5HhVJIaddVESOU4COKVRG1R0G6VGARscNw37bOYw4qe/4QXK68ZFakNTI0txr3vhAboj
 7F7yQeUEnltfk/F41NwbcqbXooALdpjBJSQ3nZg2uP1pUmAuRkyx3LNv1KysodxF4hgM2JcaE80
 0qUrN/Iy9PrnW+N0/uQsD6txOUBDZ6vMtVbIOkz/33+KZEgXo82nT0IlBp/A6lzFtCE7mWt8uPJ
 nJOY7YrhNxS9QvpBatTX28A4CKKNcVi5Ls632fFAvVej0kNvUN/DFz8OBjLyqHqDIFlUoGgdYQP
 Aby0EidirVyDVrsoQRA==
X-Proofpoint-ORIG-GUID: yUKFNG_eNT2Y0Mj6fTD0JPQxHijyKe_k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MyBTYWx0ZWRfX93VsB7YenWnp
 jff/lRYpxw1jtUMwUVO4HNT1THTv1kjiC8OOdQosp1PM9DfS+jcr/9BTRrqPM7CfIX2m3Kr/ZhA
 ceeiqtD+Ystj/gfiletB4tjl5vu7uio=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220063

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
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c  | 12 ++++++++++++
 include/linux/tee_drv.h | 13 +++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index dba5d4d2d47e..bb418490f3af 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -1410,6 +1410,18 @@ int tee_client_invoke_func(struct tee_context *ctx,
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
index e561a26f537a..ca99c6b747a8 100644
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

