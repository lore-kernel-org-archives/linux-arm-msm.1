Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565231;
	b=igTNJ2fJHlAWHzJszLI51NSfMmqmgCzya7ZeqBQSdRpE1bQ7LihJ7fgCT4Qf1UWsoNCa
	 PrDqU82EzuwKEez1mEpnv/wWsRtvgnr9WzGCgK+m2G527jYjTTOtKwtp7Ec4NfpzChHLu
	 k0a5t1ZKMEf8D1doJWq3WpVZ3CkSoRm+2gOQtogNiTXdcOp3GeK4Etyys8ltFFc7nVdwg
	 MvgJXXw23dM8hzUzSQMdL36nHfb/hbkHlLliK1DSYsSk2gai0HN8QmbuICz7D4aD7UTGI
	 6w3mKr0vd+bj2RGMasttqnrsXL/J/JaePCEbkd4bl3TZLdpyrt+ZjORtdy5yKLgOa7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D/hUcXy7mz/8ruNJCrFS9KeNwdisy1nQImE0w8zagUg=;
	b=DqTwpmJFuYGX2Hxp+q5k4rbZgrCvN95OdhjT0btPKh4XMwSlA8UChLML6BJU0WaTIflz
	 fq7PNDm9tq0U1bfkV8sKAfdcyW8P/ytrKLKwnZL3yOt9wRNpsczahSGhBubN+SIoIf+XP
	 noeajBQDVU2CXqI52S69AkBgiADVb42DWlP1RFihayUmzjgNacwNpwFZnNaL0EBm43lp2
	 cY8BxjHs0RDhOWgSQirILuLuav1Tlixkk3VetwsC+T0BP/e2kO/rZXKZOtwOL1gSz7UHe
	 4yQHRSz2MJJplq+jTH0Aq+WVRhQzYl8g9eqEjQKqiRwu0MSmaCW9XFLZX4wSptxc2Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwL8TO8o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aq0/tsr2";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6472D606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6472D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwL8TO8o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aq0/tsr2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMb4Jl3275040
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/hUcXy7mz/8ruNJCrFS9KeNwdisy1nQImE0w8zagUg=; b=PwL8TO8ot3tWUnvx
	sNdJRJn3ibfZXBJxMGbGv2hR7ZEZ8JiAQmiVOKJXZ3b0+XjfyCI5NSVz19/HMycA
	16crRKv0PUBqtxSx2I/MIdambV42GW5XX0O2uQ3ve2KdhmHGq79H00dAUNLTRIBA
	o/+IrpR+gq4iaesmmj3+vZTGLRH9ke/Rv+F9PYTHlS6dNwcxSgUjZfeYcoCtdE3M
	rtqsTyRUYW5R1V4vTTnJulgKbI35zaflTfRxTXIEsXQpWDTl+qxMdG/aNtpmHnjb
	shdCFROr3TDvE5r1tgnmiBmn5UqReH5ne4RkqdeNC8P4BWZABdr+S5WMfCdtjN5G
	l5w/mw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnf8uqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:07:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so8047905eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795565229; x=1796170029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/hUcXy7mz/8ruNJCrFS9KeNwdisy1nQImE0w8zagUg=;
        b=aq0/tsr2pgmbQPem9LHoaleCuFtXeLqvm5OLumyqOjMz4LAPU42rtQj+Nlz6K05zWh
         ZnMpIsiySiMT44GJgx/4GrnZ69Pw9t3L2d40w1e+v9RoEU6sVnvoOxZjmMX3Pbr3jgZl
         +MAy3emXjKrDpledr0otH6RBKN5GzHWSxHjLy3Iqn00XI4ddLFElwz9FKrYGEabEomZX
         SAC0vFJCN/F1HuePQpOUqZfV9N0V8xNEzVND2CMDG5tQ2ro/r+oabAOvV1ePuKjY7cbo
         EMsBF10xjf+dc1BkmWGtRpOSd4U32KiMS3OxIn7aVwF56u6xBAzyRDFPQO2PJagA6xsV
         RB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565229; x=1796170029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/hUcXy7mz/8ruNJCrFS9KeNwdisy1nQImE0w8zagUg=;
        b=fQM+ksNbMyBfE+hmItol6krU33XgSQJy3/rB0pCxoO+xZED94pOAIp/+jKrbzhPpTc
         6K1B43sqzzRw46aaApFJxMeQrUaT8nDeuRc/8bHT+5TqCH2JCiIOBfLKrUmAZ+YBdkXS
         QtheTJkzEHqhxTVbZydR+b7WLvAsH8IWVF5d10MiREbEUyPQ+53LrnHqJnwwuAlYmQAm
         GRXycuicJPJNnUO/IAeghnto6Dg3LEVs5limQQLsNKoSuFkUuyxWLk0ZEAifmBBr6B7M
         HXp9ZLzdyDp8vI3+rprbUKNHD+NAwVCs9ufb5ZKtOEnkst6MIPm8hXpNIqCKf07Nmbmw
         B97w==
