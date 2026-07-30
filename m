Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809E919067C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785406547; cv=none; b=et3fPSUdCfqK3DlQMdT9QnPVABSbQ/tOtoFhb/fkiAZIUzE5ecIfwgE7a5Ud3BHwX6S8GVMKp5g/feYl3YPyL7fTuRSBHOuOeuhnua9V/Qchlp2miKBD6S46PUIEaHu6NQdLEyBQhv2LNKdI6lntX6UnS31EE6HxDUz1NQkpggg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785406547; c=relaxed/simple;
	bh=e0HXtcYdZ+uScT4H5oo6R2KOHS7Q2bIuCKPJ9wJYhXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iKdUFa0l49j2NwASdg8b8F0dJRMifv7Z8sb5gGq8eUH6THhUW5OitRIdVYo9wUY8RqWtETa1lvOS4vpy0Q6jnmiks2p2VH8fnVPoQ7LA3UjqFxMDRr5VM/3k50hfRkQ4yVRUp3WEdJZ11TuYsZUpY1XbFGbo7A51yUKT3AEgkaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ehHZUv3L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDc+tCVH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ehHZUv3L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDc+tCVH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2VJB419128
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k8v2hf9Y3CqVvaj/kH6HK8
	bvjrar8ZlG8tBL2yALbJE=; b=ehHZUv3L7ESJqU4aEXz3paU2W79PrQoDVgdaPW
	rnWmd9FFx1jbbsqy7u3wJFwJH3XsVe+ygjirS+qGE6lJfWwn6plAhZqJQJ2gQZgg
	PfW6AU1O4EegIqZevuNIWfPKLTHNK9zYlTfX50FRuMdnLgactbXMH3uszdkYiBa8
	MtYDzI3PKZlOC5HD/1iFZk91mMmqrxczSVOwrscqslUtGvHcZvjVK+72Bcq5OL8Y
	foFCTqUQ3G0TNZnuhLlfDqoj1tkk7y/E3Zj4hxlpxOTUkS+79j9ILpH2rEgTAZao
	GV8Nuh7HmNQkSAgtmISySNmfqf3Gvv94vO2RdD7IAClawjYg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3hrgbsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:15:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8488ac68185so4656826b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 03:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785406545; x=1786011345; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k8v2hf9Y3CqVvaj/kH6HK8bvjrar8ZlG8tBL2yALbJE=;
        b=bDc+tCVHauDLClAepUqITIG7vMBsou1uuQtb70a8M6pURlqTz+vjctR/7t77kV9E2p
         WJqQZZQqYL3pd954/2M2OtivCMR1Nq3nI9IzyX5Dgt4iaz857XZqpupqXJkG7YIfcdt/
         UJwwmIzRlVQoBgcYyg+z9Tn3i2H6YXT9/R4lrMrIODDyHRq6j6GRQPu0ZY1AzmvK34Po
         wkKb8cPzBCmo7ZSpjAVKO/fNFQH2Jy0ro8oCtBMgG0FTIVzgur9eQve0xCyZNKbnGWF2
         nZMj0KOZ/jfIfD4WRnO866gixYJvnwIjirOQ/mbRCUmNIX4JTDuNSxxP9NsqPeq9eAVD
         HyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785406545; x=1786011345;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k8v2hf9Y3CqVvaj/kH6HK8bvjrar8ZlG8tBL2yALbJE=;
        b=OkhcFVj5HA81DOQWPgQvGF7L38VgKIt7hSvgS9bMU5w6kY4f9cusZlSCx/cHvxIcMg
         Es1XQzkr0D6VdbV7mRUDzmQClpNTpdMh/WMrWLUzHojJfn8WQmpTiSnrX3Dit4+ick7t
         UBRzQx3jHOAZxKcD0j9Ql6AooS6NLfGxgKCvzvXlQJGUr76sCCK4lTeQSA9X4rvszCFD
         4vbgahKOZH2K7ViI1lt0do8gtdhQlKibbuz9sodx1rd61iAJfNrlFb3Owe2PCWOMj5Za
         Isi7ZjmGjUtNFdCtwIJLr0VU+utcBVhcOLUdSbCg124P/C/eHm22wt5m+z7RuFMM825n
         rFRA==
X-Forwarded-Encrypted: i=1; AHgh+RoHZLgKEvV3bYJRYHdYRglaQWwIg5lbEW4Bp9Y96ZXBs3Pz/ZPk6EHy6V8CpRB2Mt8Y4QUCGMsX8zy+yszm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3C4eZCzh0zwUPxM+8ZEBKE+QRaFXQ4F3CjdePJeTT6BJVZ9TW
	9+hQjSOAmmizB5ZUbeIjWfQ0Fdg9CJogIiG+OfjSgsda3L+86dL2iq0F+Xs3/1F50msQHyNf9ip
	TwqPe+sf3eS37AHJkWFtMcNNe8md1G/1PrtySRXxodBbPbAZle+D2qI2P23buv8O14ALTaQ3vlM
	ni
