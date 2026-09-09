Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836D057C720
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965828; cv=none; b=DSW1mkfPH0s3G9NE7Yzdg8tfiSZrKXKsxon0J9XvooFm/WCDwgfzTfWW6cO/5AxLnHw18OGmGzMNFbOwXiA/FjOAufN0qtAsNAUtRNHaTJPWtjIVKBr67YEVLnCvlXqhi4jofudnCEIGXIa0l1GAxwpAqU7jx92TD8exX0d5xVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965828; c=relaxed/simple;
	bh=XggMInr4p/kOChUVji0s69UYgrNeKmtuSko7TtQpILo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ui1JBfFvOnSrz2mo9iC+mgTKKZl3uCS97sRAmV9IeTwfTnvgfiAr5e/mcDtAQ5J/hc1UWGNxfomoPVrkR07H58h9LFNjhfTgZeHZK6hP+1JSn4uvb7/rhzGgrkKpKA1CsbDJS5Wik5kkv7Zo/wnKBnthWlICWk7aCr27+N/9aUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYCibMWJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqxbk6oz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYCibMWJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqxbk6oz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU6On599754
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCGZQ+i6grmulaXko8drMOvUQkeNLsh39m6O+zc/IiY=; b=DYCibMWJFOOBEBJF
	/M2Nt3jUPp8Z3fcoPwUf1odz4T/m4p7+MjViPRiLjGSU4Lt4Voe5zHqSJn5iszVu
	M5C+iiohVOFBVStNKBrjJVek6RhoaehRDax9e06tmUAUbQX287THCYey8xORRIWU
	7MBxQOJ/atxJWCzpxCyZARpksoNc/D8mMrK7f5CDRyyb+EJwDqAzjUxyLqgnZXUM
	TNv4vW2LN44FADMf1gaXv/ymezqoVS58h3RcjptzniyAN40NbAJz9wz2mUBxoIeI
	rsNmP+ZlJXIaJEV8wXmdDDoQKYexIZKrTMHoG7jIIg3zd+ZZxCcFETQ+D3RNYkqN
	Bq0TfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr2y3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:57:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so950906085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965826; x=1789570626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCGZQ+i6grmulaXko8drMOvUQkeNLsh39m6O+zc/IiY=;
        b=kqxbk6oz6NQVUZz1Sd5I7FMYxs8R41hZgyiLAxxaC7p3xpLo7Z/CTANDuipqE4GuMK
         KDxNZKuYpRki30RdZtwhDt1Zcz8XbN9W3AxSRtMH6abxfSgTNE6UdWJZP0EROTaTWdUy
         hDjVk3QeBGJZckqO1PDznYBW4kHzxA/Ag+IwZK08iVI8ShILGcNX2gvGj6+HigC7z7TY
         Xu653doLDofHmek6p33xH24jjXGZRZDd2GzJFYUtlBSiLWvtC8PdcP5k8GmTWHZsj1DJ
         g7QSWV2AE/yqs0E0EGF04450UDDAExLeyl++DV9Td/0deKTYyurPgSRe1MAmVyxTfgxS
         wmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965826; x=1789570626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCGZQ+i6grmulaXko8drMOvUQkeNLsh39m6O+zc/IiY=;
        b=hTjKDLX4mVLFdvr+bwEQSFs4BkX+MQWQyvJhXMtFOc84Of0icsFR4EB5j0lrCyqjW9
         /zGuzuvEhhWfEbrKP43s4bxXJinD5DKtFzWLzgI6Ba/r3zEWlikvnIT5NsOVgE52wuQm
         BAV6vDfK0TpjPgRM7SvriC+aoUiF4rpPmQL7joNcwXc+moS2WuAMHYYtqUBSeq2R+RIX
         wHOgH+f+nYgjyDNE08actr/OK69FRzIktC2ffv+W7vqrjuIWjzM6D18ajZ42myrPgwZw
         P5u/+OW7xM+MFbe22nmyhWkwx9AzjM8wOUoVknS2YAxcGw3FOPtrWKPd1/A0NXxovMXr
         votA==
X-Forwarded-Encrypted: i=1; AKwUvBwqICzbqugsDgmiQGOK0IRKu2hM6AiqtDDbpIj5gzP83wnx/GzyBXhSCuYG/jF627R4UOhuxhqnX3IRPd/W@vger.kernel.org
X-Gm-Message-State: AFuF++lqG+FF3l79ncIBJqCmQWGuz5PQPQNFTE6bKZHLZwoeGlYD7RQ8
	SsIK3A5SPVUrzKRlNM1/lNHe7i+x0GXUzBsX0eRkd6nFMGEW0mzX/fl2tVccqMTzSNVkUGUWvHR
	vhjoU2mj+HCrH71CdGNZ6I0Ew+MIbA/34GY8KDg5YYG27cw9f37a4fQh+hCJqetxKbe1d
