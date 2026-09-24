Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0452946A610
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246444; cv=none; b=iMOjP+U6PXbrcgBlgiPQUfpwlF+jWC+MOp7fFtYIYN4cjy97pyAbLnXSglGm1iEE2DZ+aQ8cFhd+NYcGaM2fvAdhNZLApy1osBywAXiX9o12B4xRN028BrhjjUdsm9voTkfnNGWVzt/a94xbxSorWkzHlYctt+U5GuyOr/GjLmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246444; c=relaxed/simple;
	bh=QqYq4mS2cTiVpxepHjUJZ0e9Z6UKHqHNtGLDWuTNcQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m57E37E7DbB3jxsPOFZlel+AJ7j4ZYOhoGM/cVb+j52wBgNMhUdS3fi6OGyd1su1TBEx0u3gQEYV5wX7J/+3JzeTO+s55DPPiXastIeH4YEZvgZdQA6/saDH0NUMo0JQxgCLkmK6t1uRhbRn0aFzRVYxJox0Cyh+FwbBH7gMHNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkPMMyJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHbsXa8Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkPMMyJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHbsXa8Z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PMPr2919243
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3dNqrZ5j1aJdpahIP13rxuzMwfw2FTeNK+1X0Bclz2k=; b=KkPMMyJ98qvzSNZ+
	ObmEDuSY07TqFezmkGPnep0uk5f3z6YddUTPG8+tLezjDobAVanOkXTwObBlKmqA
	Q9E0/VBLoRx36H6sQ4ct4JRn5wbvZzqNl2l3C6b3pqNdPP/HPYOqcEFZykT7F6Kj
	LwqTst2kr4ljl6C9JxeCpksWb8E7a6VXnDBaxgvEDWfLNiqqXbEgNn7S+HJeHTAv
	4byuVdcB+JjLJMwHIhNViu4ufW9c2KSX+Ka9PZr8/BhUeeU56P9DehdhYoClJuQj
	d/F/nTIivuo1Z0GD2kkjZBCHtGapr3s9KTcRPMFy8tvRDrnuh9aTC6I7FS8X2jvk
	5YxoeA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuj4c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:40:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0050a554so354595085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246437; x=1790851237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dNqrZ5j1aJdpahIP13rxuzMwfw2FTeNK+1X0Bclz2k=;
        b=EHbsXa8ZnrMuSX2LT0UGNWqR73zxrobyHvp5Xp7t6HD7fSB2LEK/Nyjw0P8u5pTVQR
         jRE956ETD5LZY+8OJDhUmF4Q4y6Qq7ocnv8eoaY1a3qn75exrLJLorbbPr5lR0ksg522
         qPwekSGseOHWiskm3MIUpMGhszIV1lElIiiAKUF0ZUptjKS9D1N7YXW43fA5xU2VnHGz
         0hFBkZWgykRUGsIJeFuu2+LSA4P2HUw+R1SbLr+tCb73/pBnNnGajAaCROUH+o5XeW+A
         VNqzh1X+h7p8ox2Jv1orKDVNfC1wjVKg08BeaP9PTBUQdrpeDEi6yYy5vuQyODqY/yOy
         +uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246437; x=1790851237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dNqrZ5j1aJdpahIP13rxuzMwfw2FTeNK+1X0Bclz2k=;
        b=CiSB0ggLcc5iB2PK9RbcsHa8ILGz5R/rGhYG0yEO2EIFeqyleaUYw8co6S/ZlRmAK6
         BahGrNotGm2T4BvklYjbJkEq//NjxF0TLU2sKTPB2Vwkn/D7MUazPj/+LIXjcQORXpw9
         GA5Lxz4k0hwgJFHSQuBR2EGSUTC6BibvkjmR9fBuM9vz/1kYKXaFJGZb5GwZ2aueB7qk
         CdDPBH7jRTQ+X4p1ioua9dtbotNC/UdOkFVs8DfCmRsrSmKG+wKSmhyBN9z6+jkFh42u
         cusDrFQI5r8iIv6rbZU7RhTb1vXRQHoYYv5ktF2yoUvpv3zA9F+ZCuU+itkcbtgpBOjN
         HndQ==
X-Gm-Message-State: AFuF++ndzVMVIXBSb4ksoujVsjbFnRU/28lcUgkn4MCcrkf2GmxmmCO3
	z1qjJkqF7aNQSht0NZCr8wwecSOWkTxKfrOR77h4qAkopNTXD/SNmf+BgFxIn5OjSz0g3dAectS
	W/O84k5RPqi6KEp8tAigIDkXLT/8gbCrBiMDTwYR9DdHtqOkPPSJ0hYq/TujmwZaKIP2B
