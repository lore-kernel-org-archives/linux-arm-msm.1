Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D604915AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870128; cv=none; b=DOxyJOlcuT3SslBPfpzCRCl89lnxp44n0ZB2a/rgg6cbLUHYP92rDm+VoTwmm3hJ8UbXqMeoUKYHCm1qm5BJM2UPrk5HWYiKMcTQowwSa1hYNri/b9HruLMtGOQUdW+2giYGAiCHbxlmZnmqquNlt2elpI1o6SCD8Q+r5POse8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870128; c=relaxed/simple;
	bh=qkvO8NcttE6nVeqM3db46OUdkPI9BTFG1P5Anc6qjeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QsmI3I+XDC6E4me9BDx4GM5ppPglM8Bfb6OIb2ALUvrjwoMPzUDNZEdWy05/BZGb28dAmRf3HiIETusy+qkKK7qPQxquoUSa/CFXrlPqZocH/secwT1er9544t6SJZIlNEIdM0izFLdAm//+XEsU7Y2Jr4B132j73TbfJGt+/hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZWPWKu0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kr5hQXdL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZWPWKu0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kr5hQXdL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21ex32620655
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F275A3qQ//poxhR6w32YGzAWK7ySOfEAUPFwqhgYxQ4=; b=BZWPWKu0kk7HlR0S
	1qt5KsR+7od6g6I/vw4ylP7+QeDJHEph6cFWlhnDUUCQKstnFvZ6VgELyQejYwby
	6WHE3ujuV2t+S5eJusgoZxgOhhyoLqYy/vTRf2pMdDy4kGKSK8G+YOB6xB6jN3Pj
	q20X15OH7jLT915F8YW/nOlpy/v1I71TRoBlOQQ6gZrjkTVLOcds+q19uPR/BlF0
	nGDZCGwVcgp9f24tYnlrUhtlir4+9Dc6jTbPBuUXGrpzJpFBxBRrzdVp9b0kqsj2
	DNBw7EKD+G4+OJqQlTpzD+7eWlLDzXVA4YSwkKpzri0wtp2SV/p3LbRlOu76Vdwz
	IYw01A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcvb8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:42:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso2717825a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 22:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870125; x=1792474925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F275A3qQ//poxhR6w32YGzAWK7ySOfEAUPFwqhgYxQ4=;
        b=Kr5hQXdLmf7NhmJe7odSGMw5YK7N2Kj8RvsPOqpHSjMSZyijB/mJFVdqwxbGmsule9
         LZimFdVQMYmw3EFKh0L7i6k5BoxENx3goPU/uFh+AK6AokW6Ox16z6uo1hQlm6+EHey7
         rSYc4AvzirpO2OQ10wSEnhGNF+8YYc1cmsfyTjQBKnM/RizOAJftUp4f+2nl+LXz5ABr
         j7Ai912Hqe38xm5N0l8WS8ozzQrxpGE3TjW8fwnQ80xsQtztnuDkJ4FUZKvmwN1sffo1
         yTOcmXu3QWLFcoxAZBDpjZ1kp2CNPhLqMaXF5NFyHchZjDAx4ytDqwiYURU6yj2kt9nX
         aFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870125; x=1792474925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F275A3qQ//poxhR6w32YGzAWK7ySOfEAUPFwqhgYxQ4=;
        b=WnicDJu8xlQgVpBJKs94iWT8yemDsT2UvmI+XxNa4tvTIcUr17pM3grzm2JHLzysQW
         cLKY4SYTV/1w38Ih1B1yiuxJvQ0oOdM1uu0bHSiasU2wDtD7s5dAt6zkPfmsqbI8HO5k
         oJ2BR77/BNAixuUu2+2QjDmNjFskp+mjkLG7dHX7a0gOqcORgfXy7FoRS2EpR+4t7N+/
         77xhI3Mzt1CPMWi+vW/l/79x5XgpuZHb9MJAEAcj/AZnjAmFqR2KwQalauIXk3fXTgHT
         WZo74J5sFaxBx6PB8gl7USBy0vA68hPzgGMWKajb9BZzS9VO4Z9Y3UoShFr561tndRl7
         1Kzw==
X-Gm-Message-State: AFq9FYIQDJkYjzdQ8UTa64eGyqcTZZ6xfY4i9cRynOS8CYb0oXwy20WH
	oi8w6dem4wdxFjg5NUrp5bipm2q112f14ZMHxcHMzPO+QyyE6lbX/DpmEO5qD4fr1PvUzXojSZT
	dC0aYT37OESBSUERWjKlR+ysjuUIC95CrZ+KQTMRmWWYgGLdRLLE37sosXYHd7f2oFKA=
