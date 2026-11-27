Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773412;
	b=EN233yvjF/pV+pbpAvfcxiOUSnKYZVmtTkv6YrJwnvZAScwpWzKMa2BLn83bcPDlqf1r
	 /8bNdttinyJUAUVS2z0ovUu9iYKT+AROCtZFOJgWbOxw1Xkqvc6JoyctI3Rr6dkLVeo9U
	 ZhPr8JqB5O6ONvccuE97V72suRnlr0tvZStToJ3DdtO5JRUs8nW1W+U9wAwBf614m2pVE
	 XblPIBgW2X1kc8OxqyKfYqhOP9Eu1pr9dC2cA6udvFxCw0/4QVhZ2wWed0iZfkuzU758y
	 UkhaAy8bCuzbvigJ5tgWd8zCrXLdY1Am0rVDG3nUBJlo/YEMh5ImYfQ1fT8lPI+Z/Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GXhjSwlMbfYmQmqfRd6K0jcibQ1hxaw5IB17GQFmx74=;
	b=HYyU3uzodpZFAv1qUX1cBIjhyMsFCXx6yVTHKdVptuh/bzotPkxf0snXW0JkVvD6MYx4
	 RFFIi1tmZT1GW61+jPhQ9KWwS1I7z76IcdwEHoBxegALchHm3QY6QIZvqd3fR6GRbwn7K
	 KNNkuf+bn+j+qB82n//grkUQOQGTZanGlU3b8m5cm3J4WgcJNJ2BWJq2S7e67ZKv3cuX2
	 6Xxyp9TVhUHDiFcgzgY3JODHMEJ0ia4ZHqk62hylzfOft/4NcAJ0QYiY0dTRfMYdHoc5k
	 NaoppAU7UWwNWJSznKXnFPSi35HpfXk1TgRWlY6UVlbGPuadatuPDSpUCoXmFZq8CvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RsYgqMGl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EJ6Mtfou;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B224606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B224606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RsYgqMGl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EJ6Mtfou
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gi5E2421530
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXhjSwlMbfYmQmqfRd6K0jcibQ1hxaw5IB17GQFmx74=; b=RsYgqMGl8jYjCeZR
	7CdcQqqTxD3/95NiHJm5rjlKXG0b/pjZm1IbqhsFG1L6cb+wuoqJFH3xASMJLN1e
	MO6O5uy0cIuEEr+8U0SMk4iSwcsHbk74qzjKkr6H/lXWzVzGRszf3WojwOYJoxd8
	bz6MXKxFqpLTXA4sUuNvfzrizLxjjG9bCcjne80tdfSrM2ZqmGG5RLHkZpSaYEA5
	3glTI3ESXGCpnvgDzqYYRiJmkmpqH/p+/pxn3u4plpVeF7jbLcHWTlwN5ISpQnU6
	rfp5ymPoK6yqMHmeBKoK0iuuNLMFRiR2iqJr5O/ngv/iMJx+75pWqktf6pxXPtA8
	ynIJtg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf92xna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:56:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed05b3eaecso70913355ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795773411; x=1796378211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXhjSwlMbfYmQmqfRd6K0jcibQ1hxaw5IB17GQFmx74=;
        b=EJ6Mtfou8ACYcLv5iqtraWt5DaLwPmmNPhT3trU59ikRT7dvQKwe0HRtovFXu9rqpb
         G2kUdS9nzu7IsTbt11pi7aNH6T/ipsVr3Dy2I84pbxEM19iKaoyAWasw0VxLHVncl402
         lbNKcQwd0EsIRxWOuDCf+3kI0VNH0gt/cvdW5fwvK1YlzfyyK+/xPCGmUpA++mq7NSyp
         9/hujtJ+nBVUirIxTkXJqk3Nh6PvxbXrYDZLcfJy76hgekzxB0MHsm+12xa15ZPaZ03o
         Fd5fLJctqwsJwkLLrJ5mgSVT0mRwEFj1Ii45f6IqhDuHelqHekV9kp/tSR5xmtaILREk
         QMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773411; x=1796378211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXhjSwlMbfYmQmqfRd6K0jcibQ1hxaw5IB17GQFmx74=;
        b=ocWJlYw9aWqpdFuCkCfO8ALGqFlWChwrSd+0vp8fOGeK53kPxrTGL+J6i8yjDQLvyT
         gkq5hFMLBDwA95mZhas+DExc/KHLIXvMeybBrJ591iVYbwxi0LFqKP3DVP/Ts8VWlFp6
         x/j+GfAR9GhVXJnC3m6y+6Yq/yQ8GQ0cHshoz5h3T7084RUnsoJZAWjCG8QKXNU9hd/I
         ySYst3wyjlkGiH9OAlIvvPjEF5eIopdbmg9cHgEOg6J2ACvEreV8GJZ3ppdLfV/MqV8l
         ekzMgu7H2lhcDE7eN/Vj1r4Z8KLphKxgSaZMniJXp88paw3jCZH8bsMsg7NecBB6zb1A
         RI+Q==
