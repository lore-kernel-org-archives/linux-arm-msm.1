Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989004;
	b=zsE7DHT9FgotICdKJXCjuqQi9OT0p6P0jaaqkDQDXpHKdyA/tEUCNa+ZDmZ63nuY/nOy
	 6VVarbtSQs0QUlLaVl3y/KALKFL1TllyVhJyMZ4K6xn8cyvvL5TjHIE7dlo+b7Ks7ExSF
	 eOFpORXRAj/Pm201OTlOzMrV0Kgvj5C35h5p2Vr1a+j73PZjVsOi3raRBN/A7fml1HqrK
	 aCwl9W0hBFWE6jJSyoSodE5/tABWiKct0Te0YLeYsUJDtt39E7xnG+lgLeZFnbsac6wfT
	 W90vtHAn/yCI/SugQYOS3qr479zpgt7tGvvdubP6wnqmL/iEFI3TzghZIAen5xGL4Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989004;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
	b=kpRmeLAc/0ovvUP+WulCCJEAlns51b4j/u8UohYCfolREP1SKbqSomBtZZOyI0qEDfpg
	 oL26AOy4y2WkuLaRIlpEN4wh7iQe3J3A8q9fXm+J45ajFhWN+FqtxoTWagkpjLdH8y4x+
	 oejWDUDJz+JO1nNqCVKal9WnHePytEs041NQl9U+JedURa8H+s42rqFVTR6cOpWC1bjqH
	 SSjMzywAhpBgn0FCGslr1WDNETyIrkEboMySfTF8kKIn3Dcdnmu2DhYfyLerfELeZXujj
	 qtOBv++B5ooAeKTfgNKrkL5dcFS+Mo2yClD928oKRkM1Ng3JP/Wvx8Jw4BxCOXbWe0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsEmTXv0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jALUJvUC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076F4606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 076F4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsEmTXv0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jALUJvUC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Urmm2383072
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=SsEmTXv0vWkA11/A
	YWCmipZNB9/Xrnmzmq9H2O04cHvPsf3E+vQGdiWJEhEHsYBBs2phR2eT6DjA65d0
	8C8sO3ogZMwKiXUTuom0WdOdekB+VMxjIULmJz0FeaPU1UYjcsddvN08GRYlqnsc
	XV43Mpl1ED65oEndYU4JAvdYILLbpzNV/d0WWIqxnNaWTjdWZ5sbzV/pXYPbQAnO
	TxQKqZxun0kQRD9SpYIg3bHqwl5RdxRdebG4RxFveHjPpnvQv4CFuqCESimB/p3U
	xaguq6ls0bfydoJ1UejatBWAuNbLWgTbNo8P/65EatZsZHJRZMcfdNl9ISt/NfvR
	ftljAA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasxrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:03:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso635829a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 00:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989002; x=1795593802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=jALUJvUCGK3jCi1Y7GKyWzxM81TVDDGs3rjJiw6kVBvSiHWU/1TsAVz8TW1EvQMfoc
         Ugn88rNxRnoKdttHQoTRb563GNNg5feqgVf2v/CT9HF4z6tS1xzeA9bJ0BSBVtlDblOe
         ExZdrEGSH5UB3rhRQtcy4W89qVd1SnK9FzYEqd+4fkUyFrJNWQFeTicAftP4G1lVH9PG
         gh+zQFf85x5tboOzSFDd8ZrW8W5v12Z2j7U2rUg2JDDmhMLdvb3wwOE60TaukJ/dmVU0
         Md/b2VrE/f5p9atiwsBsa9oDU2TNk0z301HMSY6xmw+Vr7dfi6e+gCuq07jY4bSfANmh
         DrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989002; x=1795593802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=hTS4aw6LPC84LDsgg8d5ttfDB4Q0Ai/7fH9PzRV1++XQKF+7BaEHjRIsZgHWPkutq8
         UPjxaIA+6PFSTwr5wEfrjCZqZn/L6URdqe1WL9Pm9Uk7qd2tCTMoXTND+AhWzkGGosw8
         6rdWwGboFXlWnRrj9OPjMGPnKLthsw6SPo3G/hOTkIw5NwFAh3NtIUhGAuV0pTpNCiLq
         nDe7DszPPGwcg6JnnIreNMvSkxe7h/39Lw/FqxnHhKHCnOol+RkpU2c/m42arZ4m7WpT
         TutJBEeBctG2HgltTz0LyTsaDxnWLeTPyVkr1QH5oNvmLJTqWFDZGRKNwdoUlldZfYWW
         WQHg==
