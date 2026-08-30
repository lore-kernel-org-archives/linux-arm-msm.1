Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBFC385D62
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788084636; cv=none; b=aKc0Y7VOmTlHd5czQo911TUveEv4P0WFibbpH6y6LraZrwRPC/vEyifAobyhxpZ9zI+zie7P7ovKp4IEIVhhOPdRb9uYrEtGlGEcp3IANcRETRet5J+PaoubEo5hR5XQL4WDRUnSNp+Nj2eHp5FDnzsuzHstHEmXITtlG8JZMjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788084636; c=relaxed/simple;
	bh=j5xquh3YmyWbm6HinwSL5zCuhiJDnGPgbOGMgZZ0rMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZYm8QxdBVTYfNZv1CTHicwoJZxVX//WbCj4qfsQiQ2ok9SOdsyZ/gRE+kaRaKDS4wrkkQW0RS0OcTlw3xpAk5TOSfXNAGDQw/F4bn8X2v93zyZ4IohnWOr5Uv7TmwLxyFrU0r5MIyARRnhWJUM+PtuM+dB8ISvlaiSIYaavsBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgprtML1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLJxuC6n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgprtML1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLJxuC6n"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UA7UhU3322585
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 10:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tsnnJ/6NpmZ4Kbv6OZKO9KkoG7EvkwFyG/j
	YSMybLiM=; b=PgprtML1Of3Mrfz+/Vg6qVghym1G7jiEme2994tYitEWpsew6FS
	+40XKqY+85rJclL/shx6d8B7P+VvEd2DPvCJmHtt8BZf6pLkRJoS0mTeV5cH51I5
	i3PJD0MdEzpAqXuqWAl7Xn2ZUdiFglr1I2KowgWOFgIPJgHBd3kz8g6d/fJtFp8e
	jU0QzzKNFS+dTlGsoPLI9WeiML9fPVGcSabpBHRx/eXu41lBPsEzG9my0KJ7In75
	mP9Bigp5Rp0pLtSuZAS2OFATr5VDBcsAUUiDZbcfMuJRWpYw0V+Sw4DmKDp0A5EI
	2LyNz7o+CtxGh2ToSQFHZeiIn5ATXzo9Lww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgtmg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 10:10:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacd6d37edso31701605ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 03:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788084633; x=1788689433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tsnnJ/6NpmZ4Kbv6OZKO9KkoG7EvkwFyG/jYSMybLiM=;
        b=DLJxuC6nTd11mg18vuDKvYjjxN8UGsqOTjqRl7y4Z8WIlgpB/8w7rXt6Wx09jdisyL
         zV36lNAjQmNIDxA6PEgT0LlDl4M+TA2P2718Fx+9Qnw435fDLnVVe6WnpFUUNqCqsVCr
         lnmlqnZG0kMxXNwQpL7V+OsA6mdyVuV/ZvlR9r5ABCPIaQZvDzR2aswtPjdSlfaO4QZp
         wGOh/LcvZ5z6Eq3nS3e57T9gegQdCGcZqukhTX/uy9vnrT7n84YAcn7mQe+DJlEJD3Kv
         JfMl5oWBOq2HrwruV2naa7Hd2eY3vLVL0c4O+1z6g6naSHdHDJqD2VI1COqKNyp8h70q
         YmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788084633; x=1788689433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsnnJ/6NpmZ4Kbv6OZKO9KkoG7EvkwFyG/jYSMybLiM=;
        b=rjAOocX7es6LefCaKVlVp5LhFmvli+G2VogYPCQ6bXA8VIPBurooxGq0M2ZiH7ZN3e
         gsxy0dSnPaIjtHAsTddgYk/4WLBDe6P/uL5F+X6B8fmNgeX5Rwv1JxuC4igijScOv+Y2
         Ds/gub7OL20deeEAXvEo4mY+AytF/miX+xVi1Sxv+qQfl1rJyF2NOzxTeP9rSra1iAIP
         WJeFC+qyotrjgQWgj5wTZvfr7bifAsrd59rbzKRqqXUvP+/nqCLlDuvKMnycWXM9LfId
         8RAD/6Lqp3Z5zJ18+5KC1HsbYFOU2z+xpVTy0jSI1aqNxY8Fwqgax0llSmz77FkjzQj1
         fuZw==
