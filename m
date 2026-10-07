Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E1747DF9B
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363766; cv=none; b=eOECR+nf3Y8tPGM3VXV7xWuUSnxEBaxWBMvPHyKr4D8JytxSy0s/VhMyDyFeWYekaQ8PTZGyi3UP18DxmahBNVSTIlFLoRrdMFdv1lt02wJYH1w3GXNGC0cs19UnhpwY5/EsngCNqyeV+TypFc1o7iiC06FLEXUaP1oj5HV85xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363766; c=relaxed/simple;
	bh=RuhyOjKQKg6pBFbp3gU3ApGTv0VXjIXo8m3P/9Wd9Mo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aAf6wPNcwzCEfAZXKD4srKqeCE1xLTF8dA6qWn6g9gN4e5kYNA4BoB3efMt0dJOQ5EXvnjQowgpeV88o/7XgXKVI8DQ9QixGD1KrjImPy7R7ov9X6kxj95KKxXxC7eGtzjW+34eP+p20wWfnZwKY5nqDSisi4fSstOdXmAOwZ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLyPETOS reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLyPETOS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977joTW3298567
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RSFwFFRmZR1
	WRsY1c9AXXEPBp3eHl/0EdS15woUz0X8=; b=iLyPETOSABKLVZ5ZARQo1uGOZIP
	k8iVfaswVA0lqLUo0yhZG/tXkvfxyiDWDKGsR5p7ByfTwH8WGAPCb09FOrMLHc5v
	C2IkI7mEKiSUlctwAJh/i2us0c5Wxjl4f2YvZ5A72scxj2UMAJJq5pEYLEZBjiOq
	VqsiDT3sWKXvJQ/ZOutBsY+RT2D5IZr1nva+TsJis+w2hURPTrbEnPmcI6ZZaC3g
	w6CHg1ZcOsQ+PK1ZWtgJ55AUNAd/NDQGHS2vV6dBcIGz0eygcpBSo3WiFsoWmM1I
	I7/MbqK3+2EJ2nAOcVQWZQz2BuLrxE4ZyUnNDSMdRft4Zg5FewjIQVXqStA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrbwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:02:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso276392185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363735; x=1791968535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSFwFFRmZR1WRsY1c9AXXEPBp3eHl/0EdS15woUz0X8=;
        b=Jr7iD4bAHsOvvvq1B0aVMGgLdFQO31qA4vHXW8FLnMsd6bl1GbEjrguxUMH9jGU+xg
         6WXN+PYV0L9UuxCzfuoOM14Bfd06HpyA0MhfHTGqZO4ANtvAOdGwp4sKO9dpyaG/Dt0B
         lvP4ZBEZpbIBx6tGC8gv032QDNsxKOdZlULGF2bVd3wFqqydb/YaBP9+wnknkygKhO81
         Ld/BkeUxKskl8qCefFvwE+tCd3UOc1duG4BQx7seFawB7DyQXO64+RHbuh8ZOW/oqGAk
         +fNXdt7iZ1k5HLi0fETuwmWVaakpY38gzphV9xsghKAi/66I8clVtuy3P6SSQfsVGLx8
         vuog==
X-Forwarded-Encrypted: i=1; AKwUvBwFE4YGpG6piHBsMj8+Gp3mCDn0EY3Y1VZBqe9lMPJfEdQbgtWJZZEFl+qT1jyN9F9pRFNP9PVuPvORUJPI@vger.kernel.org
X-Gm-Message-State: AFuF++n0Jdw586oaykx5KhqoWTW3A4Hj6kglrjiuNtNRwFC6rSQI0Gcz
	gqPcEorqda30wRx/uOYMHBc5kcJZ1n6HXsY2nRUYSqqeIlTAwYxjCKbYAVfzG/v55Q8cwIVAJgk
	ZUOu3eSPBVx8YcvqFuIxqptEm8yYhHLkeyq5VoYtVacKkftydb+iBaNHCpS2avrW62F6Q
X-Gm-Gg: AYBFou2w8V/II5fY/eDZSoZ76nAmEnE6Q2hEP5DUSjy8cjVXuQ8SnWCsA9gskN9hy0v
	7/VCJfkX94CJk+Pzmf5IDlEZ9F0OEPBlT4YQswjafG78WZjoDgS8bxwvEDlN1+4TKbrMiIeeZJR
	XykDKOg0rs/kvIka/hSAyBCVGjuLQfwkVYsfDn5LIM0TDyhV6lNUiOuNqlubtrNaI/pt5/KHF4b
	lW2dMjBtc7hJhWUlsuJWFJMtK4IAYFy5NOdv1sHJGx/N44GP0SXMYJFxmDDBrltoug8VWM+/+gc
	Ykmjkx+xybOhDH63idEw0WXQlrGhp7vlBBP/9uQjcSv5L1NkSBi8a+tTot0=
X-Received: by 2002:a05:620a:44c7:b0:93e:9809:3369 with SMTP id af79cd13be357-93e9b856ee4mr312955185a.74.1791363735127;
        Wed, 07 Oct 2026 02:02:15 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:93e:9809:3369 with SMTP id af79cd13be357-93e9b856ee4mr312950285a.74.1791363734638;
        Wed, 07 Oct 2026 02:02:14 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:13 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 25/45] dt-bindings: media: qcom,sa8775p-camss: add pixel path variant
Date: Wed,  7 Oct 2026 12:00:21 +0300
Message-Id: <20261007090041.3732717-26-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O182R3OVoLiC75rG5NYghpyCPJbj8VMx
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac60a97 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=-SsTkY4pZgJ_H_-AmIoA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX0oJ7m/OGblhN
 3oJ+f8Izb68lV4lHYwU73a7gTlMM+ZEIY2JVRILToccUd6uv7WnlLQ47+6VvirvV47tuHF5PqPM
 Cep4ie5atEUBMYfuC61ALpmstUG5kbA=
X-Proofpoint-ORIG-GUID: O182R3OVoLiC75rG5NYghpyCPJbj8VMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXw969F9ZA7fcU
 N+zSBiqgWx5QxOidyBnd9ruY+VqJ0A0I7kz+y4xczOgznmViThZ7NWWv2WdaVhwDFTisMYI3MCp
 BVoC1TW5EEZYyaeLs+od3kYYfSn6YSf77OnXwwBnutn5Q+bb0bMLeTfGuQmdlPYCLhmIeQXBDo/
 VNNggSUAP/GZ3S/9lWdBEW0LMTaJAmmY12qMC0ht2kgoEVcV/gSLe4t288cR9k+jr2HPsKgV9eI
 v/U5Y4maTjdGvq7iXAi+yZkJzpcRxfqn8Bz8S/k9hWI2g5gwrwEF/Uq1xQu5hiPDfba2BU3rYD8
 Bnq3Jjxzp4xNvWaVIYXRJY7U6YStNTOrw3GGMDjPUsA9g47XRD7Z4FkPwKZxQ4suQJD6MEbTNBB
 B1BVcTW3gmlqEnV9A+PAvIGofIkZHfRlbY3sdVVFIQPd/zVJvIgCo1EFoy/6MjAc/d2HOodzSNm
 0PjEihH2uRgrRJjVq1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
index 48f280e99809..9206c7cfe197 100644
--- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,sa8775p-camss
+    enum:
+      - qcom,sa8775p-camss-pix
+      - qcom,sa8775p-camss
 
   reg:
     maxItems: 22
-- 
2.34.1

