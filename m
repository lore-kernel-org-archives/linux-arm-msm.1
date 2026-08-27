Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0F735BDC7
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 21:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787867442; cv=none; b=K5kvzeZNZ8Mt1oDUEal6eJ3RV+a1SUfNYG49PxIXH2kM2GiUsKoP4+IWEWeIj7lGKpMk6jbQcLtQcRVM9avAgdaYTwWf+w9xiTb/GPZk4J/jCRGy3O2RkIgQaZRhWE1zXMeAfKnzk1dIWGfeVH7QSzcGyD0j2XwYieHNLq8A0BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787867442; c=relaxed/simple;
	bh=C1ScAVXGqizWHISwSvqFI+Pombiwkz6s3sB6XZM3ljM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t2N4R5CkOJ4b8muDvlYkySkCxqGdW5NAnUzXIY28U5L2k3HDqOz/zMie3pe5yOdIVJ6NFOU8zw+TlumHxrwbykC+OkAo6b0SxfG09tp04kaY6floGPK4oE3VkAP97XqAs/qqGl4RoI8y/r1qYErwSYmFLRRKhO3MwPQFhFDKWlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMbz80ZP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmYUH8ij; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMbz80ZP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmYUH8ij"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RJLu2K1117685
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 21:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=q1J85jAU480nkRQHABV5e0xfslV1RLCJfhR
	jqhP+oXA=; b=gMbz80ZP4Ql6KklApEFpVEAJl+vD4EA/79j7lcKeJIh0YVUVsv/
	ytp9LhIBVrz1pW2aHHu6nEo0jb9uvimL9oJdswQolwpvA4PV+Z9GIb6VbCL9xe0p
	zSJpAkzR5Q9Ac3I57RZb02ZfCkpEsnT/vx3DWkloOKWw7hSoBA93+R9z9TfsNpvm
	cUhMborRo3kzaSnEEAoCm+ctfaa/MkqWoUp9nY46+yX4ETpJ0owLHxwWNOpCiBUF
	ltnYpfaaULRKsWcsHZAfZJXP4qB+QNlAarZLKSkBnAYSQXSGPRYDnuzPBR3GzlaD
	wCv0wqX9ZcpcefjyT4n2gu7ui5C0ouQtXkg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0hd1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 21:50:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fb6c7b680so4034381cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 14:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787867439; x=1788472239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1J85jAU480nkRQHABV5e0xfslV1RLCJfhRjqhP+oXA=;
        b=XmYUH8ijHO21HlFvDdTZN5iZgiqTirjXdCoe+0FDrUmDLCAJ5cddvv9cOlv31rtpWS
         PFwY0qeSD6GGMWkwaDGn9vyjjs+ozWyKxygiKn8FQ4dKyK/jSSQbav7ksotHXWBZW+UE
         9icv/K80xjv3YrFg1q96VaOBlYwtntoZWs5xLuWN4vZ9DuHkMrDvC+UofF+gKPz90B5V
         PRiXXDqEBGLqHnz6seV5J5JLPi/o5a9WsNckTWRqiyknCehy3ujDQuF6MDj4vCnF9ty8
         vQAIQD5wBXLuF4zW8fbW5xMAkorCTVJQnc3gP+3DOITAnrV0j2dU9vwG3LqU7ZBbn85G
         TwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787867439; x=1788472239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1J85jAU480nkRQHABV5e0xfslV1RLCJfhRjqhP+oXA=;
        b=ssByuDxrblTkYSGwukvjHTv9u638C/B9z4boVKt8WnBCsLlzfRCUog00he6je4mHIi
         EdLSTpUDmccPp3gBFcvl0Ay4b97GmJ3YxYlxIUh8tYMBHZCk1rfn7CAQBaUCQy3p7NIq
         kFJcD+hTFns5emcILi9pxxj+hGt5fqMnXepZrfDFgnm7BmzBy+BXiHyK08U2U7G4ehgm
         CQq3g7vLOINJtKu5EoW42LdOvlt1Gk9i+xv3KYllzA5x87ORmkm32VbCij7s3RSrVl4q
         vsJHdmFrzCNHd+DjA9wDfIJYy8NXTQBRNG53yMxsef+9SFrJMLTeIMQkBT/5Ho1ZpnaS
         8Vbg==
X-Forwarded-Encrypted: i=1; AHgh+RrM1Pqr4hXbBRe6ENTZAVs7Zk429FTpVLA0NmDIH8fWLS+WVue5TKdyPpIheAVYRwl1aG6cxHByCKTAlokR@vger.kernel.org
X-Gm-Message-State: AFuF++kqCRPtnxEoPzDarakxqwVOx0b/ZEpl3+hCzC7jIcgi24JFlIXD
	wtqFmSo7kZ/pT5jTIA0RXgvZxxmJToV8nUxLFnv68lEeYiOp65RrWtz1OqWt3yYxgcO1lw+3KH5
	AZnbEGhZan7L4fRKsRS2Dh9h5zR8H6/S/qOdyeFgDpoCqgJtz3YgoNOeqsSyOFtfJgTWF
