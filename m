Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968441;
	b=K3y9XiqFHCRqNlVwMzIK8DnUmw+Du8AMQyxDN3odJelv0bryUKRBZ3LEd/CNMSF1Xob2
	 GJJK+SGGcsr3huJCy49+xyyRrgfbHGeaukA1v85BPRgOkoYpYJE61LkquIQ9eTPMnkgw5
	 Eaz6WdNlc6LQ0+WvLHzFj6QhlBhDoBS1njyWGQUX4ibOnkdindzUwTxCz2x4BaMpeNILf
	 0/mNpaVI0fW0bywD25oqyxsUhFhHe1a8tnGliIWgGYs5/vyRYSEF+fGkxBiZfRhxFG4Gj
	 guDFlkD+tkfpxfPPYuqxJweWu0lHukrj7tWdNPv9UvcIedWYuddXZYj7Hmq46+7P04Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b8/wG016jJ9Eq1RFqzyQ0HwZKYr7zVebHv/8DUlyzm4=;
	b=JaCQuR8WXI58jM7oWuLrc9HLmKmB4PahcZZtYCs14KFeHnPtPaG2l8NmzNyc1MWGLHoV
	 tp1tEIbVc6HkoGuPt3fi7/8uAFgDBxYneqUuuV+pXFxVSDIw0+I0ompOP10bTCZwfyFWW
	 zHJhi6i2SROvkVcoTSNfSJsa6cCyui162fSLR9iZDQ/Im7lKkVnCxUO3e6+gHSLl+Sq2P
	 WV2yyPTYaCw12xqBP8jCnaJQcdjoNJwJGEQvsA/wZ/eLva+a8QNbPUcLYM2NBp9YW7Rr+
	 GWNCMPMGsEY1Jwao2a4Zu6UXJFEmP0uzT2aeS+lERiFmlIzge+o+ilP8AJ7nJ0Qyl5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="F/uvNSlt";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVbOubl2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63963606D81D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 12:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63963606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F/uvNSlt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVbOubl2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6AP9Zx3335667
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 12:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b8/wG016jJ9Eq1RFqzyQ0HwZKYr7zVebHv/8DUlyzm4=; b=F/uvNSlt9/dBOr5A
	3cz/TzfsVFE8e2RbHUMXru73ge8Db6XPDAqxN1c3YxCuLibiYgc5rec+6DkovUIM
	01/rTsUtgUKyKUmZadeHu/FSOluRWceCRg6wIilE2iae5yywyuvba8MaD0Ec9MC+
	Li9ry5zRvpObgWQQMUK0AVMIun+rnRkxKLsz4iNweE7XOV+NZbqHda2CLvFMK8qz
	RSgrgR/C9tThidEmARYCeIuxdb/mlAW50XNtTvilsD4MpyW/xqG67W/Fzh5x5Paw
	1qBb4qmQlwUE2l37MxvqixvIZ2QxucwLdbUicaNifZfj14JT+at1TOFK3VZRxkSK
	qA3+5A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa2sph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 12:33:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36fa5673fccso194352eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 04:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968438; x=1794573238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b8/wG016jJ9Eq1RFqzyQ0HwZKYr7zVebHv/8DUlyzm4=;
        b=YVbOubl2uNQ3V78fdFWJ5ITg+itriRGCDvX75ldpu3crY0A1qMiwXCd/i8/Cfgq5ZO
         aGu0Nstj1V7ZfmPkuJ7nwhhvRCefy7heewN3D2GnRZPWj/9GVbhKbAUizuY8KHRW2XxT
         gvWNx86SkDctqEmL4ahYzZXpHWGPtnUUvghGHaYuM8USd9gCeI229mxePpnJpEv7aBzm
         7OSjbFgkKl+jLC/kja5ZNY6cK2wLqwjOWpyHOPIqXegjlAjv5yw+pL+3QLJT/U4/2uC8
         Nuz3eA67rm4cC1YW84YHkJWoEMzpBKK/rghJ7lQbMD7XJWgFW7qQy2ED3bRLWaTnoFIO
         niEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968438; x=1794573238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8/wG016jJ9Eq1RFqzyQ0HwZKYr7zVebHv/8DUlyzm4=;
        b=DoLXthzuhXYEzFNVWuHfJ5FtxxOydFVEER0bCKZuLGpoWlW5mCDp2cJN3jia6oM9uX
         VuH5+slTb6IQbUKzFfxJtDLuNyva7z2xvrqI1Z43XOiamDgQMTf6oMcpiorC+C5AhE3u
         cZRhn/Fm3EDdFyLkpt8mRQlsAla0VeZ4vrKmeBbQ7Z/HZIyldhnQkdpKjAHnuflpmUy3
         SCRVipQMlmX2uMvcwshoorF59i0/z0DN8eU42yPEJkdOom2oTPEiEpC+4ikqViX8YMpm
         swB675dExZBDi+15DuPjSOzl1hDWfITm4RQBZbYXB2Tl9UuHu9xUPshX8FvRTSoM9APm
         MVmg==
X-Forwarded-Encrypted: i=1; AL+hErHT6qAVtZFzm164EMT2WGs6hDmcrAF8FZkaY7WjLJ4t3vG7w/aHOzl3WsDf3wkHWtj/1J4cZcQy1YPRkcMg@vger.kernel.org
X-Gm-Message-State: APuU4Z9LmPGsGboGkRN3g6YMcBQ58QUkuMyNC8pcCDJhavlXecAWi3c+
	PmU6nZDQGiAOQbX1I5/yTaNEF4ETJKWhX9+GGLvXUGT6KBmGk4RktQ1n0sW7EzIUUh+2aB9GmRB
	VV7o8x+f+WVrdo4S0f8y+6IScidn9Q/WUEYx6yeqG+JFb2LxH7u9sEIRlMcFcZJEG27/L8go32u
	qW
