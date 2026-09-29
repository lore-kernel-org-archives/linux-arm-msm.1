Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA6526A9F
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687478; cv=none; b=iUZzHKYjNgu9sikgpd3CB3/37Egx0citepu8L4o85TXQ5xSiB1JvWXzJT2u2Xl0j1QBQY30KY8p7ba1+0RGeRzOTPbn/HYy5gtC0oWkJ+5LSO6uWq/TlWEi7qMeMjc2sj/UYb7egI1N11xtuv3dlihbIsb6HgH3grrcFqLMEQ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687478; c=relaxed/simple;
	bh=O5w6xCV6zqlu9zFfHn+r5awG/He1W71Xy4zJcI3Epi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+D7EoyDYVgae7OizrgnWUZpmUFoRY427PI4HotIZwgSPojTlvkSJZwfDKVjoyYdTi9/1ErKYuk+qu2pyHpuuBN/pim+ZYOzz/oOdjkFE9vDTnystzEgAT00RfX7vLg5lC5mbwnUHXnZrXV+R+qU8dzXIyyoELSgvIcIJg2LHWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgmE2TMJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBktHKjb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HgmE2TMJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBktHKjb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqfrj1016902
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHYcoiHXDQCxhXTk6wbevGF/oKGAv0Pa8gGj/VFAQqA=; b=HgmE2TMJoVBA3FXq
	VK/2OVF4lA2Oq88usOkoAsIxRMDj7uIKfxGrg86AdxE/+Yd3wXd5HZDt0hEOCnZF
	6Lb1kuWqwexH5VpjoDiz10LK/JMExNU+UuPfZSHnoqZfd50bC8EjCKqgh4Pnblvx
	f5f/5lNZRZNmtgVqiV5/dAf+z9qwVfWhnTHEi42slxGVOoGXNJadOMqHeGJLpYfx
	mPV3iAeZa+mqD301/rZcD4ZYORNRH7pMW2BdQQ1XXtnp3dpa/DBIIpy7T+UP/z8g
	INcxQDgElZGFx8MEo0YZVfBP47GU+Fn+yxpAAqzRvMVi93KLan9nx/OwqJJXytB/
	dgjfGw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxj4e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:11:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179524bf03so1475546d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687474; x=1791292274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHYcoiHXDQCxhXTk6wbevGF/oKGAv0Pa8gGj/VFAQqA=;
        b=aBktHKjbAz+3HpvC7y9YTFPr5s9hAdboFBGjEAe4aCHBorYhN+pLBHetIB/t95Ot4A
         ZYvEPN58bsg0pjgFF0kvpRYzOMjDPPfSDXsjB86EyKL9sSRcdzwO73AabugYKJdz6+qS
         /gIPXtQOHqWYoIkASgHmlN9xuT6jCaVMZvRXF6RG6gqaxgCTgB61rqza+RSPykKXSicl
         edjyN4/btwG/YjL9wSyAEn2LhXPV/KE/XdFi/u2DEY0yjLmHg7pRP0a3Op0H8Vjjbr3y
         cQU/fAyqY9hB0YIlOU3hxvI++2u7kBoNsojCrLLXM4qzUynEQexARMeRWn3myQszi6Qj
         iaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687474; x=1791292274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHYcoiHXDQCxhXTk6wbevGF/oKGAv0Pa8gGj/VFAQqA=;
        b=EU7J+UgxZJH+15sKEci9R3LjhfgJPmxEJ8SY0JUIV+x7XEbbZz+AnV1P3USTdl/5SX
         HYerf/vgUJhIYL6NpXdsTPT0bRZ/mMyvDLGHe2uHba0M1av9jpCgGOfAYcPuYxFr0Waj
         ZD6R0ZMX+SB/NSPa4pKyDswbQ9hev58Bv3n4QDn1Lf0JjvQXRtBiWncEWgaP/TZuVSo+
         KzCKa7TsPxXF7t0sPs73hDFbymVWzuX/zxebUK0slKqLStn79PMdNJzzGugIKhV3Jbt+
         fKMoTDo71GmwmxlkxTjF84LL2IAmWtkrTSLv957j2HHZfGrHZ+kJBlmhdA3n5n899z09
         5u+Q==
