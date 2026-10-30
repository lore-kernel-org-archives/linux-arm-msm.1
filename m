Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391607;
	b=5CMgTPgk6tmEnjje1vEKNcnVkUIr833fM5XuSk4qQfEFiz686ndrazRU+3lltpwnOZ1t
	 JqwReCbGZlTJ+yZaBU/rEj8N5S7sH3ZJwx+v1eWO9FTwzPWoAD1UgbVXuU9dR5bDG8v3h
	 csBmaSuFUhibuFP5i3X6zVABtudFkOiCk3iyt/CehlMKNN4z5gqjQl5xmC2KAc0xr5c7D
	 0RGdiv4ubmEiARmXJieeXS24xSULaQ4WddQVQk4MeK8OHmSF+V6aSstgdw736zsxh1oq7
	 gjEbl3Byl3FRgxwL+0KxDn052yfhboJE7lqMyMbBh/8pvA264/qIi9LEcWHvAsyDaqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391607;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
	b=xjGx1vF6qWB8nQyWQePgPQiWBSAAY0YFf9n8ILQU6i/Uzl2g3VhfAw3cjm9GRRf5d/oy
	 PNckQA615puR0e0ST1tHl9x5aMRqH9D4Wt9Xtd5hfdRtW3VcMX+WsGqdVpGJ5rjMOYmM6
	 rS2Ohy1bsK9QOSAQdiMXEzIljr3gx5WHDov7u+M94PQxxcC813yJOd+9rPnPkSyxfi7RA
	 2LHvY8pOq8iKu9riL8r1evrFARCu17fFlL71cG93uWRsYu9w9AEW+lprIFAyo6Nu8Mflm
	 2Z8lcvd4H5rlx3vIF+WbPkf/Nl+jmlWb9Nryw95ip3sSEG/8C5soEQMDI03PZ7hq2pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9PCeNAk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MZ56mWVE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5832606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5832606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9PCeNAk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MZ56mWVE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIiVr2514375
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=; b=c9PCeNAkIQY7B6SD
	CRKBDrmMKqxNYarijMkARimArCFg+5WcKzR43Z3j40ITGS8sxFfqbOtG0JZcbBg1
	mK6Q9NTbvljTcErpe6FCShVXCqo86BSrK0rrW6W6neIIMOA0AntP6Zismkhk6GgR
	aG4mpfXZiEcwLcGa54QEPuQcElxWkHmRTGTSozemjkoh9ScZGgyJFsbuJrmwNkU+
	IsWuNF40mS1vbR7jLwu1BYQAIA7t27W/u69v3CjxAQT7WTZEX/SMO7fSPZ1Qc6jV
	3Xjcu/KfwfJKBcY08vxGlvgW8PjidnE681izC5H4drJEFTJZ8xMHC2BNT3LRg+cc
	VYosjQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0sj88rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 20:20:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so2533902eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391605; x=1793996405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
        b=MZ56mWVEppdaZz8RCG5V/ta6hnwFCY2RVJyr6F5wCcSIpgnvf8pABCXeXnEz43n5BV
         9DvlPpzCBqXlCAQpRTZYTy1ARnMSvLCb/WapYtHMMY0+eKMgRKSt9ONqgd22IL0SBBaK
         U9sykCf64+RM9L100is21PZtQ0VQR2zjjmBl69QQsh1fIulfimdHWf6mAAsXmDO1S4si
         sG50pak4cfYUSq4/JTLTFeybQNIZwmyb7MGWT5BVCUO+JMrxJBjqdSxQIljQvp4CKpef
         zPZ7oXe5wU2FLfjlRdXviYq0Tzp+A3as7nLaNHuBwbq5N/YNK1//hZoJivMVObZkti6l
         Obsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391605; x=1793996405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
        b=KqSbeS4tP1e3+52lSMwpmTWNseTtKSikt0VA2l930pW37fBKae9/DAM1uhxeEqFgfL
         Omm1R4qgFUZyS6GIlNo0EP38cpERNz2h0wx+PU8iJZ6DHTM1M7pS2ugugmYZrZunaelu
         7nDIn4eGGyVNMLOkC2mvY+oYet5voy8vF5oBXM5isRxEsu/hhhnamXvq+VI5/n9fOH81
         PL0vLbcdfXK90Fn09a0G1Zb3Hc4AMrjkrvGDqIz+o63ijFmgPvmEX0ZyRwRZk+5ty7sT
         O1rf3quRHj4J/Fkplpm+EOsQnLzp74fdycLebnxMpJi8MI76B7gCGejbzv6jzvqQL2u/
         N3YQ==
X-Forwarded-Encrypted: i=1; AKwUvBysBlGJzkUY0zTxKOVsRvf1CNVw+c7JEK3q9tZszGCZagmCod+GDwVUpLoEoCtN/x9ccsUd8cWZ9xjHuth/@vger.kernel.org
X-Gm-Message-State: AFq9FYKq9X5c3XF/JNnB1QkbASQNaCLDoD3xDRbjk7l37YaSK8ePt+tp
	7Hz1ViE6Amfz3WwMjjLMWwO68HkY+kn90J/g97KGi/aUrqitFi3ZPtl2POseyDPJyEUzAf3Na+z
	BPDzD1KNowXiNLB4hdyJznpxa4FlPLNhjJ3g3nxUSzG3Ck49QmW1XvBzpbHEGIXKxeZsz
