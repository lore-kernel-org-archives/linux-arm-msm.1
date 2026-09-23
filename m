Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B451351D536
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181264; cv=none; b=UhEtdALgFtDx3A7aMgzecI/PunuvNPAc6dwMKwgv8wmUhp3kOuePlQ84MbKMQDdERmCUTcxNoBWQaxkGEji5UNPzMwlgqIyqtkQQGQeZWgOyEAf1TuPNGuf7zdhCFOAww64wuNQ/Rv4zopfDdewUTmQjfO3zb5KTzMzY5scwLoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181264; c=relaxed/simple;
	bh=bZFCmikbhjibr37QyYsw1BYnrmuWJX2eRfQcgt38jzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSpbWVTZGkBJT94LUczlCwKCGWJLe6MO4FCT8NDr1QOfv5dDTAk0Dj9l17zgOd/vgyMzbB6OSoEJwyK/sxrzfSBZh+IEJ1euP1wI5MGbxWOL6nCsF6pH+qWYsLxCzdSAAPB4PoJHhUrOkDZYa3yrahiCyWdByz0pnyiQG8xyjDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nahf0l9F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fz10Hl1e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nahf0l9F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fz10Hl1e"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTiig3798615
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0pBwxzDmGvmNSPMqwBbxTyOwURg+F3QxfDPjVKyU68=; b=nahf0l9FZwqO/OFE
	YtKXTqp3WUrfiS6yFO7MwJoQSV+O8vg1FEkNYZZoJiPrc6kIb1vYwu0fGqql/9Wf
	IdZG6Q0qROLFo5bTn4CZ0hoIpWHDMRbv20dueCA+U3VZb1nYN41lsPsa6u2hLRkL
	9GyOXAuRRBThbUCYjDLLZkFBFUtfYnE1SJ47+6g5ghMJzElhqvrUBOt1dnMVP0C1
	Fn+bK6artLcmN0agK4NsXccxSNZnUb/DlWNOhEUFOGLkEp3T/0UIw4Bs/F9ak4e2
	vAKX2XYofATsoLY07hkk7bqM20PyfqJMwAKA9dDsNOgcL49OiUOOBIgv3LgOmL+1
	FA+vyA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb063t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 16:34:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dc7337e2a7so10061515ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 09:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181252; x=1790786052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0pBwxzDmGvmNSPMqwBbxTyOwURg+F3QxfDPjVKyU68=;
        b=fz10Hl1eBV44ofxsDS/c+c5/FOZaCT6gf6GttIaDuYNiv51rIeiTBbXOWWwJ1kBZCr
         pVDe4SAxYZJxdzhxrTOvSEkXSOq6Ib1kKspbRoOZh1xSXXg7NTwmt0xhUZ3Vy5E5KqJv
         M8lEmakRQNH4yKHozhesb2Q3MiDTJBqRwbKbuzChBue4eKBqnBAtPMMMoRwl7IrXl6It
         tIYdSbIzcyLne5lWTYFqXpajb8UCS35ETQSG25IOTsopucctjMWCdHRh5UmlcwhpUKTQ
         eML1PKaYxlD/rDjbayo7UrVdA6bqNWvuqZ1kkwmfKrrGTR7xizytvhA6GEunFe0xp9ee
         1kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181252; x=1790786052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0pBwxzDmGvmNSPMqwBbxTyOwURg+F3QxfDPjVKyU68=;
        b=oqEudVPizdj3CI8dZK3wWJV19v0/EeR5bWb6vsUZeV2zPkdUO+0ipmIKcC8YNyQ42O
         IHHaI3ZXey5Al7ST2xjzNL9BqsXqdJuCyAtKqDrLoGCHFo0NXhJIK0Yz8BivSoeCRob0
         Ut8KKKeYnd/VJKUv1CkZVnVrajZyeudghlfAvE32i86zpVbt7KuAr9XvwPW20/7YeNwR
         o5B4TbSb6Hu8o+/Uo4ZjWFyyE5KWr+cgCpTCu+jihhWE93DsihjwmsboOPNv3f2FucRF
         MaJexKKraKW4ritgRc5AmDYAVs5/FnNo4WUYNshb6iXBkOyejUJxJtSUfwAsGslCjEdR
         ZuMA==
X-Forwarded-Encrypted: i=1; AKwUvBzWBPqmqPbuKC9QQvvgYlGkpJPXrNHpgMFIQGPO3FwbxGDoCbEREb7zA6fyvuhkLWdLN/Fn6PcKEjIR/Hny@vger.kernel.org
X-Gm-Message-State: AFuF++momDB5x9EsGdYgmnWOBjzKbqFGAARczcxxZTiQRrvdag0ptn3E
	a6UtJeDQ3R0NaTvj0Dtb3vg3E50D90D+Me6vbZ9Pq8ucf5QAChJfhbIYp2O75dO5ywV7OwOyjrj
	zzGDVfN1DUHf4a9r66rXnn0FJM+i0MpDdD54ABVB0B44JzagtJrwPKn1j/UQ7uJGq7F2Z
