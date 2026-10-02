Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035D04052A3
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 19:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970295; cv=none; b=LTqV7FxDnm62EUz1+tF6TgVkOvX1D1kfmfXDNfnZRZD77HgO4oCI1iUUZKI4471yMxAlc28bfbAEyRXH91iva4cZeh+xOZN3tFfuEdE1+VI3KuTTTyNo7VW2iY1/r60Y5VVYiVs8dkt6pGIFPxsocrESkfH6NWn+sV/qBmxRKBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970295; c=relaxed/simple;
	bh=L7Tyy9efQHGLlCDc8jRrhwb1lQWE6N58RL1qXGIOElg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vv0TgB18Dn7p49+2uol5rX9VMNzdjRZcdhTdAFdhhFmalZc9yurIXdtslWlCiWM0uRZ7iEEU+9tGl0dDybd/zqww++CMPMf0y49RYYLo7m1Nw/BVc6ii4DDMRR0F9YTkKZBRuJvhC5AuUP4ajkn8kK2tBXnw+VQNUV1YwJGjF0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4cqpzJj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMTCcVBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4cqpzJj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMTCcVBv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692IXsNd1320293
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 19:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J32YgxFLTOq
	eInF4VnyIQBigrPxSypBHrP5/gix5Huo=; b=g4cqpzJjiD72Rok03WOV+u+AJDp
	jEeX7QPnuemuLqhSI1G4XGna1CF6cvm2alMxw41PNQb5euECcKFs8aPx1PM572cY
	+wPWFPG1/F9UFy86+feFacSgKbeTvup/pCJUoWRmz0OpkDarFB3mPRgWai/m4mn4
	+ydnA2Jy33Xv6ITRP6z5CgLplB1dYZ57UGL08kkyQHLgM4TDA0CuMQ8T60haDcb9
	0xQBxHJ6ijkygSMKHIKeA5wzRs3CvXU37u2AiXM2z273m0hsJNgxgT58Od4A1JR0
	0/TvHvtrA1WqU8rF15repSIH4rVYMoPaZ/5ggfyFYPfmItxazbuq0Rf7ifA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2j0kr77a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 19:44:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso1435402285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790970291; x=1791575091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J32YgxFLTOqeInF4VnyIQBigrPxSypBHrP5/gix5Huo=;
        b=UMTCcVBv+tTj2Iue9xS1gFMi0J5C+rZb7QtVjpgjSsjqB6Quxk2G1dFIhTDHJuu3NB
         EhN6gTKVLQxkZXd8ypbnYik3/Ld+dKj+UaXezU5b7JZQCwZi43gb7WxmbSABILeRM05q
         gYOnE37rL988BdtCdzq/mimrYy1jtOsPwxuODCjb8ZEnF0sC55UW18Uolp4l0WoyFVZd
         65nCicmqDUqB5S9OcLRz0/wN7pDBcHGXzPYhSUobjn0k9QPCsnk5wKwCcoziCNK3Orsj
         NpNfEYCmitTyuel2znl2vYR2U3JxSTLOlPzSjfk02nCd/R4AiRlXUGzUzutzk450jzXv
         RCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970291; x=1791575091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J32YgxFLTOqeInF4VnyIQBigrPxSypBHrP5/gix5Huo=;
        b=JZALQiJmG9ZJjFRnqA9OfPQrN61899zGZXa7zWNBzv9hYrDmL2I3MPJ3LUm09Vva6i
         Hc/F4ehzmlNroirQBWYoi7VenQyYrtLC4BIF3L/JhNG5MHNdZ8A3S/LVkskZGp6RFFUC
         PCNdjWFdRfHESTT44m4xUmfi+Co1lOaBwRmGsy0I3h0R78kmht+llR13c8srOj8AsGcO
         P9Zpkph2ni6Kzvml80OOOmErL8u3cACFt94kcnBmLgvt2cNp0BX5KfSY+JbJ9Nzg9O2g
         Jc+eZ0tgZHz3gWYUbhxsgAKXHw+vyZxcaPX8r73rv/jnOWk0Q7wrxvWhhTD7orNSIpBB
         u94Q==
X-Forwarded-Encrypted: i=1; AKwUvBxoKOac9BQddJbkcnyLg5RLH9pXyVASl0jHys0fbNtJBj+DYY9RGX+PhZbDAEyDpuNZOOL1Epr6adNX+ZnQ@vger.kernel.org
X-Gm-Message-State: AFuF++mMak9nd5kI8V4WFKM1qSYlX3IunEdGgP+xFuDoCo3sVPQ6m2Dk
	2b1A81hExJNoZh7h1TlP5s/cQeEY0OqDe82oAmoK96+wGDsA4BEh8Z2e9pOTO7mj//PoweikMM0
	Fij3J66UwMi7x9a88t4pWZywkAtfk3O6ECED+0uS8P9Cy4WM2MelxxScChgNmMJ3ZWGut
