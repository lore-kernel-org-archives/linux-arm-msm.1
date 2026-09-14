Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ECD43F4D3
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382733; cv=none; b=ulU/0yG3eVp4wb54bPiCOIqWj8mvdFhnrMKMOem6Ca27xw482iw5IjBqwIxvSq/Wt+DVAJ68m+CyAMgi7AMroIr7uoulEmpSYHq7fmW4hhLO2SVYhTkQsQldkSmuJ3HVZW+e4ljWqvQLHCpU9fq/I5h+EnxQH7l9upYJ0Ceilqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382733; c=relaxed/simple;
	bh=LgVLOg1arH3h6yph2weqhsiaYO9KaoHGIb0VLd0w+9A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NxdCP6kSZeIz8jXT3TW64UOqJJeWOfRV0oZsJihyu2oxoH4TvFuVewAcUyUhInWR1rRt0aO/poFSKYZwtJ7kKYrEcLBVsPa8yoMMdtEOWQXDmmVgwsIuyMvdYKXJLY2oBhC9dze7tojJyoI95HEXnQQwOqgTLvfsNSJOBhML4l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ni8fuoLd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jyfMH8Uv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ni8fuoLd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jyfMH8Uv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nYv03731565
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bVt9ANX2ebJHpMR9J1dO4N
	fPSwjbfp7C4d6bTEwou7c=; b=ni8fuoLdBZyUyB+gFjLwlRzQaJbAH42Z8ai4Hj
	LkgGfmUmUNN2pIBMVhJQimyteKr9CZcAqyYpSVadmfipY1YTB0lLwl6f1ac7mZ/p
	PJkJKQDCvfDQ/nKjYGyqbNoijvGD/R2Ez1oHRxiU9bSmo3hH5mQttGAtbM9ZD3Sn
	aFxT3+Ba4jk4EgZPErFhK/ZIIi3JYX8B4hvQnQrmPJgeO0gSAv13vHzQoQwvB/zj
	VjQwQ2GyeoqD5Xc160f2DV7rn2E2tqxpl5wLe4Pa0kMb9tkZ+atLF8jPWjErSMAZ
	bEOBx1BhOzh7x1cdgRK7HyMgR9PLc3HkcRWuXT+irY4nc+4g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0j1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so483210685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382716; x=1789987516; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bVt9ANX2ebJHpMR9J1dO4NfPSwjbfp7C4d6bTEwou7c=;
        b=jyfMH8Uvpgyh5JehiOcRf1fJyXXtT0yfEgAWZqgLWRkoWrsugaxedMQYE4/7iAimWA
         bDgtIVjyFa8upQb9hVXvKWAcu5cxpjRMT8k7hMlIep2mFDrLtdl7mQTBZWqp3NZDyrwX
         AIgSnZEJS+G2wExSk7NB3aFvbNQnZtVG1q838bDlLvX2YgzslmvRSpDx+4882pHpKbBC
         /cVO35RBth5oQwbeGb/3NYe/CeVy8GAqTDqkDKAxoMKy2P0iq4trEOedmN2/7xCWVkvR
         2jkc4Xpjhmtx0yW+uTaxJoPqBHOnLQGicoXFxQwY937vhaYNtDXhy+Cbb/k7EiMlfAO1
         hSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382716; x=1789987516;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bVt9ANX2ebJHpMR9J1dO4NfPSwjbfp7C4d6bTEwou7c=;
        b=QF3iDAkkRMEpIVuFxV8+c3t4LRqUznVGhjsXyL6AJtyUdAmFCWr4V7Scq/euUKqXr3
         2Ju7/HUSkrRQ1AmMfwNVyGjBjS5pkOWyBfnLirHbQ/4sO5lf3eYYTioShoFG718N6UkL
         YmD0j1xmyn3BzLcTC6QSbzcsx94XbnL73oVci63RiBtujH5sVh6qmSRbY+L9CkE5Go9w
         sR97lowThy15N0PdgGaXcuWRjpUuftermoZ8P0Q7Ph8+PGPtBPKIxoTsXotKc9rIJqSb
         bUnkjgT0ddMAjeUjlNO1T1L8sZwvpdMxHFkCktFrXorsPULjcq5akCK8PRX9osuZOYjm
         KCtw==