X-Gm-Gg: AYBFou0uUsVyaL30NfvPphn6dIE6umsVUK5iH5bP/KAoxDqjnyM/z2MiQabn8DcvwK7
	TpYbJxGdvM69t8GBKACaKs7s3m/acdb0DP5c5VHfUgVm7FG7erYsOMICkvVCLtytRFU6eSSsfsk
	458I+6duVlT8T8ooA02ra4qy6mU9gctTu/deGgDqG4kL9c0e6/7JHVrZLnE5kBW+MWdk0kcuxuU
	kpshE0UjHjxYOy/A5WhNt/ixzxlmpKHNtBB3KIIKOWfSAy//1F6U50Rgu/hcp9+1DqWXsuU3RXm
	+04buJOBufg6SVWtloCIWOr8aeD6O/6O4LYGlgEjEYGj45aunmtvc+gdlLnOCSdfRBVL3vI/Jff
	U25N2njKh
X-Received: by 2002:a05:620a:26a1:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-93c362cc649mr211533085a.21.1790246436979;
        Thu, 24 Sep 2026 03:40:36 -0700 (PDT)
X-Received: by 2002:a05:620a:26a1:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-93c362cc649mr211528385a.21.1790246436334;
        Thu, 24 Sep 2026 03:40:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:40:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:26 +0300
Subject: [PATCH v5 10/42] dt-bindings: clock: qcom: sm4450-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-10-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=QqYq4mS2cTiVpxepHjUJZ0e9Z6UKHqHNtGLDWuTNcQ8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3jD3Fy/Ina7D3XBf5LVuV0mmm4CrMILji9R
 C5Oyvseqc6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT94wAKCRAbX0TJAJUV
 Vum4EADMOSTrQQ21FNCKfcVAzmhYRyUtOXOAB0BdABPK+sRSf6+Hm6X30lzo6F5K+Ctpu1sRoIs
 J8ORU8aB2I+DcKkHD4HG2gD6FbWAXCWbu++WLqpdCN4GtsrZiiMpRkHYRgswzKGba9fyMQpmrLa
 ognGl8p6+Q+nScqQMIqYMtX5oklVRVLMm98YfxL/3d93wacgX1S/rZbRyxP7finIYyMckLEH0Th
 Emv03L4f3b0qtQu6Bv4ifbSncDqjzBldOH/rGePwCO9lcI4mqERpXcoM0x93O3LJt5REXPCdgew
 my1v7KPHQjceWFiZUYs8IXaAFH3a3LDMTN5c4sfm67hMGI6ZArhsq2fK7lnjFM+KL1+MLBH6Rf5
 UGdiqMGF+GVF0zmPLkDH0FSmZOhXZnJRqx/O/DutgP3cJSUYFWaqVL7GpJnJi+OB4bExKLe5ZF4
 Orv+ZsDMivjUQQ3GDg9LTDLZxPJdkNsoCusKHn6Owl3W9fgYb+8IobeOkoH7kG8yFizFlmnNB7V
 lrQOFkI5dIg1xOiHQxQ73kwca7WYxm+X3qN4JnTg+4ymqwsyNP1MKUtoy71lFoXyHtnqXwnAdQy
 hvu7uOkMfUnVnoZ/bF3cjhTQdro9w9NeLYAEo1HfnXGS/HEbstbjLX6sr+TYhcIB9Nnf9D+6Ftq
 bHxtNwqnZPvoDvQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX1oLIYKQp9nXz
 59nNIyZzlfG3GvGjGYDLenNQvwX+DeOfVAiE5qCXXRh/b9lfc8IYt9be6EiBg8SI91ApRTG3+1l
 Uv8y9S/HX+1SObIJilTqO3pRmPhmhNQ=
X-Proofpoint-ORIG-GUID: idApMNexNvWBxC3OJESvmxUPdh3ShGFQ
X-Proofpoint-GUID: idApMNexNvWBxC3OJESvmxUPdh3ShGFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX+3C+1IhXHVzD
 1QTN17hMOfUYN70D6DW03+QK9Fk/CDqXHWzeR1DvCeYq+4i2ni3bIGNSynF4rfN85eITD+Rjpiq
 VLriBCrMYO+1XA7525gkJ00wNhk+Kg6MZD7nrVqAN3aXKha7nVAs2b3038AnPIsC8nFdam76TlE
 2th9jnGv48UmF3K4FTooBizhBaGUQC2nxo75bhm20/BCK/oM3u/XpT1ftCM/WPPx9fOKPDrCley
 je2GPlwQG32vVQe/yk4t74Q73SlZ4Lcsyrf5TobyIVkmwbDEZ5kNxiHzspFFeanaph2ued3scoV
 yTX2la9zH6naCXMhzt7BRSBPPuGmaQKpLZ7s4SxjUfyBHTJxLOMy26qtRnSunfLfa+UmxCtcZ9C
 ABoV833Wy51PEzgXdqBLw5wriMqhUxMm2fLQVhFClsa4uaud/EpPC7CZDBhZB3b220JWFwEGfCA
 yHJdxRalffSYICE8dig==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4fe26 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8nTHk6HmgCSZk9Niz5oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GDSCs provided by the SM4450 GCC are supplied by the RPMh CX
power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
may undervolt it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
index 9cfe859bacc9..e143300e7be9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm4450-gcc.yaml
@@ -29,9 +29,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -42,12 +47,14 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm4450-gcc";
       reg = <0x00100000 0x001f4200>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>,
                <&ufs_mem_phy 0>, <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>, <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