X-Gm-Gg: AYBFou0kTc2d8cDmsn7aCifnTY+MlvvjOaDvD25d5hlGRAp9XK+rQ/+HyKjV43/I+OH
	hTJrQnzDHiO+F812DtR54iWOreWTSOkTq2fCEXztQZ3pw9tnj3xasy0jdCKq0tS3KOeHNZEUNnd
	EvMCL2Et+i+YvYL+2tSPoh5lFTP3pwR80+/xr7plJuBifIWDuZvhnQ3IE3IOnIqOfp7L0lRFc30
	4FVrieR66to1rQ3LTN4xBMBfVz0Clz3NleBIs9TRSJDnDtoHOTGeVn3V0EmxEepp1b8Hnr/50HB
	0IFVbYzibR1z6ueOZlkic158V8bj081xosIkeYr1guKnM2xc07hyZLOevqTE4PaUpK9VKUscZsb
	RsxCsRcLtSkTg
X-Received: by 2002:a05:620a:172b:b0:93a:2e8:5afa with SMTP id af79cd13be357-93e50feb9ccmr82720385a.30.1790970290725;
        Fri, 02 Oct 2026 12:44:50 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:93a:2e8:5afa with SMTP id af79cd13be357-93e50feb9ccmr82716185a.30.1790970290257;
        Fri, 02 Oct 2026 12:44:50 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm37791495e9.2.2026.10.02.12.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:44:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 2/4] dt-bindings: clock: Add LPASSCC reset controller for Glymur
Date: Fri,  2 Oct 2026 20:44:33 +0100
Message-ID: <20261002194436.1275056-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX5FNJz4fHOCkp
 w6FjX+Jq/KAG/+QIqd2ZgqGzhw3SxXTUqXgydEqAmeJgTPLv8MIHJVPpJ3aXyZ1mQMSjOqLb03z
 VhuarGmmz74a4TmYzjdgR0Rpq79I6g0PwOI5FFZ61tqr4QDo6iWqrVuPbiMgAlnXDVJcC4LDrJ9
 DSDWYpfQVAWqto88evAgz2WqLOmxSiN/+R7W4LC+u9us+TDNyiHqE27StXtQRqwIi52nm2usWpW
 SJu2e/iRJN7pT0Wy0wwA2/llTXBi6qqgzimwS9O3i81ZmbK9Rs4WgEhCT3YOu74JT9XAn4P67Ew
 4Rj2Lyb1fTNVjDopXRLyvem6DmmhLMEkUNnoAkHyDSomOHd7lLqzcIrYCxxkNR9UgiA9vXsN0Aq
 t1vwZ6CaCe2QE5TU7IqHuWOkPsWUWCM1Wq//VNBy6ip9lGtejEXygh4eRA7Vpwx07Y15uw9B0+m
 AKyFPTPqp2Ms1QyjX/w==
X-Proofpoint-GUID: C6IPUQUPtSkHdpi75WDABqmMf0vB76n7
X-Authority-Analysis: v=2.4 cv=Z8B5j3RA c=1 sm=1 tr=0 ts=6ac009b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=uR8O5Y6ZOet9NXHzM84A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX3uL/zgszQqHY
 MkVl+knU351xaSLio0IKSa6rpOrlFtg0toLMNn+2pyUl5hqW6MbDHJxXO74msABzVDm4rXQ0IlN
 q3yDL4dLxqbKOaHOveLQ46IZaTgHASU=
X-Proofpoint-ORIG-GUID: C6IPUQUPtSkHdpi75WDABqmMf0vB76n7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020078

The LPASS (Low Power Audio Subsystem) clock controller on Glymur
provides reset support for the SoundWire TX master when LPASS is under
the control of Q6DSP.

Add the qcom,glymur-lpasscc compatible to the existing
qcom,sc8280xp-lpasscc.yaml and add the TX reset ID to the Glymur
reset-ID header.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml       | 1 +
 include/dt-bindings/clock/qcom,glymur-lpasscc.h                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index a25e043ab894..b611f1a8b42b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -22,6 +22,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-lpassaudiocc
+          - qcom,glymur-lpasscc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
index 3006b12e385e..3fc8e7313cab 100644
--- a/include/dt-bindings/clock/qcom,glymur-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -13,4 +13,7 @@
 #define LPASS_AUDIO_SWR_WSA3_CGCR			3
 #define LPASS_AUDIO_SWR_WSA4_CGCR			4
 
+/* LPASS CC CSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
 #endif
-- 
2.53.0

