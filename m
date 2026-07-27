Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CEF408032
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156716; cv=none; b=toHcNN5pAV+mKXJW6PFKyEvDqKhRXXTB2ZeBFvcabyurtemQooZoR9xhrMLGZvvH3olpLcDHjfbuVRBvqE7aObmm9Nq19c4R/iNM0htQmt2U8NZqlW6D7dc1UZ9mhzOF64TrAoI775BHsHhLdqoHkWP5AIiZWevI/Ly45zqukZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156716; c=relaxed/simple;
	bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BzVg74h5AxMqjZwzkO4iitgkC9cQh5n7g1k1085ycyDkMLPDKpIPplmwR4TuAitDwhXLxDrrpuuEz9THWRT/DZIObYBVSEatFizhQAh/aR/DrfZ+4wSp25JPwpPkcBMfpj3CsgXf/Vs6Ul5kT24wnjhbIi+L2yh8wLEfum901W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tgm0soCu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PFB3SjIb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tgm0soCu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PFB3SjIb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAM0BN3758455
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=; b=Tgm0soCuKMXqzUgK
	c3fNrQLdLdyJPuapJQcpxfeivlDCotvtPNuZkshVrcHO+nuUvGNfacuym8kO3i4A
	TWh17mXmqZdL94QRaI3INGwuRfE14mLxgyg3qhiDJ9oqdcqBV4z92NCp8PXzrIxD
	BP/BeA/IZ2FdmAzffezEydto4db0XS/fXDVCd2MzeGTVP1cQr+1Pwau7Zo+T8+wB
	WWe7pyvmf3xcoRJmqBYJWwy5lSbB66wmDOP0UrAwAbsfu1hlSwDkTL4+Di4JebEW
	U5cLj5qG0hiIbhsVFRNI0zrI/GwSePg8aCRVabM5bWLc/0hW57JQ0wcTvLRoea3t
	6wDWIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c60u37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso2235704a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785156713; x=1785761513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=PFB3SjIbVwteUf7jR9+FJxDpDsNb787SRx1bN135iPhhShXsjiNC5kpOcZdbI1E+9r
         /v1s7fiWUtz2fW2zFoVSwimE/0U4uvqURHNxcAfOYJd7GiiYVl5pT1K8VpJC2P2N4EYn
         LBvuINYs6wb93hMaI428efCWSJ2yDaKtllxm0xCnn3FTXCucLSdIs6yBOsdw8qy8eCkO
         d49USW+SSlEzZu2Tsv1bWqh2VhsdUvTf3sbuuZ2Wt7cLybKdN1MHig1MWIEaltEprBLx
         Zd6mFz095FBJIkrGNUt1Ar/5NDHo0g4DbSvFpq7wQGwb5EX07dZo0vphLef2E1Gl9sMx
         VHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156713; x=1785761513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=bA9GaE7aDUtwVjAGDsqvUViur0KTZbbpv6kmD7xV9J8DdZIi1LqRUcG7J/Km4S0zZ3
         L6USCejDV55+s+dXjF0XNIlWinQDMtSUVB5Cx4Pb7naTOqxgWBM5uLUe0NKg9tEvey0z
         yqQ9zu9BAWR9qGSwK+jOaECAy1/tcwDg9Mx1nHum6yURDGrhvpOoSvqx2gecWVhpBbsj
         XdkIMZafQwH2FaiZ/45PGAxQ3OGRbqqyiAI+RHIDiPx/AKv/9tNNfHnreP+nPkbi8+zB
         WF1sGhZR6rpklKh+ZOkMDz2viIHZ+AndWYn1h7ZLCnsbQR1A2QrHqPPnFKiMppwPPHC8
         PMYw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4r6wsUc2JSKPiswqZgKBp8cvAaqFaKU0hsVBWqg8QRA1xTX8zhi6/YA3dwWQOb38HZgs1YlmRDjmtt12w@vger.kernel.org
