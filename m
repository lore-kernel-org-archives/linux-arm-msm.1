Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927373D6477
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792307843; cv=none; b=EOum+uaLsKQ0Y21CVJeCSLkt/a/HzsA+vaXFSNtvwRKplOoZM7cCBLVOlM+mgko/h1BfZdYIT6tgBzSUZR4EVsCg/arTLiabhflgS8a57ElCA7tqIISEHc7CTa9ZZkBRtsRXh+w7XpEeAKZ5jAGQ2M+MeuaJfcmsYmt6cJ8vMd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792307843; c=relaxed/simple;
	bh=sX4fEQfFrNSZ8fgQgLtRKDIGj47yFxCj1lU8vWYxAr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PnLEIvdO6zFZXuFzCDzS97L+sb993trqnHyRETH+xsBOsATDjZz7p8WhtppNELP5qZo13Yu9phjjj27jXi+Tc1FFi6uNf72n5Yy5CZbIZQd10f1oMKBLWeB4wsPUjeJRqsC5yFNqtqSk/26ubuYeHybsF2cjQcYwkLnbMpcVTwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJ9yJ3bg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JR+7EpS9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJ9yJ3bg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JR+7EpS9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5u2rs3597277
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 07:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=; b=NJ9yJ3bgcqAq6NsK
	BZ5aguWeQ5S8ZsBhM9RH6omS92TvM8wYWFSC5ZODZYvQsWltsVfkffV7yyzvL8+t
	MtiiOgYU5RrlwXV2rEP6q2T98yuVQMCFSmKzignKjNmjeAOZgJ/IKJXyBHU/w1hL
	Xsgln3Yt6n9ut3IFR07f30xsU/HLDWOAt7GTdCYbuKmxybTepDonimUxBj7dpl1I
	S9VktXLwJbrJnwMvdh8RzNhSufukDBiFEa/zQwhKArEB8KMTycZwYiwCIkPnnZ4f
	DNjqN+/VoTFqor/v3MXCJZIYogAjFNCwd/Q/CSNYOT7/wOfPABh373ky7RYt1ZIx
	C+qEjw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc016jqsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 07:17:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so2018137eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 00:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792307840; x=1792912640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
        b=JR+7EpS9VdswK2ewpYDrcPY+jUAYnTZ/TVETnJdgt+zMF+8AX8X2cKFJVUHHJJaPCr
         ri/UttwvtlVBPi98V1UjID9tgj6DxwXQ0sVwS61LWpJeauGcFdyfXTsELkTITfGmiDBX
         kbjblL0OZGW1Q2tLTDst4btoMQS7XkQjleIGWtB9ZFFqH6GcOTPw0jx4+tSIkobaoVzm
         nocz2CjEEXmXGQTPcpBGocPfo233FO32+7aSJAHtjuvIIfpGBfAJzx+P++F/Q7p8KMMa
         Ot9uhJrKU/3n9dDw3MirR2C9RLoOJ7Htz6nvz9Dskd7PXHBDVJgkuMoU/9ZTlR8QRE/w
         1NmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792307840; x=1792912640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
        b=SHNwUAqpXG0421l8f3cdNLkRKjTc8sYU/I2rMPaduFonKIU3lnvztBugzkvIzVNxDB
         +8mdqb4AhAYdDeKtyaobvDevln3A9RHHuhuCuAqVNdHRlzvJ39kKSXLWeU6i+01WaNCw
         KMr5flZ7RXT+ncAJDq8qdGbbDO5sj6cMa1eD0mMtZLLDB9NkIvuG2c/KWMd+QyG3rFkU
         4cMc4Yq+pO7K28zGn/mu6tI+ICVeky52IEkXoXU8abL/KM6HnnRphYoTclaiTvIsgtVZ
         AA+TBAXchVhy+SZ+kTHC0xc5YFpNbuBczTGk0agow5TLlqQSe7SfuIfLNQIGPgDxFfTX
         3KBg==
X-Gm-Message-State: AFq9FYL0bCs8SWYXstWKdhiOPfkQD46RSwvaRenZ5UQivRaAJkXRL27u
	D4hKMV2wPl2V/1nvLqjm4hp6dbpPuZctTSWXEOhN6KkHDgulFNslc5OTOvgsCwfKLXvFV4lr8XL
	3iySdMOaqIFyoWVR84SfjdRHfXvKdbuSMu+PgQrydUEhOEGk4wN8iKUNC+JEg9GMr3NQY
