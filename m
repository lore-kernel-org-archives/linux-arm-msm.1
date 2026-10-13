Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5A048F832
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870114; cv=none; b=DYad5z/ppbsOq8oga/ukfq/3t4Pt0/wo2DR6nwnymr6ZRXhdf1C79+pMe5ksJ00BeXXvgIJ8dondj6feqAVZrFC09kwhwEv+94PXJR5W67IgXjkitPVrfQb3xxr8oK/944P9H3yqmnoKUyh1pmEUwJzOhIObL16cv+Yp3R/nea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870114; c=relaxed/simple;
	bh=xfd7voO7tE36nEMwmvhnhqtwXd+9sNurmzQCmvHnQy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EsWu2CHgqAfSYy7glvr/cuKEt6Xu28MFd3DJjiXzP9HZNuFp/B1a4ZwGoDXhGMQHQnJJjsslvVsNlT4UysMmhwPJJdfK3fdMjEE+JgNlQTR24c8XgDZWzYPUe7OPhuZstZSZrTuLhocmlV7kSQ0qgG1q5F0U8tIOk6OTq3vor+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZukXKvuc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDbNgV58; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZukXKvuc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDbNgV58"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20pqv3907366
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TyCY3djL8PN+a1DxJAYuBVVySj7YPULq6/PcA5HDv1k=; b=ZukXKvucprqa55nG
	6Ol3JABAIrNuktgDdaGS81x8aQCwhCsqsacUEPXAYQ2SQodmfxUcDvkSWFEOxUyz
	f8f/Lad1MWn4GWQ1p8i6YP9BXhR651v2HYhKXoqgk1vYqEnAE3IiLNSPc/UiRRYc
	IUSKpq/HuRxt5+Pl6CW1fNRR2lxrD3pPYzPv3b4X+Om0T9BHALkjZmCPDON+HPil
	QG47bFVQUKeB4m/XDb2sHPXoTdbUkw7Y+/8Dgax+OZWPjHpQpBSsxpqIpjelGJQE
	YaGFGdRcEpf5lmJ0YdHiYUbFwHqx6GnBJ5eSgDIzQ0P35ZBfWGC59IUZrSOZ9Sqh
	BuPnDw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqsud5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:41:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so5052207a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 22:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870111; x=1792474911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyCY3djL8PN+a1DxJAYuBVVySj7YPULq6/PcA5HDv1k=;
        b=VDbNgV58sNGF6JaqYNqGpGtK2yA5DhdB+0ZYLTrsGjBMWm9FKtiHidTo3toL/3Sn4x
         IojYYCmpHyhTlov/pf5FrFUskS6u9z80ZhY8IMSoZwU8ZNSmwF7vX+u3RwgJVtnlFxPs
         ck3yu/dQe7S1MY2N/sMUDrC90eGRIn71nQ2wIWaZR3E5AN22j8CqxlmQ3Lees1zFOO3r
         4WZOp42r3mgQ/qHF2uVGZbZUqcE29XCUfzDJ0aGp2tFHnF5EPpsF7cFYEkePJ3gq6ASP
         VceFzyEafGRlr9iXqljmm+uWvGPZDEb/3v2PWJzUaNFGTfUGQecHROpQgP9qwqnWcXZg
         Pfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870111; x=1792474911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyCY3djL8PN+a1DxJAYuBVVySj7YPULq6/PcA5HDv1k=;
        b=WBJb1VOC21upLhTYXhxIjvgutFMcVe3rHveWjPStweW6AkEHI689G0P9K59O0Im8+R
         +c06mj/aQVHFiM9JdhjL18s7ptZHLwqIcSd5fUC0UTK8W46Mq3QYINJA9sMV+fkTCMBp
         G4DIIu/dfsZ30t7+Bcn+XhwACnPR0hUciygirs2KnA20wKqAD/lcyHlr9Cd1ywJP+gh8
         /DWje0BvZI+Gi7aJH3yFZ62nsQpsLCGGldbMNneb1LR7ArPecywaUPsCwxsxVZVQRw1n
         62cXE1IzHtxa6b2xhAfDW1cv20STL4cy0iAyYICn6OxbebeD4qOcHRKSiP8xi2+N6Gzi
         GNwg==
X-Gm-Message-State: AFq9FYIhTdSo+UHNmhnw6zj5GdbHSWpUxNq3aAlnqofJvRpDSBlpGDNb
	RrbWrcEXIA6XzaM/HdecqEUho/140TcjAY9eWQGC1TJp3KyB/cWMtrwGuYNY64IOLCg+YaUKhaA
	8QUm/dEp8DqAX25rvkwp7GZ0JcGtblRfs+Xt13ZiaL9eFouiphgHakhYERCM7NcMjLb8=
X-Gm-Gg: AYBFou2IYZO2KVXVxALi3hq8Ox8pEtbEOTAhRhhVGxR7BxHbDfTjwD3XG6ND19ngxeP
	N2cORcpEDjikgdz6efKlF120Q+6CLDzG2i1VeCcYr2z2O3wt3LMVnxCa8hDIe/+RlBN8AgF7ekG
	CBF+8gA/N8N7VLTPKiu6nQXp9H7HKYZj9O93WCoj941JW6F/HFgGgC6utod4KW+MDA5I81bL0MJ
	bhV3GuNJIEcjwEaN600uMmcG9ZUNKtH8QmMrscjcC8iIo/53xZ+vV9mQdSCVw2W0MfZgGoGlE7M
	HbdCevdwXWCvGWT7uaPHTCiO4k/hGkf48LZIBfuF4KT5O1SLyDI8HyVttMHgDlMk9uTuVyabmMf
	XFN3++bS3YBx41mcftMkCpzk+b+ANy+5Af06uAT5ZCQrHhYbNktHolkzSGQ==
