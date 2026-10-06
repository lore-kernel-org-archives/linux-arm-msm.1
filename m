Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929472BEC55
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 00:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247203; cv=none; b=sAiQ23e2EHUe5+YLvBlyL+25MNyerPM7iQILEiJdNRXR3TufoCcCwfrvWTr9RfNYBqh5JgdfR4o9YsSm9qfoYW8R6iV+te7vh6EcpxVPyVUT06mL2qV25VX98KEsJHCnh4TKdNQDQAmqSiwr1LRFhfvrvkI/9fXa78QR9M/3XkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247203; c=relaxed/simple;
	bh=m/Jg1IBzk1GaLMkEQ8ygyVkVct/4HGDOSskLv6CeLfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jKGeOxqSrdkkftb4FUDs/2rFv94/deyci+co+dTLVeUlHh4ZOU05H4vWyryrj0YJMbJrV8qeZE3Qz6pwWp0Iu1Ni9qlzhC/ORHjfsujNetCTnTH5ikwGMzyMUej9KUgI0CcF2uHAu0hx2id2q30gxUxyuei+5ze3YD7QNeoEGd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9Dd5gz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REx8JKOt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9Dd5gz/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REx8JKOt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KN0Tw3299813
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 00:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dovwb3uTuq5K59dqdz0kPhDC1qlUCkJ6dzdznEz/4J4=; b=M9Dd5gz/Nnd/BJS8
	eGnnCEQo5vqfju8HJkoU1j2kCVHwJc39UFE0Q861MvD6H/2OFRKVnDv827tH/5xh
	0bDA2y6zGz9ra0EyfcEuHc9RD492AUh5ENZ2rklBjBsIE3Zlbs+dZ2JJlBRV8b+n
	DtQgcMvBUZPwu8JBIBaD4BDddBzeK9Q107tIkZEkrhYHWZttbcuw2NSkZTltfV1+
	Y9NqoTQR6IfzZV4syo5ZIx91NhhN83n97FP7lvT0iHANX0oEIMS5o15yFkDrrD4r
	W46aznv//895zEe/3Q1bJPof8e+nvtMeinXAQhmYY/p6pkaEHclyVlOlyzXCq232
	SYGWJQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg2ras-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 00:39:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so5850269eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 17:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247199; x=1791851999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dovwb3uTuq5K59dqdz0kPhDC1qlUCkJ6dzdznEz/4J4=;
        b=REx8JKOt0EDbRwZjOxnbIrSE2dPAGNkZZ7V3XT+EbvoYXTAIcwIt0RgtioXhrUff16
         EqDt3FI/xGC60Iis6e94BtIpYvlQbSPF5GrYMZqZ9qdMtYVJ4Ha63FW9DnWlbc+0ukPI
         gwnw1Okx+eQkxZqh5KnI1YoN4GHz9DR92/HnE089jqb5x5hLrybllswW2cIH9/oDwc2Q
         2d0zrXEhpSBXagxrFcAj943zGeUwG3FAt/7d22U29f5U/UFVYFQr2fXjhz3hlmVAeL8z
         0PNEpcC6xj0XdI8T7PEru/OuQQoRSE9W4qWWbSCD9nPDCAdmXalfEd0LZH/fN7VpaoaJ
         4e4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247199; x=1791851999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dovwb3uTuq5K59dqdz0kPhDC1qlUCkJ6dzdznEz/4J4=;
        b=ttEIB9ylNtkXuQWgfFgCXeQ2VbWlscGb1u6/XbI9zhmfqz/3khrGK7mO6lrgIXu0E2
         hPyAGS9k/dW/RmNwUxgyC8OUEV0+X4p/LhcsmVagC8vjiFYKzIVogzI3NBNjB/YUzhSj
         p29bpof8mR1mnoeF99qvMwTKI8qAkHoPWGR/VQ+mXCt6+tHsq+kQww0ZjfsbB7Hh7sz6
         fCGSVj45uYNN4OHQyR72BaborjVGauslXegWFVwXXt+YA93+dte2WWQnN8MoJ1kDf0tR
         GygJbzfP32n0Nf4hWLdNZXLksNilWcaKfz8tfhe+RSNys5wr6HzVuL+7csFVLD+4l/bG
         5H+w==
