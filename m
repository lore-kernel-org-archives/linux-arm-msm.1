Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626546;
	b=Esw5m5oTf+f7yRxszQqe4ebhFlXViB8+wk+FcsmVqvmcz4BfH2z2BNpeub24vIDwqkJi
	 Mo9Q9bRpXhx5gTuGWbIUo7Gny6mycmMOKNSmBalIN2J7VcDO/OpOBhc9nttfnw//8U4lK
	 j4geFFv+0TUyriOfin7VXUBlTwfVkzS2c6YoiW5QJJbptaujkRg6+sBGGqkYZZ9f41yCL
	 MMgEqVf9Z3XF0nElG8v4lTJKQI0rCTanJaKY9mqUPCwp15HlMaTSX7cbEqHvNgECN9vnZ
	 cbP4JGx0nHmW4XCGjMdUV+31zzODAfy0m48KqAeQYFjWbyTqK11asRRw9upmv5AhxPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+kKcL/SGl6027ugBKquTsFw9GFJFnoeEKE5RlG/yYGU=;
	b=KAl7iv63aPqki3Pyma+qCgQ2D3tA0XAJcWMxRTU+nHjzNZHNtKuzWjY7/P9qi9QXwPq2
	 sVAS5altoftzWhori9BTUdmUR9GSJvIyeefdw3qtFKZ1KKMH5nqwSyh1ousnmoGOULM3m
	 nnorrt5pDsgVhb+ml9+O9ZMYhFFHQeMg1zh2LTiJfvtNssVKVTXURp02P25IazRUkjsZd
	 NxCNbD6yibLna8t46kqocvxRq6Q+MuLWUp1JhI2Ia6hx962TzBwPW9qvYc6dhrS4oBWL9
	 cV7ETiLIBtjhn34D7WehBkIGtLi6AKvA9db/fVtTqlBZWqNpEYXDHRQAAJfGDegQE6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CKZbqlVI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ci+Xq3lh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7D360A3801
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E7D360A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CKZbqlVI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ci+Xq3lh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAOFR756986
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+kKcL/SGl60
	27ugBKquTsFw9GFJFnoeEKE5RlG/yYGU=; b=CKZbqlVI/olP+C1SjAtSUQfNqiO
	KUN7qkpys2KZwBQCTNutJ5gX40nBjRaOMIj56MQ7N5ebazW5h5X63CzZXsfJTYmx
	c/GcMBCkfyMEdvihL3qGMIs+0T3sBZE6sNnNxxKwV+LilZW6LzaXymEEfnDyPQfm
	2uXmBvmWFivOQjngkXVNI2JFNFCFCganp5LUiS4iRd4HP/rRWqxNaUQQtB7+CGBS
	6Yy/pxwT4vl/yGzsE6TtJb/hKZTQB4z5PHwAGI88Ic4orclvspnL02AC6miP7xoZ
	GNWLmplJUmX0ZnT9oXGsaCqWFj9bnFhqkkrx/3/xYW4/TjLEh3m2oeVLhIA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1stpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:35:44 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c0bad5ec1cso797519137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626544; x=1794231344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kKcL/SGl6027ugBKquTsFw9GFJFnoeEKE5RlG/yYGU=;
        b=Ci+Xq3lhwc7NlTqvrfwHtuyn9RBkIoYgfPWVYDupaIpKXAvLLXU1zYH5TormzXoKpY
         1GPThkoAxE2/gZX5P/g/m5I9fibghRokX4By88OxGCCTVmfStMp2meMQINqjMkOlk463
         yTEs81DQ+gwEbOI+5ITRoawyHYaPG77hQrTSbw6zpcm/vhmdflZtEjte5mXXBiNsvKmG
         YAtR8si4r3LZyqZp4iLcTdAgQr8Dj4wRVLylOW5MmGLEBCHeQzVBhKzyZHueUONFNfsM
         UDJjbqamFqPJjrmEDoaDh6s9OmtEW4fY2cBUwZkkKKJcTZIvykKzF+zbwLiRbcvrSaFY
         jt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626544; x=1794231344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+kKcL/SGl6027ugBKquTsFw9GFJFnoeEKE5RlG/yYGU=;
        b=m119qXP4IfJjXRBWjO1yMciRit4Rpb4BhCb/48RqA491kV/dixMzE+gFEcBmbGmX9P
         4miDDNMi+wrWzhfcsAIeZFmSgitW5nquqUYcNoOqzIpB60vXECGz8nUiqnY5rG/L7Ywy
         vAM7Usmi73ar1CE8K6LSXU7oPgQnvMeOVns7JumU96vdJGpRngSVqYKSC7fEZKNgLB7l
         FJV8W+4OauXn+wEBDJrUj/GGTeibJYMeDsDJzYdbHQcfxLF4b8eeVIkcVc8Sw6dsXwVy
         V8D0AJgZC6boVa0kFTbx8zqifbHSc850JLoE9fP4dGmJoX0IObxn9LKRNdlAjh/IKlrL
         kokg==