X-Forwarded-Encrypted: i=1; AKwUvBwUy0qAA/yJW7muocWKL65fgSTlp/7UU+9/D0rJitUqUpsxpN80AsU5vpg2xpDGBKDaoFckVgWy+bsoV9cF@vger.kernel.org
X-Gm-Message-State: AFuF++lgj0rxnam87iRV+UAOzsporTzE9ZBVSSUQuSmDHrJrRmKdNpmh
	RqtI3KF5EhP2gl7UODJ27N5AFTqOWodJqpd79qBr1KIGk7IT+1OglJKhzNBQv/Pqnf11YG5Cuy2
	NdRjqoKbtLTjvbQkrr4RQqJZAl9QF4+DAsvUTdxvOIxIAag9ziOM8ZwT/filWtwtjDTHr
X-Gm-Gg: AYBFou3eNGBNVr+fkgkseuoZ+UpUHBmVccTrB23gWQdMawWyo2LEHvcICExOs8g5c6Y
	vQlNmm15PLtYYsRUztE0WAvN+m4kW1VpPyMPCqqwqgfpwlDEV+c/eGWztvR4TierJdooO5wKnRA
	zVBZKYycQtJbBgUVkQKZQHwZ9Z4ySLD26Wzb1oW0wj9Mbj9l9k15ykcYixn7BABpZ5YNPjnwPu1
	a9NFQw+u2NNcE7BRWqJoFdSfEhehalkR9UVg/M7OjzeZrBGOTnih/BszO+tLpSa0XzeejLPzqVX
	LkFDIim7sQaznmvRAL1/SvHmcW1bs4gxA2vcppsqvF2RUvtKt/QTLoo0k7tyCN55XZ0oHYyXcre
	DubZwoZNTbPw+T6FIh6dwHzAE4hWc7m7RWJVxn+WZX47GgwG4zmEJnfxqny1C
X-Received: by 2002:a17:902:f78b:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d74dc78debmr313679705ad.4.1788084633423;
        Sun, 30 Aug 2026 03:10:33 -0700 (PDT)
X-Received: by 2002:a17:902:f78b:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d74dc78debmr313679155ad.4.1788084633005;
        Sun, 30 Aug 2026 03:10:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm25312274eec.7.2026.08.30.03.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:10:32 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: thermal: qcom,pm8775-mbg-tm: Document PMAU0102
Date: Sun, 30 Aug 2026 18:10:25 +0800
Message-ID: <20260830101025.191697-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4NSBTYWx0ZWRfX5JWFImmokDvp
 s3i1c1b5L1jeAwSpmGnzpC6DCt9XDB8WWlsK1IrpZmaJ0MBMLKhZrM/XDivSy3wZWCkOMcRP0Zi
 28VKa9nAK/v4hBlW6Crw/jd0iutrKMZ8f9i0ZA0Yn45DsN946UfZGrDHi1k5jGOZph7JdtYL8nE
 HBQF2qtjxzCad94nzMdLPs9rxzaVsS2qzjuWLpEokPZDEoDVefSjG0mzoPJ9r0mo+Xpi5DGvd5X
 xs7TLWfRHeEq5rxCxgJht6+f3kdeK22PhJyp3HJ9Gb1/SJGrTCTNNsidw0mg6ZhAlzPxGxFHVuP
 rOWqUENFpbaOOAE7/Mf/sA1PZrh+8wqKoLWMksXnU1jVzcNZ6RwHoR4U+2Oz6v5J1TGbkjNdFGq
 QacCI37iuRRWNzfUR5c1uyAermNG5mohU/EK01uLdIVIQLtTQSG8mrrkyO6FlkKDaKQdt3XiYCj
 gkLsre4mrKw+riPrBBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4NSBTYWx0ZWRfX7Nlp3w94Umdh
 D1o7xQUaA7OczkoqF9E5TgUv+EWDJ2hqKzYkv0aQiEerPPpjC9db4N41/zHJrW2QEaOoWh+5Cr6
 3pdXHwFbcgb316OKM4AQbt47qhlWLnE=
X-Proofpoint-ORIG-GUID: c4D6SLgHt6W8hqLNZVE7hOR3NBZPjpuB
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a94019a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=DV00hUf6onYBliZHTqcA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: c4D6SLgHt6W8hqLNZVE7hOR3NBZPjpuB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300085

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Document MBG temperature monitor on PMAU0102 which is programming-model
compatible with the one on PM8775.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml b/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
index 2e084d040625..ef8361a55389 100644
--- a/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
@@ -21,7 +21,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8775-mbg-tm
+    oneOf:
+      - const: qcom,pm8775-mbg-tm
+      - items:
+          - enum:
+              - qcom,pmau0102-mbg-tm
+          - const: qcom,pm8775-mbg-tm
 
   reg:
     maxItems: 1
-- 
2.43.0

