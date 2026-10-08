Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5BE3655EE
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 01:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424260; cv=none; b=iCvLabPvGCs8MhYy3/2MBXFMMosRj4MwQC1QgHWb5jjpcdaIFBvIeJtsQTlhZi3KWiHW1PLEPQ1QIG7h7EQUnqmpnRY6udV9vhEr6x8LHnpwBlAuAV1tO5Js4IGXkXBFQckc4p0teOeBWXaw+3OCeMTOq0VHmnX+IIUxkuqvrFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424260; c=relaxed/simple;
	bh=sCVLeOjiJE0GZh+YstipYytFVnCzcVwgUUz5HTXAiws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgz601hZ3iywTDR7VihYpWLPqq/mvw+kH+S1457iRScUrWR3RACRsbZabq1z/DDoyX+U7Mv+t3bpj4OgM77hJhDL4Oasmw8Ya2CITz89tKYVnJY2vwKzrq8pyUJLI/bkC6vWAUEaYXKxDfRn5vAocX0q7lCJZrL7hs7oX0IUD2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GckDxWNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRZh4F3i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GckDxWNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRZh4F3i"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hOQh1454263
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 01:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sq1jFandZRs
	D5YZ+BLbArAFYRvw6o4r3gf1nHfXPy88=; b=GckDxWNBME3sbgnc2qvaSuT0L8n
	ipi3DE1JjRFn1eyuoQP3+QMJs9WNxBht84k0eiloFn8SoRocbJSbYA9B3007i4K2
	3rKAzpT8oeL+6QMK/a+ezbW2iy+d69fpzKu6igvxs3BjxJk9XWEXoIbNcALG56aH
	lyltAft3HVUksY52Kz5ZZm1rrIAwNa55cNqHVw3gHJe6iQPqqDyKhgAg6Nrzrtj1
	du6sf+CCHCaanzjOVYFP5o8vtFjgteBe2Np1ZMpnQBPlt0G4127+6O27dNWOqvZu
	+qCS40aW9dm9g7IwONrKqphYF5Uwe6nXoHGDqxPVmllVCg1fpJPfhjQy/Ow==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe38k0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 01:50:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso8978158eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 18:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791424258; x=1792029058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sq1jFandZRsD5YZ+BLbArAFYRvw6o4r3gf1nHfXPy88=;
        b=YRZh4F3i4QlzgP+UCGJG8NUzfFFY+kaianV7f7AODoB3LgbfvC02Gl95pR4oZa2kH5
         R84jRtlbdgBU6QizLe2q80ISTHM+PAX/jnYinjQOBJY4GIjEO2iElVQ5dleB0pMGUfxz
         fyEkmwKFquyL7EbmiR6MMXmf1VKkMa1rDkWP/JdUWTFU955cVgA42NvqQChg1FvMl83R
         6T1S3TYpLEDjOHcmYsiUL7HoG1Zev6gJIH8BXDC1Dd4ApfZGT2zcQtQ91v64F98twP0e
         fdzTFs7zsdfgmurIyoG4ankHCrjVsToeJ201VOfSqTLkQufigssFmc77z7cw8vLmk96W
         dTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791424258; x=1792029058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sq1jFandZRsD5YZ+BLbArAFYRvw6o4r3gf1nHfXPy88=;
        b=TiPQvarss3/G4bYBydOtwc4jRwgDnG5Bic5azR5WjRI9VCAcaepnA+CD2VFsDH+PM6
         eaktfs7J+7QUDLbNMdZw75GaOk+HEvYwb8EFE3GMShQPehAgJ6fp9meC5QbQuXR0Lg0Y
         VJEQBmWeP8Hj/KqC9gaBXv49A5GTpeEFrGROwjkDtk2x2jYEqPmQQq0KDpfEUXTJ+idD
         L6iXxBEw4AQxQLHkBERCvqlcZUFzLDEtY69yS9GmDb01bYqRQ2sAyG+sNhQ6ksWr3tcJ
         PCa/p3rOgHaecuTWOWdwBCzzmkg8dKHDvHJa52xy2l9oor/Aci8HXodQegapUAK+g2B8
         tUuw==
X-Forwarded-Encrypted: i=1; AKwUvBybS7/iJUeX76pkQrQ+Gx4hXVVZZEIRcC8wGVJMt4KvCGkl30zUxetXUF7+cOky0f5ifs3Qy0CGVQ/+ifDD@vger.kernel.org
X-Gm-Message-State: AFq9FYKKG48W8zcC0eQudat7QFM2XzmSvV6egSNTf8QJfJgAjmH1CcUQ
	Q095JgICAE3NEoou49uAEtmehaRxOngHOTOTTHzZmKHsg7ELdeWCC3rz37x7UFHFdylVtrgUB5u
	FRwaTpCOzZxosZVvN3apR0uy/NmuOSKt5PCO8hHLDZrJK+V1+gIgPhWnuc1TxSewos6Hx
