Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB2B51616E
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061740; cv=none; b=QalqLr+Fke5McmAABww0Eh18Zkib68IIpEvXKvMQGYDDLQo7F/kvKyTqUuGyVgqHgmFJp9ImaoyGo6fB5I/7uNNHYaoSsQUrdSHaMzobfGkQTXpIUS+JD0qIhsea5ikLHFHKEQxDtIpPt7+mbX0qfcKwdzfuPhbXWcBe2bJKMHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061740; c=relaxed/simple;
	bh=Zuj0Mp5Z80P5Xe4Uv2Evzpt8jsUT1HsihC1ZLba1Ap8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pbF073owlMMULqvq8EdO7MydU7VfPYC8cx3uSgSSLT3aarRHKQMkfcMkvlw8BwLlNJ/Jf3ZWq1d/3kwnCHzk8Hzi/Papezmz1iL4DUQLAn0xrFvmA2b2EPfmOA++wsSN2Wrggcu3KLlTB6Zog4km2jbM8CkIvoE7EQ0Lt7HiH2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0C7Z0My; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EV1X+YdO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0C7Z0My";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EV1X+YdO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOqO2114145
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JwyFlz/ChE0rMDIH1WU3Ms
	Q60a3WnORnoupBPMHI0Hk=; b=Z0C7Z0MyMyX8Q0oAR65iBflkULmBYpO2HVpLaR
	xHr/BSFLuyvIRn7UyyWhaT9JQsY6f33yD0dAmZoDuX4qwLbmMzuyGzer7ESxy3aq
	JSp2KcaV9oKBj5D4huMN4rpTZwJd/5PLqwtbUdM/ZY2psPotWktMtuhxNpB4hP6a
	/nvh9v998GfJxE9vE/2sYeaOPm53ijpSjPqEuFgmxciawzUA2u7Y+HUbQOFPzrsq
	IvQ6w7saU+nrixqTI8goanAfaa/NQmuPpCjNoQuZGq6+OVA+iwT1KsQT7uzlCppO
	fQMZVqfJpHvh99PrdY+AgxX47lkWWe0vRhDhVUXg9OhW1ogA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyanxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:55:37 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-156b5338d4bso1861400c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061736; x=1792666536; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JwyFlz/ChE0rMDIH1WU3MsQ60a3WnORnoupBPMHI0Hk=;
        b=EV1X+YdOyEBKlW8+jt/4mYX7dTJ/bXgxPBSpd8ISfydHMHsApphGcvG3WIbYGW/q1L
         8VpgnVKkL9rIqKkT5YRsZwupLkxaNSXxQ3XxKC52cFx/UN2MsHY//nvRiJ0SrykZxJTD
         whACqkiGgZycASyTYjGpwI8/AHOLSSW6/d3c+xp0ePpkzAHaQ6r8NVZCARP4EfgLGqDG
         ckcnTLbaqhZVodvgmJDOhjZIiLpJLU81jtp0YPnfVmU5hlEqCS3WobEL/9DqoFGyg1Jp
         PjIcZBOCGljBRJP2UnA1lNjhfWyrM3HlcBsWcbEghnMHOGq8bUX7uW0HFkVuXEVrmtSw
         FNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061736; x=1792666536;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JwyFlz/ChE0rMDIH1WU3MsQ60a3WnORnoupBPMHI0Hk=;
        b=aNbNN0jE84VCpD3mJGjydWjv7kAogiWusOsPoTuNGrsXQDa5/hy1RXS3nuLmf+ZAli
         gNpUQElQZ00OuulGxzUqidSIhPId3CWa68T1QFjtXAopH55XXnWueFw0DWfLKV3tGrtf
         UV8coB9BJSfnLzXhLkc2VYU4LIC44NoV/mCRCVd8G1+EVfI0qDE4s1s78I14EZ2hQq8J
         BrRx7mHAzAahApe7v2r1n6+4J/qo2q40I+11HqYTdLR4iKO+K4JElzCCVm7rxio3DCz5
         WuOszRe3y8auiG7lspSMdVhi/6ma+N0ibnhDvoDGvuyfStxAdJ9af38jHgZDl0Vz8m21
         CAMw==
X-Forwarded-Encrypted: i=1; AKwUvByYBFicCGFwnPzfxdBGMWdx4ZS0TsxBblBK8O39y+9MKeUuk7ZiXXE8mmGImQKT+JIf32nbhHd2UjhogcLR@vger.kernel.org
X-Gm-Message-State: AFq9FYLN5ZVeBrwljqk82L5qtNOkAsqUQe0QXm+yNcM0t8urQcDfRK3p
	lWe3iuK2CT2ts82TNc/wGPGeLsLbtoMIX7TL4o0RJropx2hgrAzjARrvc7raEN1J/+UlP1h6Ddp
	8X0Gn/3qTfNpJb061Vvc30jLI4wxLYGgwMt7wX9aKx8/qobEogjtPgBVwn8sP626da78H