X-Gm-Message-State: AOJu0YwoKRyvR6KVGEoQ+oIDTLBAXT5e6ljJ+wFvosk5xvEFUOT1ynhp
	6H9MbFvq4ncnurQ4fJWF/0OZSlczdsIDc8itImi8SwUkK9ekz6IVIuZ+GTeo4+pAI+lmLjWZxDO
	y/047DTNqSTj4sImbotPHKNnrVHJOmvUPRCRvV9rmrfnNFCkFbuH15qYYAIasPbH4FIjo
X-Gm-Gg: AR+sD11QMiBoEB/C7mjY7RE1q9EcyB9vItYRrimVMvDWzjBhYg/C1fiInwV1oLMSzIM
	tf8gRBSBuaYYdPzaob96uC+O/g33Pcr8SVGHsxL1nfiWYAx1Tfy3Bh5I5MpTYIFaycJOM1BLulE
	jZxCswBpaRmDLznI5o9nbXYjn8ciYn9qCaE9e9lwxYXYtuIP6JJxntR/4bIXCEtcXukjX+RF49r
	V6mzbpnj/dUtWECW552LCVDa8rb6tIwqvGH0wYKBu5y9psZ1TxV9U2QiTbKO6Dz3ZGKIG/DuHwm
	03aSe6j8LTjzxe3y5SYqMF58M4MobPp2g+1NGg7VuilX9oL9rCKGEfWKV3Ioy6flFmGaOyKVEq4
	IGSOB6By4Tj02ckqao7IsbSXzpCbqgQnK2O4Q+d36tCx0vH3W0yqCCVZ9kJjdQJG1
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3c67dfa8d9dmr7583818637.54.1785156713134;
        Mon, 27 Jul 2026 05:51:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3c67dfa8d9dmr7583779637.54.1785156712722;
        Mon, 27 Jul 2026 05:51:52 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e878esm32263425eec.3.2026.07.27.05.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:51:52 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 05:51:41 -0700
Subject: [PATCH v3 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-b4-kalambo-crd-v3-4-25280faceece@oss.qualcomm.com>
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
In-Reply-To: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785156707; l=984;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
 b=MQA2xxhUAWwsr5VbnBKaNxs8mQ5H5+lg10MJbm1R61HLiZ5bjREng0tmYKLeKLDRL3j5vK71k
 n24AKLD2JigA107iua48tO3YT8PL+6UqgEWumJu2/XKLy6+fI/9tXL6
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a675469 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sPeBD9Pss2NjrgU8DtoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX+TEhFBz2I5zf
 xR23rmm6IZGsVsQ87gDTWAp8nQEfu/Z5fUQ6DO8uadIKsIuAYw379WITN+yDkqWxp9trI/dwBKA
 xH6ccrNPmklBLS2+CvyWvSgfrDl67iU=
X-Proofpoint-ORIG-GUID: Jzs4eBEMrjV1c7qc5UtZjg7TsaXjaV5k
X-Proofpoint-GUID: Jzs4eBEMrjV1c7qc5UtZjg7TsaXjaV5k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX/b6iAqSWFW2k
 IVvHN6uDzmbYOg8L5hJMAirlh6/UxTDBHFVPIl8xpUdOcp6enpPKmpkzoZzILuoTSEU8R2ld2cN
 8WkyDNK1TKQnCoHu2KVZsUjhzUf0JXCCD1PC/ZsSh4XwonzFUQMChLZOEVovNzy81kycRlMDX8C
 h3Vq/qtyVKnmRhoVsfvM6Ssg/Ihpc0wDIEaFMG7sJr8BwKg1Z0ijJShSES0x3no8kS8khYcpWP1
 GcPjPt6sXEg/4j0bjCXeKd7rHlXAIqQR7qYozQKos1SFZMvVfsUtUiGZaW6AW0lLcoUkVWqWrJA
 RYKYK7jTRk/pEQfWFdf/aNAlyW8CmpyqhYsPk1qVrzHH0KCckHanTLtkZG+oWKcFJnzynOwR+Zs
 9G8H1K7t1OYwPsIGWs+9cc7II2ZvmozhbN+XythY5D7HytC5eTLUcyRZ+qwws6HRubxdWCQb7K7
 /GeOILfmERbW03cpB3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270125

Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
efivars.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130..d1cc6c908daa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2327,6 +2327,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.34.1

