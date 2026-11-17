Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897303;
	b=yMzeEVt5bUYPUK456pGrruIN0EvkF4Y6pDfMUovat/8cvCxVOcP+nUgQEFsspa6/bok2
	 lZo1HSjwurgZzTxBPB3S1uBGcWy0CKORTvQOu/HfliJXaVZWQbi1TmpkT9OoCnm6jq4d6
	 yKtXTTD7jtQMd1/Epq3HQd/IfjYZJZZ826iznOPxumN34Iqj1kqnI3knmDbxoScc4hc15
	 BtRLlH4pxRNT+YCmBHKQIcUvjw81jmteA9+uKZEmtzjKko6flGRT05yksVdIMIWUvu3h9
	 P7rxd7cHMa0SDmLArZ5vgkBvTGj/e2mEdTT2v6Zscs8nrM+/4Kc0eabvGmFodvHOxXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
	b=CIYmDQObm3BmITbPNy9HtS2NPYvW8cMhVFkP8a8yJ77mAAdCguO76eRuc6qt0S8zw84L
	 Zx/EfIaLT30xACz6owH3vSEUwpHxBRisnvQhhLWXZdneWguYSY+I9mqAToGubbUiyqRUp
	 IdhNEey4+8vj25ebQIedqMaNy5v2CV4qN1ykUspAkHLbkJJkAEi4kCb/1nvzW3qStvqPj
	 9wQOwJS8SaIGTrVRUcp9P6DeP8qs6cUsqQu7xGl/kYw3O+wh+oi5acMQNmk5eL+56FFi6
	 vlApUFWRPFnM5XJUW86uQ5FhOIEDznsH5n1o8+2hakUJUfow6xiLtgTNI9CVwqLdlSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWbc13Vm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYGo9fox;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9476606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9476606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWbc13Vm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYGo9fox
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aPHs844320
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=; b=QWbc13VmIdJvnXzA
	bQiATrZcnstmTHHiYR6z7c8SXurnSXQjcNElEVWRw9/7Uqp4h/G+PdHc/tn9gGKi
	KUjKLAxo1ROdxa3AG2rbJobTSiMHXfc5h5Wka5NBVMRC8/O3Vczzr+EBXujAx1so
	srX8GE5AYypBPMwKJSVBjjrOsrjr2WpWTYPlWmwSOWBmlPcqeYvK6Nh3pZMcUhi7
	5pJ3gqRMgt5rKqy+5gYQmvk/j3dBfvjQHiFhU3AljpSjhonuhmcmXdq8tqfoqp/J
	1i8UcjhhwoUkAKgBu2a6pK3lMW2tOhrBigjb5wlnk2not1hmV2X0MFvP+6su3CN6
	Mr+6zQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h14p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:35:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so3580729a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 22:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897301; x=1795502101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=TYGo9foxs3rekmQKGjGedjGlFZcozrLORoc7LRb8zc/shqcygtGkKCjHaktElA2yjC
         a8sXQ1Va83cGWl26Dzjli6kBVyKakIaZhraIjKslQZGv94ru8aVd8fT5FzEFDKZVT4Ck
         /+AV+sQA0L5MqEOG9iv4yBrl9fJjpNwCxZasbE4/99qZUvSNki3MdG3vGIaNOMp/vM7R
         OUQpgRxDH7a9UFBghwNh4gn2oup6RfpNHRo4LFeSA8rfh0gyrZHEHaSmVMtJ6bIvxhrQ
         QW+dpVKzLukOe8biH7fJ6IwVPFTivqQxCbBSs8xDzl/D881OjKpLR/UPInTR9+JZXZbt
         3g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897301; x=1795502101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=E/c7A7+qiSK2I2xyuvQv8B0abwwH+6qxBJ/xPxg58D0EK/tDBcIWzx/D29YmOg4yWl
         2snFmetYNb/7kzDH4mfQ/Z/BYtoBdcC+MIbrz4Q67GdTDUp/Rn4t1K4wdMBvGuazSjqT
         xEBR32X4XIt0bDvPbGfT7xUleh3MOvbjjGRLzVsF02s5TBJBsCPQzGumNEy2DJBukzRq
         NzVY5tl4Yzt8/yRHCycQeKzG2nCISpdN6Y1oT+JyEZMhr/RHGs+I5hXIX3uUhKQK+y4t
         ESKRKvbt+HFoPy/+yPSw+ANR660wwHiz/eS2vZ6ysWX8rH+kXNt8MqxjXAMvKTlBDxC3
         nMwQ==
