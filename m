Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE9046C823
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778288; cv=none; b=Hkyb9eihOOxeR6LJyMjRYstXLrMvasbigPxCBDIUWhO6qShiXWnTAHutcOz4c3r0KWYdtwGcCxVe5qJrHo7FqKc0CFq4mnkd8QviQlveM9aYxRxLSmqlG33TEMNiV5Hmfd8/+EHVAQOv/xARySW9kYP95cE12EglidOLrkPlfJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778288; c=relaxed/simple;
	bh=i/EfGcaVwPdBD4d/EhaLA+xeFVF7rZ7sN3Hf7EI7L4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDu8j8awPaLWZT5+auNOTBYI1GFuNCnVRqppYnHFZnK1yGR/L8GXRLlFgOwTtubldu5cIvkG0PXCCfHR+Z3X/mboOyvNuP/FHc9/Og5wcDo/TKDZff1xD0boH4nwyVoCY2idMJJ8OMQ01ZNzKW9BBaGurwczzeO/GQlBdqVcjnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkS27gba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDgJoUUu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkS27gba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDgJoUUu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnDK3004214
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=; b=NkS27gbaG9d3MtXD
	EallBjS5w0lf0sqjQLAsXEOywa0b2z0b052QCQ1y1M4O4+dlsA9xeG4HXFExz0h+
	jUJFk+4RqFImX02ieA2adl1CAhMSFb5om239ggLmWUazZM5TEfE7Ewxcwo3il836
	f1Ji8CsfCTH19QE+PrT0ijMcCR8hjrb9qMkA5WhC/t32O8AsaMX/OhtMtqwQQGfH
	TpnH25dfQ3pHJe0vBfyVPf2gIYwgiUsW+B0F8WMOEygtZOZqn6BDC4anI5hne7V2
	sop9JBy0pZYYFF9eDfhigjSL1J17NzdSOe6HMexkmybb/FHSlMtkX6OLj096ILr7
	W+FUxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg0mw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:51:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso457232385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778281; x=1789383081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=SDgJoUUu61Jeo5iOkwn2qsI/lbN9q4MpM+53znFJUH3P6d+PLLgJGX5yLQoRT5lk6Z
         v10NdLNb+zkdEW4x8F/+HTR+8HQbbzM545iXW0FjjvAqy9z7rww9RWidiLXEBtDurWWU
         NBfBWxSe64K4qisQAADl0NH3VviYiuxWzqGztdxrGvPwtgD24uDxsPze/H19kaDJ0IeK
         fMhZQjc8zhD33lGNFN9xftAb4rI1PJ3iQ8aUo3kvW8nL8w3Bq3hiZtVjvg804K0T1agO
         83rUPumybMDKBGZxCtnxS84rk34Y4UNtLd92hq5kkoqoi9HqRR7W95jAd+8945E4CobM
         MP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778281; x=1789383081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=FB0c+CVev6AuQ8ei5wxDH7lb2jk6Tt0Su9TXrJ9nDT2FhA7wuqpbfeUB8jTQLCLabV
         c03xiR8tOZL2VXe5DqU9GP9ja+TDoHuJ1IbAMQBaELPt1vL9S98Pefb7Ri/CKQusAsUG
         NYs5kd/nUbjy3vxHr0iEFGHLSOmmrIFHLbr/w/XgfoCBW1LySphzj81V3zmYkAYttT28
         2E3CXdu8cDNxygn61cPk40g6P4Nmz1l7BPutvZbP+kua04FXyKNPPgyreFqGxm818vCs
         oBzScM2YTeymDe4isIu3bg0bDNu7+WTo6mHFzYY5jXArLHrUf10EuoWbhgxS30YlSM67
         27Ow==
