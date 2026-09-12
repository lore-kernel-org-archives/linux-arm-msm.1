Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949BB35AC09
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208134; cv=none; b=d/W+lFefQDzcOMzJvXevhWphXurudAuKQOXIL/ZrFlCNshpMslJqP2y4/vlOZ5s9wPos/cPw5994ehE9HqITn/KL3u8Bk5ybPnZQ+l8NsXX83yxX9Gwj7c7ux/Eihzh+nQS9AVslZ4lA50I3I36VAijf0uLXLtiQJCCKUUlTd/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208134; c=relaxed/simple;
	bh=nbmyEVTc4+Ww2tjJ+SxB0dnh0CfPx4aQRKXHop6+iNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=atl82dBF3p5Fn8wBhnprtw4STEADj6CUtvErMWrm6wkQJbFNkQFmo80ZfsnV9tvim+5N7e+AWddmLAA39/t3XUbnNnCna4jFR0+BvXF/qYpObPFkfD11uppoJYUj5Sj7ToUdZVT9mIe1jceO3NzoU2GaSVnIuvREs7g5+Rb7GjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKhV9cEw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQbagFJt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKhV9cEw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQbagFJt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C84rg11990768
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 10:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zIuGB8S7sRqJtqaXIx6R8EAbbBn7m6GmghtV+o0/jPY=; b=IKhV9cEworVEOEwW
	gk6s/AjMqe1VEHdXDf6OW1iibkSxE39kSVan21oa2dvnbSCWnDHoIjrQ2diJxQmY
	YxfYT9yfzY6U1+a1grvJUlkzeWwZnosPxX0ZE3OXoZXOfNTyBrvl4ZqLW5Y3Z/h0
	ggOEKIPlLrs2YU2oGI0YSBvre/dgljMoYrgeDJ60MHeN8pun6EP8vvXA65/a6z72
	rVrsmCe963u+12MIiYuQY3RSPDsIrakxpNh6jN+rfpMynrU5paHAavftKC24lJ74
	mnlPtLyAdqvKVO6/EV0/XjcgW+F6b3rLapZ2viLj5AiLF8JJxN5sOGsGOWrVohf+
	JDl3Aw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd0pqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 10:15:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fb956002so20703195ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 03:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789208132; x=1789812932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIuGB8S7sRqJtqaXIx6R8EAbbBn7m6GmghtV+o0/jPY=;
        b=VQbagFJtlxJhM78N7lsWS7c1lE1VcaF4UfnuJhlQHvUjbQrtS5EVCeFGCUfBI0qSqD
         biwB+0nzADkVpMhH6ccng7HZVT3mf3CC1i2LUgR0kCP/FWulqn0Z7WGN229cexfPTFLj
         m7JtGzbyVjygqOQFI48Tj4cZwUHrSKYIUQMul0SD0UzCLBxsaQyqGjoVJJ9RAexENo+s
         ko2xcfKgME3HVIynIcLtlomMR28XrtZrdb3E+Y/YWeAJ6+xCoAaMCi+V8ndoPvFF9Sgo
         b/RfHGrtNlibVLb2PlYpyCEAYDM5XrDifd4Hv0jZP6tqZHEvAmnk3how/rMA357Y5ce2
         jbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789208132; x=1789812932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIuGB8S7sRqJtqaXIx6R8EAbbBn7m6GmghtV+o0/jPY=;
        b=aBagDthzSMTFg7DdDKUUsqkQk1LLDlg8d6GJwitenPUZUbijBLeDfdO541johgN3BO
         Aa7f83a/1fd94ox6OVnIH5evzupuuDUsOUYq35rMiqk4WgqL6+LIN/QaO7Ldchk3BZQ9
         9L2GFF217NsdWlUhq7NbPW/w/Qf7TGFcXsgv/FRYZYv//ho6XbGlNenAfNstfFKrf0ic
         4mpN57ZFFdcL8wGGB8Kw733SZ9qWGC+b6qnbicb/5T20ROd7pKO85z8z8Ug4MQ9Ul2Va
         pqslTFLryjWSJxnP1KTuVouBH1gejlH810uAKj57uBaNIOzmklowl6IPvJZlhxlwLeIQ
         LzAg==
X-Gm-Message-State: AFuF++kSJxDOw6BPzhXG4DHxnnKi+cM5eK6QHZ1Q+XVDCjTlacQSnH1q
	y+In4pyFWMp30nvkJZu68nzOL+CPWMI20k7EsqW6yNAZGhb9FqZXAMVxtks4y6hpeV6B0/+F1lN
	3BjTK0Ku44ZB/Upjv69aCLwR4siW/kiLsNxMNvIRojAGuaOJxOPVD7vGOwJk6T1KK9TM=
X-Gm-Gg: AYBFou1WOLJLoy3xa2PsZTkGYYpICyxodvWPXm/JNTL4JdyAbOaFrxDCiirZ0PcGOk8
	Abwtzv4WXU8r563143xsMStCd+6iELU/CkcQz266csCrk8cc/qTmJSExf0FkL8E7/x5CLcvFrQu
	wVhxvQkm0iWobKYY0uQvIL5jnvXEfB0EmGo0zQ2AEG3xe4aWXG85ikXKo1D773Lu+bjPpwaxY/u
	/hC2inxZADWLlbgqi2RjdIBbj6fr892zL+iPYW6EZ5PmhXftbhkjMEp0peHekr2wBoyOW44yvEH
	CPWj9gJC6Vyi8Za8fnWUFGkqusHfLTXSc3wnq+l0C5y/mmIXWDLpnY9rxH/BrQYO0pr6xH+MCjV
	5KSZ48PGCVlCkxT8vOx+OyKVNbiAxcf6Cd84Dnss1gAfPkKgYQnpytu3Q/vI=
