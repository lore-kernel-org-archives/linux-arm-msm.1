Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905174;
	b=cdLe3HEJLa0Y8ZA8lfaxFT0Z3z70dlgipsqhX0mTYbKLG9iQdAtrg8wV3fCOMv0oQIWu
	 dVpPpkModdo9g2TOCJb8jKoFHJse0uUSR8Pl5yRNdmuvKwa2lNFrzOD4UawGEteggTc2P
	 4GuLvxjXTcz8j4yVVpe1cSvxl/yyINRveuoiECzXS4Hm952i+TyOoeHevMgP0lDNMC7bB
	 v9OS4wvJN0ZfYwN2776MVRMKPEcoFvBuCMTy/I0wCluROG3GGuQL4/P7f0lcQGaUtQmlL
	 1/ZLitF/lunkf1cUOdXHO9YR84ImrhdhQP8Guw3/wzc+wt18KJQoloh2it8N3ssJ8Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905174;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=;
	b=gCiEG0KLIX7znWpSzo193MvciPYCxWJdCNibiMqHcdl19eruR4yfDUZHB4IE2oPRZofW
	 Wwjp+9tG1NQZNDurYAN/3h5ihdBgR5zd6knrWfFl0BXVJh7Za/zYgNkMCYyQ947af4V/B
	 lDlEE8QvIRSDgA4aMtJdfMdVF+SLaVsNXkIi5hzkbV786Qd0AF50bCaq6MF645tjhVcio
	 k4EX6j5SHtAzdK6XfgDdZwG2518K5hDkpJGErEEMY0pSTwK9WnQyAJ4IbcFIC4y7gnc/d
	 C1zVajPK8KS3q8/hD61P7bmQWLW113kTpiBkfB9MsXT/zSUwP9ufS4pSttNLiio22ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Q/rnF6/Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IK1Kk2GB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE79606A8B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFE79606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q/rnF6/Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IK1Kk2GB
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8LvfM200079
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=; b=Q/rnF6/QYmoq0Fp3
	l5EArxNdwZ/4pyRKzw3wdqxLwoeL3EIwtX758TA2dtLtcZldx1uZXIgn/uI8Uhg3
	iZEbWY8o6ybfVTr20hDbMZjGJf3JViCf0Q0nvD73gkTNPJhhFp/xnGVD0mKuAGJp
	x1z7Z70d/mMr2NlZDy+HNwJ3nsEaDa2oXrN4jOqwqcmCwyR1iPop5e915Bct9ZWh
	EX6QPoF+OdiKzQ/kshG99O/qnGfgAbBKglE6CUR1hqB3drmDeBH/CS62dI6u8mMX
	CYclj77C5qr5YFA23iNwl3vBOxq8pjVdCHydpOgmFQWK1+eSh/A2CRDt3RrSA4Hr
	H4Bl4g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038mbv99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:46:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so4964175b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905162; x=1795509962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=;
        b=IK1Kk2GB+mP/f9YnL4naocz/yWFyR5d0sNvGIH8z/WUPPxCqXvyOMVTAOuPKDf73kh
         upPmQ1Ly2ohCKHUult7uvNH0pwXgJZgij8HDCcW92wbXi3TRV1oaxXSn9wItR1YZyfga
         1DKrLqLfJ1MY6rP6ibuFSjluVWA3DL3hDnjStn8hpppi6zf1NyiJwB480QullZ7Two8f
         X+CqCxdkmUWMMYFu1d2n/ReUWZNINcuTFFFpHmXCPf5HVqfpCrOM/NOysyRp12dTXF4M
         3Marf5dMLGt/dv9yZR2iiaVD+oL981L+GHb9GJQDR4UPoMm6FLHfEUHDNyB2E0n9fo7v
         JvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905162; x=1795509962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=;
        b=vY64PciAhhZcKGv5e+7PITgYPM1d/EUsRIBCd5iHfngxgJaPRoDwooJTtU3cG2kOeB
         nApsgGkLBOybB4HNgNHYfyK6vMtcb5b83Ps+ndQ37P72lGbILSx1X1nPCVO/69jsT5G4
         eJtqtiz958CisuLIdg4s1PLaZhuWYcpF/oJfDdLsr+NZUhhBsS/5MwXp2IPIINmLDYoK
         u7/3Up5+e6gRyizwWAaFzKnnItbOhgKrDDwCupxeXFHXVaVT5tiGFto4s4uFncSISIdo
         3vAN/kaIhOTqgJ/5jcNZlHBLup7CEO6wBRjkGJ7NV5G2VWVel7uZ/JuxoVylR5AZU7NC
         lMKA==
X-Forwarded-Encrypted: i=1; AL+hErGwzk4eNHVUUQnL3napeMprff1PgJ64nwX2ipmr8hfU8MUJNAWLBTeZerq6nT5CddbIK5JlizKLjkTy/rbt@vger.kernel.org
X-Gm-Message-State: APuU4Z/3hxxVccgMof8oNFbzL9jWnphjtB4dKW8l14Wr6cZvHuJNraWO
	xbHIqLyhZ6a/f1ITdpeLFP5cgAGi23BzdhHAdk99C6xram5XAiRoJaAGfV4zS0x3CxoisPcrC8s
	cORze3fwLCDF3Nn4Y0UjtLgq5wg+V/JfLDnUsZnn37D/t9mTD1Y9AQHL5POeA2cJlkHS1
