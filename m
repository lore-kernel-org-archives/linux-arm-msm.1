Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100681;
	b=h2vy5TlS87YdBipyqepe58JLkCk27j9a2SjEsoAwbAZlLHlCAF+x7UJKgcOQ0LirgD89
	 qw8rfrFzYXbBy9Sy7/+TlpzlYliKI0Zqke7FvlPZtWqKdRkqmNGDPF1HQ0F6qll7+zQDz
	 ypt3+pZMtuEvG4ttZtRO/oT4oTH2auuaZMR3WW+3vK5u2WKEH5/m3IzWL4pJVX77qFpQB
	 Eir+tj+l+KqHKx+qB6G2+K++gAnMkQ7rmg6mtXTbRZasbKq8X8Ch6DeqAg7lR8uOqsNZF
	 oezFF1OdnR/0V5Gd6tgVldQS04sQxyurcqMFIksLLdt2LoWA9gUUcYMpAMLqeBKc0Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=;
	b=IXQBudGtifhYN5LhgAO6u7fvKqrvNgUh5MnwLQZUhhJpy5xD9sMcZxkDCMALjQVDLapO
	 jgMUOJStTUH15DibOobGVl+dw+CyezIucV5qP0z+gIy05FLlM8mdFRkMhu88irVsG2lhQ
	 98HoBdsVYGJ6KGpcTqYi7Zd3TY25kqoPZfEG7C1KjIDHoJfzZ3yAhlmHZqp3BeiPdWtUV
	 wNGxbzxBFUTRBdKM382Wn/s9N9guI6Tq4YwnEjq+mixf1HbLn8OKokVUawYl3gF7Obil0
	 6ZLpp4ylVX3tQsOJW6LUGJngVO5D9A0F00Ta+Afp83thGoQ4JWuWGvWWZ3bNuKFEPtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kq0ZjYZF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsH7ob+B;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF308606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 15:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF308606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kq0ZjYZF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsH7ob+B
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBkInF706142
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 15:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=; b=kq0ZjYZF8IEclIc8
	XnkCK/LXhmlXpTCHO9Mql2pWopVYvo6t+Iq1esu7ql/uYOHPULalAzGsXBUkHb0V
	GZ2WhMfUUQQm4hRZBXjMWuWwM/AO7hxEEU92I0LVyjhKJ34qvKqHTjkeYUdbTf7t
	9xJFv2vM12RiJOffYbk5teRA+fhVSMloIAaoDdblqJTCkxpwI7r9kEN0DJfz1Et3
	oApL2ohz4iQY5xbH4RUB241h/7ozrFLHP8ELgAVp11HLrKKwx/N7Ctf19TD+M5OZ
	xlXPZz1LBqZsC5sBVwBzP64s+wA36NWoDcoNWjE6xXeQTuA22Br6jQv92gJ+CJ6N
	M9toGA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x709d7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 15:04:39 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0d978e4faso33764787b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795100679; x=1795705479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=;
        b=HsH7ob+BMrm4G6AzCHTvSSMeGZtGT7ZGUEYxG2Mj0h6a9+6W3MWcBuLu6fUoNZAUUz
         jc0JWItKM54GC8G4L4XRD/60ocKTYZtFUYbmStHc5G1rOa/rIixxnn6733w/jEOm88PB
         VrGkV9oHZtQlabZbMOa8Ps0w7WxRL+GR/vMn1E254wvUTZ7ohkK2BOU0AfnzFE0/2rbu
         5EVem+ujv+Q2Dkl6uF7ycXh7iqrzgDjwDhJFyr/wKiH3tQ2Gdbp+ik285K5rVWuK009A
         EFALnMYs6UQ6JhecG9V2mLgXcLRiOBp4cKawXHPh6cNoEt51jNNxwvnpYOJyi6TlmY76
         0YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100679; x=1795705479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=;
        b=JEsFedmvjz+RsUIIkQ1SgP5o2tc2vy+hwSBVx+QrYXYaOJoMt2Qtl8xg6+CrBqqXE8
         1OEtES5Q28jiT0ke4wYc0O/re2bSjhbsVoXw9FipYHnc4cfFiRXrkBGEEo5DWRX9OMhI
         4FbeGhsgV5ZtEgQD0YDKdTg+frbNg5ajOKuNxouKOEOJW9FL85b8x1YHGqIgCQZ73C/Z
         unMWCUKSsgKbNlTKLrxAt4zbBj3qht8lgK+v2w+UiLgWyn8M+Gr6hLYOt5xJPgKLNbsf
         3TqviQViW70tRFgiMV0xZ7VVjwmG143XHxYuRDpnF+5TL5YzCKrva1Tojnt5M2oZDCPF
         OGuw==
X-Gm-Message-State: APuU4Z/v1F5UM3FvtO5KKxC+IAzTaKiADthFPnN1jOQccwZqf/V24ScV
	iPv8yvSyag4+Zp6ve4fOLVwrgSV/Jf3vVIJf6Qa6eMDlkLERbRQjunQukbrz3QPGyE4pWXsOTtT
	YHYbGFNmErIAXTTm/5jJDkMzY9mOR4We3FganRJzbulFBP0xX1IByouq+HBmhJBF0JZagSz7NC8
	AO
