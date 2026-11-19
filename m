Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072263;
	b=bfmyHoXpJ32vM1Eoed0C9Sq8DXIDGne2hb8el3M3e8z3vGoLNvOaCh2wXYVWfi+P8KWg
	 YTDGfTZ3LSvOeuq0kHUQjpPjjmV/9myKYy/KRb3gepqG0zJ2XkLnxBbRDvvb4GhA1z4fq
	 fCpH13aQey+GR2U501CxUO3ouze1VW+V8atNZVAfBW2uQMndmQZ+1NrqDSb0hSFJOObDf
	 t0OnAsEEcYCp8dg7CfnnQMGcdJRJM7NMTvOl2BEU4H/N81rNVIqVjfqk6iM7vvWS8QRqU
	 hp0mAN0uc9nYhKGKxdjTKPxtxqIsCiIQVFV9YvyapIu4NRgNvnqGRZLpobnvzg9/aXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072263;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vIY527nWWqEc7pRCVTxoq8JPGcrrYiVp6x7Y7rE5Uz4=;
	b=Tukjb4r+2uoXha6X1sSqKdhk9EnkjWiQqc0J5XUqQ4tiMRWdvkmVrjyvH+bDbx96b9Rd
	 7yrRC53Oc8BY54Xsh1Ii9Eaqh1Hk70FPAUA8X4FOMFaSqA3u88Ib6Z7hb5eMdBhtXetP7
	 huFR6M7CJUHrbO+B10BLE5NBK20uPs9K6rkvTKNbSSYNiOiiCU3aqKCh0cJNcjPl+dC6G
	 WEpF378lEhCztafq47xTD79XdEZPWAecGIld0YQU3E4O1bPF7RxRuJ68c1EdIO4wA9ODG
	 5w9HhscvTR3hwcM4H9OsPXIxziiuChjuVCaFd/lIjkSDW/nVs34ejeYO9XmCSLWLwlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ERFiqI5w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PdEv3yP4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59B0606A338
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E59B0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ERFiqI5w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PdEv3yP4
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vG4j1681211
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vIY527nWWqEc7pRCVTxoq8JPGcrrYiVp6x7Y7rE5Uz4=; b=ERFiqI5wf0oI6LdR
	MOYueGoV/TT86wR8xTb8KfUtL4aD7PI4C6TV6zWpp1CdhlWkIbN4KGjCA7mEkMH4
	lJ2L6VcQSz5N6wO+aelOJIhgsDjvDpkY/UME5nY5ZrMjPXxiPQHEDGjwQnEEYXFE
	14+cSMrK9uce41Rc3YOJWimB5EtfkcC3CeagpLGOu1kpUsIKe7OcpSfeEN85tIky
	rpFbkoA7ujR/QEJazqhrlvMckHCDp/RBBv0wABbS6vrqSNkX8NSwGeDkJLJ2GhI0
	UF9mPpsJcOIOhSHQD5Mc0dKmU5ZjZXMAzIb4a95Yt71+hSs0Jeke/277+yIJ7w7p
	FDJqQw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcsdy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:11:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so2567163a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 23:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795072261; x=1795677061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIY527nWWqEc7pRCVTxoq8JPGcrrYiVp6x7Y7rE5Uz4=;
        b=PdEv3yP4aYpvSDYqGzyfVrU6wj+Xenet7kuM/Ls7guya+cs33dzf/qe3cbCBpQvUFE
         OWt8Nv0TGgcmgRuzKP8J8mRV0H8Zfyl+eQOI4dqu8el+7PoIzO62a7hbbTBpfmE0pt17
         +7DuXiAqVa9lRcbAoHy8SxCbVJTO00rgAzwOwKL7S4D1VJhUWfWAmC7MZLjkKCPGlmZ8
         1vsPHXVUr+anTceGWBbvh8nZCk8DoSFXETwL78MPdAQRQLrVbueALJnnzF013sRtjea9
         OTCb7XIzH88Zmmfv8b6GRCZHBtP8XE9x1QkCIPMUFcaD/JTGVUMKHPcU/ObTCkS24fG5
         ti+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072261; x=1795677061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vIY527nWWqEc7pRCVTxoq8JPGcrrYiVp6x7Y7rE5Uz4=;
        b=JBzKba30rc20Pl5jVHRrbUafKDelw0pd8PCFT4WYPeygpyOzqc9u/O/RFo83LOF755
         ZnSZhqIklgUp3ynuxz9lzwfYjJOsxqBNDHnaCU/vLACSmNv9+frV1rdIh7KhTA+Mcyzs
         pojsUNYCzctZ+9Q4XV9COuLJAXiyCZYhAP3R9mVxgz/hpKYZW6R6eZOzynpPVJ49qeJ6
         4NwSQt0zPiiKwjPuPXRcFmTYaCzolhlI8TrcXliRvfESFyzctLCV6NVxy4qkmHYy9x+1
         IxjoAtYJS59tRLdAwYtG9Jw3LyX3fD+ZzIpcH7Vz+uRDxDoAO/GgvV8WfKd+JjUCWtZB
         Wlaw==
