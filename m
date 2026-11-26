Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699302;
	b=B/8zoBF2HoV+aG3j23NUew+ezH3bUOwAEY0pDaowhAU+KlIcy4ERAX9LQZrE3tbkB425
	 4+pe+yNaqrOdcYCRrwNF5pJ/LH3vJAsfTVoVRe03Pr5AmBhnsOjbWz9VfXFIdh/mmKybe
	 DCsGTfo9spVzvZksVU579ZOgkcARTHmiJaBy9MtxGND6xFMEe+O6bXmO3MQPErrMvWAgA
	 gXuo91Oxhme5RoE4iR3BSnmQB2o3J5HR5h437TPdPJhIa+oMZYDN0Hqt6mIIMfq4372sA
	 RpzNnwcTtDguRqU5Q7lS9J/yF6/lvR2UYcsWf4+s9vsvqMM9vfRU4oS69KFXjVLC1vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ASi9w2G7r/NBiKc+aQ4v78OboFde+sNbqo7EtDF+qdo=;
	b=oOIZ+iiWEsmgw2b5ujfi+cwcAIH1eCxckYu7kmRY7xJii9qIVVLFz/I7PUDYamrriEQr
	 DX1iL5tB5/8nbOqnBus6JIH0+LTxeTOnaAzgsX0FH3/PHkPXo/4ZFhXblHeYJhRVksDHI
	 DPeHbbsusKeavgkZwBy6qTvHQ85L7VaR3vrZtlI612aCy2DdYRNuS5UdaFAZ7zy/1zQHw
	 ZPjtAsLrOE72bvDr8OfuukawWwjgma7J0adv8OHJkY64cHzguz4Tqlt+9Q4D7whFfJ+Yy
	 wJFIHjme4nq8pzZppsRJT7R356iOm+jd1CKSTQq8tMaaT50cuB5WDW0jbERP4hIrinQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACZnDq3M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDkdwBDC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466DB606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACZnDq3M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDkdwBDC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVb1G3476321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ASi9w2G7r/NBiKc+aQ4v78
	OboFde+sNbqo7EtDF+qdo=; b=ACZnDq3MC8yaqyoqDKebck6HUKexUs6HjmnTxy
	nuIz3EIPwCvEI1xnxfwdsmsP8t8al5JIVUNtebcXinRFlWU81yxI3Ba6YcbDNrR8
	fr/ICr5UWqrYWTbfs561SWkfU8RngPYxt3SivuzE6erFzOSLpEQkSOQVoeuIhTwC
	pOr0z6FI5g6kgW7NWO78QkySrk1JiAiOOylE2YrbK3YCe+SGyd6wxLGvgz8aENmx
	SvQ+aDLMvyss4gpk15+SUUlOfuPk7CvWq5mk+Ne9c5Zj8Dmyjo5TK65fUUQZZrsr
	e02ZZaXqlD3ommXV7ut18FIiuyX++bVk9TY4pnAaE0FWzl2A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rhje4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:21:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08904845so92439995ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699300; x=1796304100; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ASi9w2G7r/NBiKc+aQ4v78OboFde+sNbqo7EtDF+qdo=;
        b=BDkdwBDCCfUnIaJmCGPidLo/YqPGws5tvEmmKPDoHYfyo+ej1DUAFOd5FAHEp8NrVY
         Luq7x2APCCH4V2T+sRVhOVCD3XqW5qr+I+6uWtcdaubzofqLE+CCHas8/HXvhPudu8Th
         S/HMmwb2oOdwM3qNXoXsP1ZjHj7aYUuRDzZm6cbO4yEoDQel7kdrG5wnGef4nh7tzTnD
         quDQNz2wbR8UuRQgDEeigySO9OsuAdP+XsLUjcEbdnSPuZYsxxYzkDP7COwCQyb+Ay+g
         7hH9kV2cWIio1TwluaoyAMDuSRen+NWmiQu534BEw3PdCSArmCp1v44epffpInEMOyhp
         Xm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699300; x=1796304100;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ASi9w2G7r/NBiKc+aQ4v78OboFde+sNbqo7EtDF+qdo=;
        b=Tp49ka7z+Nge//gG6NGu5HyiyT4QGGB3CbjkALfIEYgk8Dm+EYdEmQd9CG0ZokIEoq
         /gkBke2TB8ACNuhTKnve/C7KJOgTfqKsXHsTTF8zPTodCRlKykRkxAGKi1vw/3A/H/nd
         QH2pB3jP3I1eX7juGKVeH/5dL3cHby2J6CxJrzltWkbe77/BqG7EeuFbV6cFY9MxiD5l
         lEvQwb1Tg1J0/g4Q+e76vpa/lRXmL5GTGLk+GX4hQkA2ZWsN63+X4yvzunrz1DHYqekk
         QtJKs6SdfKclUZGbtcBhlOx7jnsp1wHTT4YDEnPzV8BfT+BX3Tu3Iq4Zkn/9jUmADTcB
         zslw==
