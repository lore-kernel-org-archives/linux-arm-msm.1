Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830792;
	b=nPtA6RCMcYuib3W0yRCa8UwoL2vpmoqby07erwL8Nro4b84GWUL7NGBByO8orDgske8V
	 WfEz3MFB3Cu6X2bnuMnn/d3Ixmn/TO36Hd/CAfiOJA+DwMBZE+UKhDrKB2XkKxP3SH6VH
	 qcSLhQmiZV8TlzcIw3bPoa6p5np9rOLAdectsuatah5nUNABVuMfcG7Dr5V3chnb+M7gI
	 R0PwN1vQdoyEpmhW60YXYXsxo/Zn/Wh+7UudGu8q0Hu45b1q/sAIwUu/mpIo30ZJAk9IH
	 WUcSToZRidzZ5WF5h9nY5RDfdp7YkWPBfYaFdQ2+3xbKYLq43o5DCMJbStVBoiWJ47Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K65zJOM7yXz2ZJG/65vq5wsABpsITZPvfV/fVemLVYk=;
	b=yCMSOkM98XLhXTsbAK4eFHHClXHZces2hZF1HT6+AjMh+P/TpDAr8qkKQjTS1yfcraYG
	 nEabn5GNTzHqOhYD5L45suLk5KqpARQS+9uc2PF05SJdYJdWneBUJv30UPQG0aevPUJd6
	 EtNdL7Qlh3t7YVzqxf2DRJQvBFrHt2If4A9+ORFeCBFK5McQ5gJeVsfje6bLDtJu4nppm
	 c1V+sWP7r7vISFRmV8GGRwXLs2NwG/J9Wy+Yray50u9VLYMDQSkcFxD/ZbWtPicZCGaQY
	 J/Xjr+y+X18OM0aC0K6OQn3iaJ27xnImahfKGcrpShBJ/T+CH3YIUWEcy7o2t8zzBJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1waFYlH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etq4j8gJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14F9606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E14F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1waFYlH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etq4j8gJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1mnC1690336
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=K65zJOM7yXz2ZJG/65vq5wsABpsITZPvfV/
	fVemLVYk=; b=l1waFYlHSGTWaKV8pcYoX0CPS4mxcsvQDIyPi0/+nQ7GJvpnP+N
	zGCTak4f3ddhLpjs4WqEyKaBKOUtICqvCfLxXS8HOjZT1jbaf6JqW+rvREK7VQ0D
	QHQlnJLRqKD5QeOWcV/JCUcEb066vi3nTOkZGZ8OBfSYgb4iNe/UjGaK4aFQdivu
	5UadOVYUdotcYxEVh97UOQJt3W0TNg6niWrsbW6vu/CRlf+ePT6e/Vsr7rN1+/fQ
	0auICp+vEWwosnVQG+1KVGPicMH4O/s0Q3eHFVRvZBJpaJ0j4i493R9ACD0/KQPl
	IcHTbwugVc4pXcBjPUHHpGFVvaqvGJFSNGw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc21x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:06:31 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b45597c7so1446647c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 04:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794830790; x=1795435590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K65zJOM7yXz2ZJG/65vq5wsABpsITZPvfV/fVemLVYk=;
        b=etq4j8gJm602Kb52XsWBCeLsdnPzn0XQsBJn6ioMSxlsQk+wIV7C/i+i69uWjbqulD
         /mDs+971ar3IdbXJuWBvMNQiv5kU8DdL3KqZY353eOxKWDfUWyGn4XW+NLDzWLNxunnV
         7QdG7GS+7S5HOh1bs3+SoHawKU6ZobWP6tE4CLeWXdvgFhHRV6cC5jEv1zXfjoCdYQMw
         RqzO/yysHJi5dauHVJtF2ImBAIwkN+pbCp0t41FzOkNGoAS4bvK4iOHV/WABSvDxyBvy
         Azvd4dyRaz9E7euEOg+jbl+fEXHDBBD6jA6zySXk8OcsMTUiPu/u+I6v2eBbiGrJF72B
         +ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830790; x=1795435590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K65zJOM7yXz2ZJG/65vq5wsABpsITZPvfV/fVemLVYk=;
        b=u5p4tctkhJyjWL05G7O/AusEmtT/7fr1xz1jl8cmPRXwydyTxmGuc0AAPyO5UDPOki
         0eS1/tyh2TLcM5VMgfNDchhvAOKcNKdORE4b0swcZyqzHUCUSmmyj9ZQ6D6WgZ3YRzHz
         K8QOvHww1+9XlpiTDRtCP8VW2lA+GL8cXVZFeBeGiKfQC4OnEvArfI1HeOBjxrm3Oc+3
         3da39MHTrBtfbs5jxOppe3stpdD03Ibn7sCc7wz5cN+qrft2S1YSQ/xC0hu+8Z+zkziS
         Nx6JVyrpzPACw2q34zKdAMtOO4429PwqvHSO7o32ZjUsJM++n4UBe5UnTHVYnjGovkQU
         k8nQ==
