Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E808742E8E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240042; cv=none; b=l4GNkIbZAKTL95j95STRpD9H/uv8u52bTctSwT4/8fMfKXqAtQlZeTXWvHc5PrKXHpBf00JhwU4+VJ/13TLz1FeQv7NbnZsZwb/kvjGMcc8sEEL9dfzUqDy1qd8g7Wtslvg51+Mz3SvLHWwNzjnmec+osmfpOg8NS77XTWX4LQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240042; c=relaxed/simple;
	bh=lWw4aCEzKRSXQ4wL1WB4sTQS1+TuOPXYEegja8UDOKQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aI8mHIsgaLoxHB5AztsPflQHH7yXnH1XIO8LEVfGGqiusW1otQt/v4RIT7hBZAhErh4a+AjWc2WCGpvxRFkB8mzdn/LM3cWJt8b0SoFUHyKlXGO+rZIxjuyflfEYBiUZOPDI7V1v4BuwBxBJoOTeuzNjJ9yXMQ6muB9yMYTA26c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FY3/txdv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUYUyuuw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FY3/txdv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUYUyuuw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHIZ02367295
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J5WA8sV9rVw4QJgbQp6cPC
	PXpbFD3gzEw6RjSQBuxqQ=; b=FY3/txdv5O6UfwuSTlPimUYs/GaDm9LvVT01Xc
	pFrJvw04+jU3B8Xny5UZhT7Ed07AWBlcRQviLj7y/1LXyblqUqDhvPUgX1Vg/Kou
	SOlKi9/7c+zWmtKX6ELH500vM7JFEt49kZWL3JUYIDT1ELhId/lB1V+7KIWbEDQB
	v5T/JeaOfrvJaufPd9uND6wGWP69bL5SLqyv9klTNKQQLD/nbvr252yNZvD+S5Ha
	t0sAdGYFGjDu41iu3hhdfGTsZXoJgQzTt6bQBUK+u5ToPUjhE3DJisXg8tj98+Uy
	Jlno794z6GKAgFrTf+5Xvwq7v/5lddKA8E2Cxu2IkJ5V2W5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8c661-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:00:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfca8558d2so12867305ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 05:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240039; x=1785844839; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J5WA8sV9rVw4QJgbQp6cPCPXpbFD3gzEw6RjSQBuxqQ=;
        b=fUYUyuuwu5lm1/n4ogCvM/zmnIeMV930XJRt3OEebL/Rlrek+f7Rj0ZG44QYlNfTGc
         +SJlQOFsmfbgCSzEgTvlcxR6qDdM6X063TK8wvO6oPLsRgkd9KQYDajgU4jvAKbcjo3O
         DGP99p228hXW68rHcmmHA2SFoYTm1xU33miWQIErqtrTFY8VHxe0F01Tx5Ass3uTzMIZ
         1557zdN+bfIBFMlZV2hwNaSRt3cGtrRBP7pGDiySLQsKOlUPkBZ5380GPNvDBV5FmUFX
         MAM9oodl6TF2uoXj7nZXoQXwh6qbokBrCFbFJDMlpnOYU6SLaMOIZYpp5FHXeZbznOvV
         BL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240039; x=1785844839;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J5WA8sV9rVw4QJgbQp6cPCPXpbFD3gzEw6RjSQBuxqQ=;
        b=n6FzbhuNGGBgdvCu3vSMdmU6DrT7MyAMuZHvoAgmrePWkiYyNWWxvnOPx4imb+pnZp
         brMmcpbuTT8zgdEu+NnXv+XqFkPFsE6aBjGgu/5X96qIoTlYHzsq4FYd4ngDdevD5p1m
         B0NtVHffE1CRSlrDTiqB8Pwd85cd/uzWCB93ImlnM7KyipBwyjFA2zLLrzQaH9x50g2p
         RgzQG4dVg/uOhB2Oi1LorgDxTMx05xQFOHbAhM3jSiKyFDi6Z7lQ3NCc04fZPxNRDwff
         xEqSne1h5qkMHqCvWX5m7sf1+SO1tPuiXRGAjY6yQAcpPDUcUdZ46W6rZdp9ZIejVtzl
         JgGw==
X-Forwarded-Encrypted: i=1; AHgh+RrkQ/gTQjWU4cEm1gSR3JvXap1cEGHmJaZ4HmDoNdakbNJuRsqSVL1AXF4TH3SB7Yr/mUmZl+TD6bGkUOMe@vger.kernel.org
X-Gm-Message-State: AOJu0YzriIvt13w0AkYaA7gcwh0k7oCSeltjYLWNzrLXdjYzsxt2irCR
	5fN9zpWldd8GDWBz+rTgPGLj9vvRkDrGQPqhqUb9tXg+Hf40R5cWQe0gu6MbJPWVrYAObF58YFB
	NPz7FKao7C7TRJ6GR+cVvCnmigs8tnzPpg87Yw8OjXHjYI0HIBdYH94Ghr3wIUzQjF4l7
