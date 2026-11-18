Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994944;
	b=J7tjPqVXbWhFYLMh760tOnaVY92PivgCTdTlK3zf9oE+7lG2njNmX1Al04DsgdQGzNZw
	 yIyiO3UUdlfy93Qj/XX0Me2gmxUd7qpDx8qZ/6fAtk9OQt30V7uoGvR0w5IAJsoqCNI2m
	 N2DraqzYYiUAnG5Nwnnk/5crroBvo4a4JwSRLb+yytdgUsSS2i/GK94cA69VOYGTNdNwQ
	 xx+Egs5J/5DFD1ynRDwOUSRkzoBaxUhKHzghtaH87pdif9rJ7hRNNIaOF65j3zYDGbJtm
	 sRAsfjqN7XkNaI45akq5m7VOTuUixbt62N9hUd6LsUNl/PknejAdXbCepqWlGcq0vLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=;
	b=wyuC8PAQMpU5NOvALtNoYssH9bLToONT7bbZzCAqiGTzkwmPTcxrfzfna4COY35n26P8
	 s7KsCboc7uEMjUxuaxp8erq8ZclPQwO8OxwkuV0BJlmTYaO4jYcERaOs+y3m2I7RSLrBt
	 UUlD4eJrxLMe8eWLvV6MGOljTWqPSLHKJ/Nyo/zyVnpoOAA4evRyyvcGRHmaFxznySYCx
	 U+VOSaLDz7dfScqz1TeIHR0mHNRJ2qPTaJXgoQE8qVoaiINNmc4GvD0RqyGw3GTiDIQ2Z
	 0vNmjHlsu+8M76uuqh005Jed+rGo3BxkrjMTIryG0H4oHibADG2VvPljPLB/M+7598g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q5eJlKO2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UfOhZUb+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A8B606A88C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A8B606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q5eJlKO2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UfOhZUb+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8cIc94060200
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=; b=Q5eJlKO28//l07wZ
	b3nWG/PG1RdmwVGoK8S3TG6A954ySkiowyrb7zwe4PTjL7X1cziTjApUVpdo6wPt
	B7XPLvkSUEyY3I8d39P4YbBUbGq8vx7ksD8t1ZC6NF+8lNYnuV3h/NLJOo15ruwX
	u52tyiMiUdJEWMP9UFiFq9r8EjYWcbpS8M0QmCXHXM5yNPxB+qRc4LS1KK0QA+KV
	q4S4GonJlx07XGCScxtxpisNffdm8SICERR7WQJXtVGL8/N88heLscFy92S60WWv
	PLVbwpEhRmOTXjFZvJKI+zYEJOqy1YL1K+AqZBxXW7yCqJrtv9gVWYN6XwA+fztL
	mYAAkg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcjd4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 09:42:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb5375cd68so8587305ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 01:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994941; x=1795599741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=;
        b=UfOhZUb+KWI7i6HdYBRl+Cds7oyirooK1EKGbTp2FSh3QnUyanIDx5erShuYNKpSL8
         w1howFFlfWmK3LiX2aLU07upg07RfzA/pJFumx/vcDWY6sLA7NNZOdYng6gNmkts2cOo
         iPN5vcJLuQpbtY1tEBj01vZnZy2PeD8d4+hzxO9Ao3ZIFybVDk33rfBkKNVqN2LtLRUP
         Z1QxajGWN49NdA9OeK/hJ/Q2YLbiEQJjuwKcK8te3kBcVPviZnfdq9lJZ4tBsjtvIZye
         PysDSa9IKoNzQewAF7bOjob1EZJFPJ5RRnIUMSZXdPypxSKKzLQvD4DZS39rsuuVF86S
         AaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994941; x=1795599741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=;
        b=GTDFmsQlgNqxuQnqd3UTigBNRtHVlniWku53mYGUhJPMOKQZC7dagqTq2VJA3CJapY
         GtDUe0NGQ0Uqaf46qZbSOnhzqIDNdd9BJnF6xKE9pu4Zq3Txn6qLns57UnySX0pLodNM
         PknrPvGV7UqXoR5Bo1swcbiQZ1zGOgb8sDNoDf8REex72c5Nn+XGoKS5uRDlfiTGdCQM
         WBxycvR5P3tieeaDlmS1YqHAVPjulctGeM9ohhbE39prCF29rkSXmFNIJgd38NBenFsz
         ERKOOmfLHXh4EyWPvzbAzuH5zM6zyJjyCy4+0emo1Jnvgdyn4a/Gl0/Q2rJ4lB1yIkVu
         QCcg==
