Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517713;
	b=hTsjZHcWQSoBdo6UNbziB/9CWogyVvMbsrTzFtigDECZsLMmHDHoDqqnxWyjwpr+fSkK
	 exvGlTJmflbcayadLm20RVELinDbR7RyYYibOPWrwVkUuRZHuREhS0GndqZhiJAiOs5ry
	 kHBdOQghYHuFso7Q2c+RInD+zb8bztDy1HGXFt59YryB9GunaCPGTk/vs86LB83rYmWtN
	 YOt7HDPG4G9Dd8FXchZX2lWYyrCGrkyNKU98MfhhhUC75Poh6GfWk4Ad4WLTSRRlNkuXh
	 +s0hU3CEvMGYZcg+G6/k0nbf/tyv/LAir2BidHJ2J2SwAO77BlGi+YvOxb4doMUxIYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x4JvzfQWnfY63emsL/cHPtwzBAs/PLs9EIzNEkVR5A0=;
	b=L4qMPnoRXXGE6MuIWssAD1T4rgwiL2TLT2inNrl5sx2qJai3vAfT8uKsJppzRDdq52DB
	 1FHgpYT5eGxDQN0ZnnZAer8DwLI8Lz5+IFq5NSsacUh1H51lZuPoVQ0Cbz8hyElhAYi0Y
	 W0ToMt9eqYsJ98WTUq4whaJi1YP1lNrmahYZqeg1ZGVzKjta5JXveNM/Cza/mTCs+gjuk
	 amEY6AJUubtYf6f3CLDaZAXrNSFKXyWtZl9KNcqCZJVbyKG/27dWwZ3+QDwzXtu+7BLiT
	 YiqqceKj1B2HDw2+tdFaumdJ9McbzihrPavVu7j0mi549EKLhl6bIxTIlmWEd1Pj4vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdjEfdUL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YBYTndrI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFB8606A332
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BFB8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdjEfdUL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YBYTndrI
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAZd3C4136028
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x4JvzfQWnfY63emsL/cHPtwzBAs/PLs9EIz
	NEkVR5A0=; b=DdjEfdUL3QdRaml9UextpTbMDaGlSn2LGb+Ovmgk3q08ZLfZ6ki
	ZeXLani3YjCNTNQpstjrWEKquHYu7QMQwIflQY3W4sMOrUv88JJMgh6awnsENntK
	2OTpD7b45Yr2RSVymTy3TToR5oUAflabDbjQMzwIuQiA9vJaL470vZa8xEDvoBZd
	0BEZLyLtOd9V8qzMXHXOg6VZZnY3umf+4EonHphe975C0CvvneIvIRCZctln9u0a
	cbp6AUEuLIL3kA2ibTmYV6cu7//eb7B2Wy02b5at+hJQ/c5z/N/x7uejLwuQakYs
	I7WIVi9uZ4zURUcOufjiyCr0JeJr3IposAA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpha2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:55:11 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so4282184c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517710; x=1796122510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4JvzfQWnfY63emsL/cHPtwzBAs/PLs9EIzNEkVR5A0=;
        b=YBYTndrI00vbsUOllGH8s2MyYWC7c46fvyyzgJQu7wJsWoGRtyY3opA2kUmbcHVR5e
         E9lAoXPkBrtS2C7QTi6OUq8enYxL6cc6VsGWm17VE1zj3mEk1cuLdK1CyofEzAuY1c5E
         tf/Dr2kabc1hpkHS0g8fFSPZvDCshUfTW8d3UAvkftGfD1EaQjzaNc/UU3dDwhiKOGAz
         myOa3VAkcEuP7AanIGDE00F3tfSEsTfJ5wn9ifSY70O60PdVjwXPbi9LzKMlZXhi5r3x
         u0svxOzr3QkUUSfhodFS1WwCvH0ZsM/J7MINTUkrDQNNMVptT2qtlJFjhGsxvFEg7waZ
         G+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517710; x=1796122510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4JvzfQWnfY63emsL/cHPtwzBAs/PLs9EIzNEkVR5A0=;
        b=uf9VzIYV6yUz6FkPetxJXPGtF5y7PznyaRZShVy+Q7VtoZyNiHvIM2dp/4JV2PLLxC
         97bIqUjvCOHI6tZIRtOoGBQ2TxkBbQT0GfiKHfO3KtGsSmxCisPNYEFWjC2rb6RyT5PX
         O9Acgua5lEzQIsRJCDO+7Cj1hFbbfEgOQPXwBRzqSrSuQ0OwoN7M4cB6k3XXxixJsP/R
         CUtiWa5qGalW2bxoUR/ToWXCQIUYLkmypqSNBaGHuPDbZSYLxlrTmSyw0ShEEDY5DTRF
         L23JMshm6GUQQUEUHS1BlNOhPO1BqEelUN7izgNNsrSqoRB8bVKPXrOMMb7mqYqHaEMU
         daKA==
