Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86A235C6A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730241; cv=none; b=MJwVfGKqyO2rIt0EaqwbBbDBMe32xAjNZiswz9oizCujP1o3q5UXSXMeEbmUw/HGaEdduC+FjTzcOTuEu6tvo/ZdOEND9ad7bmZ+5zqMh2GUNnj17DjisAVnJSgmCkDYcMS0comZY2qvelG1p0F1lBw2ioL33KRnvp7TEu8hYv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730241; c=relaxed/simple;
	bh=mcxtEyippX/Dx5cvYCYzl68hDXBpfUs7m87zphQEBko=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t81sYDanVb8Ugq6KA+HqUP0He1eoGjICJ0cquXzQBoqgPgAXsE9ykHy4QuNeIZ7WuJsMOSDp8bBIt7OOwEN6EkyfhR2KSVPNS2HjubFGgQEFx4nHGbNWuvskm+Q4VVF1cEWcIULQx0QS6wTnDODv89wcKkz0gdEzYgbWADc3rZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFjv6xRx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bg0sQBKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFjv6xRx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bg0sQBKN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWPmB2029987
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tQ2yMYM3VQ+
	NuZt84rMCmtqRocZZfQSGFi489qSumbY=; b=jFjv6xRx0J75r5X8UwwUcTR9V7F
	CEBxlaRVH1y7Zk5wSJEVao4Lf+fN+J+lrMKK+GEibNwW7pMoq9uBI77p5POBTdPY
	UL2LF05INwBI53OVtp6jWnWVlJwTEfSSnn2hgW/Ghsn/nLVnDvZvVlxhbakB0cy2
	++YKGjJw1rnujF5k76+cGzvIystyCFab2E7yviPfRYFAMA9gR15Ad4eqrb0HCqQj
	QfoaW2UZG9VsGhBnoi4Q7dEZ4/Uagkyo2FoUaT79WVRT9cX1HwZodLFbt/t+oamS
	wWRVfWIZ3PMVTmvruOyEMHEbI+aieHQNKGTz4RAf77KKUy4UJVovZaKiM9Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr83a0y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:23:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb733fc5024so5657692a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784730238; x=1785335038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQ2yMYM3VQ+NuZt84rMCmtqRocZZfQSGFi489qSumbY=;
        b=bg0sQBKN5CNimFdXsoEHDSBO3fH6mswr4+8LWWDnS/HAf6M1ISADmzSiSKxIG3PZXa
         SKFTkTUaKiXN5hPCpdPq4h/OBrnD5RyZiW2dPotCInHjkTGMx+9stJ2whNu32aizy+TO
         lHQkKY5H4lJlbdYAQRgSy+yLwAZTeFZ1kARYFt8UXwh5cdvOHgwxIesOSlJNd6WbEVR+
         Zvvq1PP/vQZKnAchfZge6UYsTPXDhAGJBTuE5vkIsKG2gZE9D8smBPBQOUDl4VXKYgKE
         Sl6Cv3+qEvfrGkgwSLNog4xl7oL0Qlyh4SPf+39nY2r+MsVsCeEtAR4cu/A0ISs3LbBH
         4Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730238; x=1785335038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQ2yMYM3VQ+NuZt84rMCmtqRocZZfQSGFi489qSumbY=;
        b=Lq70/12CT2CThEhRoLuX9G3/FBQWVYUao/iQxm9OXOAdK4Y8IbMsh0hZycAp2uj3ON
         vh3rBK6sZkr5VwD6dgxnHr3IZlBKse/1bnMwh+7CY+78ZO3Ivwut/dEeRKnlFYVw+anN
         ryyqUeyeas6MJt/DJaRc2HTglz3NMzei3WVFUR6oIkcFd9cHYmSftKugnLAQnRwZbpmw
         VB9710GVEWZVzlTtEh+CIW5WYEJavOuOtrRIKF2jPUqYCxTu3lMbT5LEZoY+vHlix8W+
         Y8VqKaDOa5lEtCM2Gxw9062BY3e2/hRoI3iqDReNP6cPRUaXY/1fgDbbTnEguPf4Gwt7
         CyxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqO1Ke42Mu6QkPg0I2wcuhtC2hwAPjOeaciv7H6pleHnqCCuw0OtTFai8GSk5ZJHI7VGMGaJ+M1WklbUbdl@vger.kernel.org
X-Gm-Message-State: AOJu0YzjiHxzpuFCFmsR59Ix5GXcxAXNhiSsw2C/GBX6IP+V2/CrKGhl
	m/XwMAkT9eLrIPG11Y+vHT5z+5XW9Xwr3sxF1XcQh5XFXRJn36ejMPoto3lV7R2xT1dvb/xKt/Y
	OrXMytm2lCtL3wgIllr5VT3cy1tUuXY8ZZZXAeHOaPq5BBehNrK7XikpOThHRdu9Da6Qu
