Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBD730CDAE
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561325; cv=none; b=WEeNYnPMC5th+jRs2H3bcOl40RtEEI6zaaOSKWywkhiWGWSBuQBRmjOlNSQWv6BAhWVI/ivCXEKIWTdAEV1StUDDBvw+Gs6TzptvJb3wYfrKZwHm1n8wgXmukV+z35mdSqNpyJcK6wYz87jK8hQOD07JWYCdIKVVWfUYEacfDNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561325; c=relaxed/simple;
	bh=Fh0U7sMIW6hPbu1ptOh7cjtI5xaXS8B2FHqFYudohIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DWeCopHGWVLEci0jLRSD2WDzqxa/b43hmHe73ukAFI1zeNAy3FM8A2S8aS8EFTdhWgWGbA8qBKK+EcfqttYzSwPpVxQnLlGo/nTC8yxcakNvdHa7RoqV2CQAsMJAs0q8yWH9Yeg7U41cUZK3JA4bM5TNglqvN71zIjz2g6ojN4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p59rONlb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=De4HVfcw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p59rONlb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="De4HVfcw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KFLktC3173964
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5fEus7L86DOsI5/3aaU0WD
	w+ulHua30Vi25algOmNgk=; b=p59rONlbH8p8KNLjkuAw03bdfR9eC6wIyBIMSl
	L+AdQG5LyN8uBj92AUGmqqqnv+fkARFoJPP/HGBD+UZf43o2zLRC95vc4qnZwH2U
	czi1hoeiQYs8g7GVTDo7t8Be/G/fm04uyBZy18FBS9Bx6nnsDBo7vj342Hnlv9DT
	SdxADDTfWlVkyARqYzH91FxSlUOgfovY5Ke5UL3Yy+VmYi8ab9mgs5w0s3dSZ6Lz
	zG6r4agLJ511T+EuM4QtdpzfD/xOKvVzvzHLVGGT4DAAGPlrxkSV65fgkYAQP20Q
	3Xap/CbVRBCMiH3+CE88yTlX6q5RxLMJdZod4z6d14AGMaAA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcj33g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:28:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso1413544a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784561323; x=1785166123; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5fEus7L86DOsI5/3aaU0WDw+ulHua30Vi25algOmNgk=;
        b=De4HVfcw7jg9HAyBoL4MEmyM+vmCwjgYCo+GCG5OgS1PNcZNmkdlP8B1qBlPiV5f2P
         0HuvgWTvpjemW6VET/5ZYAagKj+6Gw6Ki4VvQiDv/VLt2+seqy5Z3wCAI6dqSW2QkcMZ
         XxPye7PiGh4Wi+FvCgKdTGu0cnoUreaOCo4PPiqKxFVx3rHSzEAS+w3+KW+yNWph0icN
         5Rwgck7XjWnYDfVREwhvA9/a0IbU/rlP6+YGSRZMCbPXKBu2A04Vo0Mm2JNZ4kmHxdbf
         Wscg27sNoq1wYwdr0VBe6+iTtKi6DrwH1r+tXQoiWd4eI43v2L+ZXsnFZjFL3EIIUN04
         6MYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561323; x=1785166123;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5fEus7L86DOsI5/3aaU0WDw+ulHua30Vi25algOmNgk=;
        b=BJxxQrVTjQ+cyghYc1aMxZaTo8ZUa+GZ1hXFM6yxGOj9xReZo+y2uA7vOTDPOi5lAL
         cTnuubr0b24p654pKLyD0KVGo9hGB5papHsCMtu7o+N6Yo76L/tOCT6CQS9oegnZKaNP
         owXH99QtK/7NQQ9FA3mBlE5qekWDhLCkmsBhc3tXQwSK1DSWQhLtHRc/+HwX+SyxbsP+
         jldhuXa36a5N/r7cHS2tMZ7K5vq3KpBkV8VbO8HMs6A5RFHVWte+JfZdX3AqXdVCfass
         mtMZcTVzLrXfTvBlibxG5XPloEqcEfjO4YmEC7AIcA6mWfD7O2zGh4l2veL5Jf2swPHR
         99xw==
