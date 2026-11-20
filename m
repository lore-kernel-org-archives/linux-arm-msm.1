Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179308;
	b=4BL96LjExpDvS8M5XxeQL13dSZiOzx+jvnEURe8FqzBBhpVo7oHUIhq8yiRGtfJgAQ8Y
	 rcessTagxiXaNnEQPoIdFJv3dJQmYJp0rR/Ao2AL/q9JRPsVJWITiezKf1/Y4eT42gcLf
	 346ndgDTZ2jov5mVVIIDrH/RiauLvehx8IgJLDIKv4Uk/NJALfbPrWzpJAHhTEFB4JJHD
	 5PfxXIhAow9TjN+WnUYDPQpiUrC9qKtVXHrN+puXAyDAy9IQvHcx3JXIgedpFvbWXdOyY
	 iHVzKVd6Uw499DuAITpW0UFZWOrj0Zw4uyPauDbrWEe6+ZpcE+laJ7Czvsa7wuudW+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s7EZYmXkvRrskX0cSkYLthSXhzEPGdmwSjyGC5cmJ30=;
	b=PVB/yntLvYyLB2frOslyzMzzymPnO0BoAbpy59u/HwVTdo1YY+iE7eRsAGT2dbBvFNKx
	 D5o8nIKcH4lIOJ7/6QW5OA61vw95lzQmkSfX6dVGLQOJo1+h9u9HCVUR/VRaj4DwYvlBh
	 pJ2RskqKRBU9vGY1PT8ZW3LJ0qt/Lw0ft51NSdW/CaLwhaQ9F68qHizTCA4shW3pY8REI
	 NVfvkVTilfZrLsS6o4/UpE+o6H7UZHT2QRUoynCGzYDZsR1KiLUAY5sEHH108F969ng9l
	 rEROHGP/cc0R1hvV2TjpW4d13xQYLpe+UvKGb+yJgjb0tU4pXkJVHgdmXjmlpeB8aaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VR4EShCD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XBog923V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CFF606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8CFF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VR4EShCD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XBog923V
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkDlZ1017066
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s7EZYmXkvRrskX0cSkYLth
	SXhzEPGdmwSjyGC5cmJ30=; b=VR4EShCDTBiGLeVD+2v9yOss+3pe8PG/7Gg4oF
	3EEAn6ZZwjsxQDzrfhHTtih/BAXiu6pNaZB+I5kTDRH6zg+VFVmey5lx2j4QizRQ
	ZpI88yRJXyqLL6FUGBIDbG/vYd4AXLBLId+waIwqXFQViGLhAEulwFym9Y76Les8
	ruDEyCaIAQY2aDhFI/0Tu99HEpAarJ6X5HgAolA0KBvoP7e9ePpANlO6e+T+zIeQ
	bkw7rzvCe0h8gyUUUk9Vo7M3UlJkPv5gj0prHQn46ttc+N/wdiWBwCH8ehJXZiy0
	anxYSjoBNqB/Rjvt1PBsHbfhRgd6jQTfmdXgIb2Z+ViTQTCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqsmxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:55:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so186710385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 04:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795179306; x=1795784106; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s7EZYmXkvRrskX0cSkYLthSXhzEPGdmwSjyGC5cmJ30=;
        b=XBog923V7O9YukmTiL6hSF7RCqPfnFWLPENoXrlnxpsIQxPNntwfjlFokVSeWVosL5
         Ao0rQpxHgbtEO9lwo0F2BA1V0CF8QGErYU3bEQofCg9QUXKqol4AE5jpGDqTj/wgtMgN
         Msy1z/McCOsy77O0G4xscBBgnf9vlMQyJm9FlS55alK9MfxUXvyT8xQ8u31fkNW9WG6N
         vPWu9Unqoz18jeJ5bRyW2iiDGCGd7x9luN3qpWAgbtgjCuGbdA3JnTlWcd1lVFzqlClz
         GEtB8GgdAJ3pRfVxyQXPg95vCcEHedLI7DkzwnarPLaL7rM4URbDgdKv4x6e8XqhDbm2
         SeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179306; x=1795784106;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s7EZYmXkvRrskX0cSkYLthSXhzEPGdmwSjyGC5cmJ30=;
        b=J8VurusLpvHNdjfFe76UvWbPUTl0LOz7H8ZHXezHrKUI5mUcH3US2zk0Wi8JxkdGnz
         NrDaEASiSp0g8lXaefKTQVQezsfUlz6lLkAZiXNMMVb4WQL10cdSa0vZpC6wXFVW1rzT
         KRzBC7tkZXXF/bff/B1ZMAgvu2Wa19Boddvi8hA2eFxLXhGUtBE+8CsXD30AQ6R/DdYz
         lGULqQJyaKsBeIAIbCMmWiUAB2VNat7fvmdDCEQymmy1PKi9jOlnIIrJqjtil9jyWPGp
         sKtQG3QEwDj+8fBkh9ccnMxfYUUK+ju/oxoILjz9RAhbROajwhAd+jrw8dpMaIgnF3M1
         r+gQ==
