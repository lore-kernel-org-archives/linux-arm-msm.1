Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304710;
	b=TTrbNXK7T0UZou+MicfvNaRX/eZ3F1y2kacUr54FPzokxxO6575+KUIfHEbwFbsVv6Xq
	 Nlj34+1d5mGfH5B8V6mC2ceXJFe6y6t8vG0traXhWEmE6YJn1/7GJ4oQtHoxt70tqFMuM
	 IrNfVjuiGVcg+4OAs1NOop9Q5F2ivcSst0nQRIYjUfJbB1MLV9tT25SsrKcEXcs6t0reY
	 Ax3MSg/QklYwqnQry2jsNyVg58WOsGec0nJAJZJ7UjG76NIVj+TmL1MDimOxbki8Qjrs/
	 vIhyfuWodoUiJc80p4j1p37hsfSIdOCT4OegHwkw67HDSpsqVvJKlgGskIw/giLfHzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
	b=4IaS4grPm5GZiy/szQnHWw250+lqEdWgrfc/UZeKO2wz3Ph0ifOJU6/SKFwbbAu34fcr
	 BgknDV6xvfP0hrFugOTbjxTMfPEpXsriX8m0y30PIKwjCdNAF7fuuUf812ibsxcYy1VHk
	 xGQ03ohDJr1IFWBw97YlXt2mBuWLBimYJuazfcibv5PHSqBZB9QGdkine8R0EEixQ2agh
	 MljTFgdHzYR2Y1p2WNGwYDTPkSJU1wST4vS0hpCP7319+YUuQgdydZJP3eBC4o6u9oslg
	 m4xA5bPDyDm4z8L7forBP0bxKoWQ+Z5iPXN/0F8GCpY5aDY6iY3i/5Eb0l+gy0nsGFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nCBIJFac;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxArq+YW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008EC60A2615
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 008EC60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nCBIJFac;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxArq+YW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l5dH1155050
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=; b=nCBIJFachyn1nAcM
	bfTG/ySiVrCPW6gSlwvWhLPoutyqyBjmCNVsk8fhT2z+jPiTMJBCGEiZyw+C8cVb
	FoLFQjsRVP9oNrcaRr+jkwniThjiV7ovDqRpxxVAIY8j05mKOq+UpgVT8jMcYI03
	U/VAunD6PTxnFsvqSb3SBiqX8Dtqhr6RDMeUWKhhlNl3gf9sl33uwxmvy7M4CBCK
	KkHKKMrQFUNO9T5IESADpSMEUZxGtnAklT2bYDJ1Ph1+Bbh4NR+hEdBqnCvuy9QY
	SyUONvR4jdS2edncRq4nezYLHMqHuniIp7w9Lf1YGrkI/R8nQj+nqRSEzZ+3ms0I
	F4B4CA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49jus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:58:29 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso1049383c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304709; x=1794909509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
        b=YxArq+YWom/w/tDrNMK2pE9uxOiRQMMdH8tRBNf3E3uYjNnK4DVkBCHLn+OSaUtcvz
         Uztw4K/OXtRhw0ztN2pYWFfNSMPsBbVGegueC7g1ovsNTpjjkt29UMvQxjBeN+ZH+Guw
         W4aFswJIiEiuPUTmNK7K2Y8at7MMV7uBDhIBXN7zMVHINdiQvabtGNgWWvLHuqmJOJmG
         NuirCR1ob9AfyhuArWE6bZS1pnw5p8mg/AALOWah2P/WRRIm5TbNgCsl70qmvt+qvFnB
         hxs/+4iKc/Em5N/mPHGLiON1yp1C9tCvThbAesUS8dZhahmBFLeuEBQshRHzGYDedYLd
         pjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304709; x=1794909509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
        b=mj0147+wjQDXRkRJ04B+YkyecymYoLw0pp47pRRCJkUiZCdHFuKXzytXA+Qn/bDoQu
         Tptq5bo1Yz7sFX2/PLApS+RUW3AVjEY+RLZdMagbwsDA/3z1A/kydCH+/kTEpNVqnhWQ
         BWWYljrbTXHRhziY1BJ9868P+g67I3qF+vTJZjVrk98yH1GkrQ+i5VqzodFV3KfrT/fz
         LBD5YXfkRd7Bxv8xWYJ4L8OxIagQjC22GPMH3CNZshcCoJAmJo8KWzNREoSwq87HGRo3
         X0LX38IUku/2K2OHPFqMoA0zLY9uY0HIaUB8dpzEEti3bEqmagaTz8wNOly0xFPeciUK
         iulQ==