X-Forwarded-Encrypted: i=1; AHgh+RqZhmxtKW0n+748U7UJuJDY2REJijC+meaw/wctKgQfiWakLO1L2QT0BFcAWGmbbSgMWuzFzlS2alJ6aADp@vger.kernel.org
X-Gm-Message-State: AOJu0YwKZ5Oqwi9j4lGSuweedektDshndQ0yWj8lQwc+9PgW41yKN0K0
	7+XY+QQJjp2QWgZOFUYKMaMWuzGqzHuIEkNkrWzdt3mG9RrQ46jmh38X/BXf6dnJvFNwSiXZWN/
	BSQ5x6RiT8Q50hdcDgMQVccAKNFajTZ+dn4ewZyiSpEK8wQzTZMJnHdbRiRFNP5adN7na
X-Gm-Gg: AfdE7ck/2C4tMY6/j+4htivmZ3MVjl0JeB0zrCSwh1TM2e0hGDgm4A3ODIxFaUMWcCO
	dsMB9ecDCyR4nqhtEtI5nyztMzbKPWt59DWicfi1buA9FRfzYD+vk9WNqnCFsODBSy5KKk78bfm
	rEf618sduTNsUzhU7+LlbWAHGbPWVElrXzxJT3yFzO+a98qDZV4se7gUhyOl9NCZB8j4GfDJtul
	gBtGFnB1ZzjRhFm/XTmf0LyvwjOVWySHUa8zf52l5a65HE73U4LGUUTh0K05Kv2vLQu8VdA8kA1
	KVjMImkwhWNziqV7X63hXPX9aNJT0tMBsTBU800HMDKx1u54bTbv7yHDIC+DM9Dk0RMWmYqhGEV
	J9yP6Zg9YY2DyRITRBYk1z3qp5az533PRjNcizaDwN6wmDNyybuJR+qMUEgT96BA=
X-Received: by 2002:a05:6a21:4a97:b0:3bf:e3d6:ab5a with SMTP id adf61e73a8af0-3c3ada32d32mr14787773637.52.1784561322763;
        Mon, 20 Jul 2026 08:28:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:4a97:b0:3bf:e3d6:ab5a with SMTP id adf61e73a8af0-3c3ada32d32mr14787733637.52.1784561322196;
        Mon, 20 Jul 2026 08:28:42 -0700 (PDT)
Received: from hu-cchiluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a129f3sm29717182c88.7.2026.07.20.08.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:28:41 -0700 (PDT)
From: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 08:27:34 -0700
Subject: [PATCH] dmaengine: qcom: gpi: Fix SE ID and SE Protocol fields
 widths in SCRATCH_0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-fix_se_id_and_se_protocol_fields-v1-1-e41dbb107d97@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGU+XmoC/yWN0QrCMBAEf6Xcs4GkYIr+ikiouY2elKTkqgil/
 26qbzsPO7OSogqUzt1KFW9RKbmBO3QUH2O+wwg3pt723g7OmiSfoAjCYcy8r7mWpcQyhSSYWA0
 PySZ4548nT00zV7TPL3G5/llftyfisntp277nH08VhAAAAA==
X-Change-ID: 20260710-fix_se_id_and_se_protocol_fields-d7f0fe616596
To: konrad.dybcio@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, bjorn.andersson@oss.qualcomm.com
Cc: praveen.talari@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com,
        Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784561321; l=2217;
 i=chandana.chiluveru@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=Fh0U7sMIW6hPbu1ptOh7cjtI5xaXS8B2FHqFYudohIo=;
 b=wFM6YcZDVnc9ydPhXoP7oo5q1/cE4+u0spg/P4QCgS5PY0vxUfN1dwL6GEY3sW3o48/EwIzBt
 TQrclOlMd77AbURP/QT7EjIrDJBTm2IWwYlPgn3OwGOnduTzDMW7sDb