X-Gm-Message-State: APuU4Z+R0hztADGyQ9wAem503jw+/3g9wCXsBf8nAL1GQsQMj0h1Ianz
	a2kK0IQnqk9HEj2jVOxSTvl8RhsyDeSGJwTFjadfDjUyPv5++maCYFoKMjqKwPUGeAeq70TotFI
	BEKS5LWjM9BCeqZi67T/zmcLKbehlKAmUKwXHYD7icPpisnkqNTJztV+ODx3VANPi1oF2
X-Gm-Gg: AYBFou1+QgTVM1pY0UUFHIA7mbm6JRAUJcoAzlwyvDWxe2KlS6FZD2yKyQSzZCjJdr8
	d3e7XCR+6HaePKTcQAUFHFOqHUGA6TJBU9mZQAOfMRpiqBStQdDWPha41K9dtamUoKv2ME36fgm
	tkUhh4kyWva/yA4bCRlAMeARInrPZA7sQeZKZEJzf3I/D1EgYu/F4CV+TLqiS2RFeQYBw23B7TF
	xpfbYg4CCvh+RB81d9gYuWqwz9KpIkN5s2Q6Agwksx+8jrPuh1GPvQycJiliwYTLmhFeW+FZgfV
	HCrc9Fe9lOlLeiwmxMwtlctF0XMZfIBsGCyM370006dXPRkeZYK6CLUtdxZqyUMw2wQX2YdeIqB
	gvpET3lP23ZCTBiENj/o1T8qI2b8CVwXU4w1KWzwfdyilA2oZQ8cXdUutLpsP0o61C1eywAPIfa
	M=
X-Received: by 2002:a05:620a:17aa:b0:949:9985:e097 with SMTP id af79cd13be357-949ba96becfmr466590285a.15.1795179305856;
        Fri, 20 Nov 2026 04:55:05 -0800 (PST)
X-Received: by 2002:a05:620a:17aa:b0:949:9985:e097 with SMTP id af79cd13be357-949ba96becfmr466585885a.15.1795179305336;
        Fri, 20 Nov 2026 04:55:05 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm74459235e9.9.2026.11.20.04.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:55:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:55:02 +0100
Subject: [PATCH v2] arm64: defconfig: enable the SerDes PHY for Qualcomm
 SA8255p
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
Message-Id: <20261120-qcom-scmi-sgmii-phy-defconfig-v2-1-01d7865193e1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACVDAGsC/42NQQqDMBBFryKz7oiTgpGueo/iQpKoA43RTCsV8
 e6deoJuPrwP//0dJGQOArdihxxWFk6TgrkU4MZuGgKyVwZTmZqIGlxciiguMsoQmXEeN/Shd2n
 qecDO1lcia40mqGPOoefP6X+0yiPLK+XtvFvp1/5rXgkJfeWsN6FpyNl7EimXd/fUWSw1oD2O4
 wv/4PUI0QAAAA==