X-Gm-Gg: AYBFou0SW9K2R1LPR8Qrbn96riZ9InRekQWYlOQPbbTyQWfW2+04MAA6NHEoCNGsGKF
	Ls408IIhRgiEO+H97HBI/UmRJf0kZrObMuQi5+uWsp9EGdk682KQjZnCedWIbAGw16ryVgy7r/O
	aDo9EiF7ZhieCaydzKTH8HIeO6m3wlZQYAm3vh/zPG/crH+5gPC0jnprbjXqotbUn69vjr4V1IL
	aRdag1Nq4LweW/E48w7QxPQg1jBps53OX1cKdmNrHEE2YUM8E8UGNPOpJ+Y/JII/8iz6/taWXOh
	0/JXMfE7EtYRlrLlPqBbjbWfuxinEOnSVzFk1Ho/XV24dBG8wtF6cDvngbN9p/190tp+XJ1WHne
	94JtPN+gGxtrN2w==
X-Received: by 2002:a05:620a:4449:b0:939:3626:558b with SMTP id af79cd13be357-939d4924cdamr257053985a.5.1788965820579;
        Wed, 09 Sep 2026 07:57:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:3626:558b with SMTP id af79cd13be357-939d4924cdamr256984485a.5.1788965815365;
        Wed, 09 Sep 2026 07:56:55 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883acd33sm44453692f8f.18.2026.09.09.07.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:56:54 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:55:53 +0200
Subject: [PATCH v5 1/5] dt-bindings: PCI: toshiba,tc9563: Document embedded
 GPIO controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-pci-tc9563-aux-v5-1-c9b33f56c8d3@oss.qualcomm.com>
References: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
In-Reply-To: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa173c2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eKs96njmx7wsaJQT5x4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX594e7sLgZL6f
 d+npw7vbvWTlNhz25HDaGM8d60ZbxdtyN9jHk4V0bpoqf656x36c7dZxhEPtPo+IejmegzZAdZd
 o9wZovjBSd4xJw4R+Y+CXfRL3N52W2TkiKH4pC91hyBHvcjohwZYGRhtHv7Je2ZMhZkbLpVAx46
 YV0tSkipYsfn6Wf41GXvXUlrtz+9GVxU5ImNNloH0fmbeT/HzfRnsgB696JouiwmanL4zlEGQrm
 dj1P5LDlrvquFBt7yw+F5ZTSztmsRck8iGWsjQFBYnXE1+MtZUedY+JrNlGMypeBAk6NwpS2SvN
 QCb/aj+ZEGRGDj52T36mi+s2GSLjYie/eHqCXgWZvF5WvIviMHHKdTdWMoifypW7AUCKfKvC60l
 3ve6GTuCRcuK5h1Rpk0MTxxT8tJIA7qv0gi1jb5CLedtl3ieAFXnF/zzkYPZ7ESwXTevlkzFNnx
 VDh7sa9ExaIz3xev7UQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX5IdVBs+x8R3E
 l5eNkacqupX8vnqn0HMqedyE5QTYSQ4Wj1rRlWcOvQHVQfvPMlINy96dMLZhBRGKOVxtt39v5fk
 mgEEIzAbTSte1d4MDX0rsUDCFNE3upk=
X-Proofpoint-ORIG-GUID: LxhuAyI943s-aeOvHjEdGdReSajP-J3J
X-Proofpoint-GUID: LxhuAyI943s-aeOvHjEdGdReSajP-J3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

The TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines, accessed through the switch's I2C interface.

The controller is integrated in the switch rather than being a separate
device, so expose it by adding the gpio-controller and #gpio-cells
properties to the switch node itself, and extend the example to show
the downstream ports' reset-gpios being driven from those lines.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
index f084830c6d0c..c4ebb99f50c3 100644
--- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
+++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
@@ -31,6 +31,11 @@ properties:
     description:
       GPIO controlling the RESX# pin.
 
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
   vdd18-supply: true
 
   vdd09-supply: true
@@ -128,7 +133,7 @@ examples:
             ranges;
             bus-range = <0x01 0xff>;
 
-            pcie@0,0 {
+            tc9563: pcie@0,0 {
                 compatible = "pci1179,0623";
 
                 reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -149,6 +154,9 @@ examples:
 
                 resx-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
 
+                gpio-controller;
+                #gpio-cells = <2>;
+
                 pcie@1,0 {
                     compatible = "pciclass,0604";
                     reg = <0x20800 0x0 0x0 0x0 0x0>;
@@ -158,6 +166,8 @@ examples:
                     ranges;
                     bus-range = <0x03 0xff>;
 
+                    reset-gpios = <&tc9563 2 GPIO_ACTIVE_LOW>;
+
                     toshiba,no-dfe-support;
                 };
 
@@ -170,6 +180,8 @@ examples:
                     ranges;
                     bus-range = <0x04 0xff>;
 
+                    reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
+
                     toshiba,tx-amplitude-microvolt = <10>;
                 };
 

-- 
2.55.0