X-Forwarded-Encrypted: i=1; AL+hErFAzUKi0Vn5VUZNM1Z7Hk2jWRFFOW0MbE0ncBkSZA+e8RkQJOrhjWa8Nzw3/5y4lccTDIGSK7KWcvFXnFww@vger.kernel.org
X-Gm-Message-State: APuU4Z+bWtfAwisI7HxC6m4yVdG0QuSZcUaThlZXChHK+Fqrhe2A50zr
	iAXx9wFfT8qUhGS3WcrDkyOFxhw9KA0DGaSGPBMNJ9PBQKn+HUfjh5oYoDzxa6ycAmvU32MqLWg
	VIvJg+vEqI/W/34q4GXTMWGSeUVKeJxlt10s0HSk2AoO9vNwZglLlovSBSjBgEHYbGC4v
X-Gm-Gg: AZFdTZfFVn7zt9yKN/noO2whIhK6dAo94lcwXH9jRWpSRa9bivAIX1JnH/HY1bA0e/a
	/bTu5gjD3XJR3EFjx73NIKIZwp3vOEaCfVztcpr6ePVoonJwNQhnQ28OrNcdsYzSp8UX7laZeAt
	QHOGU4kVwv+II+ujA8KG+iiBxXCXwtwmzW7psJWI+NxXK07dQSFnL7mz8T5wY0u5KHmxkhj7uHZ
	rXYiFoTyZZKMC2lqVJds/qei+tr8xOf/t8oP2y3jde+yEQAoze9LEF8pSDwGLvjqxYPRjucw0Gw
	0crKunmDIR5e7HkPB7Benoe1Uadn0dqUQFPDKyVFUiKxlfZb5QJg13+PMrNoYJX/b8iPjRrAQ4Y
	eUE9peyLTWAHaR5lCTUVABTft25R6oBZsajB8DjdwPtstdNZnIwx+Z8ivwW3HCDXDA0IhkVeCUj
	rIkATmqpbQfA==
X-Received: by 2002:a17:90b:48:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3b3d07d29e9mr5192482a91.63.1795072260478;
        Wed, 18 Nov 2026 23:11:00 -0800 (PST)
X-Received: by 2002:a17:90b:48:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3b3d07d29e9mr5192451a91.63.1795072259945;
        Wed, 18 Nov 2026 23:10:59 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm746348a91.7.2026.11.18.23.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:10:59 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 12:40:14 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board
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
Message-Id: <20261119-lemans-draco-final-changes-bringup-v3-3-db08f12f0cd5@oss.qualcomm.com>
References: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
In-Reply-To: <20261119-lemans-draco-final-changes-bringup-v3-0-db08f12f0cd5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795072239; l=18198;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=/pKq7yaSq/Jll1ef5DIUS8psbE5wssM1z2vWEG9FRb0=;
 b=28qWlMlrh6oTL5wh5V732y/E+COcjaM/p2Wt19cTchHLr+fnM2BPyk05LO/9gYIxg30+JdidZ
 ceHoRjLqRdgBIq22f3Sb/cYJBINYOefdbKr6G0uaNc3IcPB/7XY6vsH
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-ORIG-GUID: MSgIDpdBN0tpKeJ0VnoAz3iG-YXKwZsm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX1Fhl0VDoS3rA
 rIQo061ItSZm1BaMi65csJ4lcWsxAJC/Yo8k41hIhnF1D3AFn1G0WT2t+INYLLh2EGM/N7wQSo9
 mNJB7QuyIRgmcCvw3dkPfFbnXj1AGm8=