X-Gm-Gg: AYBFou3PK+2epj5E6oIPO8cGqIJ9Hats3bpmJhdoKIOXOXAmkbOnqRmy4g7ZN1NPfap
	QfAQimYIOgOyoOUdoex9SCHq/p06F8YxA1MCPaau3/Ixn7sl8VRws74WSmV+4Xm55YS6DXL8pxS
	Mki2h9NDMF93nTuINF48p0k58TsL0z+uKwytvQQrKHm577oRSOADPItRWDl/4Ib1gwbE+fSl2lK
	z8WbisQiSdV3Z1OEV6y1gw5dAhwQT1D4bQAuuZ3XOrZP7VGelQwueRdSO0Jdu59T9qcVz00F8lR
	GfxIY6Y2krUKNTuI3ZoxFPBrWVf6E0lvyivjkNwB6ccvUJhMWiMKm3LpWgp4Yn+hDnTaPsC8sBa
	3sJzSU6NwHPhk0WACuy9L8KN/A+jzUdBgOUmy7Fe3DHuIX2oodlEDTFwW4Q==
X-Received: by 2002:a17:90b:43:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3ab3a9528fbmr6664159a91.10.1791870124986;
        Mon, 12 Oct 2026 22:42:04 -0700 (PDT)
X-Received: by 2002:a17:90b:43:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3ab3a9528fbmr6664117a91.10.1791870124409;
        Mon, 12 Oct 2026 22:42:04 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:42:03 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:35 -0700
Subject: [PATCH RFC v3 8/9] tee: optee: bind RPMI services and negotiate
 backend capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-8-975b574667e2@oss.qualcomm.com>
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
X-Proofpoint-GUID: S22aCEqUO6RwJaLRieUhV2E_zPm4CyUl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX3vFTqt3XZqnn
 D7uELdrJ8Q/O2Jr8GGICpSr5WCYSfCM3xK+eQQTu10dA0hl5qpkGZZ5r7utpVh1KI2j6a+d6x1L
 Bndbj1m0rrU0ep2DaSO72V1oWet8iIs=
X-Proofpoint-ORIG-GUID: S22aCEqUO6RwJaLRieUhV2E_zPm4CyUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX7AmoJQkuKu9e
 GlOvDHd18xVWOxMZcWJlFkc13HGs/Y7toU1heJGEbw8Ju9RvvYAm6D2VxkvvpIBvImBo0c8UKEA
 XZ2TtPHm3NcqpQyMZ5MAqMlYuxcekqsV9Q0pRwFf3GDckc33NKSNDtUsQf73HiIdVGCiD6NlhJP
 zaL7Se9Po22zUeZaUYm2nf9pLa1OraOo4xKlczmWthfDJEWWXygGpOcsTwj/Z2FwS6iTTgmtLiG
 Ai51xS750RWM8rkXYVuyKXQaGkaubAEpvmumU7MwA0Wc1hpwT9qry1jqxWlQfygHduPv/wiEz61
 zRo+rOh0Y8mE6zr01XJfuakj2KYnatfmod0lnQHbziUUf2oqzKsh8oDq1G2Ndb7C56iu1tfd7ep
 +u3a6RvGKzvo5mmTq81EI6nfFqRDDt2Iw7ySzu0/Sfm/9NVDv9k6kzcCu6S630gmx0AGryR1FDR
 CM5Ix+WylTc89tVXRnw==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acdc4ad cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=G3s93uPkn6CA8LbIO-UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022

Register an RPMI service driver matching the OP-TEE service UUID and
integrate it with OP-TEE module initialization and removal.

Check the service API version, query the trusted OS revision, and
obtain the RPC parameter and logical notification counts. Initialize
shared-memory tracking, the call queue, supplicant state and internal
context before publishing the client and supplicant TEE devices.

Connect the RPMI backend to the common OP-TEE operations and enumerate
trusted application devices. Enable in-kernel RPMB routing when the
RPMB subsystem is reachable.

Add removal and probe failure cleanup for the backend resources.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/core.c          |  10 +-
 drivers/tee/optee/optee_private.h |  18 ++-
 drivers/tee/optee/rpmi_abi.c      | 299 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 322 insertions(+), 5 deletions(-)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index a52c1f498b99..d9bb4d3a34b3 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -220,6 +220,7 @@ void optee_remove_common(struct optee *optee)
 
 static int smc_abi_rc;
 static int ffa_abi_rc;
