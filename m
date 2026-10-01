Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CAA50B8D2
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858816; cv=none; b=j2V0uqBPVlRLcDCDEd73MiTqRS+v9VhyWx7DJaZkm1WH6+74FpK6xb9AZI94arh+R94T8rGd8zFD1PMOKCeGN6iQsnjY+vXlbNXt+o27wACANzNc4rR8K71w6jsI47BXwGkQGC0Pb6PwSI+hKRstbSR1eRgRq4X6xHWNeE4E/7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858816; c=relaxed/simple;
	bh=EKCIxJNZEKVm/LJJ351gVoK6q7H9e04AGwo8s2GTHto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BVHDB/n2BprSeonpxYNuJsg8NfWNDWc/UrAbpojjho5T5YIbAVTQNd03A1NCABKu/VtOOz31QM+C0a+45mahyJ38YbAfrUTwC6R2Lz0JyhGSRXMVhIPjgG2cB1K1Rhgg/ru1p6X4Q7tCPz3X+RHwSfnrC/br2lArnoKF9VWA1VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1aHZKZI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRpyGzfL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j1aHZKZI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRpyGzfL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xgQ22337560
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 12:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhASI7Dy5cGYVoR3oHPmx4r+3Br63Xn47/KudvC2y9w=; b=j1aHZKZI8h5wBUJj
	Ik1l6X6oZYFvhAql/7O5CFqrxpj5RercIg2YTnbTDTw0vugX4CwIGxM/JDJyOAiN
	MFuKlvGWHCqeZPOnMZx10p1/kNC3iRG/DrtIlfUn3BnpQsYDfUgD+QjAXQVNCw2x
	cL++CSUnMUJ5YZ4XaAN4aG1e1SYSJiuedsv/+SAJbuLEJo6Ahx3+mE/cl/m/Nct7
	vktQZ929i8H3e2I7/IcwSg0Ja8tt9w5Qel44/JyK+pXFWhFoHJ3vEUk3i8fUvvkz
	28bnnBv79SNcYXDxjYFMVYXukSXx1nt9MiBuBFgH5FzBysmaI1FrQ7xMGHi9mFms
	BZS2WA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n24x4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 12:46:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a0be20102fso6299901a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858812; x=1791463612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhASI7Dy5cGYVoR3oHPmx4r+3Br63Xn47/KudvC2y9w=;
        b=SRpyGzfL2l2Rkl/5dyzbQHGtkTJt6er3Xa6Cod//JkUz7nEHhaRsO2lm+5QKtyzJyi
         etdcAwdRMaYk43pyU3YP//azHLBokusOCw98rFYHCRESurmxbkJvSLWfvaBWwCHK7eH5
         ofX04oYnwMO8jD4yiczx59Uamc8Cbp0P5got2B4R8YaImtxHoht8/dqXCIYBC4gvHOOK
         Dgtgw2rQ6BIw04Jt+LsA1+waFyk3zm1Py4HIfvNzWcbENtZLc5MKjGTIWrsvw8x1cKUl
         oz9dyQQ2Gj9DC022t12mETBQm97wklrbjZQfFuqLSfhEgNdTxRYNX+xfUAouGA4dZE+N
         DOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858812; x=1791463612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhASI7Dy5cGYVoR3oHPmx4r+3Br63Xn47/KudvC2y9w=;
        b=LrfwNYgCqmxWTDAzLv0OsO98dnv1fuSrOTgh+hznIuqMG3s8JJwTrHV1DhSDQ7DKL6
         7QK+AxAXKZkpcn7pTWxEdMNbxMukIbCGN79ZomEg+W3Q0fFL+LtYNeNSuxoar/KwAeYC
         c/iS6sG6qaduR2y48T+Zl5I1wjzyR8MW1ZmY3skcFoPc1O2+ldArUcKLEXHI4nnaCHbe
         taf3JrHhtZLGuj4+lds15h/XmgrgsS49JO04jHsiJ0P5ddEJicQiIZ45zU+nN81yd4RJ
         b0tbxQOoj8SPA4rAqjVnSOdXyck4E7aJPOLy92chZrljY5EiMwqhs4J4cZ9PJTWdjcuv
         lIZw==
X-Forwarded-Encrypted: i=1; AKwUvBw7VLG5WJ64yuxoHqzqzUyoPwv4P1Go3MgYlfHprhATzZC26+VmNxixHJB3BKfFNeWAjLqA0Qh5cruIT6zQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJFl7CHQzmccd2s2NmepOZUpfa3B0ggn60xdV3ZTS9VNT9xkHnS
	4rBvW0rCRTqWP80tGA3o+/LUkorAfM/aWezs0vR9MjNFV6rEQwGog29ksPh5pU6uUMsyq4WQoRF
	8y0OaBcsvMsKiPmTeBo1Pnc2mbajGtghVjUlTL51mZqUWpUr6xV8ifO9MNK2Z1eAEARv/
