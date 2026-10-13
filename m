Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4936F4915B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870121; cv=none; b=UuTwqOpN/W/uZbQtYu8PQVAeMMwcu67ph2Mvie+aD7UmzPQT0w4aYTIBhQ79SGauIm2ZcimuyBk7ZGpMezkmngeJTfjvtyd6oI59IIRyImg7TpgE8yTwZt08KFDGXCcgrmO/Pg4NOsyvFTPDvlnvixjTqCwN735UEV5DybyX7XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870121; c=relaxed/simple;
	bh=7Q5nRa43hWpowrs3WTtfQQ8c7SPGddet586Xp5YmbBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1U6hE1N79Dyj8tmMg5ewwIgDHgDzAcN2usYjqFyw2kVknVbx/fxesfx0z/zS0D6o+20gucfRVgp7G//E9WN2wmOPPyD7WTRUSqj+4lUd7Tlg6tnyOC/T6c7pzc2UhSOLffsUMOCwMZmMdBJ3Uw8THdy0ODJkZg+1gv8Hd+iS6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N64wzUaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4eWgx22; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N64wzUaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4eWgx22"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21M2h3509544
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9/Es066BKyO9sRu6bY124oGmsHpSkt+MyzxTSuoHdw=; b=N64wzUaJQPWl7GrO
	o2Y+P28Hfkq5qTYerT+VjMf7hTj/co8gaqJdwraY6hVP4uhIpmeZ0FvGjum454FL
	6KlFVbTIIJxsDXtPHoeqjV9idCktviSbAY+2E2CCWzcpS9xcwZ+4CKjs0DoUVwy3
	Y0k2wYRtTK6Euzg+zwosQ2VBUJDGLtFra15XIOYxh3MQr+KtwY0P/XW01vfK7ofV
	/km00MnWOkcftyL70IeeC9zSsCrl1aWKHeGU72j+vPpGJzL8UkJeqwAGN5cz5NJR
	u7a7h9KPul7kOSqyMm9JoJI5czruSxvt66Qh5W1ukGuLRAxNQM4YFcplME6y2gfI
	rfK2og==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc4fd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:41:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so1122507a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 22:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870117; x=1792474917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9/Es066BKyO9sRu6bY124oGmsHpSkt+MyzxTSuoHdw=;
        b=g4eWgx22sNOzzKizpaqYlzOBp1K56SCIhDT+pZ8/E24QmnalyxLpzvIIw5n+hXdDiO
         mbdD/HFIsya5FPog4BdYGesUuNhz0OhNFiQ4zdYDUaJdYk7A6q2ugXAvC74PMQouevVV
         x+YjmwyODO2PCrkoZYEzQtFRPq0lTdbnlt4xpZf6Uxv2XcSURgoE4W7ZQG8WLJVgRnA1
         I19YsstkfEDE4hgsfiFptUkhUNl/fuAxKDsL8MboJbInMWTZbko+W5iu4cmNXjJORYoK
         GzhQIA3+09x7AbQFF5DT/htbJ6xwijos8JHHCkjPP3BUFpkQo3+OAmT/pQjD3+Ouiq/k
         TJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870117; x=1792474917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9/Es066BKyO9sRu6bY124oGmsHpSkt+MyzxTSuoHdw=;
        b=hNLyrjih7jAwDGShPH76PsNbFQDve5p70UQbq2ZSZjOv9QljdLDsEO9ycCmPlausI8
         Ae/dXQZJOx5FDMmDsBRmERzHWDydaTQZ/u8H0jPsyKuJd9SuAh4SRAp+boL6ShzrXiOf
         JOcRoSYGMYI+fMItVbAudjsFB5/TTmMxC4gC21/MCc+Bo61ybJeIUp5wkmJ9O170JMxX
         kzlyzBxnk/w9plG6CvIqGHrFV7LfjjzotFGjyY6h5zbekCmICAtS9HqQ0NX7w2HWNhDy
         fh/gJPkccPIDsqljKpTG9w5WVIiXEeb/aMZBtd7+jDQGTg8SD1I10MZlQ1jqx4QnAMcI
         ahPg==
X-Gm-Message-State: AFq9FYLpwMxQ6FCsksK3cyEaGSrnb1hYhas7N5zId4a1ful8VzB8+zSs
	waUtdJUstiyreKJ3CZcldCWQWkTJj1p5XxrJRBpZDvTzmcqJ6JFhC3Bf4FSAi4tk2D74cywlcrx
	hGjsjjBkGcW34IEuJYQDieZY+f0zgzZgnNYGeMhw4LUajczJ49Fxfnym0cvCrjNL6dkQ=
