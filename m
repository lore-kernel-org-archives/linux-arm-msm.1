Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817816;
	b=lg6Qz9po80d69SmJ4iyYZVketgNquZAHOMfFhA2hpqEGsCD1UtBoVJ5dc1egq+YLR7DO
	 OV3unsZf8GNNcQYsAWb2YRYxo791TdKTG4bGy34KsQC7mJRu1p6vB+a8nHqEzgOA5nfB5
	 KERlpnvx6nbEOywYX7Lx6fhTS2wUvypRHice1sPH6bYPfF6q5as9A0+TdOI3988xd5Ikb
	 AmhpJqxfaXGBhlGJDyz2m70MhmQbkJ/d5u3F4++pMuUdFgi86gcih946vm2Qfr67NmhoQ
	 giW5eefakxMcESbdsxQ0zAALwEbEko6QVGolcfingvY5tzIC7STIDj/7RKFr1l+hJwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XiH4baBnWC/m3aRdIMCh68KiTniU6JHIqlW0xB64jDY=;
	b=uNKr9mlBDU1gIVms4Gp4wmXaQe8U256vbjimdh4Wqh499grNMxHgd04qy7PkWMAWuk8q
	 6xHYADUKVaPsg2EZBSMDQdZNJVWN1nNd0hPMWssJbpuVakyOShoXog4sWnmwuYOG2uL26
	 TWl04eWIRzY0Y1SIuu/p/S3J3UtCwrw+wJHfVLq25FON1xtuuK99MWUn2NzVtn5nyismp
	 fzWcDGBO7Qqy1rfJjgCQwIjubKyOPaUxTnDx9E/KzbXK8D1g5UQ59WoPgSns3jElvb8TU
	 k2oBNDuc1w8PHwPKJoHQT0Bb/YIuJeyE1OU2pIYhDbHDdFvOwxxtxk6I1guFS0gVJGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ojKfRVVS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhyIPJXv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C40606A337
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 18:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25C40606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ojKfRVVS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fhyIPJXv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjCXu2251557
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 18:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XiH4baBnWC/m3aRdIMCh68
	KiTniU6JHIqlW0xB64jDY=; b=ojKfRVVSpWvqmUUr1V0En7hZRSwDJG+sd32w4V
	qLtPQsDE3DLnVe0Unwa+HC9qqntrfFarpxcIV89P/yMQ61BBfEK4YdRgsyOygZP+
	nT+tDhQahE5Os+T3xhDPlZgP8i977HtXq1PfeenxreKJcThA5InSMDDtXra+A9ka
	trEKFnfX+rbAtbsPv8YoLbLdcHYUsuF2EAtql+kqvwbhCkmmjD4ht+IBPf0Cg1V1
	WJ1QJUbwYbqAaXrILDZeTTp3k4b5HbGG2xTcvykPwIaagjRVJfAkaFo8NviQ8lP0
	sO0iYuDdaY7UKa/fAFpiY1cRMq9gGkCve+PhyvmhwZQ38oDg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn1q1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 18:43:33 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaabe26601so77497e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 10:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793817813; x=1794422613; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XiH4baBnWC/m3aRdIMCh68KiTniU6JHIqlW0xB64jDY=;
        b=fhyIPJXvVjJoLvUW6Nu4GkPEUjbFg4C1JwlqrZc+1dt78g1S4AgmYxtAFJv3us+jXS
         CnXA6macUIEnNSNxu/tqa13DV9RH6fdHZ91JlqYKfP21oARkfvHJfZThMtqO14HDrgf/
         Bdff0Uvdq9+JtGiffelPRC8wPeo7/7zlW72VHOePjKwhsAX1MbA9jWvZXl/kiH8tCegE
         5CyRx+kgTnFK+fwjx/cvhecP9Gh4DgAMxcg/+ZcUIYsiQz9jh/cg4tPL6TbQY0RezckF
         0+xGuo39YJoILt5nSXvHnA75ymxVmSmJWrizX2buyhhfYXrU+KG7eGwUzqEiINr34rut
         mc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817813; x=1794422613;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XiH4baBnWC/m3aRdIMCh68KiTniU6JHIqlW0xB64jDY=;
        b=M53f85w2XgeCPqnaCES5LsYCAUq7tfsjjK0rmVlXekAfODBxFJqYVUwambPdk1Su7v
         KQ006ywrUmdJeLyZGGSzfJNoeGRTXl/FrFQPGJFg1GQgrS7/lKCInEfVzYmnM5UZisnN
         D79W586amaRpqVAY9pAy7NdlWTL68DHwEwhe6ONlW7zS93XcmLr5GY6dUyPK3ZLW45B0
         d9M9YUwTB5/H6rH+laIZheNWE1KhV4a3Sg4Y4S4YybDQHM+uktt6vHFrCOXLss/a5Knd
         IDZf177ZMfSrJho6w9cGZxJuJdIwnwUx5S/SYvwSuwlOiUFSPQ8Q14mGp0UozbqiHfBj
         RDyA==
X-Gm-Message-State: APuU4Z+QwBr2PwAU5r2Z+jhzQ7ylMa8Q7WBaSYNu2/c2bOGfyDurJ1h4
	EOKQb5KL7ytMByTxmA6XMsYRwHky2Z/WvJf2mw4GOeVhpuw5GgpdG+GyRb93fyErzxN5b3gkK8d
	XSFeAbulb191XTu+jQnsY3puTxnJKQRxssREiQLSPex8LY6IAbiZmoUxvyrp6aQH5mHeAZULaBi
	oP