X-Proofpoint-GUID: MSgIDpdBN0tpKeJ0VnoAz3iG-YXKwZsm
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afea105 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=E_dcQAJCNpC5B8u9g4kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyOCBTYWx0ZWRfX82PWRmHkMSIj
 DsUN78cid6zskWMvUZRJs2A9ds0nPSjcFp9ANykOH+CCqIp+H+xGO+4qQnORToNnhwpCUtiP6O+
 eB+XO9gl8gN5k3T96INdotasG/6whuwVO8f/c8j9LA2OIXHodb9dLyAMgLlI4CJGqZtzJRT3BlX
 2ipS/8RXbzSzNFJWXaR20xcSJC7Quca2n189shH/lg4qmd5kVcG0b6e1HL1EeoCszFLkPWyQUve
 hTuxvlzOET23z4Rr8BFWvpKer5rp3bQNtbKTGTaiValFpUQO3YkHZDlPAFq5jMyeOO5rbHVyyUa
 JQ52czdZlu4Y3MEWqBf+PNPw4/L6PlN4SqaocN7FzX8+eU2WOqDEDt+lB479Eo0Z3ehmyaStqLk
 jxSgkkEqhZlW6oJkWsr2tFCGZnwo+rrEmpvzz+KIktIJP5WzANJXu4eU/0YFvfE2OaDTlF2hK3E
 dHFmfexQRPwo6X1oz4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190028

Add the device tree for the LeMans Draco EVK platform which combines
the LeMans Draco EVK SoM and Draco carrier board.

This device tree adds board-specific peripheral configuration on top
of the SoM, including:

- I2C GPIO expanders (TCA6416/PCA9534) on i2c2 and i2c18
- EEPROM with MAC address nvmem layout on i2c18
- Native DisplayPort output (DP0-DP3)
- Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
- ST33HTPM TPM over SPI16
- AMC6821 fan controller on i2c4
- PCIe0 (connects to NTN3 switch) and PCIe1 (routable to x4 slot
  or M.2 M-key depending on dip switch configuration)
- M.2 E-key connectivity slot with always-on 3.3V supply, PCIe and
  UART graph connections for Wi-Fi/BT via pwrseq-pcie-m2

Co-developed-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Co-developed-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
Signed-off-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
Co-developed-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
Signed-off-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
Co-developed-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   5 +
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 778 ++++++++++++++++++++++++++
 2 files changed, 783 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 9553e3aaeccb..11448d8c7087 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -62,6 +62,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk.dtb
+
+lemans-draco-evk-el2-dtbs := lemans-draco-evk.dtb lemans-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-el2.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
 lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
