Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233004;
	b=xNQrAC7UF5zm3cM2j9hnGwUqSsrDj2BEfGESsSzF339oGwFcyPVwP0DUb8HK5Sr6FT36
	 TSwGSgST2jB//1lda0/hWfy+BG77QNNCIsa0Rg3T6mD/mfXN0ygFpLKW+i75MXt8tRseU
	 YcCtIpyAyYFlZyIabCZVF4OvDaxMENFh/S/N3Ehn98csx0+Au6CeRcD+Zv04YyXWb+r4k
	 zapU6OjEeipf/POUkrZwXTcOc/4TGZ3mRhyS9YUx8p0+bJS4MX5HfIR2K6aRCSstTpwj+
	 W1/QEUfGJqc4caT1bJbdutR3HOIzQydvUmJgSFWaQJzZNEbdRvEPKN1IzgXvMZuY/og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233004;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PrVp+K/tFEuf9iJ99Gnzsx1IjRK1SVHkagaubIClMPo=;
	b=vuddRN9Ctf5y/hl6Nob+FvnqTPP+viG+NEgsl7ezlYAzXWV0JTe2Es7js0ASFkLt3+td
	 iFj83jpXimw3Z2ZaJIzU0OYwRdC+9Am1nrgTY4970Ds7udM7TYKGfDBz14rl/NMSEJGn3
	 TVys0hGFrOD+1q89EuTwNJ8xHqTaGEy2pavMIXaJ0y04Zc3lYMoHjfoUTzIunodNxSg7o
	 POtUtLnQJmGkZPwqZdpv3WfU7R0vGgxVVQFK3mhr3luyqbD9hEc1A3dzIfcI4CPWNa2pP
	 qNeORIizHM5v9eHBuLPNS697PVPj8zlW82oH/o6PpDSVXZvIlIrOj369hxSVGCwEDQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RIWR7qCD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=afyX46RM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015A2606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 015A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RIWR7qCD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=afyX46RM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEraj336350
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrVp+K/tFEuf9iJ99Gnzsx1IjRK1SVHkagaubIClMPo=; b=RIWR7qCD4J9UKU+I
	wgZvTOb4k8q16s19UJUTI0trJrDKVyB+uksWSr3uUAcV2LY39KbYK0dl1CvtVHZT
	BpluA8mj3Qp5BuNncxXXiNti9gPyNXGU6Zdpu8g8ejxDgsZJdEwBt8jzIrHl2APk
	3Yhth2OUgcjoAF2SBxQfd314V46OS8aL836RIkoJQnXFfXaIuUzJRKOb/LMmvaKn
	9q9+sK2+hNaNhu6X/gSPrVZJJIUPxgnVz2jNXOQzsOo3j6sSZvyh9UAQ7fQajaeU
	qU8RU9JOidOdSy++U7isH1osvvbWLVW/K8lIx5klcC8SHfl67Wu6LmRViH/n4tOO
	mI8oPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rkuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:03:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-945c60b470dso137388585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233002; x=1794837802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrVp+K/tFEuf9iJ99Gnzsx1IjRK1SVHkagaubIClMPo=;
        b=afyX46RMOy1bcsZVPDbaWTSl0alLnB7L1ygbwrPedBfqU6pmuW1o2l3KjGys4KcE17
         SmOh9OXTGQxsbzQACZ1dQN6A9hBgGZFZHHmmjfU2m6VvM9uyvVxYjEPru2t7D9R+p2un
         my4M+Q1u959HQtoceipbCNJ6zXRAKDARplhsaLtI593zLtaTi7Qumv5ZIxxXZumUTmX1
         QwLlRdYc8Iuf5+8lNZUWdgXaM9t3Ox5TPqbDWajnmrQ63LFqkf27U31tjmjWDT+D80Bn
         jG3HxFVH7QM6jt6+h9FMz3llSKyAWg27HwLOI9b2pgkxAZinlBA41p4FvIVLqQEGAAX7
         oS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233002; x=1794837802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrVp+K/tFEuf9iJ99Gnzsx1IjRK1SVHkagaubIClMPo=;
        b=muF+RF1inD9DXJwtWzL+X4VMfbaebwZmE0QK1cTZNPv9INLEBu6+w15GPGsSL298gc
         CjqQX/QeHIwb8a/MCOS7d9rVn7z5H3MdBspMyNvW+T/KsOIC3fgN/1zWHFF5ASOtyno8
         xjQXKX3KnMAW6qJvn0UQH1VOO2y5ZlbQdexec5vjGYIQCppMy/A6ps5OVg7CuMAg6AlV
         6xzkDdjMtscv3Kuvtqyxwc3/cd3CjjstSerDb/K7kmOrPfJveApawMrb7lg1TC6BnbVc
         7efhV9pyVJBoWM1ek0q1EMulwgaYETnRB3h3jlzgKmpwmZjnnCqhQZ4ExIMibiY5NrJb
         D/lw==
