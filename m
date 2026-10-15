Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE03DAABC
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031896; cv=none; b=bXDDQH1jbvqAuOgJHsMVwsWzaH2Y3fO+GhzE4ZN+PtxiL8OwdyX00QhR0N9FoOs/vn7aGvljKH0wK1zfzhIP6XI6fs6VTKMthesdDIH+kutieY69gU0oraHPGPDuW/nA+Soy57kfft/L59fKlSqG1eu7CTCNV9o4bwSQ98xkxWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031896; c=relaxed/simple;
	bh=lKYzb7YYdmJaKslKIzocK1cc57OjHmqCM5YXFY6yF/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYR59jesRiCv9f9IrV6sCMYvhhAdlx0gU53gvU1rvSrIdgp0vmXTAXzj1R6y7FzRKdG6sU7Hy8xc40fJYqvZ7Ge9D9sZCnEseBvwl6d+J3IIXCJg/IBcy5NUYGisLVR9HC3IL/ZW00ChrmPjaZ3KAsNBHSnDHYp7TBUrSp10nSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E39yf8UH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BcSzohUq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E39yf8UH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcSzohUq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1OgIp1707295
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i48kfPQPbtV
	IbL4fpRm0x8FXEQSrQZurIlrOJEcsoRM=; b=E39yf8UHe/JtQ6fLxHa1LxT8502
	ab28QhLHoRCoezctIp1Ii4Rmq9IzO683T3aEWubLW6XWkM8yfordwfBBeaZZmFik
	BnmURSgujuN3C8/HMhIDtamnRyZ5hz3qo9hiYhQ2KItThRLq2t7uNTWYuV5mebso
	liqVqH6YVQHXKSxytq74hdQm7vARC7Y9cfr1dLbXXt2n0MRRtxA2Sge0KdfCANto
	sVIy1oWxYtDg03RqeyNIdf3+LvsCRDJ8U2tFZ68/ZL7P0JIdUC9MzmxQTTlRFk7P
	6Ssa40LYxeqOp8zCXosXhFv++lzuEbJaTD91OcEYC/u0J3eSQRMdERllH7Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54r7ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:38:12 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-152d1363a29so17354550c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 19:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031892; x=1792636692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i48kfPQPbtVIbL4fpRm0x8FXEQSrQZurIlrOJEcsoRM=;
        b=BcSzohUq1YP8dcp8+gKsKOb3PoEaaSdT7+pJdJ+uW2VMb9VxsqkUaE1+sl182Lbqy4
         X5dxWWuSdrYjN7geW8yUeA3g4PDNQ98ORnT+HMAWHl4S1D3qkYsb1TyROCzQpyTZfNnf
         F4tgcklbnzepMsMZW3+AOzOrgkQuxvTGHEN5Xs8AzAwxyiUqCyjmdSAUjgtkIymDDEJa
         5gRJNihkUGI+vcOp8nXXqIrjPMnwlxiELizFbuxWpfkjuGUvTRma5aYD3xeWucm+uDGY
         rRXUkXfSCZVqVx1Mt/dOwg2H8hjgNR6WffzMPv07j8jn2qBYaprdUXpP7X2biEV9cQTQ
         HkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031892; x=1792636692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i48kfPQPbtVIbL4fpRm0x8FXEQSrQZurIlrOJEcsoRM=;
        b=Agf//u/NN5bBXa1W4gI27fWj8sbAdQlZIVq3aS7SmuZb15e6nZHxGHLpSHPD08PFYm
         eDdeOnwBCALvm2xMCAQXGutgtUAvqjps0fA8L68jKdqUzMzoCrD3kX/GY5QqxesnLcZL
         VXQuVDroGu8b7qeE8ILA/q/tpEToYb/GZJAGIJ3/gKUAOOVpfYqA7mI8SGxfu21uhKxo
         ipZ5ZdVsxD7N0fht4WrarTnEq/GprVBaJg8BE267qforiael6TJ8pN/nlhSprvzmXWjc
         sGS4ecOTKBXIig/XmIKVYuMsaDWxl+G4xDfr9JIBNXi2Olz9jtl0bb6CEYdFRg0EwOa7
         OyAw==
