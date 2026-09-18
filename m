Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B8E519E1D
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 16:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749836; cv=none; b=UGiaq5uYrtyirnrZYNG04w+t6nMdehQxBU0NW7Ixeda8pqZZg/iRvjfRrWjAVcTW4MEOMQkAG/upFy3gJt2GsQPn0lfSOixzT9Ecw1VGHP6gLvI7oUfipUFa0RNtOGVJYqyBNCkF7AZ0ghV98uGXONM80amh1YXbFZjDjadrKB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749836; c=relaxed/simple;
	bh=SmOcZxwLrBRoIzC1qf0GZGNnF5JE+WS76VyePIbnyJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkRXDpBxUIt4NThqDy0DJgSHBbZC0VCMWo3bsMi00sYP+Q4pPc3Fb5emO7r3yIWg1rPkVJH2zeMmAgdGFUc5VqHYgvuHccDaRpDEKoRiJ6UE4GDeAJ+3UvSd0DPDuiRFQDqFSp31Zlr8kMSgO+HLvLhrVAl+eZwk9sXvEnhsbrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDP42nIj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pkof74oN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDP42nIj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pkof74oN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOR0X3645808
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 16:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WpIZWkeAtD6jcfZkO2AwjXwIQel2B+tujYx3yuAQAJ4=; b=kDP42nIjpMkvDHK/
	lSbHC1srg0BgRvZRoA+qQpQzqzHMoYD/UjHW83ypqTQ/mTmyHTc820LSY2MpoQnT
	ilWMlsWQanj0ImMRrEqEH1jmcxMkA131ttPA4FwitEt8igpSrWaG8sVFQD0VfHOm
	0MCuw2lhbqpYue7VVGDE58+3cDWaKEIgUh60QBBHz1kl3goQ90QH/+ZJQ35sGg06
	Zmdk4biKVMW36fUp3DQABKqCD/Zlkixh2YxmCD96he+ivg81B8yshgK6Nq/WXXeT
	S1fZUT5WfOQ6KXYVnfyZzReT2JmrfKJ6OKq0Q/3nUUnbac+722hCObaio1dctXR6
	MEGefg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dhk5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 16:43:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f75c1219so19490555ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789749834; x=1790354634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpIZWkeAtD6jcfZkO2AwjXwIQel2B+tujYx3yuAQAJ4=;
        b=Pkof74oNUMP4nl73DnbhwMC1Cwo0Gk2/KnmI13lpVNdx56N8NFjIFuDD4IiUYpMwRi
         THP8RlSXefOcjg72bNehYX33ua+YwdKyVWKNP3Ll2yUW2rDid6/3Q+QNfVOdhWOVr56Q
         ra+GoXEa1F61FI/Jxhp8Q9we8LilbG1YpmD3FSUSkcteJM+x+zkVCYYQ7PaKg5uf0p9A
         3wHW7AklJHLJOjIP+0RsjdyzSCjAzUrdfMPilA7oy35xRvbFvZcYX4fR0WJJWr1luUeP
         NwYcSNbwI6tNvArA5irxubxjIwK8+5IEJLQU/LGnYxXtugHuL3YNTV2gqv3yc4JHV8kl
         UgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749834; x=1790354634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpIZWkeAtD6jcfZkO2AwjXwIQel2B+tujYx3yuAQAJ4=;
        b=IuC8DEOXQlrPyyVlNwywxjhBrzp3UXlcy2u8K6E+1w0rIi6ZBsmKn3/h0aEObRLLEf
         PP7+iGM+rKQaK7IYZMf4d7yfPwinkkWCY6qw0a+ZdlzNNENlc5ZmZ673xEsRyxnX/OZo
         l+ETg4qA3nmxq5Hm6rEEjXApVAIf6gEfnGtbqgNFdgm+JFPZvN/A5VqGL5EkfLkQhl9Q
         Y0w/8MbPApm8hrlRARCbIov+Exge9aOLbuterGdCqW5h51kyv+F1VEdai51ArWIZhewh
         oYkZABi68ViH2uJoRoKjKiAYbnwcmKozQBl0duKI+XnBpGaUJzNfSow8hx1wEhbs+SQn
         12Dg==
