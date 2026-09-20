Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48753C81B5
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 03:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789873388; cv=none; b=ZAGS1i5Ziy0KaqlF/tjg5TJTy0mkhf/gLKKT5h1BUmkxykja0kKyJkF8wK/hhIz9ybQVi8DeBu2tJPVWMTOB/l/ETdbtSMaR7wFDZPaORnnDTe4MlJjEVYhw97Cwfo7KJGx37DOA8JhAi7kxkJFeyQ0aiybrpJ28Lkq0KCv7TVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789873388; c=relaxed/simple;
	bh=qDnRlzdNWHxPr2sKfopnsJrYvCLNmhxgOTc/Tb0JA4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0BYtNYJNi7C0EuCY9gsPpVieJAZ7sAqL8WqvyCQItdaj1YKE2L/9n3TIRRB76AbZcd6BjqxaFWbDiwNTSW71ONG/mlmoLnJsJPjXeFI7Xb9GYLRFSFeFMBh0tRSxfv7WObaGOk0iM4rHuuK/fUXDEu7qHnZMNObrEfkDpW4BzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIkpo8uB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LFQeDyRO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIkpo8uB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LFQeDyRO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K1mmiZ432339
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 03:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9pkuXTCqTONwyNBbly+ZbcNChPqxogHh6f3ahubLomo=; b=JIkpo8uBv4hYGLfp
	0w6KluqiwMJ2AaR4EbSOBQ9e9URt5KDbWeJFQ5qVO9VyCuFxirobeZcEo2iUGslD
	Lea/REPdB8VVOH70yzf76U84EjpottNQck/z6Nr3e+HdSpjeEi8c7lmfUXokVfYP
	IfpJDEnTR2peuU3ioG1K2Oo6RqofYq006WgBln+t6tu5wTpdJOnLuOsrBOYaQJcV
	N+08A+gpNdNr4kHCSlbaaxp6q2UwHtcmZweKiWnO78hrVyEEtdIAA3FUOvPkfsZE
	ZSzTa/6udCu3nJgmglp1QuyJsxyV66S1Hy5JZV5TYXAYBCT9UjdaXcaQ4d+uA3Wx
	iMAu8w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs82230-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 03:03:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc435388657so2922641a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 20:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789873383; x=1790478183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pkuXTCqTONwyNBbly+ZbcNChPqxogHh6f3ahubLomo=;
        b=LFQeDyROsS1anNJqliHPmziG6Go8eAboYFieTPPFK8Y1ff2i0ZbG5ulDSaUeePlEKc
         tl+evdVWY2oyO0gQiZdPwXeIGPVu0WzITTyXvvUiCRQpht34sdg8SsoTdyur1Eyzr0Ey
         pOhngNm/aYT1AeNqHKOAUtHwM1tWhU2r73uPEmslLqiHKumEWzHrSYNF8h6nUTJVLmPP
         CbhABNfJn0K/6xYB6Z6gNyJwO3nVfZP6Dl1HjCfP6P9Bh91+CtcGnBO82da6ZaIpKeOQ
         5V9L+MsYEQSVzDtlryack5nCQBYfndjVQ4RvResXUz295+tzwBkkKi16lkTqRKKD4iG4
         z2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789873383; x=1790478183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9pkuXTCqTONwyNBbly+ZbcNChPqxogHh6f3ahubLomo=;
        b=py+EJBRzab937bcShMyhVrqRVRmCAom2devFAnD4dMUYIhx2Wf2N7RPTCLqxCIRAyc
         knzIaDKIDT0251CcSdqi649aDsuRbOOYsUV3F4RA17Cov74s+w10P+PvUgMwqjEVD2n2
         uU0Dc6VZOXurRL+AEKjee1vL9Bespt99JPzhxDfTbU9EmxCvUo5XHEw5d3IP0m8ik0Ql
         ctQN7hTbqOLosPu1+iw9o1wR+/f6Os1SvzcICbHlG17H3Z/X9VnoNu8p4ja18McS/42u
         18Bf9cS7/ig5VFe1scbU3VTlI7uSGVU5n35RskN0n+qOKiU14TvvtUXKwnIAfvfLwGep
         gzTQ==
X-Gm-Message-State: AFuF++kf3elVzbPaK0w40hiCROf8i6SpKJE0e3XAUy5oZIcgY5O+XZaX
	sSFpJXfVEYoUQX+A/nOXzMFJCYZ+2UEmbeScvSqOidgzkRdjpxkCpIb4rb2VIdcedy1qgdcf5Yq
	vZ2lNMO0VvAmvF7jTgCTzAWCCHF34L2xXdoVW2VGiLgSIVzTw5fGwmXR0pyx1EjRKJjeC
X-Gm-Gg: AYBFou2/lJy9szNaG1Nnok6A0/hSx2BCvqhn/XG4iJIgKZCwNhmSGA/j8WVFpRxuGIh
	PS3gkb4fmXhEARfIjwOZ/MRd37ctv1CfTU+yetcJju5QNiNd/nbi+sIZqRIeOg8rteyj1uIkWsi
	LU5jVq9M/kAkpmgqzGC0IrjngMNV356XF62PvyT9qT7XyZBTaVeDVrYt6Em50RrFlFEOz3HuOvJ
	XuTodfA0uM4pvOAY4sSXrK65hbNOwso2uhD0oBGQvkMm7F/juyLoQqemNNob6VpVLNs4lFu7Aj7
	D5JLOpu9P2KRK5VYRMFRJtK4gZTlcu/63Tjrdc8bitKFoYeSmEQlWNQp94/a6nIDnTgSdgV712B
	u/mZh2yzirtksgJaWP1QhvmYRdj36ByOT4+2j
