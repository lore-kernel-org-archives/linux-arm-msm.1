Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877348;
	b=g0CMluB+HtTG+CHEW1kPZNjdsRTgf0hbpxorkKjggJVlahNSI4s7KgtVRyOWZdR6KaIq
	 GEeZMhMTFKdczg9z27IOSQBduhIpTEUIjaOMW63W6i+JQu0y6ERksb4thtlG112oilYRv
	 mfQdfMJBa8TDL65EzPw8qiqg96wJZR1jufWqGpX28RlIHxEISLkvvKQQY7dgpRcNjdabn
	 /lxxl9Nis6jVCvt+RbmH4eyXxCeQu5LWE+wK2GKfzZRTNdeP06bBlNd2cjsVdKSsMjzhf
	 cxvtX/FWxgV6uh1agc7OTEWzP3rgjZL0ypeUM4uDLhCr7ZZr0o5YvBvdDwI2aPQvzkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877348;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IYW802/Qaa9XiXUiT0voD+k5ybmaYLNb7JNC06e0GJM=;
	b=UbDauzi+aUKIOGGAVkZ82JQqEnRzPgArt4bT913HyL1/unE/JtncS1PqWG76MQVgFpKi
	 bf2jpPjxAw5MpEjD42rzwXb2ogHJhF/fv4pd4jYtN66+qYdRQLZdyuutO/hP8SoDKhUpi
	 2JAEQc5aCxFOMmRUS6ClHS3v7QdsmIaQ56eIbd9ibIDv+59HoFAHj0NyDSgmkO3HJdLQs
	 vZqDiXrWERl/n2oyW6T72Z5LNCUh43tTa0BDTS1l5gg6FDflecqjCA6nNBic2IRIWbMZ4
	 HWZHiwINbn4r7oO+/jSkhkezNtsa/w/Ey9e4b/5D0rvGk5thk7sZfGOxX0iBRYrDqcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OsqdMDG9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3rduzum;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCBF606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 11:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CCBF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OsqdMDG9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3rduzum
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tcRe1028283
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 11:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYW802/Qaa9XiXUiT0voD+k5ybmaYLNb7JNC06e0GJM=; b=OsqdMDG9Ncb/MD28
	kruC4Km4xpxvkvBaiXxyPVsKmFcD8XWMYmpUGRX2GVDG7Y+BJnoyUuabh0xlINi3
	Wj2t+8pwNLDfZEugZMTGLFslQlwbHPP5F25bjyem/a9+X/2wp6M+NWsoYkx3B7/Y
	DR+25+BO3+T5L/rZt0WN5v3112O8GlG9MT7ZYe4E2VntVsCtKjj6P9BkuZCDbqbU
	Zr0BXBOwjy03vwOXgDJtdT8kq/badq97PdMQRtveSBttivD8PqGEygSBskgdNPok
	g/8u7T9HhNu4GrhfJuTA98wAzfby+b4FIhLoM/ViPo11rSrSVgz1TlgdizNrWEhG
	8iJVCQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq9epr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 11:15:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so2505649eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 03:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877345; x=1794482145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYW802/Qaa9XiXUiT0voD+k5ybmaYLNb7JNC06e0GJM=;
        b=M3rduzumIF53cSk5a0orGx30SJ02stb7WQLCKfrKtIHAcEZBQsmq6ZjaxmBr+Xzmoq
         tUxgwb4l/isEjI+7SKBATpQQpW4sdz8JaYhMCW9GvxbukdpcSgpwagoDqa8C4cPjl19+
         x3gJS+XfaJtcFEvQZWBuHkguQcr0/j2IMlqvTB7gPA3R1m86Qr9ThwWbr46zJZs6TgjD
         cT1gIhsDa4bqTsEodgnQRS+S5F31CqiPPj98qfPaS6EDUI9PdMjFz8oAuHBBJzweHYU6
         rcQeqHbPuyq5zGVp5U2t9dVWhcfrEWI7zZXoscCUu9JVosEYt9JSwA56wYxjdkmAW3Xj
         26/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877345; x=1794482145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYW802/Qaa9XiXUiT0voD+k5ybmaYLNb7JNC06e0GJM=;
        b=WIfF7uJKU/WaGx3y7S2h99UvwKlQXEd3LuLgjgO95dmZqNwOB8RrMrTAz6Jlnq4RyO
         mMZ4rA3hROR3mwgp1CzKw24WPxD5M72SC4pAoo6nV74XJinFIMELx+Q7iGvw2SwHmj8A
         QsmDKvc6Wq2JalI0PDgfDlsR30nX9/j5O5Mn3xtbYya4FGQ8y0pstoCOYj82VHx6CmrB
         ay3nYquTLdBAQjN4Voaf80bBkq0MjsZtzwsM6WNQYReeC8HkEqjP8cGHqas4SbnwVn0N
         vybMeJpG5bp/X/cY7+C9bF2GecdjQNEBsRjNvIu0Gt9lx7ORCnGLKjDmeGxlQjIzEhXX
         DQvg==