X-Forwarded-Encrypted: i=1; AL+hErGbhGaDdvbsnqzSJgmE9r/LU8KQtbseDMh1pAk42HzNMY9prH9E7mrQOxQ6nL77BCvIJsHFfFGXeFehcDR2@vger.kernel.org
X-Gm-Message-State: APuU4Z+93KcD8gnSer8bxuz3lfrRCYMBLgyNxXWYmaFTf//qiCJe6C9y
	IwKMoNsRojNDs4I0IjN5CW1VvtpYkfKVkFYlxo3192Zm34sGtlZL9aIE0j51wA7/iDvwSv3BIIQ
	GsNe+g1Z1YOFjztHYOILCE5gu+JhCOcRO0+l8xMnEjn47EIoilzm9v0z1EyesrJ8qJKtk
X-Gm-Gg: AZFdTZdk8xC4WYSRQt5xPhYGEO8cDzuTOpHf1jqCIfExh6gsbpUTorE9q2qGVXZLsfw
	T4DKYAJPkbbq30oXa/JbcehNTqgk9TBd5YezZhwFZbpfHMTXLvHXdLo+EsW6ArbAj2lsQz8Gbjg
	z1r3TTBAFG74czMAclnl8DhCq6J5OHvzyJYsQ31NykNDQlyfSUx+BRkYuoqK5D3zzBT8+wxSWRk
	jZ8xGnjPaEGlhkBLhTD5ts4Tn49wwro2wqzr6nfk/ZFnUP8vm3nNsqiepO4Kgunz055UWAdlr8O
	kWUm6tH6ANKFfAFyJgkzk/wj7t2aYv+kc8YFOHh8w89lkJcZXodbcscX8kQ6OYB/SVkvpMeA9hA
	iBIS5w73j/664lAdpNUqdSz0mN7PNEed8iBnnzYf+pvHIKpiDsGEDGS1EG1bUfkz0us9fK3qinN
	flYk8U2M928NJYSscxHEWCBVdzxtT3FyETa2tw
X-Received: by 2002:a17:90b:4a04:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b3d07598damr1763244a91.20.1794989001591;
        Wed, 18 Nov 2026 00:03:21 -0800 (PST)
X-Received: by 2002:a17:90b:4a04:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b3d07598damr1763208a91.20.1794989001103;
        Wed, 18 Nov 2026 00:03:21 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:20 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:27 +0800
Subject: [PATCH v23 6/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
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
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-6-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=0uAuvsb5ehgZ9RURv9BLhMCPJgyhvvKonYmDULG7SkPd4DrZLgbXUrsbMqHtUbbHfKuhil9kp
 819ZRtxxx5ODCvOgG+GvhrxxzOjsPYA3wxE5vyI2KaDMvD3lM4Bx3x8
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd5bca cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: mgPvUZGYhKeCtBvVTBzRxHD0y2NRxsG5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX4pfUN9mEc9k3
 YSkbmPTLrYaIpAxj1Jw7uxqFdtaqL8usdgcx+Rz7Ho4w7udQojeUAacFX3rX7DCbyCn64KXSzZx
 JHq50Pz0TXwvx6QA1LM9aDvQCFFAMtxl4BOa9Suxck6RXWIxVBiN+xBeTqj7ONPIDyuyn6GlpFS
 05i4ta3dCbrFG4E+iRRFxueY9SLBcwcvf5sEPndnssT4+9d5GzyGpZp/lSjE0r24Bw3+wP+YlSM
 qPGJ1mPUGP12h2pz3RXIdIBFPxtWS6RRP7mg/tE/NCF66qi/Jr0De1Fgm/ARAEjchp3YFcAGrMk
 bTsLOEdgnttBXgZ1fxnBEWNkF0CweEezl9WAGJC1tRuKyA0Yy5py4CiRA3rfxZciPSaOYPi4cGB
 mLxpU9jX22MQb0Q504xc8MlumO3pIXD+xkffuOfhrqxALqeTnulx8Fto/4WKnG8SJFpsXOTfyVc
 BbmD4y5YJii7yAWiAyw==
X-Proofpoint-ORIG-GUID: mgPvUZGYhKeCtBvVTBzRxHD0y2NRxsG5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX6kkuWahv4FvH
 5BhUBhxKCUFwOMfEvQ8Ae+osy/zX0PVxdV0XBU2I1AwfDTKIK5qy6qm7daIxTDhNhEbnte6bzfX
 +uYuQkIBp0UL1ZlweKYKteETh3KiTtQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..decb404e2ab1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -49,6 +49,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -70,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -77,6 +84,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1

