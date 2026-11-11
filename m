Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413767;
	b=gWdNaDqfqFW7x3eO5IkkNDpnqZ0KNZaTEiwqZDiZI6/B+zZj4Zf4GDHQ3ceoUFFzPxAk
	 5oUUapxYIfiEt8drEjoYgMGAlwSp6QI78/viNdnYgg0oJp3f0/Iv25LjhmxKkOECQErhU
	 y6lHnM8tj5+RjPLJ2wJqPOZpAnTneF5visHLwPJkcDCJSNDtm/QIMtZRsK0SynFX2tkoX
	 cIsmRA+goL7gE4WZ497WVIIuOrpZ/UvFSq7Pa9ULk4oy+I+Dih1cGbWC754dibW3UT2XW
	 pBinoKChpou3DKnz5PMGGQ3QIvqHAZjkqaFJJI6lhwN7V/2K7FjCJeezm2VGWGca5Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yN8rEZouC3yfilpL49Nn9rYRbZQUqv2Fvy1imuPZoCo=;
	b=dn57ErLuL5m7GNee99Z6eYRcsNT52TYwqvr1W+YQkb2sJ+R2t99etTTo+Q2V/Y/4cnuW
	 KuKHa/B+9RVHnAcEJIcDht74GLfe90DC5jGz1lqUP/DnN4rFBl2GjjgY5liQFLiWzaHnk
	 siJipCOtPqWrQ5qRPp57CQp0HFC7WLsP2VWSghkumzSFgDIRgJE7ub7yazco0lJ3VOOtc
	 ZEXY8WmRiIbPx3R4yAUyD2eObkKUeZL9E1XQUzxPL2fRcvt3pXTJn+dFo5gp0Tq4pgnKB
	 7IlsmCNh0n4DDAsK7K5GYcEf8wKsdhXncWx3ieBN3/7/uRD7hb1aPbjfuGdatYp880Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUphMJ03;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EqQhPN3a;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C9606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6C9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUphMJ03;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EqQhPN3a
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Uq32594024
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yN8rEZouC3yfilpL49Nn9r
	YRbZQUqv2Fvy1imuPZoCo=; b=JUphMJ0330lneS4Ke67Ym/G1OlfGxwhhr9TBaM
	qzZJARTt2KTVr9oBC6yMM1gyGqszmGF9ukpOZ26JDmNUb3DCUIU4vIprmhTmtfL2
	hURWWTVrHopLFC/EOdvLfuyj9NkEtkm8rXvyzXs0ne2khAnLq7sTeGyCFJm8pn15
	T+tuYMHDR0CJg5iVif/L1zayearw518TC90g46csH87sQ0LoPn2frYTAbpki3aLJ
	hQi8GLqYijsiv0T1WkxjZ10tcO8Ol+jIovD5ABFi+tmGHtSlKN0Q/fJD9U9NJTqJ
	h16Bg5pEfxt0IUc18HwFB2Iz4H+Pa5XIDsjNMMEMgk2+cuNA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksma2s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:16:05 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1aa0fb7f157so5328885c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794413765; x=1795018565; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yN8rEZouC3yfilpL49Nn9rYRbZQUqv2Fvy1imuPZoCo=;
        b=EqQhPN3aRrmFp+lXeKnLm8ckKMS3CB/lYJdNvDMsw7ub5yeya18mwwiLkJeS5j+dYE
         WKa8te3MbVRYQ3DohmKjomRpzFWb4CV2IJX9+uMI8+PvWeKTG4uLlAHVeiIv1QJnx3ED
         KW4WYM+4XjVb0m+Jj0TepkTnnbMasoJAQ4RzgMiu86/qfmRzDZI9MvlwdF4G0P8Tsmqm
         lNgJDp/IRd2ynipCoq+Eemp3NrumgFP9Ah64dGikRnSuby9OJisFDElLCTbsinR1w0HW
         6JNBN2OXSTHuvaifF0fa4zr3VH4kGlSVfSIlPtB5XF18F848E422Ml1yAoN+10Fx0BkW
         DYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413765; x=1795018565;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yN8rEZouC3yfilpL49Nn9rYRbZQUqv2Fvy1imuPZoCo=;
        b=gbt8eg61XwFKPN3k3AQKCfKzZm36wIV/xCnPPySQFG1q5KrZFS9/CvSzbMObS0QsNW
         3BVG9674Z7GUzbex3s4l4T8APKS9b9P6q1Q9iJmHZYraNOlBuhA+HbfzaDNbwUafaGeS
         YyY18Uc86VZM7RcA7q1YzjjCqIlpeqNjvK9ipjztGr4FEm3KWeAgN/+ALDYcEwZVy30y
         ZLOzA6zjy0AuA6jDpjMOLJskEGKKOJ0sKNRyu2uw1FgmOqj+Xg+Xj4kUcCjp3ztIAP3b
         Tb5EWzyXW1g/wjCOY/CnqaNQwyPBHxHlE7BLtmHicP10hkHXvwuD4Hqtxwz2JGKO+L4G
         /WFg==