X-Gm-Message-State: APuU4Z/+QzRyHBOI2m+kBAK9/Jfg/3SPwPuO3o1Q22RqIUIGsZvJaDXK
	zvcMTXj6gK0SMatUZ9+f3GSddgPduyyV8nn5myXaemuBXtcjLUeMul15El08W/L35Jrjse/dwsz
	Ez8EeUhSexNLfG5BdLpPULMRQyhSoGI0p27zbpKLMUYzljRgQVfnwLlcGzNDUdqRdKDs0
X-Gm-Gg: AZFdTZcN2eojyC12bOwzLtNrkA6yxIb7o0o4ewNss1cr9xKQIzD27uUWVK/KBkYrxbI
	yKnI6nKO5N6/IHo5pCV0BZlRqe4ZoW1B7RvyIiZvl4KvR+O904VJpjCPQRVra7MD3eeQIZnmidP
	BsWZ+N8tsJfidAmHAzww4TRJvlvk1QCsxp7NOq2kVLZjDjbJ0bdNJrqFAZ4ilhr/4bx/Prd2+6K
	9dDslEdzYlbkdko8ytfzuljUMb9/CAwoP8xWBr0UDzfR59K7t2IuaBvjXOhoU0wq8ndzNLPoHga
	dDcvV8uzw8veimrewN3DGTo6nCDNtOfrR9TwdRsYvZpXY6DUT5GbP3jicb9EAbq6o9NS7N6sFiv
	ziBWQXieWPUIQ9FaR2sFRBhQ6Dh92dw43OfSUgbJDjjYuV1OYJN2ix0n/To8=
X-Received: by 2002:a17:902:ea01:b0:2ef:da23:7aa1 with SMTP id d9443c01a7336-2f03f1c02eamr228710105ad.40.1795773410720;
        Fri, 27 Nov 2026 01:56:50 -0800 (PST)
X-Received: by 2002:a17:902:ea01:b0:2ef:da23:7aa1 with SMTP id d9443c01a7336-2f03f1c02eamr228709795ad.40.1795773410246;
        Fri, 27 Nov 2026 01:56:50 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm118132255ad.75.2026.11.27.01.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:56:49 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:26:39 +0530
