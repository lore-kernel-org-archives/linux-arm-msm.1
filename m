Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615493;
	b=G5Yt+9zm69gE87RWUeBvY02yaf+a2rejHBpVTmRZi1ELQxRd2ICHjB43XbxB+ymqEQmX
	 cuL3ngRR+W9ySO0gBubZIvCYBP8x8G/hcGY8w6Bd07ePFZXaaOHMo7bRmjUGs69BM5Cch
	 Txi/voAP5dz+sF7k2K2Obqqyf8TqNggsBe5WBUdEKEmgjbg0VGBXP7da9grxhboeM6E8h
	 OVYySxY2rG5REYlSUkq9KnVHVbHfoap2BeQSw5SbNIBl9eTm4H5fW9owAT2+b+QeylQUx
	 ILK1zWSjRyIg+HzIlF5D+lTAcMt7LtRHIIVWx0P0G71grKbxlMoajJ91Rv1f3XIJ/2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
	b=l1in06l8h3oHuBy2R7XtI+tSjZSQF1HVStQ5jUBQGLn7wj/Zm3umGx1g3qxtkvaAvaVl
	 rpI7GOsZD19kwoGwX0010Ow6qvmGZh2MfAq5TxiT+nK4DONO4xaYKzbdu4Jo0wN0xRRaZ
	 EEGwtKQw7U7S6hgZESQnssBW11r2sj2Gt0zC1ApbkW/+tVYL9AyfmgCswb7u8fUZ2iGez
	 dKjYs5kIqOL3pufDDSoZPH4h3oLq5fbM4mdUGa3dECypp7lSEwAL7ulGXiooUPYvmgS6K
	 e3YefGhCsil65mTpVRe8CoejdL5weaxthWuMuTbYf9rLp1oMEhEXsIqt/c5dt7O7uwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5Zhrho4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JI0KRFil;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808BA606A33A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 808BA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5Zhrho4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JI0KRFil
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ANEC1821268
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=D5Zhrho4JNtM5SKc
	9C/2uQubF07fQBuHlnHO0Kl1QTSQsW1MTfZI7+pNeC8HqGDgtcbeyxAO8/pYUdoN
	Z59rwc49qm+eRxCMaZpfJo2zgr+ctuFMeN7R8jeJveOEADtkHc8YHIRoXTprVHt8
	QzHeNk6OfJeAj0S643/7ubSgf+6X0qdyxD2br1Tps5e7om/VsEaYQ6OGsvqRK8u/
	/lJWrrejt1RYd77W5vhj+6QYhAzhCXnvQWU7lYQHQHu5Ihqi/MG7HOwp0T90UaGN
	cf4oE67aT+eUini33hyJ3mFKam22Qp22EQ7eQiZ33jUS1z/Lag6BaKxeQhpkYhtp
	A02tVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h7ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:31:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so500819885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615491; x=1794220291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=JI0KRFils6Xk0EOdtTs4ktLLaXZImqcNKBmau9dqCd6eQRPRENl0PN5ywrE8wnkR0R
         wqfDwX4MLzpsC6kDuTavb5zd5riRdgOpRjSr4NSsgAV9fO0bCW7SiK5too0GhcpuKQMT
         bt694LrXOQSAdiZ5431jVhfPSnA35nLuVhI/E1D552RAO8SIEy6ReW3nBOqwmb28Lvpi
         od3UvVICbwvT/BSxCfQoU4K222gAF2Ml5lEsEwNMyBmx2iNHtqc2fD1EwqfNl28X0PBY
         6glMbu12ftf+q1wMKfIQMpHoLLFpr3sSsEy+2Xlo1v73cWgLcwVUsXysRQunp2qQchVD
         vWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615491; x=1794220291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=Yf5sm+MQZ7RBOxvhtVRx3j+yqmtcdRQAU5555bjgzJbocV7+NSiry1ixHzxh4cOUC2
         7UHtj4x2rmR225UFsotgzcgcF72ekNnbuid57k9b9NhNBseBWdq0RlQMr2guvs55k7xC
         XEO6vTcEA8Q23ozfuA6GyufMAAIhjQyHbMhPRsrmp98BqZTAbFkgaLpt6Z76ONrqW2RF
         QdY6Qh5P8yffY9nMjkTJ0wBRfbiWcjXhuOgmBGEOMXH02BfxLRixn97EVltGJQOTEE0V
         i+alzs4ld0EEY9MiaFDgidIiPZqWlPm+OS+cFla3GCe+mA6OO71HEmohl23fCBnP6E7r
         aEwg==
X-Gm-Message-State: AFq9FYJQ33KaFbxMqkYMFNKWQO7fTughKtAFouhruB7YFhlwnKUF2eM+
	ResWOx6dJezmEIh3jGCST8OnmfTWw+di8vc3D+gUIZk2JngZm9HmRND179cWXfhwRkfk4cfa2Mg
	Ob5OqWhW02XAqNR4XCn88Ltg7ZOH6AOZ//zxPBF+4/dMwVAnVR7ZlCvsznWftQVAzeiBz
