Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8276842049B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378789; cv=none; b=ceGYVPmEI80jJRn7naoOhbRoqt4XTHyMtT59f1F16q90lt5SXFbIB+53md+Vuo6/Dq9ag4LwMSIAez+IwGQ6DriB5ACCFm/b7Bj9BtsnKb9ygoGK/LMizPDH+6aiKfXsIEuVL2+Y3sT8J+2F3fB+zr6+9fL+/f/UcyqDByRCz3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378789; c=relaxed/simple;
	bh=Jy14sVbtBOA4INaXpzyNkK/bT7ygjH1r3zg1u0X4N9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7NZcsKRThzh39m+NDDocRakXS2QEUPoMCBrGtRDaJm08FEW3tv8VAkEmu5tbxUbY4Wk9kg6BW7LGSs/RN6aRQ7tXlwqWwiVG01XPKrVZ5f2Rr4sWm5sTfLmja5RFuoZyZikIdx9y64MCd+G/+eqBwTqqbgiYLkQV5fcBhH6LM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJwc0xs/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jqol7sWp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJwc0xs/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jqol7sWp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ja3w544305
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=; b=KJwc0xs/gnV/VDUJ
	AbPpWQ3KScrRqB5m+kykYuRtCYi8CH0ADcKxgLqAD3GSjgfkqN/WacHGjllBQ27N
	Lqu7WHocHa/tadb82TF8S9emN6ojTDg252zI0ZOdI4VW8HZMSv0dkFzVD5Pfk9+D
	IybVvRN5jbYo1yae1kYDrQU+MhpTkRi89g1PEL2jwR4FJz1LUCos2LnToBZyVb85
	kk3VYBsZXtmQj2nPlGalwANd6u98BByZdM4Crx/TqsjDqSvX7uZ+bMxbawBrItyo
	rlUH7LZItb5OhqjSksgKJYWS7GlLoL5ml0dcZik0SDdxSh234Ew1aYzlwlEKDTag
	tVcH0w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k09tp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:39:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso3785666a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378786; x=1789983586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=;
        b=Jqol7sWpspygz8y8UrgHdEe8XstQ9eIDs1kEL/7HaOyZgQtWl84lfI9719pP2HNlcr
         B2NcAzm32ts7vX5Kuc++Np3dQN1Gp+A68ihP8nnxtN30z0GcCRZTuWHf59vfiZWVcqXi
         be+k4tOdRbJRGgI65cHY4evPUMHMD4F34EfxZcbwuBFJhvlsdTqvqZbAKSE1qm8+8aAO
         kTJ8psk2EpH2zRPTIbA8cSjFuoPGuAiXL9eGbC1D5NTAjIOEf56smkr027NIhhY/39A6
         +r8RFPFPo6UOP/i5h8t2BQt0NOTQk0uyNPiiBlwUx+noKR0BxjuFg1QwqjSH4Ckf5AHb
         WJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378786; x=1789983586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=;
        b=hcXt4cTuTAOdMWGVj9uVXcDPETuqhsH+HXEC9VQ93cyN1xVrWwZtDkl1L8jBX3oCZc
         eOBkQwTZoz/XrVZ9UEwOKy6zcyjq2qyVnveUBfp7kiEd+q6E0yUUArVfQM717aOFgOcN
         bRRB1X4Dr2MPBKvz3ELYFIHfI96nshuA3RXD1jhLigO5MVNEpinYur+DXffy8Mtk8I53
         WTcibve7wV2Q37tzHWrhuuCDFDULeVxfWmBNNSif/UpRauGunbqzSqYODD9NLlsB6dNT
         40cDBMFtTd5PqCtGTqKzposCIr/tKHZsyL35AaEP5YACLJiyize0Zh6os/ucQhEOAbJB
         ls1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxtPK69gIE72VzVYYIftl1LrkFRucpeM7v9GhlY7NKueq3PJHE9CiQ/eR8MI5iX9RWmy6rdj8FRzCp0mSgy@vger.kernel.org
