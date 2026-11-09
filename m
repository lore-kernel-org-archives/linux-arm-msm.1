Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232935;
	b=sH9COg0zPCyHmEHW9DXADTlvBNJWDJ6hMV4nyxChAZJd6aHT+RRoDbYNpHzSXzlvpaxI
	 J1Z43VmHykTgpUh7cBohkkyVmgMJrISOEc7GOFor1apexEPiEW4TpS5k/OMas4wIrfiC1
	 acGpXAjh1fLEWbH7bu0R+qTbn4eMY2zu2ihJ/GOi2m+QD31HAB31aOqjzr+Qkwhnrvx1n
	 EkA9aDdk31g3Quat817D9ZCM9vYmrZGkTFzze2Wr9nOGOlf/HRiBDaazDGBHs8HPzPKbG
	 OKUrBb0B+/aaK8VZKPllV+qj7gFeZOzNmdx7qhpK5gCNuhpcgK/YW77OIgIH9ZV9l1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9cUE3n2XMFbQDb3izV4RNIRB1UH4e5dkhEIQq9VArGw=;
	b=NpiOYnv71EEBHvfR+tIhOg9qykrxGWj6SkoVLNyZnkMToLJDxWVAc7U1teiztonkuMM6
	 dt6pPGYPA7wMwbIJKmUe0hnTlW0a2SoukblbZG7FkjxXdfcnrkGfC16+4aT/DdRkiUNRF
	 zXfyXgBwz36kWsnG7pPLo3j0df/YDodfwAm4LkfIfsoa5aR/BkAZR6iGK+UclqcMt0wxD
	 SOa10M4naTWi3orZDPO1sMkA704xS7rnruHQEst1jzwFwKskn98FfeyS1BBVMSTsDMpm3
	 B24HilllX3WxqiEKCzcH8GZ6vfjfDwdAWKGXmSc3DnEO9KQjlez9dv8fDUfZ31CC0MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kAP+gnZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XekX05/q";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDE9606A33A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DDE9606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kAP+gnZV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XekX05/q
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF2Li022633
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cUE3n2XMFbQDb3izV4RNIRB1UH4e5dkhEIQq9VArGw=; b=kAP+gnZVS15Be3hy
	M4aWI2V4HwkP9Kd3jMZd/AiZfS7Z1rsJZ6C7vXXjBqyb0pcQQ/cif2URj6jPTGN5
	Dic6FlcXyFbjzfZqY4rrg8q+iysEdS29fY5R/+ejNg1ZcwA6VfqtSf4dcsFZ2qfX
	cQHaF9BQL2kIz7AZQr+sAdldki8PoqgBXV8hCxxfqtq5ELTpkVW9OIvVdKXg0fDV
	VzGbjfUNnrBaXVxSy9qPkiW+bpocWN4mlj+CdFni/AgmrkNjBkrv45E1TC9Raj+8
	xBzkrgjZ/lBhli5+mS/Flt/j6OQe/+GQd6xr8MkRjkEEA6HiP/KCgWJRa2G4B4D6
	rSksMw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgkxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:02:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so57613e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794232932; x=1794837732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cUE3n2XMFbQDb3izV4RNIRB1UH4e5dkhEIQq9VArGw=;
        b=XekX05/qzodfTgvNKVh7RQfoRZjMCpei9MF4MZDh1DEXOMMo0hGdLB1CwbgnKzQXEl
         7oWkVJA38CE4DyWRPJueHtZyWIrgZXk86umOerNTwhnfFmwUvGqjWZPhUdvLsjIGCb7b
         g7ey9T95/G1x/0NcwL9KbLu6MgCfayi6Fn6auJDzjsyEZxOp47UImLRQLZ1SDx5by+C+
         RhGa7OXKrpTZuSDb7jTPZ9a8rs0x718UrmWk3SHItyLCZuLHUf9UwxDGQrKZtD5551zf
         0b8QCONi6EPuHShnKx/LDmnlH+IygoCY6zVQrLFJ6ofqn+aCMWT13Qv7FQJdE0AG304v
         lqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232932; x=1794837732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cUE3n2XMFbQDb3izV4RNIRB1UH4e5dkhEIQq9VArGw=;
        b=y/VotK8sCgMYmXAnugD1K9oFsVP087jg3Mz2JyCDy6GNUEiOvVHcFPG/yjlK/QeFeX
         zXus3R3Jq6mp/9cmrkWIZxl7L3tUEZ6jQEPcPj22duucylyOM5gEv6FTq8ChWUzOHOQa
         5PPpedmrMRXnX8L80eBBVAXQFA0pFpseQyFyOPmVgcyX/fNpczzVNYX82BzdrpanpMDb
         dEOsATFANRyqXtXBeiz2XJaE0IUq1UApezQvF3UJGR+Br58jBHV25JlkS8RtiI8ddqXA
         uTDR22ax7bNGpfLuOGSNH4r9G9RxYXWwJY7nUrtrJm4bV7ub1hYm3zHI+WPrE7YADqbI
         qdDw==
