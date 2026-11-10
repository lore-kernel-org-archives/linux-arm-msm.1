Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315787;
	b=wQg1B/s351sRIOZ6EudJw7SjuKELem5KIESpg13QrHI72qbW8xrMe8P75GVkAcMpPJan
	 inRMrDDzCReI/VhGMHWZvIRRhEaTavXCTb9RqZ87iagM43cIaVwKOW1ocb25PJ8za/mH4
	 bQJ0SxQ913pRz7FUx/GTN1s4/cM6pHBzC4DSaWFhBHHYghoP1e/nOrbCLZOE/eOdd5Iaj
	 nj8/iACAggoJP7eFaF3Ps9a1ant4kAX5uStWnUdidIM8tj5ksd9z4/ng/ym/5727ZEXaq
	 Lu4Ee9Pn6Migv7ayP+IA5lQ/RawTpk2zXKt5gTnFfIbz4WU56H41pisJOgcY7lTggLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OALV8vUNInuby80JCyIJlfai0hgF0F+FwNbODqepVpc=;
	b=19iWmmOIru8TXdqkDq7Vgv61HbNGHdnr35AB4EJDhI/berNW9F4Oe8K1Mo+bILLj7j7H
	 qb8X2BtkaxNVArYrgiWoAzA861EhO1apNSYCOhnk2NMv+nALOUXaeS8gfKJjqcyikPZhr
	 YY4xoltK7shVNXFX377y5I8DQN8Jdha9I1xi+ZYfl5ITXVIuDWcQdKr5bheEh9GqX2SNM
	 qClNY+7TitlAHb7L6fDfduO94aKk8YEJwgMYmNpu+GNzJKUVBir4RLQCqTU8RXlE2PYQO
	 Oke3sryR8N/OsBtTgV+7LSSolJBdWvHmXaYy5ZSR6VoUHXTWVjDpnd0I9fUMqBfExuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvX39h4p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QiZVWoRZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC606070C91
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 13:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC606070C91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvX39h4p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QiZVWoRZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAaat3850915
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 13:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OALV8vUNInuby80JCyIJlfai0hgF0F+FwNb
	ODqepVpc=; b=YvX39h4pORto6tcpRFvnzK5hYYt3WBlKs/UU8rpssKijGYuCc0j
	lrpk+ZcOd3zDJrWTm9zAUHkYArNm24IEABX4HFVQ4eWNj4cFFPMexV2lYJYboioj
	EwJnRxIe7h4ru2S6gEwgRSR3Eshjo+cc+lNVzVyT4Vnt2rMA49rxUqLBhXx+oXnb
	jHyj9oG3VePfLUjdM4PxF7aL996dQChZNfTViT5xqVfWqKK1dqEvhBHzrGKCHTeR
	5pVGf48m1BOjBZufKnMAzhF5Bo1rGHu95gGO+3X0TO7ZYayHSxcL+/5cdMBFEC/u
	eMGGvXlfIvGGeLbH8q5QHspKsPSuxM65LsQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx84stn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 13:03:06 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece56bfeadso1662567e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 05:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794315783; x=1794920583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OALV8vUNInuby80JCyIJlfai0hgF0F+FwNbODqepVpc=;
        b=QiZVWoRZ6PV7R0nFyph/MQjzx86Dxu92HN4WaA4eeO6/5gtE6i4cl6y2ueqr1bMiq6
         bio0mEUHQI+IjJtSIC6kQW6IBAySY6GZuB5IujnLA009xhkeEZR/qEB/xsFSO7r5jUBV
         VrpYaFEtl0ZP0t1qP214mHba7oYFmzWZXEjFCTRTyIqml6Gv+ye9tQpBHTzjlViOPFoa
         HrcfBRQcWZSGUzcpQFX+L3ZEXP7uuLbvjN9XGx8vY3vHocXKEiOKxb3KuYGmW0cqfbWK
         5koTE4qa5cfZmFXqEkDVdCi7b+mqYCcHFpnIEbOwC9iGia0rPQj8YMXAENgKXkfHkJHi
         wJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315783; x=1794920583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OALV8vUNInuby80JCyIJlfai0hgF0F+FwNbODqepVpc=;
        b=WWutatoVGz7p7F6cbNYTbErzd/QFXMzpR3R5MlCpRDHJbt7P2AqC3P/ZjX02D2yV3z
         qgXIYee3J4m5oHPFBlbnbhMelBKDtbEftILMpq59TwlVhM7zBlznC/V9XTaA3ZmVXgSY
         jUoViH89YDpOPAY8UK+YGgak74xJa10Oor9yjzfm3L0B6IIzqn8nis8FFovTuA4qfE1T
         Ua70rbIF6ZJzTs9XUeVfDMIDIAnVDfW3c0qYo7PPsu/Bf+n9uYDcSzZOM2zrbFOTgb53
         rPcI/jioo8QJ6FTzTXhr3exNTbOvKaAZlwEDPbHupyz15/+lawJyJ+S6kSogjuJuQmdN
         6dTA==
