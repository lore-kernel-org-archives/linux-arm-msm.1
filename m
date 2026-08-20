Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C092257844
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236289; cv=none; b=ipQyqRjxZSNql/3IWg7ziIegFK22uzp9J0lp1u2BmZDxYZQQfw0hlYRjdrKaQ/QPRIRfJ/SeeRU4OMms+rq7suuCjr1EEC2mFCZC8U8K79U83/vKlph7xi8Rt3GHKr/cOeMnsvduZtzEqulYymbJRcpA0gf/8j/ZUyhM6Nmzoeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236289; c=relaxed/simple;
	bh=Z1k4/QscsbFRjeAOpRbKCvEmSZmOvbE9dLIwQreVb0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7B8VFgW0xu+5LXw0NIiE0xg1K+mZQ1pufxlslLCRWS4bWd8aPbQ+dlOGYhQstaZIQ/I6AoFHawwFTLE3RelFSS7Os0fnOfLGiT0gznXL66oPbovSoNlRnSPmFwaZyxJCbrN37uqa3ltUY/GaJBVkgzD2tlPAQCsOCKqBZGh6+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzH4VPi9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2jYnl66; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzH4VPi9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2jYnl66"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7c7F3665970
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pdnHnnpqnk6IVbK2wNTQ3gGp9RIqRpV1CeclDNEZQ5s=; b=dzH4VPi9UB2k5HSr
	MNFBA98q6qkkla1VdMxqDoQS30kQ8ge3x0F07cnv2fodoWm6vbVigGLIJhQ7fUP3
	kZdI9p35dL5PS11xPD4eXmBWCCFPdU9dbiM7KRFRVOeUWlHJbbbsCkega7Z8pM2m
	RXeGlTHqW9xF3fQlvfllJWAoCph3MdBt64+CutZEBAHhmPY84qbTc5SwKEWclKeT
	D747SBaf99SutW4XpbGsBSRNOd+bCUXJHObGGkHtu72QBRxlOkTjkayHbU51a7xH
	4ZHriD2CL+GJrnBYXsTO2lC3QTCWR0v3qSAZF05+JaXJGaAHaGcfaWnzkdLfdZnb
	3jigsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg1934d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-933023a5980so373202485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787236286; x=1787841086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdnHnnpqnk6IVbK2wNTQ3gGp9RIqRpV1CeclDNEZQ5s=;
        b=Q2jYnl66nSVhPVHXvxGmuXhYsI1mYMPX8HCQLy0auwIUFFokqx8/hANpqaZMoRfGpO
         eufN/adY4dTvKglEtngbnETcdFkP+xmdag8lmL9KzDIgv9UVUD0Kk3x/am06gik45V9S
         k+ozqwJBt1mPTZBZwPSFgD2FiA+ikBF1jaLV0HLIKEYuoVx4LyBq2A3kxvQciOdxE2Of
         8I5fCxTCH+nCXKDYAyksHUwFxWDwzXUvASQrxx4n88F1pmaiRcxAAElUgcGmOvRtuCMu
         qc5lUagE6iKrK8bBy1cCnjqGQEz0sO69dUyq1BCBqxPaqGI5OaI52USVqFlQE6w2TYtL
         UHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236286; x=1787841086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdnHnnpqnk6IVbK2wNTQ3gGp9RIqRpV1CeclDNEZQ5s=;
        b=c2+9qP8sCzL5DJoQiRJt4OPLCmu8NPF88jbeNlbbY9CbeZ6Z+1QfQoKZKP55UZCJx3
         Vm7ZJ2+Y6lmBVeZX9eK5U1l5bjtX02cwUgphcDPL00S0KHfYF2kaY63DeLJL+CJQPVYg
         XQfDvWOdX09NmaySp/sSnHfB1ujCbD/Wx2W/iqboTaZ8tOdEFY69v1PVEZZ1JZLU4Ylt
         jXFuFZo4fgIA5s7O7i+/g0hMi7A9YOWJaKOhyWhWz/FbW34GvdQXyJc9ST7YbxfGl6vK
         YP1LZfTC9IhzewfhZvMM88WPai5o6ZTzpbPRKj1BbATJCoitShHVhMm5/hLAr5P5pg/F
         iL3g==
X-Gm-Message-State: AOJu0YxkX65B7O7LygQsGYEP5+XCsK7LrNqbFrBZTsbmFjTNX6s7rDIy
	QfqXJRypq84X5G24UJt6aZ+NSNGTgqa97BqqdJFu7ZM1E+3lm1mqMUP4/v8wLqWSUBPCSEET7ry
	piMF4WU/iE/OV+ZSB+rEk87JqVFYXelybD+m7fTig0iwcVF5L1xylzeZnRk4tpOgZdBkt
