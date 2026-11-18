Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007343;
	b=PdTWdsN0R0dPig+Tx80Ra0V3NUEgu7mlqUctlSQaxf3BZZXnAezQgYoLrPu7tUV8UunP
	 jWabk5SVz9hPqVCFsYjMA0aXUSPI0RTl3fGnfYj3+vuWM/t7lpEUyh6pidB4oRgwW/lrW
	 pGw1bkFCLJU2ROvGOC43vIEk7QNi4KSKuk+vtIdx0e21RQcDJxpXu7Jy29qVXkkPj6MNg
	 ea1jPbG6oaYS743Pel7xUTfOtfsOo1fU4o92N6oUAYZyi1RfpghYVKTA3cjpfija4OTm2
	 xWHRXXlydcvuGuuUKpoBoex73C0A/4Zw/xaeTMSJBVdAIL/OwwQl/+mUoHINjbbumYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2uypBfXz8UgmtHwzBAp3Qn7tdU0dST+3c5sXLO043nI=;
	b=uwDLnVzlH+uf66GQY2KR8odkNJ130Cs8BdlxDbykdC+e8NqepqAHR3CLPMIlXMWJ7Ldd
	 SzAeaoRLZ6v7nMyHC/FTiF2LnmCFfTMhPHeoQRVPlQZAtXkH8wuWfBVEmjGCQSFYgxHg4
	 IzaHGmE5eJIKhgLFJW8flrYRwowgZ9BX2Y1J4ImZReYMDdnrz3X0FHgpClhAn/XJA7ep/
	 3WR/Woap/jhWQCO16WlQ0zL4AiMo53L7B7m1xePtcpAG8788wvjDmt5KQpbkbBio6Dyya
	 1VV1jdAjkSfuYKY2TFn0wpO6gfSpZUjCo8+ocGxCvEDvktxuDJUBViiaHuTiPe7Xzmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T4VOQp4a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbadZuB2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46E8606A330
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A46E8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T4VOQp4a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MbadZuB2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLRJe1178432
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uypBfXz8UgmtHwzBAp3Qn7tdU0dST+3c5sXLO043nI=; b=T4VOQp4auuCF9d9K
	dBHRh2NPdzXmVqAAFD0hc2u62KM5OEl7D568svnolivrwWvMGWT4YAkLqRQKL3ys
	2ONpsT87RsvGWKuaMSSxGuCSVvyySbpvhFVJZQaw+M15oSC7M1jdg7/rdGLkVhdB
	r6ZwcAEKkdDARSpjU3xymD6vzpyeFcfjGJsWs6PVDfKkstEXieTD3yo22KeDKEpq
	B3Hjd0fdDwKy01K5vd1/AXNlfevRivlMG+/7stxrYdNKoxf1KP7i7HwXzy3wWPE2
	8Rg2caG//hOPQPoAxKTiGpawn5X8toF3PfsOVk8urDTKSgKZERlh0UNI39aM6fOO
	2wFb1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvck3sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 13:09:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b141294006so198041a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 05:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007340; x=1795612140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uypBfXz8UgmtHwzBAp3Qn7tdU0dST+3c5sXLO043nI=;
        b=MbadZuB2rbSPtpaXPkSrm23cfxBXsuXw4g62LQOhYrYaOP54avt6g4xW9wvu7id2kI
         X7erCe5D17fb1vB5WjHUGF7ftlcPK6oVaaMuiGw7+4xRsb3bcPln6yIM4LwYTh/+qhdA
         C70R96oAzFNWKGfmqufcEfgGj27s7AvBHUCBMIZigVp1tD/0pxg4GdDp1YaXk0aGW5Bo
         yS3j/2xpttv2YBIL6Dt89Old8P4FPOzh+C1RIhZZUDizYl8Urj08Y6o61zdyGc+oB7uo
         vAS0hVOdflfzmDY/CY45M2tnWJJqoFa3R4Qc95xNCwTsDKUrbpYHwT0rqmvtoi0cFLNh
         ujZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007340; x=1795612140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2uypBfXz8UgmtHwzBAp3Qn7tdU0dST+3c5sXLO043nI=;
        b=iRJ2KcKaE5HHD/33z903ShhEqqfQ3mlTndPdCJK29bRZRFExMp6BTohEIcQtJTNUmD
         MFVp5FYwkkO4Mfx3ltBEh5vLGck/Gg3BzFyRsB6hsprmu8esjpm3F9EcUBujg86vGcC1
         Tja4XbMr2h/a9S1ICfyhdRICdiTiAOAtTsaRhSxxPoBSmfmXYimqBixyfqky0h2jQe35
         kEZWGqIJIDaGC1UT10yYPnTNTJMakqCBcR6LlAyyiviPXWbzhhCWJsYlHKubMdUP1r+n
         Aw0HQa3kPRISn3tWYW944rGHp8X8rN2opqVtqZ57OVhfbCcgLox3LX5LCnBXiq4KdFUb
         owEg==