+static int rpmi_abi_rc;
 static bool intf_is_regged;
 
 static int __init optee_core_init(void)
@@ -245,14 +246,15 @@ static int __init optee_core_init(void)
 
 	smc_abi_rc = optee_smc_abi_register();
 	ffa_abi_rc = optee_ffa_abi_register();
+	rpmi_abi_rc = optee_rpmi_abi_register();
 
-	/* If both failed there's no point with this module */
-	if (smc_abi_rc && ffa_abi_rc) {
+	/* Keep the module if any transport registered successfully. */
+	if (smc_abi_rc && ffa_abi_rc && rpmi_abi_rc) {
 		if (IS_REACHABLE(CONFIG_RPMB)) {
 			rpmb_interface_unregister(&rpmb_class_intf);
 			intf_is_regged = false;
 		}
-		return smc_abi_rc;
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -270,6 +272,8 @@ static void __exit optee_core_exit(void)
 		optee_smc_abi_unregister();
 	if (!ffa_abi_rc)
 		optee_ffa_abi_unregister();
+	if (!rpmi_abi_rc)
+		optee_rpmi_abi_unregister();
 }
 module_exit(optee_core_exit);
 
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index efc1e37fe1bf..fcb291a43b7b 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -224,8 +224,8 @@ struct optee;
  * @os_build_id:	OP-TEE OS build identifier (0 if unspecified)
  *
  * Values come from OPTEE_SMC_CALL_GET_OS_REVISION (SMC ABI) or
- * OPTEE_FFA_GET_OS_VERSION (FF-A ABI); this is the trusted OS revision, not an
- * FF-A ABI version.
+ * OPTEE_FFA_GET_OS_VERSION (FF-A ABI) or OPTEE_RPMI_GET_OS_VERSION (RPMI ABI).
+ * This is the trusted OS revision, not a transport ABI version.
  */
 struct optee_revision {
 	u32 os_major;
@@ -503,4 +503,18 @@ static inline void optee_ffa_abi_unregister(void)
 }
 #endif
 
+#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
+int optee_rpmi_abi_register(void);
+void optee_rpmi_abi_unregister(void);
+#else
+static inline int optee_rpmi_abi_register(void)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void optee_rpmi_abi_unregister(void)
+{
+}
+#endif
+
 #endif /*OPTEE_PRIVATE_H*/
diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index 9a6439e15a33..0ed2de96758e 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -579,3 +579,302 @@ static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
 
 	return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
 }
