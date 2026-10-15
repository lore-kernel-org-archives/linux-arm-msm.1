Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B4E3DBD54
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031908; cv=none; b=G48LqYdbpFuwc1FDrA6cHpmCXG3KfdRjgljDqfsxs9QYfBH5mRzJGmquboNrseGJxWP6+hr0uSsuIE6LzoTNinHB5TLeWZYjdLMjj6kBHSs5HEwPvQpES2hfgFtGGsSJLWvOhp7fgGGA4TEB+IEPBLHDAwnLsF+l0yU9SNP6ck8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031908; c=relaxed/simple;
	bh=HHPIAlbg5SKE7ocM9rxmM6Nc1vEe/Zllp1Iqlj02bko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqByKVH0GkDSBIhOxryImlcswPJ1sjAGGbbu9u8tKw5zx50suUsSo1wHuvaKLMLVrjCG9YVWPUseOZxQILOFDfnO163M5wWb8QV0p5884hkaaBqQMZqcmvRE0F3KzJG4EonTohl8z3AVN0ltjOZ69upa3qqY679cUoWer+hjW2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igv5waIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeDfzKnD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igv5waIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeDfzKnD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ELkA5q152564
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rshGCVxoKqS
	MWDYYkngC+6rUP5x1+nGoCJ7kwc1Id3c=; b=igv5waIWSzr/dyQ5pCLveDd/vD7
	PRxC0g08gEPPTPmCLOAWQbZ8e3aXSN2Vnpw1tYeib1X54wyvzI0DRHlSVsVEQ8Qg
	kPYnDwu1eeJVcNV8btRavd8Yo1LVhjcONRG5TmLyc7ojrjcr0say6wDvu+Tc6BQT
	8PT00HsHj555rBa2BbWvqjHEm1i6u2g6+LhYUkwDYtOpHvAFKGPEeEa8vgSc3Wzc
	HQB0t57WIJL+vGs3lGOEJeAaUzlK1P8hdusMDrYIfIBZL5wJ+gvf+EB6Z/ycYjgf
	98kfoZ1q5MMYTzQRf2uFI3Ag/kVTs32RyM5OxZGjUYY1xJxUXIXd4Z+0Bdg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aekmr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:38:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so13423199eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 19:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031903; x=1792636703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rshGCVxoKqSMWDYYkngC+6rUP5x1+nGoCJ7kwc1Id3c=;
        b=CeDfzKnDWyuOhJfHDIBfVi/P+B6pLvyzzw+bKcLwBIYRpP+0WQztxp0di0A0BCqqwb
         5FUo8hJslhfKWDImlIFQQdud/Rr70KppOlQP7UMkj3u9aar0smBz8kwc/f9MEaAmNM4X
         g972Cn9oPZt/tH7YdbfgZj7aj0Li2BVxoZu0PU0akttBiKGlwVvWTnLMmDop05omJHkH
         OEkw8lakzpgkUMB8hE5r8doqCBETFRG0wsEwznKWy130EmIc2j1zkQAJu6VMYE0ByURE
         aIRR9T3LIj7J02E2HZc8SjlSj1Z/eZKrQrME1X+0Ma177nr3FhaDRAIb+Y1gdwKVZLpx
         7esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031903; x=1792636703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rshGCVxoKqSMWDYYkngC+6rUP5x1+nGoCJ7kwc1Id3c=;
        b=wtngVgpqE7KfS9OGdHcJc9HmuKFNucPHrqmL5Z7n8pMAUIJdDOVJVX3/pRsHQsJXtL
         cSypNt/7qtDALDpq1nABHERRx2hdBHYPZtmhhHZxeNq1fxESoH0rLt3ST5USEA9uBxgn
         DKjlN+1uY9SenrkjZic7qTEIX5B4mf7IL3A7mcQ6aW8hbx/ZgZhHbwLQfiqXQa/uvrBF
         6/pV3wMGoVYNv19bn4RCU9lzGjZVF6dN+dMoHCOZSla9m8AteHHCSI8qXFzihVsTyKpN
         HE1fgB03LJD+kdkl54ZLaaT01WaJDYn4zCrxOC7LZu/ZkrtPCuHT5xHBjWU7Hdeo652I
         5I6g==
