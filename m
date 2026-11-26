Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690830;
	b=TCZqc2S1JatITL1YXHYP62eS5VPSsitgtEUKsUQg+HdlszoHU57AhX2ccykxd8iGLB2+
	 d2Tdff3H9NJ0kUJ2TTw77XoEF6XF3/3gGfTU+MFL/Joza0vbJerlbYww2JapAM8S4e/zw
	 6Bpm35TibeUnBFnHco/80ozT7dWKklWHTUsAYZ6IzKLb3/goyaWI1U6InJx9jSNlyCJlg
	 aZnOSEmfXlfUtp5Ohc2+oP8p81A6jlBu7/773g4+LMwCGmNynN7wphWplcmtSsePQuyg0
	 nQ7/4BrThqysIuWOJP5div8sqpZLj5uy3F/coaRa3zLqIo/nsZEtOG5aQCdhQKsJekQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=l5SIfcklw084WTI/zcukrT5r8aWMbpdgCAh8jjCi+mA=;
	b=DWs0oz7d3ZU0ugIHRkY86R7JcpVgwD6dAFgCXW/2qDV7R5aKRaGukJLl9ylE76WmaVrT
	 HcjyUbn6DQl4Ui6+zl3RKrfanZq5lTztm9ur0tSm0wAZa9pnaGpWNMMelbnhg+cgLKVhd
	 KIN1CD3VffNvMugeMFbDxIDPnMUpRadje6tzScMOALRtBKQrohy3Pz+mV1MI8GsyUJfBU
	 XTkUFB+EPhWj3QyLm/jlVWaKM6IZMNyyEPvnTpsJONn8kNR557LVJGPzr09Tft6r2O6oh
	 n8pKSj+vAAwdJe9kqYB+0zS7LKBH5gDcM/mU6jJ6EB2WHYmRPPPOsY7BWytpJ3Uk4nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b3/RGVBq";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TxfKRKL0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D2606A329
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 239D2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b3/RGVBq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TxfKRKL0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXLMj1369994
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l5SIfcklw084WTI/zcukrT
	5r8aWMbpdgCAh8jjCi+mA=; b=b3/RGVBqmwgkxG15ypLBBHxy1hidEDyQoxKEUo
	62hFlQbhy8mk9SXv5I6vuOOCIEuX20A5Bob4HUvh6xBOF18t3NzKGADXASfRwBxy
	wabRNUMOEyBXZunrm9TpDy4HzueBVx2Qx5SE7O2rWupQAVJhp2V0rqSL5c2Nx/yP
	F8rv4n6gfnekZEQqy9yXML5nwbQTJFr+uxMm4Qh6U/f4c8XBGXVAaP5iSptdHZHd
	0CTiyompt23prSSR3wMamgtIKGFcCJJtXkWhqa2vYlC46CzRsEk91AOk5Cqj1kZq
	B1C8T9PnAiZAM3LJlKX1rsDuLyOHz8OVFvjvJcY41QTF7BOQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2rkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:00:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0381f07a0so70142015ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795690828; x=1796295628; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5SIfcklw084WTI/zcukrT5r8aWMbpdgCAh8jjCi+mA=;
        b=TxfKRKL06cCK4DuUQR2uhR/tSrcLCqkHLsPmgXeh9ihsB5EmI6ryeFZkVDJCUId2id
         pPkdv03ncAz3qvVvFIqPjUOKh6XbKf+oYWe481gxGLdE47MnhXmahicz9J64BKQs46Kb
         2zXBm4VJakC18u3ldaReW0EeclrZYozeJOXhA5wJnj7nrYMW1bvSX13N61+ABXtNC4HA
         X6RA44Yhowtd6f+SADTo5OJ9QWusMu8/P7B2gODv0QQPwtxN+GwfM1pS5WIE79FaJqxq
         hX28vwQbzBsaLUJMo5+ym0akuI9Cxe2KivEFzoT9kKYqXyhRteVxOXFwMXAg0YfJvbqd
         pgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690828; x=1796295628;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l5SIfcklw084WTI/zcukrT5r8aWMbpdgCAh8jjCi+mA=;
        b=sCtKC1ZS9Gl0L24pgKcqtYMWMcbPlyRuFfIPCQoI+f+FyPoADb4kmbz9BfjqRP2bon
         SFs5bgJMwR8RnEJ+HivmEBG+F54cIhcg/R14yYvddF9KkSKHdLWVluVABeDQwwNACqtl
         ehCLR6PdRtl92Z8sjZo7zR//NpUBY4VZPfwGiZTq9ovjJWq2Y2fyMxaYEa8BvDV4DBT7
         ci3p7sDBAnn+CR3K6w977sNw91ZrrodvvS2ch0jgeL/lq3MOPAeiL1Wrq9GmrlSGN/XA
         89m+IzCJPjow6uq12/ZW8QpKK4xlMNcvcPyAUHZM5PED6cHyxQgvF4WJJuCmV0xJaAS3
         y2Rw==
