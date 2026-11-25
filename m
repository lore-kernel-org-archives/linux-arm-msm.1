Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603120;
	b=OxzquUPObPn6j5I5Cb+mlhU15Xmrr46utB2uBMtcC3qKNzm6ukKw2yLHUeOR4hDVJYVh
	 3m/r3I1M8RRDsa2TsA9eFsbtRhy1qlEeusXn38Jf4nJG7ZiyHngqgzcoj2mOyA62U8csn
	 PusnzKhyCT/YxYY15Pcb9mIjOLkb5rQRvNfJ/FRTqJ67CSnVg0lqka4WY/BIXzLfIkWCJ
	 vbArvadm/uz7ciVYMnVR6xhuPnJcbIBTwqfYSNRxYBDUPGX9C/+rczoWl1JymdNjMcU2m
	 tHztf6kHeEpa8zeh75++7mFBpfS93D4mBCZNh9CYVkbh70SdyeVv415JAsWjBXHnZuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603120;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6EPgr/fzuvqBneih+3g66j7jTCzzkX5xHjj3zdy2O0o=;
	b=UW6Btoq/FcbIZ3dqebMZUKWKGqYvPkHWIJbB0Rtx7jHZu466cVHJlBK6Q2IySQvRoBDv
	 uZZMQb1u32Ppt0ZyiiYTnGKxwKBNVZG3SKY8mcIeZdgUYSw4wCguemrkxy099OZioko4o
	 11FkwGUDphklO2IiKJArps0Qw0pKVh73nxKMCRdiV1QuILahlSQvw1X7ZH57nOoJEK386
	 nDrkoO2s1nLA7gW4WTJVhBMO/yI0E4OnIeHJnm+OUDdPjd6TdpNfvSN1VdK+KxakBhKER
	 sObcnNQFiSWoU9yY9HKdcnfomvLSjRf30bnoNC+WrFVYmi5hNS3CHyp+3FiYVl8pi2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XayWTgC6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdlYmm8S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB5A606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AB5A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XayWTgC6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdlYmm8S
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mlaO3611422
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6EPgr/fzuvq
	Bneih+3g66j7jTCzzkX5xHjj3zdy2O0o=; b=XayWTgC6AdO6tSrtZmyYgzVmVYf
	D80g2MAJ4v+eKDTO37GE7kIyhXPiQrA9nkJXlUkr3m2MEFsS3mGIyt7zH4zdGGBZ
	YECADXEYDxXs1j47uinE0iwGgjVTgo3yU/qDrcEL7lVji5dj2ZaSo6ItkXw0T3O9
	gfeMzStMGR/S4jjAjHGy4s05jT0OXpTCZk1xi2kURG1mZfDuPjQf32WnTAFWCMWN
	xtsnVIdHZXL7jclPHwcGGwa86Y5KqbxfM4T4k6i9GWfFpxlng+OgtlKBadBSUo9c
	tJMnXBBbSd6Y48UDQdHBbDPjc44YduBAnGF68ASujDUwzVmXl25kQA12KGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsb6cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:38:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso981234085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603119; x=1796207919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6EPgr/fzuvqBneih+3g66j7jTCzzkX5xHjj3zdy2O0o=;
        b=XdlYmm8SmUJ/fsXCj2OAqUHs+V0VX3MsWLtKYra+CST+kjTPccfTZyUtnThsmVoAbI
         AYHMCBL8HTgOn1oWV5SU2X9ZAJz/C4moh5pY4H1jv+qkqCJn2kbRNTj7ir9wrkM+jAFi
         C66Vi4oX5hgE71EIhBtLtX9suSZSWG7ByqZJqCLz9Qqdh8OC6eyURmdbnpVNYB2Gh+/d
         eGPTuCD0sIi+vxHtMO4btnCPg3x9BU26LYbpZSYC9WaTAtcbi2lKluaC98mE+Mvq3edH
         gh+fJa2iTTUO/aUfZMsrvT2pEjRYZkthWO/yqZYZ6Gm/KonQsF4gu8VUH4Hj9+7eXjC7
         O1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603119; x=1796207919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6EPgr/fzuvqBneih+3g66j7jTCzzkX5xHjj3zdy2O0o=;
        b=yukpMzEy11jl96tp54vXtXCrUrlJ3rLH100YETSjjOqVSowWKINAKu7UH+HBONXVsK
         aufMtbUCClS08kRviHRBRRSSpO1fiEyozJeizcbnxuHBDk6B7Vn4AFrAPRRf0eoSQx6A
         vkjcG6wmGiHk1sZJlWAkEIv9zyoUlCdA94pON3pF4OO/j+OmQu0jfSpsb5uKeHyh0hOV
         3ddi8QglZS++h1JImQ+R+EXRFm5ZzNY4ocIxHpKC9OmLRnNkFR4yqB39XJR8ursaIy1g
         QO3Nwgk9Z3VKuA/JuBGfNuCmPclToxQp4vJ9pA08O4PRygcL3pQKsxnj9yLbivlGB04I
         cG+A==