new file mode 100644
index 000000000000..7ac3a867d29a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
@@ -0,0 +1,778 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include <dt-bindings/pwm/pwm.h>
+#include "lemans-draco-som.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Lemans Draco EVK";
+	compatible = "qcom,lemans-draco-evk", "qcom,lemans-draco-som",
+		     "qcom,qcs9100", "qcom,sa8775p";
+	chassis-type = "embedded";
+
+	aliases {
+		ethernet0 = &ethernet0;
+		ethernet1 = &ethernet1;
+		serial1 = &uart17;
+	};
+
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		dp-pwr-supply = <&vreg_dp0_pwr>;
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp0_out>;
+			};
+		};
+	};
+
+	dp1-connector {
+		compatible = "dp-connector";
+		label = "DP1";
+		type = "full-size";
+
+		dp-pwr-supply = <&vreg_dp1_pwr>;
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp1_out>;
+			};
+		};
+	};
+
+	dp2-connector {
+		compatible = "dp-connector";
+		label = "DP2";
+		type = "full-size";
+
+		dp-pwr-supply = <&vreg_dp2_pwr>;
+
+		port {
+			dp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp0_out>;
+			};
+		};
+	};
+
+	dp3-connector {
+		compatible = "dp-connector";
+		label = "DP3";
+		type = "full-size";
+
+		dp-pwr-supply = <&vreg_dp3_pwr>;
+
+		port {
+			dp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp1_out>;
+			};
+		};
+	};
+
+	vreg_0p9: regulator-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_dp0_pwr: regulator-dp0-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_DP0_PWR_3P3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&expander1 7 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_dp1_pwr: regulator-dp1-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_DP1_PWR_3P3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&expander1 8 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_dp2_pwr: regulator-dp2-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_DP2_PWR_3P3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&expander1 9 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_dp3_pwr: regulator-dp3-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_DP3_PWR_3P3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&expander1 10 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_keye_3p3: regulator-keye-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_keye_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_keye_3p3>;
+		w-disable2-gpios = <&pmm8654au_1_gpios 8 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&tc9563_pcie1_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart17_ep>;
+				};
+			};
+		};
+	};
+};
+
+&ethernet0 {
+	phy-handle = <&hsgmii_phy0>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	nvmem-cells = <&mac_addr0>;
+	nvmem-cell-names = "mac-address";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: ethernet-phy@1c {
+			compatible = "ethernet-phy-id004d.d101";
+			reg = <0x1c>;
+			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&ethernet1 {
+	phy-handle = <&hsgmii_phy1>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet1_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup1>;
+	snps,mtl-tx-config = <&mtl_tx_setup1>;
+
+	nvmem-cells = <&mac_addr1>;
+	nvmem-cell-names = "mac-address";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy1: ethernet-phy@1c {
+			compatible = "ethernet-phy-id004d.d101";
+			reg = <0x1c>;
+			reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup1: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup1: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&i2c18 {
+	status = "okay";
+
+	expander5: gpio@3c {
+		compatible = "nxp,pca9534";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	eeprom@50 {
+		compatible = "giantec,gt24c256c", "atmel,24c256";
+		reg = <0x50>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			mac_addr0: mac-addr@0 {
+				reg = <0x0 0x6>;
+			};
+
+			mac_addr1: mac-addr@6 {
+				reg = <0x6 0x6>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	expander0: gpio@20 {
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "ti,tca6416";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@22 {
+		compatible = "ti,tca6416";
+		reg = <0x22>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@23 {
+		compatible = "ti,tca6416";
+		reg = <0x23>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander4: gpio@38 {
+		compatible = "nxp,pca9534";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	fan_controller: fan@1a {
+		compatible = "ti,amc6821";
+		reg = <0x1a>;
+		#pwm-cells = <2>;
+
+		fan {
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
+	};
+};
+
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	pinctrl-0 = <&dp0_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss0_dp0_phy {
+	status = "okay";
+};
+
+&mdss0_dp1 {
+	pinctrl-0 = <&dp1_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss0_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&dp1_connector_in>;
+};
+
+&mdss0_dp1_phy {
+	status = "okay";
+};
+
+&mdss1 {
+	status = "okay";
+};
+
+&mdss1_dp0 {
+	pinctrl-0 = <&dp2_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss1_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&dp2_connector_in>;
+};
+
+&mdss1_dp0_phy {
+	status = "okay";
+};
+
+&mdss1_dp1 {
+	pinctrl-0 = <&dp3_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss1_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&dp3_connector_in>;
+};
+
+&mdss1_dp1_phy {
+	status = "okay";
+};
+
+&pcie0 {
+	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	iommu-map = <0x0 &pcie_smmu 0x0 0x0 0x1>,
+		    <0x100 &pcie_smmu 0x1 0x0 0x1>,
+		    <0x208 &pcie_smmu 0x2 0x0 0x1>,
+		    <0x210 &pcie_smmu 0x3 0x0 0x1>,
+		    <0x218 &pcie_smmu 0x4 0x0 0x1>,
+		    <0x300 &pcie_smmu 0x5 0x0 0x1>,
+		    <0x400 &pcie_smmu 0x6 0x0 0x1>,
+		    <0x500 &pcie_smmu 0x7 0x0 0x1>,
+		    <0x501 &pcie_smmu 0x8 0x0 0x1>;
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l1c>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l1c>;
+	vdda-qref-supply = <&vreg_l4a>;
+	vdda-refgen-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
+&pcieport0 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+		i2c-parent = <&i2c18 0x77>;
+		resx-gpios = <&tlmm 10 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+
+			port {
+				tc9563_pcie1_ep: endpoint {};
+			};
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pcie@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pcie@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
+&qup_i2c4_default {
+	drive-strength = <6>;
+	bias-pull-up;
+};
+
+&serdes0 {
+	phy-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&serdes1 {
+	phy-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&spi16 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&tc9563_pcie1_ep {
+	remote-endpoint = <&m2_e_pcie_ep>;
+};
+
+&tlmm {
+
+	dp2_hot_plug_det: dp2-hot-plug-det-state {
+		pins = "gpio104";
+		function = "edp2_hot";
+		bias-disable;
+	};
+
+	dp3_hot_plug_det: dp3-hot-plug-det-state {
+		pins = "gpio103";
+		function = "edp3_hot";
+		bias-disable;
+	};
+
+	ethernet0_default: ethernet0-default-state {
+		ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	ethernet1_default: ethernet1-default-state {
+		ethernet1-mdc-pins {
+			pins = "gpio20";
+			function = "emac1_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet1-mdio-pins {
+			pins = "gpio21";
+			function = "emac1_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		clkreq-pins {
+			pins = "gpio3";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio4";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio5";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	tc9563_resx_n: tc9563-resx-state {
+		pins = "gpio10";
+		function = "gpio";
+		bias-disable;
+		output-high;
+	};
+};
+
+&uart17 {
+	status = "okay";
+
+	port {
+		uart17_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};

-- 
2.43.0