X-Gm-Gg: AYBFou1R09pL2LQ29droGLWyHvggatQxVep8PiQVTlKKFZKbJQ6MeAAVKUO52SqZjqE
	96J1Ah92wWduJAezRFdSlx6DdWd0u3ck17I69O47ZuZr74WjnqNc0+KYJ216jleQaCfElAjigEB
	iLAlxf3s3ryQQnhJMeNuQA6WcX35DIe6rpgQehYdQjdgZ23QyXBkdzOEMc5ubkzZMPoCGxDI2P+
	ZaGfNDY14SETTamDQRzZohW8CMVlnOI6NR9zuUf2K80XQdBNTq8baIdTH3WGXY4po63OOU65RQo
	bIgj52Qa/4xxTdVppbZ6wbhPcUeMKuKrG8j4TRqh5qTm2+rLGc3QS39Dm4vPyZygtoLlW6dcKob
	QdHg0A64E5HK14G7YRjei49TNfjij2BEPeghBpBL9SSCvmi+sthgdklGhMn01ACp5SvlMQGHk+x
	zhfA==
X-Received: by 2002:a05:6a20:3c89:b0:3eb:a2d9:58f1 with SMTP id adf61e73a8af0-3f7a4abed30mr13500684637.9.1794905162426;
        Tue, 17 Nov 2026 00:46:02 -0800 (PST)
X-Received: by 2002:a05:6a20:3c89:b0:3eb:a2d9:58f1 with SMTP id adf61e73a8af0-3f7a4abed30mr13500655637.9.1794905161882;
        Tue, 17 Nov 2026 00:46:01 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:01 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:21 +0530
Subject: [PATCH net-next v4 01/10] dt-bindings: net: ti,dp83867: add supply
 properties
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
Message-Id: <20261117-shikra_ethernet-v4-1-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2011;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=mjS6fhMb+ocKCpwPGoezcQxON+tek+N3jqUG0k3PUBM=;
 b=UsajLsR4goRt9vLB8c8weWLqISCqGRYgLriF+2Qva5JGkNQYR1Xf/cnWnH9z5/FOM8VStJqU4
 Q2P+2dmPjHaDuPD/KD+Wqbv3dmD1+74n+G6rHFACeaFivzupgQ24HDK
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX4KIowuPygDky
 Js5PrOx5qotpTG9Yt1n+JuCxsGQmNHexQQnqCCNenkPNPbCN/nZ5WbsIRVKT71Hdv3wRYmu+e2L
 mC6DFbPYktiydxcEW6BHabVjnXg0QAQeX8tkUpDaPtfn4Ehy7VLx7Zm2abyX2aSzuKa1vV00Lz7
 u9a5crQ6HhTLf8z3/Pyxm48fWL2u2v5WjVk0YleUPxSfswYiqV4gqrKrV4XCTjjvMPUcLsGktwo
 CKmx3+rrsNRax1sMJn3k18eNIsofcE3MNdRjIhCxhxJ+Pw32FiGcGPvOhN15Yd1x9SyH6yaRwaN
 fFL+sV6Ypy1eKtLOmw4tBJXC7twTqvzgzC+inPvs8Vk2jTZSxASCWZ5mXf0RNyFEpSTASjC7gfW
 /N7z+VFglAQv3ISzOrpsp2A93fjJf/Az7rL6ZNJRh0/YEjQtWRyPxyOKHSjQ7o1c1i6NLkLjvGG
 N8KZfOC4DnXpGw3mFlw==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afc144b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9lbML-Ic3bjincHAjDUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 8wmKZSu05g9ooDFYnWQaN3nMyKWznX5f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX3oOFqiAy5LCM
 Pphqf1EViy/v5Qu9YQhkp9g+1QbumdAZT0x7PFwb/S0Xep5N2wogP5aPa2asWwNt9UEq92VPtXH
 po9kMw8J3kCjs8iAk7Qu+SEW7SbA8Nw=
X-Proofpoint-GUID: 8wmKZSu05g9ooDFYnWQaN3nMyKWznX5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

The DP83867 PHY has four distinct power supplies:

  VDDA2P5 -- 2.5V analog supply
  VDD1P0  -- 1.0V digital supply
  VDDA1P8 -- 1.8V analog supply
  VDDIO   -- I/O supply, which can be 3.3V or 2.5V or 1.8V

The DP83867E/IS/CS datasheet (section 8.3) describes two power supply
configurations - "two-supply" and "three-supply".

  1. Two-Supply Configuration: VDDA2P5 and VDD1P0 connected, and the
     VDDA1P8 pins are left unconnected.
  2. Three-Supply Configuration: VDDA2P5, VDD1P0 and VDDA1P8 are all
     connected.

VDDIO is a separate fourth supply present in both configurations. The
datasheet specifies that it can either be 1.8V or 2.5V or 3.3V.

Some embedded board design expose a GPIO-controlled regulator to control
any one or more of these supplies. Therefore, document all four of the
available supply properties.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: This patch was accidentally dropped in v3. It has been re-added
as-is from v2.
---
 Documentation/devicetree/bindings/net/ti,dp83867.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
index 4bc1f98fd9fe..e78f08ded3d0 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
@@ -118,6 +118,20 @@ properties:
       Transmitt FIFO depth- see dt-bindings/net/ti-dp83867.h for applicable
       values.
 
+  vdda-2p5-supply:
+    description: 2.5V analog supply (connected to the VDDA2P5 pins).
+
+  vdd-1p0-supply:
+    description: 1.0V digital core supply (connected to the VDD1P0 pins).
+
+  vdda-1p8-supply:
+    description: 1.8V analog supply (connected to the VDDA1P8 pins).
+
+  vddio-supply:
+    description: |
+      I/O supply (connected to the VDDIO pins). The supply can be 1.8V,
+      2.5V or 3.3V.
+
 required:
   - reg
 

-- 
2.34.1

