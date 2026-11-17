Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906401;
	b=mcLQ1OF1H/Qzh9EG+D1+PTrUO06CJNaVBvFf5OnX++J7APDUsdzFdrpgLWEcivT+LSvr
	 tGSzsgzXRkjkfaaDMy8nkEunYoX7apDqL98/YqIWDb0MHL/doh8J4BMkdqQNy9c80AjJO
	 LZTczr1ft3ZI7uaCLZo//ONKgRgJD1v0H/jwqsEWa7dBop89IbmOfM32wJmjFLknhoYvd
	 8Ks5DYwBmdixRdqXmRH8YhM1XKXG6jgVLMvfP+qhoniNq97zGw8O5D8fKGE1/tV9foPBT
	 E2zoxlgIvEehR627KKNA21Ykb9lNFOX+74ZaDmhSoAtDKFyQ96Mh1gld5haqhQk2YrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906401;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NpeH6W2mGQSO9hdnpb+Cu3cWV0Cz0E/Y5lbQJMm9bL8=;
	b=WsQxUuEEOQORLBPqY4X9oYFI+S6VIGtECetqjo7GxssHsM1T9g3zEr5uqCB9ksQyw4HB
	 B0iOkfrXiBDEtIm+Zn0b9v7OUhsQBZQHlEgItD1pVV3Ag7DCkNjC+xvC/y7VEQswXvog+
	 nRpowSMV1strxZLZkcqB3JWaogCSkWH50T2sDI76eFDIHl6GiGfJd9lGvRI+SfDC99pUV
	 mSErzn9fotEK/Ps4ZUAzzeKrWImAjo1mUwFv+rgE3UMH5DzzNbK/zUpsd1Ctn+ilTKYNh
	 0gDqFSvyXtXTF1MxxR+F39lKqpC9W2S3dX/LV4JvDKviqe/WNlv+V3F3emh/QAk/YKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=el6x6M8t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bifP/rvE";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730F0606A8A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 730F0606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=el6x6M8t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bifP/rvE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH53Gjx3458198
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NpeH6W2mGQSO9hdnpb+Cu3cWV0Cz0E/Y5lbQJMm9bL8=; b=el6x6M8t0vNEK+ti
	wnjBqHEiVus7pM93+QJ5QcV8cPJVvxI+UbTFbdIOjPCgt8BIGptMRg3wTlZqQsMt
	ckoONXugdN8FRUlIqcT+A8IQTx41CiCGngXgBtQCBm6+xqjIILOtrS4Pn5A/ZAtR
	rCKVoaEZF/m4d6XVMwUltCNLnRgMV01usIRbWOSx3zYnc6QMpLs0QLz33+ni/yUu
	mfPKWAtsmGZlem1w+p9MZzacOYWPz02hOuHon1lM+gRKElIqTRi45VNa/UzOM6d/
	Flse3FVujAs8rHWgwyjD5DnhCeAQpY7CsnCsWN7DWJO4KMkc5CNOrrQl58HXHcxZ
	sO5k6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh8v80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:06:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363b06bcb2so44630121cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 01:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794906399; x=1795511199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpeH6W2mGQSO9hdnpb+Cu3cWV0Cz0E/Y5lbQJMm9bL8=;
        b=bifP/rvENCezkJMpYyuOpqX1IfEK7dZQjWwDNvqi2Cgh1hOhg8CjXHK4YYxvpR4IcK
         qbL/D7Uj6j36o5u0Yjl5rHPledyhyFAVrNxT48rsoHrrD0tWqVybP1m9l6RZ03cDgnGu
         msFgWI8GYPnskFML+2xj9ZCG3bIyGaSpMvk5u+Pei6BZljLTdzEOR4oHvRBuu16NvOid
         A4IYRIl0jwAVI6mtFIS/VrI/ZLWqW6Oc7QVKzZ1ruZxAS1DhAv04UPZjKY/M6cl4NbFj
         tpN0VgG0F2FefOhlx8JT8uxQ356ZOxCLJX/CMEAf6WEUggsQtFspoAN2LV4qK+B4tRlr
         +PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906399; x=1795511199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpeH6W2mGQSO9hdnpb+Cu3cWV0Cz0E/Y5lbQJMm9bL8=;
        b=PdqaLdZQMh57aoI5+FjvxktJWtgo9Y90IowNTNBzYHAMIXahYegb5hw56d6GCoTUxo
         tAWoXqxNWHiCKCoRKtHoPMt4euzLYA8IKdy7csR6AUbw2o6CDCv/i4XrCHy+Ds6xgP6H
         BD3sJP93rsNsbjPde7L4uEnTgMAvbh5qA1cVihGCUH5CZ4p8ygmoPzA+NgeedaU3JDpq
         S9u1eGT5pULQqGtZ41mqKah64Tulrrd2pDk3xZr11hgccv42yOni3uJm/v7lDVrq4Dij
         NVe+u4A8LPuINhrzy1hzdiwSFBC7azJTrOqzQUlnS7fXQc7VHIzoALDaHoPep1mIAx2T
         aU8g==