X-Forwarded-Encrypted: i=1; AL+hErHrw6d+OdN80MuRudrR2rEt3MaYCxQ6hbnxJPcA3Z4O0/u4IsHYfCAvOYU3e8bN/hm1JD3UpnGRLwbiPwKg@vger.kernel.org
X-Gm-Message-State: APuU4Z8AT75zHGMQcMj7GIsmX+SNx6it8plfR1nSm1Tfjy3yRcG2I1v4
	7Uweyo5jm1wK68zwUtAcbcocFJcTWeqYOCh8cs1ruCgvXDXwxTD7VW+oCzVFmrnkyWtODZHoG8a
	6NEULQYRMC6xc2Y1d8Pvn7MmEOW5AXBF+MzsQ+nQw3OEODgnn3T2Vte9mNqfU0e/V9xSWwMnO4T
	qcotw=
X-Gm-Gg: AYBFou2UTFH1SgKt+uWbSudOVENI69qVAWRrVb6Pjf4QQj7OHQaMvzUuQrjs4kzsee7
	bhVKIA4Jgdf6RJjrtZAGQcKOAYBeJ0oUovI4vRsdapfKh0y03xr91zOhxWP8o/5iozWt8GEGmvX
	xtvsJneSd52R8BzJr5qARYnd9S7BVLachmvaEjVm/+v8+d8y6kBTEjtCa56WfKviYItzk14Ge6d
	LT92XdIQgLGTdnbhD45Zm+TDvAXNAPoatCyKgu5WLO70Oy5hNzk/THbHFcIyRrfvRGD13A4R8b/
	WUyhBddZjRX04Gpbw4oNHwK49zO2U7ifQCy8RmT/+wgSi6bFWfea3og1smwM2T3fRv2e7m7lRRb
	LcswMb5sXZs4nyeMV+YxB6lbBLiEm1txFEZuGuFzhlZaFoSKSBrky0n6yqwKfZ1OL3k53cc29jP
	RAuCa5McSekGZjn3PHPISTDpBXlPMoXIswYbp2sNgaWSR6eCJr1uaV6K1wNI7WaCXBKX+EyGvGA
	s+CH3vCgOaiKUlF25sslpjJAnlT
X-Received: by 2002:a05:620a:1786:b0:93b:d79a:c45f with SMTP id af79cd13be357-947848d1367mr650489985a.55.1794233002140;
        Mon, 09 Nov 2026 06:03:22 -0800 (PST)
X-Received: by 2002:a05:6122:e266:b0:5ea:e7aa:acb9 with SMTP id 71dfb90a1353d-5ece720b077mr1148155e0c.6.1794232965445;
        Mon, 09 Nov 2026 06:02:45 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f9b5:154f:6aa3:35d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm161515845e9.4.2026.11.09.06.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:02:44 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 15:01:57 +0100
Subject: [PATCH v4 4/7] i2c: qcom-cci: Add burst write support
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
Message-Id: <20261109-cci-imp-v4-4-4dc4095dd052@oss.qualcomm.com>
References: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
In-Reply-To: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX+KEEdTMhuZ5a
 eiMcEGKBOfJ7MFdj3pOdzl9Dv48B1MghocMT4mKxDzDpn/UYRe7kEHunNfzDGBmkTbGcpTqqt2j
 /qe9PL5OGz3glZf01Ba75YEFX5Hgsok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfXx1c7euaiDCMd
 pABAO/SxvVbGqcWi4TKzLWZWYzu2tLCZSlnrXR82YYDB5KaNyuQd+l9AdfwdBwcFIrSVXTpMqn3
 jtqNwT2iiSrOgbiSJW/JkMgTOaKymwYQNGW/lT7dhgGML9Qkq91L4fczNjT2Inrpn6WXgI821Zz
 m2GzuYIi0qIqk6PM4ASyM6nreEGv79dQOVTU8ZMBPGmmkfktAV9ojWmBXtX7pIAigtOUwdXps1z
 rgM0d65Gep5JFcgJMmt1nprsi2TMAkACO8ax8+QT5XVfRGk6p/S+J4p6nkrEjjya9mCPDr0+0sN
 M7xCxCwLwrZtywJVVimGWQGMSHB2ihRC9lz+oHf9j6Rucls6w8rOqF71QpHuxNuanB4UTQijSqz
 UaWoFKtEzPNzkxW2c/E53BBYM+J6s/sduFwmK7kWH6yfnXSfK7V1jvb7uQeWlTryJXyekCazh7t
 zcKinTeY2jAbagH4aqg==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1d2ab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Yp3SuMTfTe4RQKdpiVsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -n7jKEpN6AOLyJMoSPW5yD89cr_rKDdz