X-Gm-Gg: AYBFou0YgvjtWDKltyVIL+hn9bi59JDNCG+/15qgw2sj94r29Bm0WMtu7inNP1D/sBC
	yxyVoETfxoRN9Jf5b+Ox+RJ19Uco+l2ma3K6WibPHOy/tgCAI5qACCo56wsdGMblTVsOgULWbvu
	Cr7/6xnV2uSfilZOQodUS90EIKK4KRpQdDLaEZVeOX6Cb5gP5XCnyygflX23E8tyIb3P2peBG9I
	mZmY3u097yQ3I3aGUuTqehhVfA3MXh+XSHNgUADXavOm5Z3vss3jOrwh3AR9UCSw2Mlne1SlFu3
	x42szFdCjJLe64wutcQdHpHDrszbD7QzgnE1yxg/jNpz1/MG5CbzEalPX40GXl33CAiguJuOVnI
	l/4DblFofg7VSqt79I4O1TDNBqwbRo8UHY2Ks+DR7+QNX+nvifi3HDDYgoxg=
X-Received: by 2002:a05:7301:4208:b0:342:39f5:f9c5 with SMTP id 5a478bee46e88-3515dd7e704mr4466006eec.18.1791424257713;
        Wed, 07 Oct 2026 18:50:57 -0700 (PDT)
X-Received: by 2002:a05:7301:4208:b0:342:39f5:f9c5 with SMTP id 5a478bee46e88-3515dd7e704mr4465976eec.18.1791424257171;
        Wed, 07 Oct 2026 18:50:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb7117sm11761823eec.3.2026.10.07.18.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 18:50:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Nord cfg_ahb clock
Date: Thu,  8 Oct 2026 09:50:15 +0800
Message-ID: <20261008015017.3359804-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac6f702 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=8IMiPDtIn6OAJiDpRukA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX5eKw3MZapig1
 IcVcNfWH9gZZdbW27WHNDeQb3Pn82ylaj+nvrkxZ21yROL8qG4bsZdmKA945N4PO6Q9YvB5r6/L
 ZO/lEwkKVmSwjvAp7KSjhaYszUscMio=
X-Proofpoint-GUID: qRvIKdO0kgMYOqFS0EjRs8ioTKBewg4D
X-Proofpoint-ORIG-GUID: qRvIKdO0kgMYOqFS0EjRs8ioTKBewg4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX4o/KC13u1BzR
 nMmpK0fs2qTg/atPvlQtOB3TETO//OciAhBpoh7kFhaw5BJY8pc4BA7K1TeZoRQb9iBujqT14o+
 i7QFYwMjWCNI8uV1q86ojH32Tm0CJu2I8O4QYYMY/KKunmYsLPPHEeEWJgiZrbnE6zh6Qxuhz/1
 Q4bXfPAL+iLXCfvCpFpTuAYZRlvqjzD+aXqKeiwVDqw/WXlsy+qAtRZ4xFutWAh/6COh1JdF6Rk
 qPZg9Hc3JNH7qOzSG48XO8FdRxjlurR9q8KUv1e7xCouNJtnJW9XbfP0btgQ3CW2G+1T8DnNoYp
 g/dsJyZVF+7dsmrYFPICRpvPYxWL3uCjJkllUT6cqDx+YAGBS6UK4aOdwn3pnxNr7mxDjbLMlkS
 udS0g8wrWtJgMuudSfzxSDQR1a9hpRoGXhaKemoEc0ACP0s4eiDMwe6+/WeaZlJe2m+fAovAJ2p
 I16AOgz2O7Z+WLFM+8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080007

On Nord, the USB3-DP PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Describe the bridge clock
as a fifth "cfg_ahb" clock for Nord, using the same clock list as SC7180
and SDM845.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 13e64fe510b8..809bd4e1090a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -209,6 +209,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,nord-qmp-usb3-dp-phy
               - qcom,sc7180-qmp-usb3-dp-phy
               - qcom,sdm845-qmp-usb3-dp-phy
     then:
@@ -229,6 +230,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,nord-qmp-usb3-dp-phy
                 - qcom,x1e80100-qmp-usb3-dp-phy
                 - qcom,sc7180-qmp-usb3-dp-phy
                 - qcom,sdm845-qmp-usb3-dp-phy
-- 
2.43.0