X-Forwarded-Encrypted: i=1; AL+hErEO8HcGvxZtCQgIOElm5OWAr+/5CN7jQZTHHzepBsAjLOglSJ6g90W/3myOwjJmz5d8axsFXG4Rk2rCN4wF@vger.kernel.org
X-Gm-Message-State: APuU4Z/ojpWq1nRA6+vplOcMp6v6qGU8iJyCRH3aUNB8Oz6JbC6PtWEI
	D0rQfhb3dHzss4HwV+ujHskvdJxmWRdrWDix/khAhV+/Ze0RsRdWJ5oKttg0MR9/2b0biWAgzeK
	fm4sKoxzh5GRJ3f7JC2tINuqwxL3Ch6C7qQqz7fjHs7HGh8t0gylMqt52wmLsGYxSNtRm
X-Gm-Gg: AZFdTZc7Ny9BXbarn6qobLME/ZlGo3ZcBWrbO34hl8O4t7ge5DnehsnIRMKY8KPZEc/
	dI1VafsoQBDQtMDouVWAXN/xo966DahQmkjxih4vYKfqFvjyvjLguRDRJfgIMM4BFmCQ//9qgCa
	EjxBvKsFkuy6BfobWlbVG2X8oEeVKIvAdAq1To81mBqUTcFyzVUgU/OMgyeacjZP3U2gE3OAU69
	ovZrLiA6iW0hJ95DnS54PEyb1EXvJFc8WRD9wjnEx8og9y0+qvGYavFWachx7W6lSlKlyF0+yMz
	YMKHw1KY5Bf6fIHwbx3yRQzcmkB2ZIWfet+u5bKjlFsEwFExjF5DufOxXkk91OU7bDxd1IKSVZV
	RBcmaXLUnY2G8R82Ugb0oA1JgzQg6xfDBvnPavYdgVKgfbRWTHU9uwVonGr7hR8Tpgrfav1lbSr
	zTLORE
X-Received: by 2002:a17:903:1c3:b0:2f0:41c7:9a3c with SMTP id d9443c01a7336-2f041c7b2ebmr216491515ad.8.1795699299703;
        Thu, 26 Nov 2026 05:21:39 -0800 (PST)
X-Received: by 2002:a17:903:1c3:b0:2f0:41c7:9a3c with SMTP id d9443c01a7336-2f041c7b2ebmr216491145ad.8.1795699299241;
        Thu, 26 Nov 2026 05:21:39 -0800 (PST)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2091sm102542225ad.20.2026.11.26.05.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:21:38 -0800 (PST)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 18:49:27 +0530
