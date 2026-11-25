Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596199;
	b=qhFknc7qi2I8KDjJvcQs8EW3oCBjEZloizF47aE+vM7++mVPEQ+OnSngqqr8yA0A47f8
	 qk0teWvVM99tVB6918ncrQrqYr7E6LN1i0+RMwW9GmYoC/Os7b601rYebchIeHGYU3RFH
	 qvEQLQa6eWV7hupKVvqeRXkN2Bw9EURa3RTogYHry+hwU7M8AtLHWT/IY9ELSAp3tRw4i
	 bt+KKEOK9vdxiamvw6g/necLA4z/Y2Wsw6fGtZI8sluuSWwExpr4ivefRs5TbwVW4KQli
	 eG6ckrLdG+giLGJOnRnaEcbHFDyuV21CTpXLYgYe13aXSPrZkCE1Gh8tN5psrB/6ulg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZZ7iECJNO/EY/GoLxR0o/vSFR2eFAIoMyMPvHeXZfmQ=;
	b=3KXlxQxP5E1DafIETmWbqe2oTKD0mHWD9YQFI5RCV9UYSAoVyMbQylHo8h8xNrzFl/fV
	 eYafd2Px+zQIfDApu7ceJ3+m1JHs844UrN5G+yrUuYDSxwhqGbNXVL0gwKCEW1d5VUij4
	 N0ZZiSA2LqWKNNc1+b68uAca2jOtHNew6rmP2RW4pPVBLh1WID0nEa8OAtS8HGkHtGlir
	 /XiNvR0QGd5WFEnpn5poCfTM5jwEMMVOAxvcQwRuTYqd5Qpo3jtvgkPSMGilgDSIDgcId
	 vYbgrE6Yr26murl4avVa13GeggdopBr9b6L16PT5tqGq45slvKx+XQauM1qQuVA3MNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IvJgwvEW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WW4eQTj/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5369F606A338
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5369F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IvJgwvEW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WW4eQTj/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68gO1057265
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZZ7iECJNO/EY/GoLxR0o/vSFR2eFAIoMyMPvHeXZfmQ=; b=IvJgwvEWmDKQb5uE
	y5MSPHvwoHpTH4HHfw/wXeFAwnqvrMoCa3nJSGDO1qYY2hh9I9DFZpp4ptw9ha/o
	TdfGVYSyuUr3OaSmszRQpc7xvXgNYCJLskd4geXkD9nM2PSzIYpDvkgU5383iocG
	mSmfN4ob2KXA9L9K9DtVjaum49yfA5E5rYLaKf48XS1LLElL4f+nhmbv725IDBto
	tt1H5xIcqYzMiEW7yo39aFRVaGsf6g5E3dCnC0VJiAiQUDrEl30u1tjmLh4aYz38
	Hofo5caSr3nY2M7zQsd1g9Pq5NsqRqZ/LOIT11RyZOgT8Q1MYVCUi+TF92QYJ4MG
	KsJZzQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnfamx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:43:18 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso5755642c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596197; x=1796200997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZ7iECJNO/EY/GoLxR0o/vSFR2eFAIoMyMPvHeXZfmQ=;
        b=WW4eQTj/Zf4JZGnMP4tAcmYseP5YYWrrJoMFpnSwQhdyXf5zU7VnZK3OTUfQV7Ykg3
         RAxL2ug/96vP6X0b88+A8MxN9cw44f69NWsF6Fb7Pl+Tvro9SUCxGFG9DxdSWJsdD4gL
         9fYtc48dSw+7TKAwzlKNESjsx8//6J+Pjl6nU/O9ab+LONQykH/mykKf15ZfqA0D0egS
         WXoXh9Jw6PH4U2TisjosfXthdq7noKbAbFu5qtRRGI+qEEuI/NTDD8IZw4n939w0dIvg
         XqEDyPdYrFe+oWyTGESwLh6yYt/VWDAI7SCdTMta7p2u12PIG2Z0T9T+MxOhJ2EIxOMp
         fX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596197; x=1796200997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZ7iECJNO/EY/GoLxR0o/vSFR2eFAIoMyMPvHeXZfmQ=;
        b=Pq5mflWN0FKjuwWDllKeRW771zYHFwTJQyaXH0PPCO3BwFaXDtDr1NIMZU1mqiETj+
         4D5Fal/HFGQOkgkSdgNOGUjyMxvI8wx54nhZRv80zBDzWYtgogsqzdZuNJyfj9TrI0e5
         GE8t+fpeQ9twh6j4EPomowC4SbmTZNHLanxUr4/O8U8XqLE6TJy+0l4Hr0ArGnWKXO7P
         EdVFedCTy9AeRl78qtQas4LG0FOKxRiQnIe7xD/zhvpx9v/Ss+o7zZK3t6jplqH4hnk1
         JigLz+701TLhjIud3llH0It7YLR0FwUg8GVHVFkPglr2AI6mWKwjmFz5fOv6/UyFnP7w
         zl/w==