X-Gm-Gg: AYBFou1uKNr0NjjGL4ewjNHuG9Rt50/lmtJllmc3sEr2IruwuixQ5XyBfm31NyARs7i
	pBf+HyRxXgA+I8Xnz2UfKGbI7KG3VGrqoZ1XsI6f28OT/pmQWIZYYHhxkhI4HWQJw9/7lDj23Vq
	lOVhRadBaSIRUi+kd+K8winQyZK7WU9T/kH0pIHKY7vuH8gsC/IS2l2i7n0QEPXAXa9Y6w6GAyk
	dmIbeBsqo3oOv3ZOPQsyvSIksK8MeKFNbhX7eGpkOWz2JODEU2k0CnouxucP/7GkUMsnXdAramu
	GUNuKaUZ1Ksusx21Qvg5CnsR1TDLGY34PXBpRWRc5/a+vGPORuR18op9NNS1PHgf4U7HT9OsrFz
	LUWGM25nkFW79xBIDrl/wpWT0FHkOnFsIP+L1qczi4j3+Rv5yqxjOOl68uA==
X-Received: by 2002:a17:90b:3143:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ab3ac95141mr10687422a91.56.1791870116723;
        Mon, 12 Oct 2026 22:41:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3143:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ab3ac95141mr10687396a91.56.1791870116192;
        Mon, 12 Oct 2026 22:41:56 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:54 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:32 -0700
Subject: [PATCH RFC v3 5/9] tee: optee: add RPMI dynamic shared-memory pool
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-5-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX87nxQ7ziRrqm
 SeU00eb/2FGLcGdwgNbuD6d5yzbfdcUPdWIq4PggrnMARimiGIrBWJ2OU5VcDKdxUveh5gc6CR9
 2L3GXBL+wjUeIGkWkRrHkdEzoMSZn5c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfXx7EDyIFGw2YU
 lvystWf4cPwUmMpT3s12KvBL9Ms7vGR5+q+oKChl45pmYsb63dHHK4Cc2rKdrRZugnuKBvHfQLK
 s9Fpg7v1P7+axWt7mZSbz0Exm/uJwqekVKLUTcG/RtZNd4p3xQpEk3aH4FUhbxGJHWagQifIQgm
 mA6N7tvbFh7hDPGAwTuzYqaPsavXkb+iYK3dnhwl1UCUXx8KxmH9goZChJyjP+TXxsgpeqqbsh9
 m/h6bDJnanhKfhU2LEG55ZC2CJVBosenuLX0jVIpdKW1/lJiRIVBpZs9e7O3ybqJ5iVf7zpu0xT
 7rodEMsVEy8+0nLuj6FeFe3dP67PxRdnZZy/wg9ooNp+mSiXzTdLBkIPSpBElH2p0Ntx7htNUvf
 +KqXo8lLivmhaoPNoVYPC9GAuviFR/N/D9lbkXnxkgYAMTivvVh30rX/ByTPmqKFHOqcUKJuBP+
 0wRDtbGaO4j6HldSBRw==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acdc4a5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: P5FEaw-alv-A7B8e1j2AacxxuFeKnt5J
X-Proofpoint-GUID: P5FEaw-alv-A7B8e1j2AacxxuFeKnt5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022

Add a page-based dynamic shared-memory pool for the RPMI backend using
the common TEE allocation and free helpers.

Register allocated pages as RPMI parcels so OP-TEE can access them.
Unregister the parcels before freeing their backing pages.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/rpmi_abi.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index 940676794280..bbb219ddab38 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -183,6 +183,42 @@ static int optee_rpmi_shm_unregister_supp(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_rpmi_pool_alloc(struct tee_shm_pool *pool, struct tee_shm *shm,
+				 size_t size, size_t align)
+{
+	return tee_dyn_shm_alloc_helper(shm, size, align,
+					optee_rpmi_shm_register);
+}
+
+static void optee_rpmi_pool_free(struct tee_shm_pool *pool, struct tee_shm *shm)
+{
+	tee_dyn_shm_free_helper(shm, optee_rpmi_shm_unregister);
+}
+
+static void optee_rpmi_pool_destroy(struct tee_shm_pool *pool)
+{
+	kfree(pool);
+}
+
+static const struct tee_shm_pool_ops optee_rpmi_pool_ops = {
+	.alloc = optee_rpmi_pool_alloc,
+	.free = optee_rpmi_pool_free,
+	.destroy_pool = optee_rpmi_pool_destroy,
+};
+
+static struct tee_shm_pool *optee_rpmi_shm_pool_alloc(void)
+{
+	struct tee_shm_pool *pool;
+
+	pool = kzalloc_obj(*pool);
+	if (!pool)
+		return ERR_PTR(-ENOMEM);
+
+	pool->ops = &optee_rpmi_pool_ops;
+
+	return pool;
+}
+
 /* Convert a memory reference to an OP-TEE RPMI parcel reference. */
 static int to_msg_param_rpmi_mem(struct optee_msg_param *mp,
 				 const struct tee_param *p)

-- 
2.34.1