X-Forwarded-Encrypted: i=1; AL+hErEdM59E2rfDeUy7u66mOzDA+pZA1BwKsC+HEJeQcR8xWJt1DMU92VjohPa4hFy404j3caAU1rkA9MWsff6P@vger.kernel.org
X-Gm-Message-State: APuU4Z8dHIkamLIORM/BzKnvS84Qa9nVcbKLghfAGS7ZJiaoXg0xUJBX
	fM0a38LW3/AL2jZ3FYTxXzu1rr/G2fhHFt58wMMOVlH9i8fYUwVkCTe7AG9C2B7DiB3f7jMl/3a
	Pm4QyKPOF8NWhIaRkUzv0D+zbrqfGVPtfBXyZNyvClAUUtMBdyHYSwYxgcEM8hC5WZbUJ
X-Gm-Gg: AZFdTZcfByHxGB09wOFMxd12C2kTtbGYj7FYUN6toscAblFKJcwRlhOW5uRx+oHENMO
	cRr7yt6jLY2ZQkcJhnVelqMKAAFATlvfFilveIVakjR0YDbqHeM0JOLFiKaGym9vhF3IyCYXGtp
	va7NKuGqAaNlb3GU5ZQ8urkyRWXw35yQLlsnt5WI9PZCLuidt5YLY/lqPx3cAMnJk8RaGnsH0HP
	fxe4Ja1W8ORoZbs0iVCmf/cOa6rfgvkqeHZL0PQtNp9iaWvlVwKrrJ7v/fQ++h5OtXWTYmD4cnF
	b6ViOqIZjMViDyaGXC/xho7H6svWvW8SYbEGuff3wfzGT+tXvbRsQA9KGB2dcFmTekcGu5S+zvd
	jdLhFbW+bpTeLIZRfN7VfJV7TjIu+ND2IfSUtDc7dyY1iTKf7CJD06rkMe4Cp7WVncKU8p9EtJW
	0=
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr174815045ad.28.1795690828029;
        Thu, 26 Nov 2026 03:00:28 -0800 (PST)
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr174814435ad.28.1795690827206;
        Thu, 26 Nov 2026 03:00:27 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm101400615ad.17.2026.11.26.03.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:00:26 -0800 (PST)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] power: supply: Add SMBLite charger support for
 PM4125
Date: Thu, 26 Nov 2026 16:30:16 +0530
Message-Id: <20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEARCGsC/32OywrCMBBFf6XM2shk8mpd+R/iIrGJBqzRpBZF+
 u+mde9m4M6Fc88His/RF9g1H8h+iiWmWw20aeB0sbezZ7GvGQhJY0uGlcFd4+hZbfPZZxZSZvd
 BclKsF1y31qBShFAB9+xDfK3ww/GXs38868b4e4KzpZLSMMRx13RSGJS6U8JRcMIFpZzQqiWp0
 Nu6b/rQkjWwsC6xjCm/V++Jr7BFkXOS/xQnzpARF3TqAmrkYZ9K2T6e9rpYbOuB4zzPXwUgle0
 XAQAA
