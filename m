Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623963AC0EE
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134135; cv=none; b=q5WDdsJyfMpBmzOkN5B+H9floO/rYQeDK0GoWp+kqYT2owbyyMKEcv3FKRiSPot5caRKhX1iXGvNkvnLTA4eVztjjNOFWY04kEP5mQZrdMwoDG3z738JgjwJm89m90OIWE1jg9RixFNuoAH0hwRwsNMHtQ8FcrYyPG2t71f/QTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134135; c=relaxed/simple;
	bh=lVtM4gNQhK5diSNalLrFRgiXw9n7yN3qfT1UFSHTtgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DevV7LizgXm6tcmx4MPT8CsffgynXy76ocypGlnJ042i8DD17GChdRPYTSI+snIOnlH1Jj4aE6WlWf9X2MkX67Pov20pKVbrpMR/Dy4jVqh+MunAAlGqExBaoZ8u5XPaOBjbRXbTiKPoTgYnp4xP7u7YuJ/MSOJCZWfyfeT9quI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSOHTU7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KcrH878M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSOHTU7p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KcrH878M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N351Vf368050
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtMmYfH53gR4AdhKWOmoFIiBUnMjy+NZFN/cLLiTJsQ=; b=BSOHTU7pFuhEYs/s
	YLTwu9uZD5YigWvPekC7NNam7057b6Vdz6v6OqwWKU/ELcRnY/SAXvgbtu3iSx86
	lpvq3NsWJQXORsDCfjA1V1O3CpPyHr1LTinvqEOruJqs2NhRu+jk/E/xUuQ+oOdT
	/Tpkv68Gu/8J4QKqEC32fdiUVSNnY1MMstXQeAbPNM1etNg3PpaYBex1io8+wivY
	29v5hh0tRtCHNYXka4FLQfiTS/w24x4DZnfuZ+Hkll8eBrwMokEy3Em8B1UJP5cn
	LaLGnYimmijtutn9OG4inpaQbOyKTR5lfG3C9Hw2D5J2AoXuwK3thBms+LJh5Rap
	ZyGIbA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntc6fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:28:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so4756585ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790134133; x=1790738933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtMmYfH53gR4AdhKWOmoFIiBUnMjy+NZFN/cLLiTJsQ=;
        b=KcrH878M8FGB23U6eQlkdJXrG4Se1Edw9GbEOvfxCfMnSpHQY03QaxL4aJSNA7LqQU
         Y5aWt+EaX3+yv+31Xagyq+gy+8kL+mXMAHe4QKRRRmkjvl2C+C7sH92muN4s+2nDpVnv
         vWlxbfs9FbeJ/t2Um8kbdUjFgDMDwNQI2tZ/uePa73OTHfDqVA9byzw9OUhvh72iDe2p
         X+Q1/lu11ZuZBwQy0k0C3qy68cuLvIuFVHBsEHMjW1UzDtOkMaKd6rPmvGYq/SfaA6fz
         AixIwPM09xGp4QCjyCqlW/KqfcLX3NbiWUwHmz+9zA4TNtOa8rCxslVUMwxC7NHdoi1F
         Pqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134133; x=1790738933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtMmYfH53gR4AdhKWOmoFIiBUnMjy+NZFN/cLLiTJsQ=;
        b=WcVuoIl3/KttT/slcR+kpSwhmAcpHExjg/cjRsQMokX+VuGlI3Zi3o6LzOGet4HMGH
         j7etSXRdTpDMXm/LdKgDDmPTwabI7OkZZpzb7kkKMbFkvVJfzkEE5ZHWtX3g+AF6RPro
         nS1fhYRpWtC3BE8XJ0PVBKOFD7ITf6faNjMYZixJlVLy7e05rs61L6Io2BeMvzQw7VAF
         zuiblCD7bMGAZH+ZBb2tnTOYyxKF7aHwG96YjheVnaOb6+2SuRhG/l8PWezWpQ0EPMYh
         b+UzjGZHnusWC7Gzqfq4wdVh29o/J2RW4G//mxmKnLBR+3EroVPKY+sjxKfSNalqm6h8
         t7mw==
X-Gm-Message-State: AFuF++l5U13sftoa9vupUjE0PA63Ss5YLo1tEj+Wm+aw/2r2lAIO+LZ+
	4SdqrBf/A9rZJrKmd6H0Gr6CyzDcEn9BLPLL396dqC63/JFlMnccU/gZn91zcnTQMabrldo8WT6
	j97pZQ/RKgyuH8lVtkC7ajmWwVODXERJ5lBuCzx8LNeHoSmBtuT1vxN2Plj/BQsd6DyN3
