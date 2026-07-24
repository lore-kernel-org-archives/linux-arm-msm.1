Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AAA41CB5C
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889365; cv=none; b=rgcc33B23oSuCS75Rkw4KnhQCBDMv4x7Foe9jTN+ZFH9bqhofPzSMTYwdthqgPUWoRyYKfaoKlR5vkLxEgOeuWjen2W/TDJUZfoQ3H5VD3ixjWFRNoU7qDmGDFq/f2ZYYDrkmVZYrFTW6LK8YIl+wjDmmxrqroQsgxNeTRx6LuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889365; c=relaxed/simple;
	bh=mjrVDz4H6RpOYzrPpqqkMT5INmyzNFeOGabjHCl0QJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYp45gCf95nuueBSCY44CZbprSDBSXjxJVwCC9PGMc0CcNYQC33pmoN2N7IgLmCIPhKtW5oZMxPJS/Uhjxa/82SfxM3YdT2FOwPuIs38GihrDjW4IRbQucMb0+qFEg+bces08F3xzVo4w0iC3bHY3pKvMUeGCA1+bhl3DoIO2Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBwJi0nq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yh/Les1j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBwJi0nq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yh/Les1j"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADVon2720577
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4fjwuViaOd7s23k+7ReVdvQjEcM0iippnZxvUolPq4=; b=DBwJi0nq+e0fEKVk
	HaIPfq9OxPG4QENN1e8F5GYFjFXfwXc0ebC4+7Fr+WXpFtmyUNVtK8EOMAL/Pq/+
	IHHth/tl5NeO6WsHzKM8sSVS5P2KNkmlXfk0GgHRz3y27MHvph6ssdvQzjGn/ptr
	9nzZ7BZA2zzzfF22V9s3YteVAzah7FLGvp9oI64yT7NpYjrQUzztgIisFraC+0gc
	YOriQs03jvZ52ODwUmuqx9oPgM3FjIRsXJH6v+lggSA5R/0/e7HeNDbjcO9X/paV
	9BxfS4kByt7deyW2lho/Y/uJiGMe8pby0BdhdUi7V1xT3uZHhXusYVBbhCgFtEGs
	mppKPA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yag3y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:36:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so432356a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889362; x=1785494162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4fjwuViaOd7s23k+7ReVdvQjEcM0iippnZxvUolPq4=;
        b=Yh/Les1jP2Gk0srBRrmbEoKYTaH3epq0I7UnPhrN4YYQ3Q+CM9KIbGFxlUZnaLXwEs
         nePYJaKNtT8RUoAf/v37KFe9dJ0f65xore1hVkwLPho6H42j9ZPiqifcXwMsqKIv08fo
         ffo8dDH4FbOHVlk2B95dfSyDl6A7f2+f+/nG6e2mJ5kStiD8kfI7rb7OOXbMHC0qSucE
         h5Fz7JFF7H7pnSuccNGCJVkhP4T0oUyI95wZxsM4Gy7fqJrCFNBM90iK7viy3bAp0DWP
         xfYsHZylfgebN98wi/6xmKfa6QsaFttOznEd1fSC9QtNWuoDpmIyXJGUbMTgQpfiCEgy
         ba5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889362; x=1785494162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4fjwuViaOd7s23k+7ReVdvQjEcM0iippnZxvUolPq4=;
        b=JsHrI2CCMjLkvFvbMs0LhiJ/7+L4v2flJZ1k1MLQdtvp5W3MkWN8iJpkYys71AkLSz
         NeoDChg2wnHfwHuLlHloezKLTbtIS2I1P/kNBU/IZEUFHX2+xpT7HK0RzWAJ+vGTLDU3
         2NzDurEjjBbFDPF/BV86IPf84Ph/rr3Z1pZ/hAr7Yt8ZaaSpKfggKH6wfYeWeVRwKNHi
         ZRk7CurzcJ/4aEpQXFMtnda2NNPAr15uDW1Yb0WCWYZp5c/0oUVW32nYM61G0GfnQuKN
         WCTHr2IhGeLSAp42qpDcfM1Yy8QIvUrPDOxobQCMOnDhl0MwhVcy6IHiN3YxhwlTCPM0
         hlMg==
X-Forwarded-Encrypted: i=1; AHgh+RqLHHgrZxTYvKVsh8qbliuT8j1/30X6VNuRPSSnfTiq6qF1f42eKmI1/L74IcPf4pY8lDtmfcDWX/qX44qj@vger.kernel.org
X-Gm-Message-State: AOJu0YxaUBecrtHUZNdW8zgKJzplbSAoB5/wWZq2QrR4YXYlxMHbrfBO
	KhWGgXt1cpfeqwWHkW1RZeZf2dAz3cLdWxFM9twBS4LcphLdemEVRXKDypQ06zUAxv/tWq51vm3
	+ysU8PeDcxjfWxq1hOYDZynFzCYa+276RGvsKiEZXuHnBCKzJ13xGxZBSo00lqc8uOqe6