X-Gm-Gg: AR+sD10puU6A4NczHAhh/rwDb9ZQlYgtxqNRJ2YK8VkD2iihVXhQxazZnnsKkXob373
	0Zj6EkKhFQuaRG5um0VazC+UGwDTD0g2eKaxDX/ccb56qnGTa2WydVo3srbcDtXxNQPdbGtnjU5
	DzfLDFGgJIldyBvU1CXhxnmHMAPjhEB6v9I5dMWHQiXvcWhdkoX2InXEAUzyC9qcNSZp/UiUfpz
	LxOXJvIDrDFNujadig8Tc4d4gynewnrgsjgZdvGIxbkbDKrpX9+vb8ZjolkJ5iUFiYLMkJ9og0g
	I6xokhTZ+I6BlnWhCpG1MIdmoZWpL4UbhcGGNJ1O+ujM9gX6ae1FCyZTBxcPg+bGyvLal3Rb7iz
	yf5NyyJifkrREjEMISWnvffIN5srwe2Lr2NfA
X-Received: by 2002:a05:620a:711b:b0:92e:ef09:f8f3 with SMTP id af79cd13be357-9371e1dfbc7mr1256742185a.2.1787236285483;
        Thu, 20 Aug 2026 07:31:25 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:92e:ef09:f8f3 with SMTP id af79cd13be357-9371e1dfbc7mr1256728385a.2.1787236284732;
        Thu, 20 Aug 2026 07:31:24 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b145c9d7sm15226618f8f.15.2026.08.20.07.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:31:23 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 20:00:59 +0530
Subject: [PATCH v2 2/4] soc: qcom: geni-se: Widen fw_size to u32 to prevent
 wrap-around
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-fix-write-to-read-only-firmware-buffer-v2-2-7badcdc455fe@oss.qualcomm.com>
References: <20260820-fix-write-to-read-only-firmware-buffer-v2-0-7badcdc455fe@oss.qualcomm.com>
In-Reply-To: <20260820-fix-write-to-read-only-firmware-buffer-v2-0-7badcdc455fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787236268; l=1108;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Z1k4/QscsbFRjeAOpRbKCvEmSZmOvbE9dLIwQreVb0o=;
 b=8faUUOqsJMcLEuqNXdDrk/VHeFrVnGtd5XgDfJaeCCOVE3AGqworiWtlugi79fkhuhXOv9Vz7
 tJ2GR55wF6QDqZXYp4DsXAHODZiRPWrppNJfA9Xt+oRL67SxU+U0DMB
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: Minahtuub8DN7KQn9KcGn0eSvi6jO3QZ
X-Authority-Analysis: v=2.4 cv=G7Is1dk5 c=1 sm=1 tr=0 ts=6a870fbe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=65oZO8-CLbckpCt6umIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Minahtuub8DN7KQn9KcGn0eSvi6jO3QZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwOCBTYWx0ZWRfXxoo2Zt/sWEWx
 8gBEQL5uKBwpGW6jFp6vRy6Pkw6RyTkDQQTDHXP75wlj9hRFLD4qqUzZeDQT5GN/Hi7CbNnuy/L
 jJmHvouhX13LeHv0Y6zuPC+u+nLpBzw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwOCBTYWx0ZWRfX8NXRIPSxm3IO
 BPoqAePrLkjKYcZLjoRbe7qAjUo/3iHJTvBXn3mdAjU3wpgZR+CE/zKihwQPVjxBsE4uUhpDKBZ
 SH74hqnTOwhMmfDZrDZGPYGsoxgzEVMOiRCAKSc4Yj8rDkfm4N0S7rNbJv3yog5EycH2gdQpR1n
 Tze5u97zXKauuZsCGWqPNeN1c6Ks3AMrA9oJ6PSH1U7gLl2vT5jJ2xZQ0u4Zi8Ecg/eDTB0LMW7
 Wcui8sre7KCO9g0YiwJbOl6irR+g1B/r2a1dad7eNtJ4Y7ZV99G1y1p3OGWi4drU3+D78NMYs6C
 uu5JN71s99HucLwd6B1FoMJuLGHmis6r/q/76GSpiykYgI1tLLrU+9hCkTYRA1y+uTXXDzCucAx
 RZ1XurNqkW3/cczpFOixKaG5qVREcaE2s2WNtjHqWpPjSaBHlsveEpbhKmTr+a4NBAVj5QVlv2y
 snwyJPFm/qyqXDxm8QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200108

fw_size is read from the 16-bit fw_size_in_items field and incremented
when the count is odd. If fw_size_in_items == 0xffff the increment
wraps to 0 as a u16, making the bounds check below pass for a firmware
segment whose actual size was not validated. Widen fw_size to u32 so
the increment never wraps.

Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 1d6e6611441d..54c0a66d6dd6 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1248,7 +1248,7 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct
 	struct se_fw_hdr *sefw;
 	u32 fw_end, cfg_idx_end, cfg_val_end;
 	u32 prog_ram_depth;
-	u16 fw_size;
+	u32 fw_size;
 	int i;
 
 	if (!fw || fw->size < sizeof(struct elf32_hdr))

-- 
2.34.1

