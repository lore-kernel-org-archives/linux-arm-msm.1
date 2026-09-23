Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2208D48642C
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159215; cv=none; b=tOBGfysUalOxtBUv5yoPFeNOYaCvUKMAaC668QeZYsznu6fSXms6sV95bp+X9tIYGzgLbsVT+rCCxkrTHOkJ4m2LPOm0+2TwiBjB+hx7xxJUu5RtjaWDRT7OkSi7fmJVkHoxJQhvYevJ/6DgarkZlFiwWm0PgTtFwo4ZEirwQXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159215; c=relaxed/simple;
	bh=CHLjdgbBFmYAxDYgBcG23Bc5Mf99naNoUTb/q1yjs/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMs7Uu4jb3lvtPJ0z7nXua+tHw1TaBRq0LmjLhEaeby+SnVpySJ3B/mIQBF/9jOAs04tTZ8NEOuH4KZwEZ35QGyUWKUetrApZSm3ryjIq54mbVt3EhMQontGvugruuHYqkXRzeXlfL+iERhxR9QiRviOrN0uME11hJY+WFoz6/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrPgyRPU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kG75mqfT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrPgyRPU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kG75mqfT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2f5r2821228
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KRU0cZzME1FoG/j+TvL17uJYow6/6D6BMcV1RVr7hUA=; b=OrPgyRPUXd19SZjq
	yxenaCAK/rVMzwNyvviWmyFKvcG++SVPikn61GTUJGKa7KQvF0CukarT6ghNuTi2
	VkaqiMGolVAvn2bb+IGmmlkeT9Gx8X80LfZmyc80n2bihnd3aWsOJ7yB5cbSUvCD
	5gMoLwD1dyreuSrPdCNatkqnKL+yD6iJop4mfRGbaLXnjkyLQEZ16f1LVxRrm53O
	vPvCpS6nEMB22Mx+y1tZ88teXaJyuUSEVmTV2+eZH2z43d4B2pmzAl7XCclEL1ef
	IjeQBeBBv9oe/6M67Ck61X13d+10ZmBn4G6vvVdx0BBi0ehXNdfRBOxgKP1cSC9C
	E2MFLg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarahv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33baaba6371so1678724eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159201; x=1790764001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRU0cZzME1FoG/j+TvL17uJYow6/6D6BMcV1RVr7hUA=;
        b=kG75mqfT3eWg3+/1acsznH8vpfzufo0R/aHDDpg69dfOB4ox0JT6/alR5GZJSSlx71
         NgCp7qJY8mahAnVkxbcMrTzpw3sgq+QN66tLO/Hj8jBcCNuj1XDOznfP6gtNMo7/JNYb
         pC0E6R/7uHeq/QPzrDJWY7tne74hwDuh5rr6BKwvXSeNay5/UIAdNPDlDogjK5e3/LJ7
         sQlIayiIlBCNAovGkQKFE5suNgn04yadGPGu6YRDzM/uBHckj8vW/VLm+zVeDlNqnN+3
         40SYb5Ax/1FRycYP2ixLG0iGGdfnAbEAiH81muj0pcuvmMt1qqR0oMigHFvXRdtHKK13
         qVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159201; x=1790764001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRU0cZzME1FoG/j+TvL17uJYow6/6D6BMcV1RVr7hUA=;
        b=bNjqZI20rqScCs7uCUMjZVKROQtnkkAWcuV8NisBMMWJtKHTvR3zmBEml+ujrnZaIT
         CWHh2wiy+n63PDUgO9fg6Q7xsCtC/rApcqWxFSEoRKOQ5n646d3X4Mxm729eXYE++xRR
         DWNgJkub1mEZwm6SoEuH0usUdWNVhxIXIY/CyL3XaPh5Ay9vOotQ+tLFOGVAm/5UNW3p
         bJ70QzxD6yFl9fJl1axfW/9PvzEYzI56Yw1U4HCF9UwNCmVxWq+kCKUXR1RgzyQVaMVs
         YfN3VA/XRMCuZ1MJhVM3ut7HCxXqHs/6M1+kMw6nruH4odHqizX8xcaL+hLtMjgg2DV5
         Zm6g==