X-Gm-Message-State: AFuF++ll8M4JDT0pKYc5+u4AV6UntXh7yKixwbr2tpUwRvXTDERw+Cqk
	/3gVhGZJZs26rErGsvZ/EV1J9WFakDxrWdAYKS0JD00lVwUUOFQNnlER/8YChJOSwZnDpd+Vz5m
	W1g2ILj9b8bP7Pm0ISPIVNhVqroRd2EO5Iq26Bd/7s/R58MsZiktxxsPtrrDoMjJVXc+Z
X-Gm-Gg: AYBFou0H6mBQG6gKzybWYuEBqBbhgiBjSZNikGXwBwORxtrkZSpqzrLTz+m4tAEP+TG
	JgYHbtTDcqIsxukOTKHTY5fGGhqHHpx6uEUEI5PUdld90Evr9OLsSMVJ8SKmoxYDpZqHraDnN+j
	qAfk/R90XowqorIPdN7zIYb+XCmm9PAX9Cgmmz/glWtfTXFoGoXqvWqO28A3Wy8hrMV7gayNV3Q
	ULiPkhvp4tToGME6qm92Gg0+GYb7vC2Fx/vKEmQUAXhY2vOw6KEtXU3qU6qmHF3SGo7AH2iltG8
	O4zdakWwGwrBW0iH+BALbEiYRXIrzQKwbvgNd9ju/92cLKUJ+jYSX3MrrYedP9gBaOYB2/LnUtk
	onARTewVJ4u/SRmFujw==
X-Received: by 2002:a17:902:c944:b0:2d6:ffa1:429b with SMTP id d9443c01a7336-2ddb1adf381mr68054855ad.7.1789749833698;
        Fri, 18 Sep 2026 09:43:53 -0700 (PDT)
X-Received: by 2002:a17:902:c944:b0:2d6:ffa1:429b with SMTP id d9443c01a7336-2ddb1adf381mr68054625ad.7.1789749833189;
        Fri, 18 Sep 2026 09:43:53 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb754e390sm11161895ad.32.2026.09.18.09.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:43:52 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:12:49 +0530
Subject: [PATCH 5/6] dt-bindings: mfd: pm8008: Make interrupts optional
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-pm8010_i2c_support-v1-5-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
In-Reply-To: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789749799; l=1295;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=/xHD3FOa+DH9d/+N3YsM6u54DFXQmF0QPDehR13uSyQ=;
 b=wHZxV1JV6UVITF/40YIn3ESxFXBpkPJOBbsu1wDFDKZIQ4bL+FVDu6Min/+3FwcqwCijRT7br
 zEiwnzUX5tNA8IeshF1s58Ir6S4oT6qBtqyIonff48QRYxVIFtXZ2w+
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX8hlPHWKIkwQ4
 Pff1hlZZtw7Yv7Eaq1bdx9hJDIYivUt7CVhMDT1xaFkKpZI6WulBm8otgmZ95K+B3tNXI8J+DH+
 U2l9scjAEEnPPP8rPOEhbzbPP5lyYC8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfXzoAAf/IlytSh
 kGhjwHmYwmT0cVwCVJQUd6UlhXEs3hyZAGOe++br2xVvPn0xKJMgRzvThoi+UBHiiYU6iRBT6Nf
 iRZxJRkfjHAsI8JnMnh7aFRkbBbIPrxFuW7CLkU45d3UDaAJ2ky4ii8IjetXNCuEcSRkBTMfZae
 K6USPO9x3H4nm9ZkO8rg3wY+m/CfswZQb3CKeN0fuDvQnkm2h9dKsSKM9iS+QcmGELb9AaxovnT
 zN2kvyRCPXpSxlX3LDrV4UOT/V3FteGPfXHeIWBc3079FrB6ggypbQukTCr1WR4L6lvNYF4g3q0
 jLjFmr6nfxfeqLA0jGNCekHAzVtinQbDdGYbvEcUjiHwQpIAOKeHxpofYrUmqzUSxvf4HrHHApv
 h8OGedbjGQazxflmA6KUezkZ8lqAtEakCP9fpiMU+jqOMUB5Dg8JMjOeA+KvbEhWZf0VV5WOBDj
 anRb0A8dNVY8tcf2iYQ==
X-Proofpoint-GUID: tiqQP5eFISdVvF5HQoZjq2ThpCQR1kMF
X-Proofpoint-ORIG-GUID: tiqQP5eFISdVvF5HQoZjq2ThpCQR1kMF
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad6a4a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180238

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 2701aa755f31..3c0febc8152b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -90,7 +90,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -99,10 +98,11 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