X-Received: by 2002:a17:90b:52cd:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39dbc699006mr4249289a91.14.1789208131978;
        Sat, 12 Sep 2026 03:15:31 -0700 (PDT)
X-Received: by 2002:a17:90b:52cd:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39dbc699006mr4249221a91.14.1789208131506;
        Sat, 12 Sep 2026 03:15:31 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm10340085eec.8.2026.09.12.03.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:15:30 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 03:15:14 -0700
Subject: [PATCH RFC 3/5] optee: riscv: enable persistent shared argument
 cache
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-rpmi-tee-service-grp-dev-v1-3-1d1d35c2a859@oss.qualcomm.com>
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa52644 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfXydhutdw9KhjC
 uXhwFDI8QPkSSoZ0owhKF+tj3iF8GRMHpO9sUK64eXAIpuSQgA2HmlAVemfJfZGVFbblegUxy0H
 7t+bb8DmGpmS4+847zZrueHL7isGcAbvzZpgtrTJZTM4w9UZoEyN3GLnbQE4AI3PzbdtXEpHOM9
 H2C/eVSTeINwRIljWBYsMzMdGlGXEKzxjGBd0b9WTlsKFP9VjlVWyatbIqUQRixmxI+g3uJ5HTl
 REsMM7qYPvXNdlIKEdlq9eSh0QxlBc5KHbqHBicA7QdKvFSwcqdXumzU01O7NGPupVDZoXJbUpC
 1Rkw1svSwmoOuhOF8WR3yZUxnaEsHl2iDkRA0Sn0YoHN7ClQnzQF0zk9irJ5Dp0pz2GfcluKvXy
 5dkkX1Q6VLBSd/jbVy1fK+Src5v9qDDe9OlvqCLjvrk//AE7/1aUK+cuEnvN4mHHdFdbaoG9098
 2cNlvSKN6aLcKJZqi0A==
X-Proofpoint-ORIG-GUID: Tonqk53pAFe9B7VcwTXLIl8oOhTwYICw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfXzxQ6DVjGjM58
 xgpOX4lT5cEihGQkSoNleogeQwQXDG52jdYLY/hnVTWpxP2cejlmom2EOzI+Tj8dak2t6ihmNPK
 vO/4C2XP+ZebnTEP9pvGiw1mjnRgAqY=
X-Proofpoint-GUID: Tonqk53pAFe9B7VcwTXLIl8oOhTwYICw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120146

Use the OP-TEE shared argument cache when secure world advertises
OPTEE_ABI_SEC_CAP_ARG_OFFSET.

In this mode the argument structure can reside at an offset within an
already registered parcel-backed shared-memory buffer, allowing the same
buffer to be reused across calls instead of creating and reclaiming a
parcel for each call.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/optee_riscv.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/tee/optee/optee_riscv.c b/drivers/tee/optee/optee_riscv.c
index 36115326486d..72c9eb85f4fe 100644
--- a/drivers/tee/optee/optee_riscv.c
+++ b/drivers/tee/optee/optee_riscv.c
@@ -1149,6 +1149,7 @@ static int optee_riscv_probe(struct platform_device *pdev)
 	struct tee_device *teedev;
 	struct tee_context *ctx;
 	struct mbox_client *client;
+	u32 arg_cache_flags = 0;
 	struct optee *optee;
 	u32 sec_caps;
 	unsigned int nr_cpus;
@@ -1219,6 +1220,15 @@ static int optee_riscv_probe(struct platform_device *pdev)
 		goto err_free_channels;
 	}
 
+	/*
+	 * If OP-TEE can read the argument struct from an offset into a shared
+	 * memory buffer, cache and reuse one buffer across calls instead of
+	 * creating a fresh parcel per call. This is the persistent pool that
+	 * matches the FF-A OPTEE_FFA_SEC_CAP_ARG_OFFSET path.
+	 */
+	if (sec_caps & OPTEE_ABI_SEC_CAP_ARG_OFFSET)
+		arg_cache_flags |= OPTEE_SHM_ARG_SHARED;
+
 	pool = optee_riscv_shm_pool_alloc_pages();
 	if (IS_ERR(pool)) {
 		rc = PTR_ERR(pool);
@@ -1266,7 +1276,7 @@ static int optee_riscv_probe(struct platform_device *pdev)
 	atomic_set(&optee->riscv.next_nonce, 0);
 	optee_cq_init(&optee->call_queue, 0);
 	optee_supp_init(&optee->supp);
-	optee_shm_arg_cache_init(optee, 0);
+	optee_shm_arg_cache_init(optee, arg_cache_flags);
 	mutex_init(&optee->rpmb_dev_mutex);
 	platform_set_drvdata(pdev, optee);
 

-- 
2.34.1

