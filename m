Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C43443E28
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789837; cv=none; b=Rprp3MCCpLhzbe9+YC/+v8QRwlabMAlya6gMWwTSOz2ZO9TrIWDKRYefxjKzQBCCVpjgeCTjKSGVtWtKKPXGSyaG/On6L6qRHTEgCTObPo3K8sK4fCGJU8+oKzU2jD3d6upbi+YzxAaZsUPdC+nAFCMnY0zSLQm16HBRjN31zlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789837; c=relaxed/simple;
	bh=Y5l4gNnj5IFnWaA//fHQGkfX55rsZQiy8kt/OiiN394=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSTLwNWFM7jSqBP1eeJQKnXmlWXMfEGHb3HnRrQNXmimK5zscSWUY7dSdgduOHJfpVJq8secLf1xM6357T26h3BvKhI/5+7xqcdG1sayC3+Z69cEtVEqw3uW19nLwXOSQH91f9/qPHM1rZwiLNTN7zqtJjdn0Z//MKBN0UcN2tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6WVHPwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4BEhK+0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6WVHPwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4BEhK+0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55oAO1339375
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fR0CWoW9AzruZkAqd74db3UE8VAkryaD0PNTDW7tTeA=; b=n6WVHPwyA+ZLy1AI
	j+WbIzgwiQiCbyL2UaZBXY9hzp2of0UD2n5l3k/mh0UJcGlI4B8OQl7FCiv8VflX
	D3eSCPSmuo+3jpv0YmOjvxS1MDPLpaSM74J/6+I7Xq+vcXIYOunIHtD/eA/tP63e
	2jbGJnS9V/WpxS53pm0j4sweBpGvjCpxFMfvfCw8JUn3/Ns/YbPjhfitTVr0FprV
	eUABaXbNNdGLbrSey0LW1JHBnxZAMYceFaO5ebSMgNORG/BtWdFRpIrkGewTVraJ
	iDKWga0dU2cSvwXZ7e/OYvmqVM9jA/4LDNOzkDI4NCw6h9d0CnU/b682Zf1zMO5P
	zoTNcA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk25bw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so3809426eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789833; x=1792394633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fR0CWoW9AzruZkAqd74db3UE8VAkryaD0PNTDW7tTeA=;
        b=h4BEhK+0xE4+oUV83mVCaTA+JDUoYelGvyEelukVAQunozdEkXdNmbnwMxqNoKuGYK
         +weMUEmcfX0WOowV8iE3+EEhOTOgaSM1LAFp7A3b1I4F/thsTcEQj3nxCwXwW0xnZt75
         e9LIWtlhEDWDoH907Fn5NqqfMQ5lRUm6stmNO1+WqH+uWK/1EQhuCTIG8QqOMU0GNW8r
         LxMxgMmy+ZiqEFuj8HtvSLzVw+MOKXaQDaH71MQ7NxkBJw3uDm1nSdduQNV3LcCMzjqG
         Nq0vOeBtvVgN7zPpRbIDHTjckWKxj1d0jA4Qn/S3PPoymUfmsAJ8aj4G9IHKzqOTTbwf
         UaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789833; x=1792394633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fR0CWoW9AzruZkAqd74db3UE8VAkryaD0PNTDW7tTeA=;
        b=KNtrEM/cpFkzJzb60k670YPsX67leKWtoN/pDDwCHgAIJWJdo2yxYKN3f3V813nLiH
         lBmr8YbpCjmkwpbkISsfOqkLOF0VlQuAnjcDJRQpElZWq5/ZTtsbe0NC8eT6Bbb+7n+e
         CQJdkThuX6xbmlmdDF7/C9mD4GTQu+aa4sZSQi3PhDhFVUF+ezn+DvhDdaPo48Q4C24f
         dChydq3QnqFLeeVBSmbrqOyZLdxYelz5i2rRDALhEunpt++bvsBN0daGb52EcjrrWtXx
         Nzqk+PvnPtf/Khak+8a29y8ohi2FCasXw4r/blXTjd+jVS3I93BIMxx1eruwTYXbBtH1
         R1kQ==