+
+/* Query and store the trusted OS revision. */
+static int optee_rpmi_get_os_version(struct optee *optee)
+{
+	struct optee_rpmi_probe_req req = {
+		.op = cpu_to_le32(OPTEE_RPMI_GET_OS_VERSION),
+	};
+	struct optee_rpmi_os_resp os;
+	int rc;
+
+	rc = optee_rpmi_call(optee, &req, sizeof(req), &os, sizeof(os));
+	if (rc)
+		return rc;
+
+	optee->revision.os_major = le32_to_cpu(os.major);
+	optee->revision.os_minor = le32_to_cpu(os.minor);
+	optee->revision.os_build_id = le64_to_cpu(os.build_id);
+
+	if (optee->revision.os_build_id)
+		pr_info("revision %u.%u (%016llx)\n",
+			optee->revision.os_major, optee->revision.os_minor,
+			optee->revision.os_build_id);
+	else
+		pr_info("revision %u.%u\n", optee->revision.os_major,
+			optee->revision.os_minor);
+
+	return 0;
+}
+
+/* Query secure-world limits; version 1 defines no optional capability bits. */
+static int optee_rpmi_exchange_caps(struct optee *optee, u32 *rpc_param_count,
+				    u32 *max_notif_key)
+{
+	struct optee_rpmi_probe_req req = {
+		.op = cpu_to_le32(OPTEE_RPMI_EXCHANGE_CAPABILITIES),
+	};
+	struct optee_rpmi_caps_resp caps;
+	u32 rpc_count, max_key;
+	int rc;
+
+	rc = optee_rpmi_call(optee, &req, sizeof(req), &caps, sizeof(caps));
+	if (rc)
+		return rc;
+
+	rpc_count = le32_to_cpu(caps.rpc_param_count);
+	if (!rpc_count)
+		return -EPROTO;
+
+	*rpc_param_count = rpc_count;
+
+	max_key = le32_to_cpu(caps.max_notification_key);
+	if (max_key)
+		*max_notif_key = max_key;
+	else
+		*max_notif_key = OPTEE_DEFAULT_MAX_NOTIF_VALUE;
+
+	return 0;
+}
+
+static int optee_rpmi_api_is_compatible(struct optee *optee)
+{
+	struct optee_rpmi_probe_req req = {
+		.op = cpu_to_le32(OPTEE_RPMI_GET_API_VERSION),
+	};
+	struct optee_rpmi_api_resp api;
+	int rc;
+
+	rc = optee_rpmi_call(optee, &req, sizeof(req), &api, sizeof(api));
+	if (rc)
+		return rc;
+
+	if (le32_to_cpu(api.major) != OPTEE_RPMI_VERSION_MAJOR)
+		return -EPROTONOSUPPORT;
+
+	/* Version 1.0 has no minimum minor revision beyond zero. */
+	return 0;
+}
+
+static void optee_rpmi_get_version(struct tee_device *teedev,
+				   struct tee_ioctl_version_data *vers)
+{
+	*vers = (struct tee_ioctl_version_data) {
+		.impl_id = TEE_IMPL_ID_OPTEE,
+		.gen_caps = TEE_GEN_CAP_GP | TEE_GEN_CAP_REG_MEM |
+			    TEE_GEN_CAP_MEMREF_NULL,
+	};
+}
+
+static int optee_rpmi_open(struct tee_context *ctx)
+{
+	return optee_open(ctx, true);
+}
+
+static const struct tee_driver_ops optee_rpmi_clnt_ops = {
+	.get_version = optee_rpmi_get_version,
+	.get_tee_revision = optee_get_revision,
+	.open = optee_rpmi_open,
+	.release = optee_release,
+	.open_session = optee_open_session,
+	.close_session = optee_close_session,
+	.invoke_func = optee_invoke_func,
+	.cancel_req = optee_cancel_req,
+	.shm_register = optee_rpmi_shm_register,
+	.shm_unregister = optee_rpmi_shm_unregister,
+};
+
+static const struct tee_driver_ops optee_rpmi_supp_ops = {
+	.get_version = optee_rpmi_get_version,
+	.get_tee_revision = optee_get_revision,
+	.open = optee_rpmi_open,
+	.release = optee_release_supp,
+	.supp_recv = optee_supp_recv,
+	.supp_send = optee_supp_send,
+	.shm_register = optee_rpmi_shm_register,
+	.shm_unregister = optee_rpmi_shm_unregister_supp,
+};
+
+static const struct tee_desc optee_rpmi_clnt_desc = {
+	.name = DRIVER_NAME "-rpmi-clnt",
+	.ops = &optee_rpmi_clnt_ops,
+	.owner = THIS_MODULE,
+};
+
+static const struct tee_desc optee_rpmi_supp_desc = {
+	.name = DRIVER_NAME "-rpmi-supp",
+	.ops = &optee_rpmi_supp_ops,
+	.owner = THIS_MODULE,
+	.flags = TEE_DESC_PRIVILEGED,
+};
+
+static const struct optee_ops optee_rpmi_ops = {
+	.do_call_with_arg = optee_rpmi_do_call_with_arg,
+	.to_msg_param = optee_rpmi_to_msg_param,
+	.from_msg_param = optee_rpmi_from_msg_param,
+};
+
+/* Keep callback state and memory tables alive until all TEE users release. */
+static void optee_rpmi_remove(struct rpmi_tee_device *rdev)
+{
+	struct optee *optee = rpmi_tee_dev_get_drvdata(rdev);
+
+	optee_remove_common(optee);
+	optee_shm_handle_map_uninit(&optee->rpmi.shm_map);
+	ida_destroy(&optee->rpmi.nonce_ida);
+	kfree(optee);
+}
+
+static int optee_rpmi_probe(struct rpmi_tee_device *rdev)
+{
+	struct tee_device *teedev;
+	struct tee_shm_pool *pool;
+	struct optee *optee;
+	struct tee_context *ctx;
+	u32 rpc_param_count, max_notif_key;
+	int rc;
+
+	optee = kzalloc_obj(*optee);
+	if (!optee)
+		return -ENOMEM;
+
+	optee->rpmi.rdev = rdev;
+	ida_init(&optee->rpmi.nonce_ida);
+	optee->ops = &optee_rpmi_ops;
+
+	rc = optee_rpmi_api_is_compatible(optee);
+	if (rc)
+		goto err_optee;
+
+	rc = optee_rpmi_get_os_version(optee);
+	if (rc)
+		goto err_optee;
+
+	rc = optee_rpmi_exchange_caps(optee, &rpc_param_count, &max_notif_key);
+	if (rc)
+		goto err_optee;
+
+	optee->rpc_param_count = rpc_param_count;
+	optee->in_kernel_rpmb_routing = IS_REACHABLE(CONFIG_RPMB);
+
+	pool = optee_rpmi_shm_pool_alloc();
+	if (IS_ERR(pool)) {
+		rc = PTR_ERR(pool);
+		goto err_optee;
+	}
+	optee->pool = pool;
+
+	rc = optee_shm_handle_map_init(&optee->rpmi.shm_map);
+	if (rc)
+		goto err_pool;
+
+	optee_cq_init(&optee->call_queue, 0);
+	optee_supp_init(&optee->supp);
+	optee_shm_arg_cache_init(optee, OPTEE_SHM_ARG_SHARED);
+	mutex_init(&optee->rpmb_dev_mutex);
+	INIT_WORK(&optee->rpmb_scan_bus_work, optee_bus_scan_rpmb);
+	optee->rpmb_intf.notifier_call = optee_rpmb_intf_rdev;
+	rc = optee_notif_init(optee, max_notif_key);
+	if (rc)
+		goto err_common;
+
+	teedev = tee_device_alloc(&optee_rpmi_clnt_desc, &rdev->dev,
+				  optee->pool, optee);
+	if (IS_ERR(teedev)) {
+		rc = PTR_ERR(teedev);
+		goto err_notif;
+	}
+	optee->teedev = teedev;
+
+	teedev = tee_device_alloc(&optee_rpmi_supp_desc, &rdev->dev,
+				  optee->pool, optee);
+	if (IS_ERR(teedev)) {
+		rc = PTR_ERR(teedev);
+		goto err_devices;
+	}
+	optee->supp_teedev = teedev;
+
+	optee_set_dev_group(optee);
+
+	/* Internal RPC allocation must be ready before userspace can enter. */
+	ctx = teedev_open(optee->teedev);
+	if (IS_ERR(ctx)) {
+		rc = PTR_ERR(ctx);
+		goto err_devices;
+	}
+	optee->ctx = ctx;
+
+	rpmi_tee_dev_set_drvdata(rdev, optee);
+
+	if (optee->in_kernel_rpmb_routing)
+		blocking_notifier_chain_register(&optee_rpmb_intf_added,
+						 &optee->rpmb_intf);
+
+	rc = tee_device_register(optee->teedev);
+	if (rc)
+		goto err_initialized;
+
+	rc = tee_device_register(optee->supp_teedev);
+	if (rc)
+		goto err_initialized;
+
+	rc = optee_enumerate_devices(PTA_CMD_GET_DEVICES);
+	if (rc)
+		goto err_initialized;
+
+	dev_info(&rdev->dev, "OP-TEE RPMI %u.%u initialized\n",
+		 optee->revision.os_major, optee->revision.os_minor);
+
+	return 0;
+
+err_initialized:
+	/* The remove path owns and frees the published backend state. */
+	optee_rpmi_remove(rdev);
+
+	return rc;
+
+err_devices:
+	tee_device_unregister(optee->supp_teedev);
+	tee_device_unregister(optee->teedev);
+	optee_shm_arg_cache_uninit(optee);
+err_notif:
+	optee_notif_uninit(optee);
+err_common:
+	optee_supp_uninit(&optee->supp);
+	mutex_destroy(&optee->call_queue.mutex);
+	rpmb_dev_put(optee->rpmb_dev);
+	mutex_destroy(&optee->rpmb_dev_mutex);
+	optee_shm_handle_map_uninit(&optee->rpmi.shm_map);
+err_pool:
+	tee_shm_pool_free(optee->pool);
+err_optee:
+	ida_destroy(&optee->rpmi.nonce_ida);
+	kfree(optee);
+
+	return rc;
+}
+
+static const struct rpmi_tee_device_id optee_rpmi_device_ids[] = {
+	{ OPTEE_RPMI_SERVICE_UUID },
+	{}
+};
+
+static struct rpmi_tee_driver optee_rpmi_driver = {
+	.name = DRIVER_NAME "-rpmi",
+	.probe = optee_rpmi_probe,
+	.remove = optee_rpmi_remove,
+	.id_table = optee_rpmi_device_ids,
+};
+
+int optee_rpmi_abi_register(void)
+{
+	return rpmi_tee_register(&optee_rpmi_driver);
+}
+
+void optee_rpmi_abi_unregister(void)
+{
+	rpmi_tee_unregister(&optee_rpmi_driver);
+}
+
+MODULE_ALIAS("rpmi_tee:486178e0-e7f8-11e3-bc5e-0002a5d5c51b");

-- 
2.34.1

