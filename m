Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997904;
	b=aPDFvLY+oOVK1okwOecANzSO3RtzTHhBQKkp/h++pT+DvZXfSg765+vImeE1X3W0ylQF
	 pD2NcIrZ3eXvm18msu0ojJe+LrdsjXXlVY8j3uXgIkmV8yxk6+5KlYGv9UH0ykQzSdTr7
	 Mhd6q7j+zRgdwqlbOz8dsfmr+SCPmZJowYM1w59bJD1T/Sk3hMEHQA0JbuNF5tibgWjvY
	 R5ChlFGz/TKGjGojqLg/G+8P06Jey12F9nFsMswVLaRumN6JkGsJNnOKHK5qls7sdGXo5
	 gMcyuw6wFW/7RWfsYZUgcXn1K4QSNS8+Z4ndTrUy9/YUOp/qm14YUULI/VBJHZyWGdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aZGTDqpFridklIZsangmuxmOWkw+3sKhlDUxn2E4ELg=;
	b=zE1DmU/N7r91Qe0s0tCSzHazh09ruW4auYEYVb1qp2fEL7qKtH5ZdrZHR6QOgLiDsDHl
	 MCbFUAQ1AnniQS8Z2hovtBlzWCM7lrP9ZGwIiEUFpWNpgOlixMlnpNyZ5D7NIfrGFEEcA
	 aUeJ3qoycoahhskytOEqc3a3Tz3ColZlfSW+ufTiGaNUpHqxVv2kYE1ax4eqpKku+hIIG
	 f1kw82AU0H85kPNeCIX2x1QRLaT/73hV5Th0SyzYHKR3FCJVLDRMQ0y5/LPhjwGEGXZvG
	 tmQ23/s5nZTMrGCWBwtDjejVe3B71BHY75XoREoKQ3hQizIR4030SgruO2h4o96FiBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fTkAY3Yn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnEFKFRl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2A5606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B2A5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fTkAY3Yn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnEFKFRl
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kPrK3071762
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aZGTDqpFridklIZsangmux
	mOWkw+3sKhlDUxn2E4ELg=; b=fTkAY3YnQ3awDK6muIx/F+YY1fQiCU5VsrZjih
	crlurRgx4f7Mq7CtywQG9yXrlRPHimukKtsReL8NS1evIhYpd21S63fWurpFajOx
	hREiwfctgCtnS75H1lfhibPGK4U6Bh6datZ8zso1C8IR/mCJJhWH85fAZYzpxAl0
	99hI52Hjkd5Lep6ZxPe7I3TckJ6Wed/CdWdwDarulPAmqQNzHmT9SO43HsQpSyQy
	pf0cUEpGRwJHZ332waXFocWpPFGw7oR4o+AIskeUiCr8or/s6DDKlUk1d6nOA6CF
	WyXh4BDbl6NtE0eytrszSj1gboB4uEMh+t5KTiire4GpyrPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8th80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:31:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so153802985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 02:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794997902; x=1795602702; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aZGTDqpFridklIZsangmuxmOWkw+3sKhlDUxn2E4ELg=;
        b=OnEFKFRlWsZq+m11st3jt4gY1CK+nNg1nc283jWgzkRjqzmsEVAU+f/0RGaevrGi3+
         ipOnXXH0jA4ocSBVqNS9by1Iuvuab1njGZL4sz2ZfTGk6tBvdh52sXxESnnh4x+KXL+3
         mEVkuSvx3IAtDrd/SiZEIcaAuI3MXmeXOdZQ0HYhCabXyrLV7F2d0qfvafs5K3dwqivj
         GNQlCaUjkvZ5f+5zip/3TF57G6nYvCSptjQ7qaNDTEAQScW2uZlC98ePv2a1Ekm3CyMy
         OLgzh/vl6tkjIuTZwuMZ6yDuNZBsqSuc9ovXV9WmH2S1GlJvQn7rbn1p4S5a2QXnMIHb
         jr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997902; x=1795602702;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aZGTDqpFridklIZsangmuxmOWkw+3sKhlDUxn2E4ELg=;
        b=bFyfupn9OqayL58dWFijD5QJBb5qGTY5mYK1l2VPkZnZJcH43dOpj4Qq7attleJd8q
         vnh8Wbm8Ft+2Et/+FrzRyI1pKpRz2qER4/1eYpZofC75cQ9YLsLwmq3Rq6sj+b/sz59q
         RLByKW+cLDnWPELJBVsAQ6eJSc2Aj7Tod0hMD+O5d59THm3wkjbW1v35K5qvNdS/zZ5A
         m3cro+GOtymzEjGQuO0uWmKeIQ6uz6NZwJt9m1dDju4AVr/eUEHBb8vmlQhZfMPLnZdC
         NoBXAi3qEdnfABwIqAJKhMjgw50aR1yJgyqoukZDNuTTgvmEMLZJ3vvhyr7tEPcoj+rv
         tJrA==