X-Gm-Gg: AZFdTZeVCEz5IG5quhs2nmsNfHAdX0apTJyT5eu9F/OcTd2z6cZjuv42W3rh81qt/q8
	xnan+UgblBttyJmEqs7lwE4VnTjucS/Vu3eZCPoTENlMYnsNvj5YDe4KWWFWWXRfYEz4CZkbCeb
	obDut5FTqsPvOZW4kdI5w/GSkQQIUOVehQ0pT6f2GyR2GuGSajE62wao8M2GRfwO6lIyHCybVso
	LH3gr1aTZwMDo8jIlQpFPs0TV2HneQAbQHJLnCw1i0HkTIg/TMkXQwhqt2jHMrL+LpxtNQf5f18
	if/nFhIHpcmyuRtXYREkpq9c0Ybs8fRCkSLNkqFpjcQ4UOhDioIePu8oDrE8jEPSYi09ASk5h1l
	enFmsqIgGINXeyLjTsLg9mQwLhkkwMrk0wKZqhUZZn34kU1bVJN9T6W8g+xjhqdYKLMDJTsjjY0
	WmhIj6
X-Received: by 2002:a05:690e:168a:b0:67c:2421:f2b2 with SMTP id 956f58d0204a3-67dd3cf9f12mr2735263d50.6.1795100677522;
        Thu, 19 Nov 2026 07:04:37 -0800 (PST)
X-Received: by 2002:a05:690e:168a:b0:67c:2421:f2b2 with SMTP id 956f58d0204a3-67dd3cf9f12mr2735212d50.6.1795100676977;
        Thu, 19 Nov 2026 07:04:36 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33d64a0sm79790d50.22.2026.11.19.07.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:04:36 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 20:34:22 +0530
Subject: [PATCH v3 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
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
Message-Id: <20261119-glymur_camss-v3-1-71ab966c41c9@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
In-Reply-To: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795100665; l=1615;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=3SVM2RsbonCgsgSoLY2zONHaCQGkDqvlTsplAN4cbGY=;
 b=rjokAHLP7v4iGEBnNQxOz+He8NglBkMudWEz8bESTeFaAWase/oibnkG8M8RJCfPg2ezzAVLQ
 QgbGp54zepaCb5SoeH64O12mh/ybNdtHTBQDwujcLkCUXRi2H94ZQtI
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: WrE10Xc12l_5CIx5_rQHrkPde57ez9Ag
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6aff1007 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bf6BjHq6SqOzxvFPJRcA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX558rdoQPJEQX
 DJhfB4+ApE6UtTjnAik0Btv9giCt7wxjQXN6niJz/t9xyMuFNJ8fSGmZ6fwOVUfs5WumRyrIkYO
 q0WC6WY/oaG2NnUP2lPKyaRnk6YqxTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX5PYGoWF804S1
 gxfNSD0Xg9Pdq3R1lT+FgRzW/CmBdKgrvYSn7al0GeIu0UYk0yRmDNgwMrlkT3Gv45bqWesGHL+
 K1SzNra4y5P3ONPIKlwRYTKIifP83Q5ZzxiXp8cgKKCb3D9K48KVL1zQ8ilnyHanBH7BBAUiRpK
 9DALoxMuFffDENhIw5elwj1sOK9lQ8BZ3i9g4TZ+t8CFMs6VJQWb7MqUCL8K2sWnim6wzAUCe6f
 40eheCt+vS6SGJca/JDCgoSViAwUN0BwDiuwF18fVTqOl3t+5FYhM4peBxoywHrCw3ARc/aT22r
 4WImd76zr0Vw9EGLwtM4WhkGMeoBlLjZ2NKGag5SJ9U0CVa1R60zyXhjTE5SnqoSAhGcT2Nvkob
 lE8qt3UAcqOQmOP9jPsLsaGAn0myumKB1nIPvxB9I3qhN17okksfmlvA4uNaZ3EDVOy0aIN07AC
 r3wBzxkP//l+rOZKDmg==
X-Proofpoint-GUID: WrE10Xc12l_5CIx5_rQHrkPde57ez9Ag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190059

Glymur has three CSI2 PHY connections: CSIPHY0, CSIPHY1 and CSIPHY4.
The existing ABI used port@3 for CSIPHY4 because the driver reused the
X1E80100 CSIPHY table, where entry 3 maps to hardware PHY id 4.

Use linear graph ports 0-2 by replacing port@3 with port@2 for the third
CSI2 PHY connection. The matching Glymur driver data maps port@2 to
hardware PHY id 4, and there are no in-tree users of the old port@3 ABI
yet.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55ed4fab194091c02 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -109,7 +109,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]$":
+      "^port@[0-2]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
@@ -288,8 +288,8 @@ examples:
                     };
                 };
 
-                port@3 {
-                    reg = <3>;
+                port@2 {
+                    reg = <2>;
                     camss_csiphy4_ep: endpoint {
                         data-lanes = <1 2 3 4>;
                         remote-endpoint = <&csiphy4_out>;

-- 
2.34.1

