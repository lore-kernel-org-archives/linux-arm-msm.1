Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2183D524C
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 22:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326535; cv=none; b=A8vL7Mc8JKN16ckSNQvbVILFz4zbXv9rhSYQfIFdMTupVmAqCNU+1Jtg791xgHDc8YG9A6TnXApUVSmi1tD6hCuCJzmmsnViOZ8XAa7erbkRuHUgfagj5YSLQraJztkn05Eoi/V+GHB7uNMpqGB5Vi8Bx6jZBcYxKF0ii4P4vjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326535; c=relaxed/simple;
	bh=Gi+0SxuObWSnypm60XIzwS6sBewS3GWrLl3c8ovucW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jR4J0KqCHBrG1LJGhk4VKxWNtp2gZMrVx32HLwSyHI0oD998IVdzjCefvDnoJ4ABomMN7dhGbK+9CGqzOBX3pHEECVfwO90lylj8Dh06DMiqRoyHSEneQckACTCnHuVD4dQudCsRLRYkWX4CfG1T2STpgSX9AHNLNilYmbt4qKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4YkFYEW reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4YkFYEW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeQ3l1029575
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dlWq6Ov7H3Z
	qTYXe03p4byFmP3iR8MTu4occ91czj84=; b=b4YkFYEWHpZSLx5mRyl9ORf6ShS
	teX+9yrJGcDWurg2YjymA2+FQ8bJO6HqkZMXxLeH7m4fPSgnAT0cTZhSDrgq+/vY
	gpjzWxry9JawYaJdmPH70I5XURsx29Smj0GiBTJdGeXDh2ugeBHfShzT5N6iDE+5
	ev094OKImxaMSQLJItgEO07U2bOy9oaqdO3vdrnjLZT8+RFq11XTZI6DfTQ6kVtQ
	RncxQvbOXXU2ILHz554rldn4vfIgrUI4cdXP9QDgcmWo2KSCfNxBIMSgKcguHAGE
	vD2MTRdMWOi3v8UH5djLFarxDnyDRnXs+fdN6axYAxhJJerJRWWPrUbiPJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ashu78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:41:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dea1b6c89so555255185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326515; x=1791931315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlWq6Ov7H3ZqTYXe03p4byFmP3iR8MTu4occ91czj84=;
        b=yLVcflhnbBctulOT0Ck83QYcaebngGLvICchFUlZCaoVgyWbjrt0+/i3nvaQe9kr7z
         XQKGT4zBKq2JTGu/eXdmlj4gDN/KZD6pD4VtdByfjqNXYTnPSzwXcbWzwrZN50IbV0HL
         2L3vPDzhX47bYzx9IxcJLzxIXGBMUjrV5cGWeNsKWt8sVlSx5/ORVbnHYgrXcc3aNrrW
         Wbmevo2DN2nA2twx9CGPQGNSPt7lq8TknP46yEEGYE9LYl6GRK2YUFP9mL3v1bmKvZ67
         l1Az/CCEi2ZNr7KcpHTt1UV2ucGGqWfvOWYTJTiPAIxVVrV++QqmYj6owjY5Wv+MHTEh
         tj3g==
X-Forwarded-Encrypted: i=1; AKwUvBwXcuZc+mU+HmZkN92dyH+iy3HVZgCvWjpQxVmulcDnypX3yzjNeTYy88lxcwmGfyHc406i46RNkumFKrLG@vger.kernel.org
X-Gm-Message-State: AFuF++kn7vz9K+3qgabbL7OQvHtOphz0br/okr1Z9fmpAe8JJ5ToG9qq
	8FAQ36slz3HVxluF+RoqC9wt7ued9YV85H4tM8AgNZYzYJa1Lt7Te46sSux4sQY0rJs5eppf+EI
	SXxmCJfo+uM6Sjfb9XrRwTgPATYXznPk1+hLK7pKBblVdXH+1MP1xj+8s0rkg/cDSq7IL
X-Gm-Gg: AYBFou3hUH4Jt8VN3c5cE/CvNJ0vwNryhFZtxCEvMxfqttoew+NZ3HbUfyw9avT+/xz
	c48TN7DVQx3hchMZN+I0rEx0exrXoZiEG5uhSPt5C/2NSz+Z8bZxCns6h7M6OYQlyloFE+KNWcJ
	Ghg7HS9Nw/eWFvEpryeUsiwwjFnxbsfScn0EYoTBXfFdvQM+0LCtUGQCnT/k/RYuklSYrGFbA1C
	BB1cIgnRXR/AdoXtlRj6CWmKH+qNfTb5YIYm1J5tiK2nJrXUvKU0/5FQ1PEJwqxCXpmP+3eEsiH
	XO0fbJCYKFoKnFu9xdmleH7A0dinGJ2RykkcXE9PYI+8btJNIT6QfKH/0PM=
X-Received: by 2002:a05:620a:40d0:b0:939:7683:33d5 with SMTP id af79cd13be357-93e9b71bf00mr86274585a.19.1791326515462;
        Tue, 06 Oct 2026 15:41:55 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:939:7683:33d5 with SMTP id af79cd13be357-93e9b71bf00mr86270285a.19.1791326514991;
        Tue, 06 Oct 2026 15:41:54 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:54 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH 44/45] dt-bindings: media: qcom,qcs8300-camss: add pixel path variant
Date: Wed,  7 Oct 2026 01:39:52 +0300
Message-Id: <20261006223953.3382273-45-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Xn3yP8qbMYQmJgOWDH6gTzVNfZA8QVj6
X-Proofpoint-GUID: Xn3yP8qbMYQmJgOWDH6gTzVNfZA8QVj6
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac57934 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=TLHcO4L7ZdRFNAOTDMcA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX4NcYiNALOGBS
 CF9xIqdd0WRq+aTmGvQqsBP6jVxT1Gr5h6FtddNVo+/I5c/ZOIt25El+e9x1VpJcGuAb2DMXSTP
 nxMo/vhdFPjJJXmvGS+UhoqdbGt19xzkLto5wmBd1cBeYBkuWbXtaEuKk58+IgqhC/2aLmxq2eJ
 TicIST/XXj2vHDohiwg0wXketS6sDvVdpOrCtRab8ocKuq8SMHJkKiRy+XRRmcrQAL3esYZy0Db
 xvgfViQkNBBSGOfVuRgbmgJr/4KZpsceQfUoTOYjPNrIMoqwSNv5KCkbd+EgmVTQFRpkc7ws9wC
 oGhgxTZKchfYPhAYQC1vdrNeaJ3q/63JZn2eh9WO0bfxiOimxEkVnUayZ7OTpSYhvnZzvt/xrhd
 Bwy6zZXl8t5hpYtAXHpGJpifHDUqmrs6ZGRNvJAuXT3F09TXUs/Ct97hQjHPU3xyaHmET9Ij6Wx
 baifNxoCsMiP8Xuchzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX8oCnzr2du6on
 t6+YJz5P5wMCrwel0k5lu2F5TXDdEcruLzbBZ+3jZVcSCdU0TsOvjtjbu/kbCLCbXmluQ6IVDOJ
 AQAvA3X4CsWkBcvj+A6GlXUAiGJqqlw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

Document qcom,qcs8300-camss-pix for CAMSS configurations that use IFE
pixel paths. Keep qcom,qcs8300-camss for the legacy VFE resources.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcs8300-camss.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
index e5f170aa4d9e..f85104682e52 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcs8300-camss
+    enum:
+      - qcom,qcs8300-camss
+      - qcom,qcs8300-camss-pix
 
   reg:
     maxItems: 21
-- 
2.34.1