X-Gm-Gg: AYBFou1M9Y/K70S89LlF33P3XYLqu+aFvzfoC1mk5peZtd5WQbBVcZ8Is2UuDLnsbMF
	PtpOCU2sPkO7f+aRBff2eA3fBsL6zggTEuZNxm3kDb5CSjbNSI5gsAO5x5i6wN3f2qZARQPMGe2
	mwKN5eBrxMRYr/ab+CosMsPYPFCyjOOrnOWAwi/sgRe62gBYAW+U3xPE09vNO+iVfKIwCazVhDL
	ZBxX1/4Klo2Lk66e8uiTIPBZcSxaPgaVqOIfMzIGUy4vqa5LwKnMOXY2qnnzxsrBdrguQH8b6kv
	ZeIpmaaulzIM4C2b98TD9WYLPUyKJKNzRGtBvHOvcPx8lkVQAZtjyp1zTYV3I9IjcsFCEI3s2hN
	rokpP/nPv/NAKIuHHY97ueZR5JSK0wyMr7dGsLZg07r9QL+iA1DhK4SckxtQCJ55LkDFkXqXj74
	yNEVCkpQAb
X-Received: by 2002:a05:7301:1529:b0:36c:991e:c9b with SMTP id 5a478bee46e88-36f76620085mr3094623eec.14.1793968438186;
        Fri, 06 Nov 2026 04:33:58 -0800 (PST)
X-Received: by 2002:a05:7301:1529:b0:36c:991e:c9b with SMTP id 5a478bee46e88-36f76620085mr3094598eec.14.1793968437646;
        Fri, 06 Nov 2026 04:33:57 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:56 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:06 +0530
Subject: [PATCH v6 v6 7/9] ASoC: dt-bindings: qcom: Add Maili LPASS macro
 codecs
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
Message-Id: <20261106-add_shikra_support-v6-7-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=2791;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=TD15J7JJZLQwUWZTq6RSvrSNe3KUE+qF0nOlV5cHnaY=;
 b=feowpxtIAXKy/zE+o9PcPOWw/L6Bhqv0TIEDc+7RQd3eLtYNiUfqVkKMouIsoPt2D6H5ntvkH
 TdVt3p3VVp2AU4FDyfbNiJ8gq0Hg0F9IJgrfh7jZaWk0VztxriC/LdZ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: M3_VgN2MuZIlFpyzGWDBE9tNXY9L60EL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX4QU7nbpZ+dX/
 Gr7O3z0EYfK6mo4HJtPiSanwDNltTJBWqvUBCnvZUi55Mmdz/Yt2Nylo7YAs3hxARBoNuQx58Ox
 BYZpN6f4hdPsNb91QPJObmz561HkbHZR/aU4JtnLPgDrwrjHmUOVZzRYSqGcFpPHWsdPjBv1uU+
 hO6I62DmB+rOiyxdn+A+BBIdCY64JaRjUNiI/eaCnK7/UFULHKaHsqxievlUPf9OI9wfU5FU8FE
 zeZX5VXbV6dYTJgC+s8dagdtdC68Dw4FCCV16Vs9+S2BSYZcGmifFgGKou+QjsDjvoAc9L5S8y/
 O35ZPOPG6yBunID3x/E/A17dFlDI69fLvpVJg+hUs6yYA4rnKdM0U2665IJ05j2amxE1gFKxayw
 8wZwkuXLyJhOzcRiXhkM7OnjK4NxHPf4uo4E8yEavlP+5j8QzQ5u4GXW6xwKUPYSbB7tptyuGd1
 z+LpZ51rPUDukL0Njdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX2sLg9zQX1x+g
 FpvCT4qaJzOue+I/iG9VS+f9sEs8lflSRTsIZsA5OPTjZJUba8xrKjXU91Ad+lUKHCYd2PkBDAU
 ykwIX2sIG7WppKtSp1Z7petmn8M+bPE=
X-Proofpoint-ORIG-GUID: M3_VgN2MuZIlFpyzGWDBE9tNXY9L60EL
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aedc937 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WGZyT7xzyh4_t1xe9HgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add compatibles for the RX, TX and VA macro codecs found in the Low
Power Audio SubSystem (LPASS) of the Qualcomm Maili SoC.

The Maili RX, TX and VA macros are identical to their Hawi counterparts,
so document them with the corresponding Hawi compatible as fallback.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 20fe0dcb65d5..decaaaad3986 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -21,6 +21,10 @@ properties:
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
           - qcom,sc8280xp-lpass-rx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-rx-macro
+          - const: qcom,hawi-lpass-rx-macro
       - items:
           - enum:
               - qcom,eliza-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 2df72450d36f..a6e9b3cdefa2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -20,6 +20,10 @@ properties:
           - qcom,sm8450-lpass-tx-macro
           - qcom,sm8550-lpass-tx-macro
           - qcom,sc8280xp-lpass-tx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-tx-macro
+          - const: qcom,hawi-lpass-tx-macro
       - items:
           - enum:
               - qcom,eliza-lpass-tx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 7d56f9c36056..7a840b08f8fb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -21,6 +21,10 @@ properties:
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-va-macro
+          - const: qcom,hawi-lpass-va-macro
       - items:
           - enum:
               - qcom,eliza-lpass-va-macro

-- 
2.34.1