X-Developer-Key: i=chandana.chiluveru@oss.qualcomm.com; a=ed25519;
 pk=JOK6siShQPtXwMyPXnFlFIPPNGXclzVFIJL1EuyLmy4=
X-Proofpoint-ORIG-GUID: Z86Tmj2Ug91HhCmPO1WBOKtzbAPbjEj9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE3MiBTYWx0ZWRfX0ICvNsWyT0Zh
 D7ZAzBOYgB+sKmHEFupKIsqO8NKhwU2NCcOufFjrWY8AEPz3aKjma+z7ky/nIYv6xGdTvoy9h1k
 neJxSYPUA7pjNPjk8mEQyjyiU57wVL24O2/8bWWlPaIVtgAFGENTZfq+SMH206tQM6YytYk2PQQ
 JvyS1ZKEEVemoQimgPnnRuxPl8lABBOfN9NqgYqKhsRVdDH7emZJ/OT3eI29kk4kYsKa3X04qY5
 4EnRw9MUTFKX/LaJ90L3ixWOSA3UgD0nKT9OhRigPEeR3yXAdWb4aUz+cCxSf/IyPrcuK7VvUim
 ygDrwGch4s7lVT1U0CHn4SzG8kvZcLlYz9fcwTrAjUKnl2gbU0HaqS0DfOUBRQkMWqdBVxSPT/c
 a7GAsh577Ba+mymK9dk7ykUgwAgsCcsGBcSEOaeFgzjpxzGIWA6cD4UmPYFfD76LSBfcOXDtnOa
 /ddenIpEr4D4rlfrj6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE3MiBTYWx0ZWRfX1pSDRbuorzae
 lkD8+8gVeU7Z5k7e9DyCUJAqKIvfzZp9zOS/tTvVYF9eXHqreFm3JJoLCeMaLUEavjdRRfxLYox
 yNe3QB2BoG/z1IvNekVCBNSJTxqBLEo=
X-Proofpoint-GUID: Z86Tmj2Ug91HhCmPO1WBOKtzbAPbjEj9
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5e3eab cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ptTHJtPLR270ybZWXd8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200172

GPII_n_CH_k_SCRATCH_0_SEID is currently defined as GENMASK(2, 0), only
3 bits wide. Serial engine indices >= 8 get silently truncated by
FIELD_PREP()/u32_encode_bits() when written into the scratch register,
causing the GPI channel to bind to the wrong serial engine. The
channel allocate command still succeeds (it doesn't require the
target SE to respond), but the subsequent channel start command times
out waiting for hardware to complete the handoff to the (incorrectly
bound) SE, and gpi_send_cmd() returns -EIO leading to GSI usecase failures
for SE8 and SE9 serial engines.

Older documentation, such as the SDM845 hardware programming guide,
describes the SE ID field as bits [2:0]. More recent QUP hardware
documentation defines the field as bits [3:0]. Use the wider definition
to match current hardware documentation while remaining compatible with
existing platforms and enabling serial engine IDs greater than 7.

Also update the SE Protocol field definition to match the documented
register layout and keep both fields correctly packed.

Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
Signed-off-by: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index a5055a6273af..8f09eaf4e714 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -207,8 +207,8 @@ enum CNTXT_OFFS {
 
 /* Scratch registers */
 #define GPII_n_CH_k_SCRATCH_0_OFFS(n, k)	(0x20060 + (0x4000 * (n)) + (0x80 * (k)))
-#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(2, 0)
-#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(7, 4)
+#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(3, 0)
+#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(6, 4)
 #define GPII_n_CH_k_SCRATCH_0_PAIR		GENMASK(20, 16)
 #define GPII_n_CH_k_SCRATCH_0(pair, proto, seid)		\
 			     (FIELD_PREP(GPII_n_CH_k_SCRATCH_0_PAIR, pair)	| \

---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20260710-fix_se_id_and_se_protocol_fields-d7f0fe616596

Best regards,
--  
Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>

