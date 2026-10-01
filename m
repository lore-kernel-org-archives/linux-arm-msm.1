Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC21516157
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858823; cv=none; b=GvhQ8t5xKUkEj3GBG1yY3+vRr6ElioKRJ2Zq4Mre6xP+1G+QbDN5sqU6/qHt+gz2wU2r+DVSA3FSRyVtgnPz1RtO4b1kj8eDvsS54WFjXU1evNymWLodibY7vVuKrTE9OqGlsoUL4HlrFnRY9AdrOnY6gnT+4WAUbEQzRATpLQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858823; c=relaxed/simple;
	bh=dukl1Ljyz/HQATlIcbIQ+m05MS/1fL9Uh8qLiZk8FkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mi0Hi3wyJZ/6NyoFael+kr2biA/IGRZTQYZLk4RDgFD6hmpeIVsWvWaRsBR+h0NyU5of1pQufNCAG2nhGuJmtn9cbwKxdjIjamqZ2V+bTwsXgddY6bx/xcghdV2JmehjewttfJwQqy/cBrzGEKDREBu8T8yBm/gueFC98tS9kK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xzi86fjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5aa/ypB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xzi86fjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5aa/ypB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xmer1661068
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 12:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqljWHmubT+QY/DDdNs+Au/WeKxBS87FKchbCGNuj3M=; b=Xzi86fjViShIkO/Y
	cOlkGwCFgWRKObawzPT0yQZcV1ku3jbjQNxJ3UNwu22Lu7FFX7k/zaC7pm//f5io
	AGre6/tjv66WWFH5xQP60taQCijh2Va5+z/rL5zi/2Na+ZSN28A6puKDkBKUEefh
	mp3uuaGVY8dt8qzsHY8TVJNTkI+2NX72wMZOGTD6aH8WQyl1i2o0XOq3LRDEcf3I
	f1lFA3fEU8u9XlWnDWwUksBfnyVGqPhBmaxB+wS2snZFWPt6AvVQyf8L+JCjLpeo
	lBBplUgPUZYCVSwpMlCDx4CdSNZE8SsB6nOdkRCjZ+p3l4DtQBXLgmxlwrKWDr0Z
	MprhVg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pmgba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 12:46:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a4f7eb79f2so871717a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 05:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858818; x=1791463618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqljWHmubT+QY/DDdNs+Au/WeKxBS87FKchbCGNuj3M=;
        b=F5aa/ypBupayPqbIGKl8TbEuE5quiRI/eVNHBa14YjPZvxP1wGVlr8X0M3YLs/tHk6
         +viFQ8o+LNURFADfoBUXudsnuGAYOIMxkvfIi8JMfyDWiEcMCeyDb1ZG6POvoalujVQL
         ngI+8T0hOYDr1mmxW70SC1Z6DrdU9ceIb4dSTWOXEtLtCGMHNx55ikQgsvHu+69nSmF3
         +wWLe2xIEoiuUPEAWGgKCwocWLeocbFAj75R0NLIskvR22XIeii9KdnePJX3n7O0phTL
         l+PrjcByDImu2LFe51CKLVuXDEGN7o1xUrL4BMmro6BbbIIjV5Rf9bp0V3QmqpE3e5Rm
         UE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858818; x=1791463618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqljWHmubT+QY/DDdNs+Au/WeKxBS87FKchbCGNuj3M=;
        b=D/3rFrxEFp8L/2IXcfnP5BSjOlvKKZNZ+bMeXcHjxjGfbATBS41bK6nRe0IWvFzlcc
         DX8lA9+OY+n5ovSavwVC/w8HE0ravy+v1sMiVN1RPsrgHnRUgGssCO3QMQhuJXo/yhCR
         PgbFxMdops2tJz6Uza2Q4M39EHoHS4UrgromeGvAPBP31L1HbGmhSBkW6t6iW1Dr23vg
         i8xADj1ua3WJOl/5EyNWoNx0aRdX9XHOgsciMiAuCRoK3D7WL+6Nr48Bo0q2fgEQfkg1
         hRVLwMVQIIfzvF+I9WZSRhtCZHHiy09MuA23b/flJ7F1M/Vug19nfu9A61CKUIUvFA0E
         Hklw==
X-Forwarded-Encrypted: i=1; AKwUvBy2tERbDwQvCfkx+iauKk1q+Vwfduc2WSPr2Qte/r2cB778nsq85WBdIgnJEPm44IEvPtm7s/e7HNTyNSeO@vger.kernel.org
X-Gm-Message-State: AFq9FYJDNwcAUEeGmuUKL+/C/Kku5aS+Cu7P6c7qT7yZ6mQMDTZz9zTF
	12/qkGS4eQf0HcKAp1angVQVWe9A3tiU17e4tbvLa9mN6BZ+DrYRoNdwg8nrp2uJSsw+kyifJS0
	5u96ehTItKUCFR40vBOsggmDl/5CoancVHX4D5JKjAW0OmU5LBGmMbs6qoE11nHozYsYO
