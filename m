Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550522;
	b=2glViK11MzSsSlzwPhIgy6C48PPbEPK856X0UNIoxBdU+Ao+wtEdq5k/0AsxHK48z/ym
	 DNTzv6kopHJDiFOYsWmCRyq8YkmoaRZdmrt8rUklzT10dHo74CVSl/5kBAWbocVTD4hRn
	 XoWw/XghCqr4s3AtODBGTOjqeyhMh+BuamhejB70P2l290xjfDgqXf2Vqi5mI9JvePFSc
	 IzRDUqVk880ZhrT0d1+F3lcXvkWnJgWx9ryqbKS+EN0zY25rSG3IxPvH7HxTlEnBWb8a6
	 Hc1ipaW/p+V6B0X6hTWF4+Gl9LkwSDd5vYRk58dXDWovrS1TEPikQjp4sSV79QFM8fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=szDrJxQAF0h7/bry0F1ZQYYjoU60aFZwm9Ntl7V970Q=;
	b=nHBN64d+amXC4Xn6uoZLI1Y8Sh8R4WlntjI+HI0fFX5fGd2c61LSBcuGKGEsDmR6fK2t
	 ZCZqwcO8EVaHE1KRr7Z4/JyrsPmx1CINlYBHud2DeLdM7rb80QreOW0ZzOdVZi27DWPLL
	 lEYXJDlWGD9CiLCWc6cDFwIpligclA+SYyg3juAROh6oJQEBFiw3lpjFY/SENiWS1vnap
	 /4KcHk5ndihUNGaw1WO2pnnkb5vPMYJzjDkmTww5H5RMuHmTiSrTuEryyy+rmB4Il6j/Y
	 IORcFeU+5jeezOB2iZv3WE07w/o0FXAlJlaOPJiE31OQe/ZD497l7BLn5H2Kz9Mqhzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QJiHHMlD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KQXtfLVg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5149C606A68F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5149C606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QJiHHMlD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KQXtfLVg
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIY6If1651277
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szDrJxQAF0h7/bry0F1ZQYYjoU60aFZwm9Ntl7V970Q=; b=QJiHHMlDzapIWdkw
	3kJBFanukFtywHVqWJkFZ8pMzcNzIiD8OlVllzDuXcCLoVGTTO+vqk/dJn8Nz4Ca
	lAUrqD988I2rWLzgC0fQwmIL3CtgbUDBqE7bjsADOMw+9ufRud2+dIvtdFfFaUe/
	5fUM3Na69D53s57yqMSK9PabCUey/cxL1HRwXsRyBhkUtM90A5v2wuMMFAQRO0EH
	ofPAj1x7CKqwoFAfQhsjjQLXudHvuP5L8QBXDLzq1ixCtkUZNSnJ9VCwiUIESc+O
	a/hj3/hcxFh4+3kyFhTP1dS/aHlc7oN8fkGMAK+WHGhxHLmfXezpDAb9boq4Ac8x
	5eTELw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpks4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:02:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94964828890so60175685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550520; x=1796155320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szDrJxQAF0h7/bry0F1ZQYYjoU60aFZwm9Ntl7V970Q=;
        b=KQXtfLVgSRuiGkrIyJo4CKUwXkPU5l0IQaM2NEHzCOk35bWWnBZV/7bMcxfjDSiBJx
         ZGGRZxB+SAKAo8nEfYXkMn2nl34WN6fSgIdCApyXxX0nQEkF9rZvC+ck7dVyiEuzNV/2
         ksv5lATugpXgthF3GsTleHzhEli3v1edeE6LPIDEPisXfloOffiTuN3e3WMObPUrX9GK
         GmtcwuI0Ymwc8vn7aoHTOr/eKrvBrV7Dlyu/VKnuZcn5hMceHQH6rfpZZLmM3ShjlFc3
         3QEYeklw03DkS1rectwdnUCE0dEDVMAXz3T+Utj3sL3MJKkJETjYckVZElC+S+NSMpFc
         ruKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550520; x=1796155320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szDrJxQAF0h7/bry0F1ZQYYjoU60aFZwm9Ntl7V970Q=;
        b=YGBdZTAYNT5g7WfDtuQTnSj+zFKMZ056kqlviheu1G2HhcY94wlqY5mK2woxugMW/t
         4PHaSLZdpKrlP/SF3RERUxI8hm3YSyii8f1V7tAif2WqOZ8Jiz2R93Bdmj6Bo/6APPVA
         tQxtjzpKSiLoWsurGeqE7fbokFye6DouA5L9sfl5bvO7bUmcLGoq4OS4HNuvXRcLRJC7
         HuzXHxEpscPBQ1XCV2ZFhJWAD7dXQvfuX40tGUVxZ49kYVsXZU0GhCD/2SaaBIdoued7
         EHTJq1W7gpe5JUQP35iEQSqaCJRCAsp7HfdBCgUv5vOxEeR4WSg5Zc+I3hmwjDuY5FMW
         KYWQ==
X-Gm-Message-State: APuU4Z/qwgP+WQp+HTqImM1z91FoTnqjr5W47eIr83+JL4fQEVRu1pNb
	XIBm/NSV+aPNLkR3Q4kmvhF2B2nw9iUnZOBXBDT4ozt30b6U8Wnb/Idugt1/+/iVXiclKNz0bSs
	bH6YjlXVFiCmGMbqwFB/2NWmjy9R+5ttcmwFRFqRvrltm+7mhIeQDjJaWRTySHMiEgzGT