X-Forwarded-Encrypted: i=1; AL+hErHOz+RXexwrScRNUnGI+ecWK3yozTjUgg/Hp7QVApxDFi6SZuqZ1tK9ZAO0dbmv2yZwZvcoAUHQwdS3853c@vger.kernel.org
X-Gm-Message-State: APuU4Z+oFxKsIF/HPvg7DffwP+47mLukn8/qXIsHGsAU/aqZaFG4fkCa
	HQgRVKQxwuCeGVvArBQmCU3Yo0tOKNuviI3tlPV71Gwx8DLYediHH1OU334biRM2aM8hMAz4z2A
	I9Cg6gRRjlGR2QAv+C6L5sUeuq5OsSrRc95KADthOS5sCDcnQLZkvlwuIGv2HxqS+tL1xiLrBD4
	7D
X-Gm-Gg: AZFdTZeZV40ZoRX4hekPqdes9896mxk6m94+FiqvopyJXokf4khqgKAm2LC85TQNKlf
	sAxh31NjgogVW6PDlgOtpMg4+JDYYTJdhYCiFCkBW9qtE48C8euVRgFuzBVPfvzTfOM/YJrWDlF
	szDIiAqXxwzWjqM97qdG3j1VfgFqequaZ4Ie7QZHgtqyquGVTmjaBhFWr20kTp9ztNtOAWHkcdH
	94sY4YWuDA8hN+gS1Vl0NyW3/mdlr9drqn3fi0ZaLMgE7HUNEtUMLAeEVUjbqj3aauSQJ6fBB8E
	emx/wx2MTeEbgbreP1J+nT+khBDIvX3wxaIfYnUE4e2sEyfCoWzLK0k9gXJJsHiOSLkpXsFdV/J
	uzQpj4IFQfqPXAavuB/bWEY+H7nsXk1JI2FX9GgBPP6OmhnIq6EiCg2ZVSYkTN/wn
X-Received: by 2002:a05:620a:260a:b0:949:7502:6a0 with SMTP id af79cd13be357-949bac8117amr2605487285a.77.1795603118665;
        Wed, 25 Nov 2026 02:38:38 -0800 (PST)
X-Received: by 2002:a05:620a:260a:b0:949:7502:6a0 with SMTP id af79cd13be357-949bac8117amr2605484785a.77.1795603118148;
        Wed, 25 Nov 2026 02:38:38 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm34171502f8f.48.2026.11.25.02.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:38:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 1/4] soundwire: qcom: always set master port_params.num