X-Received: by 2002:a17:90b:2f0c:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3ab3ac9b91fmr10370200a91.43.1791870111239;
        Mon, 12 Oct 2026 22:41:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0c:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3ab3ac9b91fmr10370183a91.43.1791870110729;
        Mon, 12 Oct 2026 22:41:50 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:50 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:29 -0700
Subject: [PATCH RFC v3 2/9] tee: optee: allow RPMI transport builds on
 RISC-V
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-2-975b574667e2@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX+ZAlQ7CA4oJW
 yBLrx/Sd17vSEwjemJHFBLuq+wQ31wVWwCphlua6ZN+7rwst1KURqLWbwrtF2+cys/P6Xb948xn
 4QVe3ysooKslmhDc3NWm50d21R9JrllbbKr2d6/v5MxNXoSqvlayFb83S8nqcjYVWe4+ppUr7+X
 DgAAOecPbjZabDsHPnnJZX/2iafZehWDEVjwyfyPrj1BaxnosjLRoWHNHPqsOs+RKvNLQxukJco
 zhclS20+yMwlRiqpeC3mUu/jvNi6xCjV3tW9OZBpv/n44o6WiHKUP3tAULohW2exRawQVdOqGLG
 7V0sPRKHo1If4J7ir5DTXqsWLOrovAuYqLAzKv5LYt0lI5GnB9B5mCYHIoyKDdko8Ioecy17FbB
 0swm5o78tC8q7VhoXSnhtMOe4nehycvutwehFlzb6nV1CrPOEF+bdt0BPrjyvNEoZ7i3C3SVBkx
 YJME/Mawcj8qPlsIrlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfXwwMA6O6fPSxr
 nJh2MpOeHnsPUbLkjbv4FdRl0u8ccMHdDKIN7WQs6wpVizicPt8fZQs5UmGm++iZ3nIjUxO0PjV
 Wd8ePEN+9BH2930TvsgNVV6jbuid3RA=
X-Proofpoint-ORIG-GUID: ToYyQGI0GA_MMt8PnqMtTLJS52BtJz3T
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6acdc4a0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FVoukCuPRgDGiLv7d_oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ToYyQGI0GA_MMt8PnqMtTLJS52BtJz3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022

Allow the TEE subsystem and OP-TEE driver to be selected on RISC-V
systems with the RPMI TEE transport enabled. Prevent OP-TEE from being
built in when the transport is modular.

Common OP-TEE code checks the memory type when registering shared
memory. Add the RISC-V implementation so that code builds without
reaching the unsupported-architecture error. Reject mappings with
explicit non-cacheable or I/O memory types.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/Kconfig       | 3 ++-
 drivers/tee/optee/Kconfig | 3 ++-
 drivers/tee/optee/call.c  | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
index 98c3ad083940..ad754b647a3c 100644
--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -2,7 +2,8 @@
 # Generic Trusted Execution Environment Configuration
 menuconfig TEE
 	tristate "Trusted Execution Environment support"
-	depends on HAVE_ARM_SMCCC || COMPILE_TEST || CPU_SUP_AMD
+	depends on HAVE_ARM_SMCCC || COMPILE_TEST || CPU_SUP_AMD || \
+		   RISCV_RPMI_TEE_TRANSPORT
 	select CRYPTO_LIB_SHA1
 	select DMA_SHARED_BUFFER
 	select GENERIC_ALLOCATOR
diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
index 891dac63cab8..cc057c76de62 100644
--- a/drivers/tee/optee/Kconfig
+++ b/drivers/tee/optee/Kconfig
@@ -2,10 +2,11 @@
 # OP-TEE Trusted Execution Environment Configuration
 config OPTEE
 	tristate "OP-TEE"
-	depends on HAVE_ARM_SMCCC
+	depends on HAVE_ARM_SMCCC || RISCV_RPMI_TEE_TRANSPORT
 	depends on MMU
 	depends on RPMB || !RPMB
 	depends on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT
+	depends on RISCV_RPMI_TEE_TRANSPORT || !RISCV_RPMI_TEE_TRANSPORT
 	help
 	  This implements the OP-TEE Trusted Execution Environment (TEE)
 	  driver.
diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
index e046aff61828..267513cf4ec0 100644
--- a/drivers/tee/optee/call.c
+++ b/drivers/tee/optee/call.c
@@ -604,6 +604,8 @@ static bool is_normal_memory(pgprot_t p)
 #elif defined(CONFIG_ARM64)
 	return ((pgprot_val(p) & PTE_ATTRINDX_MASK) == PTE_ATTRINDX(MT_NORMAL)) ||
 	       ((pgprot_val(p) & PTE_ATTRINDX_MASK) == PTE_ATTRINDX(MT_NORMAL_TAGGED));
+#elif defined(CONFIG_RISCV)
+	return !(pgprot_val(p) & _PAGE_MTMASK);
 #else
 #error "Unsupported architecture"
 #endif

-- 
2.34.1