X-Gm-Message-State: AFq9FYI7TA1tZk5Jh+66Ka/UvX/1uR6SYBAMpU/6wg29ySWy+w9Q3VbF
	u6NJ/ncQ5eA1RFvCSdHcGA4aIbojbm3mVPjIJfHbkuwrw7/tTC8PFkTKgjjhUYhbs7eD1kgTVd4
	uoo33uOcQl2R5JNxhyv5VfAgwlSMlxHOY8HmLo7OZRtp7x5f07teJSO2zVAdZHyRfjhg=
X-Gm-Gg: AYBFou3tSO11cN05NJ2zIMdlvouTWhmDfjsuKoAjnRNeEIiPwaNRnF8mTt51wGiPLC2
	zyqC7U/4l4bUjJHTml5/Rn24WyRzz4kE+T5Ihr3NKnq7mBDi9NkkiSlq6W0vmdTLjPCi/ugwVNw
	NNpWKlST0sSZlZggtfqLqmyzCpmFX9qXPAEpi0Dqe/qvrEBFNe8QR4UG1DT6FPs8M0QeLsXsYG3
	KJS94cmCit+KIEzcouK7yl3Bk5rS5wuDCb7smpIdUSI+bfaGKLTYUli1ichJZ9xbmtp/LWVuqMq
	nhMaWjuEF8AHcPBfbzU3AHQ40qpTOdfyZZkMccZhLBJaYLkcbALNphBJqeACX0J0iBjy74Pr9w5
	WIsfOl1mnOAx17XItabEj+23b94uO83RuoBtbfAPeojsuafYzMpRbd78rFw==
X-Received: by 2002:a05:693c:8810:20b0:351:27f0:e411 with SMTP id 5a478bee46e88-35127f0e81emr6947158eec.20.1791247198247;
        Mon, 05 Oct 2026 17:39:58 -0700 (PDT)
X-Received: by 2002:a05:693c:8810:20b0:351:27f0:e411 with SMTP id 5a478bee46e88-35127f0e81emr6947118eec.20.1791247197525;
        Mon, 05 Oct 2026 17:39:57 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:39:57 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:39:48 -0700
Subject: [PATCH RFC v2 4/8] tee: optee: add RPMI dynamic shared-memory pool
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-4-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: or6J_dbJtcknpu7AFVzvFyCOc3Vq37kB
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac4435f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfXwVvS+vsQcqdR
 I9Icru/8s92jIjff010ZejZAMz1g4comSDr+CV+6pb8U7Ctih9nUVzYOTHh6YBK76nutfSGczAC
 DJ39rvNvnQmPq47DCRuosFLapqFQB+c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX+shEfqV7Em90
 dgSWeujFW/CtfXc7pVJJA/4LtcPOxyH5WuGB0Wf7jQt1MrbvIoL/q/XPQZ86x3Rw4PPXi2wluBX
 tZRq/++b3Qkz0YH6FbAc+pE3F2QlGxB370W+KHCJgTddHR0OfwKACHgzL9obD1zp6xBa+WnywoJ
 zTztdmAx7eMigUa0LITIlJeBE97gicdBOAx9CgaUlYJpk9mO25awVym88iJlnKZnWswMuk24PJ3
 tFPVmAwQXMHekcrD3lKEOk9jCQ4MQicKcfYp0bcpbNcd/YW6904jVvTrNuw3qrVEyY3aQm2w++/
 Zj4llj0okbcbn58JGWUQFtHe/OiTEjW/sjrIyaYy3I5K/aH8KLE0I9MKdZLVcTxWAoKdgVuvxUE
 COik8JMjO8YnbeMaucWeaTWk8np+9z30reX+d0ce8IwB65S6FAa75cXB4x+tTk0/ZkiYX46R6Vw
 KOTImm1EWVwAYV1mNjA==
X-Proofpoint-GUID: or6J_dbJtcknpu7AFVzvFyCOc3Vq37kB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060001

Add a page-based dynamic shared-memory pool for the RPMI backend using
the common TEE allocation and free helpers.

Register allocated pages as RPMI parcels so OP-TEE can access them.
Unregister the parcels before freeing their backing pages.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/rpmi_abi.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index e7fc853cfb15..c29b7ac4552a 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -282,6 +282,42 @@ static int optee_rpmi_shm_unregister_supp(struct tee_context *ctx,
 	return ret;
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