X-Proofpoint-GUID: -n7jKEpN6AOLyJMoSPW5yD89cr_rKDdz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090055

A single CCI_I2C_WRITE command can only carry up to 11 bytes,
so every i2c write was capped at that size via i2c max_write
quirk.

CCI v1.2 introduces burst mode support, where consecutive
write commands (marked as burst) run back-to-back as a single
transfer.

Use this in cci_i2c_write() to allow longer writes across the
whole queue instead of a single command's payload, and raise
max_write_len accordingly for every CCI revision that supports
burst mode.

unlock/lock commands are required to ensure the commands for
a given transfer are executed atomically.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 48dabd923b690864eccc29d232847c80f3c3b46c..a698130f4712492847336e401c0789b1a64dd02e 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -87,14 +87,24 @@
 #define NUM_QUEUES	2
 
 #define CCI_I2C_SET_PARAM	1
+#define CCI_I2C_LOCK		6
+#define CCI_I2C_UNLOCK		7
 #define CCI_I2C_REPORT		8
 #define CCI_I2C_WRITE		9
 #define CCI_I2C_READ		10
 
+#define CCI_I2C_REPORT_IRQ_EN	BIT(8)
+
 #define CCI_I2C_WRITE_WC	3
+#define CCI_I2C_WRITE_MAX_LEN	(CCI_I2C_WRITE_WC * sizeof(u32) - 1)
 #define CCI_I2C_WRITE_NWORDS(len) DIV_ROUND_UP((len) + 1, sizeof(u32))
+#define CCI_I2C_WRITE_BURST	0xf
+#define CCI_I2C_BURST_OVERHEAD	4 /* LOCK + SET_PARAM + UNLOCK + REPORT */
 
-#define CCI_I2C_REPORT_IRQ_EN	BIT(8)
+/* Largest write that can be bursted through a queue of @qsize words */
+#define CCI_I2C_BURST_MAX_LEN(qsize)					\
+	(((qsize) - CCI_I2C_BURST_OVERHEAD) / CCI_I2C_WRITE_WC *	\
+	 CCI_I2C_WRITE_MAX_LEN)
 
 enum {
 	I2C_MODE_STANDARD,
@@ -516,11 +526,11 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	return 0;
 }
 
-static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
+static void cci_i2c_load_write(void __iomem *loadq, u8 *buf, u16 len, bool burst)
 {
 	u32 cmd[CCI_I2C_WRITE_WC] = { };
 
-	cmd[0] = CCI_I2C_WRITE | len << 4;
+	cmd[0] = CCI_I2C_WRITE | (burst ? CCI_I2C_WRITE_BURST : len) << 4;
 	memcpy((u8 *)cmd + 1, buf, len);
 	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
 }
@@ -529,6 +539,7 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 			 u16 addr, u8 *buf, u16 len)
 {
 	void __iomem *loadq = cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, QUEUE_0);
+	bool burst = len > CCI_I2C_WRITE_MAX_LEN;
 	int ret;
 	u32 val;
 
@@ -546,10 +557,22 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 	if (ret < 0)
 		return ret;
 
+	if (burst)
+		writel(CCI_I2C_LOCK, loadq);
+
 	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
 	writel(val, loadq);
 
-	cci_i2c_load_write(buf, len, loadq);
+	do {
+		u16 to_write = min_t(u16, len, CCI_I2C_WRITE_MAX_LEN);
+
+		len -= to_write;
+		cci_i2c_load_write(loadq, buf, to_write, len > 0);
+		buf += to_write;
+	} while (len);
+
+	if (burst)
+		writel(CCI_I2C_UNLOCK, loadq);
 
 	val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
 	writel(val, loadq);
@@ -719,7 +742,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 64, 16 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(64),
 			.max_read_len = 12,
 		},
 	},
@@ -728,7 +751,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -737,7 +760,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -746,7 +769,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 1024, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(1024),
 			.max_read_len = 12,
 		},
 	},

-- 
2.34.1