X-Gm-Message-State: APuU4Z+DlC1BlRkJn4x3oyZ+XIqckBznmnzbRD4Z4Q09arrDotPQKBpk
	rd3PstWlnKQuJUaykoCQrk2xDUcybAYEwnnIjXFrewl0tYsK939HzA0TC0AINUQyb42Ty7TqmN9
	MgZ/OAbKZBWHmxyaiWixgdCBx0T9tsJ7B7T8KDPF3RH+5gxGHYooMQ0VBr+EAttrFtKV0T3sGvT
	WD
X-Gm-Gg: AYBFou1sQKoqs1aqaYYihN3hVTJe/Rvumbte7EueQXKq/B4Rdy2qSyNsbxicKFc731H
	IcYdGCzGZ1RM9D0yfgXU0jzdrOAO5yBhwyGIOAlJ1TkCZb5AErUXVJxzouk3J9RanJ8Ni1L5r2o
	JxGflelL01jjh0EIqFrID0RcK7CA5c+KYcvGEFAbIxqlQzwUzOGWwYgFsMolpCp2kLEW9uk8vOX
	NNsP4Eec16s5GD9wwSL7yxoer+S3FJTOufI02Sra+dSlevs3mGQ3jQ3E0geBiL4KTE7NkgXR7Gg
	mV13/rpLXoj6YxL4uJUAvGe9ScfYiXigRITq+4Ev6+f1ot5eHE6gw7sALe9PvoaU82Mf9zM8Zs1
	NRWaSTYbmiQKFBeMT4EPwde2Vr13AdIh3ed8rNW+Guack62YhRup+CGycsyb2Lx6HZ72yDw3GMN
	M=
X-Received: by 2002:a05:620a:2985:b0:93e:8614:bbe7 with SMTP id af79cd13be357-949994a7263mr401652685a.12.1794997902459;
        Wed, 18 Nov 2026 02:31:42 -0800 (PST)
X-Received: by 2002:a05:620a:2985:b0:93e:8614:bbe7 with SMTP id af79cd13be357-949994a7263mr401649985a.12.1794997901975;
        Wed, 18 Nov 2026 02:31:41 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2ac6e0sm63071615e9.8.2026.11.18.02.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:31:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:31:39 +0100