X-Forwarded-Encrypted: i=1; AKwUvBxu/P/GkVlkQay6+rO8s6c4lEj/Yt0XOT0XdJ5jks7iIwpXJFjE+bgcX6NPpvu14+twCm4/NKVNjzLNXM+E@vger.kernel.org
X-Gm-Message-State: APuU4Z+TyYhVZXyiBEWWTvhHuctY45i8na67wnJpH0ai1OOGOBUjH3bF
	LrxfMzq53p9wUNZIKC7nVgHdl5DLuRhfBEinz+gUe4e7tLe/fIXENFVvUoopNxBLOXkcNDf2vAE
	c5Bw9+LrblpdW6H6W6ZtpPAeYFY/7WWi4zCZSzI/BMcT1++ko85VIRKXli1uNLbgXX1XD
X-Gm-Gg: AYBFou0kig93f0lLbBufuT9iOtnPrA+Z9f8ir9pdmDwSuHsuMXdh74Y2uksuma/aUaN
	Z+PdZgjLHw51IGDy4RHyWd/pEoUbuF7dh2gwq3ErGWO0b9xOm7flkh3DXwyG70KPKXApDpr90k/
	tu1m0PlX7vnE9FFx1Y+DQf6R4jgX7ascFPlcDO85bZjFArzOLN3gXfo7kSqR2Qd1i2/hj01lrGy
	zZN8eMOkIcwXseIm9d9xB/Mhz67fMUuhvuPUvZ+0QbUhDs1LKDeVin/oQDzBGvuH0bTeGkMYpxp
	5U236A+BnreKDW/UreW71H4hVCDk5yZrPtdjqYZmzLGBvudNz/2IWJoDyRC2Gjhh6SYlz5R23RL
	UD0wLe2SPT6+H2ZxYXsudMHPdXhzd5LuyEm98IkeRfMoa/2ygD1tyRXNCJjYgXg==
X-Received: by 2002:a05:6102:1481:b0:7a6:85d6:8ae0 with SMTP id ada2fe7eead31-7d0727aa79fmr3912518137.1.1793626543770;
        Mon, 02 Nov 2026 05:35:43 -0800 (PST)
X-Received: by 2002:a05:6102:1481:b0:7a6:85d6:8ae0 with SMTP id ada2fe7eead31-7d0727aa79fmr3912503137.1.1793626543282;
        Mon, 02 Nov 2026 05:35:43 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm25735864f8f.53.2026.11.02.05.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:35:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Chris Lew <chris.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v2 3/3] soc: qcom: smp2p: Fix possible out-of-bounds read with too many inbound entries
Date: Mon,  2 Nov 2026 14:35:34 +0100
Message-ID: <20261102133531.173434-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2967; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JGHmjvxqVCLnaNTJ8V4rzYMgx7betONf24ha/0ULrEE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6JGldf0YXSarv2R6DJiy/HuZHOsc5U8l26bgo
 2yQL6A8D7SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiRpQAKCRDBN2bmhouD
 1xVXD/914HmoaJ/b2T1r6wpQ2AL8E8eMIWGwbQDZmsQzjN7xMnCDnoCGMsBaXEJePekDHosYrk3
 M2yh0pmq6/g+nfP4r2sqThrWOZf37AxvBpVp/98DxcQdGh4cPoCeRRxZxcr/N1QfTz4ezZDHSeg
 44Ivn2EmmYAtdugLEqmYAlVattEB8nfnmHDSK2ArVs02BsRxHGBQsZDXgPDUVIi1BPPVHiQqgtK
 pvnWCWfWbXUc4pigk5jONtD28B2q1EJ1LUcE1GD9EKurwgOirE1FTLfthVBXcwZY785bbdyfjKD
 ukxK5OKhwkoeMaEcwVqXjDFVN7tqCz/sJVfPlO78O9UPjSDG72lxLRh6Cj3D54OTp8vZxHxucnF
 Jogzg2yzvOM5vt2tOmlzaUx/6LJ+3eWAkfA7tZNG6svizCHVDMoibvUtUOrLBUXG+inhMDmaJVo
 8rksl5qiyCxlKUFkhr9gw9IQ+pBPuFk86WAWUywNBSxwWu/TFIrmD5wjONQ2Am5HuQOmT2akqbf
 QX9PrG3/8hANg82gYdanrGnORp3/NraWlGxjE2dYvr+lUMLGTsjhVdTXRQIV55YayD8gIJkbMXT
 XgVozkj0T+19a4pSMLSS53Ra0nJ7LybBNXwOOXjnsG8NwiRdxsJS6iDEgnZhi9oV3JVTkIDlH2k C8WKN9egLmPWRTA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cO9cNHaiZN6sJROoEh2C4mQTmEXwdth3
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae891b0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xix-rBOErL6eV1CkEnYA:9
 a=crWF4MFLhNY0qMRaF8an:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfXxsjIUPmr/Tzs
 FJbb0HygCSdvGMLppDvdXg8aioBkxfX/dL0gRq8xgp0hTmuIVjsYGM7AHiTnH3UCUpyHMhBJDvW
 PicfKINtPr1/6AOZV0QKxN73Rxcm4HHfWBDjDFyyZ76rE9YLVWiBOAolmTTvVsD9TetCOWGF+YF
 0ijL3LqfGjNoP7f4CBjsMRF1O/lxX6mNiupvcT4wGbQeF1+1F5qvQHQXhpyEIZDdOuQkVlSL+qq
 ylCeTUdrITSqP3VxONKt/g2r0bBNpQEPoJOaHaEYQJIDqrPV08869KiOoZyXKINDn7eWGMjmuJ5
 Z+HAqnVdzLZXFCLrHq3cyFN6Qs0wVerCBfBbqY2C+ylYKQ5OTKPWeXyBc68XPMRW/V2U06ZwowP
 T0TYztWuLnjC/1L/vho4bd0grUrvzQ6r9jSMARkQV1sFXYnK96aybotfN24YaGimMEyhkhKaV3R
 froD+8k1BpiFC40PDuw==