X-Forwarded-Encrypted: i=1; AKwUvBw/eDqB42YsrinvAMV9anFYNWCmb3/mMNebDLZzdEXrHENpGxd3MWqXsxVPuQBWpFf5e+Eobmn1d3NdPGsZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9yjT79SgAyomIAc+Kvhhr0w5KekjeR+MHlI7o+G+n0Ef38fMkK
	e1YiU0cjy34u9Xg4VVW/2AkyEwWrNSYFGpe4NNj5KYVINKDlZVwPnOxUkOQab/fVXx+0j+CFJNu
	xkubXpXemP8bnBsQhlrElHRE5AN2bQ9QEAS4iqGTymeCwzlmGhdB51LzzzGBmyC8l+JlC
X-Gm-Gg: AYBFou0rQARhtd6Yy2mSgGN2bPD+lP3NP+nNiYrf2WGq1U28O17Ml+e3ENXxWJfEMXw
	ITiYHl8xp+bTAyGcelhMONdr2UBtGHlpQ/++DmQUhBjeXtYYKgGZDoypwF+i+ma+uILQ0kMNErb
	UOoaherBiAy7GMAmj7dialAQIIpExsFZXXvjhgdfA3ia3SLcEhX40q0nH+VWFb9PHuyopv6iq5u
	iyXcQ354JQvKFVk1KPRAT39zfJ3Kv4DxwQZCVyoy5lgF4Q5iOovc8nrL8W2jfurS6naH4q6dvBc
	t7kgeGaSfcdzEfO+EHU127KePnTtCBwD9DnDm/Jky7z+cv31ERsX/XWLhhh0Io6K3xL8qnVtC6O
	Jy+dOuFI2Bhy6n2AkKLvgs2nj5hklWzE1K1UVrp8lwgg6SD56XXNJ91Ifgy2WjfClwJ0e0fWL7Q
	==
X-Received: by 2002:a05:7301:f82:b0:36d:c3db:9802 with SMTP id 5a478bee46e88-36dc3dbadffmr3983077eec.18.1793877344868;
        Thu, 05 Nov 2026 03:15:44 -0800 (PST)
X-Received: by 2002:a05:7301:f82:b0:36d:c3db:9802 with SMTP id 5a478bee46e88-36dc3dbadffmr3983043eec.18.1793877344250;
        Thu, 05 Nov 2026 03:15:44 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dd7ec8881sm14002125eec.18.2026.11.05.03.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:15:43 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:44:51 +0530
Subject: [PATCH v6 3/7] tee: qcomtee: Allow object invokes from kernel
 clients
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
Message-Id: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-3-c7d68ce05c51@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877323; l=7572;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=F5q5zcQHeA+fmIYDPCCU1wcOsANKXJgvP8zn4B9u0xE=;
 b=td45KK0r80vX9AClxuJcqMaXTRybkP2FbdDt0bQZ7lyuLUzJIyYwbbv+LzgpELEnM8Pi/gWP/
 ZboDbLEspSECMtEnMIPbKQ8DbmCaVOX8XnCUMGULYWvk9h9VzPKHtRH
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: KHDcbgRGnbXM3IQABNk5UpSaAcOx79-d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX2zKw0vv1C9o4
 6wDftFejNuZwdTgZJWPgIIXcqxk4n4eQTpLb29gMwIseIysJ6KdsM+4SqKarPd7MPMCgbIi0LPF
 +iO+No9yqSzr0iHMN+JWlCirtJLRXU4=