X-Gm-Gg: AR+sD104eBpwWBKx5kIlMardtpIY/3STC1op1UjyLRyFzGcUlJVXMXBZwSFytHFCxqj
	uvZV3+XmURWFuY7W+QwZLvwJTuSQmYWUNRe4U2f0HpIIT8tXIul0D20rr/nScXH+l3wkVsm6uZy
	ivPSuILwdqnDTrjRoxCJOywXTsk/5wFVtBjAwIBJByYo+r4huf1U9qTywtqV+tRP16UpT+gyX1J
	OicIRkAA2Xn0J4y48f0wLdDZvCDGudIBYFmLYWnGX6Ibc/cH03fEwBA7jvbFlMm5z/4k+tNcWPa
	u0CJCdCosr13w2Ld1S8cLuQ+n7S8iOcz8hKkHZ6PT/mmuwUy+m4L6+dGzy0dEcPfO3wc+cBAzYb
	cYKW1z/zWJfbh/a1LSfmYw0K4bg==
X-Received: by 2002:a17:903:4b48:b0:2c9:ed16:8d8d with SMTP id d9443c01a7336-2d015d54a78mr24953395ad.38.1785240039073;
        Tue, 28 Jul 2026 05:00:39 -0700 (PDT)
X-Received: by 2002:a17:903:4b48:b0:2c9:ed16:8d8d with SMTP id d9443c01a7336-2d015d54a78mr24947515ad.38.1785240033823;
        Tue, 28 Jul 2026 05:00:33 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbe01sm51764895ad.48.2026.07.28.05.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:00:33 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: [PATCH v3 0/2] arm64: qcom: shikra-iqs-evk: Add LT9611UXD HDMI
 bridge support
Date: Tue, 28 Jul 2026 17:30:15 +0530
Message-Id: <20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANWZaGoC/42S62obMRCFX8Xs707QSBpJa0rpe5T80GU2VmNnn
 dV62xD87pHs3EpcMIiBgTPfnDnouSs8ZS7devXcTbzkkseH2qhvqy5u/MMdQ06176SQRhh0UDb
 5fvLwZ5zugb0lE8joIFNXJ/YTD/nvifbr9tyXQ/jNcW6IptjkMo/T02ndgk33Spb2jZxmOG8us
 CAQaN17XTVWJfFzLOXm8eC3cdztbmppzIvW6ihCikooh9Koof862hwu8sODRfsvQoIAZzw7Iim
 p5wuI4/nKiR8PNbr5fHoXfGFoojyvVzHKQEM9kF2MwTOiczzI5AIr1oTJDr1SntopOy7FnzJfr
 76/mtKfgtkhLKa6CszSUFK678MXVz/+QxLqnZTLPka42x9qXagCY0TlpEk6kb8WaIT7DNz6J1h
 0i8x5p40fUqJ0tTk0sJ17g1gN2fYEWCLlUVtFQ7yeoy79I1VxSCjkEH1PVlzA3R6PLzgGmEoNA
 wAA
X-Change-ID: 20260618-shikra-work-ea756b564b2d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfXze3wGBmS4vGL
 kx5e+9ZF7dd2FsCLR7pkDU/jsgSgqaEi4NRLONXKg7x2ss/njp9pPvEeyiokOnGJWqXU1wTCO33
 ilXZ1u5hYBzywG7bihAEigl9yvj3bZg=
X-Proofpoint-GUID: IpCWeBtKYjbGLVGprIC6LM9rrhWWTEY5
X-Proofpoint-ORIG-GUID: IpCWeBtKYjbGLVGprIC6LM9rrhWWTEY5
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a6899e8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RZvIpwVH2f1tXK-yvfAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX/84LRIJIu70R
 pq4Kh/+HyvB8Ykm8jsZX6dnkSK38pTufitn4Hv7eCbLG6AI6mFc72d+DLf5H/mMs6WsDtM9y3qp
 ilyS2FyfAYrMnG9MlgKVTI1MgnQIughlGLcSJiYoeK/lAdA2wdiADjyejWsyjhfXMHRrYBhSJH9
 ceuaTdHZsmf4qNXaDJgBPYeQvfURP1dHsNbQQrYpOjzxvuqjYcWjcwT8TNfcV8FjnsQWSKyTXza
 AavNijSbHlVBUH3+dUper9ccRrmOL2DtzKEIY2o9/odh1Zt7muVqto/4Lk6rZbuTqOzT0xnh2jp
 kuZssza8CpiX3HY5wsrEoSHpzzh33Ol52mweck5XpuR2wPJvdRwQj/GuJGQOmRERbAE7th7Qsmy
 LyMott6JQogtAUgLYvO11NlJKjO3egGTchodFC4lpWpgwGDOlH9s3XoASgGwaiWYt/OPp8HNwQ5
 vmV+SRnDiJGO9+FVASA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280105