X-Gm-Gg: AR+sD12WySzKr/6aliKfQKcDRm+Heyz6rE0SXWyfQ3pS+IgJfmg6JNnHG5wBBU6M4oR
	Udd4n2fjfa2i39aAnmW+GOPSUV89jcZL9g4PbqXEl1g8uJis7/5TBQWcXqUJgHiM2r2cVdWnY8W
	4eEy3kM2e/lrubd4Lpq61GQYcSLJ3PEMjcTHWcC6BZ0Zj/rzM7pHvzrpc6GWuMxuVp79cXUIUNn
	QG+pK1MmoRBIGgwc5tivJxWLeB+FMj7Bb/2VxVZpkRVPFTJ2d+tB70528/1dzuehiAiC70pPY0E
	zQe8MB9ureUjn58Xz4wQBDh2AwY2XJNw6+YpfJ79aDflp1lOZnxIUVpQSaDc8D0UMQEg65KXP7d
	HU1XVAvrNLOik6QI37EYMV9NCXGOJR2s=
X-Received: by 2002:a17:90b:4c0e:b0:38e:8050:e63a with SMTP id 98e67ed59e1d1-38ec648af5bmr6238212a91.6.1784889361640;
        Fri, 24 Jul 2026 03:36:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0e:b0:38e:8050:e63a with SMTP id 98e67ed59e1d1-38ec648af5bmr6238187a91.6.1784889361209;
        Fri, 24 Jul 2026 03:36:01 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm1228657a91.5.2026.07.24.03.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:36:00 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:05:50 +0530
Subject: [PATCH v6 1/3] media: iris: cache work mode after computing it in
 iris_set_stage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-iris_multi_slice-v6-1-a99d160cb42a@oss.qualcomm.com>
References: <20260724-iris_multi_slice-v6-0-a99d160cb42a@oss.qualcomm.com>
In-Reply-To: <20260724-iris_multi_slice-v6-0-a99d160cb42a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784889352; l=1459;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=mjrVDz4H6RpOYzrPpqqkMT5INmyzNFeOGabjHCl0QJs=;
 b=VNRdqHUXVV/dn2bCzZkN2nv6+aQrFjmZYsgSIns/bCndJwNxmoTNXQkA3NtNbFLHK7StokB5H
 mlXIesa53ItBNQ8JDZLK5fbGV+GtisLtZY3jETf0QolifEpCG92flq8
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfXzWpsSyJQQ03b
 1aVd5leVjbkhOn6S54zAskLTLvO3zhd30Fd42qlwgUsaMf3av3oo9DbO/v4FR7A5V8ZfXv47scW
 zTMTL/9Z3AeyNGF2RX7kBRULSltk0qo=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a634012 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DQE9uWRhMQBL0dtU3VIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: CrcNmNhlFrGi9aGSRKiurZTDBwTdFL1b
X-Proofpoint-ORIG-GUID: CrcNmNhlFrGi9aGSRKiurZTDBwTdFL1b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX0Y0u7DtB8aSt
 Tn1+ZGThabrQ2BSMmiuDx0AOEm7ESvaRGwJOZsRqea5JrjRMLxIZM4sMw3NCszGKIQXOEZ26JZc
 fwKdUj/YqM0Y0zafz2RWDNDfJ2hBj5rGkbRL3SkAGSW2uX7V50uVRgghkz7VCQmHj3fnBTg5iXh
 wvyQWQCv8Uax9AmCCZ83V5UCJpEMx3n8P9pHxRkKeUrnEmi42UIszWO0K4jZJAi3N/5ND6TzJ48
 q8NuoHSrUHf8i2UQTJP6LkRvYmY2FyDU79BQPOY/Cq9ebBVsjXXeoWB9SZuiBjiByCleNS6QTJs
 +ioJLEv4SRV/x4lPUjoNbERgdqvTgUg8QLLQCxzJBbIl7jWDUXSMa0P9PkcsVGr8N9heIBrRvxW
 Kdjvz0ZumG6JWu+Zwb17l+KG9/0TewoUKx6fGWQrPVtCCG5S3ZjSOfyRnBPr/KIs8UIF+2SK6Vd
 m9lY96n5Q+PpFxOWbNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240096

iris_set_stage() computes work_mode and sends it to firmware but
never updates inst->fw_caps[STAGE].value, leaving the cached STAGE
value stale. iris_vpu_enc_bin_size() and
iris_vpu3x_vpu4x_calculate_frequency() read this cached value, so a
stale default causes them to miscalculate buffer size and clock
frequency for sessions actually running in a different stage than
the cached one.

Update inst->fw_caps[cap_id].value with the computed work_mode
before sending it to firmware, keeping the cache consistent with
what is actually configured.

Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..58d195d2ab87 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -521,6 +521,8 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 			work_mode = STAGE_1;
 	}
 
+	inst->fw_caps[cap_id].value = work_mode;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.34.1

