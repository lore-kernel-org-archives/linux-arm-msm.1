Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545FB30C15A
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600460; cv=none; b=F6McnVWatimCd8MkpVrK9t09TctA12P3KG6CoEt4YTMjL/mLEsSGfhS8JAD7IVvuU7W7huELHdDuwktL0Z0UNOgSQhmvVJ9iaCfLecsNOwvGUip4GWpgX6qZmw97wTzCmwQ2nCFtNI4y/sPczzsBNIhEWKqjHNfJ+RaOnyS/xNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600460; c=relaxed/simple;
	bh=XrExrogGyNY8zefzhUS+pWbzmqCVYgThgf2zASOamL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSn689dK0nchzFCM8TWL1qGuFr5PNR6BOFUXuJuxbWXSUicauiWMCs7z8VdvMIWZ0Ls7wy0TGCFHpokqVd9oxwdlRpiq1KWiMYX86i5Ucqtqg0JABJPBpUMxLExYvWRt+fdkzL06WXIi0rc9Vy1bGFVasiTi7S2SwbSYtu3aW60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyVCAaFW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UiygL9kz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyVCAaFW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UiygL9kz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KND0Em4022355
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EdKAn8ifT4fLcJXnkTbDem6y66hxcJsOU6t0kTzLNac=; b=iyVCAaFWYdZ7TVPm
	HVk1jhPHRX4qIaysp57+ZPjKVBTt86SgHWrC/tr5knUQa3C0IFvuvQUmA72fphi+
	Uri9/cdGzel1p8C5Po+qUkHva+WS7TNtkhjmvthdmPeknZIr3MenjXHQ2wJntolu
	Pexwr4lUipnIQyBJUMdgpmD8pXkCsujVY2n3/LyCxOAQLK3OJEc4TnY3OVA3C7L+
	Yb71MvLRltbZSIGEuGc5wz6DOR0ACbCd+Itfjsmn30eCHdPFTGE9XE2fUT95KiNW
	kw7/s/70RRGqLPJoZTgzX7U0K20VwoS4W95BhI+9voalAOCjHPcbEXhBX8B4Q+6K
	aqnf6Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhk2fbcb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:20:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so5687901a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 19:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784600457; x=1785205257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdKAn8ifT4fLcJXnkTbDem6y66hxcJsOU6t0kTzLNac=;
        b=UiygL9kzgXHExAjIY2fEOOwZ7dPGKPjVc7+r/GECEZpPq11bgOQ7RkyZa5Czrmy5Fi
         4Z/4OS5U7QEj/ZcNgpLHi7hqkLSVwODx+2OR/lNbgxU32pGlgHMLU7cumj4aVWy2OqqM
         zQYPG+wZbiU+w/JUV2acoEX4SxAQvzqsUfheLkbazFl1fn01XrD6ZOe/Rqj10B1/WaN9
         1FjumCJSiQ9O76r5huLSChey4mSvPRR2u1zA14PENMYAsFItn4VPtydQwkCeuHhC6Xlq
         MrSZvX7oRVCkNRQ6E2aRHbrRM5bg/8nXmFO3MCwgjUNaCF89Vb2uTse4kF+qsYDxTxTz
         Io8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600457; x=1785205257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdKAn8ifT4fLcJXnkTbDem6y66hxcJsOU6t0kTzLNac=;
        b=k65HYLZ6p4pFvj2gqRarkfgUEgjk/h5cWrgNsWURr2o1eaw6MvRjAkTLnyAB2VZqBO
         uMiDxcvM3KqXxft9GLT0d5nhCdbXYA58p9XMtWn/ejDidEt0RmZJfAXAIq8ZQZwvWUxp
         j+BaFUcLHZFi9Mz1lye0BCUl9Z8dlEAC3i3Tu+NNnyjQ4aj+/bfLE/2gtYVNeZNa9gn1
         P1aCOCcnFU2M+KTZ/b1rcv4H5Ek2raqJ1HkUGnTNgwfFIs82QInNXg/a8U/GhYOhz48z
         2TQiOqeFmxj90q/UzRflcmjFuqRwEgkjqeTxPBiotqCSQw80LC8Eh+ygA8PfhcJllTGB
         SvoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmLBKBketrSmX4J843OvCKxPltEjneJXh7yo4TjF289UkDoMG8YUIY6JZfxCBKoftrqP+b14udXMSMdcIK@vger.kernel.org
X-Gm-Message-State: AOJu0YxBuzjES8UQcVtkQiREhMaw4ClQ0mf2/KzwaBxfwxkcvZI0YzhG
	Fsnldjh4Faya4SWkf2QVIduJyYNEr7q0L+B8P/RCWU4+OQ0j63i6A0uMZdbhemGeOSmmFaqmVJc
	I4VwILNglH/B1uX3ylhLvGCylRtvgcqFtDwfgSqMaUMk/aFW1AuJtE4uWs0Clj0iPjRr/