X-Gm-Gg: AR+sD12Y6FBRwBErPxs4/X+F1soP+8Z0QRqTJziRkCMw260X5hcL5i52DXXUwC7x8Vy
	/9OkbrcOWvCDJ7s+zLR7cwyLJAjLFD8sNxoEmRypGGxwJYPvYpwowWuWT0UQebS/uG5pSjuPhXy
	YK96HkDrl3wDUS20dQfYwZgNRC9bJuFBXHECBayxDhGP2I4bAWQyXi3E+UaPKzpiKgUVeo0XcFk
	jTWHIUAAaxd/4pMuWnwMPuJ3SyS6TyZIov0JKr89BYJbk4GRI6tPGu631nw5oQRAmywSceYHOf2
	2QgFGpBwLS7Toh9/hjHedhpTuihh7J6+W2DVbJKlJmozZDV1V3aUAcsihI7+rep1uRTkIh32OUA
	R5+PzRCdGkQNLWyPMgZOe//a07jw=
X-Received: by 2002:a05:6a21:a8b:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3c3ad7a88b9mr26333837637.28.1784730238180;
        Wed, 22 Jul 2026 07:23:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8b:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3c3ad7a88b9mr26333799637.28.1784730237774;
        Wed, 22 Jul 2026 07:23:57 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc7d8fbsm11231211eec.10.2026.07.22.07.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:23:57 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V4 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage for SD-card
Date: Wed, 22 Jul 2026 19:53:39 +0530
Message-Id: <20260722142342.990384-2-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oSP3cqDqY-Uo-KlLxjOASJg8OoPKxbKx
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60d27e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RbnQZSTpM6gPS1NYG1gA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: oSP3cqDqY-Uo-KlLxjOASJg8OoPKxbKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MSBTYWx0ZWRfX7qartM6/Y4S2
 J/eIMNJR26cAmOeVJhmozymsHasU9l4zfJ0oKJsKQnK00eib59G70I+p77G7j0J/K+pj2vRWEUd
 jMAAG7TilnweFIBxbFGFFRpQGxjgbGaUoQU7Gzy0a4DmbIMEhQuS9tZIXCS1F0fJ8A5Zuc3EcaO
 lcgnZr9f+jyZQxj05e5x/F+/etlyPG/FoZSA8v5gbeMrm3/QGgZM1MUJ0ONlPUelplm6z4Sfns2
 OVEWtFJ2+Od69w3lHrM9M0eAjWJL4X9IaGGB/oXMROdQWcOFqx4ehbCPsxFAzk8c19H9dBzgWnb
 sd83RaDGOLdzwoxtbpfVqmZuixv/g9WxzdTBc0YVyTIFTfN9yshm4N4bC3YBhxJJAgsQYgkzAqH
 82nuZx4jj0OA01ia59duUG0hsbFZUAFo16MwSHlRUUZGdKHA9/qh44Mp+edmU07MfTKCAmnVP6X
 pHouU6NjUfqloIDH4pQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MSBTYWx0ZWRfX06BELYxKCi5b
 f8YWXm8OxohUYruB/2YA8cru+rBGqA3lQKsOVsaIriWddf07o4KQQMJaA/Cc1QqPBYhZuULNTXy
 583cceqoNhPgixM6cuJ7lb45Ri2fNFM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220141

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

SD cards may need 1.8v VDDIO also to be supported, to accommodate this
requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
supplies to VDDIO pin of SD card.

NOTE - Since this SD card is the only client on this regulator, this
change should not have any side effect on any other clients.
moreover, SD card driver takes care to explicitly vote for the
regulator voltage based on the SD card detection sequence.

Also for stable operation of the SD card increase VDD voltage
supplied by `vreg_l9b_e0` to 2.96v.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index b314c6dd423c..2e41b4ec83a5 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -373,7 +373,7 @@ vreg_l1b_e0_1p8: ldo1 {
 
 		vreg_l2b_e0_2p9: ldo2 {
 			regulator-name = "vreg_l2b_e0_2p9";
-			regulator-min-microvolt = <2904000>;
+			regulator-min-microvolt = <1804000>;
 			regulator-max-microvolt = <2904000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
@@ -392,10 +392,10 @@ vreg_l8b_e0_1p50: ldo8 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-		vreg_l9b_e0_2p7: ldo9 {
-			regulator-name = "vreg_l9b_e0_2p7";
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <2704000>;
+		vreg_l9b_e0_2p9: ldo9 {
+			regulator-name = "vreg_l9b_e0_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
-- 
2.34.1