X-Forwarded-Encrypted: i=1; AL+hErHXKBH3yImAcgO4IRwu06Z1e4+Af3xZa8aV7n6KP8/CCu7rAOePn7wujAHIEqufFHmZv3qQhPqrQ0K4iOCF@vger.kernel.org
X-Gm-Message-State: APuU4Z82AdkYrfnEh+YcGLOEBqr+SaD2M53Fmh//KXmLQRZPtZqK8PRv
	WZ7pvbCLJBz2+pd4UmLVrI9IoOfN1xpGO84gjq0Khb2ihnvf2szzpPlmxY/JepfNbN9UJ8fbfOm
	i6a7tiwReRTc4fysbBVMiIr2aT0dm/OlHQGxvGCUjuVrkm/r2jIGWU81FIqPldjBj0I+7P0ryTD
	E/
X-Gm-Gg: AYBFou3vNoRlCfx6qgiwOk+1QQKspwkJZR/MjKLRzYPZhpNx6xbtwKYdiLG0808cnb9
	C2fEm2eOiGuoYebO1eCCdggvJ5acDvuzPNgQtCqxkfq7He0BFgpn2tvvXbKxB47ZDjSpNIpgMDd
	YDFPG94EfNmroZEU6BXV/PfXEWU2+p7pturSxf0PAc/Lx+8ZxvgeHljye0b+03zNBaEukXrEh8S
	vRnSqdD/fFF6V8WKAiqbFqSmJn23OCZFcdeZxy7f8G4gPW/9vfx5KjmNsOh2yDAgo3eYOiVg+St
	C7cU7pfQpVXZpRV/BMrdgg0qrMHX26597W8iZWUXFgkPnmPvz8w4pKrDktETHb00+Stv1/6gQLa
	k29MTQGCMuCFAwLYLx7aDTwpoiFyrtlWgVjFFNn/QmJkaIJiuBn/crJlH2Z4Ykg==
X-Received: by 2002:a05:6122:8c8c:b0:5ec:5f1b:f725 with SMTP id 71dfb90a1353d-5ee0d1eac60mr842148e0c.23.1794315782415;
        Tue, 10 Nov 2026 05:03:02 -0800 (PST)
X-Received: by 2002:a05:6122:8c8c:b0:5ec:5f1b:f725 with SMTP id 71dfb90a1353d-5ee0d1eac60mr842031e0c.23.1794315781206;
        Tue, 10 Nov 2026 05:03:01 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0236f03esm49121585e9.3.2026.11.10.05.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:03:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: display/msm: qcom,sa8775p-mdss: Remove bouncing Mahadevan