X-Forwarded-Encrypted: i=1; AL+hErE0xLnLXRTNL0O2Ft9f8kx685po8lSU7w7dSudH0XS95pEhKQrl5AUOAdPeu5yUZ4C7LzzdehuLOfo5+TaT@vger.kernel.org
X-Gm-Message-State: APuU4Z+BWxKQa1qFBUKco03NSV8WEUjmw3Z31R6drbfOSyd+hTz98pOw
	XF9GGA4pzTTNbkA7OccnFgHi82v8yEgSkZg+rtmkjBUuxAgkO4AcMrfZJ8kJ0Oyv7CH8qhqd4Dq
	iLYMx3KtQUIQrPyDCnH5G0E8tQXSczGNpYhcvb9lRuKrl8S4FQg4pK7ka45vcIuwlF7tl
X-Gm-Gg: AYBFou2JNc+CcIK7+3S6inXTvj1/R+1CUMb6ulj8iYnluaguXu6kHUCM8eFOFsEFfe3
	JBicGABBEGX+RpufL8Ma3k2BAvtBSWLbad6CGpC/LGuANZaSX6Moj3LjXG9U19lAASol5BxydIA
	GCmfjgWKU41Oc0Bv9vWEtz6eHqb3+NbhSAkSyFKVB6bIyxx+kLUdYEVFORbPIGejPcous1MAmoz
	GdnC62hbbj+pDS25sW/BFTvf7N3TCQ3vGTe2+kVUAJfRE6BHPYQBMVWQQKKzJj1ROF4krdDb6zl
	P5zNSJG9G8x/tsp2PQ7Z/YiEosusLCcE3uO2xiW7uz9j1qAqrIX45kmcO7tKtm+ddJXZsaCMvgd
	b+yxtg7aFsFKRk74JKswjDXcyxcF8KNko64hSoRoF1865jN/AQw8sYbSvwKOmaJZ+K8HnZD16bC
	lRx7ut/A==
X-Received: by 2002:a05:7022:3c18:b0:181:73fc:e53 with SMTP id a92af1059eb24-1b3b617f6b5mr2779903c88.29.1794304708419;
        Tue, 10 Nov 2026 01:58:28 -0800 (PST)
X-Received: by 2002:a05:7022:3c18:b0:181:73fc:e53 with SMTP id a92af1059eb24-1b3b617f6b5mr2779872c88.29.1794304707825;
        Tue, 10 Nov 2026 01:58:27 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm7333141c88.7.2026.11.10.01.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:58:27 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:27:15 +0530
Subject: [PATCH v2 3/3] media: iris: Use firmware reported count for output
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
Message-Id: <20261110-fix_dec_seek-v2-3-210d8c4fc31b@oss.qualcomm.com>
References: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
In-Reply-To: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304687; l=1644;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=w2OxykH7sbFu9wsbTswZwhTlE3jYoJAIFTL8aWVq6mc=;
 b=dnMxMPuhvVOA5TkV/Y8KsSgljPBw02l4Bf1/AwRdFsliQ35CijLJMXKxTHFymnUYrWUOItdbA
 HiE0PHibsA5DyQdP/mIBIMC97Uy1hR8/rPC3ayDjMvk0ybhLtqAHtdj
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX1ww62SW2umXP
 DCzFisOaaeMgFkBNX+OOjO0Pvsz2xpv5B9Q98W4px1psbfyKL1Yxsx41wYkqdbaGpn2eYxxdAkP
 KHtx1n4mAX/Ae31jnPjJdSKryYED+Xk=
X-Proofpoint-ORIG-GUID: 14HZ_ZIj4B7zEjXo5DcnyL38VngTw8c4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX7DEhtl1KPlr5
 noslYcAgvkP6fnzSFp8ETSkgNNOvYVMVGOUnMN4v/73jjXqwn17jDBY4gGY87QvZlfaxqjiUl/A
 d3PWh4jXkMUeOMGOxgC8YtrXjdJk4vVe9nUpObBGSsLOpOcb63QBuHFH6VT234V5TTDbdW7798r
 7NVFIab6z3H0nRbRXcZIOOVTWXKotvSTLEJGyorEnmXB7yXKrw49jYOdiyrO8TofI0Tsy6XQxH6
 F5Q8GvxkETx0TF2ASobT9EfGb6bDU2XeZHdX50eTu1hXY4hkzujhJ0NPHps84D+CttUCK/eiC/d
 iZ0EeBdBjKH/+sZfL99qbVbFoVE5yUZbmN2YVgs55IoBv3ej4boH9Qfz+Z7qx+Vgp7iZeEi7P0r
 AzA7yBvwyrT9vSjBxgrmctJLr4BE7Ju+0w/7NkbGcKNSJb0fJD9TZLXrG7zQvuEz26ld15e84JC
 SJZKzj2eP5PNSIOM/mQ==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2eac5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ngQ_FiyG7nPeVDEeuhEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 14HZ_ZIj4B7zEjXo5DcnyL38VngTw8c4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

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