X-Gm-Gg: AYBFou2GZUnpdLHEFJdqcY4hibuo1Wcf/5Ps/6MMhWIUndyVt1XfcUG6kOK5UeLlpSP
	d2oKv7SDSOSFMeRhcBzFq5ZGP1ZQv0MLq65LTLNdU65EKmp/zxI/0c33924tmhIQ/VyRRSiJLzr
	Qzd73Q4A+H8N+WujDxnr0UTjIYjXviYSYvL0kjw08gwY2vrgXBaiI7cyJCFAajrs4k2okYELiGw
	KEttlPtwvhDH4st8yZlBR7Tp/xJaadvmWHi5HtMMlDFtRIYd97beXdk6qE3Wp3O1q04R5v0fm53
	LClVAjVhZOLFNzRc+t6fv9YcBh3N86Te7DhKJNqj+heuviNjxrNrgVFYOsZBvv5jlXOMqrp42fb
	iUVGpdASXJiWjvGkIf3k=
X-Received: by 2002:a17:90b:4b87:b0:3a4:a229:58b2 with SMTP id 98e67ed59e1d1-3a4d1784a63mr4237748a91.38.1790858812468;
        Thu, 01 Oct 2026 05:46:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4b87:b0:3a4:a229:58b2 with SMTP id 98e67ed59e1d1-3a4d1784a63mr4237715a91.38.1790858811940;
        Thu, 01 Oct 2026 05:46:51 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f479dc9fsm4567467a91.15.2026.10.01.05.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:46:51 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 18:16:28 +0530
Subject: [PATCH v4 1/4] regulator: dt-bindings: Add
 'regulator-off-on-delay-us' property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-regulator-off-on-delay-v4-1-258ba9612da8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858803; l=1388;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=EKCIxJNZEKVm/LJJ351gVoK6q7H9e04AGwo8s2GTHto=;
 b=CAZuIzwEeIcbVQgQPje+g2bEtdMqlZUgg+Rt4x0Ktlisysm3ZzPXyOdB8dDeaLoubOpIBi3Gz
 BMjEJo3+GkgAygFHhT1BQOslCCuqshOPr16o0T3EsKty098Plg9Hkap
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abe563d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xl1xDpuIGGFnwhC4BG4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX8yXfGXDA6dfe
 qzqbZ3B9U/bEzFryTmz/XYPo66LsI6Hdekl4997woRQBTgt6b53pjpyzp3olLTWEMSsj8iypg+q
 OaYjFJ7DTv/KCEnKNOOj2sFMvnA+P8c=
X-Proofpoint-GUID: HA__tDpRkxBTOeO7Wdq7b5EGCKLwSphi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX77kYjkKUGcYp
 GYQyDpaGjTuegGFTXaqXNc0xHAZwg4aEXuYSV5f/wUmZ+lGtDNSt+hlrooP7the8AA66y4t6n3U
 4JAqWNmF7sJUZxmwlnz/49T/h4cHa5Qzv+3YTE9YyTqr1jp5q10OAAyDYDMgid9rIrXCSEn6OyM
 OnfZgz4syusrLGPvEpADtj2W/wBQG/K6YTFdHHm77SciZuWbdrAuutsqSVwzw1EFTfOLLLIyTvX
 NAr2gA1C8UFkRUYoPWr4omHppRtURssyOFgEFjF6MkxmQ9SULWpSH3pzDrB2L14MEDxYhKCbJTA
 nb6xAV0M2FySY7N303LcQh5OcrhUTugZEir1wD1ugq4lsRaKvaRdG935fql/+jV8J5Bod778r0l
 PR2rZZY9qyqSJ/XzgAzea9PGaqxl6u/d9I7p4Ss1LKT+WCUhfWM6hZbcbE+iriRiIhuP2V8a/NQ
 Xu5LO5GzCxd+Gtt4bgQ==
X-Proofpoint-ORIG-GUID: HA__tDpRkxBTOeO7Wdq7b5EGCKLwSphi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

Add a new property 'regulator-off-on-delay-us' to specify a minimum delay
between disabling and re-enabling a regulator. This is useful in cases
where a regulator discharges slowly and needs significant time to reach a
safe reset level, and re-enabling it too early may lead to a brownout
event.

Suggested-by: Saikiran <bjsaikiran@gmail.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/regulator/regulator.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index 019aeb664cae..73e1bea87adb 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -243,6 +243,11 @@ properties:
     description: Maximum difference between current and target voltages
       that can be changed safely in a single step.
 
+  regulator-off-on-delay-us:
+    description: Specifies a minimum delay in microseconds between disabling and
+      re-enabling the regulator. This is needed for regulators that discharge
+      slowly and require a significant delay to drop below brownout thresholds.
+
 patternProperties:
   ".*-supply$":
     description: Input supply phandle(s) for this node

-- 
2.43.0