X-Gm-Gg: AYBFou0WOj6FN9h+GMo6YqKrXx0wJz+QbG0rnsXRf7zYZNeFSIlHP/Er+GH3V4TC/ya
	G/Zvy6dxBR6oCcNc4TmOrWT3p86nIBD6nx4FCylvb+AdVU7jCGkZqOHRZ96rS/IMc0lc9kkee77
	4q7eEqG8uQTY83EqJ8N+UJx+WKFG+7exGaBb32MooiHmlGsTwB5K8PoCou/MIsGDtAyNcueM2Gv
	5nh/PWlq18jLpbKYoGyns0YolSNZRuVoJbp7soaqyhM36ihOUZqAUlVjjY7QHzOJ0JnfiJX/4P0
	XVN6lgykXsAkeVT3H+4UROq7VBYoNOFBWFPelshFDc6TDvCFH44j5jKl7bNWXUh9ApiHzV0x3Et
	935WPoWIP78EoUjCX+Nc=
X-Received: by 2002:a17:90b:50c5:b0:3a0:c717:2db with SMTP id 98e67ed59e1d1-3a4d1534cb9mr1845978a91.27.1790858817709;
        Thu, 01 Oct 2026 05:46:57 -0700 (PDT)
X-Received: by 2002:a17:90b:50c5:b0:3a0:c717:2db with SMTP id 98e67ed59e1d1-3a4d1534cb9mr1845973a91.27.1790858817203;
        Thu, 01 Oct 2026 05:46:57 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f479dc9fsm4567467a91.15.2026.10.01.05.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:46:55 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 18:16:29 +0530
Subject: [PATCH v4 2/4] regulator: qcom-rpmh: Add support for
 regulator-off-on-delay-us
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-regulator-off-on-delay-v4-2-258ba9612da8@oss.qualcomm.com>
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
In-Reply-To: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858803; l=1514;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=FWP3PelIkgib5aeKAAfKPek7G4zEKRyEuHJz2tWubsI=;
 b=NCKe6DqW0jrdBRouJissm4D1foiw3igKo8u/iGZc8LyD/ZrM3lj0gnz1obYkO+hvNG2UaZfq4
 ymgvHQu1lhCAd7KfwzJwA7v1kIuYkE5Fk9Rgv314FSl2no87KjtgqQo
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: ZbdQ48dhyd-D_u4TdwIpdxI-0BpGfOF7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX7LmCuLGf5NHo
 2VI4bZuY62leCJKZhUnc/dylPrJC2uTGU3r8JFQq857SCLAL6nCvhSbq/zkZZx42Y7Nq25ShikX
 P3TC2VukIdThs7N1Vhbrfschn1rF/y0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXy+YyIZQRzEfC
 QcFZbM1LydePk0yZ/oQYlxMXeXULI0T5jeOec6RIAklXYOMsN6MyjGdUGHUQPwSNeeGaFH5DiXY
 8txkJ+BxeXEpgQg3XHVNGCkn4Yj3QhLzphdHzM0xyJxzeqCBg8UUQiLqaP/l0TlrfsN9L2tkEaa
 0+m/WiQXnfPbwTqXymhVTIUqCX1sCQ0DALQSHTGPOx4GoXt79RjDQQFaYqbYAqlq0FAyeiGIzZw
 U6YCJMjBHW+YNc4I0N5moOFV4nT09qfbG4eHOk7q5qqyRCy3722qnRHUQzi85/2z9oUi7+3QnIM
 1RhvfE/wiYOLTvRw+UPcJ0qkChECsZf/LU91vam1TTEKhBwJiyqEy/QUHs7vpkI1qgFukGwUG7q
 y/HsmirJNDLtgqlhoupxOCmzHf28uJoYiENGzP4O29NFITtdjlcRQCafgpRtFmHg2T9tmaEh1LP
 x+8jMnGDlbsvn48DxOQ==
X-Proofpoint-GUID: ZbdQ48dhyd-D_u4TdwIpdxI-0BpGfOF7
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe5642 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=l1sNW-6lZsdIc3Gx828A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

From: Saikiran <bjsaikiran@gmail.com>

The core regulator framework supports enforcing a physical off-time via
standard properties, but the `qcom-rpmh-regulator` driver currently
ignores them.

The issue is platform-specific: The Lenovo Yoga Slim 7x (Snapdragon X
Elite) has large bulk capacitors on the camera rails (LDO1, LDO3, LDO7).
When these regulators are disabled, the voltage decays very slowly
(passive discharge).

If the rail is re-enabled before this discharge completes, the sensor
experiences a brownout and fails to initialize.

Add support for parsing the 'regulator-off-on-delay-us' property from
the device tree to enforce this physical constraint.

Signed-off-by: Saikiran <bjsaikiran@gmail.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 25c14de3cd8b..4773034b5d42 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -552,6 +552,9 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 	vreg->always_wait_for_ack = of_property_read_bool(node,
 						"qcom,always-wait-for-ack");
 
+	of_property_read_u32(node, "regulator-off-on-delay-us",
+			     &vreg->rdesc.off_on_delay);
+
 	vreg->rdesc.owner	= THIS_MODULE;
 	vreg->rdesc.type	= REGULATOR_VOLTAGE;
 	vreg->rdesc.ops		= vreg->hw_data->ops;

-- 
2.43.0

