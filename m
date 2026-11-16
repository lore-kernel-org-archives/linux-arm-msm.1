Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846186;
	b=EH2iQie+hTgqlyvyw9eb1L01srPWG/4WnyGZmxtYxHuoRGK3S7Zw+DLchm693sT1GbHZ
	 COkeQjgjfmkhEtitwUgWO41EJY7CKYwFUrxOZvmWlCIboAI7w6gME+NTos1Fvgy53iB3s
	 ILN6UnGMWgJFVJk77uM6YxobjDXpCkDwSqP79/7JYc8kCL+1pjoJdohEKumYuvBRCw5Tp
	 WNy3GRHxYT9BE4vnwpi2QWuGSJ1FpOJwt287SSIsoScHbGOxxp0neLcY5kOURFcinbsle
	 1SpuzawVY+YEBcN2Fwh4ln+Pt0rqGW6NvReE3j/yx1lTFdg2+4yYDiMcgALdHC3xUkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
	b=m4PziCNeTx7w2Jo9Xh5kuQ2BDSaeiH/KwQrj4kNLmqdpTKumfLx5p9qqY6sVyWdgLzvN
	 UGvOJJYRDfAkDjxyrrPBiRwtS7ZMJ+V2DVorBiHckPPnwH6NuX7uThpqdQzVmx6HDeXuq
	 TBGjLfjGagGRGN7RciwBNvD8bGmNkYQqsQ8bX1Nt1IgOEELcT34hq7knM2K9xCq4nV515
	 0utAg+llTy/JzJBb6TdNP0ufouLjBHEngUuZZxQxT+tosAXB/RZTzPKcAeFo82UvGn3um
	 nOeEbx0RWM/oxBoQjdxxVQxqO39lnRRwDT7jIZhxJ0F0GqBMoToKXke149JWtn/ArEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmVTds2r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkMT9f5V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE12F606A32F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE12F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmVTds2r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkMT9f5V
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIYQf453203
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BZVUNIWMPuP
	DdEXUHU9zeRI/d11l8gukZD6tZvmKObo=; b=mmVTds2r5rkgKTwEnGI5LCpN5b2
	/tLsDWF6guoPca0gYr5QEN4hCVmdEc+pATQVG1P751FBpszfBZsJ4Wybc7N//Cyq
	43ND00eDQ58lfF/yy5tgXS62HcNfy8tR1JIkrA+VHr+eEd8xANlKBfWkJcFZ5j4H
	zeGe2aop2OFMX+rcBxESBd3QXyhNOIS0pEoUptM9zXiDPChmK7gDObRqHAG8TYph
	4v9/DfUuuNaEQj3EDbVGsS9aHrWhzrkEJn2bcONk/h+wY9NimNbIfnqZK+vAT6+7
	R4/5QQkkWc8KSYkzM2upY1JO0UgXH0Hz7eOs39KTTK7pf/GC77z+GqgB9bQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y0m56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:23:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37158b53d06so2754884eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 08:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846184; x=1795450984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=DkMT9f5VmNHjHlXwYqRyUbNqwzIvW7+VYHRCXlY1t1Egzbd/VLPPZoKi2T9GYAyUh7
         DedFpAjngg+J8FbIhCk0XY6cWv2FkwaJYUTKAYkX9TEDewgvhNSLok2By+m6IzvmWcIh
         7vZeBn6LdmAjRp5Mi8KIdAqxpQWht1EBLHl/zUrFuTSJJdxJOuY9VYDizjIJx2qvUbJs
         jWuUOQYwfbKh0+Yxco6PgdX0E6/SAQCvn/++8RCgAnWKKToz3CPs7xwI+lpBKmHhH6mg
         +tgVkA3LQ9t7gvtJwER0bO/Nx11e0yh0ib24/qgB11ZH3Ey/5JbzHpUQKyf1j577Z1D7
         NGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846184; x=1795450984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=KzCJ/j1Qe4UHAt4PnKeZMv5zr6PRhMB75lb5ZoK36C4VT4u2AqeVSL+V/zuIwgaRqa
         b0DjFGCeVFbCorfsgS2OsbRkOTjGUyTwhP0Dd6PzW9hoIRXRnPYcL5LFAoU2p3sA7P4x
         XSd0HeLCadjt3GXDGuoKnTxkw80bYOUXVJETiSoTBpdu4lefTN10MukjT/T5tme5NvI/
         xGX8oQJi3AxJKAYlb+3knUaCvfDmr0UtLUKTy1pMA1swZeigdjxMcse68OJGmZLrgF3c
         PJcJNQ3OYIM+i0RqLh1CiuzA2CAutHB9vAm0XvkPbU7GfXf3bm925XmNHLmxgg9ZY3vt
         Xotg==
