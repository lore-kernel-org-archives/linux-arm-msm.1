Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9AD47B413
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390110; cv=none; b=jWF+JbYE7/liuqXPIr7j7xUy852srPhXU4GiAXGamebk2F1VDyDHGP3bc9g9cSMBoks4wKW9iQ2dfEkAXLpUX/DCC/6NJtaf9GyjtnA3A7GWK0t7skV4c2oAIfYiZwWeLhuIehPRyDaNnyD9V8HjzdgcDckrQfVjmEP02hXc0l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390110; c=relaxed/simple;
	bh=A//nsmUiFXDU6Or3j4w9rUqGBv0V0aripcCsO0cA8jQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Za5nkhkC+CJRcVtzsr1KhzNcR6BeNUQwL4v64+l/AnYVL+NX2Ilm4u5wAFotA1UmcRgbHnMV/snNfeHHsxRX573cBn0n6t4S5JquIET4GZcB/n+maXJuJukqtBUUwedG1+kwu96BKhNv3eEytqy7UmF1SUwTPAmYfKaigPMWmwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1kuJgO9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jf6bYn38; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1kuJgO9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jf6bYn38"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwDl3860391
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxx/bW4mNl335+EzkTHg/H0Wz6TbPkYRSHy0X1T3ang=; b=O1kuJgO9i9OQohA2
	73QJYaM//CZbx8pcbLJMQWXyQOuVP2zaunVtpI5JAuqclQirjBREbJLxpiJ7MGw1
	YEL/bwQ46NtYJYKXIbCBLS/0EILdPvkcxS3AhWO1Si0apa6tEQF0/MZv+nUTRiTN
	iHAotUq18YREs56xujsvOX38nfx932wS0dMRzMBiPO2i8Tl8OHyvbdKSRHqn9IBp
	jZIGCJKPCAYLXKr39XrvQIDs1b56GqrdJXP8/KYUrdLISII9EiypCjRcKsJsWE6+
	JlUJvJKIpIf0Z8ipW/bo+HuZFeaijIIEl6v7wRIywlXnDxQr2otMVQYQhhs8ri+N
	XpzctQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f11ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so849837385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390106; x=1789994906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxx/bW4mNl335+EzkTHg/H0Wz6TbPkYRSHy0X1T3ang=;
        b=jf6bYn38cljj443x+PEduO4rv5pAZ4+tpyS9BsOz4OhSeZunCYYc7FcUGxF2wpvTUC
         lXVSETHaHXWvWx2XUOXcAuXiu+tQzZsHSAzZk9HZybnhsBwgDTfGa5z8z5gmrCilpr4m
         1ySAp2I1tBI7s7UKZ79Fbrbo26nrGZijfIB2XZg6zyhBSD1IXnRJiqZd5mYJ93ByEx8u
         SScU5PDthF5pBOguvcMiufEjnuNxTb9Eq5NLGSWRh6QXnVzc33zv8hKNNrNtHX8GkO4/
         /Eiq01Kyt6E/0HoHqocDlltdxkSo80Z4TicwSS1jw69eX5PVkGWedV7olqv6xabnuip4
         gf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390106; x=1789994906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxx/bW4mNl335+EzkTHg/H0Wz6TbPkYRSHy0X1T3ang=;
        b=HtBg0YSq3/obttAQKbDnYowm7kqWY9UQj0d0jH4w9dYMgjvpHn6lWqZwe8SyMt/W1n
         uogzv2mopblD33Ag96RAe2a7O4CjxkP7mHaghJSHL3HTtKIVwWhQ4xpiqgtJGEad4kKu
         GTtuUA/mCByKYbXz9LCphct/EnWlTpDXYMgS7p6v3+RS4sBlILQ3qEWGZ6g+Pbzdt2es
         oykqtBT0qQ3LMxHvfCrw3oPGbY0gk0foNGiq+exUN/5WR2eRxXQA6hHkdRH6xzwdXTJi
         JT/Ni76QRJyz1qbK+W+5fEYkVWVMQZX2g8P5MzzT3YeooBeq8pNfloqh+vd5HAXeWbcD
         4/nA==
X-Gm-Message-State: AFuF++nbLrempSRL315Ewkxh608Ax9XVR03+mKq5Q/u05x+7LvpVmdGw
	qXE1bMVjfgs/iGKfHj3oXZ+VRNGcSFUzVFn9ki7wiw6CwdPrLG8ZeCRKEtI8JqNsprIodzoe+bT
	+5hL/0nDaxV6m7XuiY1Mv4K01JomPofaK0vmcybn+ombR0ZlEEoXSHWzBY676jK4ocQaJ
