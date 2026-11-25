Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585276;
	b=3MzRydkW6q6isXHYrsZfPxkG8GXnfq3GBfDa8ne8XTuPOZkLn4nO1BeDHOc2LxLXvRab
	 VXX2ehEVLfEUi7OO31fc3uhGLa9Xn6RUMSYBH7cm8+IJURPwrL3wNEfJxOsnHd3p5T8Lq
	 xtbEGSFttCn2YArhGgm+lpKcsmPSBHpcosRZAvmEhFoFl0vnh8APlRy94youKQzkhRVH+
	 bYxipnDApOTCilL8LR8BvE2PTjmEqLr76xINiKB86Sd4MOp9tRyKe2ni8ZQvTaVy4fP7Z
	 1uwFl8C6qHz0p5HAcfexQpqJzdFs80eJQIIu4A5fTWyp1PPnanKV0GWvW493UX3tPhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3pM1+ScPXqw2BSd7iFdjCVQ4DP95QrCl2A1gDu8xmMU=;
	b=Mw5Cel0FEJPbbrOpMRUOb9eYcaY86hvwtIK/EG/JqU4WxFqYTClb4xnl+K/YqA8JLMxK
	 RMPwdkj3dAIcUILQkdR8/UJAeEOoSUzQ7pcKnTppwmQUvTEacis+bjrcWmjTBE8yjcTLM
	 acXgytvQEm0P2k2JhuTw/VFzfplSVqLv63wnyCcMbhpbVPTxYtXtU5VPQ5KfqcD9KaHMN
	 mP3XNRslKoNI+AEHufdHqt0KPr0mntvmwsRa0k1QM9P6g6oH/TuYbzqND10L7DYBbgZ5D
	 xJGAxN3OfEYIGebuxYlGY0HTQs5vBCD9cdBsCJnGUA9Up4Tz8UpS/ZcBipXqhA6R8VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AusBAkfM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCBoDKKl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3A1606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F3A1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AusBAkfM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCBoDKKl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2BHCi3015086
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pM1+ScPXqw2BSd7iFdjCVQ4DP95QrCl2A1gDu8xmMU=; b=AusBAkfMHl1r+Pey
	GwvG4cf7cTlD4JHKr+tNZoG6HHX9yxfzpFOuCDkuNM8T+LVM2t5BQ1dDgWmAQMIB
	i1ISQEv60vTzZ0MgncFv9DhcH0/XJz9zp+nIpbZD6lo+RtMyItC7ndbujQyxO6Nb
	0nAyqAs04AdHuxR7TU5C6GmFj2CBU1gIbzF1APyQGZNGTu09J+8wDhOGP41xC8zD
	B04HJm4GPxVQGJUsFdiuQLpIrvwoQ0dbaan8nwZvO9EqM/8tdjYaWDgT54cjDFLG
	qSB8Ou7ZeJt83UQ1SuKsNzvhiy3Ft2O0CXr7ZMOwLF3/OHsLgb5+p6mmRb9mKKsx
	ECqwFA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbh0qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:41:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b427e5a37dso4329371a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 21:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795585275; x=1796190075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pM1+ScPXqw2BSd7iFdjCVQ4DP95QrCl2A1gDu8xmMU=;
        b=LCBoDKKlEpPLxttzRJD9cG3vu0X6hWaSXLwIX6w308XLhYIo05T3bvUK86bIWge3aJ
         8DQRfLprRpi/QQqO1NuBnUR1Tgus/e7JNeCmVy09HFCRRfNtIB0Tu5K9vv+7nOuhdITe
         HjPsfN4blPOzSAQhd9qlMZSGcZsty4fJMomuzAhUxPhHmdcwK2hD/SXbszVi1SmRpfHv
         IUklut4bhPQodq/sb7moEin4ygtuGrxbaE0UHswhtXeQOyZTkrjS1WUp2yOskaOd/8i3
         KRVomLymggbl6jn4rMBqlLdUhpB88yglQ81XUyLQQMe23S7mj3pjN5On29VyZ/Q6U2Cb
         j06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585275; x=1796190075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pM1+ScPXqw2BSd7iFdjCVQ4DP95QrCl2A1gDu8xmMU=;
        b=W8n0AIcdn7UxAFfYcE1FEYD6Mwy8SIXK/RqQjetkQC/djEC0mHsfZGZ/W4NvRBc1ue
         JEhedcTGRHrNHdo9Nq/iJUXeSjRu3a7yEHzrfu/1gr4HWSHQOLesCqr5DwyP8g37HwID
         /tunfq70s3+rqnl2vU3EoNPd4QuGfaHWTOUV+V9rCYT+l/8xRDdZddD/HT1gJ4ukWFzT
         RsLFCzGfu85Inqa5QyU8QnWqvJFy0C2+/AL92/9W8NH7cHNddAWMZ3yXH4eiDePQJATN
         R5foHRhhIXOp6/ny2Si1kfYPsQXiz/4juIcVDJ27yhBeHOBBh4tg1Zg0kkb/SmZCWPRL
         1Qvg==