X-Gm-Message-State: AFq9FYLjEC5aTRbmQnny/DoYrw5/t7SlsLsAlpSWO9TU/1PxITlh8Jsm
	2EZjY606lveVUdZb7RtTo0/MdKxPF8n5gSRI7mllvNiyptbWsfVrqVK6IGloB2khBgWGIFV0jG5
	tR65M2THKWRjZ2FbfilSABSIIFKmGYF1FqjJN/MQo9+C730/IY300e0oHBmkLLlPHUb8V
X-Gm-Gg: AYBFou2s2J/bX7wJ2FgNVM9gDsDRw5i8ZkLJzOebjvplaZdDeIjo6E21MdbOaEh3wT8
	SRSQm8y1DMJHb8VX8fVGY6UONN7Uz8LLMJrkmwRzwbqc5nIAxl8rtVrnY8y5VtOrx8zesObbUvL
	v1mh8qkjT7rDwdwgqJK/WcdsUN2B+SAv5U5uLcS1THEyn6s50o9IR9pbnGQgU1Xfdf+GlICzHHJ
	2sgKZvTxTKVMbs/z47uyp5UUduIvAV06NMP2dcOSMFFLWQk88zVTudjruVbc+ivXEbNp7Rskn8k
	CHcgri8bbiBhFeV1Jo/dn7dlk/BIPhZFRrdkQdBib0cvP1/gkQzhbDnzTZTXRjDhpRVCIhp7Fxd
	Sn7hjg9roGH7AfrNRIwZY5kzcgDlwPziFaYy5COfvHHf8WIj5jOGfEqhrfAJKJOKB+DwNtfOqd8
	c+IZ0oDMG0E7K/zCwp7pzSW4Aitkg3
X-Received: by 2002:a05:701b:42c5:20b0:151:2e62:fe4b with SMTP id a92af1059eb24-16a5c8d48ecmr12034635c88.23.1791789833395;
        Mon, 12 Oct 2026 00:23:53 -0700 (PDT)
X-Received: by 2002:a05:701b:42c5:20b0:151:2e62:fe4b with SMTP id a92af1059eb24-16a5c8d48ecmr12034611c88.23.1791789832813;
        Mon, 12 Oct 2026 00:23:52 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:52 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:11 +0530
Subject: [PATCH v7 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-11-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: zr2RgO5yTObe3_vWIj5UFWzDaAjVyfBB
X-Proofpoint-GUID: zr2RgO5yTObe3_vWIj5UFWzDaAjVyfBB
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acc8b0a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fxknKD5f1rE6hJysUL8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX9QthQLMmJWyv
 yYteOv+tFxaus59wC9g1g+K9DCSjEkRzHlRV9Msv3/Vf0WObYj/Wl7cIdFnN6/FtsqIfWJ6qQxf
 U7QZbLFaGDE9wVjgKdVNtcwGdQ542CXaRMreDuCkmdXxD8tPcVoNPElN7O3YwYWhxX84QeD0rhM
 +XziSXFJFdqVkgYpyW/DqmngLV9aeBiZ+WU3ngjNdEs/3aMoyK7DlkntBMZufCGX4xCbaXKeVFS
 2bX+fOaAPuEBkhU9HiT4IQho44iq4fPhu4PUoIQ5AhgPLQ8gkW/UDaO/opJ779izb6ehOfzyQlI
 6UgLBc+qaReY4DJyO5eMyh7JtyijsUgwZqSnc2LGCayZDxaqHGZEuE5+MtZuuyZZ2bYPIB8bPtV
 SxAU/Xy8boFfj8awuHvuhrtShSpDMAhNWyTiafj7sdiPFdj+FJ3C1TNiRwk7N0bRsakNFK2eCFG
 r6uXHB1mrEZoJpXhEtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX4iTjVuUtkPtw
 C++j/KHmKpoedNEzh6BU7cbJz647cRQ1Eg7dJY/X/XSajLZGrk//GD00yb/BYT+71JzGA0F30vn
 0My2o3wKFVer2RZf2gIzy8lGIA3jBgY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Add random generator node for the RNG block present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index cf1c9898ddb8..7bd0c4476076 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -362,6 +362,13 @@ tsens: thermal-sensor@4a9000 {
 			#qcom,sensors = <5>;
 		};
 
+		rng: rng@4c3000 {
+			compatible = "qcom,ipq5210-trng", "qcom,trng";
+			reg = <0x0 0x004c3000 0x0 0x1000>;
+			clocks = <&gcc GCC_QRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;

-- 
2.34.1