X-Gm-Gg: AYBFou2NjKKOCrmvah4ZuXYbSJ0eJewFSG7Afp1oUQjTk//HumFf/RWI1vzgGHjYZ+w
	Wtbhl/xRo4Zhyf/HcD4n4p/PfzRflS/kuofGvcQ5Pz1fwF8mLClJ6uzRuqjbvzw7hOSyTtxuVbi
	NNFVxEHDT9dppwLDlbaU956s7DCXVgQmensv3jz9pZwYKnr4lmrhNwNMT3kGZwljSEaFMBre4jc
	YRmzPIVh57/AHFiNrCgam4a3AxJpxyCBoONvFBzAblJvgQrDgVaD+eZPY3nt/i/Ys6kyrFqsUuw
	6QWkqan9EIXkXZA3mHkxJmS3CZLAGuw+BYK5+opQbzZps9SeXgYV6pfDsrISiK325ST6cpiEiru
	aMG+MbDqYkHgo9mi8mX2yCiya7TLMYRZfRI3QWFrN/R0XPqSGYB/YNSMX6ExO0fAn3PjPuVuubM
	kdorehKehB8OJ4U2c0Hp4o9wtEBNbk
X-Received: by 2002:a05:701b:4503:10b0:158:7ea9:4a5c with SMTP id a92af1059eb24-16a60066981mr25230145c88.27.1792061736445;
        Thu, 15 Oct 2026 03:55:36 -0700 (PDT)
X-Received: by 2002:a05:701b:4503:10b0:158:7ea9:4a5c with SMTP id a92af1059eb24-16a60066981mr25230128c88.27.1792061735948;
        Thu, 15 Oct 2026 03:55:35 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm72352996eec.14.2026.10.15.03.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:55:35 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:25:28 +0530
Subject: [PATCH] dt-bindings: cpufreq: qcom-nvmem: Allow generic OPP tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-opp-v1-1-f18fb6f9bae1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB+x0GoC/y3MwQrCMBCE4VcJe3ahKUa0ryI9pHGie2gSk1QKp
 e9usB7/Yfg2KsiCQoPaKOMjRWJooU+K3MuGJ1geranv+ovutOGYEl+9MYB2t8l6as+U4WX9Kff
 x6Iz30rB6jDTZAnZxnqUOKmCt/AfPNO77Fxa+wcaGAAAA
X-Change-ID: 20261015-opp-8f55ee1c9baf
To: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: sMnsRcmqYuj12C24NsRbqgmKPtcca2Pd
X-Proofpoint-ORIG-GUID: sMnsRcmqYuj12C24NsRbqgmKPtcca2Pd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX9ehEQ1SaRHe+
 lb9SGPXeKSjX05sS+vu4GnoHjzR/592RsGRBCWgFylnvw5/pNw6s8FtD+1uMDcFzL7lQxLiiKEL
 eWZqsPMROMA6C5JpeXoYaqCMLDhhgUA=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0b129 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hxkfFdRD5dxKw9vi-7wA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX5ylrZODWjsiW
 w9MQx/OCroN88WQbnk7YHE50hF0WUIEqSvMfEDujBMsxa1lrEOVsi04Zd2EFMOTv369vB9Tfi1n
 LQV0/9o8l7ESUH/AKI99EzgmpXE5O9UPGbogfYy76NsXWxFi7VuYD04fBQfVTgu9OduGWM6MDot
 ZIMySKlMghu/Y8JfUPP0mMhnNx9jWeyRTGaqX1B98h7EAfiXQpSNETWIqKUmbD69y0Hzzsr0fd9
 y30sYNOSpRVRcO/lINvw1HACtDXxboRvJ6Kq4QoFZrgW9GwUQE5rUO9W65KfF/LMPb84/F5QdIK
 Yp37GPtVjab9kSaikhMjzWiJk977E8yQVC4Y93OyElUICCQ0H5tRIbh7N6BUWV9bOrUT6+r9Wn+
 zZVdyGK6ymRkWCrcS4z6fKuw2/NhCJMOkfzDRuDl8buH6wx6lzmIxZqJ3Kl6xcOG0thxhrr3zPa
 Xk5a26ZaiAvlvv8d1TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

The OPP table node-name pattern also matches peripheral OPP tables on
supported SoCs. However, it only handles Qualcomm CPU and level OPP
compatibles, causing unevaluatedProperties errors for generic
operating-points-v2 tables.

Reference the generic OPP binding when compatible is operating-points-v2
so these tables are validated against the appropriate schema.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index 547265b8b118..fa9330cb3223 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -60,6 +60,13 @@ patternProperties:
         then:
           $ref: /schemas/opp/opp-v2-qcom-level.yaml#
 
+      - if:
+          properties:
+            compatible:
+              const: operating-points-v2
+        then:
+          $ref: /schemas/opp/opp-v2.yaml#
+
     unevaluatedProperties: false
 
 allOf:

---
base-commit: ab8eada9868faeee95f25d81d3d6fed0d1c98b78
change-id: 20261015-opp-8f55ee1c9baf

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