Date: Wed, 25 Nov 2026 10:38:22 +0000
Message-ID: <20261125103825.936939-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: F6esBw8PIr1kGp-aTv2JGqfcBe3cmTIG
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06baaf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=x3F9vMqfjlPox18evOMA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX9saHgGrOkCNh
 VwH7RUfqkBn2EriII0vDOQF4YNSpozynlXrWgSjC1+ZeB+a9R9tO8hzRAxMrAk4VVGWyg8SFXkX
 dazC+gLURiVPp1OcifmjzkZNnRFz/gk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXyeQKB92Fm76F
 I1VYcEZFU/gD67ZFDXXS98WCS+2mAMfpgC1+SBytFctLF5WfgTzFiOmLTSDSVTGAbpwCnc0qyab
 JiSVP9QUuX5/TVYGt39j57IlFp3JDwvB1u0qdxP5/HLT/Byu2kY+vtN0oMWXfeeAM3ys6cTaJHv
 8HM6h5oPyCncbVLiLNLTPLQm61FtALHUcWjUiFlIeczxlo4QNQUqjpOhC0dluHO0SBN6AAQE8dH
 9BOexsN2MAn+PsiHv3IGDnzB/66p35rK67SOFmqi3swCClVwPtxLAomcm4F6Dwz/YE1oqx9lECu
 lf1AivyZaZd3g4F4Fovtn2ldrhB8xYkCNitn5iqByHLidrDx++OROYdqEaKjtsYyAEY9WlNKxd3
 ydp4yx3lXy+6r6S1wtBpGrCwWQE92VHFeoVOt3ISk8fmBN9ZkV5ubb6YXIB6fVAnpevqYzzc0bV
 NurQvzrYqUzyFqo1lRw==
X-Proofpoint-ORIG-GUID: F6esBw8PIr1kGp-aTv2JGqfcBe3cmTIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

qcom_swrm_compute_params() populates p_rt->port_params only when the
DT entry for that master port carries a valid word-length. If the DT
marks word-length as SWR_INVALID_PARAM, port_params is left
zero-initialised and the subsequent dpn_set_port_params() callback
sees port_num == 0, tripping the port_target() sanity check on the
capture path. The callback then also writes bps - 1 = 0xffffffff to
DPn_BLOCK_CTRL_1(offset, 0), which is outside the DPn register range.

Split the per-port assignment: always set num/flow_mode/data_mode so
that the callback receives a semantically correct port identifier,
and only derive bps from the DT when a word length is given. Guard
the callback so no register write is issued when bps is unset, and
bound-check p_rt->num against ctrl->nports before indexing
ctrl->pconfig[].

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/20261125091150.2145177-1-m.szyprowski@samsung.com/
Fixes: 128eaf937adb ("soundwire: qcom: add support to missing transport params")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 65add9a74ffd..95444eee4c0b 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1209,6 +1209,9 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	u32 offset = ctrl->reg_layout[SWRM_OFFSET_DP_BLOCK_CTRL_1];
 
+	if (!p_params->bps)
+		return 0;
+
 	return qcom_swrm_port_reg_write(ctrl, p_params->num,
 					SWRM_DPn_BLOCK_CTRL_1(offset, p_params->num),
 					p_params->bps - 1);
@@ -1341,15 +1344,17 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus, struct sdw_stream_runti
 
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
 		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+			if (p_rt->num == 0 || p_rt->num > ctrl->nports) {
+				dev_err(ctrl->dev, "master port %d out of range\n", p_rt->num);
+				return -EINVAL;
+			}
 			pcfg = &ctrl->pconfig[p_rt->num];
 			p_rt->transport_params.port_num = p_rt->num;
-			if (pcfg->word_length != SWR_INVALID_PARAM) {
-				sdw_fill_port_params(&p_rt->port_params,
-					     p_rt->num,  pcfg->word_length + 1,
-					     SDW_PORT_FLOW_MODE_ISOCH,
-					     SDW_PORT_DATA_MODE_NORMAL);
-			}
-
+			p_rt->port_params.num = p_rt->num;
+			p_rt->port_params.flow_mode = SDW_PORT_FLOW_MODE_ISOCH;
+			p_rt->port_params.data_mode = SDW_PORT_DATA_MODE_NORMAL;
+			if (pcfg->word_length != SWR_INVALID_PARAM)
+				p_rt->port_params.bps = pcfg->word_length + 1;
 		}
 
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
-- 
2.53.0