X-Gm-Gg: AYBFou3bL9PDTrvilAdA5dKxcprtveYuXnqK+4uiS8KI3LOGBYpE/GBSB68fOInDTHO
	q4JaMo5j3xZbhJq+Ad2scI2+c3P7NZspzlBI1O6NxCOWkZemZ6Ll/3WwyhabN6gGyGQEoZ/FbTg
	aRcxaBENH/qtG/utl8XAELFi1M3ss7ihfDjq3GdJbpihOo5kGNd3Dg69gXevyWfbYIGiwJm6Myr
	clooQHNv/xJV4NHoR0eDyt9mLy+MPmK7UCucwv4/QPCSM82eUk+KkNp4e67VanbDGluw0U4CIU7
	NaztqJh/ycOgm9lPY/lo6k/8xh4F8erJBfPgiOmevYhQ5ZlYCJ78VyCYWrHMkBIOTflUoZkevmv
	ug8XNsSQu0oM/UVC2+eE92bD4g1LSeogr1yQmIl+uWx/bfxOuCseeDKjTQPyAFlqzI/F6DkvzwZ
	MofA==
X-Received: by 2002:a05:620a:31a2:b0:93f:6f8:9d74 with SMTP id af79cd13be357-9442180b5demr1569728185a.77.1793615490736;
        Mon, 02 Nov 2026 02:31:30 -0800 (PST)
X-Received: by 2002:a05:620a:31a2:b0:93f:6f8:9d74 with SMTP id af79cd13be357-9442180b5demr1569724385a.77.1793615490220;
        Mon, 02 Nov 2026 02:31:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c5063e3sm327847885e9.0.2026.11.02.02.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:31:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 11:31:20 +0100
Subject: [PATCH v17 1/2] dt-bindings: phy: document the serdes PHY on
 sa8255p
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
Message-Id: <20261102-sa8255p-eth-phy-v17-1-aa138f2912a0@oss.qualcomm.com>
References: <20261102-sa8255p-eth-phy-v17-0-aa138f2912a0@oss.qualcomm.com>
In-Reply-To: <20261102-sa8255p-eth-phy-v17-0-aa138f2912a0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GZ+RHjr12vHBhn0eHZ4GbLtL3zdbnI1zDJio
 LxHYZvQlqCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhmfgAKCRAFnS7L/zaE
 w35uD/9wcl/m4vYFGffyJsazxW9oQxPMi3BENRaVfoIkO3MtigFHDByww4DdmrtZkop1/RTh/bE
 BItYPSlNGtrT4UH9G7C0WVvR6aCzZrGWQOQPyX2+6R76HoOfIGeFvxpnau+JofUy8DtCDtE+XzB
 VfsT5eFTqdD2Xu4SIJFDc5W+Y4TJhP+HGYGrt22fiGFgzQtadUSHqz32Okio4pdo9zRYhduBZ9y
 7tiN84zdDnpoxoFqtB0mUvfA6E4fAPaGjdEO2CTZbOsS+qQ+2+dCSoOChNe5GESRz9Ze2wdW9To
 RUKhHGioM9QIpbv7dQQ2S9Q/Dxh5ha1/4I7h9yzT/7sbugMAYAYqUTD3LD+uFwo/Cjk2btj1cdB
 ufsqWeLCuV8wMB4xc6lU8/Mn2KE1sCYkB7WbciyXW6yV27EG50OVtAPhu1oENZxecqMPDBiQg4H
 hizZTdI0dIekxgD15e/W8FGPja8fkFeHzT1qaMH6n2i/sMDX2wSvaNREa3ZK596Tg5XLjZawTxa
 Jbjhkl0rxvtsPcHs5htcReS7pQtulZXM+6ieogpCDnNZ/NJbVlWbn4d3X4xHiB5enjrLFi2nD7g
 k3WXFd+KvOEBcmmc8MXAEDvgxHraAvcxj3+RS81K+/0AJ7oX8QR1VopSYRYI0E1c487CJ8zg9pL
 ofK0qxPLaPcC8DQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: t6X-IHOiZSR7vcd_MZMsUD_JHtCP4Jz4
X-Proofpoint-GUID: t6X-IHOiZSR7vcd_MZMsUD_JHtCP4Jz4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX3ISwUSv7wx4R
 864Wzz3Zad70aJV0Txw0aXjE870+MEov5HRPlw4YzYLAl2ERUNCHJX9lFXKKrA54vnLy5eb0Sdu
 Sio7ctAc4UjdkRkm3MtbvyPDPRG8yA4=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae86683 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX4FDr9okgKMRK
 VGNxw84Z/KxZrlIqr/P54SEANQ0HGE+LPPjR/OgFidSd64p/CSq3+kVL2by44cNHwKjX+T8d7xw
 KDfertk/i2VJJxvIyV7HCsjWz4jS28WFw1BS9MMhkhR85UrqDx0jUIfau3U8t1aaYNNXrU6ZdN2
 8P6stdTuhh6lJRn7wJGKM/+0O/QUn8hwCMtX2PyC5YK1+VoDALXJMk2ShE/nqNuwfP4h3ITLS3Y
 V7OUjWgp4Qs1ffzBRLMuJwSNwqDewdcAt0/pVVgRk4g/8sx4i+OspXcckuw6vXdvsTrxuQIBY+4
 R3dgMULBCUmol6qgEBC3Pfa7Ah+PXwGj/3DgdkugzKB2x7u6/qG50v1KbfmJBQlA0aZ/qRH/1CD
 nRTu0mFT3/yF2t5BeQ58e9+lDRSrENXXBfcrvS2MInbjWRIQEeXOuKa4yrNmeHWen2XYof0Zlq4
 MrOIHlQywCrFO6AzouQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9e846e381555514bb32177f884abf0cf2c942948
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@8901000 {
+        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        #phy-cells = <0>;
+        power-domains = <&scmi7_dvfs 0>;
+        power-domain-names = "serdes";
+    };

-- 
2.47.3