X-Gm-Message-State: AFuF++lm1UPRl7QMYok+hPgZa+b1elxrDWbElX9IZDQlmvUE3uF7qks2
	+sLzbBFaghl2t0kOXNsc/zOV54jjkMge/N7i+i56H0Ktgt6XqGRd2BB5o+CS/zWdQnF0p/SQE+j
	D3qY+ZdmtmPFA35uLAQq1mqkwvxnkvxRTDLlRrgCE5cjoN4OSQbFsUKkOvi1bGrAV1Wr5
X-Gm-Gg: AYBFou2Qq35lRu0TmY8UuUJZmDTLkCYHZjpiSFFjxXwYL3iuEjnqmwl9e3ae9wqoyRk
	rx3x5paEqt7SIRXmtZw8YtlfRHaUt2qBI4Vu+AbcNwAOKz6u036+A8G0lGdft8fmCbuxkIC0A8x
	2L7DsYN2btSgeKWvWS+vpVYl8ZewsRzi8s6dMEW8l4Heo+lBYzWfciATpM0Ud1Bot2GMa+2abeQ
	Z/vX9+uf+w289vUBkuNIl8FuUrw5eaxJ4W8L3NeJ6UrkFjRITUGFmX+VIyoHBq1SVFbABXbL1BC
	6+A/dT4hU4aTxdocPDps/7c6RIuwIMQ2hSKpJzAJF+fOqllcIZycWP2zLtVUcWtcGTHHo/B/LBV
	62qBoQzLpXCbKmFvNoOF1Q48lYz8YJQK3oYTMgvhhmUzySU8m0LLoDO7d
X-Received: by 2002:a17:90b:35d0:b0:39d:efb1:dccf with SMTP id 98e67ed59e1d1-39defb1ddacmr2679931a91.6.1789378785537;
        Mon, 14 Sep 2026 02:39:45 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:39d:efb1:dccf with SMTP id 98e67ed59e1d1-39defb1ddacmr2679850a91.6.1789378785086;
        Mon, 14 Sep 2026 02:39:45 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:39:44 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:49 +0800
Subject: [PATCH RFC v2 01/10] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-1-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378758; l=1084;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Jy14sVbtBOA4INaXpzyNkK/bT7ygjH1r3zg1u0X4N9o=;
 b=8qVts8kvOfruxq59KFcdjO9xhhSgezIyTV0q1/20EcQF+DfUllQOZoPY0Owrd4E15wWT9eUt0
 Aa/3hS1ds/7BuqTY+P0ocnYLZ9q7OxXK12q95t3cvNkvuz4MnkRAN+f
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX1Ok1PE5DM0z7
 EC8snCFlvDpJ9FQOGGZFkrlnSXWwvRp/138JhTDjvmIHnglDZjzE/BjfwdTnLTTzyJAUzWoenpJ
 MZH1mDJXUL8uIRy8rG2WX+lCQuAu5Gs=
X-Proofpoint-GUID: tccBflpnWOXpj6ndeR9UDnibXtLmVKCv
X-Proofpoint-ORIG-GUID: tccBflpnWOXpj6ndeR9UDnibXtLmVKCv
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7c0e2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX0LdmNHJqllQh
 4wzyJGaRFL81dUL8eTcyLd1RlmFovWDmN6Vpw/GcHT7jdB7zAWrUN9UUmvnEAET6X8mo7dqpPJz
 fnERo2L2i8RAKgTh8w0/w4bqmMTMduyu1RW1hJX+nLDjjqcmuaNPkB0/P2IMRHQpUHtpFCGZc7g
 Y+H+FAkm5zdn7ZhTO5z4UIBAXPmZ70JtSmEb9mb2xrICI8ZwYAHRspbexW7jPUBIAkhdCM188Bk
 o49GZPOy8ayeTzLz8rI7KZ3GiWMJmsA6kc8snFSJXRZ0UYTqVs7kT8dMaDCUXSzwT/oHhKZTw0C
 YEyvGkQNGko8pHQIkkrArtInt4rOM5qBdMR5aLa37D03xzEvAY8bBFGwCPMM18fQ6imva1sFIAH
 2+8xoItDIIlFtFGzT5EQH+uEocl9CpOLWOk5Ya78rYZeSrGYaLBVIsW+X3OA8XUSRxlMQK3FXZb
 0cN4oLegCmjjw0UWSbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..6da217abf689 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -552,7 +552,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1