X-Gm-Message-State: APuU4Z+/jXHeDabHJq5XrP8ttlmNrhpnaPcWQt9M351S7ZrImIABos0u
	ok0OS/rfRHvptsnnlsLcQyoHn6bPVcH2q6f6aRAf3dmBSeEuaqtpkq7NfIh55tUjX3rqqMoDVIS
	VwRTmclwdr0mKbhqh4on6NMkyQcdO23pjaeM7eJ6GKFVlKypsaU1a8mYJ1Z1N1rl8IEVf
X-Gm-Gg: AZFdTZc4dTMAuPJwGPSzUXcGqWusGX1REKjbhy4NUksqscYJB2U94d8B3pdVGoniMIV
	3DIzUWjnQf6auHHkY4TYB3J0gIg8YJOtTo7Cvy3f1RifniRYf4whE/Wb6rqTmojaee228hgo/K5
	hsIcobCKFQYNipaptj9WPfxTdlGNiaomwqAJIhUbNZ2QJedt2t3qFslL0UcbigRxCkO/CzoyKp6
	durlLkvjYoMwINCmopbn/+6tsOKgx9BbOMYsdWsMr7WmZaz4kQRfBuKd+5jRd+KAKTGNwjC82eC
	lR9+4MYwNNarE1D0Xdfi6c6aUajPxQmkkbCgV2NiL5OiXEhz048FxQqhU9Mp1UjiXQeo8IZSXkU
	phCOMinGbW+xurROrBxUaxdlVx+tvLVFSbaxzEaZK6KgeHHsjkrc6rRv75betXtWqEZWAdNcoqn
	eN0To8d9WBjZclC4npttqnku/m7qaz1+XQ/VOI+hh2okjtqRlYsDqehTyj
X-Received: by 2002:a05:701b:204f:10b0:1b3:a05f:892d with SMTP id a92af1059eb24-1b556903388mr14536972c88.40.1795517710406;
        Tue, 24 Nov 2026 02:55:10 -0800 (PST)
X-Received: by 2002:a05:701b:204f:10b0:1b3:a05f:892d with SMTP id a92af1059eb24-1b556903388mr14536943c88.40.1795517709757;
        Tue, 24 Nov 2026 02:55:09 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm38075275c88.6.2026.11.24.02.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:55:09 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: spi: Add compatible for Qualcomm Seca SoC
Date: Tue, 24 Nov 2026 16:25:03 +0530
Message-ID: <358f1284a656582ef0ea0e2b7bc07224372f9fdf.1795517702.git.yadu.mg@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX4ZjnjE0K3LQv
 Ubbr+c0ltnzf75M5xas5jFhlEZkWdsGojeys0ugsoNuQJxUTEd/zZtvzhg89FDv5d7K3u+f5/NM
 BxIjWAcKBkc7xQ8vAr31qATviEOhXN3P2Er7v/LP/eIzj8zdIr9CpGkV1K350hUbXWYMaUQYJqD
 XHke6zvi6lVIsDbpjLubuwIEVkt1xw2fiIYDdnVg1lCSbjC3Y8Fqw2nGUJiMZEJx4cLpMWq6DKo
 zgcOQ8kbhYNF9UTnhVLazSdO8UAGS55pbQFFq3RJfrZJXXlv22KuRALycmMtDx3EtQU5ysHGP2l
 wUrc0DDv93GOmcdkd2cgVtObcpPcXVcRW3x6aK1oEeDC/jPVEI+YHXTiiNQPQaFxHItzrp/jQUK
 GgVGhH43VCcpZCF3GBLwpWEe7pRWvVsUbNESUhUe1JbrzvSPgQi/nN9AVGr+0f34vBJbkOJe73+
 I1/hHinFpMzNnQ/wYMQ==
X-Proofpoint-GUID: vIWZg3mtYDtratEUE5fHz8xNZIgyQaJZ
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b056d0f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX9isYyekZFk6b
 fZ9VXSof3x4GOSnUlQPJujygV7DWKhxihJwvxEdQsznFTCzy3B0HWlWm7xdY9UZI3axGanmHYdt
 LocMX9JwBq2RSGbTMTO+qIGIkXKgNpM=
X-Proofpoint-ORIG-GUID: vIWZg3mtYDtratEUE5fHz8xNZIgyQaJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Document QUP GENI SPI controller on Qualcomm Seca SoC which is
compatible with the SA8255P controller.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 .../devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
index 33eddb395a0a..7eb8b02253f1 100644
--- a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
@@ -16,6 +16,9 @@ properties:
       - items:
           - const: qcom,sa8797p-geni-spi
           - const: qcom,sa8255p-geni-spi
+      - items:
+          - const: qcom,secaau-geni-spi
+          - const: qcom,sa8255p-geni-spi
 
   reg:
     maxItems: 1

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