X-Gm-Message-State: AFuF++mwzKTlF4sIb4Br5CS5RB1g3acJILq0gBsF2lY96Dv39Jr7EcP7
	zxqhY+oZPaMrxHGyhRcx6S9LQe8UwlY5xP6PbtQexxfDenVVBO7mj70myRp2d6oD9BIzMNY9NZ4
	JbXcDu/OhqKQjPn9kJjpLro610QOrEH1I5Z50sd+zUCCe6vrEfvDCBrHGhmpzeMiUFJfw
X-Gm-Gg: AYBFou3ZsK8bN1ig4FzAuelByCt3INWUbG9mmN69Rj5gZJJIR+X6GScFbS4AomF+x7l
	kkicEajLxApl8m/QHkHeQt+7TxcDtmr8Hgfh3gsnJAJH6Qf254ua5sIsal2CVd3wCY1gAdDA/w9
	/LyQr7uaVRqSGAuZV8y+VIpt5MvluSzWLrd3Jk/zBx/uRqEo65et4JIGEoxTFrHHeHFSf3E9TAV
	L+9eFay88mOOwSe0LwxwYdBcKLBOb+twBZOGtFv7gNCtPtPJzBOIEeiKKksxRBkreFEoaMRma9k
	mZ8pCzq/BhnYNijl6haYi5jqYG49mIdUchir1Gh+lKbDmsXWGnAegRTJozv287ebGZXvy05m/xt
	QpklpRrfH
X-Received: by 2002:a05:620a:198f:b0:91c:c20b:a135 with SMTP id af79cd13be357-93a29a07d04mr239750485a.40.1789382710789;
        Mon, 14 Sep 2026 03:45:10 -0700 (PDT)
X-Received: by 2002:a05:620a:198f:b0:91c:c20b:a135 with SMTP id af79cd13be357-93a29a07d04mr239675785a.40.1789382705592;
        Mon, 14 Sep 2026 03:45:05 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm26335926f8f.15.2026.09.14.03.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: eliza-cqs-evk: Add storage subtypes
 and rework generic parts
Date: Mon, 14 Sep 2026 13:44:47 +0300
Message-Id: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB/Qp2oC/yXNQQ6CMBBA0auQWTtJqRWDVzEuxnbQMVqkU4iBc
 HeqLt/m/wWUk7DCqVog8SQqfSyodxX4O8Ubo4RisMY2pq0dhqw4+P6F/JSZkELAsVOcKAnFjEd
 nWusbvz+QgxJ5J+7k8xucL3/reH2wz98qrOsG6IepU4IAAAA=