X-Gm-Message-State: APuU4Z/836f+iT21/4wd/qofJqSBFXdEUGYKthhk1eCSPUD3S8PtUvHP
	a613g8U4VDHrVfnItd/R7ZijtOQ+sCLYUCMorC5mLwmT1NNjfM7fm9kYbz2Y6hHMEOkwIoLQ2AR
	c+aqpqp/OJaHbvtwKkheUua5yJHHjtnAcIKnfkJd2evW14fgvObm+qpOrjU+WnYLNQPfu
X-Gm-Gg: AYBFou0k+JNZyIBeff2VkepBTe0gqdb/MoL1uhMAOAWwqmooYJnYyfTEfvbFMSuNsZy
	UT80H5Ei3IXLJC1QC9aJC8thszUboke8/lceXfuVwTq9fSmk95FsURyKTUjeyRwQItW+EzwFrw0
	jYrl6CM50z4ewTPz9ZBho1Oqkln9RBWFgu8UQdjgOwHLj+OeeAYtMLgLJbPfasYbQjfHhMWwctB
	zxuKhYgnpFal2GB6XrF/XztNKsYerZutVKAnbnUGb3UrUl4xfayZxUVlvUFK7TWtv9wMUF/RcjA
	SIBl0CpUkG++xZ35iTgNAAomf2CxHMJB7cSPp3eWOOEaC5qstfEmvHCdo0AVuklB7XUghoFq1d8
	qvhgLSUPqSLL///upL3rORRg3gLKrOsqfSBZXjAUgXiAgtDv1inMK4g+kBGgPw7+YsYBZx0HQgM
	vlY1tkviv0X2yNAvc00b2m5FTnqhIxF6xrydH4L2llynbsFc7Jfe52jDJmSqWt/xzVaamnQVFt
X-Received: by 2002:a05:701a:8148:20b0:18a:8164:ce4 with SMTP id a92af1059eb24-1b3c015056bmr2846269c88.0.1794413764913;
        Wed, 11 Nov 2026 08:16:04 -0800 (PST)
X-Received: by 2002:a05:701a:8148:20b0:18a:8164:ce4 with SMTP id a92af1059eb24-1b3c015056bmr2846245c88.0.1794413764380;
        Wed, 11 Nov 2026 08:16:04 -0800 (PST)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm23548337c88.5.2026.11.11.08.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:03 -0800 (PST)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 21:45:49 +0530
Subject: [PATCH] ARM: dts: qcom: kuno: Add unit address to memory node
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
Message-Id: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALSU9GoC/yXMQQ6CMBCF4auQWTuJIGDqVYwLSqc4Gloz0xoJ4
 e5Webtv8f4VlIRJ4VKtIPRm5RgK6kMF430IEyG7YmiOTV+X4TOHiC4pzjRHWTAHTjg4J3j2xlv
 TtdaaE5T/S8jz59++3nZrtg8a0y8I2/YFspt2830AAAA=
