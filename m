Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618810;
	b=uWaIzyFMYEtItiXPtmiI7ZyuIPr6MzMhTK4bASCRpptRIqzd6H3AySv5M6+Pur69+Q/d
	 n56XVcGs+MEUIm1P2eothM1xINH7U4S8DTVZfVPk8ftqJF9IziBJTYnxlu7pRBEtAarVt
	 e80RPx71KmFkMKnT6evUTscg9QBo3DKpdgEfpQXbo81ahNHfkSypCvRQbjpXmY/uK8tcs
	 /XWox/XQdrzbHJGqG77OotVdLk7+vwXcAdEV4DjSFl4aG84nX6BF6gDDwvO/EY5Ew9HZo
	 a1VmZO99QTN2t1+vg1YPDP2oAWQO21yZ9C7SeqVGgwMsiqp1q7BmcUdngd9UQ7/9emA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2l7a9FO0SEOjp6R61ar4S2cjWp3e1qo59RxK3Y3Hkz0=;
	b=Uq4pNqbv5DLysTHlPXRYE9az1HTnO3gyIg+k9bbl9yykGOeq+kSsdb0SvQkt1hSTIGYy
	 /ZuoamwCUrKuMouNjp5L4q4BeM+4YuoTr2ozaVuTys+CW3qDFHb3R0f/LxXbCHbDZrlp3
	 PQhKrPqWwyxCNe43olrymkRy+zPboUVbdmvgttkl9SCB2G9MScys8P3P/+8UgyU1embRy
	 2HFSJEb0DxIXkVwAp5uXEyxav4y+BEhtNsQH8I2mUQvNIWMmLUEzYCFlJJZeLlicliJEL
	 Vy8wsTqSkhXbC8rivsK3awDV3By0SiyrKHDYgi8rmT43Q0aEY26b+G0JBVMdYqbXF5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9mSvnqb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJWHrj1a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE03606A33D
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE03606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9mSvnqb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJWHrj1a
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADMbR7v2193593
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2l7a9FO0SEOjp6R61ar4S2cjWp3e1qo59RxK3Y3Hkz0=; b=I9mSvnqbty4lHCSv
	1V595++OyJ0Z7aRn6JLT1RWafjthvzluXt7l7lECWu7HIM+tHjC+r/f8R+Q1C/zU
	ONKicF/m1XRxxqPKr99YWutec/3+Z0cv9qnDTRR3N3newo2P8weSkVIgcbNRwhK3
	ddhEyHjVcHJLiFmxHYk7jA8bby1bC/u0+PRYtZ8FcK5QoCwHjUAA6jTD7yfQlQo6
	YaYZ6YhcpYB3j85AB0kTyxy8INxP730SOy+zt75XRZgVOeE1o/fbp060PO4+BBwV
	TcMvIqREBnAxOmVUeFIOmUWrG9tPym38R2bAP5mdMC93Jb5f+SrOaQAmlqe9mZZV
	0eaZag==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx87ds75w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36efb506f29so2060747eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618808; x=1795223608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2l7a9FO0SEOjp6R61ar4S2cjWp3e1qo59RxK3Y3Hkz0=;
        b=gJWHrj1aWR4K3UaBmcUAajKuAOA7CcUd5hD3gqQEwKtWXqd6qK8Ot6lm1XohogntqZ
         jcIP9GjgD2V6Em99K5mdv0iHfgnCtciABAClQGnIhKqKgxOuO3NnxYsuDIRJD1yV8yZ1
         ym7dwpdwUtpU36YrsUMcVhkTJywE9Rka6FUmEw/CSEMIByPCp1ZuwpHt4Tvr44lMM9be
         FKibJl36IzFu8jFtgEv99zFhPeUssJ82ohF7w8T68ULj61ufRKv+N1MzHRpHfebbrQjc
         ZV3rgGa4MKQgnzmTMRN1zlHOi0iBVWXrcjgNm6uht0bn57Q8L+nnnDrwuY6bmw2DQc7r
         YFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618808; x=1795223608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2l7a9FO0SEOjp6R61ar4S2cjWp3e1qo59RxK3Y3Hkz0=;
        b=hqiqR71cWOG0KYFm/KETbnGrYVj1GHp2q26Fae+PgNBaCJoXAqRvIlJkjsWLUSeN3Z
         HGLQkdmywiAkuKlyaKqkZseCyO5JKUfmq6LyaD9iR+7nOvfvb9TzgqkTgBlOnIJF0Xl4
         qTHQlXn/8NOk6JGi83f3P0cryb6jFfQ4BWCoeFGW2UT3AG4DPtLdFRSOAmMbRdgwbjRz
         SnPFSLDoerpMLGR07VczCHwW1nOrJVyeF7kd0cNImJ1f/LvuyXFXmvKfqBx66NsT1+nL
         TkC2e7T03YH9CvuSBjQSbWK+jZXhaQtq2VkBAEkEnz+TnO6mMBrF5LXYehtfESUpNukk
         lBzg==