X-Forwarded-Encrypted: i=1; AKwUvBz1/8m2YjKUVPVZYydDxeBgx6z7fWp3UzpxNf8B4YtUxIuKLw5fgUGJtYWOcp583ddSGBTAcUQ7N/c/6+gU@vger.kernel.org
X-Gm-Message-State: AFq9FYKEfFM4YW3pdQ1BpkgxTXW3YtwEAkTcSlg2jUrgUZ5+c4q3e1Yw
	MFu7VMG/razjnhP7BHJKSC16Pzn2OFWpt0K5mxxGDcfJ3MpIlL6IWllo06Py0DeML+ZTbcW3OYc
	BOSjkSXQQcKKmYqJgg7PkEWf+tTfP/5rh0h0yS7iJH9NuCU+JyGiJ85tElvtXUPOeUuqspisvIu
	bK
X-Gm-Gg: AYBFou2cabJN2TkaXOj6pY0ESf7Af81FVejDsH2nVmY8npjVbz1J4l8iRaGu0jmJZn/
	fUQ0AdUYYADpT/QqcsLebc87Bp45d+tGI50xa+ATqM4UuQrw8ntaiPzpARFiFRyVukc9t00o9m4
	ZDpR7Auxc/a+aIZhk7wEXimtQmQNZX2KLukRiv6XFKav0PtkYpZkk8vmABPNVzsxaagyFbav879
	1p/gT9co6ZiLL8AG+sV4HXNWwgKClMJ6Flm/cT01XqgCA/bxVKG556mmsCxn6/isZni/O+yAR36
	PWHL6l9/GrsDX4t0nRUyTsC8JDkK9IbYjr7JpV7qayjdYdf/OM5lqx9wW1QNeQpjSDXWS8uWV7n
	mcoBrzSOWW6tj7iV6Rvw770wU7p0M73J1LfbLGKwhb8UTVCpqhEaYfeAFVLc=
X-Received: by 2002:a05:701b:2806:b0:169:3706:d61b with SMTP id a92af1059eb24-16a5dbfddfdmr23595135c88.16.1792031902699;
        Wed, 14 Oct 2026 19:38:22 -0700 (PDT)
X-Received: by 2002:a05:701b:2806:b0:169:3706:d61b with SMTP id a92af1059eb24-16a5dbfddfdmr23595098c88.16.1792031902051;
        Wed, 14 Oct 2026 19:38:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm51217017c88.15.2026.10.14.19.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:38:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 6/7] dt-bindings: arm: qcom: add SA8255p Ride board
Date: Thu, 15 Oct 2026 10:37:10 +0800
Message-ID: <20261015023711.721837-7-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: gm75V-gM8j3ZrEBAL1q1Z3RKvdjmmvT3
X-Proofpoint-GUID: gm75V-gM8j3ZrEBAL1q1Z3RKvdjmmvT3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX9w1yrUfMLHM9
 dC8A9WiAOOuD2YkC0MzR2q1w+6Msj7LMivjL6HUoiQwnI4FFO/eX+VjbRrSrq/K0OXPC+bdwHAT
 igEX3HAVbNMw00lgS9SCFAFFUci/Mkg=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6ad03c9f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uytbUiI1na4GE1GmpowA:9
 a=bBxd6f-gb0O0v-kibOvt:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX3wt2OpEI37R3
 3jnFe4JNhNaO9Y/M4/ANDsF9RYG9an+mSvIc0y3lR2X6kJeRKV2yKxbc9BLW//T43DFwgyzKgQ0
 94BymtqPxHTzwN6dSRcdfl1QahO7oD9HDTV24nsO1t7PzEaRxOnBfXXAuz5kS6rHzgDCY5iwYqr
 oA3JQss4aIM0Z+Z9kSsgoMK7Lv3GE1ixGYpZMqQErCFUclnb5bDWap89j2hQUn0bOjBeTnB8H/U
 mhOGi3ycGmoNlLK22H1ZVI6gd/AkfLDhxXwlSgwSNFCuW67XYCboFCJnOWOh5qXqizZe8cLmEWR
 cVwWUuJGIXkgsc7ogPwaekpoyTgNwJLffbwtqvmBnujDvvX8ySvH4UTr6j2UfgPubFvSTKmo88M
 cPoC0PPc0f0qQrZJpYeYOIeCar45o5dJYndesscTtn7moh05oHHNMtRjXJLrfZhH8bmoT95nmdG
 GXpXbxar20isay76SGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150010

From: Nikunj Kela <quic_nkela@quicinc.com>

Document the SA8255p SoC and its reference board: sa8255p-ride.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..415567b085db 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -490,6 +490,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - qcom,sa8255p-ride
+          - const: qcom,sa8255p
+
       - items:
           - enum:
               - qcom,sa8295p-adp
-- 
2.43.0