X-Change-ID: 20261111-kuno-dts-memory-unit-addr-7f9fb954bb93
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794413759; l=1586;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=CSzQmEb5F718VpjW29JEnKagjfsiWXZUlmYmt8BWzBY=;
 b=FnK1YiaXFJxbht2Fknevak7wOF2gTBehm4QTIXKU84L4+P5N9blTlHv8WVyrtwPzDQAVQiEtG
 7QFwiGlWOQICfAmzPDYQYWjCrqBH3kui/I/QBiXEw7AFb5JP3sbmKxD
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: 5zYjUUQKSE2dB8iAAwgbUwD7-C4LeXLC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NCBTYWx0ZWRfX+B/CMr/uSg6t
 kElA/NtTBBjOximcWGCkGZE502fIybYjt1cqmsI79e29/TUobKcjVOX4X1I231i05EGpIfNZj9F
 57+7ikXnt/1PRpkALPRIqYSUAiH2czOLnTfyJWuxXKAGuDeA73hNANtcbDr7yxoHyXvKYe1d0k3
 tAFUDOvgZVeeP32zirO71RvlP6Id83U2iQRj2vS0SX3+9nmX6NJJEQ6HDgm4HAef6p6dkHMUwaO
 fcluLCIScQC3kBy27sfx4WMH6Y7My8ELqeMk8qqW6Py5i816ocbKbUgfjWBZUxo8NlBz9fMC++s
 tyAvq48F62vbEGlQ3uDNgemeTBbyDlXnHuda9SfXwfV+YBTzC8NGfiIsqoUNYUOk0VKk+xF6NEU
 UoF8h9e4py33BZDyXZ0xWrL93VKCTIIejEeShK6hirAA9vp5bm1qgyxPChAzD8RXIHNWfyxCON4
 TJQo0WeACmitpzG4OzQ==
X-Proofpoint-ORIG-GUID: 5zYjUUQKSE2dB8iAAwgbUwD7-C4LeXLC
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af494c5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=d7ooX_hxsFC440dZs5wA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NCBTYWx0ZWRfX73HnHX/ji+pb
 3gW5Gd40uctii+X5iAFLsKJTM6Ty6jLB4rR85aC4v17BO3SqWUYKRlnhOkYLgX5lu82pnFNOjtj
 0+XVptEw/6h1Nbe3WZgZGOylRSJPcIc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110064

The /memory node has no unit address. The dtschema root node schema
does not allow a bare "memory" node, and dtc warns about the missing
unit name with W=1:

  qcom-kuno.dtsi:89.9-93.4: Warning (unit_address_vs_reg): /memory:
    node has a reg or ranges property, but no unit name
  qcom-kuno-idp.dtb: / (qcom,kuno-idp): False schema does not allow
    {'device_type': ['memory'], 'reg': [[0, 0]]}

The bootloader fills in both the base and the size of the memory node,
so keep the reg = <0x0 0x0> placeholder and name the node memory@0 to
match it, as done on other 32-bit Qualcomm SoCs such as apq8064,
msm8226 and msm8974.

Fixes: 7f6a63bc5fc9 ("ARM: dts: qcom: Add initial device tree for Kuno SoC")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202611101833.G7LTXoJv-lkp@intel.com/
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
index 9b111525e12b..eb5c1f3630b9 100644
--- a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
@@ -86,7 +86,7 @@ scm {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		/* Bootloader will fill base and size */
 		reg = <0x0 0x0>;

---
base-commit: ae2005cea2e4f84692268e54199bb03f5c6f4558
change-id: 20261111-kuno-dts-memory-unit-addr-7f9fb954bb93

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

