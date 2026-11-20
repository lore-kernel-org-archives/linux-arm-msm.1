Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145307;
	b=C0gmJZx7q9ui5VqptYr2+r3d4k9Q4AoWpTDqHnIBlq7VMeojtNTjyYGIdQA6S9eQdQ4i
	 VJKx2DVnNMAhdqv0QMzDCIvI98VcoNN43r7otEpnZlZMexykgb6w+koMoC7s2fQPggMxs
	 xtIE2ww24bIceaEF42j9yDX3UZh7m502PfRpcdt2flF1RA8BaNBV8E2PNbLXorCrJRSVp
	 AUjbyTsqy9HnxYrAJe+Gur4vuKn9pWB9pwMZe/WURXizPQ5ExpLQXEPzlA3n6s/Ffh1P1
	 HpErVnnHEX/F7NWdU2iEFLRtUFl4sTfx5TJILnBbcqtGEACMzT48mvUDHTwbHJAhnzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
	b=COpRBvR04kbk1twSEw3BZFCM+m+hmmE9s161/GqjH9BiYDE5UwEXjneQUDnelarcDyPl
	 whxwfhaZ/XCCTk/eARl9SIglvQPQYM6/xoypC/m9seiQSCWGlXrD2rHkWALUhi6iQh2OU
	 WUvEIMmjUeDTEd0oLniQFirx16sfe0cUGjPOLbYnEwPPoNGMJ+URuu4UJ9q0jUn8B1SLs
	 O07hsoWKmDcwpAM714Hk4VKbRpaugXoyIXEeryrUCrg5/V+Bp0m7T0QhKng4/KyOkCkeG
	 J19UAREOn/djrrKTYvk7h//948VSjc0/doTDk30/27+N6CyxUPhiU7rg6JP7ayM6rCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KX/6VN4e";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAkUkouq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92793606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92793606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KX/6VN4e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAkUkouq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GOw62608194
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=KX/6VN4e3XhOxj1t
	6Exq2PHkGZ8+mGH5fZ8ShJNY6GeoDY+aDNcg5WEpZ+aP2/p+d2rU/nG0W/j3HP+k
	VPDX96mFhqiGiAXx0IkaoMIfcXDt8wNPuBiLbQN4TXc5mkg7D1jEZ7J9pUJsFQjX
	1zYpOfO/PaMbQ/zKIdUmWMLQo8mdMFj/z/kw292lMSUkZy14xRsPV0uo0nYFuSsi
	/NpyRC3CMfe/UbosFE27RrTq+hlNSXiNb7mitIszSUscrbJzPMugPtLlzqWvTfSu
	kkTcigOgiW/SLtnA3y0pyNRCpKxVYACD8EztE43ltbUyZVOl7e7etCrcTH1bakQZ
	WpBGBA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j22ugu962-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:28:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4092b645aso554251a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 19:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145305; x=1795750105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=cAkUkouqavsIJzvAoXAGiM+Y2yeJcnTZ/aRpCxLfEz6U1NRNrezRcttgzhgKDzPGZ5
         EeInTPqlLaKqmh5QXY2qaSEmIZICUGPkztVWeO05O/C78Cq4ni6RqkUpv3wSk5bFKBnV
         d4X6CxSrxXYMbJV6mPnQECkfKagkVe2NHKZXOkZppHktN9MDST4t1cIVqLDYFKr5MiwZ
         Mpjl4tR3rLLjz8+dRNggBEnxrNW3qEVJEi5+nTOkYez8nEa5v0Ft8Myuxv/pbYoWVcH3
         f0U/16JSuaqOhODK3yWJDF+nBBJ4chdPSdSK71THkg91eGUpyhaqjKFqbogl8t2PpcXa
         UF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145305; x=1795750105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=BA76BXWfg7OES75KqfWHIFsdTfaTXeiQiZYrXfJXHuZHaIdAO70/DdruCcWPbmqpUv
         YNTjEdn3ipu8Ndy7gP6jl8QMnXGTHV+7NjRbAJp/AfdnJ4vcEp24pznSP57MeskJTECd
         NfoiMb8t4k4hUrwbVsRNVuyvN0mpZHaIoKE8yXpT9ii4Xjv/QHDYMwiEBpUGkcPRdYtc
         SiKCEJN97C6OV0eW1hnnjYrgzZ+5YGTq4KAoLWO/HZ+kGOxms/PEnMcT01RU8SqCXnMP
         +OzAGnXEw/XMild3T4mIzEzmfgs1dbcJr/15UbTYT40BNPFBK8O+N0smhf6HqTE2Bz6U
         6xaQ==