Subject: [PATCH] arm64: defconfig: enable the SerDes PHY for Qualcomm
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
Message-Id: <20261118-qcom-scmi-sgmii-phy-defconfig-v1-1-d0c7d2e881c7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIp+/WoC/x3MQQqDMBBG4avIrDvQScFIr1K6kDiJ/yKJzUCpi
 HdvcPPg27yDTBvU6Dkc1PQLQy0dchsorHNJyli6yd3dKCITf0LNbCGDLWWAt3XnRWOoJSLx7Me
 HiPeul/pjaxrxu/6v93n+AY3qSYZvAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=g4ldvwD2lHYcQfrhdeBPKA/Jx/3EuieX1Ckg+Z4/fNI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/X6MEFpnLnIKv7aV9i6+XL/xnYfbKyXdqHFDs
 SAfwvIQ05OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCav1+jAAKCRAFnS7L/zaE
 w5J6D/9lzMQZkW1NovEP1BD1j7EnpCtA5IAPzr96F+aCY0U3kE4+ZIjSBCyhk5qCF8GrldWAjUI
 zvzjyTNWgn7NO0SppuDO+hk0COtkra29xxvMp1fnDe7YNEbCkUBQW+o7NF9KkeWWmOLRyBj8p+n
 5bPv1g6nO460acEAc5XJ5l/eESwWiOsBxwru8GChumTopVrybK0w6eOKI8kZEQmVBxbh03WD2gz
 fPg/v0cEWhOhRtXgrMrehBGGXmUsxr09fbqHDkurfjd+oBSru6JS1jfqq0VewzWppNfSkFWSLns
 YQmW1vNr3i5N1aWZ99J2omUDbGwlqWKOytOVY9rVAFuCjciP61Dpg0zx0AwgsN47QqmczEBaqfc
 CfVlyXwYgsTFU+r7okOzdHOuQLAUYn5MMg4jCY9fHbfv/eEjsW9JCO16JAPzSC3+z49y9PKW2He
 8UlwbdOguYWhgCVciUXd6uBXlRsv9SJQlamdQu1U3o6xArgf9MOx4P5H3igXDFVOzliVbdInuI9
 Vk3LsETACBRtBr8TcTzBgEdtCc3Cj+SVeTsI92k2XyEteAvWUHELYcwWqunZWCts9mVT8aNwAgJ
 FE8hSzKGzPjm7M9QfZbqzkFAcWVEvrttfiB1CtlOky217iXgNPVbJr/zW1GPqD49JRsvg7WXCU8
 IS05Ij0jPj3FJXg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: fTI8vcbuTYN48AXlNTLYzQ84ofE-bimZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfX76UzmhYAqFft
 kmnH1YDa7S1Dy9R7sHRdjEdH/+CaUM0/n9Ne+Z+AWAp/jA2FsUt85U/Wn42lKrVORRzAatOcSbM
 Q4kbN7pY/1Yo8lVtX1pu1uE8qUqh47U=
X-Proofpoint-GUID: fTI8vcbuTYN48AXlNTLYzQ84ofE-bimZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfX84ZxexTmrA31
 a0ImF30+DOZeGcqO9ZPRZBMioiX1ITPGI9c0ROMa23JdSZ9reL7ivyuGNXvRvny7hS5p41J7oAl
 rqp2/PK4tfcqPkcQ9+DmqnWPI9TX40Po9K8K4dKHfmez8GRI5OGK90vt4jd4rTbaG1dv5HOPO5F
 QY9D9OsFd3n8p2J4KUsnZfowW9MFaw2fYRsqgEuMb9lv+pKO3N5GSX/IayMajpAR3SnPzGu+d5K
 tG3cSxR8OifhGyxEAXY0WNpXXQ4rBKUxhAioUbXoqkk23Ek70GLgS+GwK9GGIvHMczaxPcxTiHd
 VFZYsXCq3uxfWSHHfamcKfbcIQJ/ZvIbxVGes8ppoZupKR1g0xU10m+C5gVsvnBYzWvjVpFtrZx
 lk46tk9onYlzAtUeAhwQllHwXWPzQ3YPuDYwg02uE9FaIdGNvFLrJsF3512Lrqs/8RIjmjXAC0n
 jjPxJloEEjC+G8/47JQ==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd7e8f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BpbMfEP1g1sSJNOxg3sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180041

Enable the SGMII/SerDes PHY driver for the firmware-managed variant of
the Lemans platform. This module is required for ethernet to work on
sa8255p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