X-Gm-Gg: AR+sD13h7OyzhFu4huUAWJYb2eE6dxsfYKZ0H6u/MS2K/eMH8VBnQLfWtYtOv9zTfMx
	4+GI2/yHG84acEvooqXklkraAs6ndKHjwRlixlSke29nf5K8vEi2SuV5ylTubVXLVdT3jPvE1lT
	B4RIb04SBi+NZGO+M+4x1bvljR8b4/HE3modlKuLCcvcLjAwIfOXay6vG/S6Dfu+Uc6OcDkp7Kr
	AD6V13lXNu2U3lJy37E6DvHApXqFS2G6JCJblDVKWpl2P1QrxRgSffgxAAI+3aPGLMKOn3yT/XR
	zqSN4J4SsZcM+r+lE4Aq/WwOaamrcy7adqFXjV1xYfEoOWp2YywLMgDTwJa85uBnV/cRI/M13yg
	3WWcCt6RI+Z32jEVoN9ZAgtqgRt2bt2s=
X-Received: by 2002:a05:6a00:94ca:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-84ebc22a3c4mr2003857b3a.24.1785406545003;
        Thu, 30 Jul 2026 03:15:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:94ca:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-84ebc22a3c4mr2003831b3a.24.1785406544589;
        Thu, 30 Jul 2026 03:15:44 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0374c20sm2828020b3a.45.2026.07.30.03.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:15:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 15:45:10 +0530
Subject: [PATCH] arm64: dts: qcom: talos: Fix cpu6 1094.4MHz OPP frequency
 typo
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-talos-cpu6-opp-fix-v1-1-f4886fdff13f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC0ka2oC/x2MWwqAIBAAryL73YJJ2uMq0UfYVguRohWBePekz
 xmYSRApMEUYRIJAD0d2Z4G6EmD3+dwIeSkMSiojW2Xwmg8X0frboPMeV36xbnqtSXemkRpK6AM
 V/U/HKecPQFTheGQAAAA=
X-Change-ID: 20260726-talos-cpu6-opp-fix-14955e586405
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: VDysbbwWHgiHRI0zGVdBiulrjl6DHfI9
X-Proofpoint-ORIG-GUID: VDysbbwWHgiHRI0zGVdBiulrjl6DHfI9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3NiBTYWx0ZWRfX75bqtR1ExRVU
 p6yBZzM9BYasUHU31DSk4h6uHplAGxWUi1EqOsGvI6nsg26U4WoL3MPIUhrvC8azyFGlFT04zDX
 9xj44H9qNO2enXbrTDEu1fUTIeedSuT0ZwWYMwRqQoGniEGF/WNbWsXGx1vYXV2RNnx4GhBrO0/
 N/Z8t4TxA6TRhRFamW9ZUFRk+kSqI+ElBr30UMWc4nYq5ylXNM6ZOyOD+k9zRY/i693ZrKDK7ih
 oubv0CL8GO1JwUrLlj/3cXBia+BS2oxF92eqXsrTe1ySU2zb8G8Y+unctL5eafpzaQ6YBfC17ig
 ORipzG3LkJh4E/RI6HKXGKQbfYOCQhkQwFm1zHHLhNTxdebH09PomTYK1h3uo4JuUiUqAse4krd
 8iyS06iZS7dzIX7zrFMUnAckEC7i7yuZKG5isSbrFHA54NZTIh14dPzbrAbGLpIJRjnXcgLShdP
 zfyqfU2RxFavSIaSEqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3NiBTYWx0ZWRfXx3GgwFfEpd1p
 JM5NzIB5nK6yyXMa7U0rhplvizFw/cleg0u3MhkDwahAufddZOcZmanzeAr4EJeAmc42CEANcFP
 Mht64vzwJf9G8z6k2NAK3jGbsuOG2lw=
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=6a6b2451 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=E2NpRe_1XTneTphV6M8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300076

opp-1094400000 in cpu6_opp_table has a typo in opp-hz, missing a trailing
zero. Fix it to resolve the following OPP update failures:

cpu cpu6: Voltage update failed freq=1094400
cpu cpu6: failed to update OPP for freq=1094400

Fixes: 44562f591890 ("arm64: dts: qcom: qcs615: Add OSM l3 interconnect provider node and CPU OPP tables to scale DDR/L3")
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index bdfb70ca9740782c4d073f6de7866f81502116eb..bef3e2e5fcdc05972a7d3511b53149ef9013676b 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -352,7 +352,7 @@ opp-1017600000 {
 		};
 
 		opp-1094400000 {
-			opp-hz = /bits/ 64 <109440000>;
+			opp-hz = /bits/ 64 <1094400000>;
 			opp-peak-kBps = <(1017600 * 4) (940800 * 16)>;
 		};
 

---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260726-talos-cpu6-opp-fix-14955e586405

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