X-Gm-Message-State: APuU4Z9kvifno7tfuiFtqqNLbJmlOmI4scjQzoOuPqxGCfutRnXed9M6
	PzOubVYmHM+hngrzYrRmaq/zOx4DRCT/B2s+LDan0uIPSBAi8uq3gSdZYUZntgiBBltjFBub3Ig
	UBViVoMBY8Mw+NKXbdamljl7T/FOtxUXhm7QtbSTJPFpB0XkEvMBojI57lNTbYWdrPwaF
X-Gm-Gg: AYBFou2mJivmzHDF/f98c3Shytl3WrSto/YXw8Yu8f5/7lffHahqL/m1fAGTBuwzALb
	gNGAlnVwMXTjKRKtOJI2sty3YQ4Kv/qrXnBqo/3ph6Z+vkH04+cvWyFojvS1+V8QyZDSnEW/IbK
	FjigoK2gZz23YN+7iTr99wFogliX1ag3SByXPZCe4U+xDvYtaYWmJSJ+aCqg4r6KJxLkoEgINAu
	/JFIGOFQVvEsVQkoGirbW8sUaPURU6T1IMZksEZiNYgtLlE5G6O3YLEHMstIdbjc+L+KGxhy1sa
	xIXbMTZS13P3AYeojNzSW4db+vHOrHhwSD6cTrnuFn3Zr7cb365DcrPSyzHT9YHlow/1BJETW4c
	KYSqILqeEgOMoqcKEVoxCbrLwLdVgFpkdOaOIido/QHDP47ouzi20l/GOAwIVyCdlptbaNrLSs1
	tnuo6XtvHv
X-Received: by 2002:a05:7301:4d10:b0:377:58c0:22a7 with SMTP id 5a478bee46e88-379655d4493mr3179180eec.6.1794618807954;
        Fri, 13 Nov 2026 17:13:27 -0800 (PST)
X-Received: by 2002:a05:7301:4d10:b0:377:58c0:22a7 with SMTP id 5a478bee46e88-379655d4493mr3179154eec.6.1794618807286;
        Fri, 13 Nov 2026 17:13:27 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:27 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 06:43:04 +0530
Subject: [PATCH v3 2/6] dt-bindings: PCI: qcom-ep: Add QCS8300 compatible
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
Message-Id: <20261114-monaco_ep-v3-2-7fe227cdfac0@oss.qualcomm.com>
References: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
In-Reply-To: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=1137;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=s5Y87Am6PDDfuUvVslWLtn/yo2Q7MJcUCKhSdRzo2nI=;
 b=Jk36zBCLoS8UAywAYb2ft0Os2UknwfK1EJL5/lVvHm14BbQvBzWXaiRlezKB7UMZKQQ6d8atA
 ozomEkdv8gGBRRxGGqYHEIiuIdlL9j3swKMKMRm04TlBLJa/Y2CdvER
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX7Hj3uYNFtz9o
 duOYgW4SVqL3XMAUaIhJpONIpzCdhQauyINRXR6gA++aqN9aDdcWdS5DX1eMRjvZpKt85TU5PhU
 +v8p7unEHsTaN8/KG10mL3vN3CxWX0wQ/mpHkORBvaLrrBgBJpujB8QC5wVod7n2Jx4/bZeFLfc
 A6HCZijz2TGCp3fywnfoIG1jAi5oWnjzdBHBZ+qr+IJOPK2hxYqpemaMUftI3J0GkTAh1KMHj8x
 x1K7vPUX4eRxTYusaYQM1ydbkxYo8JN0koZf8VyCHq67TAwB2nSF/3j1WIomKbTgWVAby6gpPcd
 gQC1HxVROs5FbvFtTXJIwQijhiKr3yrfv9UWou/zHZznq92yyZo2o/AxU6ub0+zrfHoBJxz6+XT
 EijjkJIaGdvdkw7nYGVuAoTtcI4QJC/c9zPI5uYflTgn5whjPCFJl1hi2ruBV1n6oVk+u5L0nvD
 Yz2VWNGbwsu/mTqqnzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfXxJ0sN52+kNFb
 jlJZslAoxUDLtMQdJaflpUO3gSkN5UT/CPcdet8J0LqYoFT0TuWflBujzERzEFTGExkqnwsMU/8
 w/4NE0tOqy0IuxE3PLXJ9lCybpnZk/I=
X-Proofpoint-GUID: 5V51iczaD2xK6zM8D3WeQmy2s9vilBC9
X-Authority-Analysis: v=2.4 cv=BusIUoX5 c=1 sm=1 tr=0 ts=6af7b5b8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AUvBg9Asf6StguVY0UIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 5V51iczaD2xK6zM8D3WeQmy2s9vilBC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140004

The QCS8300 PCIe Endpoint controller is compatible with the SA8775P
PCIe Endpoint controller and uses the same programming model. Document
the QCS8300 compatible string and its fallback to the SA8775P
compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index bed9a40b186b..1ed0b97f883c 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -17,6 +17,10 @@ properties:
           - qcom,sar2130p-pcie-ep
           - qcom,sdx55-pcie-ep
           - qcom,sm8450-pcie-ep
+      - items:
+          - enum:
+              - qcom,qcs8300-pcie-ep
+          - const: qcom,sa8775p-pcie-ep
       - items:
           - const: qcom,sdx65-pcie-ep
           - const: qcom,sdx55-pcie-ep

-- 
2.34.1