Add MDSS display and LT9611UXD DSI-to-HDMI bridge support for the
Shikra IQS EVK, and enable the LT9611C bridge driver in defconfig.

---
Changes in v3:
- Remove superfluous comment from pm8150_l11 regulator node.
- Link to v2: https://lore.kernel.org/all/20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com/

Changes in v2:
- Removed port-select property.
- reset and irq is aligned as per driver.
- Rebase on top of shikra-display-v4 series to pass schema check.
- Link to v1 [1/2]: https://lore.kernel.org/lkml/20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com/
- Link to v1 [2/2]: https://lore.kernel.org/lkml/20260618-shikra-work-v1-1-dc30381263f9@oss.qualcomm.com/

prerequisite-message-id: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
prerequisite-message-id: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
prerequisite-message-id: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
prerequisite-message-id: <20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com>
prerequisite-message-id: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>

Cc: linux-kernel@vger.kernel.org
Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260618-shikra-work-ea756b564b2d

---
Mohit Dsor (2):
      arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD HDMI bridge support
      arm64: defconfig: Enable LT9611C bridge driver

 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 117 ++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig                |   1 +
 2 files changed, 118 insertions(+)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260618-shikra-work-ea756b564b2d
prerequisite-message-id: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
prerequisite-patch-id: 3eff04500c55100c763aeac1f1f8c5768d500500
prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
prerequisite-patch-id: de4327fcbe81f92a337f429b74e8220969a5b79f
prerequisite-patch-id: e13435365cba0b6ecfcea6d9e5ab72838fba23a7
prerequisite-patch-id: 90f78668eb969c16ed8c2485d75a60a183fc4b8e
prerequisite-message-id: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
prerequisite-patch-id: 23b24fb512c882a045ed8339b22269bfc2c5d02c
prerequisite-patch-id: 0e79e46bc5a88849a2f0a410b39c08f3244dfed3
prerequisite-patch-id: 17b412a37859fba801efdbe451db31e5bd77438b
prerequisite-patch-id: 0396ac157aba73a5afd7ba4a8a744847f5a7b433
prerequisite-patch-id: 2b1aecd97b9c073a1b323138cd7a98cb34e3715f
prerequisite-patch-id: 823bc7bc713f6fce1b9de47a266307f1829636b9
prerequisite-patch-id: 1b990e46422307e558300815c1166b90d96fbb9d
prerequisite-patch-id: d78e0b95758b82977d80c7cf18da49661cd181e5
prerequisite-patch-id: f62b00cd64ac3191e0906514443dd43e88746818
prerequisite-patch-id: 0fab99455f954a917fb65348656505cd7ab45bc2
prerequisite-patch-id: b59fd05f9b62bda86079c9d86538b80289110862
prerequisite-patch-id: 71691d8b40e36cdbff6a52c3999ea8bb2c164d70
prerequisite-patch-id: b2868bc50d74afd13c8a0d0fd62301fa9546a211
prerequisite-patch-id: f83f24719ac475317507af09bf08b4a69b02d429
prerequisite-patch-id: c9f2942207341ad4f450b20f049199f35188c02a
prerequisite-patch-id: 3a6e9752793f2d7b084008b47daed10ea572064a
prerequisite-patch-id: 3338cdc5915c1e6b991067d3a7afb734c182663e
prerequisite-patch-id: 59cf68a3a49958a60833aa0464980f8c8d879961
prerequisite-patch-id: 5d146a518f2f76bf9fe93e23a2cfa63c73731883
prerequisite-message-id: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
prerequisite-patch-id: cb558078597001d82e7291547b0eac4bd13c9d07
prerequisite-patch-id: e04ee45d80392481fcb025858f5af6352ecf1000
prerequisite-message-id: <20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com>
prerequisite-patch-id: e9ce15b4a5842cfde130a813afecf136798179f4
prerequisite-patch-id: 2fb20282e4f0afa161797319ea7031e9f6318408
prerequisite-message-id: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
prerequisite-patch-id: 6fa1d972a8be6b346ade96ab50d5c38b873cc028
prerequisite-patch-id: f0038f836d71e64fd5fd527906bb218115c1fbac
prerequisite-patch-id: dbccb759a76fdf39e8f7fa3f9c00d0f857f23470
prerequisite-patch-id: e15cf7dc3b1734a4eb3f468e6ba8d697f4ca92a8

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