X-Gm-Gg: AZFdTZegNjFd2TFvy8bcQRVtzOlQ4sqNKiWZiT/9nXdM9yzLPLMgRgZCrdRKXA6L3lv
	JgT2FTOszjnsfbMPpQmVbq+CM8lJbcbAPqjA++aJZ4j49WP7iHd6A2cne1ID7HZrA4eLOWEUGJ/
	xFD7wlzrMJWhDAG8WOhyjeJJSf2BZhb/1YrGjDVwUbikhbdrje3X5VT0eJV2058GlVgu5QtVUJL
	PX/cEKmBODhreyH9JjU2Xjfq4upXgrv4NU2mFNVtcFM764SzdshgTmjarNfaTEJR9TpUXxQPn6m
	Ny9OFf2jINQblBuTL51nBaOAh2QkehfxJYANh9ALr6gMHhEbUP6idLTPedOMTPBGlc6B+JONstH
	Q8mognmVZ2MVBxMx9wRrSEm36suKtrcQHHLYN22MZXQohen3k7lS1UYmVECW7cedeoqFYIjH5u2
	aEFeJ44Mw=
X-Received: by 2002:a05:620a:8cd:b0:949:821d:98 with SMTP id af79cd13be357-949baa042abmr2854459885a.4.1795550519883;
        Tue, 24 Nov 2026 12:01:59 -0800 (PST)
X-Received: by 2002:a05:620a:8cd:b0:949:821d:98 with SMTP id af79cd13be357-949baa042abmr2854455985a.4.1795550519390;
        Tue, 24 Nov 2026 12:01:59 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:57 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:35 +0100
Subject: [PATCH RFC DNM 06/15] thunderbolt: nhi: Clear ring interrupts when
 not using MSI-X
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-6-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1901;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=lQhH7OQzf9VgDsH8cpaKlHzic9O9I/E7X1/iq/ZRsf8=;
 b=itTnkK6xsIu1DWfmtZAk3+81tKnNczIoJxWhHQHf6wPBNR28LsV83Y7ssCJJRB4lEvbsjUlxZ
 PRvOcCK/TYtBA4xVMS7KVxT/taKfbc2x3oexd1gRRm50KBZuP2nBW3X
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXwNfP95ibmH6V
 pKVFW7XwSWuj+M8gXdUPkjcJRU1laYKwWvq0QTjJlSAn5tYmncSJBYEiynZl1jvLIKB3yaPBHWw
 ce649ms3bpvtpGf3i3TdU3mmRw25m4a7KT4ryLf2Ojt8xgMf7Ax5lYE9IW2r/zFEh0lT+drKC3U
 oTMa+J9elNN8RzUy2OFrO9dOkFSoF0KDEOjH/1wFEWWK69DPFnITPr8LxCnHyJBL5+fJvVkfb3q
 V4sIuOTtw+3V/ZlzikpTdn0XJ4HSpWC6+Mrd3ML1mXkVfvruQGjnkzD5QEy3CFl/FWAE/f58tZU
 AjWp9RjgVkwkhK2ouM1xWtlA1MvYeLOAr2N3v0ymJQ7jWvZF3i6kyP7EYZLN9+Fxx2gxsqZPF90
 bSoUeAbVyQs7+nonad6EV9gQp5urTzIl4qywGrCXO4k+WckLaAkQNik3V0r5vPJfZJleXLpiK7h
 OVrr9pBuIjw28hCdi8g==
X-Proofpoint-GUID: yva_d0nU-FCTL_0mbX_Xrm4O3EC2iN4v
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05ed38 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3EEjJ5KKZ7fs_CpJeu0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX8LpaC9Jx7gGA
 n0N/0VAgFiUqFTLVba9zG+V/C5x+ZAgnXyLvwY0xW13r8Vn3e08spfiPXy1ib9Tr/7Hy+fx18E6
 56T4HtxhQ3YsUFKBOF24sLgTEPXv9UI=
X-Proofpoint-ORIG-GUID: yva_d0nU-FCTL_0mbX_Xrm4O3EC2iN4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

Commit 468c49f44759 ("thunderbolt: Disable interrupt auto clear for
rings") made the hardware stop clearing the ring interrupt status on
read for all routers except Intel ones, and added an explicit write to
REG_RING_INT_CLEAR to the MSI-X handler. The single-interrupt handler
was not updated though, so for such routers the status bits are never
cleared and the interrupt keeps firing.

Write back the bits that were found set in each notify register to
REG_RING_INT_CLEAR, before handling the rings that they belong to.

Fixes: 468c49f44759 ("thunderbolt: Disable interrupt auto clear for rings")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index f54ab2189cf424d04a9ec48576efe78283a83138..e48521482c021c7f5f73349ce16519d6088d3250 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1036,13 +1036,20 @@ void nhi_interrupt_work(struct work_struct *work)
 	/*
 	 * Starting at REG_RING_NOTIFY_BASE there are three status bitfields
 	 * (TX, RX, RX overflow). We iterate over the bits and read a new
-	 * dwords as required. The registers are cleared on read.
+	 * dwords as required. The registers are cleared on read, unless
+	 * auto-clear is disabled, in which case the bits that were set have
+	 * to be written back to REG_RING_INT_CLEAR.
 	 */
 	for (bit = 0; bit < 3 * nhi->hop_count; bit++) {
-		if (bit % 32 == 0)
+		if (bit % 32 == 0) {
 			value = ioread32(nhi->iobase
 					 + REG_RING_NOTIFY_BASE
 					 + 4 * (bit / 32));
+			if (!(nhi->quirks & QUIRK_AUTO_CLEAR_INT))
+				iowrite32(value, nhi->iobase
+					  + REG_RING_INT_CLEAR
+					  + 4 * (bit / 32));
+		}
 		if (++hop == nhi->hop_count) {
 			hop = 0;
 			type++;

-- 
2.55.0