X-Forwarded-Encrypted: i=1; AL+hErHxOhP3DiMj52Bjr8SCB1zXIfd6+d/Wde36ef+7pWjKzU0m7ZfAjxaCf3TS7zJaN9/thIEgxnBvPpqmCZgT@vger.kernel.org
X-Gm-Message-State: APuU4Z8GTv43fJF5ARjBXSj6rZLnWWPzvf0jmQ3s/mtJVtwIPmew3USm
	mDAtsdkDhkGAMXZdTa4xMa7AV72hTZHJ4TPvmvL52hNFuPRoPR6DRGSjyKh3JqV7vihMpUigqR3
	xf5+DTPybAWME5FLS53dlPPIqG+rz6vUmgMPMT3ecRxkfZWAhC3QdvNsbFbHSq50Gvw5s
X-Gm-Gg: AYBFou3iE8xvElP1AgPf30o/HqKv3B6nL71kNheMo+uQMCByEj3Nl+gHvNq+Pni8R18
	XEWKCfHpK3YHYDn5dKZVggHZqChAmLQGMaS/Y/hglSE7Ij8co/BndqY1cDQhC3BwS5vbyMeCk+E
	HAqT0gPzGjEIPgL+O/gFL4xvhMNZsb0ztx07Asi0uT2ABsHHUS7PaM1iyNFdr8thtaYoqFkGjOu
	c1g99xO0IDmjgm5AT9qZK+37GZrZoZrU0917hYFoQruWMIweXNsYc2LAj6EKHAx+NFdM0PFNXEw
	PGil0Yu1F6AbwXucq1fuc922jJp+C51+sM6n8Yk8XVBmkg2V5vP51adqHKkpu94bWMCy8KxPuiW
	19vAWdTTaamY0jsXzJYLKjTMX/zz+XdSM0iW4kaPoYoDBwa4oiHlk/tzjyJIpeUsjS4zL+7mO0s
	Ni2rk5JBBn/22T3Lot2AcY1NDrn61u7s5/ylRZeF4M9/w6nOgZp6PtBBaEuwqRxMX4UecJONz9r
	OfxAGAadm6R3LUl4xWbwF1jjbmH
X-Received: by 2002:a05:6122:179b:b0:5d4:a734:fb80 with SMTP id 71dfb90a1353d-5ece713201fmr1021634e0c.3.1794232930448;
        Mon, 09 Nov 2026 06:02:10 -0800 (PST)
X-Received: by 2002:a05:6122:179b:b0:5d4:a734:fb80 with SMTP id 71dfb90a1353d-5ece713201fmr1020992e0c.3.1794232924706;
        Mon, 09 Nov 2026 06:02:04 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f9b5:154f:6aa3:35d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm161515845e9.4.2026.11.09.06.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:02:03 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 15:01:55 +0100
Subject: [PATCH v4 2/7] i2c: qcom-cci: Handle and report queue
 overflow/underflow interrupts
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
Message-Id: <20261109-cci-imp-v4-2-4dc4095dd052@oss.qualcomm.com>
References: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
In-Reply-To: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfXwTTO3F157Beo
 mLQ0CtI92SV84BrVFw1OKmU+VUvE3tUk90k76D+gh/SD5J04NSUe6AthWJqev4IvucrBrW9Xeo+
 oVnIWI+6AvXS7ALqFu4T92XAyXbiltI=