X-Forwarded-Encrypted: i=1; AKwUvByF+xiuDifLfNAMSM2OIsO6htMXDwnKKbtXK2qMbco++pvgw0MP4Ja/tsntIoL3Yu0E5GZ49KHQtWt/PMB/@vger.kernel.org
X-Gm-Message-State: AFuF++kVUN7bGZw64k1sgy6i0yKrEwGR4FKypjjgS51O6wDGwLnyheFB
	j4pSF5JEZx/f+YO5mOyEK0wVryvdG11uHg/OCQbhBxG7V4n4MCa+9pobUrlq98pCMIgUuc9Fas4
	G/RZwhknbvhmvb8lFVJ/7XnT9RNoyPRqOB2Ji83IuOOilmIZ47OYxk3JMz22fgAaZKPZ4F/7Y7v
	IT
X-Gm-Gg: AYBFou1KJ1wKd+Qbp29CvCPe3O3aaS1+DU0cg70NtdtEnT/NatuZMHfQaS8a3qZrZdo
	Hdjm6G49ooFhpO7cHwF86Kwa6rJ2JU3hjkXepEAI+0NKAqFAI03w4rFeKj5s200C5sfObQdaxkS
	KezPhomwbjPGxXB1LfEpc9zrAGnZ0VilnjMX5tYjDr97Q7/Fc7KQr5Jx0IKiq4yn1eOhb5BDHV5
	y5Kv/fwF2xHerYBp/FkqDnj7DzOKPVF6IQ9FQqUWKNbmIQnwUopDLKUkiI3oiQCFVP5vs/P/+Xk
	E78rhn3opwtxtcOE4AFxx6t/kVtiT7NnRecU+vUILiT0RMobkG0oUJ1JQ/e8Snrf3BMMNxnW3DB
	Yn9/qOOPJRfm20Ed1uPCZGtw=
X-Received: by 2002:a05:7022:282:20b0:137:ea7d:a5fc with SMTP id a92af1059eb24-144f9179536mr2813778c88.22.1790159200932;
        Wed, 23 Sep 2026 03:26:40 -0700 (PDT)
X-Received: by 2002:a05:7022:282:20b0:137:ea7d:a5fc with SMTP id a92af1059eb24-144f9179536mr2813727c88.22.1790159200327;
        Wed, 23 Sep 2026 03:26:40 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:39 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:44 +0530
Subject: [PATCH 04/15] drm/msm/a6xx: Factor out RPMh arc-vote helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-4-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=6066;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=CHLjdgbBFmYAxDYgBcG23Bc5Mf99naNoUTb/q1yjs/w=;
 b=+Rp6S1IwhTCXU93ZAg8mgdTbPXp45wPbraxUZ/P1QOMC8I8WlimNA/tiubX2aEmtEVVidHQtk
 H++MFfIe+ZWBNB5U6dNCkDINdR2pBBg6Z0oonZgj5HTa+BTdrZZvthV
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfXwDiVcqXrN+Pu
 tC41gvLkFjyh2/M8f8tR6DBo4eBFhaRaQ8LAEuJOKn4ES25rSPhWCcDwpnIO3AkjB9pMVE/9bS8
 FNWVwdsO+O16W+oq5WhWQ3Vgaz5JmlUr0sui0+BBx9USYZ58o9gdsk35yWwuOInFiVnmork0R8J
 T0C2+Q9O6Tt69HClFJuSF1z0CPHLHGqribJSVTqr0F3X6A7YzXv5PXSErJz7VFd+mg2jwFbqWC9
 Ryu0f32Nx0abWejoGoaJoKottrB2pfSenAIF3zF3uRvwfXPMmckliHTrE0dg+Jg1iSq3zr3lVxA
 jv+ic8jiFf/Or3E1FeCHveXrnEzet4iCUU4qtgSIpgAjUCE3CP5fUoCgGwLz3i/VyXVb19EYarA
 UkNc10+mAPUO9JsB09PmVcoaID7kQvxiDtz8oF0LsiS0mnZEXUHfV5yOzB5uTaSUolxckbUaSAS
 JMMWMm3s0YeEVWRsbfg==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3a962 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5x2u8yzsEs7RXICRzdUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: N3mUFBjYqm521jiYN7GSVaVJOZ8vEMXC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX58oa/sOn/Pvg
 5D7PRz3nzt2dfr7YaD+qRo12Vd2I9+YmLCWTHsoT6VRQF1LtvmxgBTCxL75OKmh5k6Yo8RF6bUl
 /99oUhNfXPuYInsp1AlXrfdM0WrUB6k=