X-Forwarded-Encrypted: i=1; AL+hErGUjgKojK9TsUr/glsJ1mSeLG5Qo79w1y5vviiOQgZeW/kCUr2T8SwvGVOePW6s6HSuSH88d9c3VOi7jnZ2@vger.kernel.org
X-Gm-Message-State: APuU4Z9EyuBYs8unENcz+hk5c4XBxmgw5T4KyvmWLNW4GbSb8p3BXw2C
	OmrxybFG4teD28KAHqJBoCCeT6sOZ4ZkmqfaptL0UwB8HeZbJMTlXUi4/cU9hh80pBem0N+zKDz
	4PUl4qm1w9Kq+CrMB9pTnUE406/gODkCwlcI5tBsCXIqbXbrxzsA8tZVr7cWWGyB6wfrs
X-Gm-Gg: AYBFou3pYWZWwrtELoxDhnqLlMrwwBVoKbqESdSgmKmU4yivqI4VUt41s6xJaGtZ35T
	1i5B5kN0/ALJf/oeXPY5J0Pk3PJqmzWcvi3hu9YwwniTSKTYK29YueYQJSQ2szU1ONFTa5w+FlY
	/cwc9QJGIcQqjifAyURxj9U4FZAMlZddREw8E8jo2KTDHUcStbDbBuJfYgrxy4Xg2JcIUVcH9BV
	hCesjIaZ6A1FjH82ESbSHxyguCKlLRc6AA5nbcACPZWKvz9XtBw2ch67j6yc/eS451GoXGms6mS
	F0r5LOzpLCMf/GAlgJ8XQ9ekIvd2neljv/tMpdqOA/gMm1ieHafVD8jm3fQMMs543niu/dt3MmA
	/Imf2ZNUO+4ef4lm4UEvYVWAZAAM7XsHu2RcrjdffEkZ6izqm1UVqQCpXvLP1J1gtDvlZ0rrK5f
	iyuA==
X-Received: by 2002:a05:7022:170f:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b50311cef0mr10975403c88.28.1794830790273;
        Mon, 16 Nov 2026 04:06:30 -0800 (PST)
X-Received: by 2002:a05:7022:170f:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b50311cef0mr10975389c88.28.1794830789589;
        Mon, 16 Nov 2026 04:06:29 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm36961530c88.5.2026.11.16.04.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:06:29 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 17:36:21 +0530
Message-ID: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfXx+vWBitjbSRI
 uQMZ5vQpB7pHGlUD7MljHjfwx2sfxUFhTBZbck7bnyt2xS9/vndSKJ1kqJrqSiRDuUs1zObxWtf
 bt3xDyOMskHTKYIQGLchnwuYMQ2FN1k=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afaf1c7 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oVCAav2c3y0N_-OfdZYA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: SBj0FyAdM9lWoIjMTu09q_02cCyt0da6
X-Proofpoint-GUID: SBj0FyAdM9lWoIjMTu09q_02cCyt0da6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX2+LNLJcf599c
 VrXcFo79tqSC4DNNhj5ieQwytrKOav7GZHV99McoWoBvj0WYHrgRaT0M9KP/izvleGKprwPSMAB
 veLOPyXTouv+rQFp/G0Rwkq/ZCpmoi90Rvaz/g1YiWRu0ZY+WFmr0blr7/Ovj43i3zMtDu4awe3
 uY5s4Q4yPANS+9g5LdPZ/WuzC8apXeLZaTWIQP3BXnFf6Cfm0oZVvy69kpA2YkwEj6WkYvMIU1O
 AHS7phof1w46Nk32JSfuKwFclXbXrXF/i3G37bogMOQkg2rzIqFUPP3hyqV2hgv6nWnlUmK9R8G
 opuw2s2HtuGwPbrgW/6YBCli6eQgAMJ6gbeH3WZWwzn7M5wrvAcYv8kPBe20v9ATGa2shmiI1td
 8eQ+QS2YtNYo1TABjRy+qkX09Htzq/yyIh3KQMDKk8778z4Z0ITC9q7Q1ZFlkyv1lu1I0nIhBcC
 SnbeQjkKWipqwmjWlAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160048

From: Akash Kumar <akakum@qti.qualcomm.com>

This series wires up the CYPD6129 UCSI PD controller on the Talos
Lyra EVK carrier board, enabling USB Type-C role switching and
SuperSpeed/HS muxing on both USB-C connectors.

v1 was posted as a single patch [1]. v2 [2] split the change in two
and addressed review from Dmitry Baryshkov, but went out without a
"v2" tag on the patch subjects (only the cover letter carried it),
which caused confusion with v1. This v3 resends the same two patches,
correctly tagged, with no code changes from v2:
 - Drop the VBUS-boost regulator's resistor-divider math from the
   commit message; describe it as a plain fixed regulator instead.
 - Replace the verbose HS-routing explanation with a short
   "/* HS only */" comment above &usb_2_dwc3_hs.
 - Drop the redundant dr_mode = "otg" on usb_1/usb_2 (it is already
   the dwc3 driver's default).
 - Move usb-role-switch out of the board file and into the shared
   talos.dtsi, as its own patch (patch 1) alongside the graph port
   placeholders it depends on.

[1] Link: https://lore.kernel.org/r/20261012131518.858396-1-akash.kumar@oss.qualcomm.com
[2] Link: https://lore.kernel.org/r/20261116114908.1701258-1-akash.kumar@oss.qualcomm.com

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>

Akash Kumar (2):
  arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C
    muxing
  arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports

 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
 arch/arm64/boot/dts/qcom/talos.dtsi           |  35 +++++
 3 files changed, 187 insertions(+), 11 deletions(-)

-- 
2.43.0