X-Gm-Gg: AYBFou3N9yNZate9NsDcOdg23zMc13QM8CwRC8RCdXOWSzYu5J/73lAClqwVsXEKFFD
	xhy8K6xQq5RmwIHoJDMlGTGZ48sizc9spFnW97uqWIDVXLFgb6BObDh6Xyu++BgVR0peL6gl+ce
	/oiXvGe/+798u1z6P0P9uDnQ/SZm8rTvnPxMPGXyalauDgpluj6W7sp7pFUg4yJkEeiJ9fFPEA4
	HK2cQ2D3LzCQ8mlvhAkN2d+c4yUfBSYGTFORJpANf/5cKe8TgjV2IskkarCV2s89H3TzJQ9zR5Q
	TPNkGZznm8GC6u2t4MiKo+C8ei1irfLw8X/W1t2ONKITZRPGLkFFZBN6HFCiP379pqUu0akCDqo
	J1ioMkBbEEddH+E0OZ2jj3G0WF5oasHOiuudspgY8UQ2fgKWNZDX7/f9KStdsGALE2T9gt8CUiq
	NgAk8Gww==
X-Received: by 2002:a05:693c:65d2:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-36a423bf43fmr4432690eec.26.1793391604410;
        Fri, 30 Oct 2026 13:20:04 -0700 (PDT)
X-Received: by 2002:a05:693c:65d2:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-36a423bf43fmr4432655eec.26.1793391603841;
        Fri, 30 Oct 2026 13:20:03 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm9300197eec.0.2026.10.30.13.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:20:03 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 01:49:11 +0530
Subject: [PATCH 3/3] media: iris: Use firmware reported count for output
 buffers
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-fix_dec_seek-v1-3-cfedf0c267ee@oss.qualcomm.com>
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
In-Reply-To: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391582; l=1644;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=w2OxykH7sbFu9wsbTswZwhTlE3jYoJAIFTL8aWVq6mc=;
 b=/7IpBs82XJf7ZOkyCgyvFgHeKM15bwLLOH6zmIi1T1B6daJbr34n7vn2DkScsKUm+/zR4obkm
 udz9xSEoYXGDRx55vAjNN/Gf8K2dX35xni5P4a4WOyhkmfiTtif480u
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: r3GY3nta_i_f1pVLi6KzsY1_KpNbfXY2
X-Authority-Analysis: v=2.4 cv=Uun2pOwB c=1 sm=1 tr=0 ts=6ae4fbf5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ngQ_FiyG7nPeVDEeuhEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: r3GY3nta_i_f1pVLi6KzsY1_KpNbfXY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfX+RF+lP6qlyo5
 4NMAYhb0/NOwgGCzNXc//K0RS3izAscRi+Vw3mKEVUF8ia39+ZrjziLZSR4ydDHkgREsqlSTUWJ
 WKjgRTk6bFhudxpe9tetOaQouVVnphn0fGfCkMvmCBd3li3ooyYKnGs+w596/x+3jGIbOCPBqSk
 MmnBzHXHHGtUtYmV48d/+CTZV2dgXteGHsif33E2etarEme5NhGICBXweMq0ayyPjlsPZq9ppJu
 X/Zbqr1sggwXD4JBxPDpfvt7q3WdT2BRb51UHbdFmnq/09QcpH5jjtXmfX0ENQr2sVpR3CZC1qL
 397PeX751LyweXOmPPjQMP1RSt4jV15piBuPk1rWnmVHksrYFyWrNXCHRMLvgzmtRM1ZdMUM4PZ
 /0BmyfOfcqd+ZUiYG21qXPIABLnE7Nu8T917eAc1L7bSX+XYEWTxii2Ycu17hqw4v33J02TkDge
 oCz/4e1aiC0DGuJkrTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfX8azZXy7PER3+
 YoMQ9hdoB4ZtOGUD2OzGMEgnWlywIpZuLGbB4POynMY2bZP8wOTDXJAlbgzKutnu01ktqTnv/Ak
 VwifSgJOuVOBHQ9M+K0lI/jXCE4OGms=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300081

Once the firmware reports its minimum output buffer count, the driver
still caps it to 4 for VP9 and AV1 when split mode is enabled. After a
seek, the output buffer count can be lower than the minimum required by
the firmware for VP9 streams. This causes the firmware to report
insufficient output buffers and the seek operation can fail.

Use the firmware reported minimum count as is. The driver calculated
count is only used until the firmware reports its own requirement.

Fixes: e1f5d32608ec ("media: iris: Add internal buffer calculation for HEVC and VP9 decoders")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index a8170e5fa9e6..57467c952f42 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2375,14 +2375,8 @@ static int output_min_count(struct iris_inst *inst)
 	int output_min_count = 4;
 
 	/* fw_min_count > 0 indicates reconfig event has already arrived */
-	if (inst->fw_min_count) {
-		if (iris_split_mode_enabled(inst) &&
-		    (inst->codec == V4L2_PIX_FMT_VP9 ||
-		     inst->codec == V4L2_PIX_FMT_AV1))
-			return min_t(u32, 4, inst->fw_min_count);
-		else
-			return inst->fw_min_count;
-	}
+	if (inst->fw_min_count)
+		return inst->fw_min_count;
 
 	if (inst->codec == V4L2_PIX_FMT_VP9)
 		output_min_count = 9;

-- 
2.34.1