X-Proofpoint-ORIG-GUID: N3mUFBjYqm521jiYN7GSVaVJOZ8vEMXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

The GMU RPMh vote construction repeats two patterns across
a6xx_gmu_rpmh_arc_votes_init() and a6xx_gmu_rpmh_dep_votes_init():
reading a cmd-db aux-data resource (with the same "halve the byte count
and reject empty" handling), and scanning an arc level array for the
first corner that satisfies a target level.

Refactor out a6xx_gmu_rpmh_read_arc() and a6xx_gmu_rpmh_arc_index() to
reduce code duplication and improve code readability.

Assisted-by: LLM
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 138 ++++++++++++++++------------------
 1 file changed, 63 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 161b360bf3eb..0ed01ce1c5c5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1711,74 +1711,85 @@ static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
 	return val;
 }
 
+static const u16 *a6xx_gmu_rpmh_read_arc(const char *id, size_t *count)
+{
+	const u16 *vals;
+
+	vals = cmd_db_read_aux_data(id, count);
+	if (IS_ERR(vals))
+		return vals;
+
+	*count >>= 1;
+	/* Exclude the trailing zero paddings if there are any */
+	while (*count && !vals[*count - 1])
+		(*count)--;
+
+	if (!*count)
+		return ERR_PTR(-EINVAL);
+
+	return vals;
+}
+
+/*
+ * Find the first index in an arc level array whose level is greater than or
+ * equal to the target. If no level is high enough, either clamp to the
+ * highest available level (@clamp) or fail, dumping the list.
+ */
+static int a6xx_gmu_rpmh_arc_index(struct device *dev, const u16 *arc,
+				   size_t arc_count, unsigned int level, bool clamp)
+{
+	int j;
+
+	for (j = 0; j < arc_count; j++) {
+		if (arc[j] >= level)
+			return j;
+	}
+
+	if (clamp)
+		return arc_count - 1;
+
+	DRM_DEV_ERROR(dev, "Level %u not found in the RPMh list\n", level);
+	DRM_DEV_ERROR(dev, "Available levels:\n");
+	for (j = 0; j < arc_count; j++)
+		DRM_DEV_ERROR(dev, "  %u\n", arc[j]);
+
+	return -EINVAL;
+}
+
 static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 		unsigned long *freqs, int freqs_count,
 		const char *pri_id, const char *sec_id)
 {
-	int i, j;
+	int i;
 	const u16 *pri, *sec;
 	size_t pri_count, sec_count;
 
-	pri = cmd_db_read_aux_data(pri_id, &pri_count);
+	pri = a6xx_gmu_rpmh_read_arc(pri_id, &pri_count);
 	if (IS_ERR(pri))
 		return PTR_ERR(pri);
-	/*
-	 * The data comes back as an array of unsigned shorts so adjust the
-	 * count accordingly
-	 */
-	pri_count >>= 1;
-	if (!pri_count)
-		return -EINVAL;
 
-	sec = cmd_db_read_aux_data(sec_id, &sec_count);
+	sec = a6xx_gmu_rpmh_read_arc(sec_id, &sec_count);
 	if (IS_ERR(sec))
 		return PTR_ERR(sec);
 
-	sec_count >>= 1;
-	if (!sec_count)
-		return -EINVAL;
-
 	/* Construct a vote for each frequency */
 	for (i = 0; i < freqs_count; i++) {
-		u8 pindex = 0, sindex = 0;
 		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
+		int pindex, sindex;
 
-		/* Get the primary index that matches the arc level */
-		for (j = 0; j < pri_count; j++) {
-			if (pri[j] >= level) {
-				pindex = j;
-				break;
-			}
-		}
-
-		if (j == pri_count) {
-			DRM_DEV_ERROR(dev,
-				      "Level %u not found in the RPMh list\n",
-				      level);
-			DRM_DEV_ERROR(dev, "Available levels:\n");
-			for (j = 0; j < pri_count; j++)
-				DRM_DEV_ERROR(dev, "  %u\n", pri[j]);
-
-			return -EINVAL;
-		}
+		pindex = a6xx_gmu_rpmh_arc_index(dev, pri, pri_count, level, false);
+		if (pindex < 0)
+			return pindex;
 
 		/*
-		 * Look for a level in in the secondary list that matches. If
-		 * nothing fits, use the maximum non zero vote
-		 *
-		 * The secondary rail depends on the primary rail, so match it
-		 * against the quantized primary voltage (which is >= the
-		 * requested level), not the requested level itself.
+		 * Look for a matching level in the secondary list; if nothing
+		 * fits, clamp to the highest available vote. The secondary rail
+		 * depends on the primary rail, so match it against the selected
+		 * primary voltage (which is >= the requested level), not the
+		 * requested level itself.
 		 */
-
-		for (j = 0; j < sec_count; j++) {
-			if (sec[j] >= pri[pindex]) {
-				sindex = j;
-				break;
-			} else if (sec[j]) {
-				sindex = j;
-			}
-		}
+		sindex = a6xx_gmu_rpmh_arc_index(dev, sec, sec_count,
+						 pri[pindex], true);
 
 		/* Construct the vote */
 		votes[i] = ((pri[pindex] & 0xffff) << 16) |
@@ -1794,16 +1805,9 @@ static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 	const u16 *mx;
 	size_t count;
 
-	mx = cmd_db_read_aux_data("mx.lvl", &count);
+	mx = a6xx_gmu_rpmh_read_arc("mx.lvl", &count);
 	if (IS_ERR(mx))
 		return PTR_ERR(mx);
-	/*
-	 * The data comes back as an array of unsigned shorts so adjust the
-	 * count accordingly
-	 */
-	count >>= 1;
-	if (!count)
-		return -EINVAL;
 
 	/* Fix the vote for zero frequency */
 	votes[0] = 0xffffffff;
@@ -1811,26 +1815,10 @@ static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 	/* Construct a vote for rest of the corners */
 	for (int i = 1; i < freqs_count; i++) {
 		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
-		u8 j, index = 0;
+		int index = a6xx_gmu_rpmh_arc_index(dev, mx, count, level, false);
 
-		/* Get the primary index that matches the arc level */
-		for (j = 0; j < count; j++) {
-			if (mx[j] >= level) {
-				index = j;
-				break;
-			}
-		}
-
-		if (j == count) {
-			DRM_DEV_ERROR(dev,
-				      "Mx Level %u not found in the RPMh list\n",
-				      level);
-			DRM_DEV_ERROR(dev, "Available levels:\n");
-			for (j = 0; j < count; j++)
-				DRM_DEV_ERROR(dev, "  %u\n", mx[j]);
-
-			return -EINVAL;
-		}
+		if (index < 0)
+			return index;
 
 		/* Construct the vote */
 		votes[i] = (0x3fff << 14) | (index << 8) | (0xff);

-- 
2.55.0

