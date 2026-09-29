Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F95429CD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651888; cv=none; b=czsMlMGYt5aDM2kVUvSqsrQg8tszTEjl8KZvsHZJugISqJUeefbEzJ+lsfFS7ZfaGrdX/XCZ0E7IFGMcloEp2aExMRH+AAd5W2higbYIsJ//1Fgzzffn5Ol4ASeVJWqSzuxZifAVH75QtxnQM5r1Anm5szis/C8GiHbzbHsYEtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651888; c=relaxed/simple;
	bh=ylXzUuTIz4l9YRe/EquAV7rS8KwuDXeJiQfbzvSBq/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dy0B2XPl5BbJqbflkxtm/PzsHOUgGioAuKOQi+glGsyAr2zoKmM3soIejca7bZ8ap8xagNqTXpk1ZuDzzb2cQQV8Mc8bh/ls/I1CVktj626D/CUoAx2/sRnrxh5qn4h6PqO21xSYH/k8xwOBKOsagAPT3mveqYZ+nMQ9Mg/qpqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sn/nVrmS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCmzLpl4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sn/nVrmS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCmzLpl4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0ikXk2959286
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9ov8W6fE9gqAZsQlIuIktm/LEGd+4kh4Ula1IscwgI=; b=Sn/nVrmSAs/z35+b
	i52DBtVuzdBRekqSzu2e++XRcRt4n246q4TZ5tP2rSTkJL2T15PNxb4LNpzwgePl
	sZaS2i69xNG/uYeBAmsIVofoGMK51wRi4kHGxs/ZSjBXyM8ErgEeDduwHICQ9ofW
	PUDPU8miEzus2tOLgNsWvdGCigN6h1t+BlCnt2EKY9dns2+PX8dO/ARsuidEkAn5
	icIM0pdkearuVJ67tYifd/NlvBAxgdolZNaTuGAm7c/PxDcLzbjlg+w18Yz60yyX
	w3QIcVdRyoGq8H5EKJMv3inlpTVeJ8sooMjM2Wdz6fk9DOLdvaoaIT5BfvbGifSg
	AxS//A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkgnkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:56 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1416f32fe11so1481556c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 20:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651876; x=1791256676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9ov8W6fE9gqAZsQlIuIktm/LEGd+4kh4Ula1IscwgI=;
        b=RCmzLpl4Em+Wa5wntMINPjNjYwvOf0fyEjroMavv46TfHCfT228tiljdpKTjUK7Bgx
         GOsZILhtEuZetF3d07F+TX3reyen1DQ8m+MP4GQqd6JeDmkJvLrWy3YSAq7Zv8Rq2KKq
         hb7V6O//ei8MApvFx6LGlzir0O8d/Y8oB3L8kOb6I2h/PfKtEV76b7xrAHwmfunK5ASk
         sgHp1kd3jbcqC2CnL9FrQ9c0PRlGqVxFeGcJYV/FrD+liOenFHkpV43x5vBLIzK04xKG
         +GSpPr33eiX+Fpe7uRsxdilyeZ7sfErIPeY7TWpnKeAyPQ36WMTl0VKe9P2hEu2UEjKs
         oPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651876; x=1791256676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9ov8W6fE9gqAZsQlIuIktm/LEGd+4kh4Ula1IscwgI=;
        b=edAEer2tNcLIzPaIUCW6+FXTEw/c12a1wuClAtvU7tuWM272ymJNkqX4AG2JqiaDJm
         4SALE1HPXmMwB8BwHeM7a+zvEMaUNLFpotDUxCyepnZwpzhEpkkHkLK7YUdw9/bMskz9
         0uGKc9pjaV4JIZXGjGQZkO6TIfxMGq42J8oaMbDqLidkoYtCRnU5IC/Rp68J/4cEDbBo
         ANAESxLDBcNnlZoRM2M05CdhzqMz7tbgpQ2P0BqSDhELar/sAMstmcOXI1RQuW62nVdl
         z5Z5iUhIt1o56AyqVJ0b33S5K5Jsmqwlqg/ct66yyAAsO4T/nQJSLa4MK0ygmzToRC9E
         IDww==
X-Gm-Message-State: AFuF++mHHbGgNgSD03nZdTJkLI036998WqTV8gvPLKq54IOvRXfUIv7C
	TRr2w/tiXpbF43qQIFV8wWpSotUQUFEGNDJ8Rc7fBUrVssrJCeSAVT9Y0SZ+BKyi+gJ26gIILq1
	FD+N0aM4yS8goVVMuOnFhfGWEDV7S2+O+IQrHJ3Yg1BE8MNSKAgUCBpeUhM/DnlO6vww=
X-Gm-Gg: AYBFou2Gcw57hVIo/fiI6DpmAKc3rkhqs/Hy2VDINBpgTtFMV/jOnFlzDRuAvJEwWy3
	P77wBRwCrEkRxE6me84d9UV+jS+TnmEvNRpFaKLJu5FmFgHx49SFvgfy7H9FNbhCswJ39u45N8o
	F091wlMxiNFjCQwkJAdh7ywrbtd2STDAGLWg48/M7xiIykSdQ1ENlBQKHrk383+kpnyo1ZnvY2P
	Fsd/ZM0i7nocoggRpYS/LXfFXSXkFMdEgO4oRnn+ut+IA0NaJAUgjMQGlRMl7AkcoTa5ibTnNGW
	mg0AJ8Dbhmw/UBw2snHrJ6LlaqDJGAyBl21yIB61gwZi9FB5Rwz121yEpLPLM4/Hnd3Bi+yUD2q
	G6bpa5sB0k99MTuS+40q0t/uig0DhyK7NejFLbsK0yg/976QHpGcppo06OGc=