X-Gm-Gg: AYBFou1CxQBmIn+8CAPqMcmyUjhl/SdUsZvx3gcMPxRQQcitGBIgJhVfrLV+vYZta3K
	6grN8jHJ4OIiACpaEFrqGitak7k0w0MAouizqa3c2etLyYA9nOH+5/1pjzzoZEwAHE8E5h1cTGY
	rBKSCd/zaHb/fv1a8E4D6MBlz9hkpD9Y0Rd610kLFR6oycSZdyuj3ybkqVyoODgSnv2b9PidsnR
	Ps9v2oQjOXqLWzFGqFpTg3CAAtII2TAgaiBeNoeGFQRx3NpcDem7Ynx/gz7TrKCGkiuFuEX0w/Y
	IKOCpgVfmLv9E2PYXWvZFEPLVFi44sX/3szXC7vJXwINtMG/QhCljtfnf1fPThpOZj5k62Jape2
	UKsHzqWBV237xroHuJKVgyyzJTyI0qxw//rZrqI88mdOcTagZ3sDe5HnH6PvmMhEJRA6xaUILzP
	K1iX1YsA==
X-Received: by 2002:a67:fb85:0:b0:7d2:7784:23b5 with SMTP id ada2fe7eead31-7d2778440a7mr1372985137.1.1793817813270;
        Wed, 04 Nov 2026 10:43:33 -0800 (PST)
X-Received: by 2002:a67:fb85:0:b0:7d2:7784:23b5 with SMTP id ada2fe7eead31-7d2778440a7mr1372981137.1.1793817812662;
        Wed, 04 Nov 2026 10:43:32 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:74ef:10f:2593:5b70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm5318152f8f.56.2026.11.04.10.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:43:31 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 19:43:29 +0100
Subject: [PATCH] soc: qcom: pmic_pdcharger_ulog: Match on SoCCP
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
Message-Id: <20261104-topic-soccp_ulog-v1-1-e6e108ad049e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANB862oC/x3MTQqAIBBA4avErBNU7PcqERHTZAOhohVBdPek5
 bd474FEkSlBXzwQ6eLE3mWosgDcZmdJ8JINWupaKWnE4QOjSB4xTOfurehmrIzWsjXUQM5CpJX
 vfzmM7/sB8TOogmIAAAA=
X-Change-ID: 20261104-topic-soccp_ulog-9ac5422084e7
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793817810; l=1048;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=A4QNvGeDnGnWPV+GaiObrVZ6WsDEzvQTxETsMkVh7Jk=;
 b=23KhUZseQ1KUlSrtYr0CZLwlHqYkTsW8AvUoPaqyaFCHzhsssWpTHjoOX7IRA8qjQrOZDITRh
 jSct+3Oje47D4j/PhvNYzATvjpN3TUPepzxJBFXX8tVonWKXCQkqMJ6
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3NCBTYWx0ZWRfX1ZwS031m6hrD
 DWmYUGLt5Hyq7VadiTWri8bQg0mj3qcu95SijwNVcKYDZfPHXN7iVg7QX9tuHb0iF9kfqsj9kES
 1NyeOwGwoOGHx8n1JD9BW8oRsV7rg19epvYTNylGNlwyinuulGc+m/jiYfAU9uQ4bQLmT4J9HPj
 RMqP5nuQGqErtKEGwX+J3vNhfPZO7ZZwjEnNTBVB2HEBBCS+0fWZrnQupLn+Ag/Fj2hqFToHzGG
 kYX7ykyrA9sEvb8NpCsMU6Z4D1RMeXX+9MB1VuJNSBFU24jNh5xL4bqr0GQCnyvASxfuNftAt45
 yWEsZNeH7MQ7B746maob7gCj4+R/5uRZ3oIJUXkzUPqX75DzV2YhPTPh7yV4+rGtczbU9/apzFK
 L2CrrDRMCXpbzPtMX6qqXvX6ZkQBg30UIExNbew0GD0iyKoWZeQFIVLIZgkDvUj/SX9nSaA+fhd
 PbLEK4Rgjf6cR60JdQA==
X-Proofpoint-GUID: w44rpr2YfqtM0QRyOiGi8JEJ-Fn4TDhU
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aeb7cd5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=08rFbc9rCsAaUF_WoO8A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3NCBTYWx0ZWRfX7PqAxz8JKNVm
 HpMy3lt2h9s0ouZJ2PdquTwJkqArM1DtfEoyPkD2cT4PfVkRNQfBPPs47aA4VQ5kbyxLhKxTEl1
 kezu32fy1Acr4yCnqA2Ez1wD5O/H47w=
X-Proofpoint-ORIG-GUID: w44rpr2YfqtM0QRyOiGi8JEJ-Fn4TDhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040074

The battery management firmware, as well as the logging service, is
provided by SoCCP on most SoCs that feature one. Add the match entry to
enable logging on such platforms.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_pdcharger_ulog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/pmic_pdcharger_ulog.c b/drivers/soc/qcom/pmic_pdcharger_ulog.c
index 06cd9c4411c2fba0f3657b7e4221c1e9c9e898ca..b063c32957080976d8e6428c43663009f05f8ce9 100644
--- a/drivers/soc/qcom/pmic_pdcharger_ulog.c
+++ b/drivers/soc/qcom/pmic_pdcharger_ulog.c
@@ -148,6 +148,7 @@ static void pmic_pdcharger_ulog_rpmsg_remove(struct rpmsg_device *rpdev)
 
 static const struct rpmsg_device_id pmic_pdcharger_ulog_rpmsg_id_match[] = {
 	{ "PMIC_LOGS_ADSP_APPS" },
+	{ "PMIC_LOGS_SOCCP_APPS" },
 	{}
 };
 /*

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261104-topic-soccp_ulog-9ac5422084e7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