X-Gm-Gg: AYBFou2pm2Jwj545NzF8s4CTtQG1SZcXW8D++NZd1cZg8FFk7YlWkJ94ZfXcRWunnLq
	Uk5obi4Xl7oDj+8egzp1lRztPDJXGOdpuutIItQN4ZYbrB33JeRwwpeHj7rZlxBwSBB8MveLV1n
	OjPsBLS4QF0XrrcIDoBx/EFXsSGHNfwaug1R8eN2Qkb9EoKlpa1lHV+UvyLd4vdJoWVZ8aaZhLH
	PWvV6QdOaMihNysxEwcj5Z5cLrJjafaPa9nbTEaxQwFtXIaW6bfNGV/N8gdkQoZZDBnaZMPq4w+
	Ep5wn/B9piz2g/XgNBITGluXrGUndAVyi6odfIlnRB5ItR8b6SKoM5lgDQJEnlSV69fHDl51JwX
	MbIZUEtMB
X-Received: by 2002:a05:620a:6287:b0:939:c7dc:8712 with SMTP id af79cd13be357-93a185ceb80mr570989285a.15.1789390106460;
        Mon, 14 Sep 2026 05:48:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6287:b0:939:c7dc:8712 with SMTP id af79cd13be357-93a185ceb80mr570985485a.15.1789390105971;
        Mon, 14 Sep 2026 05:48:25 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:08 +0300
Subject: [PATCH v4 09/52] dt-bindings: clock: qcom: sm8750-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-9-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=A//nsmUiFXDU6Or3j4w9rUqGBv0V0aripcCsO0cA8jQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zUPZ/NeS+CLOYx8z/K2r+Jqoq04fuRqLzPG
 JrcAU5DsMGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs1AAKCRAbX0TJAJUV
 VuBgD/9QrLzdsHp1iDQpesjLiPWWrCDpFvyd1jrgiv47raTH88VxgUzTR+0mtIZV3CPolg+XUcG
 YoswHllGsE5x+HJYb+VGDWg16uqvPVJajZbUw+ia7g5ngk+Q1u5D+EoaZwhluLQfs2hU7rSYG6n
 yJMJCb/xF4X9l7fFkn2VgIxnvC10eI5oIZmFBMeFbjdq/pTQ9+WTImHE6TFy4UAQyg3KXR7v76M
 CKh85HkATHYaf3Dx4hXvSr0EkXzyw8swJnmlyx6PY3STmcV75vbMkhOA4m0BqKgwI5JCVLOvW3v
 38mvU45cnw/egAOVXyE8qON5F5n9FfPB4756ufARwwhgMRkcR3cgqfPtclvBl69Fk1cnHZAOpq9
 HRoon26CtuTz3kzSNNQzOmd4l/EXwjbilXxcig1SVUXHC1hUuJKmYPuWkkidS7x0heY3OCUYl9M
 2eMb03Qe4MghWR7dh/5DtbQf5SaTw7YsQ1V4J5eU3J6x4Yl6IcfRXAWD95NOHVubbNwFdpUx4hw
 sw5RMEtufHlB4g9+OyNGglUYV5T6IAPFzdRYq/+edGIRm58Zc2cMjC6+F7ZNX9rMqUsjuv0oJ95
 A570caLBX2fjL47IIlxWJFYrRrR5YrVAwZKQhGernsNM0Yt2pW2ZOaNXddQktRig0xUM9uwMXi8
 Lud1iLuyy6n9ByQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: t0KCjaYFso7G47RnR35ryVWjmD75AWEK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX20XjnbMt/4Uf
 3DZIvnVJqvi9ysA4ePSnCitjYHv4/0BtOL040M63vdq+rKgRWEYOL/F1BuJzUSZgv09WL+Z0Fwh
 DFm/4g9Jct9KF95HLy79Y9erHk9LneU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX/234oGVIliWj
 MJMvadg4cctukQvSH84kw0qSNPFLjByTiPE2+tEVk3OX+oMBQBQiseB+Ofv5Jfr8ObjV0xy/PR0
 t23ZI1P3XxzCWbLT+ejtUHY7H+KsltKTAKGaOieielfxSn6EFyl4CEl1H1XiDvIEndFaBqj6gTM
 oufoiXqZLIovc/drCb42sxL6aw6t60/psaMbqW7rjbpedpZApu1HoLK5kngSzY0Tr4iFoDezdfK
 9uz3WE86sfHIC/Xy9QaTsfzStNDiKT91uYXpFm7C/vdDAZirjn7fCEIL7OFhddDkimc6a2gIwSb
 xFebjORDiBR40XBFhO1mwia6aPPspGqkAWEqGx7kMVvhu26RKUipDKNEWaPMxh+z5e2HF9i7cHU
 9Z63oyc4Y4eHeCKDjmGZ5SJLb5KNLJ9KY0OIakcsXF0LY1EsOmHg7/I04j0b1Fo7aPX4eMev8/J
 74qN9b9CaFvYFMLVSEA==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7ed1b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: t0KCjaYFso7G47RnR35ryVWjmD75AWEK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

The GDSCs provided by the SM8750 and Kaanapali GCCs are supplied by the
RPMh CX power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Fixes: 342d2a607450 ("dt-bindings: clock: qcom: Add Kaanapali Global clock controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
index 0114d347b26f..59da3eb2b073 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
@@ -34,9 +34,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -47,6 +52,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8750-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +64,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