X-Proofpoint-GUID: cO9cNHaiZN6sJROoEh2C4mQTmEXwdth3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX6NppRCtT+24l
 XRlIi7/vIhCRazp2zDTUx3u6LJljWsf6jNaRECATrhMSVAg1LYgfBdJaMk6tOswXf0ShIafHY0k
 EGgSyYPmVkI7LErFaHL/qat2dKFEMMM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

The inbound SMEM item is populated by the remote processor, so its
contents, including number of entries, should be validated by the
kernel.  Number of inbound entries is directly used when iterating over
inbound data structure, so if it is higher than actual count of elements
in the data, kernel would read memory out-of-bounds.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-b79427c9-5d22-4b48-8ee7-1d7808101e52
Fixes: 8a9a7b9d14c2 ("soc: qcom: smp2p: Add irqchip state support")
Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None
---
 drivers/soc/qcom/smp2p.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 49fb738d02a9..9af5004620ff 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -252,6 +252,21 @@ static int qcom_smp2p_in_version(struct qcom_smp2p *smp2p)
 	return in->version;
 }
 
+static unsigned int qcom_smp2p_in_valid_entries(struct qcom_smp2p *smp2p)
+{
+	unsigned int valid_entries = smp2p->in->valid_entries;
+
+	/* Remote side controls the value, so do not trust it */
+	if (valid_entries > SMP2P_MAX_ENTRY) {
+		dev_err_ratelimited(smp2p->dev,
+				    "too many inbound entries: %u\n",
+				    valid_entries);
+		return SMP2P_MAX_ENTRY;
+	}
+
+	return valid_entries;
+}
+
 static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
 {
 	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
@@ -259,6 +274,7 @@ static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
 	char buf[SMP2P_MAX_ENTRY_NAME];
 	struct smp2p_smem_item *in;
 	struct smp2p_entry *entry;
+	unsigned int valid_entries;
 	size_t size;
 	int i;
 
@@ -272,7 +288,8 @@ static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
 	if (in->version == 0)
 		return;
 
-	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
+	valid_entries = qcom_smp2p_in_valid_entries(smp2p);
+	for (i = smp2p->valid_entries; i < valid_entries; i++) {
 		list_for_each_entry(entry, &smp2p->inbound, node) {
 			memcpy(buf, in->entries[i].name, sizeof(buf));
 			if (!strcmp(buf, entry->name)) {
@@ -292,13 +309,15 @@ static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
 	int irq_pin;
 	u32 status;
 	char buf[SMP2P_MAX_ENTRY_NAME];
+	unsigned int valid_entries;
 	u32 val;
 	int i;
 
 	in = smp2p->in;
 
 	/* Match newly created entries */
-	for (i = smp2p->valid_entries; i < in->valid_entries; i++) {
+	valid_entries = qcom_smp2p_in_valid_entries(smp2p);
+	for (i = smp2p->valid_entries; i < valid_entries; i++) {
 		list_for_each_entry(entry, &smp2p->inbound, node) {
 			memcpy(buf, in->entries[i].name, sizeof(buf));
 			if (!strcmp(buf, entry->name)) {
-- 
2.53.0