X-Forwarded-Encrypted: i=1; AL+hErFfqutHfCngh2iVPfrkarYJsFLSr1c1bXBHL99npRpAKVa5edsAcWfA2nP24bfkjjaU0C69G7x/m+jCP7Eb@vger.kernel.org
X-Gm-Message-State: APuU4Z9kG7YVV75vZj96jZ3LmSEoRF59FinBKxyZRDm+RXW9w/LOUD0R
	NWmzlBCFbu3oAHtViljgi8aDgVsHS3I0PvDSVZP30Q/z27Pm6PgmYNu3OtoRGTwb4jOCXDB1CXl
	KCdxkMoGFUh/1cupG86Zx74ewhFoIXL6R5kKgUhTMumDtkZAEuedqNt1c34lYEsrLsnTW
X-Gm-Gg: AZFdTZcK7KE8sNr99lXAYC5h6lpoikOWShMq9LdlG5tBxiDB09Lb+Jfi/qt2WdHqYyB
	j3dBvmRFMzK00lNN/UF7ajWhQOT0AiNAVMmQPBVhVwosZyRJ/7bQOoTlJRHfE+um3/YdgArTGth
	p3SyG0SNf6F/0E5JT3JaEjG5p/wQjOrtUm8Y6YpKnAdVczu1aLf90qm4oDCHzA+b+fr3nO+79KE
	gIJ2lO9+0zsHPJvFfiuXK7lz+OZtGncDUYBQQzTyKt2lN1w3L+clH1rqTiOMMuWvvteio9Imz8T
	yDOJX2He1rBdI8z4n8/f4p4DREgJRinVyU2uSLhwBNfsw6omj/KdjbqSf2HUVKYM12ggagPyUu6
	KlxgvcVilGQUbWoXok85emHTmY4Q1ZE1DJE5Fk0v70zeUG1Qkv2Y2T5BRJOY/rEx25ioH5uzi4I
	qoT4ZJ2684K/XR+M5FFK2CxNJksOfp5xToV/c=
X-Received: by 2002:a17:90b:2701:b0:3b4:1bf1:9873 with SMTP id 98e67ed59e1d1-3b41c8dd1b8mr1394915a91.19.1795145305152;
        Thu, 19 Nov 2026 19:28:25 -0800 (PST)
X-Received: by 2002:a17:90b:2701:b0:3b4:1bf1:9873 with SMTP id 98e67ed59e1d1-3b41c8dd1b8mr1394878a91.19.1795145304657;
        Thu, 19 Nov 2026 19:28:24 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:24 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:25 +0800
Subject: [PATCH v24 6/8] dt-bindings: arm: add an interrupt property for
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-6-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145263; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=R7aEuV4YZMkjdPvmUa9VoVKl7860e56ZDBGW7Tb8Eh2NeYdpDO9Vcv99ysIIYQzMJRHR/Bfft
 ovKS5/UvrrECKcu0MVYi0aYu3KSV9DDtSTIc7b96Yz+Pp6AXsL37ssK
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: ED0VwF6mX7-ogFhfxQTmerWeowgfmMnu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX2LgC9X8njUHm
 33h6sgjTsfcbQ1ap1jx/lQW3VaM8EGyU3CYzdpM4jgjs169AsB75QBf2gtJLqZwwxF82Rx03ity
 ++WjDoB6JScGEZ/Y/uix+6k84LawpgM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfXwRE3gO/aZ9NU
 i7sb7XVwgrXeHF3AbHYGtUSyxxfdPnI4YQmzSIGbzL9uD6XzUzYqNh0Pmk/xbZcHrsJ2dh40/2s
 Gl1pZwrvUu6VDIxOtPRybFtJdfBm5Q0hkbVNjz6Kj7p546Cs10+8D2/7Vupu3jkNgnAjOZ+iLfr
 rCk4RhCmsHS3cWfzUgkdldQaPTTRq3POUEy4dohPCHFZonn/1975dSBN/EWuGN34nVoZ6RtFrl+
 SE9YOXaLJFXHPWXggJob8RWlXCp16wHwLVUEw3IvRtsRfSvoCfYW1DFHKACH/3+fTI4CgtFkZTw
 752yWcYnizCQOyaQwpVqHPGbFYoOQxET6Jwi+tXba7EcwSeW+IyFcsUY5bjNNvSWLhSNgGt1G6U
 lfBFj1BDp5QoIzJgbZ3m1o3hYxinrh4zvn0IO2jVf8jI1YtslPpjB4r+XZJ5eGA63wsfVaZruzD
 pQCE2Cn+jN0LrgwayHg==
X-Authority-Analysis: v=2.4 cv=YeEodARf c=1 sm=1 tr=0 ts=6affbe59 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: ED0VwF6mX7-ogFhfxQTmerWeowgfmMnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200013

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