X-Forwarded-Encrypted: i=1; AL+hErFQiIP7idV7I+r5Kh+08wRM2nPCKe+wgBdCB+eTC/FpPueQ77DmLTw8Gwe/59FiaNeIQISE5TCebzKUNDK6@vger.kernel.org
X-Gm-Message-State: APuU4Z+VKLZcsmdGb4qjPgJNWF6bMY0UgGBdWcwdQaxntTnwawm3LtMI
	qoVOPh7Y2bpSLpWSRJR53U+XpsnLn8RKgKedP7Y+HLnF9EzVbTAliuRcHMCHmPZzwjF15uIYHOp
	jtEL55rvSL+03HAELKfP6/OHRKnQPnDRYV2+mNjcROIwp1s/k8e/uCEqpJ7RYr6x4dPoH
X-Gm-Gg: AYBFou106LqRYr6nL0LUOLk/3fWGBDndxkWSw+ImLBUuc8GGFXW84ZhXHZFwYxpn8WQ
	h5MNTLAzKHV6tTpi5oGGpkNbCo47VZxZt6Z2E0cqBJwNP2GiDVCLEtgWINNVd3HhVlNe1umi6f/
	2HWp7c7C5tnR0DNarobZ0/rFAE0jtarn46LE7NHkdIkYC1jWZwwT1N2XlwLOgD8QhyGVoEzZ5hE
	FPif6opPdvHWV8E405ojxao6A9i+cIFHYGDGKFnEUMgLj3pzIN4Rnh8lv5poA+gmq8V9K0B5sxG
	avNAi8TOyOqCXkQm+OTMGx/oyINNy4EoJccQYvhxf7ghMN/am/RaT1NI0uLmhf/tuwaoPoO8R/s
	TyjyvoWDtNoEwBy7aNmZTra8/TDZkvLt3MKQYwCp7laoo3A4admhlVJeFM5GErTDqkOO2RtqY42
	OX
X-Received: by 2002:a05:7022:f20f:b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b5030b1230mr11218989c88.18.1794846184083;
        Mon, 16 Nov 2026 08:23:04 -0800 (PST)
X-Received: by 2002:a05:7022:f20f:b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b5030b1230mr11218947c88.18.1794846183414;
        Mon, 16 Nov 2026 08:23:03 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:23:03 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v3 6/9] net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:45 +0530
Message-ID: <20261116162148.2864501-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VHOUdSaQ-g1KaAoQ-8yqqpxIpLFRNY18
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afb2de8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=P8P2WCEqvqb6tQ3B-mUA:9 a=bBxd6f-gb0O0v-kibOvt:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: VHOUdSaQ-g1KaAoQ-8yqqpxIpLFRNY18
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX8u/kIRsgi0zn
 9KfCOjV6aUum7qXMSyQdXgZpGx2PrJ41zz4ngXGC3vaJmWsshYkUXnaSNOQE8+duxqu5qBZ9rEx
 3EJ9KvAdoWSNxrJ3FVm53qpaNuQpQXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXwq1DfrYXCiCl
 MnZieqJGD2+otUuqScpeaPVqOPUV2naPsOycLcgrlle5c2jInwX/0ILs/8LAUP2hMTwzdgrPatB
 XAoi2TzaA/8AohFG2mzCEGAGeHm1o22GuEYc6WYBR8DeN6eErmBGJhGZOn1cbHuytw5DwX5qSh8
 ma51tn+19crsKOFmYdqvoQF0KK78mH6gWnUDeehsHdSfNEO3JjUtrkUzVj0B6N6Tpt0Fk8RkOQW
 Huii8DEQyUM2pE7g6BD0fZoXv2VsEwCgk489cTB9+iTi7ZBtAXG/lvnPjrI/VocnQGGszWOan9u
 BTV15o/iFFB7yFtGr3iiunj14Z3igo28a89LTP34cbIgRZu4ubi0rWAGc+7PIsxn05A4bxRa/2b
 tk4sfy5Rbn/OIQ3tr7Tt1kI+4W+s70Jwz5EGk7lHv9vrc2FTpJlCdz4SGNlA+4GebgY90v78gkp
 KiWzShVf04cq47+Q1nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160064

ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
qcom_pas_context_init() and qcom_mdt_pas_load() and
qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 14ac2d2faf7c..0a37741c2285 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
 
 static int ipa_firmware_load(struct device *dev)
 {
+	struct qcom_pas_context ctx;
 	const struct firmware *fw;
 	struct resource res;
 	phys_addr_t phys;
 	const char *path;
-	ssize_t size;
-	void *virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
 	}
 
 	phys = res.start;
-	size = (size_t)resource_size(&res);
-	virt = memremap(phys, size, MEMREMAP_WC);
-	if (!virt) {
-		dev_err(dev, "unable to remap firmware memory\n");
-		ret = -ENOMEM;
-		goto out_release_firmware;
-	}
+	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
 
-	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
+	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
 	if (ret) {
 		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
-	} else {
-		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
-		if (ret)
-			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+		goto out_release_firmware;
 	}
 
-	memunmap(virt);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
+	if (ret)
+		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+
 out_release_firmware:
 	release_firmware(fw);
 
-- 
2.55.0