X-Change-ID: 20260827-smblite-charger-for-pm4125-d3168a705520
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mfd@lists.linux.dev, Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795690821; l=3185;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=Egbbn6MpPK4SfNFKa+uRss7dEExa4CDRxOxDLWL7XEk=;
 b=MJlKqNEhwCiPRU2v7OBEyMqj7RJreMUdouoo6UPR8Eh/K5j7FyEhbHlS4tEBFLc5v3RN1+1+V
 0bPxMxOHkzcCeIGRFX/tuNQw4LarCCAdvCOVXP3m9mWhmPogIeNFpIE
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX4CJj1NapMAm2
 Po7qoKnAxEbEZeXdOOtF4hOJk7vIHiUi0sGOYlmpJ3qSdCeVoT9Ot5fTJjTxua3zzuYO68/oyXy
 uyqN+aYUWKk+mg5HAANv0ORmDzFu9BHGQVUF4cqw4M9PAvW4rOeGrPo3iiD6AfQ8f/9iaTnWsV5
 +xY1uxiB/LeyneMTPEfjY3ak5fbKoS5bMJJaDKmrz2XeaLQp59BizyNeqgUo/PA/nx+oRRdng7j
 22lBoNTQ9JHywxZVi/aBDH07ZUzaadMSxvjAmIzZYMLzOCUvA13OREfu0AyevLQWlcR8mmxhxVY
 /c7U75yAPs8Y4ABoHFKTdDxCD3MQ7AhHFUj6CfiT74qFot4N/93r54+h/J7yXRshGOFtTFKVfdS
 UY86LnOqPlJG+S45G06wMaWE5bBFMPRVtuzT+d+6d8cDxAdlaYv96+5wjd1+DLj4WNFcglLCzin
 DEOwv9zUNWa30j9/abg==
X-Proofpoint-GUID: hxKEJeydGhc2nSjZSHOAxMjWd_2HNQYP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfXxlCBsCpf7XCf
 cZatJMjeuBTqMXbzJivjbthhqzCAUEaSUGqQ+nk4uLNSLU5ZRuPpAZte9zKOZcfXV6HVnjy/vJ4
 8cFjcjO9THtObHTTpTluLwzfxm/I+CM=
X-Proofpoint-ORIG-GUID: hxKEJeydGhc2nSjZSHOAxMjWd_2HNQYP
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b08114d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DxrESgKfosCQc-jqPugA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260042

The PM4125 PMIC, used on the Qualcomm CQ2390 platform (cocos),
integrates the SMBLite switch-mode battery charger IP. The existing
qcom_smbx charger driver only supports the SMB2 charger IP found on
PMI8998 and PM660, so PM4125 currently has no charger support at
all.

SMBLite is a reduced-feature variant of SMB2: it shares the same
SPMI bus and overall driver model, but uses a different register base
layout (five separate SPMI peripheral bases instead of a single base
with fixed offsets), a different battery-overvoltage status
register, SOC-based recharge instead of VBAT-based recharge, and a
different JEITA configuration sequence.

This series extends the existing qcom_smbx driver to support both chip
types side by side, selecting the correct register bases and handling
logic based on chip->type. This keeps a single driver and power-supply
class device covering both SMB2 and SMBLite hardware.

This series:

- Adds the qcom,pm4125-charger devicetree binding, covering PM4125.
- Extends qcom_smbx to add SMBLite register support, JEITA
  threshold configuration, and SOC-based recharge, while preserving
  all existing SMB2 (PMI8998/PM660) behavior

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
---
Changes in v2:
- dt-bindings: add per-entry maximum bounds to the JEITA threshold
  arrays, and a dependency requiring both or neither to be present.
- driver: defer enabling SMBLite charging until after float voltage
  is configured, and explicitly disable charging at probe start, so
  the charger always comes up in a known disabled -> configured ->
  enabled sequence; leave charging disabled on probe failure instead of
  restoring the prior state.
- driver: propagate JEITA threshold write failures, require both
  soft and hard thresholds to be present together, and check the
  other previously-ignored SMBLite init register writes.
- driver: add watchdog-bark IRQ wake support for SMBLite.
- driver: treat missing battery info as a probe failure for SMB2,
  matching the existing monitored-battery binding requirement.
- usbin_v is required, and channel lookup errors fail probe.
- The USB-plugin handler checks the charger-status read and both
  charging-enable writes.
- Link to v1: https://lore.kernel.org/r/20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com
- It depends on charger type detection mentioned below.
- Depends-on: https://lore.kernel.org/all/20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com/

---
Raj Aryan (2):
      dt-bindings: power: supply: Add qcom,pm4125-charger
      power: supply: qcom_smbx: Add PM4125 SMBLite charger support

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    1 +
 .../bindings/power/supply/qcom,pm4125-charger.yaml |  119 +++
 drivers/power/supply/qcom_smbx.c                   | 1081 ++++++++++++++++++--
 3 files changed, 1089 insertions(+), 112 deletions(-)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20260827-smblite-charger-for-pm4125-d3168a705520

Best regards,
-- 
Raj Aryan <raj.aryan@oss.qualcomm.com>