X-Forwarded-Encrypted: i=1; AKwUvByiqhtZ5CM5I7cVCHKueklLWC83EEs77lCqLHBFBwi17Z5LTSjxyVrolLyymuUVzb5dEGVXsKK6NAj+39sI@vger.kernel.org
X-Gm-Message-State: AFuF++kgoaiRIDuTxZEXOCRJDP6jezQDjbQY4rwkuq++F+Q19NlaU4df
	y2I3jzv/17ul2+AOVUfUAFQrZSsmqHZyNCWz6JkewiHyAtN0OjaULU3nzRzv8/safv6wHvvdLwt
	wKgMDG4oTB8XgUWtAa8+olLZTglsRIwUD9qTVDDE21AZdKzCNQ5ZGk9S9Y16h1Swc6TjA
X-Gm-Gg: AYBFou2I1HicMARMzbGBniXO9NgcB85NEd7F+JN50cZF/uKlDwZNGCVap5olgrccVBj
	hVo+FuqjR2IeqcGJgS8h/6gWJxK0VQRH8vOb8hnrDPyt+iL5Q4AUFwNpN+ubhZSZjBumR0jdXTf
	JQTadQ2iZfubVgevTf69ui7wjyZXpDSG8jqiodnZ6ijTDAMgPywMkZDC9iaaavZgJTdgoFH2gXt
	q0JaVy2NN4uzXSZa0CyM+B4/s74I33UllNTrJq1PY8HxgCY0P2IkRfppWYdSziWexWP8WTVh4u0
	FEgioGGOgEff2q1ihmftF7+M3ChDnv4HkyN5np2pvTvJ3pXOKr7zBgQhg6boG+52mOzdjKodHmc
	ppegwCMmyDAC121SozXVQRm8TVFzsAvKQ4LU=
X-Received: by 2002:a05:6214:2dc6:b0:917:9338:6f16 with SMTP id 6a1803df08f44-917933871f9mr11896176d6.3.1790687473209;
        Tue, 29 Sep 2026 06:11:13 -0700 (PDT)
X-Received: by 2002:a05:6214:2dc6:b0:917:9338:6f16 with SMTP id 6a1803df08f44-917933871f9mr11895406d6.3.1790687472624;
        Tue, 29 Sep 2026 06:11:12 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:12 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:44 +0530
Subject: [PATCH v3 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-12-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1145;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=O5w6xCV6zqlu9zFfHn+r5awG/He1W71Xy4zJcI3Epi8=;
 b=D5j/rezBI+6woOgH4Aa1XUrZtzWWPHx+aHttGaTValqJSzXgPUB2KFniFLy6aQPzTvUM+nEG3
 IntmD3xUVE0DVf6LBfXZVHe6DoHKkbNWzrcAM0Oc3Aasll7HiO69l07
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX2OODsnQKXxgZ
 X2TKB1aY9FSnhp0YIombRPjwAj0Xq/dYTu9KOBJKRdCp6Kv3mmWOyeCNCPHohf8IZBrmVCFIMzN
 PPJhR7qeapdJkCydQ7WtcmdE82m01mQ=
X-Proofpoint-GUID: rhJDI5zSmDSt1u1riSmDs6lbUzYLFs93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXwgpSQ9tjGLk+
 JkHu/janspk6+/gCX2lXBDUkNtCOlu4tnjIIBl37g2Omlj7Roa6IKYF9uqT9+LVIE0NrObwkfuA
 /ENsJMLgfYEqfSux6+PzJgBA/kv8GTyEanris3BHfFUfeiz5vP7AhlukUEOURrkBeuo35GckLV4
 DPzvKhc1s9D/rLy0ocPadwcngmf0sx6Okr9IxOMszw3ueIGOireUq4NCnIE1IXomZHupyA9k1l8
 gse9gv0AuTmme2Gapc3jVoohCIO4uKQLghYqjB8pckamx5mzfF8jk8vyZ1zldIU6v5phxYg3GDV
 abxFP6QVNybDj63b2pOwF0P4R9tsTbf49RyOf1x/m2JY/v6rkogt3za7oocVNB258Uoj5+ILd0O
 4r7BqAmuhCl/9scx06YAYBkUz5eod/aUo7iR43tMvAbc00rnrbROSlsz+yvd9KuSArb0Z3uqisT
 FdY74Hy4NALozN48FSw==
X-Proofpoint-ORIG-GUID: rhJDI5zSmDSt1u1riSmDs6lbUzYLFs93
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbb8f2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 1e02578e4ee3..4809b3d8cfe2 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		sensor@4700 {
+			compatible = "qcom,smb2370-bcl";
+			reg = <0x4700>;
+			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2370_j_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