X-Gm-Message-State: APuU4Z9iltsY0bmenLT5n0NYhz7vDfe1cbX6ctFql1JmQwBDK8xjXJ7N
	yYR1h/fieqZbRl0RuGzlffdT8J4+sevQTPMi9wxTC7FmE8tAYfyzSplqgMWy1sd3OLDbwUAdk+m
	jXSvj4PmXcYajIAlOQipxvO3wzNroCcATsAjoi+80uotZSbAbLIhd3yu7dOcxgwvb/3p/
X-Gm-Gg: AZFdTZfS4JnEcfqTOu2BWpNKYW6iEBdunmuKDzwIBgpdWIFHJi2Q/yGX0fP+ncUubtS
	SuwaVEEGEViQwCifvUpm1qX7nuY8gZ4oWkIl55cwBlTngPMQlAvm4pC2MmXXbwHzmABTgcrAIyS
	ndPOFFPPJsdExSM5sTy7vg6oa1arO1JhV2uPX6pOEkMe2uj4iXrcyQHtZHh+nsSlq18Z0NQVneF
	CkaxyleoGAhXax0czxgRADEqjd4iRUory4ER3KignxQfMsWmlQRyOOCg00kWkJ4NN9aRGAXAbnz
	Yx+VVUD8KsaXnwzVfJq0JcpkvBPmORRUl9Xxss2vt2Oe9Yrx2vq+Ud49mNL+GKxkL/V9Z9lpgSl
	dqCplaOPCBj53WRMFN6TgZOIkdaJPVsmgcLE1FwWiTsFTR10ZZDNnquIWCy8x25Jam2IP6F4hrb
	OSihOID31GE4pzJSbCKvnUJ/Izk3hiJNpt6kbz4n1Dg6SrWcJ1
X-Received: by 2002:a17:90b:4a4e:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3b1b0a32de1mr11270199a91.28.1794897300570;
        Mon, 16 Nov 2026 22:35:00 -0800 (PST)
X-Received: by 2002:a17:90b:4a4e:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3b1b0a32de1mr11270183a91.28.1794897300084;
        Mon, 16 Nov 2026 22:35:00 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:59 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:33 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: eliza-mtp: Enable iris video
 codec
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
Message-Id: <20261117-add_iris_for_eliza-v3-4-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=835;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=OtzEBm9GVTRTWQb4gQMb5Xq+vFscZcbSu2JVYbh2zdI=;
 b=T1+ZDyLe22DDEQKX6BrZVf5duTn/QGSsXWEgvXINf9qJYvlUSBetNpCRe9y7/u1BNyumlFgI8
 6ZxZLWhbyNHBvQMum2SiJuTsqGLezkZy5XyZHA5TU7A4+lVzDbiM+6N
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: oa5dDLkWZje820rqg4BkbdY7f_TlIy1U
X-Proofpoint-ORIG-GUID: oa5dDLkWZje820rqg4BkbdY7f_TlIy1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX4dxDcP3R7Azk
 xamX1dT+JnOouCgOToFW3UHOzZHvp8iHrgoz0yvUlptwAzV/Ap3BbA+m70ireh8F97mvqgsz0k/
 r4nHmvCW8mXL9cPeVTyPgjwRAH65LxJ3nOI7UIPmF+AGREuwB4AQgiSpoSniYyprWYOa3oopv2S
 qJDEFn1uieDn1JIfuR7GGWPkbmLrawODczQhco8y1H/Q4QERdkBt82b/Dn8UvWU0u52Wt4xYPMb
 EUi6QmqxM6M08QyIFwEeGspMhzQMFJaJlGNsglDOOke8xXrtuQdZWcCyMvEENj3JSzzI/Qs1ytN
 mcIiA1ZZuhA84EVgusKPGqAGYsH2jPjSVRIyXRkcmi91WDy6zlx0EilEZV1qs1JvdhxJU9UUiiw
 9WFAo6YMTNLDqFbaD/MTRkiL2gWx6cngENzAyfJGDJu8swAyqDlRW9IaV/O9cEHtJGHv72ntwrz
 EeFUhfPWxdrU9Jquf+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX0ewnyh6LTNIL
 Yi5A5/f+ldx/0QRzrfMvwLr5Mtg7MzNBtXp/CkTMHk1pEEAv7WHEc1n6qrnT9jpARljwp/LHv94
 MlLlRF0Q/+nU3EjwlsPJOqiJqq/7xk4=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afbf595 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nChROllu96siAGe8wIkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170025

The Eliza MTP includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index ee05192adcfb9f79cba59f11001b640a8572cc91..e5a698602dfc7a2d3ad00eade40d4f91a0cee57d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -430,6 +430,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/eliza/gen71700_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.43.0

