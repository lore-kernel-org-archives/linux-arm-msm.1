Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945874DEC13
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159947; cv=none; b=lDnKqnEhkIi4qFQLuxG/O99bCWPCIoFfiXf3PxC8j8dogtGxuM2a8qYfRHPZ/irFxLj6cZ0QYNHHtBoh1XcKirX4oO2MlhX7Bt3L/Ks4vWTtsZz0ZG5vzBr2JPRa00UttXMOQieVVmxDkJGLXZm8YwwWMARpXRleSes7MdpZVO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159947; c=relaxed/simple;
	bh=pAP5FVZwFnM3EjU9mKSll1tEBjEYoJ0+jPm8EdKke5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eutM+JpTbmBXV5hEhdX+xKAGkPbCgBRptEg7Wn/tYEAPAOo0q5ABsW+tIeVtoh9ebMWkrHDpYVUrbJ7Ta8vWwIUt1SVh0KnlTMsW356z9lIoiZrzsJw1twCCxyMf48O3NKtG2RTGY+afxMWZIwWRuFbXZTw5t9ZuSRMIFb/cgSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpkAfoOI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hsAYoKh6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpkAfoOI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hsAYoKh6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5ixs1910951
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=imUbnlv596X
	lyAxqeH0fVXsj8dbOlTAi5i39vOkJEdA=; b=JpkAfoOIqpcWnALU9UgvS7DQKzf
	Iak84YZ3x5x0DatsnxYTgOLQHLLp7XbPBOqygELybWOzYiF6BA0IaCrnWyBYymlh
	gugz/BtjtYkgYPz6NYRy/s/1pjURxtqlUMo2+ExJHos7EIvIsTvZ2K2ueGmYEOxy
	ySieonLKoCNvvxqRADkGP6eHVvSUrUgRPaFQIBGSyum9dPogaP6sCdInFoTt4kS/
	wWeKF4/YGbeP00vbnX9WObWq0PgtDmL8BLGSGw5/In0KCbzQnprurrLDNncIIcxn
	fW5hf9PySehygsx8RaBg2BmjEy4gBKMNPPtFTnCieFprT5gCuEkCR63ZxXA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8pdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:19 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1665200f4c2so8752069c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159939; x=1792764739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imUbnlv596XlyAxqeH0fVXsj8dbOlTAi5i39vOkJEdA=;
        b=hsAYoKh6HJPa8m2Nfo/pD44ewSsNQZErd5sCcWsuetxLgwK9L5TgU6yfuqnBX+cVp9
         Ncby1h0NjDX4AoiLmMNdw3J6KpwcKgrF3TzWAL+fl7XcKk4AwS99CqO0pVSVgzW1VNg2
         CSULMNHEBf5/Cq59Mqd0X+9sB7DUEPUYBXajKH78il64en1tQluQTFrlfuZimusfgAYA
         f/53qtTtDs5WOObZwrDmvPfvswx9qa4vjuhvLWv1J+6J7ZM9GxiE2DdE8BnXjnoeZ5RN
         vPqDuUg30VvOcqcI/N7x219bGzlJAyJCQI1T59I49hl+KejQM+3kQ0VQLm3kpFVF4zaw
         8r0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159939; x=1792764739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=imUbnlv596XlyAxqeH0fVXsj8dbOlTAi5i39vOkJEdA=;
        b=CEG+RpPGyig9PS4twjWhryXv5HSOIqk6hrDSWrNRs9KamdNBoWduCx+TNo2wwMEkjH
         ebvDoJv9bWD2At2YoWau5AwlTbtiATAuB87KUWkBAqUF5F5f6cdl5lXexRkxyBEhqUwi
         7cpIwb3M4pjJZPgT76Ofr1iE4eYCYVZpVkxXBLGIMe1FdcYEO6FRu4eXgXMvGDJsT3Ht
         TSqcZjrqqB5hRU5kWL1bu+DcEA/leIxUidievoeIyWbPpLmjehX+pU33EFJgyPsnUoYA
         PUu3yvjk0uEXy7CjgPk5KcPRpLKdPatrjw+DdGNssu84lb179k4G7+fvB0ksGW09Fig7
         dq8w==
X-Forwarded-Encrypted: i=1; AKwUvByu1t0eI4BmBdKu/fn3msDNKFysusrISqpLSBwcMrn8T1StyMlTpgPNLIE11irv9DjXDjlPEiU52DSjYcoy@vger.kernel.org
X-Gm-Message-State: AFq9FYL95AhvWIR4o2BD/Jwx1ch+V7QYRLLwa1XQXMhITXK399KCIFd7
	oYd74jML5IjhAkiBywAHAvVHHF9x+LWfmu28o6wI8Y17tjFSNXvuZCuBykDBki1cn7ssuFqfQMT
	qQWveQPXY42nMUgtAf/BfU1sAFIP4sJoIzXbxANdhqWCZVqgaNb3s8DYH+8c033nJE8Sm