X-Forwarded-Encrypted: i=1; AKwUvBxgByNNdEPEEqx62W17I3bGjGxpE+2xJqZpMNhfkJQUliWWPfLsNoiNpz29eY1KISRoWkf0I+k98riz0jDq@vger.kernel.org
X-Gm-Message-State: AFuF++mewcRJPAbWpqxRY6/KukK+YoNNfRvtyq9axyzZ91RRvJnRBSkj
	cCMNENpOj4t847WwXJriY6V4Z99L7FQ+NWYaKfUXm1SEnfv36yWL9ZmhGRZkWLJPVJrbQSjfFhb
	zOOqP+wOjF6o+wjxWPaWV2vFXnFlxk5uUVLkj1TJZjwbFx8GAMBvMtXnSBySk1bv5qZgd
X-Gm-Gg: AYBFou3JZZC7SziGtlqwC1ILf8fUBj/Z/agPm/HdpYVtjn3r+E0DyEWv0Y0xGxonKLh
	VyxipbsJV9ysGgHRLklhgJEAIPS6+BlZO67NeIPwnf0MCrI0Tq6Cev9+xl8FnGbMu6hyGdyvavH
	t/jqH40JOuUryyYWyb7mjhtt02UBZTNSTxR5/huuY+ACCcdX6S9nBun3aqWITyu2yCeTcII7ZMs
	n/JHPEaETlzls4F0Kie1wjeCaoiwca8vQK7UOKZOwvHvQc4cFQ42UzHBG7Tr/T90Gp71zER694c
	j9Csr1wl3Qi3bAJCkP1Q9gIy6mRzpkoc/lkaiZ4lrAbIP1WiQ3IU+ss3yfZ8XbrCQN6C9AaK8lE
	4BNqJtVXJEOcyRPBPd/sj9+Yfig97zWqJZQKNk93HsMbT1dc47+B1kHaMLETgwMt39Tv1MV5IGU
	VyvYV/quD0BTgafbp0X7STCmf+G4db30qfboCMVaiJCgzZyISIeDg=
X-Received: by 2002:a05:620a:6086:b0:915:a953:4b9c with SMTP id af79cd13be357-93980324543mr2237088385a.3.1788778280561;
        Mon, 07 Sep 2026 03:51:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:915:a953:4b9c with SMTP id af79cd13be357-93980324543mr2237083385a.3.1788778280175;
        Mon, 07 Sep 2026 03:51:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:18 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:13 +0200
Subject: [PATCH v6 3/8] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-3-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX6CB+RsutbW32
 SECXRwqUMtvfZN5Vp2xtqL9xGOTRU1UYDYDNwyYxEC62Q8Qp0aPQXSQt4MjBgCH2BDpqYga5fo1
 PA09rTYHMJ0Xxm41VBun7m6I6UvioH0CDM+2R9ifnUdPFMQovEExXIRjNX3re9ABUItYZELM+aq
 9fmkDpviYS9U2CkBjZOFi6EYqWeHipO3QANRDcvDS6xvGZW7RG5tgVI7n/OLWNQ3rExQG6SW48q
 7bDWT2GWQ07YZ2SALT6T9b2n+QuaAcqc1bRMrpJS81TWz6MAUYObyb4DHet9SRiAV5KrBHIrjR/
 mWxKc7T7jek0weTJxLtn4GOdbLQBgdBq/bkk7HAZ+LgSyTmty3qcQO/vxaDwZY9XnZA51qye1XV
 BbYqpZTMnKNdp5SbbGeZsCYg1pK5ezMa8wMq2EhBSWq74WCNg/8EUNG435GTNbOKITkvHfYaFJR
 eAD3t2yDJq1LQyoNLQA==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9e9729 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: DdBLwjkU5SxVQ5GpZWdxaWSxhkOIVWx3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfXz01CO2M46uCQ
 g5Gxj7aL64+k7yXC947xdL7JhdvYREiu63ygKw9muwlY7fhakDa8oi+d+VuI1hzYEFtmR9akdzC
 1Ho/sLKXtp7F19/q03NJduQCIHwnTjQ=
X-Proofpoint-GUID: DdBLwjkU5SxVQ5GpZWdxaWSxhkOIVWx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070118

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..90b54b9808e5999a4dead404aa2063ab695cdfd6 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,8 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
-
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
   reg:
     maxItems: 6
 

-- 
2.34.1