X-Proofpoint-ORIG-GUID: KHDcbgRGnbXM3IQABNk5UpSaAcOx79-d
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec6562 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2fm1Try5a8I-Yd-RT8kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX4E75JARJVfH8
 IBM6qGUpTu1bNbctiSkVlzphCpTEkpvncvfU3p9lFIJMr1aSvKwpEnAyTQElratKYE18sA4o4bS
 MEM0MBZNbNVHKpbdCDsV5Xj/TQsavc5PJsWf2rvvwqdTQO+JdZz44wyY+A3QDEIAwlmoF9HMSzU
 eG1/LBoMPcjfxuUFga99GlsDt0m7nUPyxZINeakTDxI5XXyl8xd3Xm4aLjVTKsPsSs012uuwUVe
 ekpf0V6eS6u4zAl2Wa/vXF3pvFh5sA8GxTS48XEXhJR0dxqq5jKO4LcbrQPuA4gRHHw5YuKn6f0
 E2HALhHRek4zE5948g60qRYBLdk3DVTGGjapKu3jIfrlaL/66ctiNqs1mkya1gtazss/b2TCTCx
 XOgGxtLX0y6XmSWe+uycAJO9iRH6zl/Ku1v4FPLax0icqd5JaZfEy3FhEQORQtOCKZYJcTlPWtU
 0M1QuvdN5TDjMLAXykg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050044

From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

QCOMTEE currently treats UBUF parameters as userspace addresses and
applies userspace restrictions when invoking the root object. This is
not suitable for object invocation requests issued by kernel clients.

Use the kernel_ctx flag to distinguish kernel client requests from
userspace requests. For kernel contexts, do not mark UBUF parameters as
user addresses, and allow permitted root-object operations to proceed
without applying the userspace-only checks.

This allows in-kernel users of tee_client_object_invoke_func() to issue
object invocation requests through the qcomtee backend.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd
Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c           | 38 ++++++++++++++++++++++++------------
 drivers/tee/qcomtee/qcomtee_object.h |  5 +++--
 include/linux/tee_drv.h              |  5 ++++-
 3 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 3de54af45719..c97afaa1b4aa 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -193,7 +193,7 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
  * @u: QTEE arguments.
  * @params: TEE parameters.
  * @num_params: number of elements in the parameter array.
- * @ctx: context in which the conversion should happen.
+ * @oic: context to use for the current invocation.
  *
  * It assumes @u has at least @num_params + 1 entries and has been initialized
  * with %QCOMTEE_ARG_TYPE_INV as &struct qcomtee_arg.type.