X-Gm-Gg: AYBFou3ubvrbvGXjnqr2NiLVTCvPCVz0eijKue8udlznJ5PAJ2jPsCfpV3+C7lGwAX+
	eqNCZN6RCthEVaiYIoHTM3hMi2aySTuL3erxLUzSi69vgah5BW49G72sF8vmDddle2oeZJc5WqJ
	DqXGh/IipTAY8xqPnnkDfc7kWX0rS3U2IY4GYXYHhER6Eb578yZq96lHtVrgz8TTVOQcol7YpI9
	aiAfnazqzc606gMiezuP4U3qPRW7LoKctDTwVK5d3tELIqJ5b3sXTsA7a6vWDp8KV8EI7/ODYIu
	z+ghPFRSi2e4bRQOQzGpDIMnew9VDvU7mfCqYEGBdOpz1PBigK9iRYbsS/sXfINIOteX4Sn18dY
	OZCJMjBQIhCmo479I4qlSbhUQ0zzPOeRLq7chh1GA3HJHRUsFWMQNW6XFHwU=
X-Received: by 2002:a05:701b:42d1:20b0:15e:9126:c60f with SMTP id a92af1059eb24-18512e25085mr78891c88.29.1792159935569;
        Fri, 16 Oct 2026 07:12:15 -0700 (PDT)
X-Received: by 2002:a05:701b:42d1:20b0:15e:9126:c60f with SMTP id a92af1059eb24-18512e25085mr78849c88.29.1792159934931;
        Fri, 16 Oct 2026 07:12:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm6997682c88.1.2026.10.16.07.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:12:14 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
Date: Fri, 16 Oct 2026 22:11:52 +0800
Message-ID: <20261016141153.1346219-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
References: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OTguvsvylrQCl1VATk3Wn7DXD1UzENW7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfXy8Cgv+7Uc7ok
 a4t5bYLctDlzVzA2pRnhryXTJQy/1sIFi0Qc0akhXUqRbp1T4SzzqLl0B6HUhY8xB2R2sjhyteL
 uYUnlGPwVwq3STCwAZU+lDRaH1SwXKw=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad230c3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=RRt428QXv51Blb0ChN0A:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: OTguvsvylrQCl1VATk3Wn7DXD1UzENW7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX8nrJ+m4mH3Oy
 3+yRiTdVRoSt88uQ+115Now2TYRHbMEtei1LrHYPHERQD13TGGSkxfvGkN0o4zeAFLTG2nXVntw
 k+LBMBgZtE3uUjZxRxq6j/ik9bQ+X/D+xV6TlxxmZWTcMFQQeF7FU4krOUiWMesKpAkhqrecG32
 D6S/DON8BwjBRfW2LkcIM6tDBCPxTafTP/n7m05k0UhGyg7xVP5mcPDrDkzn9dN4/4mCuDbMqcN
 /6trvlll1La9uNt+eFQcsFv6HgWB9JhszMkW46tN+LxZAKgU03/xugokn75orYrX+D3nog0cOar
 F6JRMvP9i2WnMX6TJg4jGMUp2BJbvypxtZkEFewdkkKcwBDv7e68S3JnneeHRBVrAJqZVFwsdqG
 UHIysl845pM9tLG4Gupyn9KGKZrQ15aH+knCWommAHYUUzZ40qmhiKhsBzi9pNB2v26+aCyt+r/
 N9JZ5/um/HHQqGRae7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160056

Push/pull graphs map two shared-memory regions per graph, the circular
buffer and the position buffer, and keep a separate DSP handle for
each. The map path tags its token with APM_MMAP_TOKEN_MAP_TYPE_POS_BUF
so the response lands in the right handle, but the unmap path sends a
bare graph ID and the response handler always clears mem_map_handle.

Unmapping the position buffer therefore wipes the circular buffer's
handle and leaves pos_buf_mem_map_handle set. A subsequent unmap of the
circular buffer is skipped, leaking that DSP mapping, and a remap of
the position buffer is skipped because the stale handle looks valid.

Tag the unmap token the same way as the map token and decode it in the
response handler to clear the matching handle.

Fixes: 7c1ac23b178a ("ASoC: qcom: audioreach: Add support for shared memory push/pull modules")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 702df80d2fb8..72ccaea1feb3 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -328,8 +328,9 @@ static int __q6apm_unmap_memory_fixed_region(struct device *dev, unsigned int gr
 	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph_info *info;
 	uint32_t mem_map_handle;
+	uint32_t pos_mask = is_pos_buf ? APM_MMAP_TOKEN_MAP_TYPE_POS_BUF : 0;
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(sizeof(*cmd),
-						APM_CMD_SHARED_MEM_UNMAP_REGIONS, graph_id);
+					APM_CMD_SHARED_MEM_UNMAP_REGIONS, (graph_id | pos_mask));
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -965,9 +966,16 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
 					result->opcode);
 
-			info = idr_find(&apm->graph_info_idr, hdr->token);
-			if (info && !result->status)
-				info->mem_map_handle = 0;
+			graph_id = hdr->token & APM_MMAP_TOKEN_GID_MASK;
+			is_pos_buf = hdr->token & APM_MMAP_TOKEN_MAP_TYPE_POS_BUF;
+
+			info = idr_find(&apm->graph_info_idr, graph_id);
+			if (info && !result->status) {
+				if (is_pos_buf)
+					info->pos_buf_mem_map_handle = 0;
+				else
+					info->mem_map_handle = 0;
+			}
 
 			wake_up(&apm->wait);
 			break;
-- 
2.43.0