X-Gm-Gg: AfdE7cnnn5pxJj2wPwUtRR363xblu4eIHJ5PEnvArx3NgreQwAvdoj4x5DxsaS8iHu0
	dlm6oT4N1DIp5gMUHLFNfGcY0A5o0ij7leGnttFGKLuzjzcwXWViDd8cYDE+hII2uqx8V37gRUY
	cnPiadnYNAe7uAtSkVHXZN/cDgEwBPScVpQ5inNWLyzLEjv7eOjXbX0whIGjhEpejE0RrSJzYDu
	uquI3Q4s13RuqjRSha4Aq4gzMn6l/F6ueik8kqOdxAdYUhUQuLmWI/4wJBse4I9sOfZWSef75By
	L41vJNcUWNb9GR6aV3qWCQWDOOOeOZxjO3jhzP1qjBFAlXtiyrbYS7YdCQhf8U7bCOEmf/MscgZ
	Qx1vX4Tj72grhaPwVsgZ7sa6Ldy4dgVtDng==
X-Received: by 2002:a05:6a21:511:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c3ad9dfdf7mr18354263637.53.1784600456831;
        Mon, 20 Jul 2026 19:20:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:511:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c3ad9dfdf7mr18354222637.53.1784600456428;
        Mon, 20 Jul 2026 19:20:56 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41001457eec.24.2026.07.20.19.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:20:55 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:50:36 +0530
Subject: [PATCH v4 3/7] media: qcom: iris: Fix bitmask test in
 iris_allow_cmd()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-iris-code-improvement-v4-3-4395bd8acfbb@oss.qualcomm.com>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
In-Reply-To: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784600434; l=1251;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=iUPNcmr9LcDxjiMweUrnUvGUJcwSJce63MellJNuucw=;
 b=TRScXKpClXiG8jp38leP5YesLIDnBJ2yezJTPZCidndYva2SQvbwWcaFo/W9j9ejxhCybxjYq
 D/SXwxbbsHdCrbrvl88VnUTMHQVqMA9hUIPth3+E589wDPG4Ef1uBLB
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: 3FYHMe8dacnwzg2ScwFxgBoBtgldvTHZ
X-Authority-Analysis: v=2.4 cv=X8xi7mTe c=1 sm=1 tr=0 ts=6a5ed789 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=qiYeaxkneK40FgSAABkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX9lJ83ZX+YbQl
 7k24NK8O9BULFLxLvkTBx3CGaOAHexug6DUfMl/T8URp+nyfiTI3TswFylabObBp6V55bmUzJFw
 nEa4fyg69bPI9B209EdfBpoAOgZwSPc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX/K7KJDj+Tbm0
 00Jkp7OGsm6oLS6G7z2JyOv7xWF8LJyUiod+vGEKv39XPwTsxwj99AqohMdLnF3I09zEUq+maCf
 xDuOHZRSbM8VkzBGSBKkec25BOBDgpQ3hAyrnJEFwJ2z9QRqU6zKYyyW2rTbr47pcsRSJXtV2KC
 vlDunVIPSI1XbjUDAc+Y6xpdBbQOshY3fIcj/O4Ts4+pBsg8IK6AWSOtnYIFZyf/MMm+fA05n/e
 31fKQijiSSLRnvKmAvg8shgUNzXTkejOwRzIux3Upy9LuJiHhijc13V3hhTAtwijYJqsOg4OK2A
 luWp9llwI40YZA0XlaYApTnp47wftzpSEm3FsmHNjIi7MaaF9bQ2PAuEnBowEtTKwTFqPZ2sMhP
 yFvG/5WeT8GqWWqRUehjdCZIci4IcerLXJ3bxXOktwNnhdLEE7iPv9UfWE97hLZ7C1IHcy+IPgI
 D3II9Oew2MVgTKHF/8w==
X-Proofpoint-GUID: 3FYHMe8dacnwzg2ScwFxgBoBtgldvTHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210020

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

iris_allow_cmd() incorrectly checks a sub‑state flag using a logical
equality comparison. Since sub_state is a bitmask, this allows STOP to
pass when IRIS_INST_SUB_DRAIN is set alongside other bits, violating the
intended drain semantics. Fix this by using a proper bitmask test.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index e991f34916ec..5552725c614e 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -269,7 +269,7 @@ bool iris_allow_cmd(struct iris_inst *inst, u32 cmd)
 				return true;
 	} else if (cmd == V4L2_DEC_CMD_STOP || cmd == V4L2_ENC_CMD_STOP) {
 		if (vb2_is_streaming(src_q))
-			if (inst->sub_state != IRIS_INST_SUB_DRAIN)
+			if (!(inst->sub_state & IRIS_INST_SUB_DRAIN))
 				return true;
 	}
 

-- 
2.34.1