X-Gm-Message-State: APuU4Z+4asKXi1Z4o6bzLEJdptEpRTrwAo+RD1VP6SGaly9CrjhbDLOv
	Cx6EIXQgMFGGzRz1xIdWXU899L0KeMlAmLgmdQ1zNqwidRSHvh2yk5PUmqLYWkcGtQN4kissfYT
	gsE52SbaIDqJ0bu22MkCnsT7Vy4W6Hucwn0MER5x5Kb07duu9u+o5xNE9gI1knf1XFPoX
X-Gm-Gg: AYBFou0z1VnfW4NDDYi5z3R2wXC91XPCXyjHvuQYp7uGcWPjaDrkKDlsQQMO9HR4DNg
	RLeJgSwyjW1dmmX9VAKuo4WrvuKe3d0AeLj1qYvylUvMUTSU1dcfKuhiNy1FnfdoN8kHynI16u4
	kg97lLMf+BqRqtlsctnL9WE9M7ECvROYW8zEi59PF2uqd1YKsk5XB0leEoDwUvKtkvvCPMkLS+y
	ETRlu1FWHB4aLYjdHkxMvhnuyfRQMlR6n8TOpBKDH1Zw2qTWY8cnO82rPiGnTCo85oKkYRsJeif
	DyK3qpVrHS+dMKUB6iQr5i6Z9MFB6vW3BOxEZNDgtrtF5J3uJ/v4+5HjreM6Mgv3tyV1S3K7N4t
	4byYAtFUCNEFwC3gRxNx2DZWe3RIc0VvbeYniaDXgL0EOJAl8Zi6ZP7+H+kVRRt6ST5ph48lT1B
	Y=
X-Received: by 2002:a05:620a:a002:b0:949:5e26:e92d with SMTP id af79cd13be357-9495e26ee4amr1439146685a.31.1794906398627;
        Tue, 17 Nov 2026 01:06:38 -0800 (PST)
X-Received: by 2002:a05:620a:a002:b0:949:5e26:e92d with SMTP id af79cd13be357-9495e26ee4amr1439144985a.31.1794906398123;
        Tue, 17 Nov 2026 01:06:38 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm27310657f8f.56.2026.11.17.01.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:06:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 10:06:29 +0100
