Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34A13CF209
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717361; cv=none; b=Vz8+hquwpwpWYke3OacnUerHBJGMrHQAzjMUkgllnkdhulk4JuKnZ8Yyb2T0k/vJ91VPVXaXtEvHFo26Vm6fysJl3MQFcP/S7WUB5OKJW+HCQhKhBC+Eq9Fzhppo2dcBiJXte4vAiYkOkmFVl2dSjAF9AyYmpOnwHy62EQlGgYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717361; c=relaxed/simple;
	bh=1iIMMHMsXAzUL84CKhJyMZ2CgHGf8u/3sHaJi6YI+JU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DoG3apn/PQ2QJfUXXR+Ufp/E+4376a66e89fPVZxhQNju0cfDx/CKWguRTPYu41DGqLK62xDddaOEqpUqSb3LvPJr2RQPulnNEiTJHE3Hlz+twLHIPX+LD8s3j2MChmJTcsrEBdXXLw6g/mImtgGuCheXvJqPmIMm6F+RU9yg7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hK86vzvi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEfKJHft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hK86vzvi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEfKJHft"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDxm271100985
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RDO/ZcufG8ThBucDxfrCcb
	9sWZ2G5gN/jVpu+8tQXyw=; b=hK86vzviUU5wXbq3mxaInyrvh9oH2c9lcCGQkQ
	GbZke60j1wnes9e6v3LukdJx36s6DIJpQq5f9FEKQ38LJqjZztDlznmGLn5nu6KT
	CILdRGYOozC0TtJTsIdFbJVOWnPo9sxdZ2NPt6GBzP+5+cBKjlFB7PkmuaI5GTaV
	Rw9RVBnz/x/xPHTYF9J1I4zHcyQ1RlVw4+nKL+EVlHJSy5H8m9mHXPDCAndJGQwc
	sjpYGFaLe1+948WuG+HBnyiZFdXyrjXhThYipT7iXZgxN2UTqE8IeZefNmWDq7TO
	tNbSKPN4aZwAGXeE1mtZaDtgQI/YNv2Ke54vSscw3yxKUHiw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1m42kuxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 14:22:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848662cd2a1so1033370b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786717348; x=1787322148; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RDO/ZcufG8ThBucDxfrCcb9sWZ2G5gN/jVpu+8tQXyw=;
        b=CEfKJHftinhf3mzazSQX4jouglYwgM98K9wkH0bAN2Sd+8B/8c+wOz8tK3XsDMoDdc
         mIZRNQ0gG2rRKw0GOvmC6fJcH4O0ZDlxoeCwBDDjH5OOs5rYg/8+MxWRGLowXpv0Gk2y
         5VlQI746TlEe0jypcfMa438gqL5/he0476zP3j630OF8cPpBGi/IG6lfXJEp1sk4om0O
         dYSCmsKX3SU+PYDtS9S0TjW13Ny9zYQxAtSxb/4Gg/py60FTBQKSlFHjyebUKjElmO38
         DZdmZMjBcMBI1qTCQNnkoDzA2XhbVGow1iPpam/o0Sth6CrXNU3avIks0vozlgXlz8A+
         VLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717348; x=1787322148;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RDO/ZcufG8ThBucDxfrCcb9sWZ2G5gN/jVpu+8tQXyw=;
        b=mzHKhJzc3hjh0XK7kQ8lN6kwDeG3czgUEnXTsJE3bz6DEaVMeXXMNN/UhheVFVEULP
         g67mOndW7pzsusFxvJjL2wvdGsDX2yhfKrdS26belkBcPAZTVG85IoiHFvPisnWpZrqN
         O411VKeM7OCEff9R3ptXhv1r51RN/loOtYCRIvdEWdK7UbPuFY0Qxk1m2Q8i4EcVlGNT
         3VOWo0lQEpLYALmj3xzxR/AzZ0rFMKJYDuVvXqZoEoNxcG+PWAe03O4vf7thFP0GhxDG
         XR6eF5mLNnq1rD/A3Q/VzuFiqJeYXeLbvR3AVC8BG3Hv8FyvJy3hq4xQl7X7cFcaLBlz
         YPrQ==
X-Gm-Message-State: AOJu0YxK6HWduevg3xvg3brdTn76Qq2Cgou5vfC7CZgPLGmbzdaXPUjA
	6n+5p3epuaPgMUrG0bLxfWRg6FMa80LU3v081F3gGel1cwRsi1E7YyevMKU/Ee3UpEG9uOJSzv4
	fGB/Hd+X/smml4LsHX0d0ip5whUXKldGJNYjOyaGkpDVdIdoBbb96NBFTa6c8/a2ifjTd
X-Gm-Gg: AR+sD133T8q1KZIlMhTQqrCjOkMy52BkJTS1qnBIOiyG2lR5oS26StnZnp3qnuoDLIK
	DqzZ2EY9wMuoQ/1Cm65UzZKXonTZ0PIst265KoNPF8sUQbUuxemFvU4kToXy19a1AnrbWjpJ4zj
	HCBsMOhgT9wX9VxEg3gF3iuru8g+HPvbw6DZryshaODPICQmh8LpiZMbiC160CKmK894qczivBX
	DPABoKCCL7+R20ofwSlmnj+ARJtVPXvzXRsMGR1j1XaGv2OTq9ZYp7x9gLflchuahxO2uHj4vT3
	8XS9BYulhwpsBrfeVwxubjFnWnZS4KAP3C3aelf9qsBV/FSm9732ILW/lTF4QX58EaY1ObB8rX4
	1P2JylQEu4WlLNtC1CYbsNy1oJBd5/98/q1wGo47ajrQ=