Subject: [PATCH 2/2] misc: fastrpc: expose unsigned PD node for
 compute-capable ADSP
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
Message-Id: <20261127-master-v1-2-f998ec22497b@oss.qualcomm.com>
References: <20261127-master-v1-0-f998ec22497b@oss.qualcomm.com>
In-Reply-To: <20261127-master-v1-0-f998ec22497b@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_bkumar@quicinc.com, quic_chennak@quicinc.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: hUtW7__0qnInVzJrhk_RR-j_ENFWkUa5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfXzKC2dYNTNziU
 X6FirdDVgMvPmmPv7cjCxGcf5GiyqaWHsQ4REqiW5WGMaO8PifLotKNTKyfOCNPo5SSERNnyQvx
 9e6FeYIbombKWDVNQaM1zIxXA70yPfJMf62X7kmNnpaWnF14UzSUbxmLslIT3kCyPCCBE9bnGxB
 JphdfKuMHS7g1sTLF6r4HvuA/NcQ620t05t8B3xBfv+1ZyS8J0jzllYR5KATPTEJ2KIf5rF6K5B
 oOcp5Iql8RNibyZvdGy//8qS+OL95gn0TP0WLuBVyR9/XJYzvWnNJ+oP9wHpNvw6Q6Em2nhjIqM
 tmW5yOrZrrJIMsx38MCeaKb7Kp1T50wAEArZRTXiZj7jxUkgUSaT5wVYGeNSnPWBnPd6bjvGhMb
 ypC9a+tOafJ3X2oAkuQoLh7azYrMuHU4lCVSE3wTZ0QXVaSbarCwVmBxPhC38KaiMA/AmRn8t4T
 vp8y1bs05FIdQaNZG/g==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b0953e3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=D5FXuUI4r6NMu6bcXxIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX4YiLJuPdcCtz
 F9aUVQAWMgWzAxZNZ4PsJZC7Kj9LDyfvkVM7BHSNuo2rDSxOr1SVN5zHJvKucVDAcn+5CPVP2Kf
 tTDe552a7dIHR4zbCZ5aNNqXHJ202Wg=
X-Proofpoint-GUID: hUtW7__0qnInVzJrhk_RR-j_ENFWkUa5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270039

ADSP running a compute-capable firmware image needs an additional
unsigned PD device node, same as CDSP/GDSP, instead of only the
signed node it gets today. The probe-time capability query now
caches the DSP's attributes before device nodes are registered, so
fastrpc_register_devices() can check DSP_IMAGE_CONFIG_ATTR_IDX and
fall through to the CDSP/GDSP unsigned+signed registration path when
the queried ADSP reports FASTRPC_DSP_COMPUTE_LITE.

Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 48ded6080ddd..28d29c768aad 100644
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
 
@@ -2621,8 +2629,17 @@ static int fastrpc_register_devices(struct fastrpc_channel_ctx *cctx,
 				    struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
+	bool compute_capable = false;
 	int err, i;
 
+	/*
+	 * ADSP running a compute-capable firmware image also needs an
+	 * unsigned PD node, same as CDSP/GDSP.
+	 */
+	if (cctx->domain_id == ADSP_DOMAIN_ID && cctx->valid_attributes &&
+	    cctx->dsp_attributes[DSP_IMAGE_CONFIG_ATTR_IDX] == FASTRPC_DSP_COMPUTE_LITE)
+		compute_capable = true;
+
 	/*
 	 * Duplicate the ADSP sessions before any device node is registered
 	 * below: misc_register() lets userspace open() and allocate a
@@ -2647,6 +2664,9 @@ static int fastrpc_register_devices(struct fastrpc_channel_ctx *cctx,
 
 	switch (cctx->domain_id) {
 	case ADSP_DOMAIN_ID:
+		if (compute_capable)
+			goto unsigned_capable;
+		fallthrough;
 	case MDSP_DOMAIN_ID:
 	case SDSP_DOMAIN_ID:
 		/* Unsigned PD offloading is only supported on CDSP and GDSP */
@@ -2657,6 +2677,7 @@ static int fastrpc_register_devices(struct fastrpc_channel_ctx *cctx,
 		break;
 	case CDSP_DOMAIN_ID:
 	case GDSP_DOMAIN_ID:
+unsigned_capable:
 		cctx->unsigned_support = true;
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, cctx, true, cctx->domain);

-- 
2.34.1