Subject: [PATCH v3 2/3] dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus
 clock
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
Message-Id: <20261117-qcom-nord-ahb2phy-clk-v3-2-ce5ee1073208@oss.qualcomm.com>
References: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
In-Reply-To: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2721;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QBN+1dwmLBD9e987Os73d8yZUxWyOR/u7FUNVAxo3UA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/BkX2COVyIWDrc1AcaLuDUCPBKBRpAsarEgxP
 XI8WM7T2UmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavwZFwAKCRAFnS7L/zaE
 w4meD/9NKT71+HUIz37juikjPPfGnNgEnYUYsc19fMFokGZkeLFzkTJ6EdiRvZkHUmWFiUMtAXe
 eQ/sGAUzF4bDux6v8+zdzY028g+PdH/31Vyn5NywV6vAWbN9nSuTZA9yVNNDqLrDHNmhZ7U5+2F
 5tcktQEO4VyzM9kLS1gFhH5oj/hCm+y+nBcL0/fgTLVChXP2M6ChhIR9FKwmhTrww9UImhj8bWF
 zwAPsHj3xBWRSLEvOodkc1RsDuAJYXGLtGc5oYiVlD3qLm57KsICyT7UIy+kY23bgteSlQnvnna
 HN5JppU1tPjtt6tki49eLBqHVDocZ4VU2sWyUhXoxiqIF7lLEb7xLQC9BgTzzbRdbMQP4tT6Y4+
 1ZB0MXnT3UcTZxqfJ2SXMWZzFqsQC3NPIhqpsObfilL8xYzVtR4Mey5YAIkvlgPIq2ulxN0hmzu
 TqufLxQ4AYEKlL8Y7ofVqjYYGpF67wNQDdaNWSEl8My04RiputgrNqEbZ5IflkWLXumN8TKJYVy
 m2nyH5e+8j2LaBzjnJpZiRPwcIAO2LeU008+M8DZdeP4mBcs36OjH1/MPratQQO8UstFfj2LBee
 ElrtOxrcR2LvBGbamQ7fLtk256tHtMeZTtxzMxMe4Zk0L3Wj5EmWH5hN8IXkE3h8XeAAcuYBRV8
 lY18lkrolGEOCBg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: TeZt9UFQFwy3Zkdl3kTiXdmLcxK8Gb5z
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc191f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tP9VjBngxETQ9kDmeHQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: TeZt9UFQFwy3Zkdl3kTiXdmLcxK8Gb5z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX0SmSMmRjqSmZ
 i7zntmr/phguPPPfXpofCnMqKq8+SOHgcSlPYJp8sQyGgp0v6ZvIW0nlSpuTxZCtzgaFJjMQHbg
 RR/of2Ggs7R2REcbHUvZE4FX9beidqg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX+MpbyM9VUoWX
 mi+8uhv7/EOfnnjbFNz+zVFUZpOsm+/BHVu+KymG1/q3ZG/wqtjJN/9CYimJcYO7x2/2UN458WS
 97rUAS0Ui/prZ9KSFGQ1yp/nSCSYp2+goTqEAZgJruPHNQzLrMG/EDnbSvGBnQ2akuG0xNW0J44
 CTNCRzxJEN8IbTLtnpeM0E0XE+6gPVpuktqL3C+EM+eykRELjXAaj+8MCy/UFTUDepOgHwNXH9/
 NTK5JZIB0hyg0B+auszQ28ddpazCMe4U4h3QOtixb2mjhshIYROyXKz6QBxzpaJKGgNx5r7oqyb
 SI/H6MCVqDZgJD9Eh9K/O7Ycshwzemalbvh+z3gmWQ2W8pZ5ZJ4cVEAv3u9BQsauILZav5IOlWs
 KusItwp89dKwnl0Q/n5ef4WvzrCqHeqXEqmn9xupqCtCuM0H92TEwLVfcmLKjze6pE85WuQpbn6
 /5htRZzk9ZqcuNow/pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170036

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

On Nord, the eUSB2 PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Allow an optional
second "bus" clock for the AHB2PHY bridge, require it for
qcom,nord-snps-eusb2-phy, and keep other compatibles at the single
"ref" clock. Since the Nord PHY needs the second bus clock, it's not
really compatible with sm8550 so drop the fall-back. This is fine as no
DT source uses it yet.

Fixes: 4d1f3875f328 ("dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
[Bartosz: don't use the "qcom,sm8550-snps-eusb2-phy" fallback]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,snps-eusb2-phy.yaml          | 27 ++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 931cd0e7d297e..40c0b8b42182d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,13 +19,14 @@ properties:
           - enum:
               - qcom,eliza-snps-eusb2-phy
               - qcom,milos-snps-eusb2-phy
-              - qcom,nord-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
               - qcom,x1e80100-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy
-      - const: qcom,sm8550-snps-eusb2-phy
+      - enum:
+          - qcom,nord-snps-eusb2-phy
+          - qcom,sm8550-snps-eusb2-phy
 
   reg:
     maxItems: 1
@@ -34,12 +35,16 @@ properties:
     const: 0
 
   clocks:
+    minItems: 1
     items:
       - description: ref
+      - description: AHB2PHY bridge clock for register access
 
   clock-names:
+    minItems: 1
     items:
       - const: ref
+      - const: bus
 
   resets:
     maxItems: 1
@@ -77,6 +82,24 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-snps-eusb2-phy
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:

-- 
2.47.3