X-Forwarded-Encrypted: i=1; AL+hErHVqqE3TQc3/tTgVeCglh1UGdqbW/40aBW4xCULR7uRpqvk/wNEGuqHhxLfVhnOhm7NFXKgCJZk2JrB15ny@vger.kernel.org
X-Gm-Message-State: APuU4Z+eY7CXvo1QA6Ka7kycOQ/mFKYR2CCpXu6qhVmYaEUWzqcdo+Mq
	xqNNogm83QE+hK5NkrhtmBcGqY0rwpV7yQheuzONLLuDAI2bVyWWce2N6LZPkxFUgX6kdW+23rM
	snH8UtB0dgFIjjhVavXSnTwec4NyMJwlBTNl/RYLc344buPgwsO6F+nQMYiYA2r5IB7zI
X-Gm-Gg: AZFdTZcq82SuG0YVmGHIv8mm4o3I6xoeRi6ycI2I5GkhrcUlkskXQC1wMEFWWyzE6fN
	o7P/jYRmWaTsaqLrEx7JSKQ2B/mNoIn7lM+W73NEJ+EJrX51FL9OVccDvjsgE04sNAFE9L8YEoT
	rBbti75RN4DzsLLwbTko0ZC6NcfdOkb4g9xALxBKN5yrxVc9+RREMX9mIQfO1jSK+UqLsRLw4hz
	/B7Qim+pnnmOTe4Qnnso8O27Seezg2LRpZlbponoBcm5NdSgJ52Xm4mKTlzHIwdkpqqIHh+l9MU
	dW5MtsHxuryl9KgmmvLqzstpPfTW7dWcyAbg65IiWlwyYpiVNkeb0ejLrziMjPo5i2rl+R2AvLh
	tSszsUpTmRQzT84A5rtV0O6Romt28XESuSLD8liCh2ZRcb9PnExARCLArsq3kMuDq1Gtz+V5VRU
	kQMR+fobU=
X-Received: by 2002:a17:90b:2416:b0:3b4:c66c:ba01 with SMTP id 98e67ed59e1d1-3b4c66ce8f8mr3546457a91.50.1795585275025;
        Tue, 24 Nov 2026 21:41:15 -0800 (PST)
X-Received: by 2002:a17:90b:2416:b0:3b4:c66c:ba01 with SMTP id 98e67ed59e1d1-3b4c66ce8f8mr3546438a91.50.1795585274577;
        Tue, 24 Nov 2026 21:41:14 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm28897957a91.7.2026.11.24.21.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:41:14 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:10:25 +0530
Subject: [PATCH v3 3/3] media: iris: Use firmware reported count for output
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
Message-Id: <20261125-fix_dec_seek-v3-3-66c9889def2a@oss.qualcomm.com>
References: <20261125-fix_dec_seek-v3-0-66c9889def2a@oss.qualcomm.com>
In-Reply-To: <20261125-fix_dec_seek-v3-0-66c9889def2a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795585253; l=1538;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=xyePRasdnpLsafhfZYAx9HOTRZfG/52xPinQP+y2ocQ=;
 b=iPakmyqAO5AduAaevjMNoFxhFbaFX7qUHZiYjhXidrOhyWzhIML7MtHw5cow5op0EaQK5rDOq
 7k4/USEpMHCDHAL/vKyO9BYDcEvGq4Wus3UhmjPlsGulp9LfqqF0bZS
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfX63XJEWDZzO1C
 sHOjjVeGru/PqWKyY635Tx1LbNAXIiqNjELiGCljCNBpk2G7MPNRgBttbWufflAx4yrwADWu4Pt
 +ibD35rk+SSHKo2YcbT8LnN8fLwjIV8=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b0674fb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ngQ_FiyG7nPeVDEeuhEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfX3hOv+bmk5IgG
 2RFMzPuJfHr03X556aYZKGtU91p4WnGGESM10X3xwq1373QZUezrkB6inWUSkL8dhNQ5rfzbcWr
 pXD/N72hO19rRydUYetUpaWDmFkDYiPkBXJpYg8X19Be4tuH10iVXPqUnLGpoa42Oo/Ynshpbnn
 o8WW5NrP0axOWl5Bs8PmwBIqZ2jQ3iCK7M0diComPwM/1s8rxkGEiCiL+EfKkjKrw2F2vW2x29Y
 D0oeikpkPxir6CBECegS+VZFJ6M+9IVLgWSJcCUKF/Xa0WJdd2TY7UndUgDZYdGKfi7VU1lnxLw
 n8hp818wsfC54j1Tv7WPXgxENwAe34eziaLeJ1GMqBd7Lb+DvRc0rwy6G5a9CqxCIF+5l7Gez9L
 7gG5SRHKSRSRfBqbiTID9i/zPCOI1YKmzF6BviI7LSA5EjpfjRYs2Qtst39j4D4wWKrf3xDh1Rr
 8uaQIlV8HmEkbGmwgMA==
X-Proofpoint-ORIG-GUID: JjxUflvJo9CYbPXoy4cRfrQsIfa1OtOZ
X-Proofpoint-GUID: JjxUflvJo9CYbPXoy4cRfrQsIfa1OtOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250022

Once the firmware reports its minimum output buffer count, the driver
still caps it to 4 for VP9 and AV1. After a seek, the output buffer
count can be lower than the minimum required by the firmware for VP9
streams. This causes the firmware to report insufficient output buffers
and the seek operation can fail. Use the firmware reported minimum count
without capping it.

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