X-Gm-Message-State: APuU4Z+ocEhI/7BXxsushedh32j9C+TAFrjCsfoKsb+jt8Dpph2pJFW7
	ohWM0d3G1gsHDBwqoOCrFd3Qo1CC2Y+NLhDhCp34T1h+vTqpuVF3pFEsHiCU4w4YM1X+6L3pGE1
	EuvXuCEI+mQhULb7hXpMx8ntnpt2Q/5/yb8lumSJwjNx1cx8x2m875GJ03iOFjzsl33TS
X-Gm-Gg: AZFdTZfrza8UK3VlHDII9TMaZLTtNavQazHPFsFshJpa/e/iruil+aGrsUOyvkfAZvD
	76jsHoOusS7XbBkn3qpru3pLfg+n5TZ/ooS6v81WCW5oSwneiPhOwzvVFHlQFOBZsExb8asuMPP
	05bCQP09MGps++WKyHpB52Su+TfckAdndKwEEsxEO8ijcbhwLZ6FZClKZsNU59jis1Gm1O+0b9T
	KqnJ9lARJehLjez2FWIwooopx+r4FgE+Duzmg5Uh3e67p/R7hxnQpx96etYu5JIo/whHuajs3jH
	08pAz8ZppmThbBxU1xhblV/hKMRWTcaOGnrJUn2DcAE2GDq0ZG+BYzKmbTJjHFRyPEaBIHMVrTU
	LO8LDtOk3SRVbZBdMYEBETzbwhwdXeWe0jIy27xnk1wqEVao4eV77I1AByg==
X-Received: by 2002:a05:693c:88d4:20b0:386:a8de:2bfc with SMTP id 5a478bee46e88-386a8de2f67mr9191495eec.6.1795565229014;
        Tue, 24 Nov 2026 16:07:09 -0800 (PST)
X-Received: by 2002:a05:693c:88d4:20b0:386:a8de:2bfc with SMTP id 5a478bee46e88-386a8de2f67mr9191445eec.6.1795565228315;
        Tue, 24 Nov 2026 16:07:08 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm47494708eec.23.2026.11.24.16.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:07:08 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 05:36:44 +0530
Subject: [PATCH 4/4] misc: fastrpc: expose unsigned PD node for
 compute-capable HPASS
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
Message-Id: <20261125-fastrpc-hpass-support-v1-4-cb1d46b29e3b@oss.qualcomm.com>
References: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
In-Reply-To: <20261125-fastrpc-hpass-support-v1-0-cb1d46b29e3b@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfX8ffqmvOJMjKx
 A2cI0NXQlSViMLjKbx3T9VQhIs84ZwuZl7GUOVCQ35QFfDgAuo99owGHXiPKCgnWVa2Jcg/pXN7
 m4+9LcJm51jLE+9WsG9dDyeLLSiyrJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAwMCBTYWx0ZWRfX3CV+NR055u8H
 280l/IP2h4mr/bz3QTf9nAVFqVbvZQoMGC+KOVnAqFvnu2PCImGig0sMOO41RjLJ9JXUKwQGCgf
 ALGTFMJ8Tav/8gC+wUqFp0+KuF5iDvIaUhUF8Lt7HN2H2RcFteF75NaZPUtu/1Uw2xRHBwy8nHZ
 2ASImZbHHavLbUEz1pqWTnhs6Ql6XDCn9MKFjnop1s95oKn7d7hYKn+50H2ptaJNbwOlqVSM0Wh
 i5sDwAfLAYKTN/cGP7xBnU25cH8hvAZvasvlkpFpqQxTojS91uAqdGJO+oHRHXn2S/S9Se+HDAh
 k2sbk2lyTlUerV/t9Hm3sqsVzNzMIaDnLInZrZ9efmXnIzqvRwS2JNL/lVvpUaWRWF3nXYoArSG
 yY8P4EuDQrj3Lg/Z6GPuT1jCDssPGVtnU4+9vfeusjquQwtwlBw0StFoVY81taOPg0HX+RbLTCq
 cw6bkjlRHxBaUud/w5Q==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b0626ae cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QoXsROH1H4pbOw3JdpEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 3qemaDIM0ou8q01PBjGAzbsaG-OcYQr0