Subject: [PATCH v2] dt-bindings: media: qcom,nord-iris: Add nord video
 codec
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
Message-Id: <20261126-nord-iris-binding-v2-1-95c960de80ff@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN4xCGsC/yXMywrCQAxG4VcpWRvojFAvryIu5pLW30UqiRWh9
 N0ddfktzlnJxSBO524lkxccszbEXUfllnQSRm2m2MchhDiwzlYZBucMrdCJ0176YzmE8ZQyte5
 hMuL9e16uf/uS71Ke3xFt2wdiyN9TdQAAAA==
X-Change-ID: 20261126-nord-iris-binding-a3e08c71f9ab
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795699294; l=1952;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=rwX2X/KJkEINyry/GicIz/WsvjLRsBN0nV+dyEuYIMA=;
 b=rcwY/jvWWf043otwYuucp8QOsqWmrZ2NrtAO9aH7h6sP7KfVUFUlc4AA0l8teCPK21aQDs8A3
 sD+W7kjoTFZDuHCE9PzKzON6qvRzL+ulh8cLUD8J6SwuAbJ69cbDZYk
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfXxhpo6sUWFK6g
 5TZZ4GyvWNU8JGwXrfrZhlcdmCbGaJM1DcYMIXpRvRQF2EpAEn823hQTNy8JXV9hPqBgUXg9V3W
 FWqZXx6bcogj5ZVPg1UDnIw0NIsB8VDdbto3TiarcG3G+z9w2HFzaGsa0g6AUzoIt76MvlnESer
 5ngN+lkaaoTkBptDbltX9w/dsTHJE4fvlnu34QGYo8inbBits36t1t8vk/RWIKBqbbpZl6xl52f
 sn/ikkBryULumCj5vrw743uGUZc0Qcu/uk4zpM5gvdolsNzdBV2PRg5EUtVW1cbZ6NIw4kloOeL
 HP5xBhILX8Oyy0IYK7TjhRwXKkEq8cEf7SVAlgdckpscyBMXK1TMtIr0LOswWBuWWsiR/YQ6Lw+
 UO6qJ+e9y+MxwSIKwWEjgkvvet0FZFuBYSS8w6DsYuACvZFxcLoZYZyTsx8gwFfszkw9d2jPRJG
 oEBdwhi2+eU2fon2QrA==
X-Proofpoint-GUID: yZ39p46U4gfJh0I15K-3OGEd86FDX85l
X-Proofpoint-ORIG-GUID: yZ39p46U4gfJh0I15K-3OGEd86FDX85l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX1XW4g9ZcDaT/
 MicBS2ooVfKhfj/Kbi8KfH6GnfIld+0TZykBu5JbN0OnDR3360P7NXVemWYwJQCK8HNRNwCdOej
 v7RxEqfIekKl1hbWbD7+DDzJ2yoiSjo=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b083264 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ba9tQSLWzef1rn2_u0MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

The nord platform uses the same dual-core iris video codec hardware as
glymur, with matching clocks and power domains. Add a qcom,nord-iris
compatible string that falls back to qcom,glymur-iris, allowing nord to
reuse the existing glymur iris devicetree schema.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Co-developed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
This is the dt-bindings patch of the v1 series, sent on its own so it can
go through the media tree. The matching DTS patches enabling iris on the
Nord Ride Embedded and Nord RRD boards are sent as a separate series.

Depends on the glymur iris binding, which provides qcom,glymur-iris.yaml:
https://lore.kernel.org/all/20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com/

Changes in v2:
- Split out of the v1 series and sent on its own, so it can go through the media tree (Shawn).
- Link to v1: https://lore.kernel.org/all/20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
index 9c34829a451ba..73c2d54a5498f 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -15,7 +15,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,glymur-iris
+    oneOf:
+      - items:
+          - const: qcom,nord-iris
+          - const: qcom,glymur-iris
+      - const: qcom,glymur-iris
 
   clocks:
     maxItems: 9

---
base-commit: f1df3263878748f8995d25f3ae566c49c20ab155
change-id: 20261126-nord-iris-binding-a3e08c71f9ab

Best regards,
--  
Gourav Kumar <gourav.kumar@oss.qualcomm.com>