Date: Tue, 10 Nov 2026 14:02:56 +0100
Message-ID: <20261110130255.134252-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=gnpSXTmvxtdhncMRhWieLAr3GFCRnWpMUR0hNvdBVWI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq8xX/gD2I5kvb1YaQbaK1Hj8UhSJ7L7MJAvGQJ
 7k1aiqFbcyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavMV/wAKCRDBN2bmhouD
 17/CD/sGFI/+wjlERaJ3BaT8xEiNlo4WsdazaWIt+yqGEwwmOGNnspemY6phkyMur0Ch/yEal3a
 a0tuhSFEl1ZsKnrVf5TyrKwbM0tO1fwW9H4NX6Zk5TFnC7IQGqlgM4UFFMgnD5TxKhZqiNQiHF+
 mW7ybexMFHJ2x5JAdfazGmya8YfXbrwUxGTFTVaEWdYhsocu4dHR3dcHaoKaUcr6Cjq5W4y7IW/
 ipdwwqFuB1NzhcwepfHTokkewlD7NKUmng7EmN7H2/d+Q3fsHye8RHRec2VJU5JfE4C94KLkNON
 zFaFlTJPRVevVce7u4pAmKFQTZoAbB0H5EoGP8Gkl4AE6yJ4+YGzKVetP69EHmnWx/NYl8rnwvf
 j51L3lxJ+U9QaPmTSITfdaTWdBqW8xSFHMyu70gYKdTTqQqqRo8l522iB3DQIaJEVyFdPhSBQnm
 9TwE6DQVBakI2u7Wq6BdWA4zuiXfLZbTRD48o07rnK12NIQbIDI2HBFj7uJ4/Jdkje3tQ2bGu/c
 f1F1d20nWvI1MipHiWB/kSDBH4TeA01f60/GpPIpHnxIKBD24cYH65wtnF8Dd1sHIeqxinWT4Ua
 iaMIHCTyW3T8+7TGz0Viyro2IOAlOrBa34uluDdzL1rrzjccOzXbGRhRZzaPv7Y+uoBcGUC0TqR /VlewK6oh8hBQFA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af3160a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=pRY3rvhn6SD9K9aC0tYA:9
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: B0-RZNHclW5kkcderG64nlVGBUEAAWs5
X-Proofpoint-ORIG-GUID: B0-RZNHclW5kkcderG64nlVGBUEAAWs5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX6q9nk/Xww3jj
 bx9nwCgNmXwOiyVgEpJmnLqYbHqbi4D1N0jwV6US8C+tQwucSsNcmd6PI3H1dc1IAt/JKh/vES+
 5NirhFXYPcEixUNDe972ExMPORiBsyg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX/5bCNxHFCbe5
 khabaP047TCJDxti0OHqGWQV/Y4PtfNNnM1AubmdN8q/s1DA4BVY2wZcdICOS65Nd+85+akPxkT
 odFtL2jmRFtlkrBQfgizI7E5r0UIyblWSqdRWB/75DzLi8DJmMp6n9i5SnHzdfbW8IsGVbe9raK
 f63C1a2XGetMnVyhoDJmlOQNUSHhTG6Dp+3E64TBelpMPm+gxfXI0mpY8V08q/tiuxbTMiEOrf1
 b+PUiWZhy9ftTBLA5/1xP2a+s75Wc4cbN6+K1ZrolT2JRe5B9jf8LravTHnk/Ik53fJtl8igU1D
 zNSVQBiSNqvEjGjYHyqM47zd3s5J6DRaoF1Js5Zmpb7FToqK/zXeJ23HEBgDbEGiFT1V74beVIR
 gYVFC2dQr3cRRwA4PnEOJIOWEcrMzlSwfVJZwvWge979kh5cikx3hQ7uUdpEVkW6LcuTzafDZ8n
 bmB+s0xbOi2gWPAsXAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100051

Emails to Mahadevan bounce permanently (error 550), so change the
maintainer to DRM MSM maintainers (Dmitry Baryshkov and Rob Clark).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 4dc0055cd841..48dd897d5d5b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Technologies, Inc. SA87755P Display MDSS
 
 maintainers:
-  - Mahadevan <quic_mahap@quicinc.com>
+  - Dmitry Baryshkov <lumag@kernel.org>
+  - Rob Clark <robin.clark@oss.qualcomm.com>
 
 description:
   SA8775P MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
-- 
2.53.0