X-Forwarded-Encrypted: i=1; AL+hErFoct+z3tykUD5QkSUimtgFKMus2ete0JgSuwYvKZkcFjTCKvq/yUth8sSEclaC20Cp1XcEWVLS4EBuTy5u@vger.kernel.org
X-Gm-Message-State: APuU4Z8x3BMYbwYKX0jIX+SWwwkqMizxhYhDeWf7oXN7pNbP3X5m/skw
	DOSCYLHBz5BX7oFoGN7+RRIT8zer6tiKTGlk33DtsGcl3ZWp/A5kN+IaKOzXqMIJRI64mVunDvN
	Aden/6eu7yWwi0zD/BenWIfZTnXduDK9fJ8FSvbimGp+LSLMMGptYiORjI6U4Ve2moSax
X-Gm-Gg: AZFdTZcn8AcjCuc3U8T7uuOtOJEmox+QUIaRWNKqe3Xklhany2P9jUbX1TV9uRELYJr
	xS0GKzItBqko2hHK86KlZHE0QQybJ20IfK1gS2ch8vgruIUUyz0amAEIx3RpxTuyLFa43s6eAvp
	GGR3Pu7YWpH7Fkykp8C+DhlAk4/X/9/nsQNQ3K0e5aNPvZHb+7F/2v+iUzYATTX1eVKv1RRghE8
	0HbBbYCaX7G4dUhpB0Jn0RHCbRh8JyKX8Tu0MRocmUKaJOoxB5yk5aOVedcx9GnTXxM1Eo1CqJP
	cX9eKseBf7xxPZrMa6AVyI5mCgo56rIdihcFLTs2M9nCkMNFLm165E3hIZfTBz4ELkmZxuymJFj
	+JgqAt9KnCNHiUOXNB28hUJkkVm7p8oT5Ykp8zvEIpzePcmA1KbUESCr5UqugfalV3QVKvygIoO
	BQWQyX
X-Received: by 2002:a05:7022:c8d:b0:1b3:b3de:9228 with SMTP id a92af1059eb24-1b5568a4f37mr16029423c88.8.1795596196969;
        Wed, 25 Nov 2026 00:43:16 -0800 (PST)
X-Received: by 2002:a05:7022:c8d:b0:1b3:b3de:9228 with SMTP id a92af1059eb24-1b5568a4f37mr16029391c88.8.1795596196431;
        Wed, 25 Nov 2026 00:43:16 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm60290694c88.14.2026.11.25.00.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:43:16 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:13:00 +0530
