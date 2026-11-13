Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580381;
	b=tk8Rn/JIiujCPRP2SSImlJtpopxo8JQDGJD64LHNNYMAKN6UX6gQZ5qnc3gnoeW4IxWp
	 NSXkpUPQexUcYCwn02nZ+A3pxV/qe7SAzjOWxdTa7CbpsIq5Vf6GunPBCVUtWMyjVN7nD
	 TsNHtGO4RC3UWD5111sAViH5mI7Owy6WSSug9KtLcSB1ZxpM4pSTeLbCpja0BjVwaJbXH
	 GwqXdEFNL+oJygelE7Gj9YKBQQntaqsv/eKhbhdR64ZF7dLGNPLeWvgRg9OQMBv+72MRB
	 VTROEzVXQgEEqSMxHy1w6RwXxTQz+vRfVBayi7bJg8/HeZudNlQHCS5Ps5AHbSDRWBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580381;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=;
	b=mtLNtA6BkgBL5/l4aNkffAPay4SKMPx1t81yzC6tbxFuMCJaX4+37KsFUQKdatq39egZ
	 BGaX6pSAyQSuYPIxS11XAXbb7ekDc7I8z/fyXSLfYuosOxmsvMzb3O+pYZSW8PUeFvWEQ
	 p6qqaOiXeidd8p7kAabgYgwocvOeEP7B2QRnhsf3o4fvucni2V6fotekYPg4tdlbqlK4A
	 tZZ8RGB7Y+eh2kumQY/Avlxavn+Sn8CoeOYV3+4KnyLdpp1MeecnOOMGSLQs/I9oZKERt
	 azIA5WaG+VrlWpBp2rr84qx23zHodK+D8vE4i4mmY2UJLkE4VTrmJ/ouQIrdsd+8XSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6LcTAxS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCzP9o40;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D13606A8AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68D13606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6LcTAxS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCzP9o40
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJTbS033800
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=; b=p6LcTAxSLBPS48Cd
	MH3YQQ1EsSIZjcS2uPf7SdzFAu4A5RxpP2eMpW56ge6qo6vfDIhLmF03xEqv31x6
	14lWdjH88HiDAd+UUR7HtMHeZrIr5xhHfLgjQxdGkgpeet7X3nEXLBGs/eEk6B2N
	nHfIl7NAPKN5KaLX0hjwYCrk8GVDTRVm3kHR2uOSggAyeAfS7LTeOnpBU4IXdfwG
	PHgL1oAU0eYSVC5QVyfNbPu5gHxZMn98EspesPMD8O9VhgWB+ZP8egsyOGZAsGHI
	DYIfHf6xqfteN/8zXKBcO1y3p0vw2otSOKiYwwPSID0PzVzEwpRpBJjl171soltE
	rGNbow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja9sy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:33:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so212618185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 06:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580380; x=1795185180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=;
        b=JCzP9o40ucS9Xd8yC6Pj0Sg4E6M9RNEza9icZkrlgBQbf5pETQvpsPhnqoSZNvdgOL
         cC5PJAxpWKt/X4EJbNipl2YqsEGwEFqq8IjZEm31PHJTwD/kr5IdOxF4g5FZhYPhpan5
         WP3dmJtGDk187w3/ITY3DcbJaicK5SJRFvseQ3oGq/Fllu4Yp1jGluXhYpI3YqtB7ud/
         kSAPZCeGHuS5ivpVo7WEqnxwQC6TfdDFr6XoV/qeqjXufgx0duAfH/Md0+zSLlMVn4+c
         PBOERuDvZwd7LgkV7BNUMaM5vyehSayp0UPk5cZkUn2X5u6J+GQbiNAOjC231XdTO9yV
         rbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580380; x=1795185180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=;
        b=YmaTI35PN+8rcsTQ+pBT3Dv6YQEbx+/FF+4SwDrq1luh9WIvB9aK4i8nCITkSQ5DSb
         CV68qgIw53Ju0WiirNz2n8DTg4hGKyJ5TiUXnipdWFxvqRbcWbmxYeAnsiiX3Hzvizy0
         Lgkb7/azWEP/vKR/yrrDD6W9qFrB45rUtwM6d4f4sZl6Tmg82FlL4mGDnIIozKdtSp6o
         CzbyZAcyuQdKF72Oj5WjiyhRj++a4df2seu9BS+0m9vMpFmtggT9qgjYxGp7mGBs9Et/
         DxyHGYfAPVUT0cGxLSUMGC8J9tnTO++gjjFSDO0CttN+tV/wBrlKyMoM47ZwywfIGood
         rjnA==