X-Gm-Gg: AYBFou3IEFb5kVmBW4IdkJJB/o+G8bEBnmTCv+jfvccdrQpgGnd09KtwO1GlJQmsnKH
	gp8TkHhQ9skS06PY0Hh6E/4P71rvCCZKGgG4mrs1We6+NozClfzVo5A4Jq6aEj4fJ6TVUtx5tis
	K3Eqoz/UrL4nRdnjtOh5eLgL6AhY/vVNTjdCe8HREND7QzWKCCKcmxIE0dXs3zs68NOdw5BKzjG
	FaiNPeXZxkTjFac/6nfEHJ+WC6BpWGs3Xc7nzd/nU60wjN9rOFwIcUdgKc+LlTQPqiYNWIlqFzg
	KQlgeX0TUnuv6G81C1m9IOUSNRrYjSFs0GabehwZaJqMfuC0MjRKsY0mZGDeSBt0PyzEGtJnCwd
	vaXOO0A5tv3jcr9Wt/8/caNsmNkY=
X-Received: by 2002:a17:903:3503:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2df69ddf227mr25747745ad.34.1790181251375;
        Wed, 23 Sep 2026 09:34:11 -0700 (PDT)
X-Received: by 2002:a17:903:3503:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2df69ddf227mr25747375ad.34.1790181250803;
        Wed, 23 Sep 2026 09:34:10 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm13994895ad.19.2026.09.23.09.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:34:10 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 22:03:40 +0530
Subject: [PATCH v6 3/4] ASoC: dt-bindings: qcom,q6apm-dai: add
 memory-region and relax iommus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-vmid-v4-v6-3-3d61a0319b1c@oss.qualcomm.com>
References: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
In-Reply-To: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: Q2VXVOGQeLpcKO_-3E-4Pna0wPdSJwfA
X-Proofpoint-ORIG-GUID: Q2VXVOGQeLpcKO_-3E-4Pna0wPdSJwfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX4lgX383iIYyy
 oZHLqKQxSu8r+rVmMRlx0K288tVOj3M9Pk10ZTbPq3vgwSOVck02a7v6URQZ3Tr103DSpviH1Py
 IrerqHx5mPpr49A+BW/C6t4bpzrw04HUQRm+zqraVahSJxuCBQs9od24a3VvjJEPFfKSBdy7V9G
 Echblyrk86crgrWQ/m/8TmhOmZ8eA2Bx/VzSr8Zi9IHkxcYTqKaz62j7Ync0U64Qog8vam9qW+z
 IZhJVefZQqSbbfoW88vswuhwzQogYXIOMwR0hVqO6I3HDMW6Zo3NG/oBE4UUPW3rBMYatV2DObS
 zrVkP+lpLIlClvtpDMYeJXC0UgD3gM+y6KHJEJXsItKRELHWGGTIDaJcC3M2DBClwLZ7PxBTNI1
 QlAwRNA/R17jxPxPppTrz21+w1Ncs3/9l6tGET6zlVGlL09vWXtKRJKfBdZUEk/1sW6KZtcD7X1
 G8e9kpuZBbNCcCLYi2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX8NZloTeC7zWP
 RaCCCGEiSYTenCZC4R076e6/gsWm63TOo4OjIVUj5Hs45b1P2jxgiGLgNYwEfq5D6WG5eBGnaY8
 YXg0/i10CkwAXHSjqRM/y1z0H/maCkU=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab3ff84 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=d-o4ErlZh7ezHBmBfcwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230066

On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
context and cannot use the SMMU. PCM buffers must live in reserved-memory
carveouts that are SCM-assigned to the appropriate VMIDs.

Add a memory-region property (1-2 entries) for the control-path and
data-path carveouts, and require q6apm-dais nodes to describe exactly
one access path: iommus for SMMU-backed systems or memory-region for
mDSP systems. Remove iommus from the common required list since mDSP
platforms have neither IOMMU nor VMID DT properties.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml       | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 9e5b30d9c6e6..c1f9fc9eab64 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -20,9 +20,24 @@ properties:
     minItems: 1
     maxItems: 2
 
+  memory-region:
+    minItems: 1
+    items:
+      - description:
+          Control-path buffer (audio_heap_mem) for platforms where the DSP
+          runs in a stage-2 protected context (e.g. modem-DSP).
+      - description:
+          Data-path buffer pool from which per-stream DMA buffers are
+          allocated.
+
 required:
   - compatible
-  - iommus
+
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - memory-region
 
 additionalProperties: false
 

-- 
2.34.1