@@ -202,7 +202,7 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
  */
 static int qcomtee_params_to_args(struct qcomtee_arg *u,
 				  struct tee_param *params, int num_params,
-				  struct tee_context *ctx)
+				  struct qcomtee_object_invoke_ctx *oic)
 {
 	int i;
 
@@ -210,8 +210,14 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
 		switch (params[i].attr) {
 		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
-			u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
-			u[i].b.uaddr = params[i].u.ubuf.uaddr;
+			if (oic->kernel_ctx) {
+				u[i].flags = 0;
+				u[i].b.addr = params[i].u.ubuf.addr;
+			} else {
+				u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
+				u[i].b.uaddr = params[i].u.ubuf.uaddr;
+			}
+
 			u[i].b.size = params[i].u.ubuf.size;
 
 			if (params[i].attr ==
@@ -223,7 +229,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
 			u[i].type = QCOMTEE_ARG_TYPE_IO;
-			if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
+			if (qcomtee_objref_to_arg(&u[i], &params[i], oic->ctx))
 				goto out_failed;
 
 			break;
@@ -260,7 +266,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
  * @params: TEE parameters.
  * @u: QTEE arguments.
  * @num_params: number of elements in the parameter array.
- * @ctx: context in which the conversion should happen.
+ * @oic: context to use for the current invocation.
  *
  * @u should have already been initialized by qcomtee_params_to_args().
  * This also represents the end of a QTEE invocation that started with
@@ -270,7 +276,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
  */
 static int qcomtee_params_from_args(struct tee_param *params,
 				    struct qcomtee_arg *u, int num_params,
-				    struct tee_context *ctx)
+				    struct qcomtee_object_invoke_ctx *oic)
 {
 	int i, np;
 
@@ -288,7 +294,8 @@ static int qcomtee_params_from_args(struct tee_param *params,
 			break;
 		case QCOMTEE_ARG_TYPE_OO:
 			/* TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT */
-			if (qcomtee_objref_from_arg(&params[np], &u[np], ctx))
+			if (qcomtee_objref_from_arg(&params[np], &u[np],
+						    oic->ctx))
 				goto out_failed;
 
 			break;
@@ -304,7 +311,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
 	/* Undo qcomtee_objref_from_arg(). */
 	for (i = 0; i < np; i++) {
 		if (params[i].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
-			qcomtee_context_del_qtee_object(&params[i], ctx);
+			qcomtee_context_del_qtee_object(&params[i], oic->ctx);
 	}
 
 	/* Release any IO and OO objects not processed. */
@@ -357,7 +364,8 @@ static int qcomtee_params_check(struct tee_param *params, int num_params)
 }
 
 /* Check if an operation on ROOT_QCOMTEE_OBJECT from userspace is permitted. */
-static int qcomtee_root_object_check(u32 op, struct tee_param *params,
+static int qcomtee_root_object_check(struct qcomtee_object_invoke_ctx *oic,
+				     u32 op, struct tee_param *params,
 				     int num_params)
 {
 	/* Some privileged operations recognized by QTEE. */
@@ -366,6 +374,9 @@ static int qcomtee_root_object_check(u32 op, struct tee_param *params,
 	    op == QCOMTEE_ROOT_OP_ADCI_SHUTDOWN)
 		return -EINVAL;
 
+	if (oic->kernel_ctx)
+		return 0;
+
 	/*
 	 * QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS is to register with QTEE
 	 * by passing a credential object as input OBJREF. TEE_OBJREF_NULL as a
@@ -430,7 +441,8 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 	/* Get an object to invoke. */
 	if (arg->id == TEE_OBJREF_NULL) {
 		/* Use ROOT if TEE_OBJREF_NULL is invoked. */
-		if (qcomtee_root_object_check(arg->op, params, arg->num_params))
+		if (qcomtee_root_object_check(oic, arg->op, params,
+					      arg->num_params))
 			return -EINVAL;
 
 		object = ROOT_QCOMTEE_OBJECT;
@@ -438,7 +450,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 		return -EINVAL;
 	}
 
-	ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
+	ret = qcomtee_params_to_args(u, params, arg->num_params, oic);
 	if (ret)
 		goto out;
 
@@ -456,7 +468,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 
 	if (!result) {
 		/* Assume service is UNAVAIL if unable to process the result. */
-		if (qcomtee_params_from_args(params, u, arg->num_params, ctx))
+		if (qcomtee_params_from_args(params, u, arg->num_params, oic))
 			result = QCOMTEE_MSG_ERROR_UNAVAIL;
 	} else {
 		/*
diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
index 5f40617361fc..a241ab657318 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -113,8 +113,9 @@ struct qcomtee_buffer {
  * @b: address and size if the type of argument is a buffer.
  * @o: object instance if the type of argument is an object.
  *
- * &qcomtee_arg.flags only accepts %QCOMTEE_ARG_FLAGS_UADDR for now, which
- * states that &qcomtee_arg.b contains a userspace address in uaddr.
+ * If %QCOMTEE_ARG_FLAGS_UADDR is set in &qcomtee_arg.flags then it implies
+ * that &qcomtee_arg.b contains a userspace address in uaddr.
+ * Otherwise, &qcomtee_arg.b contains a kernel address in addr.
  */
 struct qcomtee_arg {
 	enum qcomtee_arg_type type;
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index 369c87ad0205..367208210a32 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -83,7 +83,10 @@ struct tee_param_memref {
 };
 
 struct tee_param_ubuf {
-	void __user *uaddr;
+	union {
+		void *addr;
+		void __user *uaddr;
+	};
 	size_t size;
 };
 

-- 
2.34.1

