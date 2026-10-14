Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B302469859
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960094; cv=none; b=JLZ20gHtR+rt3vl3mM9KhP3cQpnp9DuCiXtFBCRqOdTnxGKviPYkt/+Vu7Aij3WRl1Jq4v0adJFOzQWiEt6Q7t8se80hHl/hO1Oid4Rhu7eaZ/ilqudJRQmiwVjsB3ouo8AAWGMizmSDxSYJY4d3SSembQsSFTsQUYVK3nwhfYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960094; c=relaxed/simple;
	bh=PN595rmuOJuScEjlON739IE6fb80MQUkhHO9UMMLQqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBDeRyqLqji0c3QKXq/9yUNJIRhh72VbHmRYSsl9PATUIKLoftrAWR0XGSK53FKjHvQkudFF00VAbanMtG694nEvvUufY1Xv3VGyknZIn98OU5Xuq8VNjNzPldJAqOznEsbGlOrfSvRhzUtoJcfZI4paOVuF32WxmlNMjtwxyJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUBCVXle; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asZJawRq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUBCVXle";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asZJawRq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67mr52685347
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tFw1EjbkJf+
	dcBTMwmEjCYJEaNWWIxWMpvAB6zY3pK0=; b=SUBCVXletbIExXyHwR7Dl9lorNd
	+U4xsRE43da1jae57bAm4DG5Tb+qkDSIh2wxhCuw5/EXQeKhK/TtyDgycnJq9K1n
	fcP2y1Zik9W6XyltivNjCVFxxWHt2YOwjxL5d2UETPxLeuVd33sCOvgM2mF2JCs7
	Ovba5gmXVWVz56rMZsj6uqKof9yuepv5No5YVLMqCO0Omzzni1XhJ3Tl7oLTjb1K
	Rig8FR9TqMdgGVa5eqaInaQ9uQqbqoLT1QZOtwTXZ+2kgtOvXu5wsgKttGQCwLDt
	mVHn/GvD4DXsWNhBn4HW0rcbPVog2SWsh1PvXaHzp74Q9sJKZK6SS9EkkXA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u04dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd1e45a268cso599119a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791960091; x=1792564891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFw1EjbkJf+dcBTMwmEjCYJEaNWWIxWMpvAB6zY3pK0=;
        b=asZJawRqF6iWC5wC4eqT2mkTMExuIT4To2J4tcgzxXkxI96FszzK/cW8DE18dH+U8V
         yx0+PgQnLmpxjH3ObslFzKbfD2VPBWtSnoyxztB8xV2TQaMjop7YJkzYO8cR1o/97MCH
         cvIIkxaMjCxs3avCaZ2EOdppHGJmutXDDAdBHf4wkVBhZh3bhDW77tASh4saXTFjaI28
         mR3/iD+TX9y3gcgjwPD0PQVKTD4Z1tP90qEmWldMmmZZyBM3jkdixb0BUDELzBr0PqK1
         MgP3qEKekWvrJJkIiQO4+Tpfrk31OHtl9baD77TTviTIgA9nV8qdwwLuPT5zb8VA6IGR
         peAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960091; x=1792564891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tFw1EjbkJf+dcBTMwmEjCYJEaNWWIxWMpvAB6zY3pK0=;
        b=qriVEXNNnR7QG88Cn2Gm0uHSgGKEiqNi5sNyHKQrIPTSQtZeF0yXyLc7ig15/NayLn
         yEEiDyHgMtb8fJ9OJ+13EYd5Yvz3roncU1Gj8+R2SqErbIuzvoRHCs5ihiS6X/7MZmie
         3ojb5A4KZgXybwLM+WYxaDBNYXeNLekj6bqIssVlmcAzMQhFLzjanpCG7IO+qsFzh+Qx
         I0fWZRi/IkH8c/cjtaNW+0BDHPAS+jP7dgDVR97pjBS9dHqn94JiqWhqJUJoWU9LieqR
         z+uka/dXDeJ7Qiv55cWA1gFosNnfcrS6Y9oi2WjP2s9D2lo+lsjJ2a2RB2vRuA/5vtRH
         aYmg==