X-Proofpoint-GUID: WlIjznXLf9dGtmYSshmPhU8p4rjI3_VR
X-Proofpoint-ORIG-GUID: WlIjznXLf9dGtmYSshmPhU8p4rjI3_VR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX8pVahYqY6jGN
 p0t41VnmKz51uIe+GtzTWQQxeN9jzFaToiyQhkNIYANS2tw8gWb0HVoE8otKM/uBpfebRb5JGkl
 l2SuU/jmpHQudyxhHMmKZkg0L/Dbo9WYnPV6+UiR0mBOg+GWKX8Ig7hz3rJvKTG73omyYA3DcXR
 awoEjajPzhADNsgZChVIxP6km97rSMd3869M0HsWhFYGZyGlxgonoheBRVgX/EqOvVwXWHmr2QL
 Ogs4SKvkA5NeABhA5Zqdkb+sunknxQkWeZZqSbh2iIRmHljidH7ZXZPXzxRyoKw/CS196hkl6QO
 Izf/yIR6/budUCH6/o55/qC98x3hcEbqoTI8fNitxMWl58SiqpIUl8ObJbqlWRNSGUOE3drumZB
 fJg7609jP9QkX2WHhzXxOPzpaoTVmHOgJlHWFE/WjeCLdCPXCNG16OcWiBtnmdE5Ev0bfmi0ABA
 SC47hyRpHy+TQj/ZC8g==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1d265 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=L19FZshse16xndK5FkAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090055

CCI_IRQ_STATUS_0_I2C_Mx_ERROR aggregates the per-queue overflow and
underflow bits together with NACK_ERR, and all of them were
handled the same way: report -EIO and halt the queue. There was no
way to tell a NACK apart from a FIFO overflow/underflow in the logs.

Decode the individual overflow/underflow bits for each queue and
report them with dev_warn_ratelimited() as such errors are not
expected in normal operation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index e7e2650a05ab125c2ac619c90cb61152cd787165..3ccb5cc90f62b0996acde0b1df568ad4e022907b 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -55,10 +55,18 @@
 #define CCI_IRQ_STATUS_0			0xc0c
 #define CCI_IRQ_STATUS_0_I2C_M0_RD_DONE		BIT(0)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT	BIT(4)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q0_UNDERFLOW	BIT(5)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q0_OVERFLOW	BIT(6)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT	BIT(8)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW	BIT(9)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q1_OVERFLOW	BIT(10)
 #define CCI_IRQ_STATUS_0_I2C_M1_RD_DONE		BIT(12)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT	BIT(16)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q0_UNDERFLOW	BIT(17)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q0_OVERFLOW	BIT(18)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT	BIT(20)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q1_UNDERFLOW	BIT(21)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q1_OVERFLOW	BIT(22)
 #define CCI_IRQ_STATUS_0_RST_DONE_ACK		BIT(24)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK	BIT(25)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK	BIT(26)
@@ -190,22 +198,40 @@ static irqreturn_t cci_isr(int irq, void *dev)
 		writel(reset, cci->base + CCI_RESET_CMD);
 
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_ERROR)) {
+		cci->master[0].status = -EIO;
+
 		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q0_NACK_ERR ||
 			val & CCI_IRQ_STATUS_0_I2C_M0_Q1_NACK_ERR)
 			cci->master[0].status = -ENXIO;
-		else
-			cci->master[0].status = -EIO;
+
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q0_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 0 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q0_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 0 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q1_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 1 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 queue 1 underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M0_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;
 	}
 
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_ERROR)) {
+		cci->master[1].status = -EIO;
+
 		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_NACK_ERR ||
 			val & CCI_IRQ_STATUS_0_I2C_M1_Q1_NACK_ERR)
 			cci->master[1].status = -ENXIO;
-		else
-			cci->master[1].status = -EIO;
+
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 0 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 0 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q1_OVERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 1 overflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q1_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 queue 1 underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;

-- 
2.34.1