X-Gm-Gg: AR+sD13od41N2AFyNmd419Zz70We/bhZvpFWqKMObPy1WfzASHb/LbgBRMCN+zyV8Hi
	xNf07RxtbnEFoEqOCp/y5WMTBUXv2R9NWW2G15SFR67j4m9c+uTXsUlBq0KDzwlR5rgKTS5Yu0r
	S5h2q8Wo8ieGRyNdaLfqLl/UC2AyGz1VDuOjleH/tEBn/z47M+2ht1vJELANver2j6HoXEFrMV+
	f+iIB97DFwDScr1I84aO/3L3VwSHv7cHVsOg3dCVcXNr59Z7CKPSMtYPmsXHpKMnjfqQs1B5R24
	pN7bUoRmwfTfQeF2+KnqB8BqalpsT/oJr1PhNCui03BPDCmjMxD3IFNrEuWWjrx4UoVK529g/dm
	hs4aF0dQyypMi0zg=
X-Received: by 2002:a05:622a:2507:b0:51c:1e46:711a with SMTP id d75a77b69052e-52fb95e9223mr32770181cf.24.1787867439047;
        Thu, 27 Aug 2026 14:50:39 -0700 (PDT)
X-Received: by 2002:a05:622a:2507:b0:51c:1e46:711a with SMTP id d75a77b69052e-52fb95e9223mr32769521cf.24.1787867438526;
        Thu, 27 Aug 2026 14:50:38 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dcaf61sm1261435e9.4.2026.08.27.14.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 14:50:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus: Drop redundant status=okay
Date: Thu, 27 Aug 2026 23:50:02 +0200
Message-ID: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=702; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=C1ScAVXGqizWHISwSvqFI+Pombiwkz6s3sB6XZM3ljM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkLEJBfeSdGx5LyuHQUK+yJZk9GXbb7Yi8/aBq
 1ZIZ61Qp7eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapCxCQAKCRDBN2bmhouD
 18c2EACF//Ar+37STpdRJjelbC12XOkUkuksaoF51Qq4rWH8Ibq6joAbAIW7RTHARdvwrpgtoGD
 HFLBdwuI+ic4VzN4cwPSqOsPD43j3ULmJImjvg/pwBiQHw6BJfsS1vDMM8pGK62VMN7sl7bKQwv
 LWD77p2UKcw64oyOvARLOxrhEvAsW6QkkhEV7Rd9wJz7p2ZyF3c/aCyg1pv6SpK0x7grM8Snhgp
 sYglhCwkq5FZet2QncCtGPHKR6igdxGQ3jkagSzAdOfPOFNMFjXq6kwbi+QxtiDyQsSceOHPN8y
 XP+pNhR5R9FdGQmvHGlTN2XQ9QAa2VWsu4baZrq5Nm5HLF/bwWgqRWA2NOfMJ5lm3kId6rtFGu6
 pI2OF9kJh8SKLSMsahkVMIHXncY1ppkSeuqlXH0b87xxA6JE5v51aU0b6o1HdYsC6HrP56LP50V
 gWtBj7R2o8mNQnVw103RsevfxGpcCJaCrVRhPSwxyKRnICXWXLFiSOvHq10K75MWfKjuhZkuDpu
 N+EPb9ARAYErVIbPDCEDeG6XYJGLOjZ1JL+Y/5Wj1SLnI3nTf890UjZMCfHFCO1PsZcP7oVAnqX
 OSx9AfIroAwVljqeE3P42VPJOu26S2HK235sresIPFfPopyjsvVlxCLUWS4uD43PYdw0O+snF16 fMJlAThzaBuFfqA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE4NCBTYWx0ZWRfXw6iij5D7AuCF
 Dm3GIJ8Y8a9TcL+hm9yuSkxxO9AVehCcMaW7NnQ6ffqyrNgAgOqK4WuO765NuiohXyneh5ho6vj
 I/KBUaj5Txa8DqcVZRi0/DScdbXMEmpDiCAqm4XgfnE8ZqRh1cOYNIWEfDd3NKW4FdisSicK8lh
 L1/7FyZ1ZYmK9yCKAqJJ2Csvb9k4flVOrO9jN63DgIUSwWQES5ndJ9lOJDuLUJDnDqSSMA0i1h8
 F0OiDND0iU09rbpybCK0lAgByYN0UnFFDKmwgpEWkEYqYPNwKHWAScLmorZC+76VOFJ8pHKK1lC
 xwSvjS4u1eT/pOnKpFHZyHkaWstS66DpPtSmS7ZDqzLfLGz96YXl831P9PKZjV70GE/Z7ROdevN
 MulfKAqsaUrhqRQUv2ZEPsjljBP51VDGXLZJlsrHoXUfywKvUrt92GjwIiysE5xALXF0oYRKGmY
 Ou7mdiQeKYgDFgBOFVw==
X-Proofpoint-GUID: omRGaON7Sbxlmb9G6Y4G3E86vl6VPRrc
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a90b12f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=9VaQ_ZmEn04Xv8QsgdMA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: omRGaON7Sbxlmb9G6Y4G3E86vl6VPRrc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE4NCBTYWx0ZWRfX+1uj0JNIdG3A
 QrLa+vAX7+quEczudx3sKoo7RiH3HIq0eF0/AfuGjCtuTAoEIT3sHMMJCjOyS3PPe5unGClDxGB
 MSYHq4dMKsRIEXNrhz1gSfU1ZRqm8NQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270184

New nodes does not need to set the status as "okay", so drop one from
fuel gauge.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 439779f308e3..d98e3b2f1c30 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -510,7 +510,6 @@ &i2c10 {
 
 	bq27441_fg: bq27441-battery@55 {
 		compatible = "ti,bq27411";
-		status = "okay";
 		reg = <0x55>;
 	};
 };
-- 
2.53.0