X-Gm-Gg: AYBFou2pvEOxw7xrsESr8IyvaafZpb5Y237a2V0//3EwIQ9c0eKKPAhOzY0W4h/82QR
	Qg4lF4qBBqZoiZkUs0azhfdppaY3EU8mxe9RTpOb2CYF5TH6dLk8zJk8qeRQQ2Kn1gwDg6yL8P7
	kLbIVMCnX4UI5UzIMfgwIumaAf8tKVV7mijJyuXUa8OtyCUcUssT2fjzrvGk22iVjjTBi4cP1mD
	odPtXMUcpRMzBcCHl+tnrd9zr1KW2drAiIvaE0UccmnRyO9DUtAKCZeuTiThkks+b94GDg+zx8w
	sdQpuBba+mXTAbVVCKF9h8D5msTWAkkMYUuXkkn6xH2aMfMv/UG9fHwuxEqnDEBN+3k1iiI0qqz
	qwYgnFblIPNiGymmtoq9MnY0q82sc73IgpJtr3eZjke++jMRA+8NzXhJ1bx9e0Y6VkmhouxCMIQ
	==
X-Received: by 2002:a17:902:ce8e:b0:2dd:c053:ec70 with SMTP id d9443c01a7336-2df69dc7b77mr11286575ad.35.1790134132942;
        Tue, 22 Sep 2026 20:28:52 -0700 (PDT)
X-Received: by 2002:a17:902:ce8e:b0:2dd:c053:ec70 with SMTP id d9443c01a7336-2df69dc7b77mr11286495ad.35.1790134132491;
        Tue, 22 Sep 2026 20:28:52 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3733sm3603525ad.41.2026.09.22.20.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:28:52 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:27:57 +0800
Subject: [PATCH v2 7/7] arm64: dts: qcom: hawi: enable iris on mtp board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_hawi-v2-7-016ec3d24b79@oss.qualcomm.com>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
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
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790134092; l=638;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=lVtM4gNQhK5diSNalLrFRgiXw9n7yN3qfT1UFSHTtgk=;
 b=//rqu5HQQtquSPF4r4bzuxK1mF38mMhJ/UBBRtYKaUQ1NeAzTJb1rFds/rxI7zQ9T6sZpGovL
 lnf9Kyi0FglAyYnzaH2youZIEsV390V0BINAWqGKvs6L00HawZa+vcz
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: hSUOG88SN1oItroAbwHL2Brs69Z2Fqgo
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab34775 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZfE5abJMpLnrTF1vLU4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX/vbjm5JsjCDr
 lwyPYEjM8r6IX5nnwAAbfaPiAqgfLKvFICxriLDQk0lFczpvktK4yWTLmE/gd2RRvyZ4aBRxIb0
 ZJcK7rCNVFO+qiUJItQHgy3ZiOSMunLurSzjG9DGVz8vqrz6j5wwWzMxmfEffOMec8zXt8osFVX
 XcQdcQtK1fk4Pbmm8kOcaKmj9ptsINhUMlEhSzfWvmrG03YMY0zSRhAapA6Ny7QoZk8uT8cWI2X
 sI5V/VELOFvtr8HkUt7iaiB5ws3V+CtyG5nDgYuctea7GywH9YNRPOnnMjapuHDfv/TxUPJuIz2
 j+tJsCR4xu6q0AEla/Q6EB7D4Ir5D1iK+mA7Us8YiD9JaxbEYUCxuS+cpZHgzd/NVqNQmV9c2AR
 MUQIOKUukiDl6pj7bZ+jI+7+aRkyk44SIPWDrNmQIt17LJQ7SDKXfBCaFbb9B8Hdk7vnQxFft8N
 PmzyNLQiyav9jur5vNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX2kdyY2yxgoX3
 IGOxkwgQC61oTydszGd1MQeMKGVI/uWFUsOqnqip4yBPdKMwdPBexdLwHoQNov3x0oU4hAXxMQ+
 eWFzgr5/8mSQJDIg22Onj1YcCv9PhsA=
X-Proofpoint-GUID: hSUOG88SN1oItroAbwHL2Brs69Z2Fqgo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013

Enable the iris video codec on the hawi MTP reference board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 7709582491f9d426886a6afced6d3706b629e620..9b8616221b9c0d227f2ec97363bd4c076d8dc247 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -781,6 +781,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.43.0