X-Gm-Message-State: APuU4Z/xZ+fOVcX31Fz6Ch/EuqULR5Epgd93YDSC7ZI4BCRIiuv8m7yX
	pLEVoOsoaSrdbTfqlmjCVj+hzk6rrYqN8Ftqjr3U8A7DYXgpeUBRyWUEtjNP+R6PrvRabBiHnWE
	y9gdlGE7HUE9EC/AaPe383qkFYpp5LbhQqSx685HSqLUH4d1lOXEiK+M0GJlHmHJB2cic
X-Gm-Gg: AYBFou1oPQKlEtI8cPOvc4Mzx78lAKR7cx7R70CllxtRFyS8JuUP0TL+zY+BmLO3pVs
	tCF14qSwHMkk3nxKx+ya4ni5S8E5xMZrRh+dXru3RHn1ZcMY852maaHaOElWIbID+4M5mfJ6ImU
	dyMWRk9AApryvWj846WzvFjK9zDLZdJlOVsYb1eTF97vmbG14cToZFLEkQ12X1ZK8arW00vPn0f
	UlUS3bi+n2BpKaILQju2bYyA8YN/EvNIzsCHZnRUYKvZGOIWGPSuAzcrDv7Zlhnj8pZOTjilPQ+
	ss9BOFRLNPvYJhmMnYeJr8tMfxWKIFKFnpxl7QV5OnQhFGWRRnONwz9Cbgr1u0j5UrZlYypwxF+
	ag/us4fk6szuP2SFkVyk7a7M+u+Vr1bUSn2QgCt7E0RaFukYzGkNPf6ijSpLBpiA=
X-Received: by 2002:a05:620a:a719:b0:949:5cb8:6bd8 with SMTP id af79cd13be357-9495cb86f22mr83103485a.22.1794580379668;
        Fri, 13 Nov 2026 06:32:59 -0800 (PST)
X-Received: by 2002:a05:620a:a719:b0:949:5cb8:6bd8 with SMTP id af79cd13be357-9495cb86f22mr83099085a.22.1794580379090;
        Fri, 13 Nov 2026 06:32:59 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm71948685a.6.2026.11.13.06.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:32:58 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 20:02:21 +0530
Subject: [PATCH v5 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-shikra-el2-v5-2-8aca743de97f@oss.qualcomm.com>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
In-Reply-To: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794580360; l=1410;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=AP6m7K9bcNvLKnjx7yin31NugzckAmQBmT7FmQR5FW8=;
 b=3grAOrtRV282qWHFnvr0tb1SE6cYWndVBqaZAYbo7EGP8AmopSFDhWgbOvmACGOGHjHaUAlCp
 RCF5uyMrJ05BQEUzi2/HAtn57bemSJCmsfbesJuzu59nAB5M2jy6YwJ
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: PY6Jzqo_wGmR3nQj0YX_fb6GxhFINccs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX6n5P6svpj6JS
 Bx7Y4dNC192w7dW6WvL2d9CRjzApxRxTI64IWPAhUI/k/UdV4ZTJrXi+MNVy+z7NE6KtytKoIO3
 0R3UJETA5pfm9JxNMGFEfp9lphs/t08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfXx64rMtK98Hms
 E2QezqnyOgeJV7G7nfc5iB9olReL+xf7DBPowzhogWlIurum8/3nNngxoh32chR8/6UIVXu5Q25
 bBtByqPjPLCXUxw5sh5N25hp5ySkvEIDZN604eWP5pkrD77s+v5p/0BdBUaQ7B7/TUwvMMUvihM
 oMzbkg06iuFXcyj9SPj3LSX/4iNDQspih1YKm9IPwXswZMIvtMnX6AKEf0kDQ8BDSRSmOYwvGah
 p/nA0PBvMWfZKpMCp30OcxuPK1ITsCeeNXO5gc+CJehkwWk1lL6oakJkoi93I/9qKOcvHqM/ZaC
 O0CIGyBxoGuKY3oCO0g9a/c8KenESvmB0YzfyHPANyjU0UT1SVGqTGVS/kWkqOaGTHZS/Osa+AU
 fl5yySZfMiWXAc1/tly0FGldUpvUvGOqdbHF/njgM4tCCTSh+Wo++vAnVdftS5TdxHP+Y46N/5g
 GL5pB0E5849hQ4o/3lg==
X-Proofpoint-ORIG-GUID: PY6Jzqo_wGmR3nQj0YX_fb6GxhFINccs
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af71f9c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Q89ptBQ9mced--_tLTIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130057

Describe the iommus streams of the Shikra PAS remoteprocs, needed when
Linux boots at EL2 without the hypervisor: CDSP uses a single stream,
while LPAICP firmware uses three.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 34a2f15e9361..1688d198cc5a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -119,6 +119,17 @@ allOf:
           items:
             - const: cx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+          description: Firmware Stream
+
   - if:
       properties:
         compatible:
@@ -134,6 +145,11 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          items:
+            - description: Firmware Stream
+            - description: Firmware MMIO Stream
+            - description: QUP Stream
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