X-Change-ID: 20261118-qcom-scmi-sgmii-phy-defconfig-a76311772311
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MbhJU5JdafzJplM18yrnxkgbY8RliXw7RaC10h8GUmU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEMn7dCkiYsmQ7cU7h3YI4zhblZKcKY0yYd9E
 svxGIqKxkyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBDJwAKCRAFnS7L/zaE
 w1sZD/4+pgtUivxmlQlSri4BgFxa8N5QiS0S/E7+GmcFiB314lQHYzsENBVJ4+xoJBvW3svATTF
 r8Zgr3rHZ7Y8f3iOEAgG1AIeB2vgi5KBsJgnePFfHtPlBsQfXtapWx9+Ozomna2iz8LbV2MBaz8
 GoIRDAGfG04pMSlUgtthVhykRQr2zrfWBIQKPnhTZK/QHtoYF4mTtHX0glr46XgfYeEFUz7gJ1v
 1Wbw6Xesb85zZIzIfaujhhaiLIhcRT1+NnB7C1UqUzHpWWlE3TXRhsgmNLNJiEMkpls2QHug8rv
 aY6fsb5G7MZlz4CzuITd7aDFLPi9f6whMHfOEDMG0eOjJyc11AYkrXnXKgD0gkJrycmWqDNuLec
 wCNZ2mqUkNCXj6OUHHQHxVQgAVWJHB5wqE38IlvD0ovUl/j3kNcLplhPxInCj5aNuqA5lb6P8u2
 cx0Jw/0aiMcrvz1lLNECOkD8C0AdTQpqIVD4Db/epZeY+zm5rx36nH+NwbTEpKmQUh+OHVRb5RZ
 nwvO1WViHmNKgwVZnK3gNLGkUA2706DBNGXj+cM+4inG0fkBcUqTry2VF0wrxgWjafZBavcST39
 UJRNy9TvCa0r52sC9VBrhCYheac8Vaq7YyNbzGI2he2thRglKyySkcRTa+sPuIfplLwTZIEmUky
 KXnnwEU2CYI6pXA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MSBTYWx0ZWRfX2R5ycjnpbDZv
 9Iwy6gMCs8lGeZdNG6AcqE95By0QR09ZRhlg5msVPZzc6OOyd/A1+i4un1aFdswaXno2qsDOQKk
 3SByPNK0Nt0lANuhwkeMYiegvDKtEaB9al6sY7+4R+FrpZuMF9+rLkXr9/6MBuLrbVDVkjFoYdJ
 ZAjT5eozVHyM8r/I9pYBRvjHvA4jvI2r3UPfxwKOvU7qYG6QNEfrV2WL3TM/eS8LXcp1XO9izL1
 AR1tMDQcC6fawqxQZMIkHvm0zpuWtJxKp3GkH2gUGw7Lg5ymjZh9iqR0rT4viic77zOK/v8cJ38
 T5gWLXEO+p/mt1lh89mEva3uleAbzGqhRIQsRGcxgYFaGTSMfAoQG9BFmEn6KHEHfCvxBYk60gD
 p/JweCruUCO1NtH5zD/Y/xzbiFivlI30KP01ubfizd0XDn1GJ/59DzhGlx7l3Wt6r90uLNL9kCN
 ZrR4OET8SIDTwq6NMvg==
X-Proofpoint-GUID: oIrkI-b98UA-Ucv9lV6D6XokXLIMSQyb
X-Proofpoint-ORIG-GUID: oIrkI-b98UA-Ucv9lV6D6XokXLIMSQyb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MSBTYWx0ZWRfXzOqs9ZDS4btv
 4Gy3lrhSce5LrhcTIkcx8fQA0ZybaRb/sRzfbwJxXHU6Ff7VvOnAOt+l5S4p5NNc74uOczSln8H
 kVfwfMPVCjLFcjcE0CjSr0+uIFRdnXI=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b00432a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BpbMfEP1g1sSJNOxg3sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200051

Enable the SGMII/SerDes PHY driver for Qualcomm SA8255p which is the
firmware-managed variant of the Qualcomm Lemans (SA8775p) platform. This
module is required for ethernet to work on the lemans-sa8255p-ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Attempt to make Krzysztof happier with the commit message
- Link to v1: https://patch.msgid.link/20261118-qcom-scmi-sgmii-phy-defconfig-v1-1-d0c7d2e881c7@oss.qualcomm.com
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 52a4f0b45707976590d2b5ed09427737e4e5c644..213445d7e3cfafd678bb1f5974a8dac46b679df8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1671,6 +1671,7 @@ CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m
 CONFIG_PHY_QCOM_USB_SS=m
 CONFIG_PHY_QCOM_SGMII_ETH=m
+CONFIG_PHY_QCOM_SGMII_ETH_SCMI=m
 CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-qcom-scmi-sgmii-phy-defconfig-a76311772311

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