X-Change-ID: 20260914-dts-qcom-eliza-add-ufs-variant-74092c6c35a4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=LgVLOg1arH3h6yph2weqhsiaYO9KaoHGIb0VLd0w+9A=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp9ApTMOdveQxC+GgWs24vgVerOyzMma7EAhXl
 IWzjH1+QSmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfQKQAKCRAbX0TJAJUV
 Vr5DD/90DWRJJAWm10lQLvvjM5+th4W1uJ73J00f28H0HieOBxzaTbLRNrJnltOreWkdLqmghQA
 JKw8/K6OY5JDwiQUic44JTh3/60AGaV7lWRcMm8U3WLIP7Lp1/+GpKS8HYEl/VBMqXbjFr9AvtE
 zW4CY9JS2sNVTQMNRpV60Ofsg58jcfcP81cM0G8CbU68Qfu1z8eGu4dJozEQ5+bTdmFcfgUBflg
 OEVVUPhanXEC0UEJ42ZruUGfwAmGZNoXZjuTtvR48aA2PnESotXHzlpwGVlMKpwTwBf32AmXvpE
 FP6IGSjxBy1/Ltcae7y7/WLNXm2r/tvZv7GZqoAHxcujJ+07EoZhbz6Uy1MFgeiBwZBfEK/TbFM
 zS8gRpcdtzvQe5aXuS0YGvIHz0BVu4Z343Bid/cDWj2MIK8UXkuK918E8pD96HLpQ8rJI0+jcRO
 2dL4MAcp+gEmnQiZEBwrpVXlvBUH1dLz63Rkbh1CMO/HzqOoo8MxmsMldUsAY3C9ZW7EUDRy5cQ
 P4AuSouxyf0mMW8LhJaLBjJb41Ab+niNMzwoErtnMkko35L+4YGnLO6/Z/NPZwxeRZbGykTbQ7a
 aTu0NEYrUBPwKVqlKcVeyYc9yn0DDyP00Ton5v9dog/wBz/UBkCVd/c38WaT8HjIHAAlm8s6rNv
 3bw59rCxmX/PpmA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: LQXi72ZZQI8aDDNjzOnxk8bYQOsxcdOU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX+1wd1VxjLMcn
 6BJJedoq1L4WNkcEH8yJFALdrnkz1l6sPkeQErgqL30y+yzwmyT3vA1sTGQqIoQWqVGh3hQk9p/
 7fKST89p4Fvdy11UIM1Zm/Y8iNXFxMk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX7DUrt4F+vxB/
 HX4cEvE5pfriI6PxscZQLNVpM+adXXitykiOzIvI0S8mnwYWS/iZvTz0U9g7S0Rwerf4BMPR5SV
 /AB4AqISB1yZCsf+/YXazs/zma80+vUtMYh9S35REv9/H1B5Sw9eok1wdwoFQFTi3GP8ipWihPw
 8Qo5jUZaKfN5mJFff+L2WZSJqj4SL4qf+cg94hIHK4CQMsL4R4zp3wbpiY/xEQLa5PUBCPl443L
 tyoDiIuOEYelRCrxvG5iP696gC+Fv6jjmbHhJdfn/rY99dSVwtIwvbSxnHhMfSWYxll+/dXSQIv
 mjb+UNISJxkKvtIREh+wnJkD+eT21c81cAxn03kxWEKpP/0gSh4dZS00Ig+CYokpRwzq/AHnMK0
 LMq8TYI3N5oNnP5S/Xikmdb6bNRk+4N6un0QFrdRo68q8g1MgZlPYVqNjEx52j1USaAQGUfU4zK
 u4Fzgf9Ci0eHZf/32dw==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7d03c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ujb343AK-uRHTq2VCXsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: LQXi72ZZQI8aDDNjzOnxk8bYQOsxcdOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140154

It turns out there is a UFS variant of the Eliza CQS SoM as well. So
lets differentiate between them with -emmc and -ufs suffixes for DTBs
and compatible strings.

Adding -emmc suffix for to the current Eliza CQS SoM and EVK devicetree
files will not affect any current users as these boards haven't reached
the public use yet.

Also, move the sound card support from the eliza-cqs-evk to the generic
eliza-evk, which will allow it to be reused not only by the UFS variant,
but also by the Eliza CQM EVK later on.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (5):
      dt-bindings: arm: qcom: Add more compatible for Eliza EVKs and SoMs
      arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic
      arm64: dts: qcom: eliza: Rename existing EVK to suggest eMMC
      arm64: dts: qcom: eliza: Add CQS SoM UFS variant
      arm64: dts: qcom: eliza: Add CQS EVK UFS variant

 Documentation/devicetree/bindings/arm/qcom.yaml    |   9 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts    |  18 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts     |  18 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts         | 141 -------
 ...{eliza-cqs-som.dtsi => eliza-cqs-som-emmc.dtsi} |   0
 arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi    | 421 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            | 139 +++++++
 8 files changed, 607 insertions(+), 142 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-dts-qcom-eliza-add-ufs-variant-74092c6c35a4

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