X-Received: by 2002:a17:90b:58ef:b0:39e:6a80:b792 with SMTP id 98e67ed59e1d1-39e6a80b85dmr6363245a91.34.1789873383369;
        Sat, 19 Sep 2026 20:03:03 -0700 (PDT)
X-Received: by 2002:a17:90b:58ef:b0:39e:6a80:b792 with SMTP id 98e67ed59e1d1-39e6a80b85dmr6363219a91.34.1789873382919;
        Sat, 19 Sep 2026 20:03:02 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144e14dd04dsm90012c88.7.2026.09.19.20.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 20:03:02 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 08:32:29 +0530
Subject: [PATCH net-next v2 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-qcom-bam-dmux-vmid-ext-v2-1-ef5ca2178378@oss.qualcomm.com>
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
In-Reply-To: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789873371; l=2898;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=qDnRlzdNWHxPr2sKfopnsJrYvCLNmhxgOTc/Tb0JA4Y=;
 b=UEZWR4Rhjx0gbeBv4u45l3pVhS9jmXY9p+5G3+MqL9Hssqi5XIvmMO0UKF2rA8rGHF3xCNL19
 kMdjiBTbroOCxR2PnGdLFCxhfhxPKP1W9HpMfxhPavfZ0DF9x1VfCX5
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-ORIG-GUID: SLxKGNFrYntfyywHMRJ9-_FNZs5gvNHo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDAzOSBTYWx0ZWRfXzfTH7UUZBMuD
 2gJyNGbh4vav7sXCPf75wFOJFg4K/63NZX/G+o+pNQwDuTJEIByusrCTOwrib9GJcdomZuhXthc
 AXGyM8AAxZuGM2Xp6/PcqSkACV28Fb4=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aaf4ce8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t_mNxi-BVxZHgpyDufwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDAzOSBTYWx0ZWRfX0eAEN9caffXl
 I2HKg3MDkUsdWARvkHkOtYXDAig4VvWcrHPS+pOYtTdYdnZ21fTe33SdTxaf8BnuR6d8f5bMd11
 KpgbVkmdDHO6/rnVUAXQz5RJRntoiH+tfFoyIMMtuCzWscaOckvrsjBHl41NVkRzPiQPTzxWE8J
 C5bMXIOTwGB3Ct1p6KJpSCQMcm9me4oW9SSeUK/B53GU03NbJ5fNuG4fEs67SplwZY9OCjG0qng
 FkX9lFjz1MbLOgkFc+oUmkk+nk1hFoZv6UMNzS2Q+q885UtiH7BCCDOnUa4GeE9ugSRDlWiotfT
 I8DK61eOpeV8qASWMNh4fEtV7oAOe8sSqBCePy5Wth0FaPrRA94B3z28FfCYwAs0y9yO4DCdQmL
 WHrbyS2w6cA/wiAJJ7YmCubtZUh+BHlOh1PKscX/tkU0rczeLRzpbL9T5JIzWU5GuPanFjaS6Dj
 ZWaRZSLGicjRYdI76hg==
X-Proofpoint-GUID: SLxKGNFrYntfyywHMRJ9-_FNZs5gvNHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200039

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
must therefore be constrained to a designated region that can be shared
with the modem.

Add an optional memory-region property to reference a restricted DMA
pool used for BAM-DMUX mappings, and a qcom,vmid property to identify the
remote execution environment that is granted access to the pool through
SCM.

Require memory-region whenever qcom,vmid is specified.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
index 33746c238513d72366bc52359fb10f275475b331..5351269b0ab72ede808ae47b55d57580af209038 100644
--- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
@@ -72,6 +72,24 @@ properties:
       - const: tx
       - const: rx
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a reserved-memory node compatible with restricted-dma-pool.
+      The BAM-DMUX device uses the pool for DMA mappings.
+
+  qcom,vmid:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 1
+    items:
+      minimum: 1
+      maximum: 63
+    description:
+      VMID of the remote execution environment that is granted access to the
+      restricted DMA pool through SCM. The local execution environment is
+      retained automatically and must not be specified.
+
 required:
   - compatible
   - interrupts
@@ -81,12 +99,29 @@ required:
   - dmas
   - dma-names
 
+dependencies:
+  qcom,vmid: [ memory-region ]
+
 additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/firmware/qcom,scm.h>
     #include <dt-bindings/interrupt-controller/irq.h>
 
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        bam_dmux_pool: restricted-dma-pool {
+            compatible = "restricted-dma-pool";
+            size = <0x40000>;
+            alignment = <0x40000>;
+            alloc-ranges = <0x80000000 0x80000000>;
+        };
+    };
+
     mpss: remoteproc {
         bam-dmux {
             compatible = "qcom,bam-dmux";
@@ -100,5 +135,8 @@ examples:
 
             dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
             dma-names = "tx", "rx";
+
+            memory-region = <&bam_dmux_pool>;
+            qcom,vmid = <QCOM_SCM_VMID_NAV>;
         };
     };

-- 
2.34.1