X-Forwarded-Encrypted: i=1; AKwUvBwdJSwMYdE4HxIpkhb0RAuub1YktregeXilyhNRUf+zbk5eI22AmbVTCSxpM7uHb1YP5XV4TuE54V5wUtos@vger.kernel.org
X-Gm-Message-State: AFq9FYKUc1wLi7v3RAOipVqavcrnvlBHr7R6prSJFxWmr0qt5Xi2la8h
	SrbBMbMb9fGd6n2g8EF7sI+VtayMjOKIwi9S3d30XuqHSmZZTRaSRDwNxxCtan//UW0BYLnYZKq
	GR7gIQ+ZopTgRRnA6nP4Qb4XRKy90EY42Ma8P5gSRMs92Dck5HDSJIx0Fh4clzFdVgF6M
X-Gm-Gg: AYBFou2ykmyxinPG2gIcS2vf4U5TCuhfxlhCD6woULFFlU6ps7jqrfinDRHcNle7q3n
	H3yHG5oao3ElJW037/iI4IsIBqR5Xcoz4of5lWdPiBcFh5cPeqIGWwiE9E9/MDK8jjv4LpPCv7Z
	O2QaI3gY/VobWld7HbdQV7g2NTX2PaWirNVRk1GT0L+rmUmPCcorGlrpx4yaOhNhiEp+p3Wes/4
	pYstoWMVCcX70nER4PKgIvxF2bMtTaXvMrsX4uPg9xA/2LM87MIUFgG4pYe+B3ZFEncGwGfQj2n
	8YADfsbi5H64irwGo2PzEyaxty0A4H6+to+X33d0ubawEG3fXFD3eWpV+H97dRqADc/QSnNSWvr
	gp0QV0022a1aK6FoCsWb6QDqH5m2hrZ5HyTDoybyFngYNJI7Wl6JFY++Gx3c=
X-Received: by 2002:a05:6300:2287:b0:3dd:85aa:4529 with SMTP id adf61e73a8af0-3e16be3aa83mr13683403637.36.1791960091261;
        Tue, 13 Oct 2026 23:41:31 -0700 (PDT)
X-Received: by 2002:a05:6300:2287:b0:3dd:85aa:4529 with SMTP id adf61e73a8af0-3e16be3aa83mr13683387637.36.1791960090722;
        Tue, 13 Oct 2026 23:41:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b8asm733221b3a.2.2026.10.13.23.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:41:30 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 6/7] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Wed, 14 Oct 2026 14:39:51 +0800
Message-ID: <20261014063953.549379-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX8agPtkLUNm+T
 HUxMTXJLZ1NPCysQgsXFA0O3eeYhkp1vmA5QeEUPFXqFrrl3g3DiNSH8O6U/icYXCHOrFcyDSRs
 zYdnidpZUNg5TiaRM1DFXSaE96P4G+8=
X-Proofpoint-GUID: 4Qc8wyK9PAbbdq28p2GQHyUYgu_NnXam
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf241b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Lrn1JOtORFUC_bamxP0A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfXyZPhvzMAfS00
 +9dVtnOuO8EvZeB2G12fcNaW53k0MCSFT2IuDaQKgLBiTDsBL2lrmHBq1HSQPU4po1cQ2nFrnTd
 pEX9s4N486zgxLZ5mKRHzro5rYncsG/es9HO/pUcBBl4jawaI4SiJvszVshjFk7noRQXpFftpAr
 ejyP3NnbZCXRtOCQr+1iHmoU69kcp5oE75pOEk741l0adxmIuS83Nc+9Aok8idLUOm6G84VuBrv
 Vbiv/rNe/T6c74OOvMWiKEG6nshAHbWjpfQaqtUQkw7bxO5z6E4KWXqK837M7LR+rXnCvsIFobw
 tP2GhC6hbRRKlR/z0ulaijcLs+68v3YuwUAmxdQy+NcoqkEAg+S7xRRZlIB4sKDB9RuViZTDYDy
 xx8A+LADH9WnhD1HWq4bznoOvOoAQqHRVQmCacGcrQf6IBkIByn8uQ7OzXFYF0wfolvWrZEkuMM
 PwGaloIJDERhISxqZQA==
X-Proofpoint-ORIG-GUID: 4Qc8wyK9PAbbdq28p2GQHyUYgu_NnXam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140026

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Document qcom,sa8797p-ride-embedded, the Embedded variant of the Nord
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..7557efa4e168 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -434,6 +434,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