X-Gm-Message-State: APuU4Z/t3uuHA79LAxhZC7dQMaOAMSUlYXo+IIrkU4HblqCb5KVjh18I
	Lv6q0u2f0FJ1wgGRCIT/GT1FOl7735b/aw5SdgHEx0UiXcByChTqKSFA5Zast6pu429o8lTgDzD
	qznYjgAopj+aM/xtc5/mxi6ckFjNnRD1K38ekxmb1K4QSdXUG4dy3V/JQ+mw/DVvoOCOS
X-Gm-Gg: AZFdTZe3VYaFycAIgrREEYNyJgoQAgQbgcKvP8DWeiu4p0+qaZzseq5b/83ZfMZgJvq
	8d3Onq4rWjBDPu/6AfoQ4E4HkPiZP2qoNOeXIayUVGkQWIVYeSapx4dLTSYQ0SJcxd2jT3MvF70
	m+8GJ8IIpmicmU4OtUoOygubpH/L4VB1zwIji1upNfaeS6/c5ATMi+s8jN15nuJFOcCA8yk04+S
	nkVfiBPqt13FaQ0x22dOJ+3l13rskLlxvwfkohT54CC7nlOJvmyxG/kM/iwL5bIWy/Td7D35/FC
	9tf0Zvhdgx/VNNxK3LijyAx188vR33hzSE8HUU3Raxji+T6d2QiC2MlYUZhsI3ryqgxw1zGTCVF
	ypkW25fUZJX/nEAdeeeM0h7JjbCI7T4Ay7JjsWwULsQCY7CkEsJn2wOSiItDEDd2if3rnj21eKD
	ZgOo8P6n+O
X-Received: by 2002:a17:90b:4acc:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3b3d07cf0e1mr4603045a91.4.1795007339474;
        Wed, 18 Nov 2026 05:08:59 -0800 (PST)
X-Received: by 2002:a17:90b:4acc:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3b3d07cf0e1mr4602998a91.4.1795007338997;
        Wed, 18 Nov 2026 05:08:58 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:08:58 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:38:27 +0530
Subject: [PATCH 3/6] dt-bindings: display/msm: gpu: Document the CX SMMU
 aperture region
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
Message-Id: <20261118-adreno-scm-fallback-v1-3-e99cdbf3121d@oss.qualcomm.com>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=1153;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=syT63WlPX5IX60Og46wRhxhDoNsMAf3uqJqj378LbFs=;
 b=AwXTBw49z4p7aFFLjQBcN1LRUTfdmns5P5yqUq3KJultc0/Mn8btNjKyQknvqqXpLMd/RFbYB
 QRYATkxT2w2CoLGoDSZtDBtxz0JBVYCOFRfjbzMfF/Oal9q7m7cP4tu
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afda36d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kkdt65S5UFh8r35K3toA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: FZjczKzRIQ0vd-iFWw-nCgrd2SVK2JTS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX4buYeJDxB5ed
 FhTvbSrgcQAAWZVUuEMi+kdbTZAPLY98E1A5PBPxafPsWRzwTXEcGfnhYY/2pk/m6GzsXTHK8Kd
 zGkVBewJTuaHQ+oLvDjAZBn8f/9muNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX9fwVUfjxAbOf
 jbg3JNyJbnauQPE1QPCJdibamnMWg/8mJhgHmSRIJQuaUluiCCN8j/6Khbo9nddRs1Mwty2K/om
 pQVJKgGIoxT2Hc9wFwWpeEeiMrHyecRk5hPyBi1ZXQvbLSxPNMlw98G0+je+JTLu+gC5dj5fCKT
 94RfpOJtftEcUPu0DurwT93hzw836bwE8mbIKAmysQtQa6e06hRd5ZY2+lohLegKi9FYMzRsWHE
 u5Yg/TsbM0eJpGjZfCtB61q2VyW+E6CIi6EhCts4BG1Yl5UAM34mJOHDxbjyf9ju+pENvheGTRM
 fjCeKKb8TjjM+GdJOHUhEtAwyYDO0v31PdG6jELY0cHulRbk+lsTNRoFMn5o3lRB51M8R/x+eH6
 ZyxBAwoSoWibWSWwlmSwBoFTXWGJFB5E5Zvhb0jFHRSdNitql2uhi0DDMn0Cem9ss3AVZIKoEIH
 1Kqn/u143dG3kFEhCIg==
X-Proofpoint-ORIG-GUID: FZjczKzRIQ0vd-iFWw-nCgrd2SVK2JTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

The CX SMMU aperture is a register block in the GPU. It holds the
location of the GPU SMMU context banks that the CP uses for pagetable
switching.

On some GPUs the block lies outside the existing GPU register regions.
Add it as an optional aperture region, so the driver can program it on
platforms where the secure world does not.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 3c90a09febe7..5e4f3149839e 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -54,7 +54,7 @@ properties:
 
   reg:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   reg-names:
     minItems: 1
@@ -62,6 +62,7 @@ properties:
       - const: kgsl_3d0_reg_memory
       - const: cx_mem
       - const: cx_dbgc
+      - const: aperture
 
   interrupts:
     maxItems: 1

-- 
2.34.1