X-Received: by 2002:a05:6a21:7702:b0:3c0:eeb7:28b with SMTP id adf61e73a8af0-3cc7196e821mr7898614637.8.1786717347596;
        Fri, 14 Aug 2026 07:22:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:7702:b0:3c0:eeb7:28b with SMTP id adf61e73a8af0-3cc7196e821mr7898529637.8.1786717347062;
        Fri, 14 Aug 2026 07:22:27 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ead105a9sm4895520eec.31.2026.08.14.07.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:22:26 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: ipq5018: Add MDIO pinctrl and
 enable MDIO/PHY on RDP432-c2
Date: Fri, 14 Aug 2026 07:22:24 -0700
Message-Id: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAkf2oC/42N7wqCMBTFXyX2uck2y1yfeo8QWds1b6jTXZVCf
 PemvUAcOPCD82dhBAGB2PWwsAAzEvougjoemK1N9wSOLjJTQmUil5IP1rcl9sNZyLxsHfqyx86
 OoeGVhkxo0BebOhb7fYAK3/v2vfgxTY8X2HEb3BI10ujDZz+f5Zb752eWPOpkQDubKZNWN0+UD
 JNpYqVNorFiXdcvgSNRX9sAAAA=
X-Change-ID: 20260811-qcom_ipq5018_mdio_pinctrl-f9e609e97c3d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786717346; l=1816;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=1iIMMHMsXAzUL84CKhJyMZ2CgHGf8u/3sHaJi6YI+JU=;
 b=B/c/EoFUC8bdPBdCXuWw9K1+u1COARgLlt7E+/moTBDGr4TcIu287kJBP8Wx5ZWbakUoeR9iu
 sd/a/oFxl/YBVpiKpIOOuMcxALUMzY9fpr1icNm1gXn4aCxMESf8uWr
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=I+dVgtgg c=1 sm=1 tr=0 ts=6a7f24a4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_9f8UQ2UEQgcCYNCZg4A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: FwpGeE7rRM3Ih8Ha0czSUBS7Qt7R59sl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDEwOSBTYWx0ZWRfX6CkWh3ChjsjJ
 DZwDteRgFOwBn062kParV+SQEofR69HpKcBrZFbyF6WKMm+AJmsixRVpK+BiUB6t0W5MuZeTSJQ
 6j1rhDSjedNwLurNnSjUdfaR0W8frwgYQ7iLskC7Th76AlofJb+L0rhVVmqlb9tNxn8dwuXMb/u
 qxnVProOjtqKEpjuJ/Z1+SmH2Oh778o8SPpE9CEBJTZtJg5ogV6KQ6lVD8ub/6Juup2rYtY678S
 hxOrzHbCwnIAF4FjctKHoSG5s7bkLlJYA4TA9dKHiyV+/erjo11pNByD9EuyFYMB4NKUAzAaZdx
 aOhNHnnOD7c0wijFqGiumGtb53GewZAUmPPF6xbKjzYCg5HR+phdIMkJVkwDKvpfkZI8Ibel2rH
 xB0jCMT14Dgj5n9SOcJfD0AcKTfwrZAqMZh/TKZFUSgex5RJTlJ11UtayIvgL0IvrW8UD6sJ7jT
 I/0RCwC7d8PvdErx/4Q==
X-Proofpoint-GUID: FwpGeE7rRM3Ih8Ha0czSUBS7Qt7R59sl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDEwOSBTYWx0ZWRfX3O+yTFnn8j/r
 wNwGg8hUaG6fuksX5TfQTfPY25IOK6m7I7JK6jP54Dq0fVu3IHDcmhoYVgTQvOjU3X1ld3IIREX
 oW1hRhF4AD7IcBjhtnWHdbwZEwex1hk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140109

This is v2 of the series enabling the two MDIO buses on the IPQ5018
platform. v1 (this series' patch 1) added TLMM pinctrl for the
external MDIO bus (mdio1) and is still under review upstream; it is
carried into this v2 with a clarified commit message noting that the
MDIO pin configuration is identical across all IPQ5018 RDP boards.

v2 adds a second patch that actually makes use of the MDIO buses on
the RDP432-c2 board: it enables mdio0, used by the SoC-integrated
EPHY, and mdio1, used by an external QCA8081 PHY, and describes the
QCA8081 PHY node on mdio1.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
Changes in v2:
- Patch 1 (pinctrl for MDIO bus): no functional change; commit message
  clarified to note the MDIO pin configuration is identical across all
  IPQ5018 RDP boards.
- Patch 2 (enable MDIO buses and add ethernet PHY) is new in v2.
- Link to v1: https://patch.msgid.link/20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Luo Jie (2):
      arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
      arm64: dts: qcom: ipq5018: Enable MDIO buses and add ethernet PHY

 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi          | 18 ++++++++++++++++++
 2 files changed, 32 insertions(+)
---
base-commit: 2697ef8943c9985c14708a6429e21812693857b2
change-id: 20260811-qcom_ipq5018_mdio_pinctrl-f9e609e97c3d

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