Subject: [PATCH v5 1/3] dt-bindings: media: Add CAMSS device for Hawi and
 Maili
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
Message-Id: <20261125-hawi-camss-v5-1-d48c4feb1c2e@oss.qualcomm.com>
References: <20261125-hawi-camss-v5-0-d48c4feb1c2e@oss.qualcomm.com>
In-Reply-To: <20261125-hawi-camss-v5-0-d48c4feb1c2e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795596185; l=11612;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=UMXZdSAtzUtWtGtRt6fPvenn0fAcrgy7s5Zjj+fIsBk=;
 b=3YLKGF4u/ernvP8zDM5rBqf9wVbs/XsJaHQyOy1uj/z1kB9olOa9bJ3etC0Us5W8ccIqZOP5O
 dDhHkUKJfe/DjNlmy0kH8e1c3uW+tVq9SX3/nQ6AEIrpcJIBRRsvI4N
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX0P1UucqC5XrK
 /7dlArkfNWmvEgxG3CmHJvuWodg/AOVmm8vKdrjjvMBv9DX1b55Ua+rtpyvQynUFM76uvnJe5lR
 i/u5gaJMTp3wYVQPLCSJFRhMOmmxlqI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX0kHnsUhBs4Dt
 ZDMAWrRI0KkVJDyxDnB8oUlDq4A6QevdcxrTBhinJ98MK7k+iwVdHFvbF72RiTzV4rqVYFDB3J/
 CxaMFQT/9zQBcKtlcEMLD41JaeJGCx+lPxANjZNthYnggpLb1K6TssG8pG5x11zUTyTxmxYD81X
 oSpel1qeo6p6CMyADxG7CSqjucLNoXB+Hta1wLNA9GgKkVkkYqwQx+O4NlosPRy4vC4LybBVIym
 IeQ2QBYlJwBfA8rDfKBOkQ1Lskk0RO58I20FEQGx3LYBu8EjfC61xf3dSj3wDRnsOpWBrTQ/5yU
 q2sK6ZCdpUbJVXla3+/7tVZhTsJ7YUbojh5NydJ8+XTcEyeE+Nt926Ync8SFPZe0Rq+xNxB22E3
 ukrrOm7DcdIkYIalVpsEXqu1fmFvbkNaPmso5ap72tf2ePyG+CLNXWOZqSrUSNLVDjnjtysl/h7
 +ZJQAwUIBTUNyUtXwsw==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b069fa6 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CXfGsmi0X-KHezRtte0A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: my0fw-awTT9Dx9qkzGU6gkSvfrbCWQp1
X-Proofpoint-ORIG-GUID: my0fw-awTT9Dx9qkzGU6gkSvfrbCWQp1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250034

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Hawi platform.

The Hawi platform provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,hawi-camss.yaml | 317 +++++++++++++++++++++
 1 file changed, 317 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..22629064ed7132cd19b7b0521ebd7c33d79a1417
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
@@ -0,0 +1,317 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,hawi-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hawi and Maili Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,hawi-camss
+      - items:
+          - const: qcom,maili-camss
+          - const: qcom,hawi-camss
+
+  reg:
+    maxItems: 14
+
+  reg-names:
+    items:
+      - const: top
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 26
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: camnoc_dcd_xo
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_mnoc_hf
+      - const: cpas_mnoc_sf
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csiphy_rx
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: qdss_debug_xo
+
+  interrupts:
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE and IFE_LITE non-protected stream
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Global Distributed Switch Controller for IFE0.
+      - description: IFE1 GDSC - Global Distributed Switch Controller for IFE1.
+      - description: IFE2 GDSC - Global Distributed Switch Controller for IFE2.
+      - description: Titan GDSC - Global Distributed Switch Controller for the entire camss.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input ports for receiving CSI data on CSIPHY 0-5.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/clock/qcom,hawi-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@900b000 {
+            compatible = "qcom,hawi-camss";
+
+            reg = <0x0 0x0900b000 0x0 0x1000>,
+                  <0x0 0x09253000 0x0 0x5e80>,
+                  <0x0 0x09263000 0x0 0x5e80>,
+                  <0x0 0x09273000 0x0 0x5e80>,
+                  <0x0 0x092d3000 0x0 0x3880>,
+                  <0x0 0x092e7000 0x0 0x3880>,
+                  <0x0 0x093fd000 0x0 0x400>,
+                  <0x0 0x093fe000 0x0 0x400>,
+                  <0x0 0x093ff000 0x0 0x400>,
+                  <0x0 0x09151000 0x0 0x20000>,
+                  <0x0 0x09171000 0x0 0x20000>,
+                  <0x0 0x09191000 0x0 0x20000>,
+                  <0x0 0x092dc000 0x0 0x6800>,
+                  <0x0 0x092f0000 0x0 0x6800>;
+            reg-names = "top",
+                        "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_DCD_XO_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TITAN_MNOC_HF_CLK>,
+                     <&camcc CAM_CC_TITAN_MNOC_SF_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "camnoc_dcd_xo",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_mnoc_hf",
+                          "cpas_mnoc_sf",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csiphy_rx",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "qdss_debug_xo";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x1800 0x00>;
+
+            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+                            <&camcc CAM_CC_TFE_1_GDSC>,
+                            <&camcc CAM_CC_TFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