X-Gm-Gg: AYBFou0+PyyX4YcGevGujqFndfwElCRQF3tJsmLxA1+SCEp0OUyez2hmlJBOUrQOEA7
	OCk9C32ZjPxYUnkPS2sGts+759qBTU5D87wTsYB70xXMx56PYcOwmraQLzD/75DXIQ+ij5DR2VA
	PjcZ8DdeEL+kuXlDXTb8IgUYrHXJwDKGJbedHiDaeXG8B1RQsD7N/LHkMt4DvuV0U5vM7z6UPYU
	XQ+VxmdJpXi7CsW/oc/IjWZhlNQFBbsbR+doEwJgKF03OUdOm9kZAa2w/O/0IIIB11oEGEN1NBw
	ZgpKhgRQr4oC+yleCh8FDa3UGVkfBTQ8TxXcCm5lThIIh8DHO4NefOQnTWqC2+Dz83DJyqYhqI3
	Ls4DWMQK9Gq0sKXoS63ky8+lYnBJZCb/49x4=
X-Received: by 2002:a05:7022:ea42:b0:164:3237:4485 with SMTP id a92af1059eb24-18507af60e0mr6606419c88.0.1792307840312;
        Sun, 18 Oct 2026 00:17:20 -0700 (PDT)
X-Received: by 2002:a05:7022:ea42:b0:164:3237:4485 with SMTP id a92af1059eb24-18507af60e0mr6606397c88.0.1792307839660;
        Sun, 18 Oct 2026 00:17:19 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm18646776c88.5.2026.10.18.00.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 00:17:19 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 12:46:48 +0530
Subject: [PATCH RFC v2 3/3] arm64: dts: qcom: nord: Add SoCCP on
 Ride-Embedded board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-nord-soccp-dt-v2-3-4d713d316e9d@oss.qualcomm.com>
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
In-Reply-To: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfX3MLbrijauJTn
 drezwc/1YpLwtKw4MHK5cD27bM3otHQFPv8YWQiSynhbUy4b9j5SXFqJ5dGY6NaqBUY+zNAH/hP
 d9hzL4pzyy3E1jczlSuk728TdErHgfc=
X-Proofpoint-GUID: oUyPiHngWrcSu-tUqRlq48OgnD29RQ7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfX7+D4TTsV4jr3
 2foKsY/lMOM2/4yDftQt+M+CSzjLIocxFPz0Qgj0aMeUygLKHOd9o+LEQF6Fb9/M1UZJ9Ssg0x+
 YZsETbT6CeNOHKeactvL1rEcIctDD3FstinsgfvE3fPuLY18K0qcV4M/TpKiFFAKqwLp93oEWyU
 Q3qv502VaPQmLL9PwPkZbCYwKeOwbTzEbrAuiTML4UMruQRXHSNKAFN+mCDiYz3QlqMmDfcnE+b
 lhK+UuZkUbra+gf7BTGrkCH6ZvUOvzukftoJYwx+70bNEGE6vDV+QL7t5JqPBSEBs1L3gVsDtvW
 d+omIDPbs6v3EzmhxlY2kyF11QtpigLkFaFZZGkML1/8aw0ujHTJBSoV84Av3VrrStqjhvH/8Mz
 1+pVkYVPfwX2ZCECoEfFtuo8ZitXhlQKGyxiIMqxPFTpiC4LJuIQrBj8pUTqsFFeS1jt2gXPTU2
 PBUq5s5kKFgHNK2jCsQ==
X-Authority-Analysis: v=2.4 cv=COm/zhrD c=1 sm=1 tr=0 ts=6ad47281 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XGSE3OjeN7eXtsT-Ms4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: oUyPiHngWrcSu-tUqRlq48OgnD29RQ7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180028

Add the SoCCP remoteproc node with its firmware path on the Nord
Ride Embedded board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..1aa3ed4c1e45 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -419,6 +419,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &uart15 {
 	status = "okay";
 };

-- 
2.43.0