X-Proofpoint-ORIG-GUID: 3qemaDIM0ou8q01PBjGAzbsaG-OcYQr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250000

HPASS (high-performance audio subsystem) is a distinct hardware block
from the LPASS-class ADSP, described in the devicetree with its own
"hpass" label. Depending on the firmware image it loads, an HPASS
domain can run either an audio image or a compute image. When it runs
a compute image it offloads user compute workloads and therefore
needs a non-secure node for unsigned PD offload, in addition to the
secure node; an audio image needs only the secure node.

The image type is reported by the DSP in its capability attributes,
which are now queried at probe time. Use that cached capability: when
an audio-PD domain reports a compute image, register both the secure
and non-secure nodes and enable unsigned PD support. When the
capability query did not complete, retain the existing domain-id based
gating.

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 59ef755feeaf..eb107d0f2bc2 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -88,6 +88,14 @@
 #define FASTRPC_MAX_DSP_ATTRIBUTES (256)
 #define FASTRPC_MAX_DSP_ATTRIBUTES_LEN (sizeof(u32) * FASTRPC_MAX_DSP_ATTRIBUTES)
 
+/* remote_dsp_attributes[] index reporting the DSP's image configuration */
+#define DSP_IMAGE_CONFIG_ATTR_IDX (14)
+
+/* enum dsp_image_config: values reported at DSP_IMAGE_CONFIG_ATTR_IDX */
+#define FASTRPC_DSP_COMPUTE		(1)
+#define FASTRPC_DSP_COMPUTE_LITE	(2)
+#define FASTRPC_DSP_AUDIO		(3)
+
 /* Retrives number of input buffers from the scalars parameter */
 #define REMOTE_SCALARS_INBUFS(sc)	(((sc) >> 16) & 0x0ff)
 
@@ -2713,12 +2721,22 @@ static int fastrpc_register_devices(struct fastrpc_channel_ctx *cctx,
 {
 	struct device *rdev = &rpdev->dev;
 	int err, i;
+	bool compute_lite = false;
+
+	/* An audio-PD domain (e.g. HPASS) running a compute image also
+	 * needs an unsigned PD node, same as CDSP/GDSP.
+	 */
+	if (cctx->valid_attributes &&
+	    cctx->dsp_attributes[DSP_IMAGE_CONFIG_ATTR_IDX] == FASTRPC_DSP_COMPUTE_LITE)
+		compute_lite = true;
 
 	switch (cctx->domain_id) {
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
 	case SDSP_DOMAIN_ID:
 	case HPASS_DOMAIN_ID:
+		if (compute_lite)
+			goto unsigned_capable;
 		cctx->unsigned_support = false;
 		err = fastrpc_device_register(rdev, cctx, cctx->secure, cctx->domain);
 		if (err)
@@ -2726,6 +2744,7 @@ static int fastrpc_register_devices(struct fastrpc_channel_ctx *cctx,
 		break;
 	case CDSP_DOMAIN_ID:
 	case GDSP_DOMAIN_ID:
+unsigned_capable:
 		cctx->unsigned_support = true;
 		err = fastrpc_device_register(rdev, cctx, true, cctx->domain);
 		if (err)

-- 
2.34.1