X-Gm-Message-State: APuU4Z8wjAh//GUqByAnFEcu+vS3SXwpX03MOc3h3W1SDFtQwsnmIytb
	P3/YMGdVT8QFcURLR/iMOkn4trtjAkQpSdV/8EsQPQLx5O3GwHv26OtyQR5sAHzHPwsjkJ/TZQ1
	e1bTeaVgFPhVqD+uGmJ8fqeDfHpFuuIp0tpRwT8VOlUJqPvpthhVbv4ECV86tR2OndcWP
X-Gm-Gg: AZFdTZeGS91Z73s243GgpOKnqxx5D7sGnUprzyJYRh3+aTSUSCqsG2A+JEbo60MYxwL
	I99k3IA9ufatzF06tUMMHAkbeNSg+nUsd3COWelLNY48nB8YVhFYkBEd7jqB4gOU8Iws5sEBR6b
	o30EECXVNWG0wz+Fj5SO41DgpuxZG38o89ysrW5XF822ZihQsBUtrBZFeieNP6OycsTxbwTRr1/
	W0iNHvN5sAZSzfAG/uDuavw/k7qmLtNkcLU4A7THhJWyhd9g6w9NQ0UtajR31hrEdA+0AmhHXLI
	LyxjO8iNdl7oA2caT26bLzfiAOexqYhrJaOQ3DZ0j8c2In4cXO5HTJIQ3T0GMiRE9J0yh3KDWHn
	PSPbk48TAe3vDQximAorOIfqhYqs6Bu/Y0IJzgydglXYF4Qk7mKEMc0VzAaRGvyntPEzc5zbeIi
	zsb/6XDv/1EBfio1CsbwNJ/Z00K4OgjMOGUo57PmorGCHcbyES
X-Received: by 2002:a17:903:186:b0:2ef:d89d:b5ec with SMTP id d9443c01a7336-2eff7530c05mr19417545ad.47.1794994941382;
        Wed, 18 Nov 2026 01:42:21 -0800 (PST)
X-Received: by 2002:a17:903:186:b0:2ef:d89d:b5ec with SMTP id d9443c01a7336-2eff7530c05mr19417155ad.47.1794994940856;
        Wed, 18 Nov 2026 01:42:20 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:42:20 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:47 +0800
Subject: [PATCH v3 8/8] arm64: dts: qcom: hawi: enable iris on mtp board
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
Message-Id: <20261118-add_iris_for_hawi-v3-8-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=751;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=hi0+kT+lr/HaEbt7fM61FG/66VSUjQmHQXby413mJ/M=;
 b=qjHYftw8gx0GgWh5AIpLAwCHCx8oongqALIKBEULzF7IBonNqGmb1T4u6QO3VGhPcoInHcOMa
 Um8GqkHQqzDBtPJgDSeWe29qPjaZJuF8hsb3vLvvDtzzTBg/ZoxAKHa
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd72fe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xxM_nQ0a0dx36OX2A9kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: IzE_uevU3w5hd7o1JTFrxnKv8xxYesGX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX968ikR9D+aTp
 zK24mBJQBaC4gVG21cUA99XtXd5e5iEkiFj5YrwovDGzYYq4UjCr13eBU3GyZrpVzegIgw3fywp
 jMVFS3KuKLCyc5kjfyTKdXHa15KAJxE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX9ONAUbi8xsRS
 NWMK52yOHFpIsTqHbMXP7jceqmgCoMt3epuOW6Fa3cePoOA+3kTFlziEq1W0C0y1dLviI9wULGo
 JwN5ouDNlFn4IXitckGB2Rm414oxCAGaoo/8ahGkFj6rUB9VkTsjPdT7vca8TKoxu99E1xaUUO9
 Dr6ho2U1WlVB3oON//uwG/4bxUcf46ZZ6W7haixzzgK1A93vH5gHHN/AmjHpjeARnPCHCKubyWR
 MnecSUY9AzncBu9VVKd5QX9abiSFIFomn/vdoDxVpL7Kex4GK+3IiZMnnbrWvKbv/AazmtWv20I
 s1O1wPg9J+zCjmYy8bBWKbGb88NS5oPx8AazFlvSaVC92t4v5HUcbwsSfK4ZLerO9o7tJ0tf2V+
 EiwC/ic84mNax2EL2TZGzcoLdSUBNW/9+8B/WrB9OrYVv8OsWC8afJ+mcxDY26BudGF8TAkaHVI
 rb/eSIVy+CsHGmz1/5A==
X-Proofpoint-ORIG-GUID: IzE_uevU3w5hd7o1JTFrxnKv8xxYesGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

Enable the iris video codec on the hawi MTP reference board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index c38e5fab7a2cb29e9237c634d75c6a687a988ac1..a8bdf53bcb5d6cce089f069cc8e91ab544c05d8b 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -780,6 +780,12 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu50_p2_s8.mbn";
+
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.43.0