X-Forwarded-Encrypted: i=1; AKwUvByTFQj71AFjAqH9uUS50VNXDwYrxU+tKAhgpm5YQxHiFuAeciQ1Lr1KV9uxNIL4NLNIdsZTlWkbGLuNWyyN@vger.kernel.org
X-Gm-Message-State: AFq9FYKMMW6oh3D6rv8IuSc8CJKwU+3QMZ/+/dYnQQyoqqDmSplf0cwz
	oU55P3tX0LjKb14/RMs/0PK9k/XbsBPESFIkpWCD5zChUhU9BlxfBBtXVaIAYas7qEBH0ixXb3l
	n/lplZztO/Z1BwbgcsDjQD+s30ZiEt5nNVyjhfcoU2P9bGb8NUiexxJJm5iixH3gdlUMY
X-Gm-Gg: AYBFou3nc5xbsgfnvaZWrGgdRe9r2hZSfjmZDabR+Dz4Pk9OnXAVmKALGiwjs4EiuFl
	2y415dFNuSVf8JWu9/8kQ6vSHWTytjJDrH17Tc368zBQhubExlOe9IvRdhNCdBW/vd8MiJ675tJ
	PpzQBWtvJtIwn5UgWaJ5oZrB7k9HgiY6GLl19kxRGA7K6h2XFD1fFd69rOKOT2v+fpyoYywCYz0
	98gEBQrWr9vvyw5n/sNxuVJAtB72nuUyDCa5r7ne7oxG9k1U1iFNNfmP9bvO2lzSRYHs58RXiWa
	BRtj6JW4pqnRRdtY1nZsdwZ4kCX1IEpMfZaZF8UMhHVxIz/r8AsdH1ZeimnJOEdNU84wuwV9wc6
	odxzoLe6a3yuiK1Sdb6fnjeBax6xDT2pbNZB5Xp9MZcE54bYIzxBFUHTK36I=
X-Received: by 2002:a05:7022:b043:20b0:168:3243:c90c with SMTP id a92af1059eb24-17b74544aa7mr8547911c88.15.1792031891964;
        Wed, 14 Oct 2026 19:38:11 -0700 (PDT)
X-Received: by 2002:a05:7022:b043:20b0:168:3243:c90c with SMTP id a92af1059eb24-17b74544aa7mr8547884c88.15.1792031891436;
        Wed, 14 Oct 2026 19:38:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm51217017c88.15.2026.10.14.19.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:38:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 4/7] arm64: dts: qcom: lemans: Add label for firmware and reserved-memory
Date: Thu, 15 Oct 2026 10:37:08 +0800
Message-ID: <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad03c94 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=UXWPQYcWdAbVtZk0ZdwA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX+4BNOtddn8Iw
 JX8Gt8GdcnfSejqdioOpRVWeR74zV6CQZiGh/9C2Zkh87juH7lkq5Nbn2SRAeHZDKBSUN76Colj
 lYq7VJ/s/6qgrl7B0RjErmda4MY+yJvNkCzh0tXg5a1FHva9Qy1/8EkQF3I/kd8kGGu5+zAXAsf
 7zbCQQ+c2JeoaZ73/btCEIvgc6qPvYp1MDf5dqCmv81sFXS4LWBNdJTQJBtdxLbn1ejif1rcccM
 hQO9voDEUoe+cKw1mOFfe5k81xWPpPZShy2btD+H/saGy0DQP0SisV1FC4iZ4bOOlbfrvdUXVkF
 6zCV/tLTUBMDxyJ+chku9ISjNtssSfyjHojbxH0lb/865cApr9gZ9mwo768z9zsz8FM1EhXF1UY
 lf0Z1DeSy3PzxxYcSNiUFEyhoVKATnpPK43ns1sfggiW+OV+hGupN1bLBAPIjMQS2Ytg4bBNWU0
 AaCcCK1imO1UpWoawbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX/mrQgHYoevp+
 yaxdwSNPjnZAO9FJIRS4ItzyG3J7/0Jip8tmOtYVVTNnXMIgiSFgfXKKiJekaW6mGRZaT9tdszq
 8E+VdC199FDc6f13Oe7JO3/HsHmkfIQ=
X-Proofpoint-GUID: 0IbNIutZJSXSfbBkqPdxBHiG4PXu9kWV
X-Proofpoint-ORIG-GUID: 0IbNIutZJSXSfbBkqPdxBHiG4PXu9kWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150010

Add label for firmware and reserved-memory node to make it easier for user
to override the default configuration.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 821c86409c5d..c71b1a48c383 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -276,7 +276,7 @@ eud_in: endpoint {
 		};
 	};
 
-	firmware {
+	firmware: firmware {
 		scm {
 			compatible = "qcom,scm-sa8775p", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
@@ -365,7 +365,7 @@ system_pd: power-domain-system {
 		};
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-- 
2.43.0

