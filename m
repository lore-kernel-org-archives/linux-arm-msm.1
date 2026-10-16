Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBB24D7961
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159939; cv=none; b=GVKz7grlL6kgKOhxKe/uLmXAwPp/D8HTPDONyS9pOAU9gapGbeGU+9agSQ+WXi0PCTGnTPC+ArrKt0Mgia3AfAgbG/oh7KunweOik1XsPWbTLcoI3fk4BsT/LkvFLT1mydtmq4lvSdicys9WJ11ZfHC9W/vgk6yJYJg9xUNjXZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159939; c=relaxed/simple;
	bh=DyaBOf+OwSUzR1R9eT0BmgFC8LjBn0yOH1OGqxKZC7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YVI2eViOYby8JgLQhSd+GdDt1jBrwUMFg/QpVAWY6ALTV7jPetjx4aEa/Nmsuw8EoevPEMCW4XYQ/gjK0M7n+ywjyN7uARloCJAPdg4WWNDWSSbc9F+9Ujq3++xa9WfRU3+hapI19gOLOXqnwwjgOzzEv/4cWzHarKd6dAmgB5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3uO4mBV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xb+u0G14; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3uO4mBV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xb+u0G14"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5sUJ3577786
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n01F7caqk2A
	Q9IQPp17tJ6fpAiihtAXb5gqOLoDFVCE=; b=K3uO4mBVqcAXEcNok7dRyQccDx6
	ZaaORXxI39UBGi4/EV0xwZPrvi8kwev855N5KiJb/6ZNLdidJhN5zt1xcoM6v3eQ
	NVwd6Tdv5iVX59rg3a03Sg6PJSBweahi6uxioOE5f0NM44QwvJreAjdKFTmmJxOm
	kouP5X5x+A4R+VSjJCUfNp57CQ2w6a3jzic88iaEKVTpSq6XAYbEjnQfptjkPtrF
	DbjBNLfVYAc7lzqs+kfsxjOs1vP+olP7WVIYOyT5L44EXFTK2RwNVDF+b118LpCu
	rsHEBS6pOlkeIe2fq70SzEpMX25y+XiGJZG0+GZxZFd05mUrKcMI03HxrfA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba262nhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:12:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so13251977eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159932; x=1792764732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n01F7caqk2AQ9IQPp17tJ6fpAiihtAXb5gqOLoDFVCE=;
        b=Xb+u0G14UThvQqVeqIsOCjnrYFAHX38roc2QLRaciPezirh/b3VVcnxnZzKOsvYLGo
         XQK/p9xAmfe+ePAezG83RsrEqRUfWfdhnSdMffMY0mLobLJJkcuGOKKfq7ovO2JXgvIM
         YX0n4gLd+WlHyaFkVZeYFVH5u7yeY0FPpCNEUgbPBTUUQ3jLSnRCA+coiqf9vhPVTu3T
         yuiFRuPmR9m5R8UvftjO+Qv75TsNRa1AYraJw1/zDiHleWnMeJ0eu6pTZFaCiVZu8tZO
         RsrHyavneoCU4w4pOTCJXVgE7f4D2QEQSQlzhlcWdaOqVzMFFBkdHg5WzEHc8PweXTHK
         KaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159932; x=1792764732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n01F7caqk2AQ9IQPp17tJ6fpAiihtAXb5gqOLoDFVCE=;
        b=KEXrJBzz+rzhV8BoqyDjnVVRtGVvcz+VEjZJsIeubYfx11YU3oacxBOA9OmKeuccFb
         //ARphIgw3NFsU5U7dBtlCM2ITx3NZJO4ERMNVhhMHDv5GM7pXHiof04T+M39coidJXK
         wGeQO4InTJPGMghVlSQxQwoytSQTU+2Hitbx3+GOddmECpeHGyJ4Xd0QQDAEAOxnbzkt
         s/vyVODXhn9QTR3AB1O0q1Gzt6Fcp/kwZtKIm0hqxyCtBGi/TSD5w00gOIFVfm7veG2t
         U9wubumDth2pShykuMFs9i6XmHIZo8EszQm9/jGA+0/ilA0e6/OpyLB32DgfSHEh/5oF
         FBYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDEqZj0t6/o6AQ8RZ5IUNfp3nup8fFT8f4DLnknLymLP7prMpBYsVP1oiuejdgZ76LsKZkeCAGudTlbfIU@vger.kernel.org
X-Gm-Message-State: AFq9FYKpcCu7l9latkjN8E0A9nRkl3JV6KlFTvjFeYqeol7hwk6CLG9V
	lwxDB1ItZt+9uHgaB3JuWdJc7jX3l7C+PSIacHdZWqvXQCPIvnIlsem5jU2nMgq+weqSMmaI2CM
	PJBfDm6nFWuqggPZSzoQqmscfSkKo3X80NA4Q4VHfJyKZ18L0FZG32QuSkkQ8O6T5o9uV