X-Received: by 2002:a05:7022:28d:10b0:149:8354:ba29 with SMTP id a92af1059eb24-1498354f52bmr5383825c88.8.1790651875694;
        Mon, 28 Sep 2026 20:17:55 -0700 (PDT)
X-Received: by 2002:a05:7022:28d:10b0:149:8354:ba29 with SMTP id a92af1059eb24-1498354f52bmr5383798c88.8.1790651875144;
        Mon, 28 Sep 2026 20:17:55 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:53 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:59 -0700
Subject: [PATCH RFC 08/10] firmware: riscv: rpmi-tee: cache TEE
 capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-8-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfXz8cu/EuEdeS1
 j5gluUY2kcM1mCR7csrp4zgWJ7qh7JIT+ztrLzSHNPnRxaMRscZE4lBrjhC/TBRyhzEZbfV7Omz
 ZR8UCHG7xmqbWPyVJcAKUQ+jahcPEBMU/1dWC18yJweBJKiRmBaS5TNXDetKTMzfhZ3NCoH8egP
 mBWlhxyvOHtjlUPStw5/so0Vx6Md6nTO66Njx6kzOqJwJKOcx4gRhn1YvVWrTlIFin6JVytsD9r
 gTfuJoFxOMQEaeiErsH50pua/GI25XLRk+ly2iUmCQRw5BB18tW7FDKDMTnO7RpyM84VYpi/YU7
 PsJOl7xjp4LvMEbowUSNK+EiEl4jsuLOQdrcHG3mveJLipzvJod1QGdc37QJjxj6PH6OYf8fg7+
 c8tUtv6YjT3WLYkc1WDSeMnk34J6FzjG4ZY2M3XdSfv6/Dgxyw3qZznT35MPK/28xOpnB6epTKd
 ahifGHBatZi/E6K7lFA==
X-Proofpoint-GUID: ztQqaCxN8ukRE1NtctOa4Sk40DXyF9Z7
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb2de4 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ViJ-rRY3MSY-B2NivjAA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: ztQqaCxN8ukRE1NtctOa4Sk40DXyF9Z7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX31/rGzPbrEJm
 +BwHgzQPsRvxHAYCE3iOHIRxcMIlnWxDInnqkWRTNYuMNgoq3GBgnzhD1Y1t1PjK6MpG/yLN4ly
 FnmtKbqcXUG6+vuR4KypSgKVQ7hv1ww=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290012

Query TEE features during discovery and cache memory, multisegment,
and signal-bus capabilities in the transport.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/driver.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
index db3dbab53078..7b06c1f96ba8 100644
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -25,8 +25,16 @@
 #define RPMI_TEE_SRV_PROBE_SYSTEM	0x03
 #define RPMI_TEE_SRV_CALL		0x13
 
+#define RPMI_TEE_FEATURE_MEMORY_LEND		2
+#define RPMI_TEE_FEATURE_MEMORY_SHARE		3
+#define RPMI_TEE_FEATURE_SIGNAL_BUS		4
+#define RPMI_TEE_FEATURE_MULTISEGMENT_OPS	5
 #define RPMI_TEE_FEATURE_SYSINFO_FORMAT	6
 
+#define RPMI_TEE_MEMORY_FEATURE_UNSUPPORTED		0
+#define RPMI_TEE_MEMORY_FEATURE_TEE_ONLY		1
+#define RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED	2
+
 #define RPMI_TEE_SYSTEM_WHOLE		0
 #define RPMI_TEE_SYSTEM_SELF		3
 
@@ -581,6 +589,7 @@ static int rpmi_tee_setup_endpoints(struct rpmi_tee_transport *priv)
 static int rpmi_tee_transport_probe(struct platform_device *pdev)
 {
 	struct rpmi_tee_transport *priv;
+	u32 value;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -604,6 +613,37 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 		goto out_failed;
 	}
 
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_SYSINFO_FORMAT,
+				      &value);
+	if (ret)
+		goto out_failed;
+	if (!(value & RPMI_TEE_SYSINFO_FORMAT_TABLE)) {
+		ret = -EOPNOTSUPP;
+		goto out_failed;
+	}
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MEMORY_LEND,
+				      &value);
+	if (ret)
+		goto out_failed;
+	priv->mem.lend_ok = value == RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MEMORY_SHARE,
+				      &value);
+	if (ret)
+		goto out_failed;
+	priv->mem.share_ok = value == RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MULTISEGMENT_OPS,
+				      &priv->mem.multisegment_max);
+	if (ret)
+		goto out_failed;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_SIGNAL_BUS,
+				      &priv->notif.feature);
+	if (ret)
+		goto out_failed;
+
 	ret = rpmi_tee_setup_endpoints(priv);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret,

-- 
2.34.1