X-Gm-Gg: AYBFou0tauIZUdnk1L3OqMBXURRWkxUktEc2ITtQPQpl2sn/7Z0Xw2PYwHscgA7CGIc
	NevOw+QUWAIm73QAv07oqwc552eaS8yLZU2lKXoTuIzb504Xp/mzBG27LUfDqiUmCB/+TiXEADp
	JuxVEh0L+rbOkm0e+Ru9giRWM4KaW9M7PPH+ytVbO5H6p7ADvm+BcpzBVaYROlSRynZ31thow+s
	tvNUMkWVJwTyxFrc+VlPmn3p3dX0DEKrMZPaep3+LIkC89gw+bhjReaRivbV9J3oXZNF4Z8xHUu
	Y0fkQ1ve+LSR/r5JSSJ7Kfs9dq4hEvSJwdT1F7ObIALaqBw6yMK65s/KL4N3wrkstfbV+zHYL3a
	CN7Jq3zLXkQCVyBqzCa3WitHob5sQ06zUF3tiQLdwVKE/xK9PXLyxQGbwwRU=
X-Received: by 2002:a05:7022:5f13:b0:159:2c6d:fcc3 with SMTP id a92af1059eb24-18512e254abmr49011c88.33.1792159931859;
        Fri, 16 Oct 2026 07:12:11 -0700 (PDT)
X-Received: by 2002:a05:7022:5f13:b0:159:2c6d:fcc3 with SMTP id a92af1059eb24-18512e254abmr48985c88.33.1792159931220;
        Fri, 16 Oct 2026 07:12:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm6997682c88.1.2026.10.16.07.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:12:10 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] ASoC: qcom: q6apm: Fix unmap regions response handling
Date: Fri, 16 Oct 2026 22:11:51 +0800
Message-ID: <20261016141153.1346219-2-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad230bc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=UQ7_avvXQmqc8gSTc3kA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX+C1Z9lJF10aw
 lFE8AM7NDcu5PQjvcY5kZJ2cBQfxv4ststlXUpmFRpIwDrjK66qnoV7v+im9uBXwwaN/RgngXHg
 ZC/yNs+Wnzf7/0+rWoRuCtLyKSh6bibuObU/BWcYqk3HmPb2ANKYsTOrnASHewrmYnhaUSAXqYJ
 Xf7Jm0+xfWsTnxgM4sRYxO6/onp57E037DwOfhxM424L6DSHSmXWy4kzg9MO6IwbnPZVMQhKIf1
 PoQlSRWiWLOg6U+mPNMjHUKB6ZLS+WqTypglBFb30RzBOWRXg+8HgizzchMaV3nSZ/kIAUniJP6
 FxJfwWyKsIR08x/kuIu98bDy8aNth9fYTk9ifaurqAQn0jAz2ZNsvu8NWMuDpzv9PRItHsc7VeM
 ghXbPJw7AypkKmczO3NNVy37bvuisSF59ypSbX5K6pZoWR0996Ec1SS5U5CL6b2AAoPJeX+0Ljg
 bjzLjUxaAEgxdNGf1Ig==
X-Proofpoint-ORIG-GUID: sV-eDNumq2XigaZtKMNPkbsj17dTQQSi
X-Proofpoint-GUID: sV-eDNumq2XigaZtKMNPkbsj17dTQQSi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX+s5OhNF5wogl
 BBD/CYnGgA1CayQjzSH/ennjzc7wwPdzICQrM/q4z6rnjBfKlZrqtibzxc1K1zmPWyajvlsVyzt
 kBTOl9eCumC1NEtMTUTAuEHGjWp0lMM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

The DSP acknowledges APM_CMD_SHARED_MEM_UNMAP_REGIONS with a
GPR_BASIC_RSP_RESULT packet whose payload carries the acknowledged
opcode and the status. apm_callback() stores hdr->opcode, i.e.
GPR_BASIC_RSP_RESULT itself, as the result opcode, so
audioreach_send_cmd_sync(), which waits for 0x0100100d, never sees a
match and gives up after five seconds even though the DSP has already
processed the command:

  qcom-apm gprsvc:service:2:1: CMD timeout for [100100d] opcode

Each mapped graph costs a five second stall on unmap, and the forced
status of 0 also hides real DSP failures from the caller.

Record the opcode and status from the response payload, like the other
basic-result commands do, and only drop the cached mapping handle when
the DSP reports success.

Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index ea6680925f21..702df80d2fb8 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -959,17 +959,16 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 			wake_up(&apm->wait);
 			break;
 		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
-			apm->result.opcode = hdr->opcode;
-			apm->result.status = 0;
-			rsp = data->payload;
-
-			info = idr_find(&apm->graph_info_idr, hdr->token);
-			if (info)
-				info->mem_map_handle = 0;
-			else
+			apm->result.opcode = result->opcode;
+			apm->result.status = result->status;
+			if (result->status)
 				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
 					result->opcode);
 
+			info = idr_find(&apm->graph_info_idr, hdr->token);
+			if (info && !result->status)
+				info->mem_map_handle = 0;
+
 			wake_up(&apm->wait);
 			break;
 		default:
-- 
2.43.0

